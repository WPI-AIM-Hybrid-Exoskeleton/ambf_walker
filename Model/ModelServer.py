import abc
import numpy as np
import rbdl
import time
import rospy
from Filters import LowPass, MeanFilter
from threading import Thread
from GaitCore.Bio import Joint, Leg
from GaitCore.Core import Point
from std_msgs.msg import Float32MultiArray
from sensor_msgs.msg import JointState
from rbdl_server.srv import RBDLModel, RBDLModelAlignment
from rbdl_server.srv import RBDLInverseDynamics
from . import Model
from std_srvs.srv import SetBool, SetBoolResponse
from std_msgs.msg import Float32



class ModelServer(Model.Model):

    def __init__(self, client, model_name, joint_names, model_path):
        
        super(ModelServer, self).__init__(client=client, model_name=model_name, joint_names=joint_names)
        self.dt_pub = rospy.Publisher("dt", Float32, queue_size=1)
        self._use_gravity = False
        self.make_dynamic_model(model_name, model_path)
        left_joints = {}
        right_joints = {}
        self.grav_tau = np.array([])
        for joint in (left_joints, right_joints):
            for output in ["Hip", "Knee", "Ankle"]:
                angle = Point.Point(0, 0, 0)
                force = Point.Point(0, 0, 0)
                moment = Point.Point(0, 0, 0)
                power = Point.Point(0, 0, 0)
                joint[output] = Joint.Joint(angle, moment, power, force)

        self._left_leg = Leg.Leg(left_joints["Hip"], left_joints["Knee"], left_joints["Ankle"])
        self._right_leg = Leg.Leg(right_joints["Hip"], right_joints["Knee"], right_joints["Ankle"])
        #"/home/nathanielgoldfarb/catkin_ws/src/ambf_walker/ambf_models/lumped/lumped.yaml"
        self._joint_map = {}
        self._joint_map_selected = {}
        self._selected_joint_names = joint_names
        self.dyn_srv = rospy.ServiceProxy('InverseDynamics', RBDLInverseDynamics)


    def torque_cb(self, tau):
        self.update_torque(list(tau.effort))

    def update_torque(self, tau):
        """
        self.rbdl_model = self.dynamic_model()
        :type tau: List
        """
        self.tau = self.rbdl_to_ambf(tau)


    def make_dynamic_model(self, name, model_path): 
        """"
        use the RBDL server to create the model 
        """
        try:
            print("making model")
            model_srv = rospy.ServiceProxy('CreateModel', RBDLModel)
            resp1 = model_srv(name, model_path)

        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)


    def update(self):
        """

        :return:
        """
        rate = rospy.Rate(500)  # 1000hz
        

        # get the joint map
        self._joints_names = self.handle.get_joint_names()
        
        try:
            print(self.model_name)
            model_srv = rospy.ServiceProxy('AMBF2RBDL', RBDLModelAlignment)
            resp1 = model_srv(self.model_name, [])           
        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)

        self._joint_map = {resp1.names[i]: resp1.ids[i] for i in range(len(resp1.names))}
       
        joints_idx = []
            # print(self._joints_names)
        index = 0
        for joint in self._selected_joint_names:
            if joint in self._joints_names:
                joints_idx.append(self._joints_names.index(joint))
                self._joint_map_selected[joint] = index
                index+=1
                
        # loop through and get the joint values
        # set the torques

        dt_msg = Float32()
        last_time = rospy.get_time()
        self._joint_num = self.q.size
        while 1:
            self.q = self.handle.get_all_joint_pos()
            self.qd = self.handle.get_all_joint_vel()
            self.joint_effort = self.handle.get_all_joint_effort()
            self.state = (self.q, self.qd)
            
            state_msg = JointState()
            state_msg.name = self._selected_joint_names
            state_msg.position = self.q
            state_msg.velocity = self.qd
            state_msg.effort = self.tau
            self.q_pub.publish(state_msg)
            current_time = rospy.get_time()
            dt_msg.data = current_time - last_time
            last_time = current_time
            self.dt_pub.publish(dt_msg)
            
            if self._enable_control: 
                #self.calc_gravity()
                # tau = self.tau
                # if  self.tau.size == self.grav_tau.size:# and self._use_gravity:
                #     pass#tau+=self.grav_tau

                current_time = rospy.get_time()
                self.handle.set_multiple_joint_effort(self.tau, joints_idx)
                dt_msg.data = rospy.get_time() - current_time 
                
                
                #set multiple joint pos
            else:
                self.handle.set_multiple_joint_effort(len(self.tau)*[0.0], joints_idx)

            rate.sleep()


    @abc.abstractmethod
    def fk(self):
        pass


    @abc.abstractmethod
    def calc_gravity(self):
        pass

    def update_state(self, q, qd):
        self.state = q + qd

   
    def calculate_dynamics(self, qdd):
        
        q = self.ambf_to_rbdl(self.q)
        qd = self.ambf_to_rbdl(self.qd)
        qdd = self.ambf_to_rbdl(qdd)

        tau = np.asarray([0.0] * self._joint_num)
        rospy.wait_for_service("InverseDynamics")
        try:
            dyn_srv = rospy.ServiceProxy('InverseDynamics', RBDLInverseDynamics)
            resp1 = dyn_srv(self.model_name, q, qd, qdd)
            tau = resp1.tau   
        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)

        
        return  np.array(self.rbdl_to_ambf(tau))

   
    @abc.abstractmethod
    def calculate_torque(self):
        pass


    def get_right_leg(self):
        """
        :return:
        """
        return self._right_leg

    def get_left_leg(self):
        """
        :return:
        """
        return self._left_leg
    
    def ambf_to_rbdl(self, q):
        """
        make the order of the joints for the dynamics
        """

        names = self._selected_joint_names
        ambf_joints_names = self.handle.get_joint_names()
        joints_aligned = [0.0]*len(names)
        q_new = [0.0]*len(names)

        for ii, name in enumerate(names):
            if(len(names) > len(ambf_joints_names)):
                index = self._joint_map_selected[name]
            else:
                index = self._joint_map[name] - 1
        
            joints_aligned[index] = q[ii]

        return joints_aligned

    def rbdl_to_ambf(self, q):
        """
        reverse the order of the AMBF
        """
        
        names = self._selected_joint_names
        ambf_joints_names = self.handle.get_joint_names()
        q_new = [0.0]*len(names)
        for ii, name in enumerate(names):
            if(len(names) > len(ambf_joints_names)):
                index = self._joint_map_selected[name]
            else:
                index = self._joint_map[name] - 1
            
            q_new[ii] = q[index]

        return q_new



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


