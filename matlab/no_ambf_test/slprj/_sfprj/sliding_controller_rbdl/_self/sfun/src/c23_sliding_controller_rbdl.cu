/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c23_sliding_controller_rbdl.h"
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
static void initialize_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c23_do_animation_call_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c23_st);
static void sf_gateway_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c23_emlrt_marshallIn(SFc23_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c23_b_msg, const char_T *c23_identifier,
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_y);
static void c23_b_emlrt_marshallIn(SFc23_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c23_u, const emlrtMsgIdentifier *c23_parentId,
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_y);
static void c23_c_emlrt_marshallIn(SFc23_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c23_u, const emlrtMsgIdentifier *c23_parentId,
  uint8_T c23_y[8]);
static c23_SL_Bus_ROSVariableLengthArrayInfo c23_d_emlrt_marshallIn
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c23_u, const emlrtMsgIdentifier *c23_parentId);
static uint32_T c23_e_emlrt_marshallIn
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c23_u, const emlrtMsgIdentifier *c23_parentId);
static void c23_f_emlrt_marshallIn(SFc23_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c23_u, const emlrtMsgIdentifier *c23_parentId,
  real_T c23_y[7]);
static uint8_T c23_g_emlrt_marshallIn
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c23_b_is_active_c23_sliding_controller_rbdl, const char_T *c23_identifier);
static uint8_T c23_h_emlrt_marshallIn
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c23_u, const emlrtMsgIdentifier *c23_parentId);
static void c23_eML_blk_kernel(SFc23_sliding_controller_rbdlInstanceStruct
  *chartInstance,
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
  *c23_b_blankMsg);
static __global__ void c23_sf_gateway_c23_sliding_controller_rbdl_kernel1
  (c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c23_b_blankMsg,
   c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_b_msg);
static __global__ void c23_sf_gateway_c23_sliding_controller_rbdl_kernel2
  (c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c23_b_blankMsg,
   c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_b_msg);
static __global__ void c23_sf_gateway_c23_sliding_controller_rbdl_kernel3
  (c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_b_msg,
   c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_r);
static __global__ void c23_sf_gateway_c23_sliding_controller_rbdl_kernel4
  (c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_b_msg,
   c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_r);
static __global__ void c23_sf_gateway_c23_sliding_controller_rbdl_kernel5(const
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_r,
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_b_msg);
static __global__ void c23_sf_gateway_c23_sliding_controller_rbdl_kernel6(const
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_r,
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_b_msg);
static __global__ void c23_eML_blk_kernel_kernel7
  (c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c23_b_blankMsg);
static __global__ void c23_eML_blk_kernel_kernel8(const uint8_T c23_uv[5],
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
  *c23_b_blankMsg);
static __global__ void c23_eML_blk_kernel_kernel9
  (c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c23_b_blankMsg);
static void init_dsm_address_info(SFc23_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc23_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c23_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c23_is_active_c23_sliding_controller_rbdl = 0U;
  cudaGetLastError();
  cudaMalloc(&chartInstance->c23_gpu_uv, 5UL);
  cudaMalloc(&chartInstance->c23_gpu_blankMsg, 208UL);
}

