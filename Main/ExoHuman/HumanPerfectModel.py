#!/usr/bin/env python3
import sys
# from os import sys, path
# sys.path.append(path.dirname(path.dirname(path.abspath(__file__))))
import numpy as np
from os.path import dirname, join


from Controller import ControllerNode,  ExoControllerServer, HumanControllerServer
from Model import ExoskeletonServer, HumanServer
from StateMachines import StateMachine
import rospy
from ambf_client import Client
from Controller import DynController



if __name__ == '__main__':


    rospy.init_node("Base")
    _client = Client()
    _client.connect()


    robot_joints = ['ExoLeftHip', 'ExoLeftKnee', 'ExoLeftAnkle',
                    'ExoRightHip', 'ExoRightKnee', 'ExoRightAnkle',  'ExoHipCrutches']

    body_joints = ['HumanLeftHip', 'HumanLeftKnee', 'HumanLeftAnkle',
                   'HumanRightHip', 'HumanRightKnee', 'HumanRightAnkle']


    project_root = dirname(dirname(__file__))
    exo_file_path ="/home/nathaniel/catkin_ws/src/ambf_walker/ambf_models/lumped/lumped.yaml"
    #human_file_path = "/home/nathanielgoldfarb/catkin_ws/src/ambf_walker/ambf_models/human_lumped/lumped.yaml"
    human_file_path = "/home/nathaniel/catkin_ws/src/ambf_walker/ambf_models/human2/default.yaml"
    LARRE = ExoskeletonServer.ExoskeletonServer(_client, "exo", robot_joints, exo_file_path, use_gravity=True)
    LARRY = HumanServer.HumanServer(_client, "human", body_joints, human_file_path)
    exo_controller_server = ExoControllerServer.ExoControllerServer(LARRE, True )
    human_controller_server = HumanControllerServer.HumanControllerServer(LARRY)

    LARRE.handle.set_rpy(0, 0, 0)
    LARRE.handle.set_pos(0.0, 0, 3.0)
    # LARRE.handle.set_rpy(0, 0, 0)
    # LARRE.handle.set_pos(0.0, 0, 1.0)
    # machine = StateMachine.ExoStateMachine(LARRE)
