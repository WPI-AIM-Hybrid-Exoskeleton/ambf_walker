/*
 * sliding_controller2_types.h
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "sliding_controller2".
 *
 * Model version              : 1.153
 * Simulink Coder version : 9.5 (R2021a) 14-Nov-2020
 * C++ source code generated on : Sat May 29 16:26:29 2021
 *
 * Target selection: ert.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Generic->Unspecified (assume 32-bit Generic)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_sliding_controller2_types_h_
#define RTW_HEADER_sliding_controller2_types_h_
#include "rtwtypes.h"
#include "multiword_types.h"

/* Model Code Variants */
#ifndef DEFINED_TYPEDEF_FOR_SL_Bus_sliding_controller2_ros_time_Time_
#define DEFINED_TYPEDEF_FOR_SL_Bus_sliding_controller2_ros_time_Time_

struct SL_Bus_sliding_controller2_ros_time_Time
{
  real_T Sec;
  real_T Nsec;
};

#endif

#ifndef DEFINED_TYPEDEF_FOR_SL_Bus_ROSVariableLengthArrayInfo_
#define DEFINED_TYPEDEF_FOR_SL_Bus_ROSVariableLengthArrayInfo_

struct SL_Bus_ROSVariableLengthArrayInfo
{
  uint32_T CurrentLength;
  uint32_T ReceivedLength;
};

#endif

#ifndef DEFINED_TYPEDEF_FOR_SL_Bus_sliding_controller2_std_msgs_Header_
#define DEFINED_TYPEDEF_FOR_SL_Bus_sliding_controller2_std_msgs_Header_

struct SL_Bus_sliding_controller2_std_msgs_Header
{
  uint32_T Seq;
  SL_Bus_sliding_controller2_ros_time_Time Stamp;
  uint8_T FrameId[128];
  SL_Bus_ROSVariableLengthArrayInfo FrameId_SL_Info;
};

#endif

#ifndef DEFINED_TYPEDEF_FOR_SL_Bus_sliding_controller2_std_msgs_String_
#define DEFINED_TYPEDEF_FOR_SL_Bus_sliding_controller2_std_msgs_String_

struct SL_Bus_sliding_controller2_std_msgs_String
{
  uint8_T Data[128];
  SL_Bus_ROSVariableLengthArrayInfo Data_SL_Info;
};

#endif

#ifndef DEFINED_TYPEDEF_FOR_SL_Bus_sliding_controller2_sensor_msgs_JointState_
#define DEFINED_TYPEDEF_FOR_SL_Bus_sliding_controller2_sensor_msgs_JointState_

struct SL_Bus_sliding_controller2_sensor_msgs_JointState
{
  SL_Bus_sliding_controller2_std_msgs_Header Header;
  SL_Bus_sliding_controller2_std_msgs_String Name[16];
  SL_Bus_ROSVariableLengthArrayInfo Name_SL_Info;
  real_T Position[7];
  SL_Bus_ROSVariableLengthArrayInfo Position_SL_Info;
  real_T Velocity[7];
  SL_Bus_ROSVariableLengthArrayInfo Velocity_SL_Info;
  real_T Effort[7];
  SL_Bus_ROSVariableLengthArrayInfo Effort_SL_Info;
};

#endif

#ifndef DEFINED_TYPEDEF_FOR_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex_
#define DEFINED_TYPEDEF_FOR_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex_

struct SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex
{
  uint8_T ModelName;
  SL_Bus_ROSVariableLengthArrayInfo ModelName_SL_Info;
  real_T Q[7];
  SL_Bus_ROSVariableLengthArrayInfo Q_SL_Info;
  real_T Qd[7];
  SL_Bus_ROSVariableLengthArrayInfo Qd_SL_Info;
  real_T Qdd[7];
  SL_Bus_ROSVariableLengthArrayInfo Qdd_SL_Info;
};

#endif

