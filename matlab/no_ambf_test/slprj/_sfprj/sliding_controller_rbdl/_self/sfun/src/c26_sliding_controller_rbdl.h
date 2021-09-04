#ifndef __c26_sliding_controller_rbdl_h__
#define __c26_sliding_controller_rbdl_h__

/* Forward Declarations */
#ifndef typedef_c26_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c26_SL_Bus_ROSVariableLengthArrayInfo

typedef struct c26_SL_Bus_ROSVariableLengthArrayInfo_tag
  c26_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c26_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef typedef_c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
#define typedef_c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57

typedef struct c26_b_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57;

#endif                                 /* typedef_c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 */

struct SFc26_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef struct_c26_SL_Bus_ROSVariableLengthArrayInfo_tag
#define struct_c26_SL_Bus_ROSVariableLengthArrayInfo_tag

struct c26_SL_Bus_ROSVariableLengthArrayInfo_tag
{
  uint32_T CurrentLength;
  uint32_T ReceivedLength;
};

#endif                                 /* struct_c26_SL_Bus_ROSVariableLengthArrayInfo_tag */

#ifndef typedef_c26_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c26_SL_Bus_ROSVariableLengthArrayInfo

typedef c26_SL_Bus_ROSVariableLengthArrayInfo_tag
  c26_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c26_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef struct_c26_b_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u
#define struct_c26_b_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u

struct c26_b_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u
{
  uint8_T ModelName[8];
  c26_SL_Bus_ROSVariableLengthArrayInfo ModelName_SL_Info;
  real_T Q[7];
  c26_SL_Bus_ROSVariableLengthArrayInfo Q_SL_Info;
  real_T Qd[7];
  c26_SL_Bus_ROSVariableLengthArrayInfo Qd_SL_Info;
  real_T Tau[7];
  c26_SL_Bus_ROSVariableLengthArrayInfo Tau_SL_Info;
};

#endif                                 /* struct_c26_b_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u */

#ifndef typedef_c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
#define typedef_c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57

typedef c26_b_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57;

#endif                                 /* typedef_c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 */

#ifndef typedef_c26_sliding_controller_rbdlStackData
#define typedef_c26_sliding_controller_rbdlStackData

typedef struct {
} c26_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c26_sliding_controller_rbdlStackData */

#ifndef struct_SFc26_sliding_controller_rbdlInstanceStruct
#define struct_SFc26_sliding_controller_rbdlInstanceStruct

struct SFc26_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c26_is_active_c26_sliding_controller_rbdl;
  uint8_T c26_JITStateAnimation[1];
  uint8_T c26_JITTransitionAnimation[1];
  void *c26_fEmlrtCtx;
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_blankMsg;
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_msg;
  uint8_T (*c26_gpu_uv)[3];
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
    *c26_gpu_blankMsg;
};

#endif                                 /* struct_SFc26_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c26_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c26_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c26_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
