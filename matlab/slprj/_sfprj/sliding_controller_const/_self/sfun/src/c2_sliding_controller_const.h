#ifndef __c2_sliding_controller_const_h__
#define __c2_sliding_controller_const_h__

/* Forward Declarations */
#ifndef typedef_c2_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c2_SL_Bus_ROSVariableLengthArrayInfo

typedef struct c2_SL_Bus_ROSVariableLengthArrayInfo_tag
  c2_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c2_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef typedef_c2_SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9pm
#define typedef_c2_SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9pm

typedef struct c2_b_SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9
  c2_SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9pm;

#endif                                 /* typedef_c2_SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9pm */

struct SFc2_sliding_controller_constInstanceStruct;

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

#ifndef struct_c2_b_SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9
#define struct_c2_b_SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9

struct c2_b_SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9
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

#endif                                 /* struct_c2_b_SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9 */

#ifndef typedef_c2_SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9pm
#define typedef_c2_SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9pm

typedef c2_b_SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9
  c2_SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9pm;

#endif                                 /* typedef_c2_SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9pm */

#ifndef typedef_c2_sliding_controller_constStackData
#define typedef_c2_sliding_controller_constStackData

typedef struct {
} c2_sliding_controller_constStackData;

#endif                                 /* typedef_c2_sliding_controller_constStackData */

#ifndef struct_SFc2_sliding_controller_constInstanceStruct
#define struct_SFc2_sliding_controller_constInstanceStruct

struct SFc2_sliding_controller_constInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c2_is_active_c2_sliding_controller_const;
  uint8_T c2_JITStateAnimation[1];
  uint8_T c2_JITTransitionAnimation[1];
  void *c2_fEmlrtCtx;
  c2_SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9pm *c2_blankMsg;
  c2_SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9pm *c2_msg;
  uint8_T (*c2_gpu_uv)[3];
  c2_SL_Bus_sliding_controller_const_RBDLInverseDynamicsReques_9pm
    *c2_gpu_blankMsg;
};

#endif                                 /* struct_SFc2_sliding_controller_constInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c2_sliding_controller_const_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c2_sliding_controller_const_get_check_sum(mxArray *plhs[]);
extern void c2_sliding_controller_const_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
