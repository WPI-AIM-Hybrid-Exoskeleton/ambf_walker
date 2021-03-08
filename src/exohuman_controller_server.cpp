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
    
    exo_Kp(0,0) = 500.0;
    exo_Kp(1,1) = 500.0;
    exo_Kp(2,2) = 500.0;
    exo_Kp(3,3) = 500.0;
    exo_Kp(4,4) = 500.0;
    exo_Kp(5,5) = 500.0;
    exo_Kp(6,6) = 500.0;

    exo_Kd(0,0) = 0.40;
    exo_Kd(1,1) = 0.40;
    exo_Kd(2,2) = 0.40;
    exo_Kd(3,3) = 0.40;
    exo_Kd(4,4) = 0.40;
    exo_Kd(5,5) = 0.40;
    exo_Kd(6,6) = 0.40;
  


    Eigen::MatrixXd FES_Kp = Eigen::MatrixXd::Zero(18,6);
    Eigen::MatrixXd FES_Kd = Eigen::MatrixXd::Zero(18,6);

    /**
     *   H  K  A
     *0: 1  0  0
     *1: 1  0  0
     *2: 1  1  0
     *3: 0  1  0  
     *4: 1  1  0
     *5: 0  1  0 
     *6: 0  1  1
     *7: 0  0  1
     *8: 0  0  1
    */



    FES_Kp(0, 0) = 600.0;
    FES_Kp(1, 0) = 200.0;
    FES_Kp(2, 0) =  0.0;
    FES_Kp(5, 0) = 250.0;

    FES_Kp(2, 1) = 500.0;
    FES_Kp(3, 1) = 100.0;
    FES_Kp(4, 1) = 100.0;
    FES_Kp(5, 1) = 500.0;
    FES_Kp(6, 1) = 0.0;

    FES_Kp(6, 2) = 10.0;
    FES_Kp(7, 2) = 10.0;
    FES_Kp(8, 2) = 10.0;
    

    FES_Kd(0, 0) = 0.8;
    FES_Kd(1, 0) = 0.8;
    FES_Kd(2, 0) = 0.8;
    FES_Kd(5, 0) = 0.8;

    FES_Kd(2, 1) = 0.8;
    FES_Kd(3, 1) = 0.8;
    FES_Kd(4, 1) = 0.8;
    FES_Kd(5, 1) = 0.0;
    FES_Kd(6, 1) = 0.0;

    FES_Kd(6, 2) = 0.0;
    FES_Kd(7, 2) = 0.0;
    FES_Kd(8, 2) = 0.0;



    FES_Kp(0+9, 0+3) = 600.0;
    FES_Kp(1+9, 0+3) = 200.0;
    FES_Kp(2+9, 0+3) =  0.0;
    FES_Kp(5+9, 0+3) = 250.0;

    FES_Kp(2+9, 1+3) = 500.0;
    FES_Kp(3+9, 1+3) = 100.0;
    FES_Kp(4+9, 1+3) = 100.0;
    FES_Kp(5+9, 1+3) = 500.0;
    FES_Kp(6+9, 1+3) = 0.0;

    FES_Kp(6+9, 2+3) = 10.0;
    FES_Kp(7+9, 2+3) = 10.0;
    FES_Kp(8+9, 2+3) = 10.0;
    

    FES_Kd(0+9, 0+3) = 0.8;
    FES_Kd(1+9, 0+3) = 0.8;
    FES_Kd(2+9, 0+3) = 0.8;
    FES_Kd(5+9, 0+3) = 0.8;

    FES_Kd(2+9, 1+3) = 0.8;
    FES_Kd(3+9, 1+3) = 0.8;
    FES_Kd(4+9, 1+3) = 0.8;
    FES_Kd(5+9, 1+3) = 0.0;
    FES_Kd(6+9, 1+3) = 0.0;

    FES_Kd(6+9, 2+3) = 0.0;
    FES_Kd(7+9, 2+3) = 0.0;
    FES_Kd(8+9, 2+3) = 0.0;
    
    
    ControllerManager manager = ControllerManager(&n);
    PDController exo(exo_Kp, exo_Kd);
    boost::shared_ptr<ControllerBase> Dyn_controller(new  DynController("exo", &n, &exo) );
    boost::shared_ptr<ControllerBase> FF_controller(new  PDController(FF_Kp, FF_Kd ) );
    boost::shared_ptr<ControllerBase> FES_controller(new  PDController(FES_Kp, FES_Kd ) );


    manager.addController("Dyn", Dyn_controller);
    manager.addController("HumanPD", FF_controller);
    manager.addController("FES", FES_controller);

    ros::spin();

    return 0;
}