static void initialize_params_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c23_do_animation_call_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance)
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
  real_T c23_d_u[7];
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
  for (c23_i1 = 0; c23_i1 < 7; c23_i1++) {
    c23_d_u[c23_i1] = ((real_T *)&((char_T *)chartInstance->c23_msg)[16])[c23_i1];
  }

  c23_g_y = NULL;
  sf_mex_assign(&c23_g_y, sf_mex_create("y", c23_d_u, 0, 0U, 1U, 0U, 1, 7),
                false);
  sf_mex_setfieldbynum(c23_b_y, 0, "Q", c23_g_y, 2);
  c23_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [72])[0];
  c23_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [72])[4];
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
  for (c23_i2 = 0; c23_i2 < 7; c23_i2++) {
    c23_d_u[c23_i2] = ((real_T *)&((char_T *)chartInstance->c23_msg)[80])[c23_i2];
  }

  c23_k_y = NULL;
  sf_mex_assign(&c23_k_y, sf_mex_create("y", c23_d_u, 0, 0U, 1U, 0U, 1, 7),
                false);
  sf_mex_setfieldbynum(c23_b_y, 0, "Qd", c23_k_y, 4);
  c23_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [136])[0];
  c23_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [136])[4];
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
  for (c23_i3 = 0; c23_i3 < 7; c23_i3++) {
    c23_d_u[c23_i3] = ((real_T *)&((char_T *)chartInstance->c23_msg)[144])
      [c23_i3];
  }

  c23_o_y = NULL;
  sf_mex_assign(&c23_o_y, sf_mex_create("y", c23_d_u, 0, 0U, 1U, 0U, 1, 7),
                false);
  sf_mex_setfieldbynum(c23_b_y, 0, "Tau", c23_o_y, 6);
  c23_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [200])[0];
  c23_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [200])[4];
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
    &chartInstance->c23_is_active_c23_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c23_y, 1, c23_s_y);
  sf_mex_assign(&c23_st, c23_y, false);
  return c23_st;
}

static void set_sim_state_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c23_st)
{
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 c23_r;
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
    chartInstance->c23_msg)[72])[0] = c23_r.Q_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[72])[4] = c23_r.Q_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[136])[0] = c23_r.Qd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[136])[4] = c23_r.Qd_SL_Info.ReceivedLength;
  for (c23_i1 = 0; c23_i1 < 7; c23_i1++) {
    ((real_T *)&((char_T *)chartInstance->c23_msg)[16])[c23_i1] = c23_r.Q[c23_i1];
    ((real_T *)&((char_T *)chartInstance->c23_msg)[80])[c23_i1] =
      c23_r.Qd[c23_i1];
    ((real_T *)&((char_T *)chartInstance->c23_msg)[144])[c23_i1] =
      c23_r.Tau[c23_i1];
  }

  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[200])[0] = c23_r.Tau_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[200])[4] = c23_r.Tau_SL_Info.ReceivedLength;
  chartInstance->c23_is_active_c23_sliding_controller_rbdl =
    c23_g_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c23_u, 1)),
    "is_active_c23_sliding_controller_rbdl");
  sf_mex_destroy(&c23_u);
  sf_mex_destroy(&c23_st);
}

