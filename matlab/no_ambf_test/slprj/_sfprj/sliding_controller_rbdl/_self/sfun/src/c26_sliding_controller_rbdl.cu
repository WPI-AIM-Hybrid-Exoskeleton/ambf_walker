/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c26_sliding_controller_rbdl.h"
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
static void initialize_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c26_do_animation_call_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c26_st);
static void sf_gateway_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c26_emlrt_marshallIn(SFc26_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c26_b_msg, const char_T *c26_identifier,
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_y);
static void c26_b_emlrt_marshallIn(SFc26_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c26_u, const emlrtMsgIdentifier *c26_parentId,
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_y);
static void c26_c_emlrt_marshallIn(SFc26_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c26_u, const emlrtMsgIdentifier *c26_parentId,
  uint8_T c26_y[8]);
static c26_SL_Bus_ROSVariableLengthArrayInfo c26_d_emlrt_marshallIn
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c26_u, const emlrtMsgIdentifier *c26_parentId);
static uint32_T c26_e_emlrt_marshallIn
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c26_u, const emlrtMsgIdentifier *c26_parentId);
static void c26_f_emlrt_marshallIn(SFc26_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c26_u, const emlrtMsgIdentifier *c26_parentId,
  real_T c26_y[7]);
static uint8_T c26_g_emlrt_marshallIn
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c26_b_is_active_c26_sliding_controller_rbdl, const char_T *c26_identifier);
static uint8_T c26_h_emlrt_marshallIn
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c26_u, const emlrtMsgIdentifier *c26_parentId);
static void c26_eML_blk_kernel(SFc26_sliding_controller_rbdlInstanceStruct
  *chartInstance,
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
  *c26_b_blankMsg);
static __global__ void c26_sf_gateway_c26_sliding_controller_rbdl_kernel1
  (c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c26_b_blankMsg,
   c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_b_msg);
static __global__ void c26_sf_gateway_c26_sliding_controller_rbdl_kernel2
  (c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c26_b_blankMsg,
   c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_b_msg);
static __global__ void c26_sf_gateway_c26_sliding_controller_rbdl_kernel3
  (c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_b_msg,
   c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_r);
static __global__ void c26_sf_gateway_c26_sliding_controller_rbdl_kernel4
  (c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_b_msg,
   c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_r);
static __global__ void c26_sf_gateway_c26_sliding_controller_rbdl_kernel5(const
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_r,
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_b_msg);
static __global__ void c26_sf_gateway_c26_sliding_controller_rbdl_kernel6(const
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_r,
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_b_msg);
static __global__ void c26_eML_blk_kernel_kernel7
  (c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c26_b_blankMsg);
static __global__ void c26_eML_blk_kernel_kernel8(const uint8_T c26_uv[3],
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
  *c26_b_blankMsg);
static __global__ void c26_eML_blk_kernel_kernel9
  (c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c26_b_blankMsg);
static void init_dsm_address_info(SFc26_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc26_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c26_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c26_is_active_c26_sliding_controller_rbdl = 0U;
  cudaGetLastError();
  cudaMalloc(&chartInstance->c26_gpu_uv, 3UL);
  cudaMalloc(&chartInstance->c26_gpu_blankMsg, 208UL);
}

