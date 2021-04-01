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

class InitializeState(smach.State):

    def __init__(self,outcomes=['on', 'off'], input_keys=["status", "q", "qd"], output_keys=["q", "qd"] ):

        smach.State.__init__(self, outcomes=outcomes, input_keys=input_keys, output_keys=output_keys)
        

    def execute(self, userdata):

       
        rospy.wait_for_service('human_onoff')
        status =  userdata.status
        print(status)
        try:
            human = rospy.ServiceProxy('human_onoff', SetBool)
            resp1 = human(status)
        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)

        # try:
        #     human = rospy.ServiceProxy('exo_onoff', SetBool)
        #     resp1 = human(False)
        # except rospy.ServiceException as e:
        #     print("Service call failed: %s"%e)


        if status:
            return "on"
        else:
            return "off"
    
