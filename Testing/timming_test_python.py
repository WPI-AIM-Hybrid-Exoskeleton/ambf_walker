#!/usr/bin/env python3



# tau_map = {}
# handle = None
# joint_names = []
# joint_map_selected = {}
# model_name = "exo"
# selected_joints_names = []
# q = []
# qd = []


# def get_q():
#     my_joints = []
#     value = handle.get_all_joint_pos()
#     for joint in  selected_joint_names:
#         if joint in joints_names:
#             my_joints.append(value[joints_names.index(joint)])
#     return np.asarray(my_joints)


# def get_qd():
#     my_joints = []
#     value = handle.get_all_joint_vel()
#     for joint in  selected_joint_names:
#         if joint in joints_names:
#             my_joints.append(value[joints_names.index(joint)])
#     return np.asarray(my_joints)

# def make_dynamic_model(): 
#     """"
#     use the RBDL server to create the model 
#     """
#     try:
#         print("making model")
#         model_srv = rospy.ServiceProxy('CreateModel', RBDLModel)
#         resp1 = model_srv("exo", "/home/nathaniel/catkin_ws/src/ambf_walker/ambf_models/lumped/lumped.yaml";)

#     except rospy.ServiceException as e:
#         print("Service call failed: %s"%e)




# def update_tau():
#     pass





# def main_loop():
    
#     dt_msg = Float32()
#     last_time = rospy.get_time()
#     self._joint_num = self.q.size
#     while 1:
#         q = get_q() #self.handle.get_all_joint_pos()
#         qd = get_qd() #self.handle.get_all_joint_vel()
#         current_time = rospy.get_time()
#         dt_msg.data = current_time - last_time
#         last_time = current_time
#         dt_pub.publish(dt_msg)
        
#         if enable_control: 

#             handle.set_multiple_joint_effort(tau, joints_idx)            
#             #set multiple joint pos
#         else:
#             handle.set_multiple_joint_effort(len(self.tau)*[0.0], joints_idx)

#             rate.sleep()

# if __name__ == '__main__':
    
#     model_name = "exo"
#     rospy.init_node("Base")
#     _client = Client()
#     _client.connect()
#     handle = _client.get_obj_handle('ExoHip')
    
    
#     selected_joints_names = ['ExoLeftHip', 'ExoLeftKnee', 'ExoLeftAnkle',
#                     'ExoRightHip', 'ExoRightKnee', 'ExoRightAnkle', 'ExoHipCrutches']

    
#     tau_map["ExoHipCrutches"] = 0;
#     tau_map["ExoLeftKnee"] = 1;
#     tau_map["ExoLeftAnkle"] = 2;
#     tau_map["ExoLeftHip"] = 3;
#     tau_map["ExoRightKnee"] = 4;
#     tau_map["ExoRightAnkle"] = 5;
#     tau_map["ExoRightHip"] = 6;
    
#     joints_names = handle.get_joint_names()
       
#     try:
#         print(model_name)
#         model_srv = rospy.ServiceProxy('AMBF2RBDL', RBDLModelAlignment)
#         resp1 = model_srv(model_name, [])           
#     except rospy.ServiceException as e:
#         print("Service call failed: %s"%e)

#     joint_map = {resp1.names[i]: resp1.ids[i] for i in range(len(resp1.names))}
    
#     joints_idx = []
#         # print(self._joints_names)
#     index = 0
#     for joint in selected_joint_names:
#         if joint in joints_names:
#             joints_idx.append(joints_names.index(joint))
#             joint_map_selected[joint] = index
#             index+=1


#!/usr/bin/env python

import rospy
from rbdl_server.srv import RBDLModel
from rbdl_server.srv import RBDLKinimatics
from ambf_client import Client
import time
import re
import matplotlib.pyplot as plt
import numpy as np
from math import cos, sin
from mpl_toolkits.mplot3d import Axes3D
import time
import numpy as np
from std_msgs.msg import Float32


if __name__ == "__main__":
    

    _client = Client()
    _client.connect()
    time.sleep(0.5)
    handle = _client.get_obj_handle('base')
    time.sleep(0.5)
    tau = 7*[0.0]
    total_time = []
    count = 0
    total = 1000000
    rate = rospy.Rate(1000)
    dt_msg = Float32()
    dt_pub = rospy.Publisher("dt", Float32, queue_size=1)
    
    while count<total:
        start = rospy.get_time()
        q = handle.get_all_joint_pos()
        qd = handle.get_all_joint_pos()
        handle.set_multiple_joint_effort( [0,0,0,0,0,0,0],[0,1,2,3,4,5,6])
        dt_msg.data = rospy.get_time() - start
        dt_pub.publish(dt_msg)
        count+=1
        rate.sleep()

