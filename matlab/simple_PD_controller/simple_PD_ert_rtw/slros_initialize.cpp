#include "slros_initialize.h"

ros::NodeHandle * SLROSNodePtr;
const std::string SLROSNodeName = "simple_PD";

// For Block simple_PD/Subscribe1
SimulinkSubscriber<sensor_msgs::JointState, SL_Bus_simple_PD_sensor_msgs_JointState> Sub_simple_PD_32;

// For Block simple_PD/Subscribe4
SimulinkSubscriber<std_msgs::Bool, SL_Bus_simple_PD_std_msgs_Bool> Sub_simple_PD_34;

// For Block simple_PD/Controller/Publish1
SimulinkPublisher<std_msgs::Bool, SL_Bus_simple_PD_std_msgs_Bool> Pub_simple_PD_189;

// For Block simple_PD/Controller/Publish2
SimulinkPublisher<sensor_msgs::JointState, SL_Bus_simple_PD_sensor_msgs_JointState> Pub_simple_PD_190;

// For Block simple_PD/Controller/human controller/Publish
SimulinkPublisher<std_msgs::Float32MultiArray, SL_Bus_simple_PD_std_msgs_Float32MultiArray> Pub_simple_PD_271;

// For Block simple_PD/Enabled Subsystem/Publish1
SimulinkPublisher<sensor_msgs::JointState, SL_Bus_simple_PD_sensor_msgs_JointState> Pub_simple_PD_15;

void slros_node_init(int argc, char** argv)
{
  ros::init(argc, argv, SLROSNodeName);
  SLROSNodePtr = new ros::NodeHandle();
}