static void initialize_params_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c26_do_animation_call_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  static const char_T *c26_sv[8] = { "ModelName", "ModelName_SL_Info", "Q",
    "Q_SL_Info", "Qd", "Qd_SL_Info", "Tau", "Tau_SL_Info" };

  static const char_T *c26_sv1[2] = { "CurrentLength", "ReceivedLength" };

  const mxArray *c26_b_y = NULL;
  const mxArray *c26_c_y = NULL;
  const mxArray *c26_d_y = NULL;
  const mxArray *c26_e_y = NULL;
  const mxArray *c26_f_y = NULL;
  const mxArray *c26_g_y = NULL;
  const mxArray *c26_h_y = NULL;
  const mxArray *c26_i_y = NULL;
  const mxArray *c26_j_y = NULL;
  const mxArray *c26_k_y = NULL;
  const mxArray *c26_l_y = NULL;
  const mxArray *c26_m_y = NULL;
  const mxArray *c26_n_y = NULL;
  const mxArray *c26_o_y = NULL;
  const mxArray *c26_p_y = NULL;
  const mxArray *c26_q_y = NULL;
  const mxArray *c26_r_y = NULL;
  const mxArray *c26_s_y = NULL;
  const mxArray *c26_st;
  const mxArray *c26_y = NULL;
  real_T c26_d_u[7];
  int32_T c26_i;
  int32_T c26_i1;
  int32_T c26_i2;
  int32_T c26_i3;
  uint32_T c26_b_u;
  uint32_T c26_c_u;
  uint32_T c26_e_u;
  uint32_T c26_f_u;
  uint32_T c26_g_u;
  uint32_T c26_h_u;
  uint32_T c26_i_u;
  uint32_T c26_j_u;
  uint32_T c26_u_CurrentLength;
  uint32_T c26_u_ReceivedLength;
  uint8_T c26_u[8];
  c26_st = NULL;
  c26_y = NULL;
  sf_mex_assign(&c26_y, sf_mex_createcellmatrix(2, 1), false);
  c26_b_y = NULL;
  sf_mex_assign(&c26_b_y, sf_mex_createstruct("structure", 8, c26_sv, 2, 1, 1),
                false);
  for (c26_i = 0; c26_i < 8; c26_i++) {
    c26_u[c26_i] = ((uint8_T *)&((char_T *)chartInstance->c26_msg)[0])[c26_i];
  }

  c26_c_y = NULL;
  sf_mex_assign(&c26_c_y, sf_mex_create("y", c26_u, 3, 0U, 1U, 0U, 1, 8), false);
  sf_mex_setfieldbynum(c26_b_y, 0, "ModelName", c26_c_y, 0);
  c26_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c26_msg)
    [8])[0];
  c26_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c26_msg)
    [8])[4];
  c26_d_y = NULL;
  sf_mex_assign(&c26_d_y, sf_mex_createstruct("structure", 2, c26_sv1, 2, 1, 1),
                false);
  c26_b_u = c26_u_CurrentLength;
  c26_e_y = NULL;
  sf_mex_assign(&c26_e_y, sf_mex_create("y", &c26_b_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c26_d_y, 0, "CurrentLength", c26_e_y, 0);
  c26_c_u = c26_u_ReceivedLength;
  c26_f_y = NULL;
  sf_mex_assign(&c26_f_y, sf_mex_create("y", &c26_c_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c26_d_y, 0, "ReceivedLength", c26_f_y, 1);
  sf_mex_setfieldbynum(c26_b_y, 0, "ModelName_SL_Info", c26_d_y, 1);
  for (c26_i1 = 0; c26_i1 < 7; c26_i1++) {
    c26_d_u[c26_i1] = ((real_T *)&((char_T *)chartInstance->c26_msg)[16])[c26_i1];
  }

  c26_g_y = NULL;
  sf_mex_assign(&c26_g_y, sf_mex_create("y", c26_d_u, 0, 0U, 1U, 0U, 1, 7),
                false);
  sf_mex_setfieldbynum(c26_b_y, 0, "Q", c26_g_y, 2);
  c26_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c26_msg)
    [72])[0];
  c26_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c26_msg)
    [72])[4];
  c26_h_y = NULL;
  sf_mex_assign(&c26_h_y, sf_mex_createstruct("structure", 2, c26_sv1, 2, 1, 1),
                false);
  c26_e_u = c26_u_CurrentLength;
  c26_i_y = NULL;
  sf_mex_assign(&c26_i_y, sf_mex_create("y", &c26_e_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c26_h_y, 0, "CurrentLength", c26_i_y, 0);
  c26_f_u = c26_u_ReceivedLength;
  c26_j_y = NULL;
  sf_mex_assign(&c26_j_y, sf_mex_create("y", &c26_f_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c26_h_y, 0, "ReceivedLength", c26_j_y, 1);
  sf_mex_setfieldbynum(c26_b_y, 0, "Q_SL_Info", c26_h_y, 3);
  for (c26_i2 = 0; c26_i2 < 7; c26_i2++) {
    c26_d_u[c26_i2] = ((real_T *)&((char_T *)chartInstance->c26_msg)[80])[c26_i2];
  }

  c26_k_y = NULL;
  sf_mex_assign(&c26_k_y, sf_mex_create("y", c26_d_u, 0, 0U, 1U, 0U, 1, 7),
                false);
  sf_mex_setfieldbynum(c26_b_y, 0, "Qd", c26_k_y, 4);
  c26_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c26_msg)
    [136])[0];
  c26_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c26_msg)
    [136])[4];
  c26_l_y = NULL;
  sf_mex_assign(&c26_l_y, sf_mex_createstruct("structure", 2, c26_sv1, 2, 1, 1),
                false);
  c26_g_u = c26_u_CurrentLength;
  c26_m_y = NULL;
  sf_mex_assign(&c26_m_y, sf_mex_create("y", &c26_g_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c26_l_y, 0, "CurrentLength", c26_m_y, 0);
  c26_h_u = c26_u_ReceivedLength;
  c26_n_y = NULL;
  sf_mex_assign(&c26_n_y, sf_mex_create("y", &c26_h_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c26_l_y, 0, "ReceivedLength", c26_n_y, 1);
  sf_mex_setfieldbynum(c26_b_y, 0, "Qd_SL_Info", c26_l_y, 5);
  for (c26_i3 = 0; c26_i3 < 7; c26_i3++) {
    c26_d_u[c26_i3] = ((real_T *)&((char_T *)chartInstance->c26_msg)[144])
      [c26_i3];
  }

  c26_o_y = NULL;
  sf_mex_assign(&c26_o_y, sf_mex_create("y", c26_d_u, 0, 0U, 1U, 0U, 1, 7),
                false);
  sf_mex_setfieldbynum(c26_b_y, 0, "Tau", c26_o_y, 6);
  c26_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c26_msg)
    [200])[0];
  c26_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c26_msg)
    [200])[4];
  c26_p_y = NULL;
  sf_mex_assign(&c26_p_y, sf_mex_createstruct("structure", 2, c26_sv1, 2, 1, 1),
                false);
  c26_i_u = c26_u_CurrentLength;
  c26_q_y = NULL;
  sf_mex_assign(&c26_q_y, sf_mex_create("y", &c26_i_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c26_p_y, 0, "CurrentLength", c26_q_y, 0);
  c26_j_u = c26_u_ReceivedLength;
  c26_r_y = NULL;
  sf_mex_assign(&c26_r_y, sf_mex_create("y", &c26_j_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c26_p_y, 0, "ReceivedLength", c26_r_y, 1);
  sf_mex_setfieldbynum(c26_b_y, 0, "Tau_SL_Info", c26_p_y, 7);
  sf_mex_setcell(c26_y, 0, c26_b_y);
  c26_s_y = NULL;
  sf_mex_assign(&c26_s_y, sf_mex_create("y",
    &chartInstance->c26_is_active_c26_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c26_y, 1, c26_s_y);
  sf_mex_assign(&c26_st, c26_y, false);
  return c26_st;
}

static void set_sim_state_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c26_st)
{
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 c26_r;
  const mxArray *c26_u;
  int32_T c26_i;
  int32_T c26_i1;
  c26_u = sf_mex_dup(c26_st);
  c26_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c26_u, 0)),
                       "msg", &c26_r);
  for (c26_i = 0; c26_i < 8; c26_i++) {
    ((uint8_T *)&((char_T *)chartInstance->c26_msg)[0])[c26_i] =
      c26_r.ModelName[c26_i];
  }

  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[8])[0] = c26_r.ModelName_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[8])[4] = c26_r.ModelName_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[72])[0] = c26_r.Q_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[72])[4] = c26_r.Q_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[136])[0] = c26_r.Qd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[136])[4] = c26_r.Qd_SL_Info.ReceivedLength;
  for (c26_i1 = 0; c26_i1 < 7; c26_i1++) {
    ((real_T *)&((char_T *)chartInstance->c26_msg)[16])[c26_i1] = c26_r.Q[c26_i1];
    ((real_T *)&((char_T *)chartInstance->c26_msg)[80])[c26_i1] =
      c26_r.Qd[c26_i1];
    ((real_T *)&((char_T *)chartInstance->c26_msg)[144])[c26_i1] =
      c26_r.Tau[c26_i1];
  }

  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[200])[0] = c26_r.Tau_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[200])[4] = c26_r.Tau_SL_Info.ReceivedLength;
  chartInstance->c26_is_active_c26_sliding_controller_rbdl =
    c26_g_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c26_u, 1)),
    "is_active_c26_sliding_controller_rbdl");
  sf_mex_destroy(&c26_u);
  sf_mex_destroy(&c26_st);
}

