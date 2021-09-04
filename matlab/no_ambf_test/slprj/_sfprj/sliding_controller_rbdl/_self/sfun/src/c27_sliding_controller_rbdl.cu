/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c27_sliding_controller_rbdl.h"
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
static void initialize_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c27_do_animation_call_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c27_st);
static void sf_gateway_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c27_emlrt_marshallIn(SFc27_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c27_b_msg, const char_T *c27_identifier,
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_y);
static void c27_b_emlrt_marshallIn(SFc27_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c27_u, const emlrtMsgIdentifier *c27_parentId,
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_y);
static void c27_c_emlrt_marshallIn(SFc27_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c27_u, const emlrtMsgIdentifier *c27_parentId,
  uint8_T c27_y[8]);
static c27_SL_Bus_ROSVariableLengthArrayInfo c27_d_emlrt_marshallIn
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c27_u, const emlrtMsgIdentifier *c27_parentId);
static uint32_T c27_e_emlrt_marshallIn
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c27_u, const emlrtMsgIdentifier *c27_parentId);
static void c27_f_emlrt_marshallIn(SFc27_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c27_u, const emlrtMsgIdentifier *c27_parentId,
  real_T c27_y[7]);
static uint8_T c27_g_emlrt_marshallIn
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c27_b_is_active_c27_sliding_controller_rbdl, const char_T *c27_identifier);
static uint8_T c27_h_emlrt_marshallIn
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c27_u, const emlrtMsgIdentifier *c27_parentId);
static void c27_eML_blk_kernel(SFc27_sliding_controller_rbdlInstanceStruct
  *chartInstance,
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
  *c27_b_blankMsg);
static __global__ void c27_sf_gateway_c27_sliding_controller_rbdl_kernel1
  (c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c27_b_blankMsg,
   c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_b_msg);
static __global__ void c27_sf_gateway_c27_sliding_controller_rbdl_kernel2
  (c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c27_b_blankMsg,
   c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_b_msg);
static __global__ void c27_sf_gateway_c27_sliding_controller_rbdl_kernel3
  (c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_b_msg,
   c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_r);
static __global__ void c27_sf_gateway_c27_sliding_controller_rbdl_kernel4
  (c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_b_msg,
   c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_r);
static __global__ void c27_sf_gateway_c27_sliding_controller_rbdl_kernel5(const
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_r,
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_b_msg);
static __global__ void c27_sf_gateway_c27_sliding_controller_rbdl_kernel6(const
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_r,
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_b_msg);
static __global__ void c27_eML_blk_kernel_kernel7
  (c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c27_b_blankMsg);
static __global__ void c27_eML_blk_kernel_kernel8(const uint8_T c27_uv[5],
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
  *c27_b_blankMsg);
static __global__ void c27_eML_blk_kernel_kernel9
  (c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c27_b_blankMsg);
static void init_dsm_address_info(SFc27_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc27_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c27_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c27_is_active_c27_sliding_controller_rbdl = 0U;
  cudaGetLastError();
  cudaMalloc(&chartInstance->c27_gpu_uv, 5UL);
  cudaMalloc(&chartInstance->c27_gpu_blankMsg, 208UL);
}

