from . import utlities

def walk_init_trajectory(pos, tf=2, dt=0.01):
    hip = utlities.get_traj(pos[0], 0.3234, 0.0, 0.0, tf, dt)
    knee = utlities.get_traj(pos[1], 0.568, 0.0, 0., tf, dt)
    ankle = utlities.get_traj(pos[2], 0.07, 0.0, 0.0, tf, dt)
    return hip, knee, ankle


def stance_trajectory(pos=[0,0,-0.35],tf=2, dt=0.01):
    hip = utlities.get_traj(pos[1], -0.5, 0.0, 0.0, tf, dt)
    knee = utlities.get_traj(pos[1], 0.50, 0.0, 0., tf, dt)
    ankle = utlities.get_traj(pos[2], -0.28, 0.0, 0.0, tf, dt)
    return hip, knee, ankle


