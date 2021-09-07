/* Include files */

#include "PD_rbdl_sfun.h"
#include "c23_PD_rbdl.h"
#include "MWCudaDimUtility.hpp"
#ifdef utFree
#undef utFree
#endif

#ifdef utMalloc
#undef utMalloc
#endif

#ifdef __cplusplus

extern "C" void *utMalloc(size_t size);
extern "C" void utFree(void*);

#else

extern void *utMalloc(size_t size);
extern void utFree(void*);

#endif

/* Forward Declarations */

/* Type Definitions */

/* Named Constants */
const int32_T CALL_EVENT = -1;

/* Variable Declarations */

/* Variable Definitions */
static real_T _sfTime_;

/* Function Declarations */
static void initialize_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance);
static void initialize_params_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct
  *chartInstance);
static void enable_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance);
static void disable_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance);
static void c23_do_animation_call_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct
  *chartInstance);
static void ext_mode_exec_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct
  *chartInstance);
static void set_sim_state_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c23_st);
static void sf_gateway_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance);
static void mdl_start_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *
  chartInstance);
static void mdl_cleanup_runtime_resources_c23_PD_rbdl
  (SFc23_PD_rbdlInstanceStruct *chartInstance);
static void initSimStructsc23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance);
static void c23_emlrt_marshallIn(SFc23_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c23_b_msg, const char_T *c23_identifier,
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_y);
static void c23_b_emlrt_marshallIn(SFc23_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c23_u, const emlrtMsgIdentifier *c23_parentId,
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_y);
static void c23_c_emlrt_marshallIn(SFc23_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c23_u, const emlrtMsgIdentifier *c23_parentId, uint8_T c23_y[8]);
static c23_SL_Bus_ROSVariableLengthArrayInfo c23_d_emlrt_marshallIn
  (SFc23_PD_rbdlInstanceStruct *chartInstance, const mxArray *c23_u, const
   emlrtMsgIdentifier *c23_parentId);
static uint32_T c23_e_emlrt_marshallIn(SFc23_PD_rbdlInstanceStruct
  *chartInstance, const mxArray *c23_u, const emlrtMsgIdentifier *c23_parentId);
static void c23_f_emlrt_marshallIn(SFc23_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c23_u, const emlrtMsgIdentifier *c23_parentId, real_T c23_y[6]);
static uint8_T c23_g_emlrt_marshallIn(SFc23_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c23_b_is_active_c23_PD_rbdl, const char_T *c23_identifier);
static uint8_T c23_h_emlrt_marshallIn(SFc23_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c23_u, const emlrtMsgIdentifier *c23_parentId);
static void c23_eML_blk_kernel(SFc23_PD_rbdlInstanceStruct *chartInstance,
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_blankMsg);
static __global__ void c23_sf_gateway_c23_PD_rbdl_kernel1
  (c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_blankMsg,
   c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_msg);
static __global__ void c23_sf_gateway_c23_PD_rbdl_kernel2
  (c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_blankMsg,
   c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_msg);
static __global__ void c23_sf_gateway_c23_PD_rbdl_kernel3
  (c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_msg,
   c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_r);
static __global__ void c23_sf_gateway_c23_PD_rbdl_kernel4
  (c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_msg,
   c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_r);
static __global__ void c23_sf_gateway_c23_PD_rbdl_kernel5(const
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_r,
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_msg);
static __global__ void c23_sf_gateway_c23_PD_rbdl_kernel6(const
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_r,
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_msg);
static __global__ void c23_eML_blk_kernel_kernel7
  (c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_blankMsg);
static __global__ void c23_eML_blk_kernel_kernel8(const uint8_T c23_uv[5],
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_blankMsg);
static __global__ void c23_eML_blk_kernel_kernel9
  (c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_blankMsg);
static void init_dsm_address_info(SFc23_PD_rbdlInstanceStruct *chartInstance);
static void init_simulink_io_address(SFc23_PD_rbdlInstanceStruct *chartInstance);

/* Function Definitions */
static void initialize_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c23_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c23_is_active_c23_PD_rbdl = 0U;
  cudaGetLastError();
  cudaMalloc(&chartInstance->c23_gpu_uv, 5UL);
  cudaMalloc(&chartInstance->c23_gpu_blankMsg, 184UL);
}

static void initialize_params_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct
  *chartInstance)
{
}