static void sf_gateway_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 c26_r;
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
    *c26_b_gpu_blankMsg;
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_gpu_msg;
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_gpu_r;
  cudaMalloc(&c26_gpu_r, 208UL);
  cudaMalloc(&c26_gpu_msg, 208UL);
  cudaMalloc(&c26_b_gpu_blankMsg, 208UL);
  chartInstance->c26_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  cudaMemcpy(c26_b_gpu_blankMsg, chartInstance->c26_blankMsg, 208UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c26_gpu_msg, chartInstance->c26_msg, 208UL, cudaMemcpyHostToDevice);
  c26_sf_gateway_c26_sliding_controller_rbdl_kernel1<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c26_b_gpu_blankMsg, c26_gpu_msg);
  cudaMemcpy(chartInstance->c26_msg, c26_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c26_blankMsg, c26_b_gpu_blankMsg, 208UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[8])[0] = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_blankMsg)[8])[0];
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[8])[4] = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_blankMsg)[8])[4];
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[72])[0] = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_blankMsg)[72])[0];
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[72])[4] = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_blankMsg)[72])[4];
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[136])[0] = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_blankMsg)[136])[0];
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[136])[4] = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_blankMsg)[136])[4];
  cudaMemcpy(c26_b_gpu_blankMsg, chartInstance->c26_blankMsg, 208UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c26_gpu_msg, chartInstance->c26_msg, 208UL, cudaMemcpyHostToDevice);
  c26_sf_gateway_c26_sliding_controller_rbdl_kernel2<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c26_b_gpu_blankMsg, c26_gpu_msg);
  cudaMemcpy(chartInstance->c26_msg, c26_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c26_blankMsg, c26_b_gpu_blankMsg, 208UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[200])[0] = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_blankMsg)[200])[0];
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[200])[4] = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_blankMsg)[200])[4];
  cudaMemcpy(c26_gpu_msg, chartInstance->c26_msg, 208UL, cudaMemcpyHostToDevice);
  c26_sf_gateway_c26_sliding_controller_rbdl_kernel3<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c26_gpu_msg, c26_gpu_r);
  cudaMemcpy(chartInstance->c26_msg, c26_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c26_r, c26_gpu_r, 208UL, cudaMemcpyDeviceToHost);
  c26_r.ModelName_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c26_msg)
    [8])[0];
  c26_r.ModelName_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c26_msg)
    [8])[4];
  c26_r.Q_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c26_msg)
    [72])[0];
  c26_r.Q_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c26_msg)
    [72])[4];
  c26_r.Qd_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c26_msg)
    [136])[0];
  c26_r.Qd_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c26_msg)
    [136])[4];
  cudaMemcpy(c26_gpu_r, &c26_r, 208UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c26_gpu_msg, chartInstance->c26_msg, 208UL, cudaMemcpyHostToDevice);
  c26_sf_gateway_c26_sliding_controller_rbdl_kernel4<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c26_gpu_msg, c26_gpu_r);
  cudaMemcpy(chartInstance->c26_msg, c26_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c26_r, c26_gpu_r, 208UL, cudaMemcpyDeviceToHost);
  c26_r.Tau_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c26_msg)
    [200])[0];
  c26_r.Tau_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c26_msg)
    [200])[4];
  c26_eML_blk_kernel(chartInstance, &c26_r);
  cudaMemcpy(c26_gpu_r, &c26_r, 208UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c26_gpu_msg, chartInstance->c26_msg, 208UL, cudaMemcpyHostToDevice);
  c26_sf_gateway_c26_sliding_controller_rbdl_kernel5<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c26_gpu_r, c26_gpu_msg);
  cudaMemcpy(chartInstance->c26_msg, c26_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[8])[0] = c26_r.ModelName_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[8])[4] = c26_r.ModelName_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[72])[0] = c26_r.Q_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[72])[4] = c26_r.Q_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[136])[0] = c26_r.Qd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[136])[4] = c26_r.Qd_SL_Info.ReceivedLength;
  cudaMemcpy(c26_gpu_msg, chartInstance->c26_msg, 208UL, cudaMemcpyHostToDevice);
  c26_sf_gateway_c26_sliding_controller_rbdl_kernel6<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c26_gpu_r, c26_gpu_msg);
  cudaMemcpy(chartInstance->c26_msg, c26_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[200])[0] = c26_r.Tau_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c26_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c26_msg)[200])[4] = c26_r.Tau_SL_Info.ReceivedLength;
  c26_do_animation_call_c26_sliding_controller_rbdl(chartInstance);
  cudaFree(c26_b_gpu_blankMsg);
  cudaFree(c26_gpu_msg);
  cudaFree(c26_gpu_r);
}

