"""
This should be moved to a seperate repo later
"""

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
from ambf_msgs.msg import RigidBodyState
from GaitAnaylsisToolkit.LearningTools.Runner import TPGMMRunner
from Muscles import RienerMuscles
from sensor_msgs.msg import JointState


class HumanServer(ModelServer.ModelServer):

    def __init__(self, client, model_name, joint_names, model_path):
        # inits dynamic model and joints for leg
        super(HumanServer, self).__init__(client, model_name=model_name, joint_names=joint_names, model_path=model_path)
       
        self.handle = self._client.get_obj_handle('HumanTorso')
        # model_path = "/home/nathanielgoldfarb/catkin_ws/src/ambf_walker/ambf_models/human/human.yaml"
        self.make_dynamic_model(model_name, model_path )
        # # num_of_segments should be initialized with the dynamical model, which is created in the constructor
        self.num_joints = len(self.handle.get_joint_names())
        self.human_required_sub = rospy.Subscriber("required_human", JointState, self.required_human_cb)
        self.torque_error_pub = rospy.Publisher("human_torque_error", Float32MultiArray, queue_size=1)
        self._left_muscle = RienerMuscles.Riener_Muscle()
        self._right_muscle = RienerMuscles.Riener_Muscle()
        self.freq = 20*np.array([1,1,1,1,1,1,1,1,1])
        time.sleep(2)
        self.last_time = None
        self._state = (self._q, self._qd)
        self._updater.start()  # start update thread

    def torque_cb(self, tau):
        self.update_torque(list(tau.effort))

    
    def required_human_cb(self, tau):
        msg = Float32MultiArray()
        tau = self.calculate_dynamics(tau.effort)
        if self.enable_control:
            msg.data = tau - self.tau
            self.torque_error_pub.publish(msg)


    # def update_torque(self, PW):
    #     """
    #     self.rbdl_model = self.dynamic_model()
    #     :type tau: List
    #     """
    #     time = 0.0
    #
    #     if self.enable_control:
    #
    #         if self.last_time is None:
    #             self.last_time = rospy.get_time()
    #         else:
    #             time = rospy.get_time() - self.last_time
    #
    #         left_tau = (self._left_muscle.calc_moment(np.abs(np.clip(PW[:9], 0, 480)) ,
    #                                                              self.freq,
    #                                                              time,
    #                                                              np.rad2deg(self.q[:3]),
    #                                                              np.rad2deg(self.qd[:3])))
    #
    #         right_tau = (self._right_muscle.calc_moment(np.abs(np.clip(PW[9:], 0, 480)),
    #                                                    self.freq,
    #                                                    time,
    #                                                    np.rad2deg(self.q[3:]),
    #                                                    np.rad2deg(self.qd[3:])))
    #
    #
    #
    #         self.tau =  np.concatenate([left_tau, right_tau])



   
