/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c39_sliding_controller_rbdl.h"
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
static void initialize_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c39_do_animation_call_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c39_st);
static void sf_gateway_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c39_emlrt_marshallIn(SFc39_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c39_b_msg, const char_T *c39_identifier,
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_y);
static void c39_b_emlrt_marshallIn(SFc39_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c39_u, const emlrtMsgIdentifier *c39_parentId,
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_y);
static void c39_c_emlrt_marshallIn(SFc39_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c39_u, const emlrtMsgIdentifier *c39_parentId,
  uint8_T c39_y[8]);
static c39_SL_Bus_ROSVariableLengthArrayInfo c39_d_emlrt_marshallIn
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c39_u, const emlrtMsgIdentifier *c39_parentId);
static uint32_T c39_e_emlrt_marshallIn
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c39_u, const emlrtMsgIdentifier *c39_parentId);
static void c39_f_emlrt_marshallIn(SFc39_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c39_u, const emlrtMsgIdentifier *c39_parentId,
  real_T c39_y[7]);
static uint8_T c39_g_emlrt_marshallIn
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c39_b_is_active_c39_sliding_controller_rbdl, const char_T *c39_identifier);
static uint8_T c39_h_emlrt_marshallIn
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c39_u, const emlrtMsgIdentifier *c39_parentId);
static void c39_eML_blk_kernel(SFc39_sliding_controller_rbdlInstanceStruct
  *chartInstance,
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
  *c39_b_blankMsg);
static __global__ void c39_sf_gateway_c39_sliding_controller_rbdl_kernel1
  (c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c39_b_blankMsg,
   c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_b_msg);
static __global__ void c39_sf_gateway_c39_sliding_controller_rbdl_kernel2
  (c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c39_b_blankMsg,
   c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_b_msg);
static __global__ void c39_sf_gateway_c39_sliding_controller_rbdl_kernel3
  (c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_b_msg,
   c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_r);
static __global__ void c39_sf_gateway_c39_sliding_controller_rbdl_kernel4
  (c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_b_msg,
   c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_r);
static __global__ void c39_sf_gateway_c39_sliding_controller_rbdl_kernel5(const
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_r,
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_b_msg);
static __global__ void c39_sf_gateway_c39_sliding_controller_rbdl_kernel6(const
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_r,
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_b_msg);
static __global__ void c39_eML_blk_kernel_kernel7
  (c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c39_b_blankMsg);
static __global__ void c39_eML_blk_kernel_kernel8(const uint8_T c39_uv[5],
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
  *c39_b_blankMsg);
static __global__ void c39_eML_blk_kernel_kernel9
  (c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c39_b_blankMsg);
static void init_dsm_address_info(SFc39_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc39_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c39_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c39_is_active_c39_sliding_controller_rbdl = 0U;
  cudaGetLastError();
  cudaMalloc(&chartInstance->c39_gpu_uv, 5UL);
  cudaMalloc(&chartInstance->c39_gpu_blankMsg, 208UL);
}

