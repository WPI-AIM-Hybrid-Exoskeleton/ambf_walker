#!/usr/bin/env python3
import sys
# from os import sys, path
# sys.path.append(path.dirname(path.dirname(path.abspath(__file__))))
import numpy as np


from Controller import ControllerNode, ControllerServer, ExoControllerServer, HumanControllerServer
from Model import ExoskeletonServer, HumanServer
from StateMachines import StateMachine
import rospy
from ambf_client import Client
from Controller import DynController



if __name__ == '__main__':

   
    rospy.init_node("Base")
    _client = Client()
    _client.connect()
    rate = rospy.Rate(1000)

    robot_joints = ['ExoLeftHip', 'ExoLeftKnee', 'ExoLeftAnkle',
                    'ExoRightHip', 'ExoRightKnee', 'ExoRightAnkle',  'ExoHipCrutches']

    body_joints = ['HumanLeftHip', 'HumanLeftKnee', 'HumanLeftAnkle',
                   'HumanRightHip', 'HumanRightKnee', 'HumanRightAnkle']

    exo_file_path = "/home/nathaniel/catkin_ws/src/ambf_walker/ambf_models/lumped/lumped.yaml"
    human_file_path = "/home/nathaniel/catkin_ws/src/ambf_walker/ambf_models/human/human.yaml"
   
    LARRE = ExoskeletonServer.ExoskeletonServer(_client, "exohuman", robot_joints, exo_file_path)
    LARRY = HumanServer.HumanServer(_client, "human", body_joints, human_file_path)
    exo_controller_server = ExoControllerServer.ExoControllerServer(LARRE)
    human_controller_server = HumanControllerServer.HumanControllerServer(LARRY)
   

    LARRE.handle.set_rpy(0, 0, 0)
    LARRE.handle.set_pos(0.0, 0, 1.0)
    machine = StateMachine.ExoStateMachine(LARRE)
