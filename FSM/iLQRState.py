import smach
import rospy
from ambf_walker.msg import DesiredJoints
import numpy as np
from os.path import dirname, join
from ambf_msgs.msg import RigidBodyState, SensorState
from GaitAnaylsisToolkit.LearningTools.Runner import TPGMMRunner
from sensor_msgs.msg import JointState
from std_mgs.msgs import Float32MultiArray

class iLQRState(smach.State):

    def __init__(self, model_name, outcomes=["LQRed"]):
        smach.State.__init__(self, outcomes=outcomes)
        self._model = model_name
        self.rate = rospy.Rate(100)
        project_root = dirname(dirname(__file__))

        file = join(project_root, 'config/tau.npy')
        with open(file, 'rb') as f:
            self.ilqr_tau = np.load(f)

        self.runner = self._get_walker()
        self.joint_state = JointState()
        self.joint_cb = rospy.Subscriber(model_name+ "_jointstate", JointState, self.joint_callback)
        self.rate = rospy.Rate(10)
        self._controller_name = controller_name
        self.pub = rospy.Publisher(model_name + "_set_points", DesiredJoints, queue_size=1)
        self.count = 0
        self.tau_ilqr = rospy.Publisher("tau_ilqr", Flo)
        self.count = 0

    def _get_walker(self):
        project_root = dirname(dirname(__file__))
        config_path = join(project_root, 'config/walk2.pickle')
        return TPGMMRunner.TPGMMRunner(config_path)


    def execute(self, userdata):

        start = []
        for q in userdata.q[0:6]:
            start.append(np.array([q]))

        self.runner.update_start(start)

        if self.count < self.runner.get_length():
            self.runner.step()
            x = self.runner.x
            dx = self.runner.dx
            ddx = self.ilqr_tau[self.count]
            size_diff = abs(len(q) - len(self.joint_state.position))
            q = np.append(q, size_diff * [0.0])
            qd = np.append(qd, size_diff * [0.0])
            qdd = np.append(qdd, size_diff * [0.0])
            msg = DesiredJoints()
            msg.q = q.tolist()
            msg.qd = qd.tolist()
            msg.qdd = qdd.tolist()
            msg.other = q.tolist()
            msg.controller = "FF"
            msg = DesiredJoints()
            joints = DesiredJoints()
            msg.q = q.tolist()
            joints.q = self._model.q.tolist()
            self.pub.publish(msg)
            self.my_joints.publish(joints)
            self.rate.sleep()
            self.count += 1
            return "LQRing"
        else:
            return "LQRed"