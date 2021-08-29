#!/usr/bin/env python
import smach
import rospy
from ambf_walker.msg import DesiredJoints
import numpy as np
from os.path import dirname, join
from ambf_msgs.msg import RigidBodyState, SensorState
from GaitAnaylsisToolkit.LearningTools.Runner import TPGMMRunner
from sensor_msgs.msg import JointState
from std_srvs.srv import SetBool, SetBoolResponse
from std_msgs.msg import Bool
from std_msgs.msg import Float32

class PremaSimState(smach.State):

    def __init__(self, model_name, outcomes=["Main"],output_keys=['human'],  input_keys=['q', 'qd']):

        smach.State.__init__(self, outcomes=outcomes, input_keys=input_keys, output_keys=output_keys)


    def execute(self, userdata):


        rospy.wait_for_service('human_controller_onoff')
        rospy.wait_for_service('exo_controller_onoff')


        try:
            human = rospy.ServiceProxy('human_controller_onoff', SetBool)
            exo = rospy.ServiceProxy('exo_controller_onoff', SetBool)
            resp1 = human(False)
            resp2 = exo(False)

        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)


        while 1:
            #rospy.loginfo(self.model_name + " is at " + str(self.count) )


            # print(count)
            self.rate.sleep()

        return "Main"


    def joint_callback(self, msg):
        self.joint_state = msg
