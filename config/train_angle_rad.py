import helper
import pickle
import matplotlib.pyplot as plt
import helper
from dtw import dtw
import numpy as np
import numpy.polynomial.polynomial as poly
from GaitAnaylsisToolkit.LearningTools.Trainer import TPGMMTrainer, GMMTrainer
from GaitAnaylsisToolkit.LearningTools.Runner import TPGMMRunner,GMMRunner
from GaitAnaylsisToolkit.Session import ViconGaitingTrial
import matplotlib

if __name__ == '__main__':

    hip, knee, ankle = helper.get_angle_data()


    fig0, axs0 = plt.subplots(3)

    for ii, z in enumerate(hip):
        if ii != 12 and ii !=17 and ii != 7 and ii != 18 and ii!=15 and ii!=9 and ii!=14 and ii!=16 and  ii!=5:
            axs0[0].plot(z)

    for ii, y in enumerate(knee):
        if ii != 12 and ii !=17 and ii != 7 and ii != 18 and ii!=15 and ii!=9 and ii!=14 and ii!=16 and  ii!=5:
            axs0[1].plot(y)

    for ii, y in enumerate(ankle):
        if ii != 12 and ii !=17 and ii != 7 and ii != 18 and ii!=15 and ii!=9 and ii!=14 and ii!=16 and  ii!=5:
            axs0[2].plot(y)


    # hip_mod = []
    # knee_mod = []
    # ankle_mod = []
    # for ii in range(len(hip)):
    #     if ii != 12 and ii !=17 and ii != 7 and ii != 18 and ii!=15 and ii!=9 and ii!=14 and ii!=16 and  ii!=5:
    #         hip_mod.append(hip[ii])
    #         knee_mod.append(knee[ii])
    #         ankle_mod.append(ankle[ii])
    #


    hip_mod = []
    knee_mod = []
    ankle_mod = []
    for ii in range(len(hip)):
        if ii != 12 and ii !=17 and ii != 7 and ii != 18 and ii!=15 and ii!=9 and ii!=14 and ii!=16 and  ii!=5:
            hip_mod.append(np.radians(hip[ii]))
            knee_mod.append(np.radians(knee[ii]))
            ankle_mod.append( np.radians(ankle[ii]))



    trainer = TPGMMTrainer.TPGMMTrainer(demo=[hip_mod, knee_mod,ankle_mod],
                                        file_name="Angle_Step_rad",
                                        n_rf=7,
                                        dt=0.01,
                                        reg=[1e-2, 1e-5, 1e-5],
                                        poly_degree=[3,3,4],
                                        resample=[True, True, True])

    trainer.train()

    names = [str(ii) for ii in range(len(ankle))  ]
    runner = TPGMMRunner.TPGMMRunner("Angle_Step_rad")
    # runner.update_start( [ np.array([-0.5]),np.array([0.5]),np.array([0.2])   ]    )
    path = runner.run()

    dwt_paths = runner.get_dwt()
    hip_paths = runner.get_dwt()[0]
    knee_paths = runner.get_dwt()[1]
    ankle_paths = runner.get_dwt()[2]

    font = {'family' : 'normal',
            'weight' : 'bold',
            'size'   : 22}

    matplotlib.rc('font', **font)
    fig1, axs1 = plt.subplots(3)

    axs1[0].set_ylabel("F")
    axs1[1].set_ylabel("F")
    axs1[2].set_ylabel("F")

    t = np.linspace(0,1, len(path[:, 0],) )

    fig2, axs2 = plt.subplots(3)

    for p in hip_paths:
        axs2[0].plot(t, p["smooth_path"], color='blue')
        axs2[0].plot(t, path[:, 0], linewidth=4, color='black')


    for p in knee_paths:
        axs2[1].plot(t, p["smooth_path"], color='blue')
        axs2[1].plot(t, path[:, 1], linewidth=4, color='black')

    for p in ankle_paths:
        axs2[2].plot(t, p["smooth_path"], color='blue')
        axs2[2].plot(t, path[:, 2], linewidth=4, color='black')


    helper.get_gmm2(runner, len(hip_mod), axs1, index=0)

    axs1[0].set_title("Hip Forcing Function")
    axs1[1].set_title("Knee Forcing Function")
    axs1[2].set_title("Ankle Forcing Function")

    axs2[0].set_title("Hip Path")
    axs2[1].set_title("Knee Path")
    axs2[2].set_title("Ankle Path")

    fig2.suptitle('Initial Step Trajectory', fontsize=25)


    axs1[2].set_xlabel("Normilized Time")
    axs2[2].set_xlabel("Normilized Time")

    plt.show()