static void initialize_params_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c39_do_animation_call_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  static const char_T *c39_sv[8] = { "ModelName", "ModelName_SL_Info", "Q",
    "Q_SL_Info", "Qd", "Qd_SL_Info", "Tau", "Tau_SL_Info" };

  static const char_T *c39_sv1[2] = { "CurrentLength", "ReceivedLength" };

  const mxArray *c39_b_y = NULL;
  const mxArray *c39_c_y = NULL;
  const mxArray *c39_d_y = NULL;
  const mxArray *c39_e_y = NULL;
  const mxArray *c39_f_y = NULL;
  const mxArray *c39_g_y = NULL;
  const mxArray *c39_h_y = NULL;
  const mxArray *c39_i_y = NULL;
  const mxArray *c39_j_y = NULL;
  const mxArray *c39_k_y = NULL;
  const mxArray *c39_l_y = NULL;
  const mxArray *c39_m_y = NULL;
  const mxArray *c39_n_y = NULL;
  const mxArray *c39_o_y = NULL;
  const mxArray *c39_p_y = NULL;
  const mxArray *c39_q_y = NULL;
  const mxArray *c39_r_y = NULL;
  const mxArray *c39_s_y = NULL;
  const mxArray *c39_st;
  const mxArray *c39_y = NULL;
  real_T c39_d_u[7];
  int32_T c39_i;
  int32_T c39_i1;
  int32_T c39_i2;
  int32_T c39_i3;
  uint32_T c39_b_u;
  uint32_T c39_c_u;
  uint32_T c39_e_u;
  uint32_T c39_f_u;
  uint32_T c39_g_u;
  uint32_T c39_h_u;
  uint32_T c39_i_u;
  uint32_T c39_j_u;
  uint32_T c39_u_CurrentLength;
  uint32_T c39_u_ReceivedLength;
  uint8_T c39_u[8];
  c39_st = NULL;
  c39_y = NULL;
  sf_mex_assign(&c39_y, sf_mex_createcellmatrix(2, 1), false);
  c39_b_y = NULL;
  sf_mex_assign(&c39_b_y, sf_mex_createstruct("structure", 8, c39_sv, 2, 1, 1),
                false);
  for (c39_i = 0; c39_i < 8; c39_i++) {
    c39_u[c39_i] = ((uint8_T *)&((char_T *)chartInstance->c39_msg)[0])[c39_i];
  }

  c39_c_y = NULL;
  sf_mex_assign(&c39_c_y, sf_mex_create("y", c39_u, 3, 0U, 1U, 0U, 1, 8), false);
  sf_mex_setfieldbynum(c39_b_y, 0, "ModelName", c39_c_y, 0);
  c39_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c39_msg)
    [8])[0];
  c39_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c39_msg)
    [8])[4];
  c39_d_y = NULL;
  sf_mex_assign(&c39_d_y, sf_mex_createstruct("structure", 2, c39_sv1, 2, 1, 1),
                false);
  c39_b_u = c39_u_CurrentLength;
  c39_e_y = NULL;
  sf_mex_assign(&c39_e_y, sf_mex_create("y", &c39_b_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c39_d_y, 0, "CurrentLength", c39_e_y, 0);
  c39_c_u = c39_u_ReceivedLength;
  c39_f_y = NULL;
  sf_mex_assign(&c39_f_y, sf_mex_create("y", &c39_c_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c39_d_y, 0, "ReceivedLength", c39_f_y, 1);
  sf_mex_setfieldbynum(c39_b_y, 0, "ModelName_SL_Info", c39_d_y, 1);
  for (c39_i1 = 0; c39_i1 < 7; c39_i1++) {
    c39_d_u[c39_i1] = ((real_T *)&((char_T *)chartInstance->c39_msg)[16])[c39_i1];
  }

  c39_g_y = NULL;
  sf_mex_assign(&c39_g_y, sf_mex_create("y", c39_d_u, 0, 0U, 1U, 0U, 1, 7),
                false);
  sf_mex_setfieldbynum(c39_b_y, 0, "Q", c39_g_y, 2);
  c39_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c39_msg)
    [72])[0];
  c39_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c39_msg)
    [72])[4];
  c39_h_y = NULL;
  sf_mex_assign(&c39_h_y, sf_mex_createstruct("structure", 2, c39_sv1, 2, 1, 1),
                false);
  c39_e_u = c39_u_CurrentLength;
  c39_i_y = NULL;
  sf_mex_assign(&c39_i_y, sf_mex_create("y", &c39_e_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c39_h_y, 0, "CurrentLength", c39_i_y, 0);
  c39_f_u = c39_u_ReceivedLength;
  c39_j_y = NULL;
  sf_mex_assign(&c39_j_y, sf_mex_create("y", &c39_f_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c39_h_y, 0, "ReceivedLength", c39_j_y, 1);
  sf_mex_setfieldbynum(c39_b_y, 0, "Q_SL_Info", c39_h_y, 3);
  for (c39_i2 = 0; c39_i2 < 7; c39_i2++) {
    c39_d_u[c39_i2] = ((real_T *)&((char_T *)chartInstance->c39_msg)[80])[c39_i2];
  }

  c39_k_y = NULL;
  sf_mex_assign(&c39_k_y, sf_mex_create("y", c39_d_u, 0, 0U, 1U, 0U, 1, 7),
                false);
  sf_mex_setfieldbynum(c39_b_y, 0, "Qd", c39_k_y, 4);
  c39_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c39_msg)
    [136])[0];
  c39_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c39_msg)
    [136])[4];
  c39_l_y = NULL;
  sf_mex_assign(&c39_l_y, sf_mex_createstruct("structure", 2, c39_sv1, 2, 1, 1),
                false);
  c39_g_u = c39_u_CurrentLength;
  c39_m_y = NULL;
  sf_mex_assign(&c39_m_y, sf_mex_create("y", &c39_g_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c39_l_y, 0, "CurrentLength", c39_m_y, 0);
  c39_h_u = c39_u_ReceivedLength;
  c39_n_y = NULL;
  sf_mex_assign(&c39_n_y, sf_mex_create("y", &c39_h_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c39_l_y, 0, "ReceivedLength", c39_n_y, 1);
  sf_mex_setfieldbynum(c39_b_y, 0, "Qd_SL_Info", c39_l_y, 5);
  for (c39_i3 = 0; c39_i3 < 7; c39_i3++) {
    c39_d_u[c39_i3] = ((real_T *)&((char_T *)chartInstance->c39_msg)[144])
      [c39_i3];
  }

  c39_o_y = NULL;
  sf_mex_assign(&c39_o_y, sf_mex_create("y", c39_d_u, 0, 0U, 1U, 0U, 1, 7),
                false);
  sf_mex_setfieldbynum(c39_b_y, 0, "Tau", c39_o_y, 6);
  c39_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c39_msg)
    [200])[0];
  c39_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c39_msg)
    [200])[4];
  c39_p_y = NULL;
  sf_mex_assign(&c39_p_y, sf_mex_createstruct("structure", 2, c39_sv1, 2, 1, 1),
                false);
  c39_i_u = c39_u_CurrentLength;
  c39_q_y = NULL;
  sf_mex_assign(&c39_q_y, sf_mex_create("y", &c39_i_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c39_p_y, 0, "CurrentLength", c39_q_y, 0);
  c39_j_u = c39_u_ReceivedLength;
  c39_r_y = NULL;
  sf_mex_assign(&c39_r_y, sf_mex_create("y", &c39_j_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c39_p_y, 0, "ReceivedLength", c39_r_y, 1);
  sf_mex_setfieldbynum(c39_b_y, 0, "Tau_SL_Info", c39_p_y, 7);
  sf_mex_setcell(c39_y, 0, c39_b_y);
  c39_s_y = NULL;
  sf_mex_assign(&c39_s_y, sf_mex_create("y",
    &chartInstance->c39_is_active_c39_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c39_y, 1, c39_s_y);
  sf_mex_assign(&c39_st, c39_y, false);
  return c39_st;
}

static void set_sim_state_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c39_st)
{
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 c39_r;
  const mxArray *c39_u;
  int32_T c39_i;
  int32_T c39_i1;
  c39_u = sf_mex_dup(c39_st);
  c39_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c39_u, 0)),
                       "msg", &c39_r);
  for (c39_i = 0; c39_i < 8; c39_i++) {
    ((uint8_T *)&((char_T *)chartInstance->c39_msg)[0])[c39_i] =
      c39_r.ModelName[c39_i];
  }

  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[8])[0] = c39_r.ModelName_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[8])[4] = c39_r.ModelName_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[72])[0] = c39_r.Q_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[72])[4] = c39_r.Q_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[136])[0] = c39_r.Qd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[136])[4] = c39_r.Qd_SL_Info.ReceivedLength;
  for (c39_i1 = 0; c39_i1 < 7; c39_i1++) {
    ((real_T *)&((char_T *)chartInstance->c39_msg)[16])[c39_i1] = c39_r.Q[c39_i1];
    ((real_T *)&((char_T *)chartInstance->c39_msg)[80])[c39_i1] =
      c39_r.Qd[c39_i1];
    ((real_T *)&((char_T *)chartInstance->c39_msg)[144])[c39_i1] =
      c39_r.Tau[c39_i1];
  }

  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[200])[0] = c39_r.Tau_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[200])[4] = c39_r.Tau_SL_Info.ReceivedLength;
  chartInstance->c39_is_active_c39_sliding_controller_rbdl =
    c39_g_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c39_u, 1)),
    "is_active_c39_sliding_controller_rbdl");
  sf_mex_destroy(&c39_u);
  sf_mex_destroy(&c39_st);
}

