import numpy as np




def get_traj(q0, qf, v0, vf, tf, dt):

    b = np.array([q0, v0, qf, vf]).reshape((-1,1))
    A = np.array([[1.0, 0.0, 0.0, 0.0],
                [0.0, 1.0, 0.0, 0.0],
                [1.0, tf, tf ** 2, tf ** 3],
                [0.0, 1.0, 2 * tf, 3 * tf * 2]])

    x = np.linalg.solve(A, b)
    q = []
    qd = []
    qdd = []

    for t in np.linspace(0, tf, int(tf/dt)):
        q.append(x[0] + x[1] * t + x[2] * t * t + x[3] * t * t * t)
        qd.append(x[1] + 2*x[2] * t + 3*x[3] * t * t)
        qdd.append(2*x[2] + 6*x[3] * t)

    traj = {}
    traj["q"] = q
    traj["qd"] = qd
    traj["qdd"] = qdd
    return traj