static void initialize_params_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c27_do_animation_call_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  static const char_T *c27_sv[8] = { "ModelName", "ModelName_SL_Info", "Q",
    "Q_SL_Info", "Qd", "Qd_SL_Info", "Tau", "Tau_SL_Info" };

  static const char_T *c27_sv1[2] = { "CurrentLength", "ReceivedLength" };

  const mxArray *c27_b_y = NULL;
  const mxArray *c27_c_y = NULL;
  const mxArray *c27_d_y = NULL;
  const mxArray *c27_e_y = NULL;
  const mxArray *c27_f_y = NULL;
  const mxArray *c27_g_y = NULL;
  const mxArray *c27_h_y = NULL;
  const mxArray *c27_i_y = NULL;
  const mxArray *c27_j_y = NULL;
  const mxArray *c27_k_y = NULL;
  const mxArray *c27_l_y = NULL;
  const mxArray *c27_m_y = NULL;
  const mxArray *c27_n_y = NULL;
  const mxArray *c27_o_y = NULL;
  const mxArray *c27_p_y = NULL;
  const mxArray *c27_q_y = NULL;
  const mxArray *c27_r_y = NULL;
  const mxArray *c27_s_y = NULL;
  const mxArray *c27_st;
  const mxArray *c27_y = NULL;
  real_T c27_d_u[7];
  int32_T c27_i;
  int32_T c27_i1;
  int32_T c27_i2;
  int32_T c27_i3;
  uint32_T c27_b_u;
  uint32_T c27_c_u;
  uint32_T c27_e_u;
  uint32_T c27_f_u;
  uint32_T c27_g_u;
  uint32_T c27_h_u;
  uint32_T c27_i_u;
  uint32_T c27_j_u;
  uint32_T c27_u_CurrentLength;
  uint32_T c27_u_ReceivedLength;
  uint8_T c27_u[8];
  c27_st = NULL;
  c27_y = NULL;
  sf_mex_assign(&c27_y, sf_mex_createcellmatrix(2, 1), false);
  c27_b_y = NULL;
  sf_mex_assign(&c27_b_y, sf_mex_createstruct("structure", 8, c27_sv, 2, 1, 1),
                false);
  for (c27_i = 0; c27_i < 8; c27_i++) {
    c27_u[c27_i] = ((uint8_T *)&((char_T *)chartInstance->c27_msg)[0])[c27_i];
  }

  c27_c_y = NULL;
  sf_mex_assign(&c27_c_y, sf_mex_create("y", c27_u, 3, 0U, 1U, 0U, 1, 8), false);
  sf_mex_setfieldbynum(c27_b_y, 0, "ModelName", c27_c_y, 0);
  c27_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c27_msg)
    [8])[0];
  c27_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c27_msg)
    [8])[4];
  c27_d_y = NULL;
  sf_mex_assign(&c27_d_y, sf_mex_createstruct("structure", 2, c27_sv1, 2, 1, 1),
                false);
  c27_b_u = c27_u_CurrentLength;
  c27_e_y = NULL;
  sf_mex_assign(&c27_e_y, sf_mex_create("y", &c27_b_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c27_d_y, 0, "CurrentLength", c27_e_y, 0);
  c27_c_u = c27_u_ReceivedLength;
  c27_f_y = NULL;
  sf_mex_assign(&c27_f_y, sf_mex_create("y", &c27_c_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c27_d_y, 0, "ReceivedLength", c27_f_y, 1);
  sf_mex_setfieldbynum(c27_b_y, 0, "ModelName_SL_Info", c27_d_y, 1);
  for (c27_i1 = 0; c27_i1 < 7; c27_i1++) {
    c27_d_u[c27_i1] = ((real_T *)&((char_T *)chartInstance->c27_msg)[16])[c27_i1];
  }

  c27_g_y = NULL;
  sf_mex_assign(&c27_g_y, sf_mex_create("y", c27_d_u, 0, 0U, 1U, 0U, 1, 7),
                false);
  sf_mex_setfieldbynum(c27_b_y, 0, "Q", c27_g_y, 2);
  c27_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c27_msg)
    [72])[0];
  c27_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c27_msg)
    [72])[4];
  c27_h_y = NULL;
  sf_mex_assign(&c27_h_y, sf_mex_createstruct("structure", 2, c27_sv1, 2, 1, 1),
                false);
  c27_e_u = c27_u_CurrentLength;
  c27_i_y = NULL;
  sf_mex_assign(&c27_i_y, sf_mex_create("y", &c27_e_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c27_h_y, 0, "CurrentLength", c27_i_y, 0);
  c27_f_u = c27_u_ReceivedLength;
  c27_j_y = NULL;
  sf_mex_assign(&c27_j_y, sf_mex_create("y", &c27_f_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c27_h_y, 0, "ReceivedLength", c27_j_y, 1);
  sf_mex_setfieldbynum(c27_b_y, 0, "Q_SL_Info", c27_h_y, 3);
  for (c27_i2 = 0; c27_i2 < 7; c27_i2++) {
    c27_d_u[c27_i2] = ((real_T *)&((char_T *)chartInstance->c27_msg)[80])[c27_i2];
  }

  c27_k_y = NULL;
  sf_mex_assign(&c27_k_y, sf_mex_create("y", c27_d_u, 0, 0U, 1U, 0U, 1, 7),
                false);
  sf_mex_setfieldbynum(c27_b_y, 0, "Qd", c27_k_y, 4);
  c27_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c27_msg)
    [136])[0];
  c27_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c27_msg)
    [136])[4];
  c27_l_y = NULL;
  sf_mex_assign(&c27_l_y, sf_mex_createstruct("structure", 2, c27_sv1, 2, 1, 1),
                false);
  c27_g_u = c27_u_CurrentLength;
  c27_m_y = NULL;
  sf_mex_assign(&c27_m_y, sf_mex_create("y", &c27_g_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c27_l_y, 0, "CurrentLength", c27_m_y, 0);
  c27_h_u = c27_u_ReceivedLength;
  c27_n_y = NULL;
  sf_mex_assign(&c27_n_y, sf_mex_create("y", &c27_h_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c27_l_y, 0, "ReceivedLength", c27_n_y, 1);
  sf_mex_setfieldbynum(c27_b_y, 0, "Qd_SL_Info", c27_l_y, 5);
  for (c27_i3 = 0; c27_i3 < 7; c27_i3++) {
    c27_d_u[c27_i3] = ((real_T *)&((char_T *)chartInstance->c27_msg)[144])
      [c27_i3];
  }

  c27_o_y = NULL;
  sf_mex_assign(&c27_o_y, sf_mex_create("y", c27_d_u, 0, 0U, 1U, 0U, 1, 7),
                false);
  sf_mex_setfieldbynum(c27_b_y, 0, "Tau", c27_o_y, 6);
  c27_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c27_msg)
    [200])[0];
  c27_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c27_msg)
    [200])[4];
  c27_p_y = NULL;
  sf_mex_assign(&c27_p_y, sf_mex_createstruct("structure", 2, c27_sv1, 2, 1, 1),
                false);
  c27_i_u = c27_u_CurrentLength;
  c27_q_y = NULL;
  sf_mex_assign(&c27_q_y, sf_mex_create("y", &c27_i_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c27_p_y, 0, "CurrentLength", c27_q_y, 0);
  c27_j_u = c27_u_ReceivedLength;
  c27_r_y = NULL;
  sf_mex_assign(&c27_r_y, sf_mex_create("y", &c27_j_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c27_p_y, 0, "ReceivedLength", c27_r_y, 1);
  sf_mex_setfieldbynum(c27_b_y, 0, "Tau_SL_Info", c27_p_y, 7);
  sf_mex_setcell(c27_y, 0, c27_b_y);
  c27_s_y = NULL;
  sf_mex_assign(&c27_s_y, sf_mex_create("y",
    &chartInstance->c27_is_active_c27_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c27_y, 1, c27_s_y);
  sf_mex_assign(&c27_st, c27_y, false);
  return c27_st;
}

static void set_sim_state_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c27_st)
{
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 c27_r;
  const mxArray *c27_u;
  int32_T c27_i;
  int32_T c27_i1;
  c27_u = sf_mex_dup(c27_st);
  c27_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c27_u, 0)),
                       "msg", &c27_r);
  for (c27_i = 0; c27_i < 8; c27_i++) {
    ((uint8_T *)&((char_T *)chartInstance->c27_msg)[0])[c27_i] =
      c27_r.ModelName[c27_i];
  }

  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[8])[0] = c27_r.ModelName_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[8])[4] = c27_r.ModelName_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[72])[0] = c27_r.Q_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[72])[4] = c27_r.Q_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[136])[0] = c27_r.Qd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[136])[4] = c27_r.Qd_SL_Info.ReceivedLength;
  for (c27_i1 = 0; c27_i1 < 7; c27_i1++) {
    ((real_T *)&((char_T *)chartInstance->c27_msg)[16])[c27_i1] = c27_r.Q[c27_i1];
    ((real_T *)&((char_T *)chartInstance->c27_msg)[80])[c27_i1] =
      c27_r.Qd[c27_i1];
    ((real_T *)&((char_T *)chartInstance->c27_msg)[144])[c27_i1] =
      c27_r.Tau[c27_i1];
  }

  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[200])[0] = c27_r.Tau_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[200])[4] = c27_r.Tau_SL_Info.ReceivedLength;
  chartInstance->c27_is_active_c27_sliding_controller_rbdl =
    c27_g_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c27_u, 1)),
    "is_active_c27_sliding_controller_rbdl");
  sf_mex_destroy(&c27_u);
  sf_mex_destroy(&c27_st);
}

