#ifndef __c8_sliding_controller_const_h__
#define __c8_sliding_controller_const_h__

/* Forward Declarations */
#ifndef typedef_c8_SL_Bus_sliding_controller_const_ros_time_Time
#define typedef_c8_SL_Bus_sliding_controller_const_ros_time_Time

typedef struct c8_SL_Bus_sliding_controller_const_ros_time_Time_tag
  c8_SL_Bus_sliding_controller_const_ros_time_Time;

#endif                                 /* typedef_c8_SL_Bus_sliding_controller_const_ros_time_Time */

#ifndef typedef_c8_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c8_SL_Bus_ROSVariableLengthArrayInfo

typedef struct c8_SL_Bus_ROSVariableLengthArrayInfo_tag
  c8_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c8_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef typedef_c8_SL_Bus_sliding_controller_const_std_msgs_Header
#define typedef_c8_SL_Bus_sliding_controller_const_std_msgs_Header

typedef struct c8_SL_Bus_sliding_controller_const_std_msgs_Header_tag
  c8_SL_Bus_sliding_controller_const_std_msgs_Header;

#endif                                 /* typedef_c8_SL_Bus_sliding_controller_const_std_msgs_Header */

#ifndef typedef_c8_SL_Bus_sliding_controller_const_std_msgs_String
#define typedef_c8_SL_Bus_sliding_controller_const_std_msgs_String

typedef struct c8_SL_Bus_sliding_controller_const_std_msgs_String_tag
  c8_SL_Bus_sliding_controller_const_std_msgs_String;

#endif                                 /* typedef_c8_SL_Bus_sliding_controller_const_std_msgs_String */

#ifndef typedef_c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState
#define typedef_c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState

typedef struct c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState_tag
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState;

#endif                                 /* typedef_c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState */

struct SFc8_sliding_controller_constInstanceStruct;

/* Type Definitions */
#ifndef struct_c8_SL_Bus_sliding_controller_const_ros_time_Time_tag
#define struct_c8_SL_Bus_sliding_controller_const_ros_time_Time_tag

struct c8_SL_Bus_sliding_controller_const_ros_time_Time_tag
{
  real_T Sec;
  real_T Nsec;
};

#endif                                 /* struct_c8_SL_Bus_sliding_controller_const_ros_time_Time_tag */

#ifndef typedef_c8_SL_Bus_sliding_controller_const_ros_time_Time
#define typedef_c8_SL_Bus_sliding_controller_const_ros_time_Time

typedef c8_SL_Bus_sliding_controller_const_ros_time_Time_tag
  c8_SL_Bus_sliding_controller_const_ros_time_Time;

#endif                                 /* typedef_c8_SL_Bus_sliding_controller_const_ros_time_Time */

#ifndef struct_c8_SL_Bus_ROSVariableLengthArrayInfo_tag
#define struct_c8_SL_Bus_ROSVariableLengthArrayInfo_tag

struct c8_SL_Bus_ROSVariableLengthArrayInfo_tag
{
  uint32_T CurrentLength;
  uint32_T ReceivedLength;
};

#endif                                 /* struct_c8_SL_Bus_ROSVariableLengthArrayInfo_tag */

#ifndef typedef_c8_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c8_SL_Bus_ROSVariableLengthArrayInfo

typedef c8_SL_Bus_ROSVariableLengthArrayInfo_tag
  c8_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c8_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef struct_c8_SL_Bus_sliding_controller_const_std_msgs_Header_tag
#define struct_c8_SL_Bus_sliding_controller_const_std_msgs_Header_tag

struct c8_SL_Bus_sliding_controller_const_std_msgs_Header_tag
{
  uint32_T Seq;
  c8_SL_Bus_sliding_controller_const_ros_time_Time Stamp;
  uint8_T FrameId[128];
  c8_SL_Bus_ROSVariableLengthArrayInfo FrameId_SL_Info;
};

#endif                                 /* struct_c8_SL_Bus_sliding_controller_const_std_msgs_Header_tag */

#ifndef typedef_c8_SL_Bus_sliding_controller_const_std_msgs_Header
#define typedef_c8_SL_Bus_sliding_controller_const_std_msgs_Header

typedef c8_SL_Bus_sliding_controller_const_std_msgs_Header_tag
  c8_SL_Bus_sliding_controller_const_std_msgs_Header;

#endif                                 /* typedef_c8_SL_Bus_sliding_controller_const_std_msgs_Header */

#ifndef struct_c8_SL_Bus_sliding_controller_const_std_msgs_String_tag
#define struct_c8_SL_Bus_sliding_controller_const_std_msgs_String_tag

struct c8_SL_Bus_sliding_controller_const_std_msgs_String_tag
{
  uint8_T Data[128];
  c8_SL_Bus_ROSVariableLengthArrayInfo Data_SL_Info;
};

#endif                                 /* struct_c8_SL_Bus_sliding_controller_const_std_msgs_String_tag */

#ifndef typedef_c8_SL_Bus_sliding_controller_const_std_msgs_String
#define typedef_c8_SL_Bus_sliding_controller_const_std_msgs_String

typedef c8_SL_Bus_sliding_controller_const_std_msgs_String_tag
  c8_SL_Bus_sliding_controller_const_std_msgs_String;

#endif                                 /* typedef_c8_SL_Bus_sliding_controller_const_std_msgs_String */

#ifndef struct_c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState_tag
#define struct_c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState_tag

struct c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState_tag
{
  c8_SL_Bus_sliding_controller_const_std_msgs_Header Header;
  c8_SL_Bus_sliding_controller_const_std_msgs_String Name[16];
  c8_SL_Bus_ROSVariableLengthArrayInfo Name_SL_Info;
  real_T Position[7];
  c8_SL_Bus_ROSVariableLengthArrayInfo Position_SL_Info;
  real_T Velocity[7];
  c8_SL_Bus_ROSVariableLengthArrayInfo Velocity_SL_Info;
  real_T Effort[7];
  c8_SL_Bus_ROSVariableLengthArrayInfo Effort_SL_Info;
};

#endif                                 /* struct_c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState_tag */

#ifndef typedef_c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState
#define typedef_c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState

typedef c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState_tag
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState;

#endif                                 /* typedef_c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState */

#ifndef typedef_c8_sliding_controller_constStackData
#define typedef_c8_sliding_controller_constStackData

typedef struct {
} c8_sliding_controller_constStackData;

#endif                                 /* typedef_c8_sliding_controller_constStackData */

#ifndef struct_SFc8_sliding_controller_constInstanceStruct
#define struct_SFc8_sliding_controller_constInstanceStruct

struct SFc8_sliding_controller_constInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c8_is_active_c8_sliding_controller_const;
  uint8_T c8_JITStateAnimation[1];
  uint8_T c8_JITTransitionAnimation[1];
  void *c8_fEmlrtCtx;
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_blankMsg;
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_msg;
  uint8_T (*c8_gpu_uv5)[15];
  uint8_T (*c8_gpu_uv4)[14];
  uint8_T (*c8_gpu_uv3)[13];
  uint8_T (*c8_gpu_uv2)[14];
  uint8_T (*c8_gpu_uv1)[13];
  uint8_T (*c8_gpu_uv)[12];
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_gpu_blankMsg;
};

#endif                                 /* struct_SFc8_sliding_controller_constInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c8_sliding_controller_const_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c8_sliding_controller_const_get_check_sum(mxArray *plhs[]);
extern void c8_sliding_controller_const_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
