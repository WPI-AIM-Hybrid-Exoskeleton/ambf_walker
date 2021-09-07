#ifndef __c39_sliding_controller_rbdl_h__
#define __c39_sliding_controller_rbdl_h__

/* Forward Declarations */
#ifndef typedef_c39_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c39_SL_Bus_ROSVariableLengthArrayInfo

typedef struct c39_SL_Bus_ROSVariableLengthArrayInfo_tag
  c39_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c39_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef typedef_c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
#define typedef_c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57

typedef struct c39_b_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57;

#endif                                 /* typedef_c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 */

struct SFc39_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef struct_c39_SL_Bus_ROSVariableLengthArrayInfo_tag
#define struct_c39_SL_Bus_ROSVariableLengthArrayInfo_tag

struct c39_SL_Bus_ROSVariableLengthArrayInfo_tag
{
  uint32_T CurrentLength;
  uint32_T ReceivedLength;
};

#endif                                 /* struct_c39_SL_Bus_ROSVariableLengthArrayInfo_tag */

#ifndef typedef_c39_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c39_SL_Bus_ROSVariableLengthArrayInfo

typedef c39_SL_Bus_ROSVariableLengthArrayInfo_tag
  c39_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c39_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef struct_c39_b_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u
#define struct_c39_b_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u

struct c39_b_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u
{
  uint8_T ModelName[8];
  c39_SL_Bus_ROSVariableLengthArrayInfo ModelName_SL_Info;
  real_T Q[7];
  c39_SL_Bus_ROSVariableLengthArrayInfo Q_SL_Info;
  real_T Qd[7];
  c39_SL_Bus_ROSVariableLengthArrayInfo Qd_SL_Info;
  real_T Tau[7];
  c39_SL_Bus_ROSVariableLengthArrayInfo Tau_SL_Info;
};

#endif                                 /* struct_c39_b_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u */

#ifndef typedef_c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
#define typedef_c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57

typedef c39_b_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57;

#endif                                 /* typedef_c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 */

#ifndef typedef_c39_sliding_controller_rbdlStackData
#define typedef_c39_sliding_controller_rbdlStackData

typedef struct {
} c39_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c39_sliding_controller_rbdlStackData */

#ifndef struct_SFc39_sliding_controller_rbdlInstanceStruct
#define struct_SFc39_sliding_controller_rbdlInstanceStruct

struct SFc39_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c39_is_active_c39_sliding_controller_rbdl;
  uint8_T c39_JITStateAnimation[1];
  uint8_T c39_JITTransitionAnimation[1];
  void *c39_fEmlrtCtx;
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_blankMsg;
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_msg;
  uint8_T (*c39_gpu_uv)[5];
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
    *c39_gpu_blankMsg;
};

#endif                                 /* struct_SFc39_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c39_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c39_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c39_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