#ifndef DEFINED_TYPEDEF_FOR_SL_Bus_sliding_controller2_RBDLInverseDynamicsRespon_9vsb2h_
#define DEFINED_TYPEDEF_FOR_SL_Bus_sliding_controller2_RBDLInverseDynamicsRespon_9vsb2h_

struct SL_Bus_sliding_controller2_RBDLInverseDynamicsRespon_9vsb2h
{
  real_T Tau[7];
  SL_Bus_ROSVariableLengthArrayInfo Tau_SL_Info;
};

#endif

#ifndef DEFINED_TYPEDEF_FOR_SL_Bus_sliding_controller2_ambf_walker_DesiredJoints_
#define DEFINED_TYPEDEF_FOR_SL_Bus_sliding_controller2_ambf_walker_DesiredJoints_

struct SL_Bus_sliding_controller2_ambf_walker_DesiredJoints
{
  SL_Bus_sliding_controller2_std_msgs_Header Header;
  real_T Q[7];
  SL_Bus_ROSVariableLengthArrayInfo Q_SL_Info;
  real_T Qd[7];
  SL_Bus_ROSVariableLengthArrayInfo Qd_SL_Info;
  real_T Qdd[7];
  SL_Bus_ROSVariableLengthArrayInfo Qdd_SL_Info;
  real_T Other[7];
  SL_Bus_ROSVariableLengthArrayInfo Other_SL_Info;
  uint8_T Controller[8];
  SL_Bus_ROSVariableLengthArrayInfo Controller_SL_Info;
};

#endif

#ifndef struct_ros_slroscpp_internal_block_S_T
#define struct_ros_slroscpp_internal_block_S_T

struct ros_slroscpp_internal_block_S_T
{
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
};

#endif                              /* struct_ros_slroscpp_internal_block_S_T */

#ifndef struct_ros_slroscpp_internal_block_P_T
#define struct_ros_slroscpp_internal_block_P_T

struct ros_slroscpp_internal_block_P_T
{
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
};

#endif                              /* struct_ros_slroscpp_internal_block_P_T */

#ifndef struct_ExampleHelperSimulationRateCo_T
#define struct_ExampleHelperSimulationRateCo_T

struct ExampleHelperSimulationRateCo_T
{
  int32_T isInitialized;
};

#endif                              /* struct_ExampleHelperSimulationRateCo_T */

#ifndef struct_ros_slroscpp_internal_block_k_T
#define struct_ros_slroscpp_internal_block_k_T

struct ros_slroscpp_internal_block_k_T
{
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
};

#endif                              /* struct_ros_slroscpp_internal_block_k_T */

#ifndef typedef_c_ros_slros_internal_block_Se_T
#define typedef_c_ros_slros_internal_block_Se_T

typedef uint8_T c_ros_slros_internal_block_Se_T;

#endif                             /* typedef_c_ros_slros_internal_block_Se_T */

#ifndef ros_slros_internal_block_ServiceCallErrorCode_constants
#define ros_slros_internal_block_ServiceCallErrorCode_constants

/* enum ros_slros_internal_block_ServiceCallErrorCode */
const c_ros_slros_internal_block_Se_T SLSuccess = 0U;
const c_ros_slros_internal_block_Se_T SLConnectionTimeout = 1U;
const c_ros_slros_internal_block_Se_T SLCallFailure = 2U;
const c_ros_slros_internal_block_Se_T SLOtherError = 3U;

#endif             /* ros_slros_internal_block_ServiceCallErrorCode_constants */

/* Parameters for system: '<S10>/Enabled Subsystem' */
typedef struct P_EnabledSubsystem_sliding_co_T_ P_EnabledSubsystem_sliding_co_T;

/* Parameters (default storage) */
typedef struct P_sliding_controller2_T_ P_sliding_controller2_T;

/* Forward declaration for rtModel */
typedef struct tag_RTM_sliding_controller2_T RT_MODEL_sliding_controller2_T;

#endif                             /* RTW_HEADER_sliding_controller2_types_h_ */