static void sf_gateway_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 c39_r;
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
    *c39_b_gpu_blankMsg;
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_gpu_msg;
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_gpu_r;
  cudaMalloc(&c39_gpu_r, 208UL);
  cudaMalloc(&c39_gpu_msg, 208UL);
  cudaMalloc(&c39_b_gpu_blankMsg, 208UL);
  chartInstance->c39_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  cudaMemcpy(c39_b_gpu_blankMsg, chartInstance->c39_blankMsg, 208UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c39_gpu_msg, chartInstance->c39_msg, 208UL, cudaMemcpyHostToDevice);
  c39_sf_gateway_c39_sliding_controller_rbdl_kernel1<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c39_b_gpu_blankMsg, c39_gpu_msg);
  cudaMemcpy(chartInstance->c39_msg, c39_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c39_blankMsg, c39_b_gpu_blankMsg, 208UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[8])[0] = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_blankMsg)[8])[0];
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[8])[4] = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_blankMsg)[8])[4];
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[72])[0] = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_blankMsg)[72])[0];
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[72])[4] = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_blankMsg)[72])[4];
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[136])[0] = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_blankMsg)[136])[0];
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[136])[4] = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_blankMsg)[136])[4];
  cudaMemcpy(c39_b_gpu_blankMsg, chartInstance->c39_blankMsg, 208UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c39_gpu_msg, chartInstance->c39_msg, 208UL, cudaMemcpyHostToDevice);
  c39_sf_gateway_c39_sliding_controller_rbdl_kernel2<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c39_b_gpu_blankMsg, c39_gpu_msg);
  cudaMemcpy(chartInstance->c39_msg, c39_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c39_blankMsg, c39_b_gpu_blankMsg, 208UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[200])[0] = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_blankMsg)[200])[0];
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[200])[4] = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_blankMsg)[200])[4];
  cudaMemcpy(c39_gpu_msg, chartInstance->c39_msg, 208UL, cudaMemcpyHostToDevice);
  c39_sf_gateway_c39_sliding_controller_rbdl_kernel3<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c39_gpu_msg, c39_gpu_r);
  cudaMemcpy(chartInstance->c39_msg, c39_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c39_r, c39_gpu_r, 208UL, cudaMemcpyDeviceToHost);
  c39_r.ModelName_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c39_msg)
    [8])[0];
  c39_r.ModelName_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c39_msg)
    [8])[4];
  c39_r.Q_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c39_msg)
    [72])[0];
  c39_r.Q_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c39_msg)
    [72])[4];
  c39_r.Qd_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c39_msg)
    [136])[0];
  c39_r.Qd_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c39_msg)
    [136])[4];
  cudaMemcpy(c39_gpu_r, &c39_r, 208UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c39_gpu_msg, chartInstance->c39_msg, 208UL, cudaMemcpyHostToDevice);
  c39_sf_gateway_c39_sliding_controller_rbdl_kernel4<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c39_gpu_msg, c39_gpu_r);
  cudaMemcpy(chartInstance->c39_msg, c39_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c39_r, c39_gpu_r, 208UL, cudaMemcpyDeviceToHost);
  c39_r.Tau_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c39_msg)
    [200])[0];
  c39_r.Tau_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c39_msg)
    [200])[4];
  c39_eML_blk_kernel(chartInstance, &c39_r);
  cudaMemcpy(c39_gpu_r, &c39_r, 208UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c39_gpu_msg, chartInstance->c39_msg, 208UL, cudaMemcpyHostToDevice);
  c39_sf_gateway_c39_sliding_controller_rbdl_kernel5<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c39_gpu_r, c39_gpu_msg);
  cudaMemcpy(chartInstance->c39_msg, c39_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[8])[0] = c39_r.ModelName_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[8])[4] = c39_r.ModelName_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[72])[0] = c39_r.Q_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[72])[4] = c39_r.Q_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[136])[0] = c39_r.Qd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[136])[4] = c39_r.Qd_SL_Info.ReceivedLength;
  cudaMemcpy(c39_gpu_msg, chartInstance->c39_msg, 208UL, cudaMemcpyHostToDevice);
  c39_sf_gateway_c39_sliding_controller_rbdl_kernel6<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c39_gpu_r, c39_gpu_msg);
  cudaMemcpy(chartInstance->c39_msg, c39_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[200])[0] = c39_r.Tau_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c39_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c39_msg)[200])[4] = c39_r.Tau_SL_Info.ReceivedLength;
  c39_do_animation_call_c39_sliding_controller_rbdl(chartInstance);
  cudaFree(c39_b_gpu_blankMsg);
  cudaFree(c39_gpu_msg);
  cudaFree(c39_gpu_r);
}

