#!/usr/bin/env python3

import rospy
from ambf_msgs.msg import RigidBodyState


class Grabber:

    def __init__(self):
        self.
        self.
        self.

    def callback00(data):

        print('FrontSensorLeftThigh')
        print(data.wrench)

    def callback01(data):

        print('FrontSensorLeftShank')
        print(data.wrench)

    def callback02(data):

        print('FrontSensorRightThigh')
        print(data.wrench)

    def callback03(data):

        print('FrontSensorRightShank')
        print(data.wrench)

    def callback04(data):

        print('BackSensorLeftThigh')
        print(data.wrench)

    def callback05(data):

        print('BackSensorLeftShank')
        print(data.wrench)

    def callback06(data):

        print('BackSensorRightThigh')
        print(data.wrench)

    def callback07(data):

        print('BackSensorRightShank')
        print(data.wrench)

    def callback08(data):

        print('SensorLeftFoot1')
        print(data.wrench)

    def callback09(data):

        print('SensorLeftFoot2')
        print(data.wrench)

    def callback10(data):

        print('SensorLeftFoot3')
        print(data.wrench)

    def callback11(data):

        print('SensorRightFoot1')
        print(data.wrench)

    def callback12(data):

        print('SensorRightFoot2')
        print(data.wrench)

    def callback13(data):

        print('SensorRightFoot3')
        print(data.wrench)

    def wrench_subscriber():

    rospy.init_node('wrench_subscriber', anonymous=True)

    rospy.Subscriber("/ambf/env/FrontSensorLeftThigh/State", RigidBodyState, callback00)
    rospy.Subscriber("/ambf/env/FrontSensorLeftShank/State", RigidBodyState, callback01)
    rospy.Subscriber("/ambf/env/FrontSensorRightThigh/State", RigidBodyState, callback02)
    rospy.Subscriber("/ambf/env/FrontSensorRightShank/State", RigidBodyState, callback03)
    rospy.Subscriber("/ambf/env/BackSensorLeftThigh/State", RigidBodyState, callback04)
    rospy.Subscriber("/ambf/env/BackSensorLeftShank/State", RigidBodyState, callback05)
    rospy.Subscriber("/ambf/env/BackSensorRightThigh/State", RigidBodyState, callback06)
    rospy.Subscriber("/ambf/env/BackSensorRightShank/State", RigidBodyState, callback07)
    rospy.Subscriber("/ambf/env/SensorLeftFoot1/State", RigidBodyState, callback08)
    rospy.Subscriber("/ambf/env/SensorLeftFoot2/State", RigidBodyState, callback09)
    rospy.Subscriber("/ambf/env/SensorLeftFoot3/State", RigidBodyState, callback10)
    rospy.Subscriber("/ambf/env/SensorRightFoot1/State", RigidBodyState, callback11)
    rospy.Subscriber("/ambf/env/SensorRightFoot2/State", RigidBodyState, callback12)
    rospy.Subscriber("/ambf/env/SensorRightFoot3/State", RigidBodyState, callback13)

    rospy.spin()

if __name__ == '__main__':
    try:
        rospy.init_node('wrench_subscriber', anonymous=True)

        grabber = Grabber()

        wrench_subscriber()
    except rospy.ROSInterruptException:
        pass  