static void mdl_start_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c26_errCode;
  cudaFree(*chartInstance->c26_gpu_uv);
  cudaFree(chartInstance->c26_gpu_blankMsg);
  c26_errCode = cudaGetLastError();
  if (c26_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c26_errCode, (char_T *)cudaGetErrorName
                       (c26_errCode), (char_T *)cudaGetErrorString(c26_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c26_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc26_sliding_controller_rbdl
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c26_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c26_nameCaptureInfo = NULL;
  c26_nameCaptureInfo = NULL;
  sf_mex_assign(&c26_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c26_nameCaptureInfo;
}

static void c26_emlrt_marshallIn(SFc26_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c26_b_msg, const char_T *c26_identifier,
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_y)
{
  emlrtMsgIdentifier c26_thisId;
  c26_thisId.fIdentifier = const_cast<const char_T *>(c26_identifier);
  c26_thisId.fParent = NULL;
  c26_thisId.bParentIsCell = false;
  c26_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c26_b_msg), &c26_thisId,
    c26_y);
  sf_mex_destroy(&c26_b_msg);
}

static void c26_b_emlrt_marshallIn(SFc26_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c26_u, const emlrtMsgIdentifier *c26_parentId,
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_y)
{
  static const char_T *c26_fieldNames[8] = { "ModelName", "ModelName_SL_Info",
    "Q", "Q_SL_Info", "Qd", "Qd_SL_Info", "Tau", "Tau_SL_Info" };

  emlrtMsgIdentifier c26_thisId;
  c26_thisId.fParent = c26_parentId;
  c26_thisId.bParentIsCell = false;
  sf_mex_check_struct(c26_parentId, c26_u, 8, c26_fieldNames, 0U, NULL);
  c26_thisId.fIdentifier = "ModelName";
  c26_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c26_u,
    "ModelName", "ModelName", 0)), &c26_thisId, c26_y->ModelName);
  c26_thisId.fIdentifier = "ModelName_SL_Info";
  c26_y->ModelName_SL_Info = c26_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c26_u, "ModelName_SL_Info", "ModelName_SL_Info", 0)),
    &c26_thisId);
  c26_thisId.fIdentifier = "Q";
  c26_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c26_u, "Q",
    "Q", 0)), &c26_thisId, c26_y->Q);
  c26_thisId.fIdentifier = "Q_SL_Info";
  c26_y->Q_SL_Info = c26_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c26_u, "Q_SL_Info", "Q_SL_Info", 0)), &c26_thisId);
  c26_thisId.fIdentifier = "Qd";
  c26_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c26_u, "Qd",
    "Qd", 0)), &c26_thisId, c26_y->Qd);
  c26_thisId.fIdentifier = "Qd_SL_Info";
  c26_y->Qd_SL_Info = c26_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c26_u, "Qd_SL_Info", "Qd_SL_Info", 0)), &c26_thisId);
  c26_thisId.fIdentifier = "Tau";
  c26_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c26_u, "Tau",
    "Tau", 0)), &c26_thisId, c26_y->Tau);
  c26_thisId.fIdentifier = "Tau_SL_Info";
  c26_y->Tau_SL_Info = c26_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c26_u, "Tau_SL_Info", "Tau_SL_Info", 0)), &c26_thisId);
  sf_mex_destroy(&c26_u);
}

