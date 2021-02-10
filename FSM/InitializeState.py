#!/usr/bin/env python
import smach
import rospy
import numpy as np
from sensor_msgs.msg import JointState
from ambf_walker.msg import DesiredJoints
from GaitAnaylsisToolkit.LearningTools.Runner import TPGMMRunner
from std_msgs.msg import Float32MultiArray
from std_msgs.msg import Empty,String
import matplotlib.pyplot as plt
from ambf_walker.srv import DesiredJointsCmdRequest, DesiredJointsCmd
from GaitAnaylsisToolkit.LearningTools.Runner import GMMRunner
from ambf_walker.msg import DesiredPosCmd
from Utlities import trajectories


class InitializeState(smach.State):

    def __init__(self, model_name, outcomes=['Initialized']):

        smach.State.__init__(self, outcomes=outcomes)
        self._model_name = model_name
        self.rate = rospy.Rate(100)
        tf = 2.0
        dt = 0.01
        self.joint_cb = rospy.Subscriber(model_name + "_jointstate", JointState, self.joint_callback)
        self.pub_joints = rospy.Publisher(self._model_name + "_set_points", DesiredJoints, queue_size=1)
        self.pub_pos = rospy.Publisher(self._model_name + "_set_pos_cmd", DesiredPosCmd, queue_size=1)
        self.total = tf / dt
        self.count = 0
    

    def execute(self, userdata):

        msg_pos = DesiredPosCmd() 
        msg_pos.pos.x = 0.0
        msg_pos.pos.y = 0.0
        msg_pos.pos.z = 3.0
        msg_pos.rpy.x = 0.25
        msg_pos.rpy.y = 0.0
        msg_pos.rpy.z = 0.0

        self.pub_pos.publish(msg_pos)
        self.hip, self.knee, self.ankle = trajectories.stance_trajectory()
   
        while self.count <= self.total - 1:
            msg = DesiredJoints()
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
            msg.q = q
            msg.qd = qd
            msg.qdd = qdd
            msg.controller = "Dyn"
            self.pub_joints.publish(msg)
            self.rate.sleep()

        return "Initialized"
    


    def joint_callback(self, msg):
        self.joint_state = msg