static void mdl_start_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c39_errCode;
  cudaFree(*chartInstance->c39_gpu_uv);
  cudaFree(chartInstance->c39_gpu_blankMsg);
  c39_errCode = cudaGetLastError();
  if (c39_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c39_errCode, (char_T *)cudaGetErrorName
                       (c39_errCode), (char_T *)cudaGetErrorString(c39_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c39_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc39_sliding_controller_rbdl
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c39_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c39_nameCaptureInfo = NULL;
  c39_nameCaptureInfo = NULL;
  sf_mex_assign(&c39_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c39_nameCaptureInfo;
}

static void c39_emlrt_marshallIn(SFc39_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c39_b_msg, const char_T *c39_identifier,
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_y)
{
  emlrtMsgIdentifier c39_thisId;
  c39_thisId.fIdentifier = const_cast<const char_T *>(c39_identifier);
  c39_thisId.fParent = NULL;
  c39_thisId.bParentIsCell = false;
  c39_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c39_b_msg), &c39_thisId,
    c39_y);
  sf_mex_destroy(&c39_b_msg);
}

static void c39_b_emlrt_marshallIn(SFc39_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c39_u, const emlrtMsgIdentifier *c39_parentId,
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_y)
{
  static const char_T *c39_fieldNames[8] = { "ModelName", "ModelName_SL_Info",
    "Q", "Q_SL_Info", "Qd", "Qd_SL_Info", "Tau", "Tau_SL_Info" };

  emlrtMsgIdentifier c39_thisId;
  c39_thisId.fParent = c39_parentId;
  c39_thisId.bParentIsCell = false;
  sf_mex_check_struct(c39_parentId, c39_u, 8, c39_fieldNames, 0U, NULL);
  c39_thisId.fIdentifier = "ModelName";
  c39_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c39_u,
    "ModelName", "ModelName", 0)), &c39_thisId, c39_y->ModelName);
  c39_thisId.fIdentifier = "ModelName_SL_Info";
  c39_y->ModelName_SL_Info = c39_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c39_u, "ModelName_SL_Info", "ModelName_SL_Info", 0)),
    &c39_thisId);
  c39_thisId.fIdentifier = "Q";
  c39_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c39_u, "Q",
    "Q", 0)), &c39_thisId, c39_y->Q);
  c39_thisId.fIdentifier = "Q_SL_Info";
  c39_y->Q_SL_Info = c39_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c39_u, "Q_SL_Info", "Q_SL_Info", 0)), &c39_thisId);
  c39_thisId.fIdentifier = "Qd";
  c39_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c39_u, "Qd",
    "Qd", 0)), &c39_thisId, c39_y->Qd);
  c39_thisId.fIdentifier = "Qd_SL_Info";
  c39_y->Qd_SL_Info = c39_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c39_u, "Qd_SL_Info", "Qd_SL_Info", 0)), &c39_thisId);
  c39_thisId.fIdentifier = "Tau";
  c39_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c39_u, "Tau",
    "Tau", 0)), &c39_thisId, c39_y->Tau);
  c39_thisId.fIdentifier = "Tau_SL_Info";
  c39_y->Tau_SL_Info = c39_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c39_u, "Tau_SL_Info", "Tau_SL_Info", 0)), &c39_thisId);
  sf_mex_destroy(&c39_u);
}