static void enable_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c23_do_animation_call_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct
  *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct
  *chartInstance)
{
  static const char_T *c23_sv[8] = { "ModelName", "ModelName_SL_Info", "Q",
    "Q_SL_Info", "Qd", "Qd_SL_Info", "Tau", "Tau_SL_Info" };

  static const char_T *c23_sv1[2] = { "CurrentLength", "ReceivedLength" };

  const mxArray *c23_b_y = NULL;
  const mxArray *c23_c_y = NULL;
  const mxArray *c23_d_y = NULL;
  const mxArray *c23_e_y = NULL;
  const mxArray *c23_f_y = NULL;
  const mxArray *c23_g_y = NULL;
  const mxArray *c23_h_y = NULL;
  const mxArray *c23_i_y = NULL;
  const mxArray *c23_j_y = NULL;
  const mxArray *c23_k_y = NULL;
  const mxArray *c23_l_y = NULL;
  const mxArray *c23_m_y = NULL;
  const mxArray *c23_n_y = NULL;
  const mxArray *c23_o_y = NULL;
  const mxArray *c23_p_y = NULL;
  const mxArray *c23_q_y = NULL;
  const mxArray *c23_r_y = NULL;
  const mxArray *c23_s_y = NULL;
  const mxArray *c23_st;
  const mxArray *c23_y = NULL;
  real_T c23_d_u[6];
  int32_T c23_i;
  int32_T c23_i1;
  int32_T c23_i2;
  int32_T c23_i3;
  uint32_T c23_b_u;
  uint32_T c23_c_u;
  uint32_T c23_e_u;
  uint32_T c23_f_u;
  uint32_T c23_g_u;
  uint32_T c23_h_u;
  uint32_T c23_i_u;
  uint32_T c23_j_u;
  uint32_T c23_u_CurrentLength;
  uint32_T c23_u_ReceivedLength;
  uint8_T c23_u[8];
  c23_st = NULL;
  c23_y = NULL;
  sf_mex_assign(&c23_y, sf_mex_createcellmatrix(2, 1), false);
  c23_b_y = NULL;
  sf_mex_assign(&c23_b_y, sf_mex_createstruct("structure", 8, c23_sv, 2, 1, 1),
                false);
  for (c23_i = 0; c23_i < 8; c23_i++) {
    c23_u[c23_i] = ((uint8_T *)&((char_T *)chartInstance->c23_msg)[0])[c23_i];
  }

  c23_c_y = NULL;
  sf_mex_assign(&c23_c_y, sf_mex_create("y", c23_u, 3, 0U, 1U, 0U, 1, 8), false);
  sf_mex_setfieldbynum(c23_b_y, 0, "ModelName", c23_c_y, 0);
  c23_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [8])[0];
  c23_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [8])[4];
  c23_d_y = NULL;
  sf_mex_assign(&c23_d_y, sf_mex_createstruct("structure", 2, c23_sv1, 2, 1, 1),
                false);
  c23_b_u = c23_u_CurrentLength;
  c23_e_y = NULL;
  sf_mex_assign(&c23_e_y, sf_mex_create("y", &c23_b_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c23_d_y, 0, "CurrentLength", c23_e_y, 0);
  c23_c_u = c23_u_ReceivedLength;
  c23_f_y = NULL;
  sf_mex_assign(&c23_f_y, sf_mex_create("y", &c23_c_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c23_d_y, 0, "ReceivedLength", c23_f_y, 1);
  sf_mex_setfieldbynum(c23_b_y, 0, "ModelName_SL_Info", c23_d_y, 1);
  for (c23_i1 = 0; c23_i1 < 6; c23_i1++) {
    c23_d_u[c23_i1] = ((real_T *)&((char_T *)chartInstance->c23_msg)[16])[c23_i1];
  }

  c23_g_y = NULL;
  sf_mex_assign(&c23_g_y, sf_mex_create("y", c23_d_u, 0, 0U, 1U, 0U, 1, 6),
                false);
  sf_mex_setfieldbynum(c23_b_y, 0, "Q", c23_g_y, 2);
  c23_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [64])[0];
  c23_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [64])[4];
  c23_h_y = NULL;
  sf_mex_assign(&c23_h_y, sf_mex_createstruct("structure", 2, c23_sv1, 2, 1, 1),
                false);
  c23_e_u = c23_u_CurrentLength;
  c23_i_y = NULL;
  sf_mex_assign(&c23_i_y, sf_mex_create("y", &c23_e_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c23_h_y, 0, "CurrentLength", c23_i_y, 0);
  c23_f_u = c23_u_ReceivedLength;
  c23_j_y = NULL;
  sf_mex_assign(&c23_j_y, sf_mex_create("y", &c23_f_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c23_h_y, 0, "ReceivedLength", c23_j_y, 1);
  sf_mex_setfieldbynum(c23_b_y, 0, "Q_SL_Info", c23_h_y, 3);
  for (c23_i2 = 0; c23_i2 < 6; c23_i2++) {
    c23_d_u[c23_i2] = ((real_T *)&((char_T *)chartInstance->c23_msg)[72])[c23_i2];
  }

  c23_k_y = NULL;
  sf_mex_assign(&c23_k_y, sf_mex_create("y", c23_d_u, 0, 0U, 1U, 0U, 1, 6),
                false);
  sf_mex_setfieldbynum(c23_b_y, 0, "Qd", c23_k_y, 4);
  c23_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [120])[0];
  c23_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [120])[4];
  c23_l_y = NULL;
  sf_mex_assign(&c23_l_y, sf_mex_createstruct("structure", 2, c23_sv1, 2, 1, 1),
                false);
  c23_g_u = c23_u_CurrentLength;
  c23_m_y = NULL;
  sf_mex_assign(&c23_m_y, sf_mex_create("y", &c23_g_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c23_l_y, 0, "CurrentLength", c23_m_y, 0);
  c23_h_u = c23_u_ReceivedLength;
  c23_n_y = NULL;
  sf_mex_assign(&c23_n_y, sf_mex_create("y", &c23_h_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c23_l_y, 0, "ReceivedLength", c23_n_y, 1);
  sf_mex_setfieldbynum(c23_b_y, 0, "Qd_SL_Info", c23_l_y, 5);
  for (c23_i3 = 0; c23_i3 < 6; c23_i3++) {
    c23_d_u[c23_i3] = ((real_T *)&((char_T *)chartInstance->c23_msg)[128])
      [c23_i3];
  }

  c23_o_y = NULL;
  sf_mex_assign(&c23_o_y, sf_mex_create("y", c23_d_u, 0, 0U, 1U, 0U, 1, 6),
                false);
  sf_mex_setfieldbynum(c23_b_y, 0, "Tau", c23_o_y, 6);
  c23_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [176])[0];
  c23_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [176])[4];
  c23_p_y = NULL;
  sf_mex_assign(&c23_p_y, sf_mex_createstruct("structure", 2, c23_sv1, 2, 1, 1),
                false);
  c23_i_u = c23_u_CurrentLength;
  c23_q_y = NULL;
  sf_mex_assign(&c23_q_y, sf_mex_create("y", &c23_i_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c23_p_y, 0, "CurrentLength", c23_q_y, 0);
  c23_j_u = c23_u_ReceivedLength;
  c23_r_y = NULL;
  sf_mex_assign(&c23_r_y, sf_mex_create("y", &c23_j_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c23_p_y, 0, "ReceivedLength", c23_r_y, 1);
  sf_mex_setfieldbynum(c23_b_y, 0, "Tau_SL_Info", c23_p_y, 7);
  sf_mex_setcell(c23_y, 0, c23_b_y);
  c23_s_y = NULL;
  sf_mex_assign(&c23_s_y, sf_mex_create("y",
    &chartInstance->c23_is_active_c23_PD_rbdl, 3, 0U, 0U, 0U, 0), false);
  sf_mex_setcell(c23_y, 1, c23_s_y);
  sf_mex_assign(&c23_st, c23_y, false);
  return c23_st;
}

static void set_sim_state_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c23_st)
{
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest c23_r;
  const mxArray *c23_u;
  int32_T c23_i;
  int32_T c23_i1;
  c23_u = sf_mex_dup(c23_st);
  c23_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c23_u, 0)),
                       "msg", &c23_r);
  for (c23_i = 0; c23_i < 8; c23_i++) {
    ((uint8_T *)&((char_T *)chartInstance->c23_msg)[0])[c23_i] =
      c23_r.ModelName[c23_i];
  }

  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[8])[0] = c23_r.ModelName_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[8])[4] = c23_r.ModelName_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[64])[0] = c23_r.Q_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[64])[4] = c23_r.Q_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[120])[0] = c23_r.Qd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[120])[4] = c23_r.Qd_SL_Info.ReceivedLength;
  for (c23_i1 = 0; c23_i1 < 6; c23_i1++) {
    ((real_T *)&((char_T *)chartInstance->c23_msg)[16])[c23_i1] = c23_r.Q[c23_i1];
    ((real_T *)&((char_T *)chartInstance->c23_msg)[72])[c23_i1] =
      c23_r.Qd[c23_i1];
    ((real_T *)&((char_T *)chartInstance->c23_msg)[128])[c23_i1] =
      c23_r.Tau[c23_i1];
  }

  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[176])[0] = c23_r.Tau_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[176])[4] = c23_r.Tau_SL_Info.ReceivedLength;
  chartInstance->c23_is_active_c23_PD_rbdl = c23_g_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c23_u, 1)),
     "is_active_c23_PD_rbdl");
  sf_mex_destroy(&c23_u);
  sf_mex_destroy(&c23_st);
}