static void sf_gateway_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 c27_r;
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
    *c27_b_gpu_blankMsg;
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_gpu_msg;
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_gpu_r;
  cudaMalloc(&c27_gpu_r, 208UL);
  cudaMalloc(&c27_gpu_msg, 208UL);
  cudaMalloc(&c27_b_gpu_blankMsg, 208UL);
  chartInstance->c27_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  cudaMemcpy(c27_b_gpu_blankMsg, chartInstance->c27_blankMsg, 208UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c27_gpu_msg, chartInstance->c27_msg, 208UL, cudaMemcpyHostToDevice);
  c27_sf_gateway_c27_sliding_controller_rbdl_kernel1<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c27_b_gpu_blankMsg, c27_gpu_msg);
  cudaMemcpy(chartInstance->c27_msg, c27_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c27_blankMsg, c27_b_gpu_blankMsg, 208UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[8])[0] = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_blankMsg)[8])[0];
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[8])[4] = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_blankMsg)[8])[4];
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[72])[0] = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_blankMsg)[72])[0];
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[72])[4] = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_blankMsg)[72])[4];
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[136])[0] = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_blankMsg)[136])[0];
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[136])[4] = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_blankMsg)[136])[4];
  cudaMemcpy(c27_b_gpu_blankMsg, chartInstance->c27_blankMsg, 208UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c27_gpu_msg, chartInstance->c27_msg, 208UL, cudaMemcpyHostToDevice);
  c27_sf_gateway_c27_sliding_controller_rbdl_kernel2<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c27_b_gpu_blankMsg, c27_gpu_msg);
  cudaMemcpy(chartInstance->c27_msg, c27_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c27_blankMsg, c27_b_gpu_blankMsg, 208UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[200])[0] = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_blankMsg)[200])[0];
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[200])[4] = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_blankMsg)[200])[4];
  cudaMemcpy(c27_gpu_msg, chartInstance->c27_msg, 208UL, cudaMemcpyHostToDevice);
  c27_sf_gateway_c27_sliding_controller_rbdl_kernel3<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c27_gpu_msg, c27_gpu_r);
  cudaMemcpy(chartInstance->c27_msg, c27_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c27_r, c27_gpu_r, 208UL, cudaMemcpyDeviceToHost);
  c27_r.ModelName_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c27_msg)
    [8])[0];
  c27_r.ModelName_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c27_msg)
    [8])[4];
  c27_r.Q_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c27_msg)
    [72])[0];
  c27_r.Q_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c27_msg)
    [72])[4];
  c27_r.Qd_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c27_msg)
    [136])[0];
  c27_r.Qd_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c27_msg)
    [136])[4];
  cudaMemcpy(c27_gpu_r, &c27_r, 208UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c27_gpu_msg, chartInstance->c27_msg, 208UL, cudaMemcpyHostToDevice);
  c27_sf_gateway_c27_sliding_controller_rbdl_kernel4<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c27_gpu_msg, c27_gpu_r);
  cudaMemcpy(chartInstance->c27_msg, c27_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c27_r, c27_gpu_r, 208UL, cudaMemcpyDeviceToHost);
  c27_r.Tau_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c27_msg)
    [200])[0];
  c27_r.Tau_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c27_msg)
    [200])[4];
  c27_eML_blk_kernel(chartInstance, &c27_r);
  cudaMemcpy(c27_gpu_r, &c27_r, 208UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c27_gpu_msg, chartInstance->c27_msg, 208UL, cudaMemcpyHostToDevice);
  c27_sf_gateway_c27_sliding_controller_rbdl_kernel5<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c27_gpu_r, c27_gpu_msg);
  cudaMemcpy(chartInstance->c27_msg, c27_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[8])[0] = c27_r.ModelName_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[8])[4] = c27_r.ModelName_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[72])[0] = c27_r.Q_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[72])[4] = c27_r.Q_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[136])[0] = c27_r.Qd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[136])[4] = c27_r.Qd_SL_Info.ReceivedLength;
  cudaMemcpy(c27_gpu_msg, chartInstance->c27_msg, 208UL, cudaMemcpyHostToDevice);
  c27_sf_gateway_c27_sliding_controller_rbdl_kernel6<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c27_gpu_r, c27_gpu_msg);
  cudaMemcpy(chartInstance->c27_msg, c27_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[200])[0] = c27_r.Tau_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c27_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c27_msg)[200])[4] = c27_r.Tau_SL_Info.ReceivedLength;
  c27_do_animation_call_c27_sliding_controller_rbdl(chartInstance);
  cudaFree(c27_b_gpu_blankMsg);
  cudaFree(c27_gpu_msg);
  cudaFree(c27_gpu_r);
}

