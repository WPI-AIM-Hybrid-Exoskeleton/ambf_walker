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
from std_srvs.srv import SetBool, SetBoolResponse

class RaiseLegState(smach.State):

    def __init__(self, model_name, outcomes=["Raised"]):
        smach.State.__init__(self, outcomes=outcomes)
        self.rate = rospy.Rate(100)
        tf = 2.0
        dt = 0.01
        self.joint_state = JointState()
        self.joint_cb = rospy.Subscriber(model_name+ "_jointstate", JointState, self.joint_callback)
        self.msg = DesiredJoints()
        self.pub = rospy.Publisher(model_name + "_set_points", DesiredJoints, queue_size=1)
        self.total = tf / dt
        self.count = 0

    def execute(self, userdata):


        pos = self.joint_state.position[:3]
        self.hip, self.knee, self.ankle = trajectories.raise_leg_traj(pos)

        while self.count <= self.total - 1:

            q = np.array([self.hip["q"][self.count].item(), self.knee["q"][self.count].item(),
                          self.ankle["q"][self.count].item(),
                          pos[0], pos[1],
                          pos[2], 0.0])

            qd = np.array([self.hip["qd"][self.count].item(), self.knee["qd"][self.count].item(),
                           self.ankle["qd"][self.count].item(),
                           0,0,0, 0.0])

            qdd = np.array([self.hip["qdd"][self.count].item(), self.knee["qdd"][self.count].item(),
                            self.ankle["qdd"][self.count].item(),
                            0,0,0, 0.0])

            self.count += 1
            self.msg.q = q
            self.msg.qd = qd
            self.msg.qdd = qdd
            self.msg.controller = "Dyn"
            self.pub.publish(self.msg)
            #self.send(q, qd, qdd, "Dyn", [])
            self.rate.sleep()


        return "Raised"


    def joint_callback(self, msg):
        self.joint_state = msg