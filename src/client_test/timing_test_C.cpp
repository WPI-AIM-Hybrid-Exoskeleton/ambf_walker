
#include "ros/ros.h"
#include "controller_modules/ControllerManager.h"
#include "controller_modules/PDController.h"
#include "controller_modules/JointControl.h"
#include "Eigen/Core"
#include "rbdl_server/RBDLServer.h"
#include "rbdl_server/RBDLModel.h"
#include "rbdl_server/RBDLInverseDynamics.h"
#include "boost/shared_ptr.hpp"
#include "ambf_client/ambf_client.h"
#include <vector>
#include "ambf_msgs/ActuatorCmd.h"

#include "std_msgs/Float32MultiArray.h"
#include "boost/accumulators/accumulators.hpp"
#include <iostream>
#include "std_msgs/Float32.h"


using namespace boost::accumulators;

int main(int argc, char* argv[])
{     
    const std::string actuator_config_file = "/home/nathanielgoldfarb/catkin_ws/src/ambf_controller_testing/model/kuka2/default.yaml";
    
    Client client;
    client.connect();
    usleep(10000);
    ros::NodeHandle n;
    rigidBodyPtr handler;
    ros::Rate rate(1000);    
    handler = client.getRigidBody("base", true);
    usleep(1000000);
    std::vector<double> time_total;
    int count = 0;
    int total = 1000000; 
    std::vector<float> q,qd;
    std::vector<float> tau = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    double start_time;
    std_msgs::Float32 dt_msg;
    ros::Publisher dt_pub = n.advertise<std_msgs::Float32>("dt", 1);

    while(count<total)
    {   
        start_time = ros::Time::now().toSec();
        q = handler->get_all_joint_pos();
        qd = handler->get_all_joint_vel();
        handler->set_all_joint_effort(tau);
        dt_msg.data = ros::Time::now().toSec() - start_time;
        dt_pub.publish(dt_msg); 
        count++;
        rate.sleep();
        ros::spinOnce();
        
    }


    client.cleanUp();

}