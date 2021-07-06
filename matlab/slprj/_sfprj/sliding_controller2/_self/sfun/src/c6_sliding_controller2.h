#ifndef __c6_sliding_controller2_h__
#define __c6_sliding_controller2_h__

/* Forward Declarations */
#ifndef typedef_c6_SL_Bus_sliding_controller2_ros_time_Time
#define typedef_c6_SL_Bus_sliding_controller2_ros_time_Time

typedef struct c6_SL_Bus_sliding_controller2_ros_time_Time_tag
  c6_SL_Bus_sliding_controller2_ros_time_Time;

#endif                                 /* typedef_c6_SL_Bus_sliding_controller2_ros_time_Time */

#ifndef typedef_c6_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c6_SL_Bus_ROSVariableLengthArrayInfo

typedef struct c6_SL_Bus_ROSVariableLengthArrayInfo_tag
  c6_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c6_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef typedef_c6_SL_Bus_sliding_controller2_std_msgs_Header
#define typedef_c6_SL_Bus_sliding_controller2_std_msgs_Header

typedef struct c6_SL_Bus_sliding_controller2_std_msgs_Header_tag
  c6_SL_Bus_sliding_controller2_std_msgs_Header;

#endif                                 /* typedef_c6_SL_Bus_sliding_controller2_std_msgs_Header */

#ifndef typedef_c6_SL_Bus_sliding_controller2_std_msgs_String
#define typedef_c6_SL_Bus_sliding_controller2_std_msgs_String

typedef struct c6_SL_Bus_sliding_controller2_std_msgs_String_tag
  c6_SL_Bus_sliding_controller2_std_msgs_String;

#endif                                 /* typedef_c6_SL_Bus_sliding_controller2_std_msgs_String */

#ifndef typedef_c6_SL_Bus_sliding_controller2_sensor_msgs_JointState
#define typedef_c6_SL_Bus_sliding_controller2_sensor_msgs_JointState

typedef struct c6_SL_Bus_sliding_controller2_sensor_msgs_JointState_tag
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState;

#endif                                 /* typedef_c6_SL_Bus_sliding_controller2_sensor_msgs_JointState */

struct SFc6_sliding_controller2InstanceStruct;

/* Type Definitions */
#ifndef struct_c6_SL_Bus_sliding_controller2_ros_time_Time_tag
#define struct_c6_SL_Bus_sliding_controller2_ros_time_Time_tag

struct c6_SL_Bus_sliding_controller2_ros_time_Time_tag
{
  real_T Sec;
  real_T Nsec;
};

#endif                                 /* struct_c6_SL_Bus_sliding_controller2_ros_time_Time_tag */

#ifndef typedef_c6_SL_Bus_sliding_controller2_ros_time_Time
#define typedef_c6_SL_Bus_sliding_controller2_ros_time_Time

typedef c6_SL_Bus_sliding_controller2_ros_time_Time_tag
  c6_SL_Bus_sliding_controller2_ros_time_Time;

#endif                                 /* typedef_c6_SL_Bus_sliding_controller2_ros_time_Time */

#ifndef struct_c6_SL_Bus_ROSVariableLengthArrayInfo_tag
#define struct_c6_SL_Bus_ROSVariableLengthArrayInfo_tag

struct c6_SL_Bus_ROSVariableLengthArrayInfo_tag
{
  uint32_T CurrentLength;
  uint32_T ReceivedLength;
};

#endif                                 /* struct_c6_SL_Bus_ROSVariableLengthArrayInfo_tag */

#ifndef typedef_c6_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c6_SL_Bus_ROSVariableLengthArrayInfo

typedef c6_SL_Bus_ROSVariableLengthArrayInfo_tag
  c6_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c6_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef struct_c6_SL_Bus_sliding_controller2_std_msgs_Header_tag
#define struct_c6_SL_Bus_sliding_controller2_std_msgs_Header_tag

struct c6_SL_Bus_sliding_controller2_std_msgs_Header_tag
{
  uint32_T Seq;
  c6_SL_Bus_sliding_controller2_ros_time_Time Stamp;
  uint8_T FrameId[128];
  c6_SL_Bus_ROSVariableLengthArrayInfo FrameId_SL_Info;
};