static void sf_gateway_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance)
{
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest c23_r;
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_gpu_blankMsg;
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_gpu_msg;
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_gpu_r;
  cudaMalloc(&c23_gpu_r, 184UL);
  cudaMalloc(&c23_gpu_msg, 184UL);
  cudaMalloc(&c23_b_gpu_blankMsg, 184UL);
  chartInstance->c23_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  cudaMemcpy(c23_b_gpu_blankMsg, chartInstance->c23_blankMsg, 184UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c23_gpu_msg, chartInstance->c23_msg, 184UL, cudaMemcpyHostToDevice);
  c23_sf_gateway_c23_PD_rbdl_kernel1<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (c23_b_gpu_blankMsg, c23_gpu_msg);
  cudaMemcpy(chartInstance->c23_msg, c23_gpu_msg, 184UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c23_blankMsg, c23_b_gpu_blankMsg, 184UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[8])[0] = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_blankMsg)[8])[0];
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[8])[4] = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_blankMsg)[8])[4];
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[64])[0] = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_blankMsg)[64])[0];
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[64])[4] = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_blankMsg)[64])[4];
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[120])[0] = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_blankMsg)[120])[0];
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[120])[4] = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_blankMsg)[120])[4];
  cudaMemcpy(c23_b_gpu_blankMsg, chartInstance->c23_blankMsg, 184UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c23_gpu_msg, chartInstance->c23_msg, 184UL, cudaMemcpyHostToDevice);
  c23_sf_gateway_c23_PD_rbdl_kernel2<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (c23_b_gpu_blankMsg, c23_gpu_msg);
  cudaMemcpy(chartInstance->c23_msg, c23_gpu_msg, 184UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c23_blankMsg, c23_b_gpu_blankMsg, 184UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[176])[0] = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_blankMsg)[176])[0];
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[176])[4] = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_blankMsg)[176])[4];
  cudaMemcpy(c23_gpu_msg, chartInstance->c23_msg, 184UL, cudaMemcpyHostToDevice);
  c23_sf_gateway_c23_PD_rbdl_kernel3<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (c23_gpu_msg, c23_gpu_r);
  cudaMemcpy(chartInstance->c23_msg, c23_gpu_msg, 184UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c23_r, c23_gpu_r, 184UL, cudaMemcpyDeviceToHost);
  c23_r.ModelName_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [8])[0];
  c23_r.ModelName_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [8])[4];
  c23_r.Q_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [64])[0];
  c23_r.Q_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [64])[4];
  c23_r.Qd_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [120])[0];
  c23_r.Qd_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [120])[4];
  cudaMemcpy(c23_gpu_r, &c23_r, 184UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c23_gpu_msg, chartInstance->c23_msg, 184UL, cudaMemcpyHostToDevice);
  c23_sf_gateway_c23_PD_rbdl_kernel4<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (c23_gpu_msg, c23_gpu_r);
  cudaMemcpy(chartInstance->c23_msg, c23_gpu_msg, 184UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c23_r, c23_gpu_r, 184UL, cudaMemcpyDeviceToHost);
  c23_r.Tau_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [176])[0];
  c23_r.Tau_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [176])[4];
  c23_eML_blk_kernel(chartInstance, &c23_r);
  cudaMemcpy(c23_gpu_r, &c23_r, 184UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c23_gpu_msg, chartInstance->c23_msg, 184UL, cudaMemcpyHostToDevice);
  c23_sf_gateway_c23_PD_rbdl_kernel5<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (c23_gpu_r, c23_gpu_msg);
  cudaMemcpy(chartInstance->c23_msg, c23_gpu_msg, 184UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[8])[0] = c23_r.ModelName_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[8])[4] = c23_r.ModelName_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[64])[0] = c23_r.Q_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[64])[4] = c23_r.Q_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[120])[0] = c23_r.Qd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[120])[4] = c23_r.Qd_SL_Info.ReceivedLength;
  cudaMemcpy(c23_gpu_msg, chartInstance->c23_msg, 184UL, cudaMemcpyHostToDevice);
  c23_sf_gateway_c23_PD_rbdl_kernel6<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (c23_gpu_r, c23_gpu_msg);
  cudaMemcpy(chartInstance->c23_msg, c23_gpu_msg, 184UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[176])[0] = c23_r.Tau_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[176])[4] = c23_r.Tau_SL_Info.ReceivedLength;
  c23_do_animation_call_c23_PD_rbdl(chartInstance);
  cudaFree(c23_b_gpu_blankMsg);
  cudaFree(c23_gpu_msg);
  cudaFree(c23_gpu_r);
}

