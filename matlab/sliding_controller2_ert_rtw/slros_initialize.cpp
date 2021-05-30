#include "slros_initialize.h"

ros::NodeHandle * SLROSNodePtr;
const std::string SLROSNodeName = "sliding_controller2";

// For Block sliding_controller2/Subscribe
SimulinkSubscriber<ambf_walker::DesiredJoints, SL_Bus_sliding_controller2_ambf_walker_DesiredJoints> Sub_sliding_controller2_35;

// For Block sliding_controller2/Subscribe1
SimulinkSubscriber<sensor_msgs::JointState, SL_Bus_sliding_controller2_sensor_msgs_JointState> Sub_sliding_controller2_1262;

// For Block sliding_controller2/Subscribe2
SimulinkSubscriber<sensor_msgs::JointState, SL_Bus_sliding_controller2_sensor_msgs_JointState> Sub_sliding_controller2_1277;

// For Block sliding_controller2/Enabled Subsystem/Publish1
SimulinkPublisher<sensor_msgs::JointState, SL_Bus_sliding_controller2_sensor_msgs_JointState> Pub_sliding_controller2_1242;

// For Block sliding_controller2/Enabled Subsystem/Publish2
SimulinkPublisher<sensor_msgs::JointState, SL_Bus_sliding_controller2_sensor_msgs_JointState> Pub_sliding_controller2_1246;

// For Block sliding_controller2/Publish
SimulinkPublisher<std_msgs::Float32, SL_Bus_sliding_controller2_std_msgs_Float32> Pub_sliding_controller2_1177;

// For Block sliding_controller2/Controller/sliding mode controller/Call Service
SimulinkServiceCaller<rbdl_server::RBDLInverseDynamics, SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex, SL_Bus_sliding_controller2_RBDLInverseDynamicsRespon_9vsb2h> ServCall_sliding_controller2_1160;

void slros_node_init(int argc, char** argv)
{
  ros::init(argc, argv, SLROSNodeName);
  SLROSNodePtr = new ros::NodeHandle();
}

