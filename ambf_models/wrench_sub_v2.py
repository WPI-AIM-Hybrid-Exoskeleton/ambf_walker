#!/usr/bin/env python3

import rospy
import message_filters
from ambf_msgs.msg import RigidBodyState


def callback(fslt,bslt,fsls,bsls,fsrt,bsrt,fsrs,bsrs,lf1,lf2,lf3,rf1,rf2,rf3):

    print(fslt.name)
    print(fslt.wrench.torque.y)
    
    # print(bslt.name)
    # print(bslt.wrench)
    
    # print(fsls.name)
    # print(fsls.wrench)
    
    # print(bsls.name)
    # print(bsls.wrench)
    
    # print(fsrt.name)
    # print(fsrt.wrench)
    
    # print(bsrt.name)
    # print(bsrt.wrench)
   
    # print(fsrs.name)
    # print(fsrs.wrench)
    
    # print(bsrs.name)
    # print(bsrs.wrench)
    
    # print(lf1.name)
    # print(lf1.wrench)
    
    # print(lf2.name)
    # print(lf2.wrench)
    
    # print(lf3.name)
    # print(lf3.wrench)
    
    # print(rf1.name)
    # print(rf1.wrench)
    
    # print(rf2.name)
    # print(rf2.wrench)
    
    # print(rf3.name)
    # print(rf3.wrench)


if __name__ == '__main__':
    try:
        rospy.init_node('wrench_subscriber', anonymous=True)

        fslt_sub = message_filters.Subscriber("/ambf/env/FrontSensorLeftThigh/State", RigidBodyState)
        bslt_sub = message_filters.Subscriber("/ambf/env/BackSensorLeftThigh/State", RigidBodyState)

        fsls_sub = message_filters.Subscriber("/ambf/env/FrontSensorLeftShank/State", RigidBodyState)
        bsls_sub = message_filters.Subscriber("/ambf/env/BackSensorLeftShank/State", RigidBodyState)

        fsrt_sub = message_filters.Subscriber("/ambf/env/FrontSensorRightThigh/State", RigidBodyState)
        bsrt_sub = message_filters.Subscriber("/ambf/env/BackSensorRightThigh/State", RigidBodyState)

        fsrs_sub = message_filters.Subscriber("/ambf/env/FrontSensorRightShank/State", RigidBodyState)
        bsrs_sub = message_filters.Subscriber("/ambf/env/BackSensorRightShank/State", RigidBodyState)
       
        lf1_sub = message_filters.Subscriber("/ambf/env/SensorLeftFoot1/State", RigidBodyState)
        lf2_sub = message_filters.Subscriber("/ambf/env/SensorLeftFoot2/State", RigidBodyState)
        lf3_sub = message_filters.Subscriber("/ambf/env/SensorLeftFoot3/State", RigidBodyState)
        
        rf1_sub = message_filters.Subscriber("/ambf/env/SensorRightFoot1/State", RigidBodyState)
        rf2_sub = message_filters.Subscriber("/ambf/env/SensorRightFoot2/State", RigidBodyState)
        rf3_sub = message_filters.Subscriber("/ambf/env/SensorRightFoot3/State", RigidBodyState)
        
        sub_list = [fslt_sub, bslt_sub, fsls_sub, bsls_sub, fsrt_sub, bsrt_sub, fsrs_sub, bsrs_sub,
                    lf1_sub, lf2_sub, lf3_sub, rf1_sub, rf2_sub, rf3_sub]

        body = message_filters.TimeSynchronizer(sub_list, 10)
        body.registerCallback(callback)

        rospy.spin()

    except rospy.ROSInterruptException:
        pass  
