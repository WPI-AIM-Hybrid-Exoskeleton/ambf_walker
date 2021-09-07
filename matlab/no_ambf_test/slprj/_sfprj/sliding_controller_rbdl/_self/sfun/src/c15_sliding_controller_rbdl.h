#ifndef __c15_sliding_controller_rbdl_h__
#define __c15_sliding_controller_rbdl_h__

/* Forward Declarations */
#ifndef typedef_c15_SL_Bus_sliding_controller_rbdl_ros_time_Time
#define typedef_c15_SL_Bus_sliding_controller_rbdl_ros_time_Time

typedef struct c15_SL_Bus_sliding_controller_rbdl_ros_time_Time_tag
  c15_SL_Bus_sliding_controller_rbdl_ros_time_Time;

#endif                                 /* typedef_c15_SL_Bus_sliding_controller_rbdl_ros_time_Time */

#ifndef typedef_c15_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c15_SL_Bus_ROSVariableLengthArrayInfo

typedef struct c15_SL_Bus_ROSVariableLengthArrayInfo_tag
  c15_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c15_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef typedef_c15_SL_Bus_sliding_controller_rbdl_std_msgs_Header
#define typedef_c15_SL_Bus_sliding_controller_rbdl_std_msgs_Header

typedef struct c15_SL_Bus_sliding_controller_rbdl_std_msgs_Header_tag
  c15_SL_Bus_sliding_controller_rbdl_std_msgs_Header;

#endif                                 /* typedef_c15_SL_Bus_sliding_controller_rbdl_std_msgs_Header */

#ifndef typedef_c15_SL_Bus_sliding_controller_rbdl_std_msgs_String
#define typedef_c15_SL_Bus_sliding_controller_rbdl_std_msgs_String

typedef struct c15_SL_Bus_sliding_controller_rbdl_std_msgs_String_tag
  c15_SL_Bus_sliding_controller_rbdl_std_msgs_String;

#endif                                 /* typedef_c15_SL_Bus_sliding_controller_rbdl_std_msgs_String */

#ifndef typedef_c15_SL_Bus_sliding_controller_rbdl_sensor_msgs_JointState
#define typedef_c15_SL_Bus_sliding_controller_rbdl_sensor_msgs_JointState

typedef struct c15_SL_Bus_sliding_controller_rbdl_sensor_msgs_JointState_tag
  c15_SL_Bus_sliding_controller_rbdl_sensor_msgs_JointState;

#endif                                 /* typedef_c15_SL_Bus_sliding_controller_rbdl_sensor_msgs_JointState */

struct SFc15_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef struct_c15_SL_Bus_sliding_controller_rbdl_ros_time_Time_tag
#define struct_c15_SL_Bus_sliding_controller_rbdl_ros_time_Time_tag

struct c15_SL_Bus_sliding_controller_rbdl_ros_time_Time_tag
{
  real_T Sec;
  real_T Nsec;
};

#endif                                 /* struct_c15_SL_Bus_sliding_controller_rbdl_ros_time_Time_tag */

#ifndef typedef_c15_SL_Bus_sliding_controller_rbdl_ros_time_Time
#define typedef_c15_SL_Bus_sliding_controller_rbdl_ros_time_Time

typedef c15_SL_Bus_sliding_controller_rbdl_ros_time_Time_tag
  c15_SL_Bus_sliding_controller_rbdl_ros_time_Time;

#endif                                 /* typedef_c15_SL_Bus_sliding_controller_rbdl_ros_time_Time */

#ifndef struct_c15_SL_Bus_ROSVariableLengthArrayInfo_tag
#define struct_c15_SL_Bus_ROSVariableLengthArrayInfo_tag

struct c15_SL_Bus_ROSVariableLengthArrayInfo_tag
{
  uint32_T CurrentLength;
  uint32_T ReceivedLength;
};

#endif                                 /* struct_c15_SL_Bus_ROSVariableLengthArrayInfo_tag */

#ifndef typedef_c15_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c15_SL_Bus_ROSVariableLengthArrayInfo

typedef c15_SL_Bus_ROSVariableLengthArrayInfo_tag
  c15_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c15_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef struct_c15_SL_Bus_sliding_controller_rbdl_std_msgs_Header_tag
#define struct_c15_SL_Bus_sliding_controller_rbdl_std_msgs_Header_tag

struct c15_SL_Bus_sliding_controller_rbdl_std_msgs_Header_tag
{
  uint32_T Seq;
  c15_SL_Bus_sliding_controller_rbdl_ros_time_Time Stamp;
  uint8_T FrameId[128];
  c15_SL_Bus_ROSVariableLengthArrayInfo FrameId_SL_Info;
};

