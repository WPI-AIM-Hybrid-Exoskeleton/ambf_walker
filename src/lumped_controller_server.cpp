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
   
    Eigen::MatrixXd exo_Kp = Eigen::MatrixXd::Zero(7,7);
    Eigen::MatrixXd exo_Kd = Eigen::MatrixXd::Zero(7,7);

    
    exo_Kp(0,0) = 1000.0;
    exo_Kp(1,1) = 1400.0;
    exo_Kp(2,2) = 1400.0;
    exo_Kp(3,3) = 1400.0;
    exo_Kp(4,4) = 1400.0;
    exo_Kp(5,5) = 5000.0;
    exo_Kp(6,6) = 5000.0;


//    exo_Kp(0,0) = 1000.0;
//        exo_Kp(1,1) = 1500.0;
//        exo_Kp(2,2) = 1500.0;
//        exo_Kp(3,3) = 1500.0;
//        exo_Kp(4,4) = 1500.0;
//        exo_Kp(5,5) = 3500.0;
//        exo_Kp(6,6) = 3500.0;

    exo_Kp(0,0) = 1000.0;
    exo_Kp(1,1) = 1000.0;
    exo_Kp(2,2) = 1000.0;
    exo_Kp(3,3) = 1000.0;
    exo_Kp(4,4) = 1000.0;
    exo_Kp(5,5) = 3000.0;
    exo_Kp(6,6) = 3000.0;

    exo_Kd(0,0) = 4.00;
    exo_Kd(1,1) = 4.00;
    exo_Kd(2,2) = 4.00;
    exo_Kd(3,3) = 4.00;
    exo_Kd(4,4) = 4.00;
    exo_Kd(5,5) = 4.00;
    exo_Kd(6,6) = 4.00;


    Eigen::MatrixXd FF_Kp = Eigen::MatrixXd::Zero(7,7);
    Eigen::MatrixXd FF_Kd = Eigen::MatrixXd::Zero(7,7);
  
    // FF_Kp(0,0) = 1000.0; 
    // FF_Kp(1,1) = 00.0; 
    // FF_Kp(2,2) = 0.0;  // 510 left hip
    // FF_Kp(3,3) = 00.0;  // 250 left knee
    // FF_Kp(4,4) = 500.0; 
    // FF_Kp(5,5) = 100.0; 
    // FF_Kp(6,6) = 00.0; // 220 left ankle


    // FF_Kd(0,0) = 2.5; 
    // FF_Kd(1,1) = 0.00; 
    // FF_Kd(2,2) = 0.0;  //1.15 left hip
    // FF_Kd(3,3) = 0.0; //1.15 left knee
    // FF_Kd(4,4) = 1.750; 
    // FF_Kd(5,5) = 1.750; 
    // FF_Kd(6,6) = 0.0; //1.10 right ankle

    
   
    // FF_Kp(0,0) = 1000.0; 
    // FF_Kp(1,1) = 00.0; 
    // FF_Kp(2,2) = 0.0;  // 510 left hip
    // FF_Kp(3,3) = 00.0;  // 250 left knee
    // FF_Kp(4,4) = 500.0; 
    // FF_Kp(5,5) = 200.0; 
    // FF_Kp(6,6) = 00.0; // 220 left ankle


    // FF_Kd(0,0) = 0.75; 
    // FF_Kd(1,1) = 0.00; 
    // FF_Kd(2,2) = 0.0;  //1.15 left hip
    // FF_Kd(3,3) = 0.0; //1.15 left knee
    // FF_Kd(4,4) = 1.750; 
    // FF_Kd(5,5) = 1.750; 
    // FF_Kd(6,6) = 0.0; //1.10 right ankle

    // FF_Kp(0,0) = 500.0; 
    // FF_Kp(1,1) = 00.0; 
    // FF_Kp(2,2) = 0.0;  // 510 left hip
    // FF_Kp(3,3) = 00.0;  // 250 left knee
    // FF_Kp(4,4) = 250.0; 
    // FF_Kp(5,5) = 220.0; 
    // FF_Kp(6,6) = 00.0; // 220 left ankle


    // FF_Kd(0,0) = 0.75; 
    // FF_Kd(1,1) = 0.00; 
    // FF_Kd(2,2) = 0.0;  //1.15 left hip
    // FF_Kd(3,3) = 0.75; //1.15 left knee
    // FF_Kd(4,4) = 0.750; 
    // FF_Kd(5,5) =  0;


    // FF_Kp(0,0) = 750.0; 
    // FF_Kp(1,1) = 00.0; 
    // FF_Kp(2,2) = 0.0;  // 510 left hip
    // FF_Kp(3,3) = 00.0;  // 250 left knee
    // FF_Kp(4,4) = 250.0; 
    // FF_Kp(5,5) = 200.0; 
    // FF_Kp(6,6) = 00.0; // 220 left ankle


    // FF_Kd(0,0) = 0.75; 
    // FF_Kd(1,1) = 0.00; 
    // FF_Kd(2,2) = 0.0;  //1.15 left hip
    // FF_Kd(3,3) = 0.0; //1.15 left knee
    // FF_Kd(4,4) = 0.750; 
    // FF_Kd(5,5) = 0.750; 
    // FF_Kd(6,6) = 0.0; //1.10 right ankle.750; 
    // FF_Kd(6,6) = 0.0; //1.10 right ankle



    FF_Kp(0,0) = 500.0; 
    FF_Kp(1,1) = 00.0; 
    FF_Kp(2,2) = 0.0;  // 510 left hip
    FF_Kp(3,3) = 000.0;  // 250 left knee
    FF_Kp(4,4) = 230.0; 
    FF_Kp(5,5) = 200.0; 
    FF_Kp(6,6) = 00.0; // 220 left ankle


    FF_Kd(0,0) = 1.0000; 
    FF_Kd(1,1) = 0.00; 
    FF_Kd(2,2) = 0.0;  //1.15 left hip
    FF_Kd(3,3) = 0.0; //1.15 left knee
    FF_Kd(4,4) = 0.00; 
    FF_Kd(5,5) = 1.000; 
    FF_Kd(6,6) = 1.000; //1.10 right ankle.750; 
    FF_Kd(6,6) = 0.0; //1.10 right ankle

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
