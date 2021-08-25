#ifndef _SLROS_BUSMSG_CONVERSION_H_
#define _SLROS_BUSMSG_CONVERSION_H_

#include <ros/ros.h>
#include <ros/time.h>
#include <sensor_msgs/JointState.h>
#include <std_msgs/Bool.h>
#include <std_msgs/Float32MultiArray.h>
#include <std_msgs/Header.h>
#include <std_msgs/MultiArrayDimension.h>
#include <std_msgs/MultiArrayLayout.h>
#include "simple_PD_types.h"
#include "slros_msgconvert_utils.h"


void convertFromBus(ros::Time* msgPtr, SL_Bus_simple_PD_ros_time_Time const* busPtr);
void convertToBus(SL_Bus_simple_PD_ros_time_Time* busPtr, ros::Time const* msgPtr);

void convertFromBus(sensor_msgs::JointState* msgPtr, SL_Bus_simple_PD_sensor_msgs_JointState const* busPtr);
void convertToBus(SL_Bus_simple_PD_sensor_msgs_JointState* busPtr, sensor_msgs::JointState const* msgPtr);

void convertFromBus(std_msgs::Bool* msgPtr, SL_Bus_simple_PD_std_msgs_Bool const* busPtr);
void convertToBus(SL_Bus_simple_PD_std_msgs_Bool* busPtr, std_msgs::Bool const* msgPtr);

void convertFromBus(std_msgs::Float32MultiArray* msgPtr, SL_Bus_simple_PD_std_msgs_Float32MultiArray const* busPtr);
void convertToBus(SL_Bus_simple_PD_std_msgs_Float32MultiArray* busPtr, std_msgs::Float32MultiArray const* msgPtr);

void convertFromBus(std_msgs::Header* msgPtr, SL_Bus_simple_PD_std_msgs_Header const* busPtr);
void convertToBus(SL_Bus_simple_PD_std_msgs_Header* busPtr, std_msgs::Header const* msgPtr);

void convertFromBus(std_msgs::MultiArrayDimension* msgPtr, SL_Bus_simple_PD_std_msgs_MultiArrayDimension const* busPtr);
void convertToBus(SL_Bus_simple_PD_std_msgs_MultiArrayDimension* busPtr, std_msgs::MultiArrayDimension const* msgPtr);

void convertFromBus(std_msgs::MultiArrayLayout* msgPtr, SL_Bus_simple_PD_std_msgs_MultiArrayLayout const* busPtr);
void convertToBus(SL_Bus_simple_PD_std_msgs_MultiArrayLayout* busPtr, std_msgs::MultiArrayLayout const* msgPtr);


#endif
