#!/usr/bin/env python3
import rospy
from threading import Thread, Lock
from sensor_msgs.msg import JointState
from ambf_walker.msg import DesiredJoints
import numpy as np
from std_msgs.msg import Float32MultiArray
from . import DynController
from ambf_walker.srv import DesiredJointsCmd, DesiredJointsCmdResponse
from controller_modules.srv import JointControl, JointControlRequest
from trajectory_msgs.msg import JointTrajectoryPoint
from std_srvs.srv import SetBool, SetBoolResponse

class HumanControllerServer(object):

    def __init__(self, model):

        self.lock = Lock()
        self._model = model
        self._updater = Thread(target=self.set_torque)
        self.sub_set_points = rospy.Subscriber(self.model.model_name + "_set_points", DesiredJoints, self.update_set_point)
        self._enable_control_srv = rospy.Service(self.model.model_name+ '_controller_onoff', SetBool, self.enable_control_srv)
        self.tau_pub = rospy.Publisher(self.model.model_name + "_joint_torque", JointState, queue_size=1)
        self.traj_pub = rospy.Publisher(self.model.model_name + "_trajectory", Float32MultiArray, queue_size=1)
        self.error_pub = rospy.Publisher(self.model.model_name + "_Error", Float32MultiArray, queue_size=1)
        self.required_tau_pub = rospy.Publisher("required_human_tau", JointState, queue_size=1)
        self.controller_srv = rospy.ServiceProxy('CalcTau', JointControl)
        self.service = rospy.Service(self.model.model_name + '_joint_cmd', DesiredJointsCmd, self.joint_cmd_server)
        self._enable_control = False
        self.ctrl_list = []
        self.msg = None
        self.q = np.array([])
        self.qd = np.array([])
        self.qdd = np.array([])
        self.other = np.array([])


    @property
    def model(self):
        return self._model

    @model.setter
    def model(self, value):
        self._model = value

    def update_set_point(self, msg):
        """

        :type msg: DesiredJoints
        """
        self.msg = msg
        # self.controller = self._controllers[msg.controller]
        # self.q = np.array(msg.q)
        # self.qd = np.array(msg.qd)
        # self.qdd = np.array(msg.qdd)
        # self.other = np.array(msg.other)
        if not self._enable_control:
            self._updater.start()
        return True



    def enable_control_srv(self, msg):
        if msg.data:
            self._enable_control = True
            return SetBoolResponse(True, "Turned on " + self.model_name + " Controller")
        else:
            self._enable_control = False
            return SetBoolResponse(True, "Turned off " + self.model_name +  " Controller" )

    def joint_cmd_server(self, msg):
        with self.lock:
            self.msg = msg

        if not self._enable_control:
            self._updater.start()
        return DesiredJointsCmdResponse(True)

    def set_torque(self):
        self._enable_control = True
        rate = rospy.Rate(500)
        tau_msg = JointState()
        traj_msg = Float32MultiArray()
        error_msg = Float32MultiArray()
        t = 0
        dt = 1.0/500
        while 1:

            t +=dt
            local_msg = self.msg

            self.traj_pub.publish(traj_msg)
            rospy.wait_for_service('CalcTau')
            msg = JointControlRequest()
            msg.controller_name = "FES"
            traj_msg.data = local_msg.q
            msg.actual.positions = np.rad2deg(self._model.q)

            msg.actual.velocities = np.rad2deg(self._model.qd)
            msg.desired.positions =  np.rad2deg(local_msg.q)
            msg.desired.velocities = np.rad2deg(local_msg.qd)

            #msg.desired.accelerations = np.array(local_msg.qdd)
            # try:
            #     resp1 = self.controller_srv(msg)
            #     tau = resp1.control_output.effort
            #     tau_msg.effort = tau
            #     self.tau_pub.publish(tau_msg)
            # except rospy.ServiceException as e:
            #     print("Service call failed: %s"%e)

            # msg = JointControlRequest()
            msg.controller_name = "HumanPD"
            msg.desired.positions = self._model.ambf_to_rbdl(np.array(local_msg.q) )
            msg.desired.velocities = self._model.ambf_to_rbdl(np.array(local_msg.qd))
            msg.desired.accelerations = self._model.ambf_to_rbdl(np.array(local_msg.qdd))
            msg.actual.positions = self._model.ambf_to_rbdl(self._model.q)
            msg.actual.velocities = self._model.ambf_to_rbdl(self._model.qd)

            # error_msg.data = abs((msg.desired.positions - msg.actual.positions)/msg.desired.positions)
            # self.error_pub.publish(error_msg)
            #
            # try:
            #     resp1 = self.controller_srv(msg)
            #     tau = resp1.control_output.effort
            #     tau_msg.effort = np.array(tau)
            #     #self.required_tau_pub.publish(tau_msg)
            #     self.tau_pub.publish(tau_msg)
            # except rospy.ServiceException as e:
            #     print("Service call failed: %s"%e)


            try:
                resp1 = self.controller_srv(msg)
                tau = resp1.control_output.effort
                t +=dt
                tau_msg.effort = np.array(tau) # np.abs(np.sin(0.5*t))*
                #self.required_tau_pub.publish(tau_msg)
                self.tau_pub.publish(tau_msg)
            except rospy.ServiceException as e:
                print("Service call failed: %s"%e)


            rate.sleep()



