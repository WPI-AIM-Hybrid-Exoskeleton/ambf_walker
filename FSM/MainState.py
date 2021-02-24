import rospy
import smach
from std_msgs.msg import String

class MainState(smach.State):

    def __init__(self, outcomes=["walkinit", "lower"]):
        smach.State.__init__(self, outcomes=outcomes)
        rospy.Subscriber("Mode", String, callback=self.mode_cb)
        self.have_msg = False
        self.msg = String
        self.Rate = rospy.Rate(100)

    def mode_cb(self, msg):

        if not self.have_msg:
            if msg.data in self._outcomes:
                self.msg = msg.data
                self.have_msg = True

    def execute(self, userdata):

        rate = rospy.Rate(1000)
        self.have_msg = False
        while not self.have_msg:
            rate.sleep()

        return self.msg