import smach
import numpy as np
import rospy
from sensor_msgs.msg import JointState
from ambf_walker.msg import DesiredJoints

class WalkInit(smach.State):

    def __init__(self, model_name, outcomes=['WalkInitialized']):

        smach.State.__init__(self, outcomes=outcomes)
        self.rate = rospy.Rate(100)
        tf = 2.0
        dt = 0.01
        self.joint_state = JointState()
        self.joint_cb = rospy.Subscriber(model_name+ "_jointstate", JointState, self.joint_callback)
        self.hip, self.knee, self.ankle = self.walk_init_trajectory()
        self.msg = DesiredJoints()
        self.pub = rospy.Publisher(model_name + "_set_points", DesiredJoints, queue_size=1)
        self.total = tf / dt
        self.count = 0

    def walk_init_trajectory(self, tf=2, dt=0.01):
        hip = self.get_traj(self.joint_state.position[0], 0.3234, 0.0, 0.0, tf, dt)
        knee = self.get_traj(self.joint_state.position[1], 0.815, 0.0, 0., tf, dt)
        ankle = self.get_traj(self.joint_state.position[2], 0.07, 0.0, 0.0, tf, dt)
        return hip, knee, ankle


    def get_traj(self, q0, qf, v0, vf, tf, dt):

        b = np.array([q0, v0, qf, vf]).reshape((-1,1))
        A = np.array([[1.0, 0.0, 0.0, 0.0],
                    [0.0, 1.0, 0.0, 0.0],
                    [1.0, tf, tf ** 2, tf ** 3],
                    [0.0, 1.0, 2 * tf, 3 * tf * 2]])

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


    def execute(self, userdata):

        while self.count <= self.total - 1:

            q = np.array([self.hip["q"][self.count].item(), self.knee["q"][self.count].item(),
                          self.ankle["q"][self.count].item(),
                          self.hip["q"][self.count].item(), self.knee["q"][self.count].item(),
                          self.ankle["q"][self.count].item(), 0.0])

            qd = np.array([self.hip["qd"][self.count].item(), self.knee["qd"][self.count].item(),
                           self.ankle["qd"][self.count].item(),
                           self.hip["qd"][self.count].item(), self.knee["qd"][self.count].item(),
                           self.ankle["qd"][self.count].item(), 0.0])

            qdd = np.array([self.hip["qdd"][self.count].item(), self.knee["qdd"][self.count].item(),
                            self.ankle["qdd"][self.count].item(),
                            self.hip["qdd"][self.count].item(), self.knee["qdd"][self.count].item(),
                            self.ankle["qdd"][self.count].item(), 0.0])

            self.count += 1
            self.msg.q = q
            self.msg.qd = qd
            self.msg.qdd = qdd
            self.msg.controller = "Dyn"
            self.pub.publish(self.msg)
            #self.send(q, qd, qdd, "Dyn", [])
            self.rate.sleep()

        userdata.q = self.joint_state.position
        return "WalkInitialized"

    
    def joint_callback(self, msg):
        self.joint_state = msg