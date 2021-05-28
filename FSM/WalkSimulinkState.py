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

from std_msgs.msg import Float32

class WalkSimulinkState(smach.State):

    def __init__(self, model_name, controller_name, outcomes=["walked"],output_keys=['human'],  input_keys=['q', 'qd']):
        smach.State.__init__(self, outcomes=outcomes, input_keys=input_keys, output_keys=output_keys)
        self.runner = self._get_walker()
        self.model_name = model_name
        self.joint_state = JointState()
        self.joint_cb = rospy.Subscriber(model_name+ "_jointstate", JointState, self.joint_callback)
        self.rate = rospy.Rate(10)
        self._controller_name = controller_name
        self.pub = rospy.Publisher(model_name + "simulink_set_points", DesiredJoints, queue_size=1)
        self.count = 0
        project_root = dirname(dirname(__file__))
        file = join(project_root, 'config/tau_human2.npy')
        with open(file, 'rb') as f:
            self.ilqr_tau = np.load(f)


    def _get_walker(self):
        project_root = dirname(dirname(__file__))
        config_path = join(project_root, 'config/walk2.pickle')
        return TPGMMRunner.TPGMMRunner(config_path)

    def execute(self, userdata):

        start = []
        for q in userdata.q[0:6]:
            start.append(np.array([q]))

        self.runner.update_start(start)

        self.count = 0

        while self.count < self.runner.get_length():
            #rospy.loginfo(self.model_name + " is at " + str(self.count) )
            self.runner.step()
            msg = DesiredJoints()
            q = self.runner.x
            qd = self.runner.dx
            qdd = self.runner.ddx
            size_diff = abs(len(q) - len(self.joint_state.position))
            q = np.append(q, size_diff*[0.0])
            qd = np.append(qd, size_diff*[0.0])
            qdd = np.append(qdd, size_diff*[0.0])
            Td = -self.ilqr_tau[self.count]
            msg.q = q
            msg.qd = qd
            msg.qdd = qdd
            msg.other = Td
            msg.controller = self._controller_name
            self.pub.publish(msg)
            self.count += 1
            # print(count)
            userdata.human = False
            self.rate.sleep()

        return "walked"


    def joint_callback(self, msg):
        self.joint_state = msg
        