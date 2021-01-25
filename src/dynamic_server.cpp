 #include "ros/ros.h"


#include "Eigen/Core"
#include "rbdl_server/RBDLServer.h"
#include "boost/shared_ptr.hpp"

int main(int argc, char **argv)
{
    ros::init(argc, argv, "Dynamic_Server");
    ros::NodeHandle n;
   
    RBDLServer my_server(&n);       

    ros::spin();

    return 0;
}