static void mdl_start_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c27_errCode;
  cudaFree(*chartInstance->c27_gpu_uv);
  cudaFree(chartInstance->c27_gpu_blankMsg);
  c27_errCode = cudaGetLastError();
  if (c27_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c27_errCode, (char_T *)cudaGetErrorName
                       (c27_errCode), (char_T *)cudaGetErrorString(c27_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c27_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc27_sliding_controller_rbdl
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c27_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c27_nameCaptureInfo = NULL;
  c27_nameCaptureInfo = NULL;
  sf_mex_assign(&c27_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c27_nameCaptureInfo;
}

static void c27_emlrt_marshallIn(SFc27_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c27_b_msg, const char_T *c27_identifier,
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_y)
{
  emlrtMsgIdentifier c27_thisId;
  c27_thisId.fIdentifier = const_cast<const char_T *>(c27_identifier);
  c27_thisId.fParent = NULL;
  c27_thisId.bParentIsCell = false;
  c27_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c27_b_msg), &c27_thisId,
    c27_y);
  sf_mex_destroy(&c27_b_msg);
}

static void c27_b_emlrt_marshallIn(SFc27_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c27_u, const emlrtMsgIdentifier *c27_parentId,
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_y)
{
  static const char_T *c27_fieldNames[8] = { "ModelName", "ModelName_SL_Info",
    "Q", "Q_SL_Info", "Qd", "Qd_SL_Info", "Tau", "Tau_SL_Info" };

  emlrtMsgIdentifier c27_thisId;
  c27_thisId.fParent = c27_parentId;
  c27_thisId.bParentIsCell = false;
  sf_mex_check_struct(c27_parentId, c27_u, 8, c27_fieldNames, 0U, NULL);
  c27_thisId.fIdentifier = "ModelName";
  c27_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c27_u,
    "ModelName", "ModelName", 0)), &c27_thisId, c27_y->ModelName);
  c27_thisId.fIdentifier = "ModelName_SL_Info";
  c27_y->ModelName_SL_Info = c27_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c27_u, "ModelName_SL_Info", "ModelName_SL_Info", 0)),
    &c27_thisId);
  c27_thisId.fIdentifier = "Q";
  c27_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c27_u, "Q",
    "Q", 0)), &c27_thisId, c27_y->Q);
  c27_thisId.fIdentifier = "Q_SL_Info";
  c27_y->Q_SL_Info = c27_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c27_u, "Q_SL_Info", "Q_SL_Info", 0)), &c27_thisId);
  c27_thisId.fIdentifier = "Qd";
  c27_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c27_u, "Qd",
    "Qd", 0)), &c27_thisId, c27_y->Qd);
  c27_thisId.fIdentifier = "Qd_SL_Info";
  c27_y->Qd_SL_Info = c27_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c27_u, "Qd_SL_Info", "Qd_SL_Info", 0)), &c27_thisId);
  c27_thisId.fIdentifier = "Tau";
  c27_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c27_u, "Tau",
    "Tau", 0)), &c27_thisId, c27_y->Tau);
  c27_thisId.fIdentifier = "Tau_SL_Info";
  c27_y->Tau_SL_Info = c27_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c27_u, "Tau_SL_Info", "Tau_SL_Info", 0)), &c27_thisId);
  sf_mex_destroy(&c27_u);
}

