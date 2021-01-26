#include "ambf_walker/DynController.h"


DynController::DynController(const std::string model_name, const  PDController& controller) 
{

}


DynController::~DynController()
{

}


void DynController::update(const trajectory_msgs::JointTrajectoryPoint& actual, const trajectory_msgs::JointTrajectoryPoint& desired, std::vector<double>& torque)
{
    
    // Eigen::VectorXd e = VectToEigen(desired.positions) - VectToEigen(actual.positions);
    // Eigen::VectorXd ed = VectToEigen(desired.velocities) - VectToEigen(actual.velocities); 
    // Eigen::VectorXd tau_(e.rows());
    // calculate_torque(e, ed, tau_);
    // std::vector<double> my_tau(&tau_[0], tau_.data()+tau_.cols()*tau_.rows());
    // tau = my_tau;
    // //error = std::vector<double>(&e[0], e.data()+e.cols()*e.rows());
    // torque = tau;
    
}
























