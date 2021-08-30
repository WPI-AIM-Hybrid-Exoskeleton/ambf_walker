#ifndef _SLROS_BUSMSG_CONVERSION_H_
#define _SLROS_BUSMSG_CONVERSION_H_

#include <ros/ros.h>
#include <ambf_walker/DesiredJointsCmd.h>
#include <std_srvs/SetBool.h>
#include <ambf_walker/DesiredJoints.h>
#include <ambf_walker/DesiredJointsCmdRequest.h>
#include <ambf_walker/DesiredJointsCmdResponse.h>
#include <rbdl_server/RBDLInverseDynamicsRequest.h>
#include <ros/time.h>
#include <sensor_msgs/JointState.h>
#include <std_msgs/Bool.h>
#include <std_msgs/Float64.h>
#include <std_msgs/Header.h>
#include <std_srvs/SetBoolRequest.h>
#include <std_srvs/SetBoolResponse.h>
#include "sliding_controller2_types.h"
#include "slros_msgconvert_utils.h"


void convertFromBus(ambf_walker::DesiredJoints* msgPtr, SL_Bus_sliding_controller2_ambf_walker_DesiredJoints const* busPtr);
void convertToBus(SL_Bus_sliding_controller2_ambf_walker_DesiredJoints* busPtr, ambf_walker::DesiredJoints const* msgPtr);

void convertFromBus(ambf_walker::DesiredJointsCmdRequest* msgPtr, SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz const* busPtr);
void convertToBus(SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz* busPtr, ambf_walker::DesiredJointsCmdRequest const* msgPtr);

void convertFromBus(ambf_walker::DesiredJointsCmdResponse* msgPtr, SL_Bus_sliding_controller2_DesiredJointsCmdResponse_df4541 const* busPtr);
void convertToBus(SL_Bus_sliding_controller2_DesiredJointsCmdResponse_df4541* busPtr, ambf_walker::DesiredJointsCmdResponse const* msgPtr);

void convertFromBus(rbdl_server::RBDLInverseDynamicsRequest* msgPtr, SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex const* busPtr);
void convertToBus(SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex* busPtr, rbdl_server::RBDLInverseDynamicsRequest const* msgPtr);

void convertFromBus(ros::Time* msgPtr, SL_Bus_sliding_controller2_ros_time_Time const* busPtr);
void convertToBus(SL_Bus_sliding_controller2_ros_time_Time* busPtr, ros::Time const* msgPtr);

void convertFromBus(sensor_msgs::JointState* msgPtr, SL_Bus_sliding_controller2_sensor_msgs_JointState const* busPtr);
void convertToBus(SL_Bus_sliding_controller2_sensor_msgs_JointState* busPtr, sensor_msgs::JointState const* msgPtr);

void convertFromBus(std_msgs::Bool* msgPtr, SL_Bus_sliding_controller2_std_msgs_Bool const* busPtr);
void convertToBus(SL_Bus_sliding_controller2_std_msgs_Bool* busPtr, std_msgs::Bool const* msgPtr);

void convertFromBus(std_msgs::Float64* msgPtr, SL_Bus_sliding_controller2_std_msgs_Float64 const* busPtr);
void convertToBus(SL_Bus_sliding_controller2_std_msgs_Float64* busPtr, std_msgs::Float64 const* msgPtr);

void convertFromBus(std_msgs::Header* msgPtr, SL_Bus_sliding_controller2_std_msgs_Header const* busPtr);
void convertToBus(SL_Bus_sliding_controller2_std_msgs_Header* busPtr, std_msgs::Header const* msgPtr);

void convertFromBus(std_srvs::SetBoolRequest* msgPtr, SL_Bus_sliding_controller2_std_srvs_SetBoolRequest const* busPtr);
void convertToBus(SL_Bus_sliding_controller2_std_srvs_SetBoolRequest* busPtr, std_srvs::SetBoolRequest const* msgPtr);

void convertFromBus(std_srvs::SetBoolResponse* msgPtr, SL_Bus_sliding_controller2_std_srvs_SetBoolResponse const* busPtr);
void convertToBus(SL_Bus_sliding_controller2_std_srvs_SetBoolResponse* busPtr, std_srvs::SetBoolResponse const* msgPtr);


#endif
