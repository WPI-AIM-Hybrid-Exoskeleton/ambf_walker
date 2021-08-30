#ifndef __c16_sliding_controller2_h__
#define __c16_sliding_controller2_h__

/* Forward Declarations */
#ifndef typedef_c16_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c16_SL_Bus_ROSVariableLengthArrayInfo

typedef struct c16_SL_Bus_ROSVariableLengthArrayInfo_tag
  c16_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c16_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef typedef_c16_SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz
#define typedef_c16_SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz

typedef struct c16_SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz_ta
  c16_SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz;

#endif                                 /* typedef_c16_SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz */

struct SFc16_sliding_controller2InstanceStruct;

/* Type Definitions */
#ifndef struct_c16_SL_Bus_ROSVariableLengthArrayInfo_tag
#define struct_c16_SL_Bus_ROSVariableLengthArrayInfo_tag

struct c16_SL_Bus_ROSVariableLengthArrayInfo_tag
{
  uint32_T CurrentLength;
  uint32_T ReceivedLength;
};

#endif                                 /* struct_c16_SL_Bus_ROSVariableLengthArrayInfo_tag */

#ifndef typedef_c16_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c16_SL_Bus_ROSVariableLengthArrayInfo

typedef c16_SL_Bus_ROSVariableLengthArrayInfo_tag
  c16_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c16_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef struct_c16_SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz_ta
#define struct_c16_SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz_ta

struct c16_SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz_ta
{
  real_T Q[7];
  c16_SL_Bus_ROSVariableLengthArrayInfo Q_SL_Info;
  real_T Qd[7];
  c16_SL_Bus_ROSVariableLengthArrayInfo Qd_SL_Info;
  real_T Qdd[7];
  c16_SL_Bus_ROSVariableLengthArrayInfo Qdd_SL_Info;
  uint8_T Controller[4];
  c16_SL_Bus_ROSVariableLengthArrayInfo Controller_SL_Info;
  real_T Other[7];
  c16_SL_Bus_ROSVariableLengthArrayInfo Other_SL_Info;
};

#endif                                 /* struct_c16_SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz_ta */

#ifndef typedef_c16_SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz
#define typedef_c16_SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz

typedef c16_SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz_ta
  c16_SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz;

#endif                                 /* typedef_c16_SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz */

#ifndef typedef_c16_sliding_controller2StackData
#define typedef_c16_sliding_controller2StackData

typedef struct {
} c16_sliding_controller2StackData;

#endif                                 /* typedef_c16_sliding_controller2StackData */

#ifndef struct_SFc16_sliding_controller2InstanceStruct
#define struct_SFc16_sliding_controller2InstanceStruct

struct SFc16_sliding_controller2InstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c16_is_active_c16_sliding_controller2;
  uint8_T c16_JITStateAnimation[1];
  uint8_T c16_JITTransitionAnimation[1];
  void *c16_fEmlrtCtx;
  c16_SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz *c16_blankMsg;
  c16_SL_Bus_sliding_controller2_DesiredJointsCmdRequest_9kimzz *c16_msg;
};

#endif                                 /* struct_SFc16_sliding_controller2InstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c16_sliding_controller2_get_eml_resolved_functions_info
  ();

/* Function Definitions */
extern void sf_c16_sliding_controller2_get_check_sum(mxArray *plhs[]);
extern void c16_sliding_controller2_method_dispatcher(SimStruct *S, int_T method,
  void *data);

#endif