static void c27_c_emlrt_marshallIn(SFc27_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c27_u, const emlrtMsgIdentifier *c27_parentId,
  uint8_T c27_y[8])
{
  int32_T c27_i;
  uint8_T c27_uv[8];
  sf_mex_import(c27_parentId, sf_mex_dup(c27_u), c27_uv, 1, 3, 0U, 1, 0U, 1, 8);
  for (c27_i = 0; c27_i < 8; c27_i++) {
    c27_y[c27_i] = c27_uv[c27_i];
  }

  sf_mex_destroy(&c27_u);
}

static c27_SL_Bus_ROSVariableLengthArrayInfo c27_d_emlrt_marshallIn
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c27_u, const emlrtMsgIdentifier *c27_parentId)
{
  static const char_T *c27_fieldNames[2] = { "CurrentLength", "ReceivedLength" };

  c27_SL_Bus_ROSVariableLengthArrayInfo c27_y;
  emlrtMsgIdentifier c27_thisId;
  c27_thisId.fParent = c27_parentId;
  c27_thisId.bParentIsCell = false;
  sf_mex_check_struct(c27_parentId, c27_u, 2, c27_fieldNames, 0U, NULL);
  c27_thisId.fIdentifier = "CurrentLength";
  c27_y.CurrentLength = c27_e_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c27_u, "CurrentLength", "CurrentLength", 0)), &c27_thisId);
  c27_thisId.fIdentifier = "ReceivedLength";
  c27_y.ReceivedLength = c27_e_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c27_u, "ReceivedLength", "ReceivedLength", 0)), &c27_thisId);
  sf_mex_destroy(&c27_u);
  return c27_y;
}

