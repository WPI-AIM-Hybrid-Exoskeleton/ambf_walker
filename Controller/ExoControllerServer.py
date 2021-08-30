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
from rbdl_server.srv import RBDLInverseDynamics
from std_srvs.srv import SetBool, SetBoolResponse



class ExoControllerServer():

    def __init__(self, model, use_gravity=False):
        self.lock = Lock()
        self._model = model
        self._updater = Thread(target=self.set_torque)
        self.sub_set_points = rospy.Subscriber(self.model.model_name + "_set_points", DesiredJoints, self.update_set_point)
        self.control_onoff_srv = rospy.Service(self.model.model_name + '_controller_onoff', SetBool, self.enable_control_srv)
        self.tau_pub = rospy.Publisher(self.model.model_name + "_joint_torque", JointState, queue_size=1)
        self.traj_pub = rospy.Publisher(self.model.model_name + "_trajectory", Float32MultiArray, queue_size=1)
        self.error_pub = rospy.Publisher(self.model.model_name + "_Error", Float32MultiArray, queue_size=1)
        self.controller_srv = rospy.ServiceProxy('CalcTau', JointControl)
        self.service = rospy.Service(model.model_name + '_joint_cmd', DesiredJointsCmd, self.joint_cmd_server)
        self.service = rospy.Service('exo_calc_dyn', DesiredJointsCmd, self.calc_dyn)
        self._tread_running = False
        self._enable_control = False
        self.ctrl_list = []
        self.msg = None
        self.q = np.array([])
        self.qd = np.array([])
        self.qdd = np.array([])
        self.other = np.array([])
        self.human_effort = np.array(7*[0.0])
        self.use_gravity= use_gravity

    @property
    def model(self):
        return self._model

    @model.setter
    def model(self, value):
        self._model = value


    def enable_control_srv(self, msg):
        if msg.data:
            self._enable_control = True
            return SetBoolResponse(False, "Turned on Exo Controller")
        else:
            self._enable_control = False
            return SetBoolResponse(False, "Turned off Exo Controller" )


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
        if not self._tread_running:
            self._updater.start()
        return True

    def joint_cmd_server(self, msg):
        with self.lock:
            self.msg = msg
       
        if not self._tread_running:
            self._updater.start()
        return DesiredJointsCmdResponse(True)



    def calc_gravity(self, q, qd):

        qdd = np.array([0.0] * len(q))
        tau = np.asarray([0.0] * len(q))
        rospy.wait_for_service("InverseDynamics")
        try:
            dyn_srv = rospy.ServiceProxy('InverseDynamics', RBDLInverseDynamics)
            resp1 = dyn_srv("exograv", q, qd, qdd)
            tau = resp1.tau
            return tau

        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)

    def calc_dyn(self, joints):
        print(joints.q)
        q = self._model.ambf_to_rbdl(np.array(joints.q) )
        qd = self._model.ambf_to_rbdl(np.array(joints.qd) )
        qdd = self._model.ambf_to_rbdl(np.array(joints.qdd) )
        rospy.wait_for_service("InverseDynamics")
        print("trying to call")
        try:
            dyn_srv = rospy.ServiceProxy('InverseDynamics', RBDLInverseDynamics)
            resp1 = dyn_srv("exo", q, qd, qdd)
            tau = resp1.tau
            print(tau)
            return DesiredJointsCmdResponse(tau=tau,success=True)
            #return np.array(tau)

        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)


    def set_torque(self):
        self._enable_control = True
        self._tread_running = True
        rate = rospy.Rate(500)
        tau_msg = JointState()
        traj_msg = Float32MultiArray()
        error_msg = Float32MultiArray()

        while 1:

            if self._enable_control:
                # with self.lock:
                local_msg = self.msg
                traj_msg.data = local_msg.q
                # q = np.array(local_msg.q)
                # qd = np.array(local_msg.qd)
                # qdd = np.array(local_msg.qdd)
                # other = np.array(local_msg.other)
                rospy.wait_for_service('CalcTau')
                msg = JointControlRequest()
                msg.controller_name = local_msg.controller
                msg.desired.positions = self._model.ambf_to_rbdl(np.array(local_msg.q) )
                msg.desired.velocities = self._model.ambf_to_rbdl(np.array(local_msg.qd) )
                msg.desired.accelerations = self._model.ambf_to_rbdl(np.array(local_msg.qdd) )
                q = self._model.ambf_to_rbdl(self._model.q)
                qd = self._model.ambf_to_rbdl(self._model.qd)
                msg.actual.positions = q
                msg.actual.velocities = qd
                # error_msg.data = np.abs((local_msg.q - q)/local_msg.q)
                # self.error_pub.publish(error_msg)
                self.traj_pub.publish(traj_msg)

                try:

                    resp1 = self.controller_srv(msg)
                    tau = resp1.control_output.effort

                    grav_tau = [0.0]*len(tau)
                    # if self.use_gravity:
                    #     grav_tau = self.calc_gravity(q,qd)
                    #     tau +=grav_tau
                    # choose =  np.abs( np.array(msg.desired.positions) - np.array(q)) > 0.01
                    # choose = 0 + choose
                    tau_msg.effort =  tau
                    self.tau_pub.publish(tau_msg)

                except rospy.ServiceException as e:
                    print("Service call failed: %s"%e)

              
            rate.sleep()



    