static void c39_c_emlrt_marshallIn(SFc39_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c39_u, const emlrtMsgIdentifier *c39_parentId,
  uint8_T c39_y[8])
{
  int32_T c39_i;
  uint8_T c39_uv[8];
  sf_mex_import(c39_parentId, sf_mex_dup(c39_u), c39_uv, 1, 3, 0U, 1, 0U, 1, 8);
  for (c39_i = 0; c39_i < 8; c39_i++) {
    c39_y[c39_i] = c39_uv[c39_i];
  }

  sf_mex_destroy(&c39_u);
}

static c39_SL_Bus_ROSVariableLengthArrayInfo c39_d_emlrt_marshallIn
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c39_u, const emlrtMsgIdentifier *c39_parentId)
{
  static const char_T *c39_fieldNames[2] = { "CurrentLength", "ReceivedLength" };

  c39_SL_Bus_ROSVariableLengthArrayInfo c39_y;
  emlrtMsgIdentifier c39_thisId;
  c39_thisId.fParent = c39_parentId;
  c39_thisId.bParentIsCell = false;
  sf_mex_check_struct(c39_parentId, c39_u, 2, c39_fieldNames, 0U, NULL);
  c39_thisId.fIdentifier = "CurrentLength";
  c39_y.CurrentLength = c39_e_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c39_u, "CurrentLength", "CurrentLength", 0)), &c39_thisId);
  c39_thisId.fIdentifier = "ReceivedLength";
  c39_y.ReceivedLength = c39_e_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c39_u, "ReceivedLength", "ReceivedLength", 0)), &c39_thisId);
  sf_mex_destroy(&c39_u);
  return c39_y;
}

