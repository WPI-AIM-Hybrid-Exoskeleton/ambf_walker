#!/usr/bin/env python3

import rospy
import ExoFSM, ExoHumanFSM


if __name__ == "__main__":



    rospy.init_node("FSM")
    ExoFSM.ExoFSM()
    #ExoHumanFSM.ExoHumanFSM()
