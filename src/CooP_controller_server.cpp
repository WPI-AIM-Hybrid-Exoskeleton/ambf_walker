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


    exo_Kp(0,0) = 800000.0;
    exo_Kp(1,1) = 800000.0;
    exo_Kp(2,2) = 800000.0;
    exo_Kp(3,3) = 800000.0;
    exo_Kp(4,4) = 800000.0;
    exo_Kp(5,5) = 225000.0;
    exo_Kp(6,6) = 225000.0;

    exo_Kd(0,0) = 10.0;
    exo_Kd(1,1) = 10.0;
    exo_Kd(2,2) = 10.0;
    exo_Kd(3,3) = 10.0;
    exo_Kd(4,4) = 10.0;
    exo_Kd(5,5) = 10.0;
    exo_Kd(6,6) = 10.0;


    Eigen::MatrixXd FF_Kp = Eigen::MatrixXd::Ones(6,6);
    Eigen::MatrixXd FF_Kd = Eigen::MatrixXd::Ones(6,6);


    FF_Kp(0,0) = 550.0;
    FF_Kp(1,1) = 550.0;
    FF_Kp(2,2) = 550.0;
    FF_Kp(3,3) = 550.0;
    FF_Kp(4,4) = 550.0;
    FF_Kp(4,4) = 550.0;
    FF_Kp(5,5) = 550.0;


    FF_Kd(0,0) = 60.5;
    FF_Kd(1,1) = 60.5;
    FF_Kd(2,2) = 60.5;
    FF_Kd(3,3) = 60.5;
    FF_Kd(4,4) = 60.5;
    FF_Kd(5,5) = 60.5;
    FF_Kd(5,5) = 60.5;




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



    FES_Kp(0, 0) = 250.0;
    FES_Kp(1, 0) = 100.0;
    FES_Kp(2, 0) =  0.0;
    FES_Kp(5, 0) = 250.0;

    FES_Kp(2, 1) = 200.0;
    FES_Kp(3, 1) = 100.0;
    FES_Kp(4, 1) = 100.0;
    FES_Kp(5, 1) = 200.0;
    FES_Kp(6, 1) = 0.0;

    FES_Kp(6, 2) = 10.0;
    FES_Kp(7, 2) = 10.0;
    FES_Kp(8, 2) = 10.0;


    FES_Kd(0, 0) = 1.8;
    FES_Kd(1, 0) = 1.8;
    FES_Kd(2, 0) = 1.8;
    FES_Kd(5, 0) = 1.8;

    FES_Kd(2, 1) = 1.8;
    FES_Kd(3, 1) = 1.8;
    FES_Kd(4, 1) = 1.8;
    FES_Kd(5, 1) = 0.0;
    FES_Kd(6, 1) = 0.0;

    FES_Kd(6, 2) = 0.0;
    FES_Kd(7, 2) = 0.0;
    FES_Kd(8, 2) = 0.0;



    FES_Kp(0+9, 0+3) = 250.0;
    FES_Kp(1+9, 0+3) = 100.0;
    FES_Kp(2+9, 0+3) =  0.0;
    FES_Kp(5+9, 0+3) = 250.0;

    FES_Kp(2+9, 1+3) = 200.0;
    FES_Kp(3+9, 1+3) = 100.0;
    FES_Kp(4+9, 1+3) = 100.0;
    FES_Kp(5+9, 1+3) = 200.0;
    FES_Kp(6+9, 1+3) = 0.0;

    FES_Kp(6+9, 2+3) = 10.0;
    FES_Kp(7+9, 2+3) = 10.0;
    FES_Kp(8+9, 2+3) = 10.0;


    FES_Kd(0+9, 0+3) = 1.8;
    FES_Kd(1+9, 0+3) = 1.8;
    FES_Kd(2+9, 0+3) = 1.8;
    FES_Kd(5+9, 0+3) = 1.8;

    FES_Kd(2+9, 1+3) = 1.8;
    FES_Kd(3+9, 1+3) = 1.8;
    FES_Kd(4+9, 1+3) = 1.8;
    FES_Kd(5+9, 1+3) = 0.0;
    FES_Kd(6+9, 1+3) = 0.0;

    FES_Kd(6+9, 2+3) = 0.0;
    FES_Kd(7+9, 2+3) = 0.0;
    FES_Kd(8+9, 2+3) = 0.0;
//

    Eigen::MatrixXd Kp0 = Eigen::MatrixXd::Zero(7,7);
    Eigen::MatrixXd Kd0 = Eigen::MatrixXd::Zero(7,7);


    ControllerManager manager = ControllerManager(&n);
    PDController exo(exo_Kp, exo_Kd);
    PDController human(FF_Kp, FF_Kd);
    PDController NoGains(Kp0, Kd0);
    boost::shared_ptr<ControllerBase> Dyn_controller(new  DynController("exo", &n, &exo) );
    boost::shared_ptr<ControllerBase> NoGainsController(new  DynController("exo", &n, &NoGains  ) );
    boost::shared_ptr<ControllerBase> Human_controller(new DynController("human", &n, &human ) );
    boost::shared_ptr<ControllerBase> FES_controller(new  PDController(FES_Kp, FES_Kd ) );


    manager.addController("Dyn", Dyn_controller);
    manager.addController("NoGains", NoGainsController);
    manager.addController("HumanPD", Human_controller);
    manager.addController("FES", FES_controller);

    ros::spin();

    return 0;
}
