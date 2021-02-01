 #include "ros/ros.h"
#include "Eigen/Core"
#include "rbdl_server/RBDLServer.h"
#include "boost/shared_ptr.hpp"
#include "controller_modules/ControllerManager.h"
#include "controller_modules/PDController.h"
#include "controller_modules/JointControl.h"
#include "controller_modules/ControllerBase.h"

int main(int argc, char **argv)
{
    ros::init(argc, argv, "Dynamic_Server");
    ros::NodeHandle n;
   
    RBDLServer my_server(&n);       

    ros::spin();

    return 0;
}
