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

class ForwardLegState(smach.State):

    def __init__(self, model_name, side, outcomes=["Forwarded"]):
        smach.State.__init__(self, outcomes=outcomes)
        self.rate = rospy.Rate(100)
        tf = 2.0
        dt = 0.01
        self.side = side
        self.joint_state = JointState()
        self.joint_cb = rospy.Subscriber(model_name+ "_jointstate", JointState, self.joint_callback)
        self.msg = DesiredJoints()
        self.pub = rospy.Publisher(model_name + "_set_points", DesiredJoints, queue_size=1)
        self.total = tf / dt
        self.count = 0

    def execute(self, userdata):

        self.count = 0
        pos = self.joint_state.position

        if self.side == 0:
            Lhip, Lknee, Lankle, Rhip, Rknee, Rankle = trajectories.lower_left_leg_traj(pos)

        elif self.side == 1:
            Lhip, Lknee, Lankle, Rhip, Rknee, Rankle = trajectories.lower_right_leg_traj(pos)

        while self.count <= self.total - 1:

            q = np.array([Lhip["q"][self.count].item(),
                          Lknee["q"][self.count].item(),
                          Lankle["q"][self.count].item(),
                          Rhip["q"][self.count].item(),
                          Rknee["q"][self.count].item(),
                          Rankle["q"][self.count].item(), 0.0])

            qd = np.array([Lhip["qd"][self.count].item(),
                           Lknee["qd"][self.count].item(),
                           Lankle["qd"][self.count].item(),
                           Rhip["qd"][self.count].item(),
                           Rknee["qd"][self.count].item(),
                           Rankle["qd"][self.count].item(), 0.0])

            qdd = np.array([Lhip["qdd"][self.count].item(),
                            Lknee["qdd"][self.count].item(),
                            Lankle["qdd"][self.count].item(),
                            Rhip["qdd"][self.count].item(),
                            Rknee["qdd"][self.count].item(),
                            Rankle["qdd"][self.count].item(), 0.0])

            self.count += 1
            self.msg.q = q
            self.msg.qd = qd
            self.msg.qdd = qdd
            self.msg.controller = "Dyn"
            self.pub.publish(self.msg)
            #self.send(q, qd, qdd, "Dyn", [])
            self.rate.sleep()


        return "Forwarded"


    def joint_callback(self, msg):
        self.joint_state = msg