static uint32_T c27_e_emlrt_marshallIn
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c27_u, const emlrtMsgIdentifier *c27_parentId)
{
  uint32_T c27_b_u;
  uint32_T c27_y;
  sf_mex_import(c27_parentId, sf_mex_dup(c27_u), &c27_b_u, 1, 7, 0U, 0, 0U, 0);
  c27_y = c27_b_u;
  sf_mex_destroy(&c27_u);
  return c27_y;
}

static void c27_f_emlrt_marshallIn(SFc27_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c27_u, const emlrtMsgIdentifier *c27_parentId,
  real_T c27_y[7])
{
  real_T c27_dv[7];
  int32_T c27_i;
  sf_mex_import(c27_parentId, sf_mex_dup(c27_u), c27_dv, 1, 0, 0U, 1, 0U, 1, 7);
  for (c27_i = 0; c27_i < 7; c27_i++) {
    c27_y[c27_i] = c27_dv[c27_i];
  }

  sf_mex_destroy(&c27_u);
}

static uint8_T c27_g_emlrt_marshallIn
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c27_b_is_active_c27_sliding_controller_rbdl, const char_T *c27_identifier)
{
  emlrtMsgIdentifier c27_thisId;
  uint8_T c27_y;
  c27_thisId.fIdentifier = const_cast<const char_T *>(c27_identifier);
  c27_thisId.fParent = NULL;
  c27_thisId.bParentIsCell = false;
  c27_y = c27_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c27_b_is_active_c27_sliding_controller_rbdl), &c27_thisId);
  sf_mex_destroy(&c27_b_is_active_c27_sliding_controller_rbdl);
  return c27_y;
}

static uint8_T c27_h_emlrt_marshallIn
  (SFc27_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c27_u, const emlrtMsgIdentifier *c27_parentId)
{
  uint8_T c27_b_u;
  uint8_T c27_y;
  sf_mex_import(c27_parentId, sf_mex_dup(c27_u), &c27_b_u, 1, 3, 0U, 0, 0U, 0);
  c27_y = c27_b_u;
  sf_mex_destroy(&c27_u);
  return c27_y;
}

static void c27_eML_blk_kernel(SFc27_sliding_controller_rbdlInstanceStruct
  *chartInstance,
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
  *c27_b_blankMsg)
{
  static uint8_T c27_uv[5] = { 104U, 117U, 109U, 97U, 110U };

  cudaMemcpy(chartInstance->c27_gpu_blankMsg, c27_b_blankMsg, 208UL,
             cudaMemcpyHostToDevice);
  c27_eML_blk_kernel_kernel7<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c27_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c27_gpu_uv, c27_uv, 5UL, cudaMemcpyHostToDevice);
  c27_eML_blk_kernel_kernel8<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c27_gpu_uv, chartInstance->c27_gpu_blankMsg);
  c27_eML_blk_kernel_kernel9<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c27_gpu_blankMsg);
  cudaMemcpy(c27_b_blankMsg, chartInstance->c27_gpu_blankMsg, 208UL,
             cudaMemcpyDeviceToHost);
}