static uint32_T c39_e_emlrt_marshallIn
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c39_u, const emlrtMsgIdentifier *c39_parentId)
{
  uint32_T c39_b_u;
  uint32_T c39_y;
  sf_mex_import(c39_parentId, sf_mex_dup(c39_u), &c39_b_u, 1, 7, 0U, 0, 0U, 0);
  c39_y = c39_b_u;
  sf_mex_destroy(&c39_u);
  return c39_y;
}

static void c39_f_emlrt_marshallIn(SFc39_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c39_u, const emlrtMsgIdentifier *c39_parentId,
  real_T c39_y[7])
{
  real_T c39_dv[7];
  int32_T c39_i;
  sf_mex_import(c39_parentId, sf_mex_dup(c39_u), c39_dv, 1, 0, 0U, 1, 0U, 1, 7);
  for (c39_i = 0; c39_i < 7; c39_i++) {
    c39_y[c39_i] = c39_dv[c39_i];
  }

  sf_mex_destroy(&c39_u);
}

static uint8_T c39_g_emlrt_marshallIn
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c39_b_is_active_c39_sliding_controller_rbdl, const char_T *c39_identifier)
{
  emlrtMsgIdentifier c39_thisId;
  uint8_T c39_y;
  c39_thisId.fIdentifier = const_cast<const char_T *>(c39_identifier);
  c39_thisId.fParent = NULL;
  c39_thisId.bParentIsCell = false;
  c39_y = c39_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c39_b_is_active_c39_sliding_controller_rbdl), &c39_thisId);
  sf_mex_destroy(&c39_b_is_active_c39_sliding_controller_rbdl);
  return c39_y;
}

static uint8_T c39_h_emlrt_marshallIn
  (SFc39_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c39_u, const emlrtMsgIdentifier *c39_parentId)
{
  uint8_T c39_b_u;
  uint8_T c39_y;
  sf_mex_import(c39_parentId, sf_mex_dup(c39_u), &c39_b_u, 1, 3, 0U, 0, 0U, 0);
  c39_y = c39_b_u;
  sf_mex_destroy(&c39_u);
  return c39_y;
}

static void c39_eML_blk_kernel(SFc39_sliding_controller_rbdlInstanceStruct
  *chartInstance,
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
  *c39_b_blankMsg)
{
  static uint8_T c39_uv[5] = { 104U, 117U, 109U, 97U, 110U };

  cudaMemcpy(chartInstance->c39_gpu_blankMsg, c39_b_blankMsg, 208UL,
             cudaMemcpyHostToDevice);
  c39_eML_blk_kernel_kernel7<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c39_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c39_gpu_uv, c39_uv, 5UL, cudaMemcpyHostToDevice);
  c39_eML_blk_kernel_kernel8<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c39_gpu_uv, chartInstance->c39_gpu_blankMsg);
  c39_eML_blk_kernel_kernel9<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c39_gpu_blankMsg);
  cudaMemcpy(c39_b_blankMsg, chartInstance->c39_gpu_blankMsg, 208UL,
             cudaMemcpyDeviceToHost);
}