static void c26_c_emlrt_marshallIn(SFc26_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c26_u, const emlrtMsgIdentifier *c26_parentId,
  uint8_T c26_y[8])
{
  int32_T c26_i;
  uint8_T c26_uv[8];
  sf_mex_import(c26_parentId, sf_mex_dup(c26_u), c26_uv, 1, 3, 0U, 1, 0U, 1, 8);
  for (c26_i = 0; c26_i < 8; c26_i++) {
    c26_y[c26_i] = c26_uv[c26_i];
  }

  sf_mex_destroy(&c26_u);
}

static c26_SL_Bus_ROSVariableLengthArrayInfo c26_d_emlrt_marshallIn
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c26_u, const emlrtMsgIdentifier *c26_parentId)
{
  static const char_T *c26_fieldNames[2] = { "CurrentLength", "ReceivedLength" };

  c26_SL_Bus_ROSVariableLengthArrayInfo c26_y;
  emlrtMsgIdentifier c26_thisId;
  c26_thisId.fParent = c26_parentId;
  c26_thisId.bParentIsCell = false;
  sf_mex_check_struct(c26_parentId, c26_u, 2, c26_fieldNames, 0U, NULL);
  c26_thisId.fIdentifier = "CurrentLength";
  c26_y.CurrentLength = c26_e_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c26_u, "CurrentLength", "CurrentLength", 0)), &c26_thisId);
  c26_thisId.fIdentifier = "ReceivedLength";
  c26_y.ReceivedLength = c26_e_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c26_u, "ReceivedLength", "ReceivedLength", 0)), &c26_thisId);
  sf_mex_destroy(&c26_u);
  return c26_y;
}

