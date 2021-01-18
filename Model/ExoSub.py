from . import Exoskeleton

import rospy
from std_msgs.msg import Float32MultiArray
import numpy as np


class ExoSub(Exoskeleton.Exoskeleton):

    def __init__(self, client, model_name, joints, mass, height):

        super(ExoSub, self).__init__(client, model_name, joints, mass, height)
        sub_q = rospy.Subscriber("....", self.q)
        sub_qd = rospy.Subscriber("....", self.qd)

    def update(self):
        """

        :return:
        """
        rate = rospy.Rate(10)  # 1000hz
        q_msg = Float32MultiArray()
        while 1:
            self.state = (self.q, self.qd)
            q_msg.data = self.q
            self.q_pub.publish(q_msg)
            rate.sleep()

    def q(self, value):

        self._q = value


    def qd(self, value):
        self._qd = value