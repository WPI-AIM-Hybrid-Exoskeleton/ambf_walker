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

class HumanServer(ModelServer.ModelServer):

    def __init__(self, client, model_name, joint_names, mass, height, model_path):
        # inits dynamic model and joints for leg
        super(HumanServer, self).__init__(client, model_name=model_name, joint_names=joint_names, model_path=model_path)
       
        self.handle = self._client.get_obj_handle('Hip')
        # model_path = "/home/nathanielgoldfarb/catkin_ws/src/ambf_walker/ambf_models/human/human.yaml"
        self.make_dynamic_model(model_name, model_path )
        # # num_of_segments should be initialized with the dynamical model, which is created in the constructor
        self.num_joints = len(self.handle.get_joint_names())
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

        time.sleep(2)
        self._state = (self._q, self._qd)
        self._updater.start()  # start update thread

        self.ambf_order_crutch_left = {'crutch': 0, 'hip': 1, 'ankle': 2, 'knee': 3, 'elbow': 4, 'shoulder': 5, 'wrist': 6, 'neck': 7}
        self.ambf_order_crutch_right = {'crutch': 8, 'hip': 9, 'ankle': 10, 'knee': 11, 'elbow': 12, 'shoulder': 13, 'wrist': 14, 'neck': 7}



   
