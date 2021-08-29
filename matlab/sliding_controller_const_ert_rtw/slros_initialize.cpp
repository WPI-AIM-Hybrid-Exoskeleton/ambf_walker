#include "slros_initialize.h"

ros::NodeHandle * SLROSNodePtr;
const std::string SLROSNodeName = "sliding_controller_const";

// For Block sliding_controller_const/Subscribe
SimulinkSubscriber<ambf_walker::DesiredJoints, SL_Bus_sliding_controller_const_ambf_walker_DesiredJoints> Sub_sliding_controller_const_35;

// For Block sliding_controller_const/Subscribe1
SimulinkSubscriber<sensor_msgs::JointState, SL_Bus_sliding_controller_const_sensor_msgs_JointState> Sub_sliding_controller_const_1262;

// For Block sliding_controller_const/Subscribe2
SimulinkSubscriber<sensor_msgs::JointState, SL_Bus_sliding_controller_const_sensor_msgs_JointState> Sub_sliding_controller_const_1277;

// For Block sliding_controller_const/Subscribe4
SimulinkSubscriber<std_msgs::Bool, SL_Bus_sliding_controller_const_std_msgs_Bool> Sub_sliding_controller_const_1418;

// For Block sliding_controller_const/Controller/Publish1
SimulinkPublisher<std_msgs::Bool, SL_Bus_sliding_controller_const_std_msgs_Bool> Pub_sliding_controller_const_1405;

// For Block sliding_controller_const/Controller/Publish2
SimulinkPublisher<sensor_msgs::JointState, SL_Bus_sliding_controller_const_sensor_msgs_JointState> Pub_sliding_controller_const_1454;

// For Block sliding_controller_const/Enabled Subsystem/Publish1
SimulinkPublisher<sensor_msgs::JointState, SL_Bus_sliding_controller_const_sensor_msgs_JointState> Pub_sliding_controller_const_1242;

// For Block sliding_controller_const/Enabled Subsystem/Publish2
SimulinkPublisher<sensor_msgs::JointState, SL_Bus_sliding_controller_const_sensor_msgs_JointState> Pub_sliding_controller_const_1246;

// For Block sliding_controller_const/Publish
SimulinkPublisher<std_msgs::Float64, SL_Bus_sliding_controller_const_std_msgs_Float64> Pub_sliding_controller_const_1177;

// For Block sliding_controller_const/Controller/sliding mode controller/Call Service
SimulinkServiceCaller<rbdl_server::RBDLInverseDynamics, SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9pm1f, SL_Bus_sliding_controller_const_RBDLInverseDynamicsRespon_g20gt> ServCall_sliding_controller_const_1160;

// For Block sliding_controller_const/Subsystem1/If Action Subsystem/Call Service
SimulinkServiceCaller<std_srvs::SetBool, SL_Bus_sliding_controller_const_std_srvs_SetBoolRequest, SL_Bus_sliding_controller_const_std_srvs_SetBoolResponse> ServCall_sliding_controller_const_47;

// For Block sliding_controller_const/Subsystem1/If Action Subsystem/Call Service1
SimulinkServiceCaller<std_srvs::SetBool, SL_Bus_sliding_controller_const_std_srvs_SetBoolRequest, SL_Bus_sliding_controller_const_std_srvs_SetBoolResponse> ServCall_sliding_controller_const_48;

void slros_node_init(int argc, char** argv)
{
  ros::init(argc, argv, SLROSNodeName);
  SLROSNodePtr = new ros::NodeHandle();
}

