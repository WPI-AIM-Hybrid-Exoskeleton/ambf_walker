#ifndef _SLROS_INITIALIZE_H_
#define _SLROS_INITIALIZE_H_

#include "slros_busmsg_conversion.h"
#include "slros_generic.h"
#include "slros_time.h"
#include "slros_generic_service.h"

extern ros::NodeHandle * SLROSNodePtr;
extern const std::string SLROSNodeName;

// For Block sliding_controller_const/Subscribe
extern SimulinkSubscriber<ambf_walker::DesiredJoints, SL_Bus_sliding_controller_const_ambf_walker_DesiredJoints> Sub_sliding_controller_const_35;

// For Block sliding_controller_const/Subscribe1
extern SimulinkSubscriber<sensor_msgs::JointState, SL_Bus_sliding_controller_const_sensor_msgs_JointState> Sub_sliding_controller_const_1262;

// For Block sliding_controller_const/Subscribe2
extern SimulinkSubscriber<sensor_msgs::JointState, SL_Bus_sliding_controller_const_sensor_msgs_JointState> Sub_sliding_controller_const_1277;

// For Block sliding_controller_const/Subscribe4
extern SimulinkSubscriber<std_msgs::Bool, SL_Bus_sliding_controller_const_std_msgs_Bool> Sub_sliding_controller_const_1418;

// For Block sliding_controller_const/Controller/Publish1
extern SimulinkPublisher<std_msgs::Bool, SL_Bus_sliding_controller_const_std_msgs_Bool> Pub_sliding_controller_const_1405;

// For Block sliding_controller_const/Controller/Publish2
extern SimulinkPublisher<sensor_msgs::JointState, SL_Bus_sliding_controller_const_sensor_msgs_JointState> Pub_sliding_controller_const_1454;

// For Block sliding_controller_const/Enabled Subsystem/Publish1
extern SimulinkPublisher<sensor_msgs::JointState, SL_Bus_sliding_controller_const_sensor_msgs_JointState> Pub_sliding_controller_const_1242;

// For Block sliding_controller_const/Enabled Subsystem/Publish2
extern SimulinkPublisher<sensor_msgs::JointState, SL_Bus_sliding_controller_const_sensor_msgs_JointState> Pub_sliding_controller_const_1246;

// For Block sliding_controller_const/Publish
extern SimulinkPublisher<std_msgs::Float64, SL_Bus_sliding_controller_const_std_msgs_Float64> Pub_sliding_controller_const_1177;

// For Block sliding_controller_const/Controller/sliding mode controller/Call Service
extern SimulinkServiceCaller<rbdl_server::RBDLInverseDynamics, SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9pm1f, SL_Bus_sliding_controller_const_RBDLInverseDynamicsRespon_g20gt> ServCall_sliding_controller_const_1160;

// For Block sliding_controller_const/Subsystem1/If Action Subsystem/Call Service
extern SimulinkServiceCaller<std_srvs::SetBool, SL_Bus_sliding_controller_const_std_srvs_SetBoolRequest, SL_Bus_sliding_controller_const_std_srvs_SetBoolResponse> ServCall_sliding_controller_const_47;

// For Block sliding_controller_const/Subsystem1/If Action Subsystem/Call Service1
extern SimulinkServiceCaller<std_srvs::SetBool, SL_Bus_sliding_controller_const_std_srvs_SetBoolRequest, SL_Bus_sliding_controller_const_std_srvs_SetBoolResponse> ServCall_sliding_controller_const_48;

void slros_node_init(int argc, char** argv);

#endif