static void mdl_start_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c23_errCode;
  cudaFree(*chartInstance->c23_gpu_uv);
  cudaFree(chartInstance->c23_gpu_blankMsg);
  c23_errCode = cudaGetLastError();
  if (c23_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c23_errCode, (char_T *)cudaGetErrorName
                       (c23_errCode), (char_T *)cudaGetErrorString(c23_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c23_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *
  chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c23_PD_rbdl
  (SFc23_PD_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc23_PD_rbdl(SFc23_PD_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c23_PD_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c23_nameCaptureInfo = NULL;
  c23_nameCaptureInfo = NULL;
  sf_mex_assign(&c23_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c23_nameCaptureInfo;
}

static void c23_emlrt_marshallIn(SFc23_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c23_b_msg, const char_T *c23_identifier,
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_y)
{
  emlrtMsgIdentifier c23_thisId;
  c23_thisId.fIdentifier = const_cast<const char_T *>(c23_identifier);
  c23_thisId.fParent = NULL;
  c23_thisId.bParentIsCell = false;
  c23_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c23_b_msg), &c23_thisId,
    c23_y);
  sf_mex_destroy(&c23_b_msg);
}

static void c23_b_emlrt_marshallIn(SFc23_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c23_u, const emlrtMsgIdentifier *c23_parentId,
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_y)
{
  static const char_T *c23_fieldNames[8] = { "ModelName", "ModelName_SL_Info",
    "Q", "Q_SL_Info", "Qd", "Qd_SL_Info", "Tau", "Tau_SL_Info" };

  emlrtMsgIdentifier c23_thisId;
  c23_thisId.fParent = c23_parentId;
  c23_thisId.bParentIsCell = false;
  sf_mex_check_struct(c23_parentId, c23_u, 8, c23_fieldNames, 0U, NULL);
  c23_thisId.fIdentifier = "ModelName";
  c23_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c23_u,
    "ModelName", "ModelName", 0)), &c23_thisId, c23_y->ModelName);
  c23_thisId.fIdentifier = "ModelName_SL_Info";
  c23_y->ModelName_SL_Info = c23_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c23_u, "ModelName_SL_Info", "ModelName_SL_Info", 0)),
    &c23_thisId);
  c23_thisId.fIdentifier = "Q";
  c23_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c23_u, "Q",
    "Q", 0)), &c23_thisId, c23_y->Q);
  c23_thisId.fIdentifier = "Q_SL_Info";
  c23_y->Q_SL_Info = c23_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c23_u, "Q_SL_Info", "Q_SL_Info", 0)), &c23_thisId);
  c23_thisId.fIdentifier = "Qd";
  c23_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c23_u, "Qd",
    "Qd", 0)), &c23_thisId, c23_y->Qd);
  c23_thisId.fIdentifier = "Qd_SL_Info";
  c23_y->Qd_SL_Info = c23_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c23_u, "Qd_SL_Info", "Qd_SL_Info", 0)), &c23_thisId);
  c23_thisId.fIdentifier = "Tau";
  c23_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c23_u, "Tau",
    "Tau", 0)), &c23_thisId, c23_y->Tau);
  c23_thisId.fIdentifier = "Tau_SL_Info";
  c23_y->Tau_SL_Info = c23_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c23_u, "Tau_SL_Info", "Tau_SL_Info", 0)), &c23_thisId);
  sf_mex_destroy(&c23_u);
}