static uint32_T c26_e_emlrt_marshallIn
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c26_u, const emlrtMsgIdentifier *c26_parentId)
{
  uint32_T c26_b_u;
  uint32_T c26_y;
  sf_mex_import(c26_parentId, sf_mex_dup(c26_u), &c26_b_u, 1, 7, 0U, 0, 0U, 0);
  c26_y = c26_b_u;
  sf_mex_destroy(&c26_u);
  return c26_y;
}

static void c26_f_emlrt_marshallIn(SFc26_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c26_u, const emlrtMsgIdentifier *c26_parentId,
  real_T c26_y[7])
{
  real_T c26_dv[7];
  int32_T c26_i;
  sf_mex_import(c26_parentId, sf_mex_dup(c26_u), c26_dv, 1, 0, 0U, 1, 0U, 1, 7);
  for (c26_i = 0; c26_i < 7; c26_i++) {
    c26_y[c26_i] = c26_dv[c26_i];
  }

  sf_mex_destroy(&c26_u);
}

static uint8_T c26_g_emlrt_marshallIn
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c26_b_is_active_c26_sliding_controller_rbdl, const char_T *c26_identifier)
{
  emlrtMsgIdentifier c26_thisId;
  uint8_T c26_y;
  c26_thisId.fIdentifier = const_cast<const char_T *>(c26_identifier);
  c26_thisId.fParent = NULL;
  c26_thisId.bParentIsCell = false;
  c26_y = c26_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c26_b_is_active_c26_sliding_controller_rbdl), &c26_thisId);
  sf_mex_destroy(&c26_b_is_active_c26_sliding_controller_rbdl);
  return c26_y;
}

static uint8_T c26_h_emlrt_marshallIn
  (SFc26_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c26_u, const emlrtMsgIdentifier *c26_parentId)
{
  uint8_T c26_b_u;
  uint8_T c26_y;
  sf_mex_import(c26_parentId, sf_mex_dup(c26_u), &c26_b_u, 1, 3, 0U, 0, 0U, 0);
  c26_y = c26_b_u;
  sf_mex_destroy(&c26_u);
  return c26_y;
}

static void c26_eML_blk_kernel(SFc26_sliding_controller_rbdlInstanceStruct
  *chartInstance,
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
  *c26_b_blankMsg)
{
  static uint8_T c26_uv[3] = { 101U, 120U, 111U };

  cudaMemcpy(chartInstance->c26_gpu_blankMsg, c26_b_blankMsg, 208UL,
             cudaMemcpyHostToDevice);
  c26_eML_blk_kernel_kernel7<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c26_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c26_gpu_uv, c26_uv, 3UL, cudaMemcpyHostToDevice);
  c26_eML_blk_kernel_kernel8<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c26_gpu_uv, chartInstance->c26_gpu_blankMsg);
  c26_eML_blk_kernel_kernel9<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c26_gpu_blankMsg);
  cudaMemcpy(c26_b_blankMsg, chartInstance->c26_gpu_blankMsg, 208UL,
             cudaMemcpyDeviceToHost);
}