static __global__ __launch_bounds__(32, 1) void
  c27_sf_gateway_c27_sliding_controller_rbdl_kernel1
  (c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c27_b_blankMsg,
   c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_b_msg)
{
  uint64_T c27_threadId;
  int32_T c27_i;
  c27_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c27_i = (int32_T)c27_threadId;
  if (c27_i < 8) {
    c27_b_msg->ModelName[c27_i] = c27_b_blankMsg->ModelName[c27_i];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c27_sf_gateway_c27_sliding_controller_rbdl_kernel2
  (c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c27_b_blankMsg,
   c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_b_msg)
{
  uint64_T c27_threadId;
  int32_T c27_i1;
  c27_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c27_i1 = (int32_T)c27_threadId;
  if (c27_i1 < 7) {
    c27_b_msg->Q[c27_i1] = c27_b_blankMsg->Q[c27_i1];
    c27_b_msg->Qd[c27_i1] = c27_b_blankMsg->Qd[c27_i1];
    c27_b_msg->Tau[c27_i1] = c27_b_blankMsg->Tau[c27_i1];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c27_sf_gateway_c27_sliding_controller_rbdl_kernel3
  (c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_b_msg,
   c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_r)
{
  uint64_T c27_threadId;
  int32_T c27_i2;
  c27_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c27_i2 = (int32_T)c27_threadId;
  if (c27_i2 < 8) {
    c27_r->ModelName[c27_i2] = c27_b_msg->ModelName[c27_i2];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c27_sf_gateway_c27_sliding_controller_rbdl_kernel4
  (c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_b_msg,
   c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_r)
{
  uint64_T c27_threadId;
  int32_T c27_i3;
  c27_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c27_i3 = (int32_T)c27_threadId;
  if (c27_i3 < 7) {
    c27_r->Q[c27_i3] = c27_b_msg->Q[c27_i3];
    c27_r->Qd[c27_i3] = c27_b_msg->Qd[c27_i3];
    c27_r->Tau[c27_i3] = c27_b_msg->Tau[c27_i3];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c27_sf_gateway_c27_sliding_controller_rbdl_kernel5(const
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_r,
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_b_msg)
{
  uint64_T c27_threadId;
  int32_T c27_i4;
  c27_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c27_i4 = (int32_T)c27_threadId;
  if (c27_i4 < 8) {
    c27_b_msg->ModelName[c27_i4] = c27_r->ModelName[c27_i4];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c27_sf_gateway_c27_sliding_controller_rbdl_kernel6(const
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_r,
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *c27_b_msg)
{
  uint64_T c27_threadId;
  int32_T c27_i5;
  c27_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c27_i5 = (int32_T)c27_threadId;
  if (c27_i5 < 7) {
    c27_b_msg->Q[c27_i5] = c27_r->Q[c27_i5];
    c27_b_msg->Qd[c27_i5] = c27_r->Qd[c27_i5];
    c27_b_msg->Tau[c27_i5] = c27_r->Tau[c27_i5];
  }
}

static __global__ __launch_bounds__(32, 1) void c27_eML_blk_kernel_kernel7
  (c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c27_b_blankMsg)
{
  uint64_T c27_threadId;
  int32_T c27_tmpIdx;
  c27_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c27_tmpIdx = (int32_T)c27_threadId;
  if (c27_tmpIdx < 1) {
    c27_b_blankMsg->ModelName_SL_Info.CurrentLength = 5U;
  }
}

static __global__ __launch_bounds__(32, 1) void c27_eML_blk_kernel_kernel8(const
  uint8_T c27_uv[5],
  c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
  *c27_b_blankMsg)
{
  uint64_T c27_threadId;
  int32_T c27_i;
  c27_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c27_i = (int32_T)c27_threadId;
  if (c27_i < 5) {
    c27_b_blankMsg->ModelName[c27_i] = c27_uv[c27_i];
  }
}

static __global__ __launch_bounds__(32, 1) void c27_eML_blk_kernel_kernel9
  (c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57
   *c27_b_blankMsg)
{
  uint64_T c27_threadId;
  int32_T c27_tmpIdx;
  c27_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c27_tmpIdx = (int32_T)c27_threadId;
  if (c27_tmpIdx < 1) {
    c27_b_blankMsg->Q_SL_Info.CurrentLength = 7U;
    c27_b_blankMsg->Qd_SL_Info.CurrentLength = 7U;
    c27_b_blankMsg->Tau_SL_Info.CurrentLength = 7U;
  }
}

static void init_dsm_address_info(SFc27_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc27_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
  chartInstance->c27_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c27_blankMsg =
    (c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *)
    ssGetInputPortSignal_wrapper(chartInstance->S, 0);
  chartInstance->c27_msg =
    (c27_SL_Bus_sliding_controller_rbdl_RBDLForwardDynamicsReques_u57 *)
    ssGetOutputPortSignal_wrapper(chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c27_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1446757649U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1328543342U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3523006734U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2043636117U);
}

mxArray *sf_c27_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c27_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c27_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c27_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WfBop8ZSb8AkJdbnA4JF2j4kG+/ggNl+i"
    "H2RxBwvyqK+yH8zOL4xOSSzLLU+GQj8/jinMyUzLz0+OT8vJKi/Jyc1KL4oqSUHFj8AwEAPcoeh"
    "g=="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c27_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sCgaqjKANzQMOTrp5zbdh0C";
}

static void sf_opaque_initialize_c27_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c27_sliding_controller_rbdl
    ((SFc27_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c27_sliding_controller_rbdl
    ((SFc27_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c27_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c27_sliding_controller_rbdl
    ((SFc27_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c27_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c27_sliding_controller_rbdl
    ((SFc27_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c27_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c27_sliding_controller_rbdl
    ((SFc27_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c27_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c27_sliding_controller_rbdl
    ((SFc27_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c27_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c27_sliding_controller_rbdl
    ((SFc27_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c27_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc27_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c27_sliding_controller_rbdl
      ((SFc27_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc27_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc27_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c27_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c27_sliding_controller_rbdl
    ((SFc27_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c27_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c27_sliding_controller_rbdl
    ((SFc27_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc27_sliding_controller_rbdl
    ((SFc27_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c27_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c27_sliding_controller_rbdl
      ((SFc27_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc27_sliding_controller_rbdl
      ((SFc27_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c27_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u20YQpmU3SIA0MIICyaFAcwnaY1CgSE+tbUpChVqxW8ppkYuwWo7EjZa7zP7Ilt8hr5B",
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
    "L+rfztfZH5Mnj33cfnP7RPeip5KfTQRjd8zN+VtjbKNg7e3/HdXzMsjQ/Fe2E+cHErYnNxrXT//",
    "OCvVdWxONa/j673v26nvw3O0Uey+K1eS5em65yz+Xth+9/Z2c9+Wz/v1fYf7fA9910rveJ6xbQp",
    "z/e72vOQiz1PpXCKMk5qL4ahLxQnx+a7xeV8y5Z7nOx83+5j8/7+8yvy5bzLlluXf8uOsc/NXzd",
    "PPAK+O1P2I91z1cfG//Ku9g56Lt8/cv8p44fMR6WnHrzz3iEHZZ9/QLy9D/r3ba+",
    ""
  };

  static char newstr [1265] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c27_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c27_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(3638621530U));
  ssSetChecksum1(S,(396258500U));
  ssSetChecksum2(S,(316282884U));
  ssSetChecksum3(S,(4091724409U));
}

static void mdlRTW_c27_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c27_sliding_controller_rbdl(SimStruct *S)
{
  SFc27_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc27_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc27_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc27_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc27_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c27_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c27_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c27_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c27_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c27_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c27_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c27_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c27_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c27_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c27_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c27_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c27_sliding_controller_rbdl;
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
    chartInstance->c27_JITStateAnimation,
    chartInstance->c27_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c27_sliding_controller_rbdl(chartInstance);
}

void c27_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c27_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c27_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c27_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c27_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
