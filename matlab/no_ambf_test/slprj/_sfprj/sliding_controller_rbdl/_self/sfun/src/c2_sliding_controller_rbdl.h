#ifndef __c2_sliding_controller_rbdl_h__
#define __c2_sliding_controller_rbdl_h__

/* Forward Declarations */
#ifndef typedef_c2_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c2_SL_Bus_ROSVariableLengthArrayInfo

typedef struct c2_SL_Bus_ROSVariableLengthArrayInfo_tag
  c2_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c2_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef typedef_c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb
#define typedef_c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb

typedef struct c2_b_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yq
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb;

#endif                                 /* typedef_c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb */

struct SFc2_sliding_controller_rbdlInstanceStruct;

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

#ifndef struct_c2_b_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yq
#define struct_c2_b_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yq

struct c2_b_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yq
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

#endif                                 /* struct_c2_b_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yq */

#ifndef typedef_c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb
#define typedef_c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb

typedef c2_b_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yq
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb;

#endif                                 /* typedef_c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb */

#ifndef typedef_c2_sliding_controller_rbdlStackData
#define typedef_c2_sliding_controller_rbdlStackData

typedef struct {
} c2_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c2_sliding_controller_rbdlStackData */

#ifndef struct_SFc2_sliding_controller_rbdlInstanceStruct
#define struct_SFc2_sliding_controller_rbdlInstanceStruct

struct SFc2_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c2_is_active_c2_sliding_controller_rbdl;
  uint8_T c2_JITStateAnimation[1];
  uint8_T c2_JITTransitionAnimation[1];
  void *c2_fEmlrtCtx;
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_blankMsg;
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_msg;
  uint8_T (*c2_gpu_uv)[3];
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb
    *c2_gpu_blankMsg;
};

#endif                                 /* struct_SFc2_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c2_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c2_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c2_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
