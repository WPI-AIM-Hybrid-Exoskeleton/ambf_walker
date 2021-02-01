"""
This should be moved to a separate repo later
"""
#!/usr/bin/env python3
import abc
import numpy as np
import rbdl
import Model
import time
import message_filters
from GaitCore.Core import Point
from GaitCore.Core import utilities
from std_msgs.msg import Float32MultiArray
from threading import Thread
from . import ModelServer
from GaitCore.Bio import Leg, Joint
import rospy
from ambf_msgs.msg import RigidBodyState, SensorState
from GaitAnaylsisToolkit.LearningTools.Runner import TPGMMRunner
from geometry_msgs.msg import Point32
from sensor_msgs.msg import PointCloud
from os.path import dirname, join
from rbdl_server.srv import RBDLInverseDynamics


class ExoskeletonServer(ModelServer.ModelServer):

    def __init__(self, client, model_name, joints, model_path):
        
        super(ExoskeletonServer, self).__init__(client, model_name=model_name, joint_names=joints, model_path=model_path)
        self._handle = self._client.get_obj_handle('ExoHip')
        # Update to current
        self.prox = {}
        self.prox["LeftSideProx"] = rospy.Publisher('left_leg', PointCloud, queue_size=10)
        self.prox["RightSideProx"] = rospy.Publisher('right_leg', PointCloud, queue_size=10)
        time.sleep(4)
        # model_path = file_path  #"/home/nathaniel/catkin_ws/src/ambf_walker/ambf_models/lumped/lumped.yaml"
        # self.make_dynamic_model(model_name, model_path )
        left_joints = {}
        right_joints = {}

        for joint in (left_joints, right_joints):
            for output in ["Hip", "Knee", "Ankle"]:
                angle = Point.Point(0, 0, 0)
                force = Point.Point(0, 0, 0)
                moment = Point.Point(0, 0, 0)
                power = Point.Point(0, 0, 0)
                joint[output] = Joint.Joint(angle, moment, power, force)

        self._left_leg = Leg.Leg(left_joints["Hip"], left_joints["Knee"], left_joints["Ankle"])
        self._right_leg = Leg.Leg(right_joints["Hip"], right_joints["Knee"], right_joints["Ankle"])

        self._state = (self._q, self._qd)
        
        rospy.Subscriber("/ambf/env/LeftSideProx/State", SensorState, self.prox_callback)
        rospy.Subscriber("/ambf/env/RightSideProx/State", SensorState, self.prox_callback)

        rospy.Subscriber("/ambf/env/LeftFootProx/State", SensorState, self.left_foot_prox_callback)
        rospy.Subscriber("/ambf/env/RightFootProx/State", SensorState, self.right_foot_prox_callback)

        self._left_thigh_sensorF_sub = message_filters.Subscriber("/ambf/env/FrontSensorLeftThigh/State", RigidBodyState)
        self._left_thigh_sensorB_sub = message_filters.Subscriber("/ambf/env/BackSensorLeftThigh/State", RigidBodyState)
        self._left_shank_sensorF_sub = message_filters.Subscriber("/ambf/env/FrontSensorLeftShank/State", RigidBodyState)
        self._left_shank_sensorB_sub = message_filters.Subscriber("/ambf/env/BackSensorLeftShank/State", RigidBodyState)
        self._right_thigh_sensorF_sub = message_filters.Subscriber("/ambf/env/FrontSensorRightThigh/State", RigidBodyState)
        self._right_thigh_sensorB_sub = message_filters.Subscriber("/ambf/env/BackSensorRightThigh/State", RigidBodyState)
        self._right_shank_sensorF_sub = message_filters.Subscriber("/ambf/env/FrontSensorRightShank/State", RigidBodyState)
        self._right_shank_sensorB_sub = message_filters.Subscriber("/ambf/env/BackSensorRightShank/State", RigidBodyState)
        self._leg_sensor_ls = [self._left_thigh_sensorF_sub, self._left_thigh_sensorB_sub,
                               self._left_shank_sensorF_sub, self._left_shank_sensorB_sub,
                               self._right_thigh_sensorF_sub, self._right_thigh_sensorB_sub,
                               self._right_shank_sensorF_sub, self._right_shank_sensorB_sub]
        self._leg_sensor_cb = message_filters.TimeSynchronizer(self._leg_sensor_ls, 1)
        self._leg_sensor_cb.registerCallback(self.leg_sensor_callback)

        self._left_foot_force_sensor = []
        self._right_foot_force_sensor = []

        self._left_foot_force_sensor.append(Point.Point(0, 0, 0))
        self._left_foot_force_sensor.append(Point.Point(0, 0, 0))
        self._left_foot_force_sensor.append(Point.Point(0, 0, 0))

        self._right_foot_force_sensor.append(Point.Point(0, 0, 0))
        self._right_foot_force_sensor.append(Point.Point(0, 0, 0))
        self._right_foot_force_sensor.append(Point.Point(0, 0, 0))

        self._left_foot_sensor1_sub = message_filters.Subscriber("/ambf/env/SensorLeftFoot1Tab/State", RigidBodyState)
        self._left_foot_sensor2_sub = message_filters.Subscriber("/ambf/env/SensorLeftFoot2Tab/State", RigidBodyState)
        self._left_foot_sensor3_sub = message_filters.Subscriber("/ambf/env/SensorLeftFoot3Tab/State", RigidBodyState)
        self._right_foot_sensor1_sub = message_filters.Subscriber("/ambf/env/SensorRightFoot1Tab/State", RigidBodyState)
        self._right_foot_sensor2_sub = message_filters.Subscriber("/ambf/env/SensorRightFoot2Tab/State", RigidBodyState)
        self._right_foot_sensor3_sub = message_filters.Subscriber("/ambf/env/SensorRightFoot3Tab/State", RigidBodyState)
        self._foot_sensor_ls = [self._left_foot_sensor1_sub, self._left_foot_sensor2_sub, self._left_foot_sensor3_sub,
                                self._right_foot_sensor1_sub, self._right_foot_sensor2_sub, self._right_foot_sensor3_sub]
        self._foot_sensor_cb = message_filters.TimeSynchronizer(self._foot_sensor_ls, 1)
        self._foot_sensor_cb.registerCallback(self.foot_sensor_callback)
        self._right_foot_prox = SensorState()
        self._left_foot_prox = SensorState()
        self._updater.start()

    def left_foot_prox_callback(self, msg):
        self._left_foot_prox = msg

    def right_foot_prox_callback(self, msg):
        self._right_foot_prox = msg

    def check_left_foot_collision(self):
        return any(self._left_foot_prox.triggered)

    def check_foot_collision(self):
        return any(self._left_foot_prox.triggered)

    def get_right_foot_collision_distance(self):
        dist = self._left_foot_prox.measurement
        raduis = self._left_foot_prox.range[0]
        return dist[0] - raduis

    def get_left_foot_collision_distance(self):
        dist = self._right_foot_prox.measurement
        raduis = self._right_foot_prox.range[0]
        return dist[0] - raduis

    def prox_callback(self, msg):

        pos = msg.pose
        name = msg.name.data
        ranges = msg.measurement
        raduis = msg.range[0]
        parent_name = msg.parent_name
        sensed_objects = msg.sensed_objects
        theta = np.linspace(-np.pi, -0.70 * np.pi, 75)
        cloud = PointCloud()
        for rad, angle, obj in zip(ranges, theta, sensed_objects):
            point = Point32()
            if "Rob" in obj.data:
                r = 0
            else:
                r = rad
            point.y = (raduis - r) * np.cos(angle) + pos.position.y
            point.z =  (raduis - r) * np.sin(angle) + pos.position.z
            point.x =  pos.position.x
            cloud.points.append(point)

        cloud.header.stamp = rospy.Time.now()
        cloud.header.frame_id = "/exoskeleton"
        self.prox[name].publish(cloud)

    def leg_sensor_callback(self, flt, blt, fls, bls, frt, brt, frs, brs):
        force_flt = Point.Point(flt.wrench.force.x, flt.wrench.force.y, flt.wrench.force.z)
        force_blt = Point.Point(blt.wrench.force.x, blt.wrench.force.y, blt.wrench.force.z)
        force_fls = Point.Point(fls.wrench.force.x, fls.wrench.force.y, fls.wrench.force.z)
        force_bls = Point.Point(bls.wrench.force.x, bls.wrench.force.y, bls.wrench.force.z)
        force_frt = Point.Point(frt.wrench.force.x, frt.wrench.force.y, frt.wrench.force.z)
        force_brt = Point.Point(brt.wrench.force.x, brt.wrench.force.y, brt.wrench.force.z)
        force_frs = Point.Point(frs.wrench.force.x, frs.wrench.force.y, frs.wrench.force.z)
        force_brs = Point.Point(brs.wrench.force.x, brs.wrench.force.y, brs.wrench.force.z)

        self._left_leg.hip.force = force_flt
        self._left_leg.knee.force = force_fls
        self._right_leg.hip.force = force_frt
        self._right_leg.knee.force = force_frs

    def foot_sensor_callback(self, lf1, lf2, lf3, rf1, rf2, rf3):
        force_lf1 = Point.Point(lf1.wrench.force.x, lf1.wrench.force.y, lf1.wrench.force.z)
        force_lf2 = Point.Point(lf2.wrench.force.x, lf2.wrench.force.y, lf2.wrench.force.z)
        force_lf3 = Point.Point(lf3.wrench.force.x, lf3.wrench.force.y, lf3.wrench.force.z)
        force_rf1 = Point.Point(rf1.wrench.force.x, rf1.wrench.force.y, rf1.wrench.force.z)
        force_rf2 = Point.Point(rf2.wrench.force.x, rf2.wrench.force.y, rf2.wrench.force.z)
        force_rf3 = Point.Point(rf3.wrench.force.x, rf3.wrench.force.y, rf3.wrench.force.z)

        self.left_foot_force_sensor = [force_lf1, force_lf2, force_lf3]
        self.right_foot_force_sensor = [force_rf1, force_rf2, force_rf3]


    def stance_trajectory(self, tf=2, dt=0.01):
        hip = ModelServer.get_traj(0.0, -0.5, 0.0, 0.0, tf, dt)
        knee = ModelServer.get_traj(0.0, 0.50, 0.0, 0., tf, dt)
        ankle = ModelServer.get_traj(-0.349, -0.2, 0.0, 0.0, tf, dt)
        return hip, knee, ankle

    def walk_init_trajectory(self, tf=2, dt=0.01):
        hip = ModelServer.get_traj(0.0, 0.3234, 0.0, 0.0, tf, dt)
        knee = ModelServer.get_traj(0.0, 0.815, 0.0, 0., tf, dt)
        ankle = ModelServer.get_traj(-0.349, 0.07, 0.0, 0.0, tf, dt)
        return hip, knee, ankle

    def get_runner(self):
        project_root = dirname(dirname(__file__))
        config_path = join(project_root, 'config/gotozero.pickle')
        return TPGMMRunner.TPGMMRunner(config_path)

    def get_walker(self):
        project_root = dirname(dirname(__file__))
        config_path = join(project_root, 'config/walk2.pickle')
        return TPGMMRunner.TPGMMRunner(config_path)


    @property
    def left_foot_force_sensor(self):
        return self._left_foot_force_sensor

    @property
    def right_foot_force_sensor(self):
        return self._right_foot_force_sensor

    @left_foot_force_sensor.setter
    def left_foot_force_sensor(self, value):
        self._left_foot_force_sensor = value

    @right_foot_force_sensor.setter
    def right_foot_force_sensor(self, value):
        self._right_foot_force_sensor = value

    def get_foot_sensors(self):
        left_foot_sensors = [self._left_foot_sensor1, self._left_foot_sensor2, self._left_foot_sensor3]
        right_foot_sensors = [self._right_foot_sensor1, self._right_foot_sensor2, self._right_foot_sensor3]
        return left_foot_sensors, right_foot_sensors
    
    
    
    
    # def ambf_to_rbdl(self, q):
    #     """
    #     make the order of the joints for the dynamics
    #     """

    #     names = self._joints_names
    #     joints_aligned = [0.0]*len(names)
    #     q_new = [0.0]*len(names)

    #     for ii, name in enumerate(names):
    #         index = self._joint_map[name] - 1
    #         joints_aligned[index] = q[ii]

    #     return joints_aligned

    # def rbdl_to_ambf(self, q):
    #     """
    #     reverse the order of the AMBF
    #     """
        
    #     names = self._joints_names
    #     q_new = [0.0]*len(names)

    #     for ii, name in enumerate(names):
    #         index = self._joint_map[name] - 1
    #         q_new[ii] = q[index]

    #     return q_new


    def leg_inverse_kinimatics(self, toe, hip_location):

        l1 = 436.0
        l2 = 390.0
        l3 = 98.0
        l4 = 217.0

        x = toe[0] - hip_location[0] - abs(l4)
        y = toe[1] - hip_location[1] + abs(l3)

        num = x*x + y*y - l1**2 - l2**2
        dem = 2*l1*l2

        q2 = np.arctan2(-np.sqrt(1 - (num / dem)**2), (num / dem))
        q2 = np.nan_to_num(q2)
        q1 = -(np.nan_to_num(np.arctan2(y, x) - np.arctan2(l2*np.sin(q2), l1 + l2*np.cos(q2))) + 0.5*np.pi)
        q3 = -(np.nan_to_num(2*np.pi - q1 - q2) - 2*np.pi) + 0.75*np.pi

        return [q1, -q2, q3]

