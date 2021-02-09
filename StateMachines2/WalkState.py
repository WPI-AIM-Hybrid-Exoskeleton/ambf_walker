import smach
import rospy
from ambf_walker import DesiredJoints
import numpy as np
from os.path import dirname, join
from ambf_msgs.msg import RigidBodyState, SensorState
from GaitAnaylsisToolkit.LearningTools.Runner import TPGMMRunner


class ExoWalkState(smach.State):

    def __init__(self, model_name, controller_name, model,outcomes=["walking"]):
        smach.State.__init__(self, outcomes=outcomes)
        self.runner = self._get_walker()
        self.rate = rospy.Rate(10)
        self._controller_name = controller_name
        self.pub = rospy.Publisher(model_name + "_set_points", DesiredJoints, queue_size=1)
        self.count = 0

    def _get_walker(self):
        project_root = dirname(dirname(__file__))
        config_path = join(project_root, 'config/walk2.pickle')
        return TPGMMRunner.TPGMMRunner(config_path)

    def execute(self, userdata):

        count = self.count

        # if count == 0:
        #     start = []

        #     for q in self._model.q[0:6]:
        #         start.append(np.array([q]))

        #     self.runner.update_start(start)
        # print(self.runner.get_length())
        while count < self.runner.get_length():

            self.runner.step()
            msg = DesiredJoints()
            q = self.runner.x
            qd = self.runner.dx
            qdd = self.runner.ddx
            # q = np.append(x, [0.0])
            # qd = np.append(dx, [0.0])
            # qdd = np.append(ddx, [0.0])
            msg.q = q
            msg.qd = qd
            msg.qdd = qdd
            msg.controller = self._controller_name
            self.pub.publish(msg)
            self.count += 1
            # print(count)
            self.rate.sleep()
            
        return "walking"
        