#ifndef __c2_sliding_controller2_h__
#define __c2_sliding_controller2_h__

/* Forward Declarations */
#ifndef typedef_c2_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c2_SL_Bus_ROSVariableLengthArrayInfo

typedef struct c2_SL_Bus_ROSVariableLengthArrayInfo_tag
  c2_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c2_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef typedef_c2_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex
#define typedef_c2_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex

typedef struct c2_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex_t
  c2_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex;

#endif                                 /* typedef_c2_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex */

struct SFc2_sliding_controller2InstanceStruct;

/* Type Definitions */
#ifndef struct_c2_SL_Bus_ROSVariableLengthArrayInfo_tag
#define struct_c2_SL_Bus_ROSVariableLengthArrayInfo_tag

struct c2_SL_Bus_ROSVariableLengthArrayInfo_tag
{
  uint32_T CurrentLength;
  uint32_T ReceivedLength;
};

#endif                                 /* struct_c2_SL_Bus_ROSVariableLengthArrayInfo_tag */

#ifndef typedef_c2_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c2_SL_Bus_ROSVariableLengthArrayInfo

typedef c2_SL_Bus_ROSVariableLengthArrayInfo_tag
  c2_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c2_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef struct_c2_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex_t
#define struct_c2_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex_t

struct c2_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex_t
{
  uint8_T ModelName[4];
  c2_SL_Bus_ROSVariableLengthArrayInfo ModelName_SL_Info;
  real_T Q[7];
  c2_SL_Bus_ROSVariableLengthArrayInfo Q_SL_Info;
  real_T Qd[7];
  c2_SL_Bus_ROSVariableLengthArrayInfo Qd_SL_Info;
  real_T Qdd[7];
  c2_SL_Bus_ROSVariableLengthArrayInfo Qdd_SL_Info;
};

#endif                                 /* struct_c2_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex_t */

#ifndef typedef_c2_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex
#define typedef_c2_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex

typedef c2_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex_t
  c2_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex;

#endif                                 /* typedef_c2_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex */

#ifndef typedef_c2_sliding_controller2StackData
#define typedef_c2_sliding_controller2StackData

typedef struct {
} c2_sliding_controller2StackData;

#endif                                 /* typedef_c2_sliding_controller2StackData */

#ifndef struct_SFc2_sliding_controller2InstanceStruct
#define struct_SFc2_sliding_controller2InstanceStruct

struct SFc2_sliding_controller2InstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c2_is_active_c2_sliding_controller2;
  uint8_T c2_JITStateAnimation[1];
  uint8_T c2_JITTransitionAnimation[1];
  void *c2_fEmlrtCtx;
  c2_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex *c2_blankMsg;
  c2_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex *c2_msg;
  uint8_T (*c2_gpu_uv)[3];
  c2_SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex
    *c2_gpu_blankMsg;
};

#endif                                 /* struct_SFc2_sliding_controller2InstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c2_sliding_controller2_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c2_sliding_controller2_get_check_sum(mxArray *plhs[]);
extern void c2_sliding_controller2_method_dispatcher(SimStruct *S, int_T method,
  void *data);

#endif
