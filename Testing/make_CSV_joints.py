#!/usr/bin/env python

import rospy
import csv
import numpy as np
from os.path import dirname, join

from GaitAnaylsisToolkit.LearningTools.Runner import TPGMMRunner


if __name__ == '__main__':
    project_root = dirname(dirname(__file__))
    config_path = join(project_root, 'config/walk2.pickle')
    runner = TPGMMRunner.TPGMMRunner(config_path)
    # count = 0
    # filename = "joint_angle.csv"
    # with open(filename, 'w') as csvfile:
    # # creating a csv writer object
    #     csvwriter = csv.writer(csvfile)
    #
    #     while count < runner.get_length():
    #             runner.step()
    #             q = runner.x
    #             q_new = []
    #             for joint in q:
    #                 q_new.append(joint.tolist()[0])
    #
    #             csvwriter.writerow(q_new)
    #             count+=1
    #
    # runner = TPGMMRunner.TPGMMRunner(config_path)
    # filename = "joint_vel.csv"
    # count = 0
    # with open(filename, 'w') as csvfile:
    #     # creating a csv writer object
    #     csvwriter = csv.writer(csvfile)
    #
    #     while count < runner.get_length():
    #         runner.step()
    #         qd = runner.dx
    #         q_new = []
    #         for joint in qd:
    #             q_new.append(joint.tolist()[0])
    #
    #         csvwriter.writerow(q_new)
    #         count+=1




    runner = TPGMMRunner.TPGMMRunner(config_path)
    filename = "joint_accel.csv"
    count = 0
    with open(filename, 'w') as csvfile:
        # creating a csv writer object
        csvwriter = csv.writer(csvfile)

        while count < runner.get_length():
            runner.step()
            qd = runner.ddx
            q_new = []
            for joint in qd:
                q_new.append(joint.tolist()[0])

            csvwriter.writerow(q_new)
            count+=1



    # project_root = dirname(dirname(__file__))
    # file = join(project_root, 'config/tau_human2.npy')
    # count = 0
    # with open(file, 'rb') as f:
    #     ilqr_tau = np.load(f)
    #
    # filename = "ilqr_tau.csv"
    # with open(filename, 'w') as csvfile:
    #     csvwriter = csv.writer(csvfile)
    #
    #     for tau in ilqr_tau:
    #         q_new = []
    #         for item in tau:
    #             temp = -item
    #             q_new.append(temp)
    #         csvwriter.writerow(q_new)
