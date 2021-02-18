#include "ros/ros.h"
#include "Eigen/Core"
#include "rbdl_server/RBDLServer.h"
#include "rbdl_server/RBDLModel.h"
#include "rbdl_server/RBDLBodyNames.h"
#include "rbdl_server/RBDLInverseDynamics.h"
#include "rbdl_server/RBDLModelAlignment.h"
#include "boost/shared_ptr.hpp"
#include "ambf_client/ambf_client.h"

int main(int argc, char **argv)
{
    ros::init(argc, argv, "Main");
    

    const std::string actuator_config_file = "/home/nathanielgoldfarb/catkin_ws/src/ambf_controller_testing/model/exo/default.yaml";
    
    Client client;
    client.connect();
    usleep(10000);
    ros::NodeHandle n;
    rigidBodyPtr handler;
    ros::Rate rate(1000);    
    handler = client.getRigidBody("ExoHip", true);

    return 0;
}