static __global__ __launch_bounds__(32, 1) void
  c26_sf_gateway_c26_sliding_controller_rbdl_kernel1
  (c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c26_b_blankMsg,
   c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_b_msg)
{
  uint64_T c26_threadId;
  int32_T c26_i;
  c26_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c26_i = (int32_T)c26_threadId;
  if (c26_i < 8) {
    c26_b_msg->ModelName[c26_i] = c26_b_blankMsg->ModelName[c26_i];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c26_sf_gateway_c26_sliding_controller_rbdl_kernel2
  (c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c26_b_blankMsg,
   c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_b_msg)
{
  uint64_T c26_threadId;
  int32_T c26_i1;
  c26_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c26_i1 = (int32_T)c26_threadId;
  if (c26_i1 < 7) {
    c26_b_msg->Q[c26_i1] = c26_b_blankMsg->Q[c26_i1];
    c26_b_msg->Qd[c26_i1] = c26_b_blankMsg->Qd[c26_i1];
    c26_b_msg->Tau[c26_i1] = c26_b_blankMsg->Tau[c26_i1];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c26_sf_gateway_c26_sliding_controller_rbdl_kernel3
  (c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_b_msg,
   c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_r)
{
  uint64_T c26_threadId;
  int32_T c26_i2;
  c26_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c26_i2 = (int32_T)c26_threadId;
  if (c26_i2 < 8) {
    c26_r->ModelName[c26_i2] = c26_b_msg->ModelName[c26_i2];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c26_sf_gateway_c26_sliding_controller_rbdl_kernel4
  (c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_b_msg,
   c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_r)
{
  uint64_T c26_threadId;
  int32_T c26_i3;
  c26_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c26_i3 = (int32_T)c26_threadId;
  if (c26_i3 < 7) {
    c26_r->Q[c26_i3] = c26_b_msg->Q[c26_i3];
    c26_r->Qd[c26_i3] = c26_b_msg->Qd[c26_i3];
    c26_r->Tau[c26_i3] = c26_b_msg->Tau[c26_i3];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c26_sf_gateway_c26_sliding_controller_rbdl_kernel5(const
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_r,
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_b_msg)
{
  uint64_T c26_threadId;
  int32_T c26_i4;
  c26_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c26_i4 = (int32_T)c26_threadId;
  if (c26_i4 < 8) {
    c26_b_msg->ModelName[c26_i4] = c26_r->ModelName[c26_i4];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c26_sf_gateway_c26_sliding_controller_rbdl_kernel6(const
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_r,
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c26_b_msg)
{
  uint64_T c26_threadId;
  int32_T c26_i5;
  c26_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c26_i5 = (int32_T)c26_threadId;
  if (c26_i5 < 7) {
    c26_b_msg->Q[c26_i5] = c26_r->Q[c26_i5];
    c26_b_msg->Qd[c26_i5] = c26_r->Qd[c26_i5];
    c26_b_msg->Tau[c26_i5] = c26_r->Tau[c26_i5];
  }
}

static __global__ __launch_bounds__(32, 1) void c26_eML_blk_kernel_kernel7
  (c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c26_b_blankMsg)
{
  uint64_T c26_threadId;
  int32_T c26_tmpIdx;
  c26_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c26_tmpIdx = (int32_T)c26_threadId;
  if (c26_tmpIdx < 1) {
    c26_b_blankMsg->ModelName_SL_Info.CurrentLength = 3U;
  }
}

static __global__ __launch_bounds__(32, 1) void c26_eML_blk_kernel_kernel8(const
  uint8_T c26_uv[3],
  c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
  *c26_b_blankMsg)
{
  uint64_T c26_threadId;
  int32_T c26_i;
  c26_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c26_i = (int32_T)c26_threadId;
  if (c26_i < 3) {
    c26_b_blankMsg->ModelName[c26_i] = c26_uv[c26_i];
  }
}

static __global__ __launch_bounds__(32, 1) void c26_eML_blk_kernel_kernel9
  (c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c26_b_blankMsg)
{
  uint64_T c26_threadId;
  int32_T c26_tmpIdx;
  c26_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c26_tmpIdx = (int32_T)c26_threadId;
  if (c26_tmpIdx < 1) {
    c26_b_blankMsg->Q_SL_Info.CurrentLength = 7U;
    c26_b_blankMsg->Qd_SL_Info.CurrentLength = 7U;
    c26_b_blankMsg->Tau_SL_Info.CurrentLength = 7U;
  }
}

static void init_dsm_address_info(SFc26_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc26_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
  chartInstance->c26_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c26_blankMsg =
    (c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *)
    ssGetInputPortSignal_wrapper(chartInstance->S, 0);
  chartInstance->c26_msg =
    (c26_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *)
    ssGetOutputPortSignal_wrapper(chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c26_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(590713265U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(2431965276U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(4137784681U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(63624825U);
}

mxArray *sf_c26_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c26_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c26_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c26_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WfBop8ZSb8AkJdbnA4JF2j4kG+/ggNl+i"
    "H2RxBwvyqK+yH8zOL4xOSSzLLU+GQjs/jinMyUzLz0+OT8vJKi/Jyc1KL4oqSUHFj8AwEAPaYeh"
    "Q=="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c26_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sd6D4Ot9C8kffXwxtaQFSbB";
}

static void sf_opaque_initialize_c26_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c26_sliding_controller_rbdl
    ((SFc26_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c26_sliding_controller_rbdl
    ((SFc26_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c26_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c26_sliding_controller_rbdl
    ((SFc26_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c26_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c26_sliding_controller_rbdl
    ((SFc26_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c26_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c26_sliding_controller_rbdl
    ((SFc26_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c26_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c26_sliding_controller_rbdl
    ((SFc26_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c26_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c26_sliding_controller_rbdl
    ((SFc26_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c26_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc26_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c26_sliding_controller_rbdl
      ((SFc26_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc26_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc26_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c26_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c26_sliding_controller_rbdl
    ((SFc26_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c26_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c26_sliding_controller_rbdl
    ((SFc26_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc26_sliding_controller_rbdl
    ((SFc26_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c26_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c26_sliding_controller_rbdl
      ((SFc26_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc26_sliding_controller_rbdl
      ((SFc26_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c26_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV09v00gUd9MuAolFFUKCAxJcqt3jaoUQXKCNk4hILe2u28Jpo8n4JR5lPGPmT9J+AW4c4Hs",
    "g8Uk48xH2sIeV9gvsG9tJU8d2KBEVu8KS6479e2/ee7/3Z+Ktdfc8vG7gvX3T867g8yreDS+7fs",
    "jXa3N39n7D+ylfv0EhYeMDokisvdpLkBh+By25NUyKrhjIUhgTA1AgKGITqUyVNs1iy5kYdaygT",
    "p9+ETEaBZG0PGyiLAn3BT9FbYk1B6inxRRQ0wEITaSkHUYdToYzi5WZ+BHQkbZxnQsaTGATZ5be",
    "s9ywhEP7BGhXaEPQYn1mW2CIAd+cVLrpPNXBFCjjhDMiSr2NiA4gwQAbOEpC/LtvDTpVhNGIKNO",
    "EiIxB77JRqlMKKOpkGj/0mSBGKkZ4O+a+E1y07YCjPXsyBF4TELStqYCMEsmEqeY/6KCnbUH6HF",
    "rQt8NqbQG8so78YwYTUJVxG/hyDIoMYV9UbpoGpH2SsjXLkkWYYTEcE7VDkT8NYWX2YubogCBPc",
    "IgSVTBInezqQ8XGGN5KbTbuusxcVjI2zsjWy2CptvYY6liYaetQ4RPOdSXsUCa7MAaeam0RQ+ph",
    "mdZynNYsPJQYYJfe1dVgBUPic5gvRchK6RoXAGnfeY6N5TySWm1k7GPytnZ3Fz8vwrrCgBoQCmV",
    "dQBGmAWOWhrdaW8i04x6BaJVJzSsDZxmyDOXpgRWtiVQjjElNEzlzwTFaCYz1ELnESjjSWDR1MM",
    "flMhwlNILQNRjGYQ/LBrElMdGute1g3Y2ZOW2BpoolJaxarDpsQ22XUKcJHImRkBPRUTIO8h6fh",
    "RcAs40owcSwif1LnXZw9zIq3Dz7xTubZ9c/Y55N5YrPn+f0rJXo8eaexX2vNer3beB/a9P5Oyf3",
    "Y2GfjYKcw23ivbMe/9V9/f7PO62PjX/+ePd2lf0/NC42/2/k67vTRjsrnPFCvjrsszm7Nkr0357",
    "Tv5mvdfiw9WDfPPYfjQaDl5MTQ37rBP1mxs8SexsFe6fv77uOj1mW5qei3TA/mLg1sdm4dvofzd",
    "l7ZUk8ruXvs+vvp6vJ39ou8lgWr/Vz8Vp3lXsub798//vbq8ln+79cYv9Wge+tdK73iOsW0KO/P",
    "uxpzkIs9R6VwijJOaie6oe8UJ9fmu8XlfMuWe6/Yud3ua/P++fMr8uW8y5ZblX/LjrHvzV83Tzw",
    "CvjNb9iPVc9XXxv/ybvYOehevn4y+6njR4yHJafe/DMeYQdlX/8HefovuHy1Fw==",
    ""
  };

  static char newstr [1265] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c26_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c26_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(3966567233U));
  ssSetChecksum1(S,(3903686217U));
  ssSetChecksum2(S,(47072280U));
  ssSetChecksum3(S,(2442288883U));
}

static void mdlRTW_c26_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c26_sliding_controller_rbdl(SimStruct *S)
{
  SFc26_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc26_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc26_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc26_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc26_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c26_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c26_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c26_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c26_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c26_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c26_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c26_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c26_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c26_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c26_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c26_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c26_sliding_controller_rbdl;
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
    chartInstance->c26_JITStateAnimation,
    chartInstance->c26_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c26_sliding_controller_rbdl(chartInstance);
}

void c26_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c26_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c26_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c26_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c26_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