#endif                                 /* struct_c15_SL_Bus_sliding_controller_rbdl_std_msgs_Header_tag */

#ifndef typedef_c15_SL_Bus_sliding_controller_rbdl_std_msgs_Header
#define typedef_c15_SL_Bus_sliding_controller_rbdl_std_msgs_Header

typedef c15_SL_Bus_sliding_controller_rbdl_std_msgs_Header_tag
  c15_SL_Bus_sliding_controller_rbdl_std_msgs_Header;

#endif                                 /* typedef_c15_SL_Bus_sliding_controller_rbdl_std_msgs_Header */

#ifndef struct_c15_SL_Bus_sliding_controller_rbdl_std_msgs_String_tag
#define struct_c15_SL_Bus_sliding_controller_rbdl_std_msgs_String_tag

struct c15_SL_Bus_sliding_controller_rbdl_std_msgs_String_tag
{
  uint8_T Data[128];
  c15_SL_Bus_ROSVariableLengthArrayInfo Data_SL_Info;
};

#endif                                 /* struct_c15_SL_Bus_sliding_controller_rbdl_std_msgs_String_tag */

#ifndef typedef_c15_SL_Bus_sliding_controller_rbdl_std_msgs_String
#define typedef_c15_SL_Bus_sliding_controller_rbdl_std_msgs_String

typedef c15_SL_Bus_sliding_controller_rbdl_std_msgs_String_tag
  c15_SL_Bus_sliding_controller_rbdl_std_msgs_String;

#endif                                 /* typedef_c15_SL_Bus_sliding_controller_rbdl_std_msgs_String */

#ifndef struct_c15_SL_Bus_sliding_controller_rbdl_sensor_msgs_JointState_tag
#define struct_c15_SL_Bus_sliding_controller_rbdl_sensor_msgs_JointState_tag

struct c15_SL_Bus_sliding_controller_rbdl_sensor_msgs_JointState_tag
{
  c15_SL_Bus_sliding_controller_rbdl_std_msgs_Header Header;
  c15_SL_Bus_sliding_controller_rbdl_std_msgs_String Name[16];
  c15_SL_Bus_ROSVariableLengthArrayInfo Name_SL_Info;
  real_T Position[7];
  c15_SL_Bus_ROSVariableLengthArrayInfo Position_SL_Info;
  real_T Velocity[7];
  c15_SL_Bus_ROSVariableLengthArrayInfo Velocity_SL_Info;
  real_T Effort[7];
  c15_SL_Bus_ROSVariableLengthArrayInfo Effort_SL_Info;
};

#endif                                 /* struct_c15_SL_Bus_sliding_controller_rbdl_sensor_msgs_JointState_tag */

#ifndef typedef_c15_SL_Bus_sliding_controller_rbdl_sensor_msgs_JointState
#define typedef_c15_SL_Bus_sliding_controller_rbdl_sensor_msgs_JointState

typedef c15_SL_Bus_sliding_controller_rbdl_sensor_msgs_JointState_tag
  c15_SL_Bus_sliding_controller_rbdl_sensor_msgs_JointState;

#endif                                 /* typedef_c15_SL_Bus_sliding_controller_rbdl_sensor_msgs_JointState */

#ifndef typedef_c15_sliding_controller_rbdlStackData
#define typedef_c15_sliding_controller_rbdlStackData

typedef struct {
} c15_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c15_sliding_controller_rbdlStackData */

#ifndef struct_SFc15_sliding_controller_rbdlInstanceStruct
#define struct_SFc15_sliding_controller_rbdlInstanceStruct

struct SFc15_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c15_is_active_c15_sliding_controller_rbdl;
  uint8_T c15_JITStateAnimation[1];
  uint8_T c15_JITTransitionAnimation[1];
  void *c15_fEmlrtCtx;
  c15_SL_Bus_sliding_controller_rbdl_sensor_msgs_JointState *c15_blankMsg;
  c15_SL_Bus_sliding_controller_rbdl_sensor_msgs_JointState *c15_msg;
  uint8_T (*c15_gpu_uv6)[5];
  uint8_T (*c15_gpu_uv5)[10];
  uint8_T (*c15_gpu_uv4)[9];
  uint8_T (*c15_gpu_uv3)[8];
  uint8_T (*c15_gpu_uv2)[9];
  uint8_T (*c15_gpu_uv1)[8];
  uint8_T (*c15_gpu_uv)[7];
  c15_SL_Bus_sliding_controller_rbdl_sensor_msgs_JointState *c15_gpu_blankMsg;
};

#endif                                 /* struct_SFc15_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c15_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c15_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c15_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
