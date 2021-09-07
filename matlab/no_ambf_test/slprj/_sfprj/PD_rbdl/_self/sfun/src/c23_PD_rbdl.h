#ifndef __c23_PD_rbdl_h__
#define __c23_PD_rbdl_h__

/* Forward Declarations */
#ifndef typedef_c23_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c23_SL_Bus_ROSVariableLengthArrayInfo

typedef struct c23_SL_Bus_ROSVariableLengthArrayInfo_tag
  c23_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c23_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef typedef_c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest
#define typedef_c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest

typedef struct c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest_tag
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest;

#endif                                 /* typedef_c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest */

struct SFc23_PD_rbdlInstanceStruct;

/* Type Definitions */
#ifndef struct_c23_SL_Bus_ROSVariableLengthArrayInfo_tag
#define struct_c23_SL_Bus_ROSVariableLengthArrayInfo_tag

struct c23_SL_Bus_ROSVariableLengthArrayInfo_tag
{
  uint32_T CurrentLength;
  uint32_T ReceivedLength;
};

#endif                                 /* struct_c23_SL_Bus_ROSVariableLengthArrayInfo_tag */

#ifndef typedef_c23_SL_Bus_ROSVariableLengthArrayInfo
#define typedef_c23_SL_Bus_ROSVariableLengthArrayInfo

typedef c23_SL_Bus_ROSVariableLengthArrayInfo_tag
  c23_SL_Bus_ROSVariableLengthArrayInfo;

#endif                                 /* typedef_c23_SL_Bus_ROSVariableLengthArrayInfo */

#ifndef struct_c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest_tag
#define struct_c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest_tag

struct c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest_tag
{
  uint8_T ModelName[8];
  c23_SL_Bus_ROSVariableLengthArrayInfo ModelName_SL_Info;
  real_T Q[6];
  c23_SL_Bus_ROSVariableLengthArrayInfo Q_SL_Info;
  real_T Qd[6];
  c23_SL_Bus_ROSVariableLengthArrayInfo Qd_SL_Info;
  real_T Tau[6];
  c23_SL_Bus_ROSVariableLengthArrayInfo Tau_SL_Info;
};

#endif                                 /* struct_c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest_tag */

#ifndef typedef_c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest
#define typedef_c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest

typedef c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest_tag
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest;

#endif                                 /* typedef_c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest */

#ifndef typedef_c23_PD_rbdlStackData
#define typedef_c23_PD_rbdlStackData

typedef struct {
} c23_PD_rbdlStackData;

#endif                                 /* typedef_c23_PD_rbdlStackData */

#ifndef struct_SFc23_PD_rbdlInstanceStruct
#define struct_SFc23_PD_rbdlInstanceStruct

struct SFc23_PD_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c23_is_active_c23_PD_rbdl;
  uint8_T c23_JITStateAnimation[1];
  uint8_T c23_JITTransitionAnimation[1];
  void *c23_fEmlrtCtx;
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_blankMsg;
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_msg;
  uint8_T (*c23_gpu_uv)[5];
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_gpu_blankMsg;
};

#endif                                 /* struct_SFc23_PD_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c23_PD_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c23_PD_rbdl_get_check_sum(mxArray *plhs[]);
extern void c23_PD_rbdl_method_dispatcher(SimStruct *S, int_T method, void *data);

#endif