def runge_integrator(model, y, h, tau):

    k1 = rhs(model, y, tau)
    k2 = rhs(model, y + 0.5 * h * k1,tau)
    k3 = rhs(model, y + 0.5 * h * k2,tau)
    k4 = rhs(model, y + h * k3,tau)

    return y + h / 6. * (k1 + 2. * k2 + 2. * k3 + k4)


def rhs(model, y, tau):

    dim = model.dof_count
    res = np.zeros(dim * 2)
    Q = np.zeros(model.q_size)
    QDot = np.zeros(model.qdot_size)
    QDDot = np.zeros(model.qdot_size)
    Tau = tau
    for i in range(0, dim):
        Q[i] = y[i]
        QDot[i] = y[i + dim]

    rbdl.ForwardDynamics(model, Q, QDot, Tau, QDDot)

    for i in range(0, dim):
        res[i] = QDot[i]
        res[i + dim] = QDDot[i]

    return res


def finite_differences(model, y, u, h=0.01):
    """ calculate gradient of plant dynamics using finite differences
    x np.array: the state of the system
    u np.array: the control signal
    """

    dof = u.shape[0]
    num_states = model.q_size*2

    A = np.zeros((num_states, num_states))
    B = np.zeros((num_states, dof))

    eps = 1e-4 # finite differences epsilon
    for ii in range(num_states):
        # calculate partial differential w.r.t. x
        inc_x = y.copy()
        inc_x[ii] += eps
        state_inc = runge_integrator(model, inc_x, h, u)
        dec_x = y.copy()
        dec_x[ii] -= eps
        state_dec = runge_integrator(model, dec_x, h, u)
        A[:, ii] = (state_inc - state_dec) / (2 * eps)

    for ii in range(dof):
        # calculate partial differential w.r.t. u
        inc_u = u.copy()
        inc_u[ii] += eps
        state_inc = runge_integrator(model, y, h, inc_u)
        dec_u = u.copy()
        dec_u[ii] -= eps
        state_dec = runge_integrator(model, y, h, dec_u)
        B[:, ii] = (state_inc - state_dec) / (2 * eps)

    return A, B