static void sf_gateway_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 c23_r;
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
    *c23_b_gpu_blankMsg;
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_gpu_msg;
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_gpu_r;
  cudaMalloc(&c23_gpu_r, 208UL);
  cudaMalloc(&c23_gpu_msg, 208UL);
  cudaMalloc(&c23_b_gpu_blankMsg, 208UL);
  chartInstance->c23_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  cudaMemcpy(c23_b_gpu_blankMsg, chartInstance->c23_blankMsg, 208UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c23_gpu_msg, chartInstance->c23_msg, 208UL, cudaMemcpyHostToDevice);
  c23_sf_gateway_c23_sliding_controller_rbdl_kernel1<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c23_b_gpu_blankMsg, c23_gpu_msg);
  cudaMemcpy(chartInstance->c23_msg, c23_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c23_blankMsg, c23_b_gpu_blankMsg, 208UL,
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
    chartInstance->c23_msg)[72])[0] = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_blankMsg)[72])[0];
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[72])[4] = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_blankMsg)[72])[4];
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[136])[0] = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_blankMsg)[136])[0];
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[136])[4] = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_blankMsg)[136])[4];
  cudaMemcpy(c23_b_gpu_blankMsg, chartInstance->c23_blankMsg, 208UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c23_gpu_msg, chartInstance->c23_msg, 208UL, cudaMemcpyHostToDevice);
  c23_sf_gateway_c23_sliding_controller_rbdl_kernel2<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c23_b_gpu_blankMsg, c23_gpu_msg);
  cudaMemcpy(chartInstance->c23_msg, c23_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c23_blankMsg, c23_b_gpu_blankMsg, 208UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[200])[0] = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_blankMsg)[200])[0];
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[200])[4] = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_blankMsg)[200])[4];
  cudaMemcpy(c23_gpu_msg, chartInstance->c23_msg, 208UL, cudaMemcpyHostToDevice);
  c23_sf_gateway_c23_sliding_controller_rbdl_kernel3<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c23_gpu_msg, c23_gpu_r);
  cudaMemcpy(chartInstance->c23_msg, c23_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c23_r, c23_gpu_r, 208UL, cudaMemcpyDeviceToHost);
  c23_r.ModelName_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [8])[0];
  c23_r.ModelName_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [8])[4];
  c23_r.Q_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [72])[0];
  c23_r.Q_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [72])[4];
  c23_r.Qd_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [136])[0];
  c23_r.Qd_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [136])[4];
  cudaMemcpy(c23_gpu_r, &c23_r, 208UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c23_gpu_msg, chartInstance->c23_msg, 208UL, cudaMemcpyHostToDevice);
  c23_sf_gateway_c23_sliding_controller_rbdl_kernel4<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c23_gpu_msg, c23_gpu_r);
  cudaMemcpy(chartInstance->c23_msg, c23_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c23_r, c23_gpu_r, 208UL, cudaMemcpyDeviceToHost);
  c23_r.Tau_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [200])[0];
  c23_r.Tau_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c23_msg)
    [200])[4];
  c23_eML_blk_kernel(chartInstance, &c23_r);
  cudaMemcpy(c23_gpu_r, &c23_r, 208UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c23_gpu_msg, chartInstance->c23_msg, 208UL, cudaMemcpyHostToDevice);
  c23_sf_gateway_c23_sliding_controller_rbdl_kernel5<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c23_gpu_r, c23_gpu_msg);
  cudaMemcpy(chartInstance->c23_msg, c23_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[8])[0] = c23_r.ModelName_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[8])[4] = c23_r.ModelName_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[72])[0] = c23_r.Q_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[72])[4] = c23_r.Q_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[136])[0] = c23_r.Qd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[136])[4] = c23_r.Qd_SL_Info.ReceivedLength;
  cudaMemcpy(c23_gpu_msg, chartInstance->c23_msg, 208UL, cudaMemcpyHostToDevice);
  c23_sf_gateway_c23_sliding_controller_rbdl_kernel6<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c23_gpu_r, c23_gpu_msg);
  cudaMemcpy(chartInstance->c23_msg, c23_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[200])[0] = c23_r.Tau_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c23_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c23_msg)[200])[4] = c23_r.Tau_SL_Info.ReceivedLength;
  c23_do_animation_call_c23_sliding_controller_rbdl(chartInstance);
  cudaFree(c23_b_gpu_blankMsg);
  cudaFree(c23_gpu_msg);
  cudaFree(c23_gpu_r);
}

static void mdl_start_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance)
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

static void mdl_setup_runtime_resources_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc23_sliding_controller_rbdl
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c23_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c23_nameCaptureInfo = NULL;
  c23_nameCaptureInfo = NULL;
  sf_mex_assign(&c23_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c23_nameCaptureInfo;
}

static void c23_emlrt_marshallIn(SFc23_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c23_b_msg, const char_T *c23_identifier,
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_y)
{
  emlrtMsgIdentifier c23_thisId;
  c23_thisId.fIdentifier = const_cast<const char_T *>(c23_identifier);
  c23_thisId.fParent = NULL;
  c23_thisId.bParentIsCell = false;
  c23_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c23_b_msg), &c23_thisId,
    c23_y);
  sf_mex_destroy(&c23_b_msg);
}

static void c23_b_emlrt_marshallIn(SFc23_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c23_u, const emlrtMsgIdentifier *c23_parentId,
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_y)
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

