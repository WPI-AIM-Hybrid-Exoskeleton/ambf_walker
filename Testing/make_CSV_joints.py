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
    count = 0
    filename = "joint_angle.csv"
    with open(filename, 'w') as csvfile:
    # creating a csv writer object
        csvwriter = csv.writer(csvfile)

        while count < runner.get_length():
                runner.step()
                q = runner.x
                q_new = []
                for joint in q:
                    q_new.append(joint.tolist()[0])

                csvwriter.writerow(q_new)
                count+=1