#endif                                 /* struct_c6_SL_Bus_sliding_controller2_std_msgs_Header_tag */

#ifndef typedef_c6_SL_Bus_sliding_controller2_std_msgs_Header
#define typedef_c6_SL_Bus_sliding_controller2_std_msgs_Header

typedef c6_SL_Bus_sliding_controller2_std_msgs_Header_tag
  c6_SL_Bus_sliding_controller2_std_msgs_Header;

#endif                                 /* typedef_c6_SL_Bus_sliding_controller2_std_msgs_Header */

#ifndef struct_c6_SL_Bus_sliding_controller2_std_msgs_String_tag
#define struct_c6_SL_Bus_sliding_controller2_std_msgs_String_tag

struct c6_SL_Bus_sliding_controller2_std_msgs_String_tag
{
  uint8_T Data[128];
  c6_SL_Bus_ROSVariableLengthArrayInfo Data_SL_Info;
};

#endif                                 /* struct_c6_SL_Bus_sliding_controller2_std_msgs_String_tag */

#ifndef typedef_c6_SL_Bus_sliding_controller2_std_msgs_String
#define typedef_c6_SL_Bus_sliding_controller2_std_msgs_String

typedef c6_SL_Bus_sliding_controller2_std_msgs_String_tag
  c6_SL_Bus_sliding_controller2_std_msgs_String;

#endif                                 /* typedef_c6_SL_Bus_sliding_controller2_std_msgs_String */

#ifndef struct_c6_SL_Bus_sliding_controller2_sensor_msgs_JointState_tag
#define struct_c6_SL_Bus_sliding_controller2_sensor_msgs_JointState_tag

struct c6_SL_Bus_sliding_controller2_sensor_msgs_JointState_tag
{
  c6_SL_Bus_sliding_controller2_std_msgs_Header Header;
  c6_SL_Bus_sliding_controller2_std_msgs_String Name[16];
  c6_SL_Bus_ROSVariableLengthArrayInfo Name_SL_Info;
  real_T Position[7];
  c6_SL_Bus_ROSVariableLengthArrayInfo Position_SL_Info;
  real_T Velocity[7];
  c6_SL_Bus_ROSVariableLengthArrayInfo Velocity_SL_Info;
  real_T Effort[7];
  c6_SL_Bus_ROSVariableLengthArrayInfo Effort_SL_Info;
};

#endif                                 /* struct_c6_SL_Bus_sliding_controller2_sensor_msgs_JointState_tag */

#ifndef typedef_c6_SL_Bus_sliding_controller2_sensor_msgs_JointState
#define typedef_c6_SL_Bus_sliding_controller2_sensor_msgs_JointState

typedef c6_SL_Bus_sliding_controller2_sensor_msgs_JointState_tag
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState;

#endif                                 /* typedef_c6_SL_Bus_sliding_controller2_sensor_msgs_JointState */

#ifndef typedef_c6_sliding_controller2StackData
#define typedef_c6_sliding_controller2StackData

typedef struct {
} c6_sliding_controller2StackData;

#endif                                 /* typedef_c6_sliding_controller2StackData */

#ifndef struct_SFc6_sliding_controller2InstanceStruct
#define struct_SFc6_sliding_controller2InstanceStruct

struct SFc6_sliding_controller2InstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c6_is_active_c6_sliding_controller2;
  uint8_T c6_JITStateAnimation[1];
  uint8_T c6_JITTransitionAnimation[1];
  void *c6_fEmlrtCtx;
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_blankMsg;
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_msg;
  uint8_T (*c6_gpu_uv6)[8];
  uint8_T (*c6_gpu_uv5)[13];
  uint8_T (*c6_gpu_uv4)[12];
  uint8_T (*c6_gpu_uv3)[11];
  uint8_T (*c6_gpu_uv2)[12];
  uint8_T (*c6_gpu_uv1)[11];
  uint8_T (*c6_gpu_uv)[10];
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_gpu_blankMsg;
};

#endif                                 /* struct_SFc6_sliding_controller2InstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c6_sliding_controller2_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c6_sliding_controller2_get_check_sum(mxArray *plhs[]);
extern void c6_sliding_controller2_method_dispatcher(SimStruct *S, int_T method,
  void *data);

#endif