static __global__ __launch_bounds__(32, 1) void
  c39_sf_gateway_c39_sliding_controller_rbdl_kernel1
  (c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c39_b_blankMsg,
   c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_b_msg)
{
  uint64_T c39_threadId;
  int32_T c39_i;
  c39_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c39_i = (int32_T)c39_threadId;
  if (c39_i < 8) {
    c39_b_msg->ModelName[c39_i] = c39_b_blankMsg->ModelName[c39_i];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c39_sf_gateway_c39_sliding_controller_rbdl_kernel2
  (c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c39_b_blankMsg,
   c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_b_msg)
{
  uint64_T c39_threadId;
  int32_T c39_i1;
  c39_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c39_i1 = (int32_T)c39_threadId;
  if (c39_i1 < 7) {
    c39_b_msg->Q[c39_i1] = c39_b_blankMsg->Q[c39_i1];
    c39_b_msg->Qd[c39_i1] = c39_b_blankMsg->Qd[c39_i1];
    c39_b_msg->Tau[c39_i1] = c39_b_blankMsg->Tau[c39_i1];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c39_sf_gateway_c39_sliding_controller_rbdl_kernel3
  (c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_b_msg,
   c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_r)
{
  uint64_T c39_threadId;
  int32_T c39_i2;
  c39_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c39_i2 = (int32_T)c39_threadId;
  if (c39_i2 < 8) {
    c39_r->ModelName[c39_i2] = c39_b_msg->ModelName[c39_i2];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c39_sf_gateway_c39_sliding_controller_rbdl_kernel4
  (c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_b_msg,
   c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_r)
{
  uint64_T c39_threadId;
  int32_T c39_i3;
  c39_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c39_i3 = (int32_T)c39_threadId;
  if (c39_i3 < 7) {
    c39_r->Q[c39_i3] = c39_b_msg->Q[c39_i3];
    c39_r->Qd[c39_i3] = c39_b_msg->Qd[c39_i3];
    c39_r->Tau[c39_i3] = c39_b_msg->Tau[c39_i3];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c39_sf_gateway_c39_sliding_controller_rbdl_kernel5(const
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_r,
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_b_msg)
{
  uint64_T c39_threadId;
  int32_T c39_i4;
  c39_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c39_i4 = (int32_T)c39_threadId;
  if (c39_i4 < 8) {
    c39_b_msg->ModelName[c39_i4] = c39_r->ModelName[c39_i4];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c39_sf_gateway_c39_sliding_controller_rbdl_kernel6(const
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_r,
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c39_b_msg)
{
  uint64_T c39_threadId;
  int32_T c39_i5;
  c39_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c39_i5 = (int32_T)c39_threadId;
  if (c39_i5 < 7) {
    c39_b_msg->Q[c39_i5] = c39_r->Q[c39_i5];
    c39_b_msg->Qd[c39_i5] = c39_r->Qd[c39_i5];
    c39_b_msg->Tau[c39_i5] = c39_r->Tau[c39_i5];
  }
}

static __global__ __launch_bounds__(32, 1) void c39_eML_blk_kernel_kernel7
  (c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c39_b_blankMsg)
{
  uint64_T c39_threadId;
  int32_T c39_tmpIdx;
  c39_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c39_tmpIdx = (int32_T)c39_threadId;
  if (c39_tmpIdx < 1) {
    c39_b_blankMsg->ModelName_SL_Info.CurrentLength = 5U;
  }
}

static __global__ __launch_bounds__(32, 1) void c39_eML_blk_kernel_kernel8(const
  uint8_T c39_uv[5],
  c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
  *c39_b_blankMsg)
{
  uint64_T c39_threadId;
  int32_T c39_i;
  c39_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c39_i = (int32_T)c39_threadId;
  if (c39_i < 5) {
    c39_b_blankMsg->ModelName[c39_i] = c39_uv[c39_i];
  }
}

static __global__ __launch_bounds__(32, 1) void c39_eML_blk_kernel_kernel9
  (c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c39_b_blankMsg)
{
  uint64_T c39_threadId;
  int32_T c39_tmpIdx;
  c39_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c39_tmpIdx = (int32_T)c39_threadId;
  if (c39_tmpIdx < 1) {
    c39_b_blankMsg->Q_SL_Info.CurrentLength = 7U;
    c39_b_blankMsg->Qd_SL_Info.CurrentLength = 7U;
    c39_b_blankMsg->Tau_SL_Info.CurrentLength = 7U;
  }
}

static void init_dsm_address_info(SFc39_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc39_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
  chartInstance->c39_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c39_blankMsg =
    (c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *)
    ssGetInputPortSignal_wrapper(chartInstance->S, 0);
  chartInstance->c39_msg =
    (c39_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *)
    ssGetOutputPortSignal_wrapper(chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c39_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1446757649U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1328543342U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3523006734U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2043636117U);
}

mxArray *sf_c39_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c39_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c39_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c39_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WfBop8ZSb8AkJdbnA4JF2j4kG+/ggNl+i"
    "H2RxBwvyqK+yH8zOL4xOSSzLLU+GRjy/jinMyUzLz0+OT8vJKi/Jyc1KL4oqSUHFj8AwEAPjcei"
    "Q=="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c39_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sCgaqjKANzQMOTrp5zbdh0C";
}

static void sf_opaque_initialize_c39_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c39_sliding_controller_rbdl
    ((SFc39_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c39_sliding_controller_rbdl
    ((SFc39_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c39_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c39_sliding_controller_rbdl
    ((SFc39_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c39_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c39_sliding_controller_rbdl
    ((SFc39_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c39_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c39_sliding_controller_rbdl
    ((SFc39_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c39_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c39_sliding_controller_rbdl
    ((SFc39_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c39_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c39_sliding_controller_rbdl
    ((SFc39_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c39_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc39_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c39_sliding_controller_rbdl
      ((SFc39_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc39_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc39_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c39_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c39_sliding_controller_rbdl
    ((SFc39_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c39_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c39_sliding_controller_rbdl
    ((SFc39_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc39_sliding_controller_rbdl
    ((SFc39_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c39_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c39_sliding_controller_rbdl
      ((SFc39_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc39_sliding_controller_rbdl
      ((SFc39_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c39_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u20YQpmU3SIA0MIICyaFAcwnaY4CiQHppbVMSKtSK3VJOi1yE1XIkbrTcZfZHtvwOeYU",
    "8Q54hyEMEOQV5ggBF750lKVmmSCqOECMJSoCml/xmdma++Vl5G52uh9cNvHduet4VfF7Fu+Fl11",
    "f5emPhzt5ved/n66coJGx8SBSJtVd7CRLDn6Alt4ZJ0RFDWQpjYggKBEVsIpWp0qZZbDkT47YV1",
    "OnTf0WMRkEkLQ/3UJaEB4JPUVtizSHqaTIF1LQBQhMpaUdRm5PR3GJljv0I6FjbuM4FDSawiTNL",
    "dy03LOHQOgHaEdoQtFif2RYYYsA3J5VuOk91MAPKOOGMiFJvI6IDSDDABo6SEP8eWINOFWE0Isr",
    "sQUQmoPfZONUpBRR1Mo0fBkwQIxUjvBVz3wku23bI0Z6uDIHXBARt21NAxolkwlTzH7TR05YgAw",
    "5NGNhRtbYAnlhH/kMGx6Aq4zb05QQUGcGBqNw0DUjrJGVrniXLMMNieEjULkX+NISV2YuZowOCP",
    "EEPJapgkDrZ0T3FJhjeSm027rjMXFUyNs7I1qtgqbbWBOpYmGtrU+ETznUlrCeTfZgAT7U2iSH1",
    "sExrOU5rFvYkBtild3U1WMGQ+BzmSxGyUromBUDadx5gYzmPpFYbGfuYvM39/eXPy7COMKCGhEJ",
    "ZF1CEacCYpeGt1hYy7bhHIFplUvPKwFmGrEJ5emhF81iqMcakpomcueAYrQTGeoRcYiUcaSyaOp",
    "jjchWOEhpB6BoM49DFskFsSUy0a227WHcTZqZN0FSxpIRVi1WHbajlEmqawJEYC3ks2krGQd7js",
    "/ACYLYRJZgY7WH/UtM27l5GhZtn97yzeXb9PebZTK74/GFBz0aJHm/hWdz3WqN+3wb+tzGbvwty",
    "Xxf22SrIOdw23o/+ffPqJX92a+v265vTF2//WWf/542Lzf8b+frbWaOdF85kKV8d9rcFu7ZK9N9",
    "a0L+dr7U/Ik8e/7774PSP7kFPJT+dDsLonp/xs8LeRsHe2fs7ruNjlqX5qWgnzA8mbk1sNq6d/v",
    "sL9l5ZEY9r+fvsevfrevLf7BR5LIvX5rl4bbrKPZe3H77/nZ315LP9/15h/90C33fTud4nrltAn",
    "/74c19zFmKp96kURknOQfXVIOSF+vzQfL+onHfJcp+Lnf/LfXze32d+Xbacd8ly6/p30Tn+qeHr",
    "5oFXwG9/wn6se7762PhX3sXOQd/l61/mP3X8iPGw5NSbf8Yj7LDs6xeQp/8BAwm2wQ==",
    ""
  };

  static char newstr [1269] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c39_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c39_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(3638621530U));
  ssSetChecksum1(S,(396258500U));
  ssSetChecksum2(S,(316282884U));
  ssSetChecksum3(S,(4091724409U));
}

static void mdlRTW_c39_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c39_sliding_controller_rbdl(SimStruct *S)
{
  SFc39_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc39_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc39_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc39_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc39_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c39_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c39_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c39_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c39_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c39_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c39_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c39_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c39_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c39_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c39_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c39_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c39_sliding_controller_rbdl;
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
    chartInstance->c39_JITStateAnimation,
    chartInstance->c39_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c39_sliding_controller_rbdl(chartInstance);
}

void c39_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c39_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c39_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c39_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c39_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
