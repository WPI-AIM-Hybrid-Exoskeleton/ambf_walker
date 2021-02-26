 #include "ros/ros.h"
#include "Eigen/Core"
#include "rbdl_server/RBDLServer.h"
#include "boost/shared_ptr.hpp"
#include "controller_modules/ControllerManager.h"
#include "controller_modules/PDController.h"
#include "ambf_walker/DynController.h"
#include "controller_modules/JointControl.h"
#include "controller_modules/ControllerBase.h"
#include "trajectory_msgs/JointTrajectoryPoint.h"
#include "sensor_msgs/JointState.h"



int main(int argc, char **argv)
{
    ros::init(argc, argv, "Controller_Server");
    ros::NodeHandle n;
   
    Eigen::MatrixXd exo_Kp = Eigen::MatrixXd::Ones(7,7);
    Eigen::MatrixXd exo_Kd = Eigen::MatrixXd::Ones(7,7);
    
    
    exo_Kp(0,0) = 1000.0;
    exo_Kp(1,1) = 1000.0;
    exo_Kp(2,2) = 1000.0;
    exo_Kp(3,3) = 1000.0;
    exo_Kp(4,4) = 1000.0;
    exo_Kp(5,5) = 1000.0;
    exo_Kp(6,6) = 1000.0;

    exo_Kd(0,0) = 4.0;
    exo_Kd(1,1) = 4.0;
    exo_Kd(2,2) = 4.0;
    exo_Kd(3,3) = 4.0;
    exo_Kd(4,4) = 4.0;
    exo_Kd(5,5) = 4.0;
    exo_Kd(6,6) = 4.0;


    Eigen::MatrixXd FF_Kp = Eigen::MatrixXd::Ones(7,7);
    Eigen::MatrixXd FF_Kd = Eigen::MatrixXd::Ones(7,7);
    

    // FF_Kp(0,0) =  0.0; //crutches
    // FF_Kp(1,1) = 100.0; //left knee
    // FF_Kp(2,2) = 550.0;  // left ankle
    // FF_Kp(3,3) = 400.0; //left hip
    // FF_Kp(4,4) = 0.0; //right knee
    // FF_Kp(5,5) = 0.0; //right ankle
    // FF_Kp(6,6) = 0.0; //right hip


    // FF_Kd(0,0) = 0.50; //crutches
    // FF_Kd(1,1) = 1.00; //left knee
    // FF_Kd(2,2) = 1.00;  //left ankle
    // FF_Kd(3,3) = 0.00; //left hip
    // FF_Kd(4,4) = 0.00; //right knee
    // FF_Kd(5,5) = 0.00; //right ankle
    // FF_Kd(6,6) = 0.00; //right hip
  

    FF_Kp(0,0) = 000.0; //crutches
    FF_Kp(1,1) = 00.0; //left knee
    FF_Kp(2,2) = 510.0;  // 510 left ankle
    FF_Kp(3,3) = 550.0; //left hip
    FF_Kp(4,4) = 000.0; //right knee
    FF_Kp(5,5) = 000.0; //right ankle
    FF_Kp(6,6) = 220.0; // 220 right hip


    FF_Kd(0,0) = 0.0; //crutches
    FF_Kd(1,1) = 0.00; //left knee
    FF_Kd(2,2) = 1.15;  //left ankle
    FF_Kd(3,3) = 1.15; //left hip
    FF_Kd(4,4) = 0.00; //right knee
    FF_Kd(5,5) = 0.00; //right ankle
    FF_Kd(6,6) = 1.10; //right hip

    
    ControllerManager manager = ControllerManager(&n);
    PDController exo(exo_Kp, exo_Kd);
    boost::shared_ptr<ControllerBase> Dyn_controller(new  DynController("exo", &n, &exo) );
    boost::shared_ptr<ControllerBase> FF_controller(new  PDController(FF_Kp, FF_Kd ) );
    boost::shared_ptr<ControllerBase> PD_controller(new  PDController(FF_Kp, FF_Kd ) );


    manager.addController("Dyn", Dyn_controller);
    manager.addController("FF", FF_controller);
    manager.addController("PD", PD_controller);

    ros::spin();

    return 0;
}
