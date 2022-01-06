
import smach
import rospy
from ambf_walker.msg import DesiredJoints
import numpy as np
from os.path import dirname, join
from ambf_msgs.msg import RigidBodyState, SensorState
from GaitAnaylsisToolkit.LearningTools.Runner import TPGMMRunner
from sensor_msgs.msg import JointState
from std_srvs.srv import SetBool, SetBoolResponse

class StepState(smach.State):

    def __init__(self, model_name, controller_name, outcomes=["Stepped"],input_keys=['q', 'qd']):
        smach.State.__init__(self, outcomes=outcomes)
        self.runner = self._get_walker()
        self.model_name = model_name
        self.joint_state = JointState()
        self.joint_cb = rospy.Subscriber(model_name+ "_jointstate", JointState, self.joint_callback)
        self.rate = rospy.Rate(10)
        self._controller_name = controller_name
        self.pub = rospy.Publisher(model_name + "_set_points", DesiredJoints, queue_size=1)
        self.count = 0

    def _get_walker(self):
        project_root = dirname(dirname(__file__))
        config_path = join(project_root, 'config/Angle_Step_rad.pickle')
        return TPGMMRunner.TPGMMRunner(config_path)

    def execute(self, userdata):

        start = []
        for q in self.joint_state.position[0:3]:
            start.append(np.array([q]))

        self.runner.update_start( [ np.array([0.0]),np.array([0.5]),np.array([-0.2])   ] )

        while self.count < self.runner.get_length():
            #rospy.loginfo(self.model_name + " is at " + str(self.count) )
            self.runner.step()
            msg = DesiredJoints()
            q =  self.runner.x
            qd = self.runner.dx
            qdd = self.runner.ddx
            q = q.flatten()
            size_diff = abs(len(q) - len(self.joint_state.position))

            current_q = self.joint_state.position
            q = np.append([-q[0], q[1], q[2], -0.5, 0.5, -0.2 ] , [0.0])
            print(q)
            current_qd = self.joint_state.velocity
            qd = np.append([-qd[0], qd[1], qd[2], 0.0, 0.0, 0.0 ] , [0.0])

            current_qdd = self.joint_state.effort
            qdd = np.append([-qdd[0],qdd[1], qdd[2], 0.0, 0.0, 0.0] , [0.0])

            msg.q = q
            msg.qd = qd
            msg.qdd = qdd
            msg.controller = self._controller_name
            self.pub.publish(msg)
            self.count += 1
            # print(count)
            self.rate.sleep()

        return "Stepped"


    def joint_callback(self, msg):
        self.joint_state = msg
        