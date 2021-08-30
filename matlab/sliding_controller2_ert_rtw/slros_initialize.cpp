#include "slros_initialize.h"

ros::NodeHandle * SLROSNodePtr;
const std::string SLROSNodeName = "sliding_controller2";

// For Block sliding_controller2/Subscribe
SimulinkSubscriber<ambf_walker::DesiredJoints, SL_Bus_sliding_controller2_ambf_walker_DesiredJoints> Sub_sliding_controller2_35;

// For Block sliding_controller2/Subscribe1
SimulinkSubscriber<sensor_msgs::JointState, SL_Bus_sliding_controller2_sensor_msgs_JointState> Sub_sliding_controller2_1262;

// For Block sliding_controller2/Subscribe2
SimulinkSubscriber<sensor_msgs::JointState, SL_Bus_sliding_controller2_sensor_msgs_JointState> Sub_sliding_controller2_1277;

// For Block sliding_controller2/Subscribe4
SimulinkSubscriber<std_msgs::Bool, SL_Bus_sliding_controller2_std_msgs_Bool> Sub_sliding_controller2_1418;

// For Block sliding_controller2/Controller/Publish1
SimulinkPublisher<std_msgs::Bool, SL_Bus_sliding_controller2_std_msgs_Bool> Pub_sliding_controller2_1405;

// For Block sliding_controller2/Controller/Publish2
SimulinkPublisher<sensor_msgs::JointState, SL_Bus_sliding_controller2_sensor_msgs_JointState> Pub_sliding_controller2_1454;

// For Block sliding_controller2/Enabled Subsystem/Publish1
SimulinkPublisher<sensor_msgs::JointState, SL_Bus_sliding_controller2_sensor_msgs_JointState> Pub_sliding_controller2_1242;

// For Block sliding_controller2/Enabled Subsystem/Publish2
SimulinkPublisher<sensor_msgs::JointState, SL_Bus_sliding_controller2_sensor_msgs_JointState> Pub_sliding_controller2_1246;

// For Block sliding_controller2/Publish
SimulinkPublisher<std_msgs::Float64, SL_Bus_sliding_controller2_std_msgs_Float64> Pub_sliding_controller2_1177;

// For Block sliding_controller2/Controller/sliding mode controller/Call Service1
SimulinkServiceCaller<ambf_walker::DesiredJointsCmd, SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz, SL_Bus_sliding_controller2_DesiredJointsCmdResponse_df4541> ServCall_sliding_controller2_1472;

// For Block sliding_controller2/Subsystem1/If Action Subsystem/Call Service
SimulinkServiceCaller<std_srvs::SetBool, SL_Bus_sliding_controller2_std_srvs_SetBoolRequest, SL_Bus_sliding_controller2_std_srvs_SetBoolResponse> ServCall_sliding_controller2_47;

// For Block sliding_controller2/Subsystem1/If Action Subsystem/Call Service1
SimulinkServiceCaller<std_srvs::SetBool, SL_Bus_sliding_controller2_std_srvs_SetBoolRequest, SL_Bus_sliding_controller2_std_srvs_SetBoolResponse> ServCall_sliding_controller2_48;

void slros_node_init(int argc, char** argv)
{
  ros::init(argc, argv, SLROSNodeName);
  SLROSNodePtr = new ros::NodeHandle();
}

