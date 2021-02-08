#!/usr/bin/env python
import smach
import rospy
import numpy as np
from sensor_msgs.msg import JointState
from ambf_walker.msg import DesiredJoints
from GaitAnaylsisToolkit.LearningTools.Runner import TPGMMRunner
from std_msgs.msg import Float32MultiArray
from Model import Model
from std_msgs.msg import Empty,String
import matplotlib.pyplot as plt
from ambf_walker.srv import DesiredJointsCmdRequest, DesiredJointsCmd
#from ilqr.controller import RecedingHorizonController
#from ilqr.cost import PathQsRCost
#from ilqr import iLQR
#from ilqr.dynamics import FiniteDiffDynamics
from GaitAnaylsisToolkit.LearningTools.Runner import GMMRunner
import numpy.polynomial.polynomial as poly
from os.path import dirname, join

class Initialize(smach.State):

    def __init__(self, model, outcomes=['Initialized']):

        smach.State.__init__(self, outcomes=outcomes)
        self._model = model
        self.rate = rospy.Rate(100)
        tf = 2.0
        dt = 0.01
        self.hip, self.knee, self.ankle = self._model.stance_trajectory(tf=tf, dt=dt)
        self.msg = DesiredJoints()
        self.pub = rospy.Publisher(self._model.model_name + "_set_points", DesiredJoints, queue_size=1)

        self.total = tf / dt
        self.count = 0

    def execute(self, userdata):

        self._model.handle.set_rpy(0.25, 0, 0)
        self._model.handle.set_pos(0.0, 0, 3.0)

        while self.count <= self.total - 1:

            q = np.array([self.hip["q"][self.count].item(), self.knee["q"][self.count].item(),
                          self.ankle["q"][self.count].item(),
                          self.hip["q"][self.count].item(), self.knee["q"][self.count].item(),
                          self.ankle["q"][self.count].item(), 0.0])

            qd = np.array([self.hip["qd"][self.count].item(), self.knee["qd"][self.count].item(),
                           self.ankle["qd"][self.count].item(),
                           self.hip["qd"][self.count].item(), self.knee["qd"][self.count].item(),
                           self.ankle["qd"][self.count].item(), 0.0])

            qdd = np.array([self.hip["qdd"][self.count].item(), self.knee["qdd"][self.count].item(),
                            self.ankle["qdd"][self.count].item(),
                            self.hip["qdd"][self.count].item(), self.knee["qdd"][self.count].item(),
                            self.ankle["qdd"][self.count].item(), 0.0])

            self.count += 1
            self.msg.q = q
            self.msg.qd = qd
            self.msg.qdd = qdd
            self.msg.controller = "Dyn"
            self.pub.publish(self.msg)
            self.rate.sleep()

        return "Initialized"