import sys
from os import sys, path
sys.path.append(path.dirname(path.dirname(path.abspath(__file__))))
import abc
import numpy as np
import rbdl
import time
import rospy
from threading import Thread
from lib.GaitCore.Bio import Joint, Leg
from lib.GaitCore.Core import Point
from std_msgs.msg import Float32MultiArray
from sensor_msgs.msg import JointState

class Model(object):

    def __init__(self, client):

        self._client = client
        self._q = np.array([])
        self._qd = np.array([])
        self.tau = np.array([])
        self._handle = None
        self._updater = Thread(target=self.update)
        self._enable_control = False
        self.sub_torque = rospy.Subscriber("joint_torque", JointState, self.torque_cb)
        self.q_pub = rospy.Publisher("q", Float32MultiArray, queue_size=1)

    def torque_cb(self, tau):
        self.update_torque(list(tau.effort))

    def update_torque(self, tau):
        """

        :type tau: List
        """
        self.tau = tau
        self._enable_control = True

    @property
    def enable_control(self):
        return self._enable_control

    @enable_control.setter
    def enable_control(self, value):
        self._enable_control = value

    @property
    def handle(self):
        return self._handle

    @handle.setter
    def handle(self, value):
        self._handle = value

    @property
    def q(self):
        return self._q

    @q.setter
    def q(self, value):
        self._q = np.asarray(value)

    @property
    def qd(self):
        return self._qd

    @qd.setter
    def qd(self, value):
        self._qd = np.asarray(value)

    @property
    def state(self):
        return self._state

    @state.setter
    def state(self, value):
        self._state = np.concatenate(value)

    @abc.abstractmethod
    def dynamic_model(self):
        pass

    def update(self):
        """

        :return:
        """
        rate = rospy.Rate(1000)  # 1000hz
        q_msg = Float32MultiArray()
        while 1:
            self.q = self.handle.get_all_joint_pos()
            self.qd = self.handle.get_all_joint_vel()
            self._joint_num = self.q.size
            q_msg.data = self.q
            self.q_pub.publish(q_msg)
            if self._enable_control:
                self.handle.set_all_joint_effort(self.tau)
            rate.sleep()

    @abc.abstractmethod
    def  ambf_to_dyn(self, q):
        pass

    @abc.abstractmethod
    def fk(self):
        pass

    @abc.abstractmethod
    def update_state(self, q, qd):
        self.state = q + qd

    @abc.abstractmethod
    def calculate_dynamics(self, qdd):
        pass

    def get_right_leg(self):
        """
        :return:
        """
        return self._right_leg

    def get_left_leg(self):
        """
        :return:
        """
        return self._left_leg


def get_traj(q0, qf, v0, vf, tf, dt):

    b = np.array([q0, v0, qf, vf]).reshape((-1,1))
    A = np.array([[1.0, 0.0, 0.0, 0.0],
                  [0.0, 1.0, 0.0, 0.0],
                  [1.0, 0.0, tf ** 2, tf ** 3],
                  [0.0, 0.0, 2 * tf, 3 * tf * 2]])

    x = np.linalg.solve(A, b)
    q = []
    qd = []
    qdd = []

    for t in np.linspace(0, tf, int(tf/dt)):
        q.append(x[0] + x[1] * t + x[2] * t * t + x[3] * t * t * t)
        qd.append(x[1] + 2*x[2] * t + 3*x[3] * t * t)
        qdd.append(2*x[2] + 6*x[3] * t)

    traj = {}
    traj["q"] = q
    traj["qd"] = qd
    traj["qdd"] = qdd
    return traj
