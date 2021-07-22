import smach
from ambf_walker.msg import DesiredPosCmd
import rospy
from geometry_msgs.msg import Wrench

class LowerState(smach.State):

    def __init__(self, model_name, outcomes=['Lowered']):

        smach.State.__init__(self, outcomes=outcomes)
        self.model_name = model_name
        self.rate = rospy.Rate(10)
        self.step = 0.01
        self.pub_pos = rospy.Publisher(self.model_name + "_set_body_pos", DesiredPosCmd, queue_size=1)
        self.pub_force = rospy.Publisher(self.model_name + "_set_body_force", Wrench, queue_size=1)
        self.final_height = 0.20

    def execute(self, userdata):

        self.rate.sleep()
        current = 1.0

        while current > self.final_height:
            current-=self.step
            msg_pos = DesiredPosCmd() 
            msg_pos.pos.x = 1.0
            msg_pos.pos.y = 1.0
            msg_pos.pos.z = current
            msg_pos.rpy.x = 0.25
            msg_pos.rpy.y = 0.0
            msg_pos.rpy.z = 0.0
            self.pub_pos.publish(msg_pos)
            self.rate.sleep() 
        
        msg_force = Wrench()
        msg_force.force.x = 0
        msg_force.force.y = 0
        msg_force.force.z = 0.1
        self.pub_force.publish(msg_force)
        return "Lowered"