static void c23_c_emlrt_marshallIn(SFc23_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c23_u, const emlrtMsgIdentifier *c23_parentId,
  uint8_T c23_y[8])
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
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c23_u, const emlrtMsgIdentifier *c23_parentId)
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

static uint32_T c23_e_emlrt_marshallIn
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c23_u, const emlrtMsgIdentifier *c23_parentId)
{
  uint32_T c23_b_u;
  uint32_T c23_y;
  sf_mex_import(c23_parentId, sf_mex_dup(c23_u), &c23_b_u, 1, 7, 0U, 0, 0U, 0);
  c23_y = c23_b_u;
  sf_mex_destroy(&c23_u);
  return c23_y;
}

static void c23_f_emlrt_marshallIn(SFc23_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c23_u, const emlrtMsgIdentifier *c23_parentId,
  real_T c23_y[7])
{
  real_T c23_dv[7];
  int32_T c23_i;
  sf_mex_import(c23_parentId, sf_mex_dup(c23_u), c23_dv, 1, 0, 0U, 1, 0U, 1, 7);
  for (c23_i = 0; c23_i < 7; c23_i++) {
    c23_y[c23_i] = c23_dv[c23_i];
  }

  sf_mex_destroy(&c23_u);
}

static uint8_T c23_g_emlrt_marshallIn
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c23_b_is_active_c23_sliding_controller_rbdl, const char_T *c23_identifier)
{
  emlrtMsgIdentifier c23_thisId;
  uint8_T c23_y;
  c23_thisId.fIdentifier = const_cast<const char_T *>(c23_identifier);
  c23_thisId.fParent = NULL;
  c23_thisId.bParentIsCell = false;
  c23_y = c23_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c23_b_is_active_c23_sliding_controller_rbdl), &c23_thisId);
  sf_mex_destroy(&c23_b_is_active_c23_sliding_controller_rbdl);
  return c23_y;
}

static uint8_T c23_h_emlrt_marshallIn
  (SFc23_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c23_u, const emlrtMsgIdentifier *c23_parentId)
{
  uint8_T c23_b_u;
  uint8_T c23_y;
  sf_mex_import(c23_parentId, sf_mex_dup(c23_u), &c23_b_u, 1, 3, 0U, 0, 0U, 0);
  c23_y = c23_b_u;
  sf_mex_destroy(&c23_u);
  return c23_y;
}

static void c23_eML_blk_kernel(SFc23_sliding_controller_rbdlInstanceStruct
  *chartInstance,
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
  *c23_b_blankMsg)
{
  static uint8_T c23_uv[5] = { 104U, 117U, 109U, 97U, 110U };

  cudaMemcpy(chartInstance->c23_gpu_blankMsg, c23_b_blankMsg, 208UL,
             cudaMemcpyHostToDevice);
  c23_eML_blk_kernel_kernel7<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c23_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c23_gpu_uv, c23_uv, 5UL, cudaMemcpyHostToDevice);
  c23_eML_blk_kernel_kernel8<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c23_gpu_uv, chartInstance->c23_gpu_blankMsg);
  c23_eML_blk_kernel_kernel9<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c23_gpu_blankMsg);
  cudaMemcpy(c23_b_blankMsg, chartInstance->c23_gpu_blankMsg, 208UL,
             cudaMemcpyDeviceToHost);
}

