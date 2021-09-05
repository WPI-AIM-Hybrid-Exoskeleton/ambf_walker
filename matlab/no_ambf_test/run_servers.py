#!/usr/bin/env python3

import rospy
from rbdl_server.srv import RBDLModel, RBDLModelAlignment
if __name__ == '__main__':


    rospy.init_node("main_server")
    exo_file_path ="/home/nathanielgoldfarb/catkin_ws/src/ambf_walker/ambf_models/lumped/lumped.yaml"
    #human_file_path = "/home/nathanielgoldfarb/catkin_ws/src/ambf_walker/ambf_models/human_lumped/lumped.yaml"
    human_file_path = "/home/nathanielgoldfarb/catkin_ws/src/ambf_walker/ambf_models/human2/default.yaml"

    try:
        print("making model")
        model_srv = rospy.ServiceProxy('CreateModel', RBDLModel)
        resp1 = model_srv("exo", exo_file_path)

    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

    try:
        print("making model")
        model_srv = rospy.ServiceProxy('CreateModel', RBDLModel)
        resp1 = model_srv("human",  human_file_path)

    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

    rospy.spin()