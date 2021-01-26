#include "ambf_walker/DynController.h"


DynController::DynController(const std::string name, ros::NodeHandle* n,  PDController* controller): my_controller(*controller), nh(*n)
{
    model_name = name;
    client_ID = nh.serviceClient<rbdl_server::RBDLInverseDynamics>("InverseDynamics");
    
}


DynController::~DynController()
{

}


void DynController::calculate_torque(const trajectory_msgs::JointTrajectoryPoint& actual, const trajectory_msgs::JointTrajectoryPoint& desired, Eigen::VectorXd &torque)
{
    rbdl_server::RBDLInverseDynamics dyn_msg;
    
    Eigen::VectorXd e = VectToEigen(desired.positions) - VectToEigen(actual.positions);
    Eigen::VectorXd ed = VectToEigen(desired.velocities) - VectToEigen(actual.velocities); 
    Eigen::VectorXd qdd_( VectToEigen(actual.positions).rows());
    my_controller.calculate_torque(e, ed, qdd_);
    std::vector<double> qdd(&qdd_[0], qdd_.data()+qdd_.cols()*qdd_.rows());

   
    dyn_msg.request.q = actual.positions;
    dyn_msg.request.qd = actual.velocities;
    dyn_msg.request.qdd = qdd;

    dyn_msg.request.model_name = model_name;
    if(client_ID.call(dyn_msg))
    {
        ROS_INFO("Dynamics Controller Calculated the dynamics");
        torque = VectToEigen(dyn_msg.response.tau);
    }
    else
    {
       ROS_ERROR("Dynamics Controller FAILED Calculated the dynamics");
    }
    

}

void DynController::update(const trajectory_msgs::JointTrajectoryPoint& actual, const trajectory_msgs::JointTrajectoryPoint& desired, std::vector<double>& torque)
{

    Eigen::VectorXd tau_( VectToEigen(actual.positions).rows());
    calculate_torque(actual, desired, tau_);
    std::vector<double> my_tau(&tau_[0], tau_.data()+tau_.cols()*tau_.rows());
    tau = my_tau;
    torque = my_tau;
    
}
