static __global__ __launch_bounds__(32, 1) void
  c23_sf_gateway_c23_sliding_controller_rbdl_kernel1
  (c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c23_b_blankMsg,
   c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_b_msg)
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
  c23_sf_gateway_c23_sliding_controller_rbdl_kernel2
  (c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c23_b_blankMsg,
   c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_b_msg)
{
  uint64_T c23_threadId;
  int32_T c23_i1;
  c23_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c23_i1 = (int32_T)c23_threadId;
  if (c23_i1 < 7) {
    c23_b_msg->Q[c23_i1] = c23_b_blankMsg->Q[c23_i1];
    c23_b_msg->Qd[c23_i1] = c23_b_blankMsg->Qd[c23_i1];
    c23_b_msg->Tau[c23_i1] = c23_b_blankMsg->Tau[c23_i1];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c23_sf_gateway_c23_sliding_controller_rbdl_kernel3
  (c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_b_msg,
   c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_r)
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
  c23_sf_gateway_c23_sliding_controller_rbdl_kernel4
  (c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_b_msg,
   c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_r)
{
  uint64_T c23_threadId;
  int32_T c23_i3;
  c23_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c23_i3 = (int32_T)c23_threadId;
  if (c23_i3 < 7) {
    c23_r->Q[c23_i3] = c23_b_msg->Q[c23_i3];
    c23_r->Qd[c23_i3] = c23_b_msg->Qd[c23_i3];
    c23_r->Tau[c23_i3] = c23_b_msg->Tau[c23_i3];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c23_sf_gateway_c23_sliding_controller_rbdl_kernel5(const
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_r,
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_b_msg)
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
  c23_sf_gateway_c23_sliding_controller_rbdl_kernel6(const
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_r,
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c23_b_msg)
{
  uint64_T c23_threadId;
  int32_T c23_i5;
  c23_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c23_i5 = (int32_T)c23_threadId;
  if (c23_i5 < 7) {
    c23_b_msg->Q[c23_i5] = c23_r->Q[c23_i5];
    c23_b_msg->Qd[c23_i5] = c23_r->Qd[c23_i5];
    c23_b_msg->Tau[c23_i5] = c23_r->Tau[c23_i5];
  }
}

static __global__ __launch_bounds__(32, 1) void c23_eML_blk_kernel_kernel7
  (c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c23_b_blankMsg)
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
  uint8_T c23_uv[5],
  c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
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
  (c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c23_b_blankMsg)
{
  uint64_T c23_threadId;
  int32_T c23_tmpIdx;
  c23_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c23_tmpIdx = (int32_T)c23_threadId;
  if (c23_tmpIdx < 1) {
    c23_b_blankMsg->Q_SL_Info.CurrentLength = 7U;
    c23_b_blankMsg->Qd_SL_Info.CurrentLength = 7U;
    c23_b_blankMsg->Tau_SL_Info.CurrentLength = 7U;
  }
}

static void init_dsm_address_info(SFc23_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc23_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
  chartInstance->c23_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c23_blankMsg =
    (c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *)
    ssGetInputPortSignal_wrapper(chartInstance->S, 0);
  chartInstance->c23_msg =
    (c23_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *)
    ssGetOutputPortSignal_wrapper(chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c23_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1446757649U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1328543342U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3523006734U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2043636117U);
}

mxArray *sf_c23_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c23_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c23_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c23_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WfBop8ZSb8AkJdbnA4JF2j4kG+/ggNl+i"
    "H2RxBwvyqK+yH8zOL4xOSSzLLU+GQj4/jinMyUzLz0+OT8vJKi/Jyc1KL4oqSUHFj8AwEAPToeg"
    "g=="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c23_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sCgaqjKANzQMOTrp5zbdh0C";
}

static void sf_opaque_initialize_c23_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c23_sliding_controller_rbdl
    ((SFc23_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c23_sliding_controller_rbdl
    ((SFc23_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c23_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c23_sliding_controller_rbdl
    ((SFc23_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c23_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c23_sliding_controller_rbdl
    ((SFc23_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c23_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c23_sliding_controller_rbdl
    ((SFc23_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c23_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c23_sliding_controller_rbdl
    ((SFc23_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c23_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c23_sliding_controller_rbdl
    ((SFc23_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c23_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc23_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c23_sliding_controller_rbdl
      ((SFc23_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc23_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc23_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c23_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c23_sliding_controller_rbdl
    ((SFc23_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c23_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c23_sliding_controller_rbdl
    ((SFc23_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc23_sliding_controller_rbdl
    ((SFc23_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c23_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c23_sliding_controller_rbdl
      ((SFc23_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc23_sliding_controller_rbdl
      ((SFc23_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c23_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u20YQpmU3SIA0MIICyaFAcwnaY9AiQE+tbUpChVqxW8ppkYuwWo7EjZa7zP7Ilt8hr5B",
    "nyDMEeYggpyBPEKDovbMkJcsUScURYiRBCdD0kt/Mzsw3Pytvo9P18LqB985Nz7uCz6t4N7zs+i",
    "pfbyzc2fst7/t8/RSFhI0PiSKx9movQWL4E7Tk1jApOmIoS2FMDEGBoIhNpDJV2jSLLWdi3LaCO",
    "n36r4jRKIik5eEeypLwQPApakusOUQ9TaaAmjZAaCIl7ShqczKaW6zMsR8BHWsb17mgwQQ2cWbp",
    "ruWGJRxaJ0A7QhuCFusz2wJDDPjmpNJN56kOZkAZJ5wRUeptRHQACQbYwFES4t8Da9CpIoxGRJk",
    "9iMgE9D4bpzqlgKJOpvHDgAlipGKEt2LuO8Fl2w452tOVIfCagKBtewrIOJFMmGr+gzZ62hJkwK",
    "EJAzuq1hbAE+vIf8jgGFRl3Ia+nIAiIzgQlZumAWmdpGzNs2QZZlgMD4napcifhrAyezFzdECQJ",
    "+ihRBUMUic7uqfYBMNbqc3GHZeZq0rGxhnZehUs1daaQB0Lc21tKnzCua6E9WSyDxPgqdYmMaQe",
    "lmktx2nNwp7EALv0rq4GKxgSn8N8KUJWStekAEj7zgNsLOeR1GojYx+Tt7m/v/x5GdYRBtSQUCj",
    "rAoowDRizNLzV2kKmHfcIRKtMal4ZOMuQVShPD61oHks1xpjUNJEzFxyjlcBYj5BLrIQjjUVTB3",
    "NcrsJRQiMIXYNhHLpYNogtiYl2rW0X627CzLQJmiqWlLBqseqwDbVcQk0TOBJjIY9FW8k4yHt8F",
    "l4AzDaiBBOjPexfatrG3cuocPPsnnc2z66/xzybyRWfPyzo2SjR4y08i/tea9Tv28D/Nmbzd0Hu",
    "68I+WwU5h9vG+9G/b1695M9ubd1+fXP64u0/6+z/vHGx+X8jX387a7Tzwpks5avD/rZg11aJ/ls",
    "L+rfztfZH5Mnj33cfnP7RPeip5P7pIIzu+Rk/K+xtFOydvb/jOj5mWZqfinbC/GDi1sRm49rp/3",
    "nB3isr4nEtf59d735dT/6bnSKPZfHaPBevTVe55/L2w/e/s7OefLb/3yvsv1vg+2461/vEdQvo0",
    "x9/6mvOQiz1PpXCKMk5qL4ahLxQnx+a7xeV8y5Z7nOx83+5j8/7+8yvy5bzLlluXf8uOsc/NXzd",
    "PPAK+O1P2I91z1cfG//Ku9g56Lt8/cv8p44fMR6WnHrzz3iEHZZ9/QLy9D/NDba6",
    ""
  };

  static char newstr [1265] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c23_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c23_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(3638621530U));
  ssSetChecksum1(S,(396258500U));
  ssSetChecksum2(S,(316282884U));
  ssSetChecksum3(S,(4091724409U));
}

static void mdlRTW_c23_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c23_sliding_controller_rbdl(SimStruct *S)
{
  SFc23_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc23_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc23_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc23_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc23_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c23_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c23_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c23_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c23_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c23_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c23_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c23_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c23_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c23_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c23_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c23_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c23_sliding_controller_rbdl;
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

  mdl_setup_runtime_resources_c23_sliding_controller_rbdl(chartInstance);
}

void c23_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c23_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c23_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c23_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c23_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