static void c23_c_emlrt_marshallIn(SFc23_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c23_u, const emlrtMsgIdentifier *c23_parentId, uint8_T c23_y[8])
{
  int32_T c23_i;
  uint8_T c23_uv[8];
  sf_mex_import(c23_parentId, sf_mex_dup(c23_u), c23_uv, 1, 3, 0U, 1, 0U, 1, 8);
  for (c23_i = 0; c23_i < 8; c23_i++) {
    c23_y[c23_i] = c23_uv[c23_i];
  }

  sf_mex_destroy(&c23_u);
}

static c23_SL_Bus_ROSVariableLengthArrayInfo c23_d_emlrt_marshallIn
  (SFc23_PD_rbdlInstanceStruct *chartInstance, const mxArray *c23_u, const
   emlrtMsgIdentifier *c23_parentId)
{
  static const char_T *c23_fieldNames[2] = { "CurrentLength", "ReceivedLength" };

  c23_SL_Bus_ROSVariableLengthArrayInfo c23_y;
  emlrtMsgIdentifier c23_thisId;
  c23_thisId.fParent = c23_parentId;
  c23_thisId.bParentIsCell = false;
  sf_mex_check_struct(c23_parentId, c23_u, 2, c23_fieldNames, 0U, NULL);
  c23_thisId.fIdentifier = "CurrentLength";
  c23_y.CurrentLength = c23_e_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c23_u, "CurrentLength", "CurrentLength", 0)), &c23_thisId);
  c23_thisId.fIdentifier = "ReceivedLength";
  c23_y.ReceivedLength = c23_e_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c23_u, "ReceivedLength", "ReceivedLength", 0)), &c23_thisId);
  sf_mex_destroy(&c23_u);
  return c23_y;
}

static uint32_T c23_e_emlrt_marshallIn(SFc23_PD_rbdlInstanceStruct
  *chartInstance, const mxArray *c23_u, const emlrtMsgIdentifier *c23_parentId)
{
  uint32_T c23_b_u;
  uint32_T c23_y;
  sf_mex_import(c23_parentId, sf_mex_dup(c23_u), &c23_b_u, 1, 7, 0U, 0, 0U, 0);
  c23_y = c23_b_u;
  sf_mex_destroy(&c23_u);
  return c23_y;
}

static void c23_f_emlrt_marshallIn(SFc23_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c23_u, const emlrtMsgIdentifier *c23_parentId, real_T c23_y[6])
{
  real_T c23_dv[6];
  int32_T c23_i;
  sf_mex_import(c23_parentId, sf_mex_dup(c23_u), c23_dv, 1, 0, 0U, 1, 0U, 1, 6);
  for (c23_i = 0; c23_i < 6; c23_i++) {
    c23_y[c23_i] = c23_dv[c23_i];
  }

  sf_mex_destroy(&c23_u);
}

static uint8_T c23_g_emlrt_marshallIn(SFc23_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c23_b_is_active_c23_PD_rbdl, const char_T *c23_identifier)
{
  emlrtMsgIdentifier c23_thisId;
  uint8_T c23_y;
  c23_thisId.fIdentifier = const_cast<const char_T *>(c23_identifier);
  c23_thisId.fParent = NULL;
  c23_thisId.bParentIsCell = false;
  c23_y = c23_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c23_b_is_active_c23_PD_rbdl), &c23_thisId);
  sf_mex_destroy(&c23_b_is_active_c23_PD_rbdl);
  return c23_y;
}

static uint8_T c23_h_emlrt_marshallIn(SFc23_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c23_u, const emlrtMsgIdentifier *c23_parentId)
{
  uint8_T c23_b_u;
  uint8_T c23_y;
  sf_mex_import(c23_parentId, sf_mex_dup(c23_u), &c23_b_u, 1, 3, 0U, 0, 0U, 0);
  c23_y = c23_b_u;
  sf_mex_destroy(&c23_u);
  return c23_y;
}

