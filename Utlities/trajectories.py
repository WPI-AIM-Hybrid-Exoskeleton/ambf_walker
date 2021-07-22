from . import utlities

def walk_init_trajectory(pos, tf=2, dt=0.01):
    hip = utlities.get_traj(pos[0], 0.3234, 0.0, 0.0, tf, dt)
    knee = utlities.get_traj(pos[1], 0.568, 0.0, 0., tf, dt)
    ankle = utlities.get_traj(pos[2], 0.07, 0.0, 0.0, tf, dt)
    return hip, knee, ankle


def stance_trajectory(pos=[0,0,-0.35],tf=2, dt=0.01):
    hip = utlities.get_traj(pos[0], -0.5, 0.0, 0.0, tf, dt)
    knee = utlities.get_traj(pos[1], 0.50, 0.0, 0., tf, dt)
    ankle = utlities.get_traj(pos[2], -0.28, 0.0, 0.0, tf, dt)
    return hip, knee, ankle


def raise_left_leg_traj(pos, tf=2, dt=0.01):
    # Lhip = utlities.get_traj( pos[0], -0.95, 0.0, 0.0, tf, dt)
    # Lknee = utlities.get_traj(pos[1], 0.95, 0.0, 0., tf, dt)
    # Lankle = utlities.get_traj(pos[2], -0.30,  0.0, 0.0, tf, dt)
    #
    # Rhip = utlities.get_traj( pos[3], -0.95, 0.0, 0.0, tf, dt)
    # Rknee = utlities.get_traj(pos[4], 0.0, 0.0, 0., tf, dt)
    # Rankle = utlities.get_traj(pos[5], -0.30,  0.0, 0.0, tf, dt)


    Lhip = utlities.get_traj( pos[0], -1.2, 0.0, 0.0, tf, dt)
    Lknee = utlities.get_traj(pos[1], 0.95, 0.0, 0., tf, dt)
    Lankle = utlities.get_traj(pos[2], -0.30,  0.0, 0.0, tf, dt)

    Rhip = utlities.get_traj( pos[3], -0.45, 0.0, 0.0, tf, dt)
    Rknee = utlities.get_traj(pos[4], 0.1, 0.0, 0., tf, dt)
    Rankle = utlities.get_traj(pos[5], 0.15,  0.0, 0.0, tf, dt)

    return Lhip, Lknee, Lankle, Rhip, Rknee, Rankle

def lower_left_leg_traj(pos, tf=2, dt=0.01):
    Lhip = utlities.get_traj( pos[0], -0.50, 0.0, 0.0, tf, dt)
    Lknee = utlities.get_traj(pos[1], 0.1, 0.0, 0., tf, dt)
    Lankle = utlities.get_traj(pos[2], -0.15,  0.0, 0.0, tf, dt)

    Rhip = utlities.get_traj( pos[3], -0.45, 0.0, 0.0, tf, dt)
    Rknee = utlities.get_traj(pos[4], 0.1, 0.0, 0., tf, dt)
    Rankle = utlities.get_traj(pos[5], -0.15,  0.0, 0.0, tf, dt)
    return Lhip, Lknee, Lankle, Rhip, Rknee, Rankle


def raise_right_leg_traj(pos, tf=2, dt=0.01):
    # Lhip = utlities.get_traj( pos[0], -0.95, 0.0, 0.0, tf, dt)
    # Lknee = utlities.get_traj(pos[1], 0.95, 0.0, 0., tf, dt)
    # Lankle = utlities.get_traj(pos[2], -0.30,  0.0, 0.0, tf, dt)
    #
    # Rhip = utlities.get_traj( pos[3], -0.95, 0.0, 0.0, tf, dt)
    # Rknee = utlities.get_traj(pos[4], 0.0, 0.0, 0., tf, dt)
    # Rankle = utlities.get_traj(pos[5], -0.30,  0.0, 0.0, tf, dt)


    Rhip = utlities.get_traj( pos[3], -1.2, 0.0, 0.0, tf, dt)
    Rknee = utlities.get_traj(pos[4], 0.95, 0.0, 0., tf, dt)
    Rankle = utlities.get_traj(pos[5], -0.30,  0.0, 0.0, tf, dt)

    Lhip = utlities.get_traj( pos[0], -0.45, 0.0, 0.0, tf, dt)
    Lknee = utlities.get_traj(pos[1], 0.1, 0.0, 0., tf, dt)
    Lankle = utlities.get_traj(pos[2], -0.15,  0.0, 0.0, tf, dt)

    return Lhip, Lknee, Lankle, Rhip, Rknee, Rankle

def lower_right_leg_traj(pos, tf=2, dt=0.01):
    Rhip = utlities.get_traj( pos[3], -0.50, 0.0, 0.0, tf, dt)
    Rknee = utlities.get_traj(pos[4], 0.1, 0.0, 0., tf, dt)
    Rankle = utlities.get_traj(pos[5], 0.15,  0.0, 0.0, tf, dt)

    Lhip = utlities.get_traj( pos[0], -0.45, 0.0, 0.0, tf, dt)
    Lknee = utlities.get_traj(pos[1], 0.1, 0.0, 0., tf, dt)
    Lankle = utlities.get_traj(pos[2], -0.15,  0.0, 0.0, tf, dt)
    return Lhip, Lknee, Lankle, Rhip, Rknee, Rankle