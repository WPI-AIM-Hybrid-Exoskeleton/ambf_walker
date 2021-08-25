#ifndef _SLROS_BUSMSG_CONVERSION_H_
#define _SLROS_BUSMSG_CONVERSION_H_

#include <ros/ros.h>
#include <rbdl_server/RBDLInverseDynamics.h>
#include <std_srvs/SetBool.h>
#include <ambf_walker/DesiredJoints.h>
#include <rbdl_server/RBDLInverseDynamicsRequest.h>
#include <rbdl_server/RBDLInverseDynamicsResponse.h>
#include <ros/time.h>
#include <sensor_msgs/JointState.h>
#include <std_msgs/Bool.h>
#include <std_msgs/Float32.h>
#include <std_msgs/Header.h>
#include <std_srvs/SetBoolRequest.h>
#include <std_srvs/SetBoolResponse.h>
#include "sliding_controller_const_types.h"
#include "slros_msgconvert_utils.h"


void convertFromBus(ambf_walker::DesiredJoints* msgPtr, SL_Bus_sliding_controller_const_ambf_walker_DesiredJoints const* busPtr);
void convertToBus(SL_Bus_sliding_controller_const_ambf_walker_DesiredJoints* busPtr, ambf_walker::DesiredJoints const* msgPtr);

void convertFromBus(rbdl_server::RBDLInverseDynamicsRequest* msgPtr, SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9pm1f const* busPtr);
void convertToBus(SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9pm1f* busPtr, rbdl_server::RBDLInverseDynamicsRequest const* msgPtr);

void convertFromBus(rbdl_server::RBDLInverseDynamicsResponse* msgPtr, SL_Bus_sliding_controller_const_RBDLInverseDynamicsRespon_g20gt const* busPtr);
void convertToBus(SL_Bus_sliding_controller_const_RBDLInverseDynamicsRespon_g20gt* busPtr, rbdl_server::RBDLInverseDynamicsResponse const* msgPtr);

void convertFromBus(ros::Time* msgPtr, SL_Bus_sliding_controller_const_ros_time_Time const* busPtr);
void convertToBus(SL_Bus_sliding_controller_const_ros_time_Time* busPtr, ros::Time const* msgPtr);

void convertFromBus(sensor_msgs::JointState* msgPtr, SL_Bus_sliding_controller_const_sensor_msgs_JointState const* busPtr);
void convertToBus(SL_Bus_sliding_controller_const_sensor_msgs_JointState* busPtr, sensor_msgs::JointState const* msgPtr);

void convertFromBus(std_msgs::Bool* msgPtr, SL_Bus_sliding_controller_const_std_msgs_Bool const* busPtr);
void convertToBus(SL_Bus_sliding_controller_const_std_msgs_Bool* busPtr, std_msgs::Bool const* msgPtr);

void convertFromBus(std_msgs::Float32* msgPtr, SL_Bus_sliding_controller_const_std_msgs_Float32 const* busPtr);
void convertToBus(SL_Bus_sliding_controller_const_std_msgs_Float32* busPtr, std_msgs::Float32 const* msgPtr);

void convertFromBus(std_msgs::Header* msgPtr, SL_Bus_sliding_controller_const_std_msgs_Header const* busPtr);
void convertToBus(SL_Bus_sliding_controller_const_std_msgs_Header* busPtr, std_msgs::Header const* msgPtr);

void convertFromBus(std_srvs::SetBoolRequest* msgPtr, SL_Bus_sliding_controller_const_std_srvs_SetBoolRequest const* busPtr);
void convertToBus(SL_Bus_sliding_controller_const_std_srvs_SetBoolRequest* busPtr, std_srvs::SetBoolRequest const* msgPtr);

void convertFromBus(std_srvs::SetBoolResponse* msgPtr, SL_Bus_sliding_controller_const_std_srvs_SetBoolResponse const* busPtr);
void convertToBus(SL_Bus_sliding_controller_const_std_srvs_SetBoolResponse* busPtr, std_srvs::SetBoolResponse const* msgPtr);


#endif
