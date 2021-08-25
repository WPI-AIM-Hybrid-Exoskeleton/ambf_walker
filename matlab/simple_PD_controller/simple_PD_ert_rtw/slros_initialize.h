#ifndef _SLROS_INITIALIZE_H_
#define _SLROS_INITIALIZE_H_

#include "slros_busmsg_conversion.h"
#include "slros_generic.h"
#include "slros_time.h"

extern ros::NodeHandle * SLROSNodePtr;
extern const std::string SLROSNodeName;

// For Block simple_PD/Subscribe1
extern SimulinkSubscriber<sensor_msgs::JointState, SL_Bus_simple_PD_sensor_msgs_JointState> Sub_simple_PD_32;

// For Block simple_PD/Subscribe4
extern SimulinkSubscriber<std_msgs::Bool, SL_Bus_simple_PD_std_msgs_Bool> Sub_simple_PD_34;

// For Block simple_PD/Controller/Publish1
extern SimulinkPublisher<std_msgs::Bool, SL_Bus_simple_PD_std_msgs_Bool> Pub_simple_PD_189;

// For Block simple_PD/Controller/Publish2
extern SimulinkPublisher<sensor_msgs::JointState, SL_Bus_simple_PD_sensor_msgs_JointState> Pub_simple_PD_190;

// For Block simple_PD/Controller/human controller/Publish
extern SimulinkPublisher<std_msgs::Float32MultiArray, SL_Bus_simple_PD_std_msgs_Float32MultiArray> Pub_simple_PD_271;

// For Block simple_PD/Enabled Subsystem/Publish1
extern SimulinkPublisher<sensor_msgs::JointState, SL_Bus_simple_PD_sensor_msgs_JointState> Pub_simple_PD_15;

void slros_node_init(int argc, char** argv);

#endif
