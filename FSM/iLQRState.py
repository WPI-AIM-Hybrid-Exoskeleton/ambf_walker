import smach
import rospy
from ambf_walker.msg import DesiredJoints
import numpy as np
from os.path import dirname, join
from ambf_msgs.msg import RigidBodyState, SensorState
from GaitAnaylsisToolkit.LearningTools.Runner import TPGMMRunner
from sensor_msgs.msg import JointState
from std_msgs.msg import Float32MultiArray

class iLQRState(smach.State):

    def __init__(self, model_name, controller_name, outcomes=["ilqred"],input_keys=['q', 'qd']):

        smach.State.__init__(self, outcomes=outcomes, input_keys=input_keys)
        self._model = model_name

        project_root = dirname(dirname(__file__))
        file = join(project_root, 'config/tau.npy')
        with open(file, 'rb') as f:
            self.ilqr_tau = np.load(f)

        self.runner = self._get_walker()
        self.joint_state = JointState()
        self.rate = rospy.Rate(10)
        self._controller_name = controller_name
        self.pub = rospy.Publisher(model_name + "_set_points", DesiredJoints, queue_size=1)
        self.count = 0
        self.pub_tau_ilqr = rospy.Publisher("tau_ilqr", Float32MultiArray, queue_size=1 )
        self.count = 0
        self.rate = rospy.Rate(100)

    def _get_walker(self):
        project_root = dirname(dirname(__file__))
        config_path = join(project_root, 'config/walk2.pickle')
        return TPGMMRunner.TPGMMRunner(config_path)


    def execute(self, userdata):

        ilqr_tau_msg = Float32MultiArray()
        start = []
        for q in userdata.q[0:6]:
            start.append(np.array([q]))

        self.runner.update_start(start)

        while self.count < self.runner.get_length():
            self.runner.step()
            x = self.runner.x
            dx = self.runner.dx
            ddx = self.ilqr_tau[self.count]
            ilqr_tau_msg.data = ddx
            size_diff = abs(len(q) - len(self.joint_state.position))
            q = np.append(q, size_diff * [0.0])
            qd = np.append(qd, size_diff * [0.0])
            qdd = np.append(qdd, size_diff * [0.0])
            msg = DesiredJoints()
            msg.q = q.tolist()
            msg.qd = qd.tolist()
            msg.qdd = qdd.tolist()
            msg.other = q.tolist()
            msg.controller = self._controller_name()
            msg.q = q.tolist()
            joints.q = self._model.q.tolist()
            self.pub.publish(msg)
            self.pub_ilqr_tau.publisher(ilqr_tau_msg)
            self.count += 1
            self.rate.sleep()


        return "ilqred"