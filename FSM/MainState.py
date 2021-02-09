import rospy
import smach
from std_msgs.msg import String

class Main(smach.State):

    def __init__(self, outcomes=["walkinit", "lower"]):
        smach.State.__init__(self, outcomes=outcomes)
        self.have_msg = False
        self.msg = String
        self.Rate = rospy.Rate(100)

    def mode_cb(self, msg):

        if not self.have_msg:
            self.msg = msg
            self.have_msg = True

    def execute(self, userdata):

        rate = rospy.Rate(1000)
        self.have_msg = False
        while not self.have_msg:
            rate.sleep()

        return self.msg.data