static void c23_eML_blk_kernel(SFc23_PD_rbdlInstanceStruct *chartInstance,
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_blankMsg)
{
  static uint8_T c23_uv[5] = { 104U, 117U, 109U, 97U, 110U };

  cudaMemcpy(chartInstance->c23_gpu_blankMsg, c23_b_blankMsg, 184UL,
             cudaMemcpyHostToDevice);
  c23_eML_blk_kernel_kernel7<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c23_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c23_gpu_uv, c23_uv, 5UL, cudaMemcpyHostToDevice);
  c23_eML_blk_kernel_kernel8<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c23_gpu_uv, chartInstance->c23_gpu_blankMsg);
  c23_eML_blk_kernel_kernel9<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c23_gpu_blankMsg);
  cudaMemcpy(c23_b_blankMsg, chartInstance->c23_gpu_blankMsg, 184UL,
             cudaMemcpyDeviceToHost);
}

static __global__ __launch_bounds__(32, 1) void
  c23_sf_gateway_c23_PD_rbdl_kernel1
  (c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_blankMsg,
   c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_msg)
{
  uint64_T c23_threadId;
  int32_T c23_i;
  c23_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c23_i = (int32_T)c23_threadId;
  if (c23_i < 8) {
    c23_b_msg->ModelName[c23_i] = c23_b_blankMsg->ModelName[c23_i];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c23_sf_gateway_c23_PD_rbdl_kernel2
  (c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_blankMsg,
   c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_msg)
{
  uint64_T c23_threadId;
  int32_T c23_i1;
  c23_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c23_i1 = (int32_T)c23_threadId;
  if (c23_i1 < 6) {
    c23_b_msg->Q[c23_i1] = c23_b_blankMsg->Q[c23_i1];
    c23_b_msg->Qd[c23_i1] = c23_b_blankMsg->Qd[c23_i1];
    c23_b_msg->Tau[c23_i1] = c23_b_blankMsg->Tau[c23_i1];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c23_sf_gateway_c23_PD_rbdl_kernel3
  (c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_msg,
   c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_r)
{
  uint64_T c23_threadId;
  int32_T c23_i2;
  c23_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c23_i2 = (int32_T)c23_threadId;
  if (c23_i2 < 8) {
    c23_r->ModelName[c23_i2] = c23_b_msg->ModelName[c23_i2];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c23_sf_gateway_c23_PD_rbdl_kernel4
  (c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_msg,
   c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_r)
{
  uint64_T c23_threadId;
  int32_T c23_i3;
  c23_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c23_i3 = (int32_T)c23_threadId;
  if (c23_i3 < 6) {
    c23_r->Q[c23_i3] = c23_b_msg->Q[c23_i3];
    c23_r->Qd[c23_i3] = c23_b_msg->Qd[c23_i3];
    c23_r->Tau[c23_i3] = c23_b_msg->Tau[c23_i3];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c23_sf_gateway_c23_PD_rbdl_kernel5(const
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_r,
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_msg)
{
  uint64_T c23_threadId;
  int32_T c23_i4;
  c23_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c23_i4 = (int32_T)c23_threadId;
  if (c23_i4 < 8) {
    c23_b_msg->ModelName[c23_i4] = c23_r->ModelName[c23_i4];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c23_sf_gateway_c23_PD_rbdl_kernel6(const
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_r,
  c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_msg)
{
  uint64_T c23_threadId;
  int32_T c23_i5;
  c23_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c23_i5 = (int32_T)c23_threadId;
  if (c23_i5 < 6) {
    c23_b_msg->Q[c23_i5] = c23_r->Q[c23_i5];
    c23_b_msg->Qd[c23_i5] = c23_r->Qd[c23_i5];
    c23_b_msg->Tau[c23_i5] = c23_r->Tau[c23_i5];
  }
}

static __global__ __launch_bounds__(32, 1) void c23_eML_blk_kernel_kernel7
  (c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_blankMsg)
{
  uint64_T c23_threadId;
  int32_T c23_tmpIdx;
  c23_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c23_tmpIdx = (int32_T)c23_threadId;
  if (c23_tmpIdx < 1) {
    c23_b_blankMsg->ModelName_SL_Info.CurrentLength = 5U;
  }
}

static __global__ __launch_bounds__(32, 1) void c23_eML_blk_kernel_kernel8(const
  uint8_T c23_uv[5], c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest
  *c23_b_blankMsg)
{
  uint64_T c23_threadId;
  int32_T c23_i;
  c23_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c23_i = (int32_T)c23_threadId;
  if (c23_i < 5) {
    c23_b_blankMsg->ModelName[c23_i] = c23_uv[c23_i];
  }
}

static __global__ __launch_bounds__(32, 1) void c23_eML_blk_kernel_kernel9
  (c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *c23_b_blankMsg)
{
  uint64_T c23_threadId;
  int32_T c23_tmpIdx;
  c23_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c23_tmpIdx = (int32_T)c23_threadId;
  if (c23_tmpIdx < 1) {
    c23_b_blankMsg->Q_SL_Info.CurrentLength = 6U;
    c23_b_blankMsg->Qd_SL_Info.CurrentLength = 6U;
    c23_b_blankMsg->Tau_SL_Info.CurrentLength = 6U;
  }
}

static void init_dsm_address_info(SFc23_PD_rbdlInstanceStruct *chartInstance)
{
}

static void init_simulink_io_address(SFc23_PD_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c23_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c23_blankMsg =
    (c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *)
    ssGetInputPortSignal_wrapper(chartInstance->S, 0);
  chartInstance->c23_msg =
    (c23_SL_Bus_PD_rbdl_rbdl_server_RBDLForwardDynamicsRequest *)
    ssGetOutputPortSignal_wrapper(chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c23_PD_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1908773061U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(4252016980U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(525113536U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2993307740U);
}

mxArray *sf_c23_PD_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c23_PD_rbdl_jit_fallback_info(void)
{
  const char *infoFields[] = { "fallbackType", "fallbackReason",
    "hiddenFallbackType", "hiddenFallbackReason", "incompatibleSymbol" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 5, infoFields);
  mxArray *fallbackType = mxCreateString("pre");
  mxArray *fallbackReason = mxCreateString("GPUAcceleration");
  mxArray *hiddenFallbackType = mxCreateString("none");
  mxArray *hiddenFallbackReason = mxCreateString("");
  mxArray *incompatibleSymbol = mxCreateString("");
  mxSetField(mxInfo, 0, infoFields[0], fallbackType);
  mxSetField(mxInfo, 0, infoFields[1], fallbackReason);
  mxSetField(mxInfo, 0, infoFields[2], hiddenFallbackType);
  mxSetField(mxInfo, 0, infoFields[3], hiddenFallbackReason);
  mxSetField(mxInfo, 0, infoFields[4], incompatibleSymbol);
  return mxInfo;
}

mxArray *sf_c23_PD_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c23_PD_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPiD+wMjAwAakOYCYiQECWKF8RqgYI1ycBS6uAMQllQWpIPHiomTPFCCdl5gL5ie"
    "WVnjmpeWDzbdgQJjPhsV8RiTzOaHiEPDBnjL9Ig4g/QZI+lmw6GdG0i8A5OUWp4PdDQsf8u1XcK"
    "BMP8R+DwLuF0VxP4SfWRyfmFySWZYan2xkHB/gEl+UlJIDNQ8EAAEIGEg="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c23_PD_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "scYvH40EpYswOoaWKJIjtgC";
}

static void sf_opaque_initialize_c23_PD_rbdl(void *chartInstanceVar)
{
  initialize_params_c23_PD_rbdl((SFc23_PD_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c23_PD_rbdl((SFc23_PD_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c23_PD_rbdl(void *chartInstanceVar)
{
  enable_c23_PD_rbdl((SFc23_PD_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c23_PD_rbdl(void *chartInstanceVar)
{
  disable_c23_PD_rbdl((SFc23_PD_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c23_PD_rbdl(void *chartInstanceVar)
{
  sf_gateway_c23_PD_rbdl((SFc23_PD_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c23_PD_rbdl(SimStruct* S)
{
  return get_sim_state_c23_PD_rbdl((SFc23_PD_rbdlInstanceStruct *)
    sf_get_chart_instance_ptr(S));     /* raw sim ctx */
}

static void sf_opaque_set_sim_state_c23_PD_rbdl(SimStruct* S, const mxArray *st)
{
  set_sim_state_c23_PD_rbdl((SFc23_PD_rbdlInstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_cleanup_runtime_resources_c23_PD_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc23_PD_rbdlInstanceStruct*) chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_PD_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c23_PD_rbdl((SFc23_PD_rbdlInstanceStruct*)
      chartInstanceVar);
    ((SFc23_PD_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc23_PD_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c23_PD_rbdl(void *chartInstanceVar)
{
  mdl_start_c23_PD_rbdl((SFc23_PD_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c23_PD_rbdl(void *chartInstanceVar)
{
  mdl_terminate_c23_PD_rbdl((SFc23_PD_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc23_PD_rbdl((SFc23_PD_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c23_PD_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c23_PD_rbdl((SFc23_PD_rbdlInstanceStruct*)
      sf_get_chart_instance_ptr(S));
    initSimStructsc23_PD_rbdl((SFc23_PD_rbdlInstanceStruct*)
      sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c23_PD_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u20YQphQnaIDEMIoaObRFckuOQeNDgAKNbUpC1NqxEdpJczLWy5G40XKX3R/KPvScU96",
    "hb9Br732JvEV8yyWHzFK0LFMkZVuw4RQlQNNLfvPt7Hwzsyuv0d308FrE+/G3nncLn9/g3fRG18",
    "183Ji4R+8XvIf5+D0aCRtvE0Vi7dVegsTwErTk1jApuqInS2FM9ECBoIhNpDJVbJrFljMx6FhBH",
    "Z9+HTEaBZG0PFxHWxJuCX6IbIk128jTYgqo6QCEJlLS9qMOJ/2xx8oM/QjoQNu4bgkaTGAT55be",
    "tNywhEP7AGhXaEPQY33iW2CIAd8cVC7TrVQHx0AZJ5wRUbraiOgAEgywgd0kxL9b1uCiijAaEWX",
    "WISIp6A02yDilgCIn0/hhnwlipGKEt2PuO8Np37Y5+rMpQ+A1AUHf1hWQQSKZMNX6Bx1caVuQfQ",
    "4t2Lf9arYA/rBO/FcMhqAq49bzZQqK9GFLVE6aBaR9kKk1zpJpmGExvCJqjaJ+GsLK7MXM0QFBn",
    "WAHLapgkC2yq3cUSzG8lWw27rrMnFUyNh6JrWfBMrZ2CnUqjNk6VPiEc10J25HJBqTAM9YWMaQe",
    "NmItx2nNwh2JAXbpXV0NVjAUPof5UoSsVK60AMj6zgtsLKeR1GojYx+Tt7WxMf15GtYVBlSPUCj",
    "rAoowDRizLLzVbCHTTnsEolcmc68MPMqQWShP96xoDaUaYExqmsjJEpyilcBY91FLrIRdjUVTB3",
    "NazsJRQiMIXYNhHDaxbBBbEhPtWtsa1l3KzGELNFUsKVHVYtVhG2q7hDpMYFcMhByKjpJxkPf4U",
    "XgBMNuIEkz017F/qcMOzl4mRbafeSf72Z0z7GfHdsXnowmeRgmPN/Esznu7WT9vE/9r5HarE3Z3",
    "C/MsFOwcbgnv1u+f//3447ufv09X/vwE//w9z/x/Nc+3/y/m4x+OG+24cNKpfHXY5xN+LZTw35v",
    "gX8rHmr5Jn688bidv9HBLkte//dp9a/p+xnfUqPe3WfD3+P0D1/Exy7L8VLQb5gcTNyZ2tF07/q",
    "cT/t6aEY/b+fvRdfRsPvvvVos6lsXrxql43XCVeypvLz7/g9X57M+m93JB7+VsX98jrlvAHv3py",
    "d52a0/th7xQjxfN7/PaeVds97X4+b/d5et+lv3qqu28K7abd33n3bevG76u/3sF/NI1Xse856nL",
    "xn/wznfuuZ+Pfxn/tPEjxsOSU27+GY+svbKv/4E8/QL/sq+P",
    ""
  };

  static char newstr [1249] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c23_PD_rbdl(SimStruct *S)
{
  const char* newstr = sf_c23_PD_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(3288094788U));
  ssSetChecksum1(S,(998710767U));
  ssSetChecksum2(S,(2100590107U));
  ssSetChecksum3(S,(2948097527U));
}

static void mdlRTW_c23_PD_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c23_PD_rbdl(SimStruct *S)
{
  SFc23_PD_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc23_PD_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc23_PD_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc23_PD_rbdlInstanceStruct));
  chartInstance = new (chartInstance) SFc23_PD_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway = sf_opaque_gateway_c23_PD_rbdl;
  chartInstance->chartInfo.initializeChart = sf_opaque_initialize_c23_PD_rbdl;
  chartInstance->chartInfo.mdlStart = sf_opaque_mdl_start_c23_PD_rbdl;
  chartInstance->chartInfo.mdlTerminate = sf_opaque_mdl_terminate_c23_PD_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c23_PD_rbdl;
  chartInstance->chartInfo.enableChart = sf_opaque_enable_c23_PD_rbdl;
  chartInstance->chartInfo.disableChart = sf_opaque_disable_c23_PD_rbdl;
  chartInstance->chartInfo.getSimState = sf_opaque_get_sim_state_c23_PD_rbdl;
  chartInstance->chartInfo.setSimState = sf_opaque_set_sim_state_c23_PD_rbdl;
  chartInstance->chartInfo.getSimStateInfo = sf_get_sim_state_info_c23_PD_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c23_PD_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths = mdlSetWorkWidths_c23_PD_rbdl;
  chartInstance->chartInfo.callGetHoverDataForMsg = NULL;
  chartInstance->chartInfo.extModeExec = NULL;
  chartInstance->chartInfo.restoreLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.restoreBeforeLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.storeCurrentConfiguration = NULL;
  chartInstance->chartInfo.callAtomicSubchartUserFcn = NULL;
  chartInstance->chartInfo.callAtomicSubchartAutoFcn = NULL;
  chartInstance->chartInfo.callAtomicSubchartEventFcn = NULL;
  chartInstance->chartInfo.chartStateSetterFcn = NULL;
  chartInstance->chartInfo.chartStateGetterFcn = NULL;
  chartInstance->S = S;
  chartInstance->chartInfo.dispatchToExportedFcn = NULL;
  sf_init_ChartRunTimeInfo(S, &(chartInstance->chartInfo), false, 0,
    chartInstance->c23_JITStateAnimation,
    chartInstance->c23_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c23_PD_rbdl(chartInstance);
}

void c23_PD_rbdl_method_dispatcher(SimStruct *S, int_T method, void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c23_PD_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c23_PD_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c23_PD_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c23_PD_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
