/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c2_sliding_controller_rbdl.h"
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
static void initialize_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c2_do_animation_call_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c2_st);
static void sf_gateway_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c2_emlrt_marshallIn(SFc2_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c2_b_msg, const char_T *c2_identifier,
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_y);
static void c2_b_emlrt_marshallIn(SFc2_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_y);
static void c2_c_emlrt_marshallIn(SFc2_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  uint8_T c2_y[4]);
static c2_SL_Bus_ROSVariableLengthArrayInfo c2_d_emlrt_marshallIn
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c2_u, const emlrtMsgIdentifier *c2_parentId);
static uint32_T c2_e_emlrt_marshallIn(SFc2_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId);
static void c2_f_emlrt_marshallIn(SFc2_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[7]);
static uint8_T c2_g_emlrt_marshallIn(SFc2_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c2_b_is_active_c2_sliding_controller_rbdl, const
  char_T *c2_identifier);
static uint8_T c2_h_emlrt_marshallIn(SFc2_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId);
static void c2_eML_blk_kernel(SFc2_sliding_controller_rbdlInstanceStruct
  *chartInstance,
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb
  *c2_b_blankMsg);
static __global__ void c2_sf_gateway_c2_sliding_controller_rbdl_kernel1
  (c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb
   *c2_b_blankMsg,
   c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_b_msg);
static __global__ void c2_sf_gateway_c2_sliding_controller_rbdl_kernel2
  (c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb
   *c2_b_blankMsg,
   c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_b_msg);
static __global__ void c2_sf_gateway_c2_sliding_controller_rbdl_kernel3
  (c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_b_msg,
   c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_r);
static __global__ void c2_sf_gateway_c2_sliding_controller_rbdl_kernel4
  (c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_b_msg,
   c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_r);
static __global__ void c2_sf_gateway_c2_sliding_controller_rbdl_kernel5(const
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_r,
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_b_msg);
static __global__ void c2_sf_gateway_c2_sliding_controller_rbdl_kernel6(const
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_r,
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_b_msg);
static __global__ void c2_eML_blk_kernel_kernel7
  (c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb
   *c2_b_blankMsg);
static __global__ void c2_eML_blk_kernel_kernel8(const uint8_T c2_uv[3],
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb
  *c2_b_blankMsg);
static __global__ void c2_eML_blk_kernel_kernel9
  (c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb
   *c2_b_blankMsg);
static void init_dsm_address_info(SFc2_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc2_sliding_controller_rbdlInstanceStruct *
  chartInstance);

/* Function Definitions */
static void initialize_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c2_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c2_is_active_c2_sliding_controller_rbdl = 0U;
  cudaGetLastError();
  cudaMalloc(&chartInstance->c2_gpu_uv, 3UL);
  cudaMalloc(&chartInstance->c2_gpu_blankMsg, 208UL);
}

static void initialize_params_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c2_do_animation_call_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  static const char_T *c2_sv[8] = { "ModelName", "ModelName_SL_Info", "Q",
    "Q_SL_Info", "Qd", "Qd_SL_Info", "Qdd", "Qdd_SL_Info" };

  static const char_T *c2_sv1[2] = { "CurrentLength", "ReceivedLength" };

  const mxArray *c2_b_y = NULL;
  const mxArray *c2_c_y = NULL;
  const mxArray *c2_d_y = NULL;
  const mxArray *c2_e_y = NULL;
  const mxArray *c2_f_y = NULL;
  const mxArray *c2_g_y = NULL;
  const mxArray *c2_h_y = NULL;
  const mxArray *c2_i_y = NULL;
  const mxArray *c2_j_y = NULL;
  const mxArray *c2_k_y = NULL;
  const mxArray *c2_l_y = NULL;
  const mxArray *c2_m_y = NULL;
  const mxArray *c2_n_y = NULL;
  const mxArray *c2_o_y = NULL;
  const mxArray *c2_p_y = NULL;
  const mxArray *c2_q_y = NULL;
  const mxArray *c2_r_y = NULL;
  const mxArray *c2_s_y = NULL;
  const mxArray *c2_st;
  const mxArray *c2_y = NULL;
  real_T c2_d_u[7];
  int32_T c2_i;
  int32_T c2_i1;
  int32_T c2_i2;
  int32_T c2_i3;
  uint32_T c2_b_u;
  uint32_T c2_c_u;
  uint32_T c2_e_u;
  uint32_T c2_f_u;
  uint32_T c2_g_u;
  uint32_T c2_h_u;
  uint32_T c2_i_u;
  uint32_T c2_j_u;
  uint32_T c2_u_CurrentLength;
  uint32_T c2_u_ReceivedLength;
  uint8_T c2_u[4];
  c2_st = NULL;
  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_createcellmatrix(2, 1), false);
  c2_b_y = NULL;
  sf_mex_assign(&c2_b_y, sf_mex_createstruct("structure", 8, c2_sv, 2, 1, 1),
                false);
  for (c2_i = 0; c2_i < 4; c2_i++) {
    c2_u[c2_i] = ((uint8_T *)&((char_T *)chartInstance->c2_msg)[0])[c2_i];
  }

  c2_c_y = NULL;
  sf_mex_assign(&c2_c_y, sf_mex_create("y", c2_u, 3, 0U, 1U, 0U, 1, 4), false);
  sf_mex_setfieldbynum(c2_b_y, 0, "ModelName", c2_c_y, 0);
  c2_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c2_msg)[8])
    [0];
  c2_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c2_msg)[8])
    [4];
  c2_d_y = NULL;
  sf_mex_assign(&c2_d_y, sf_mex_createstruct("structure", 2, c2_sv1, 2, 1, 1),
                false);
  c2_b_u = c2_u_CurrentLength;
  c2_e_y = NULL;
  sf_mex_assign(&c2_e_y, sf_mex_create("y", &c2_b_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c2_d_y, 0, "CurrentLength", c2_e_y, 0);
  c2_c_u = c2_u_ReceivedLength;
  c2_f_y = NULL;
  sf_mex_assign(&c2_f_y, sf_mex_create("y", &c2_c_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c2_d_y, 0, "ReceivedLength", c2_f_y, 1);
  sf_mex_setfieldbynum(c2_b_y, 0, "ModelName_SL_Info", c2_d_y, 1);
  for (c2_i1 = 0; c2_i1 < 7; c2_i1++) {
    c2_d_u[c2_i1] = ((real_T *)&((char_T *)chartInstance->c2_msg)[16])[c2_i1];
  }

  c2_g_y = NULL;
  sf_mex_assign(&c2_g_y, sf_mex_create("y", c2_d_u, 0, 0U, 1U, 0U, 1, 7), false);
  sf_mex_setfieldbynum(c2_b_y, 0, "Q", c2_g_y, 2);
  c2_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c2_msg)
    [72])[0];
  c2_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c2_msg)
    [72])[4];
  c2_h_y = NULL;
  sf_mex_assign(&c2_h_y, sf_mex_createstruct("structure", 2, c2_sv1, 2, 1, 1),
                false);
  c2_e_u = c2_u_CurrentLength;
  c2_i_y = NULL;
  sf_mex_assign(&c2_i_y, sf_mex_create("y", &c2_e_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c2_h_y, 0, "CurrentLength", c2_i_y, 0);
  c2_f_u = c2_u_ReceivedLength;
  c2_j_y = NULL;
  sf_mex_assign(&c2_j_y, sf_mex_create("y", &c2_f_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c2_h_y, 0, "ReceivedLength", c2_j_y, 1);
  sf_mex_setfieldbynum(c2_b_y, 0, "Q_SL_Info", c2_h_y, 3);
  for (c2_i2 = 0; c2_i2 < 7; c2_i2++) {
    c2_d_u[c2_i2] = ((real_T *)&((char_T *)chartInstance->c2_msg)[80])[c2_i2];
  }

  c2_k_y = NULL;
  sf_mex_assign(&c2_k_y, sf_mex_create("y", c2_d_u, 0, 0U, 1U, 0U, 1, 7), false);
  sf_mex_setfieldbynum(c2_b_y, 0, "Qd", c2_k_y, 4);
  c2_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c2_msg)
    [136])[0];
  c2_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c2_msg)
    [136])[4];
  c2_l_y = NULL;
  sf_mex_assign(&c2_l_y, sf_mex_createstruct("structure", 2, c2_sv1, 2, 1, 1),
                false);
  c2_g_u = c2_u_CurrentLength;
  c2_m_y = NULL;
  sf_mex_assign(&c2_m_y, sf_mex_create("y", &c2_g_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c2_l_y, 0, "CurrentLength", c2_m_y, 0);
  c2_h_u = c2_u_ReceivedLength;
  c2_n_y = NULL;
  sf_mex_assign(&c2_n_y, sf_mex_create("y", &c2_h_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c2_l_y, 0, "ReceivedLength", c2_n_y, 1);
  sf_mex_setfieldbynum(c2_b_y, 0, "Qd_SL_Info", c2_l_y, 5);
  for (c2_i3 = 0; c2_i3 < 7; c2_i3++) {
    c2_d_u[c2_i3] = ((real_T *)&((char_T *)chartInstance->c2_msg)[144])[c2_i3];
  }

  c2_o_y = NULL;
  sf_mex_assign(&c2_o_y, sf_mex_create("y", c2_d_u, 0, 0U, 1U, 0U, 1, 7), false);
  sf_mex_setfieldbynum(c2_b_y, 0, "Qdd", c2_o_y, 6);
  c2_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c2_msg)
    [200])[0];
  c2_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c2_msg)
    [200])[4];
  c2_p_y = NULL;
  sf_mex_assign(&c2_p_y, sf_mex_createstruct("structure", 2, c2_sv1, 2, 1, 1),
                false);
  c2_i_u = c2_u_CurrentLength;
  c2_q_y = NULL;
  sf_mex_assign(&c2_q_y, sf_mex_create("y", &c2_i_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c2_p_y, 0, "CurrentLength", c2_q_y, 0);
  c2_j_u = c2_u_ReceivedLength;
  c2_r_y = NULL;
  sf_mex_assign(&c2_r_y, sf_mex_create("y", &c2_j_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c2_p_y, 0, "ReceivedLength", c2_r_y, 1);
  sf_mex_setfieldbynum(c2_b_y, 0, "Qdd_SL_Info", c2_p_y, 7);
  sf_mex_setcell(c2_y, 0, c2_b_y);
  c2_s_y = NULL;
  sf_mex_assign(&c2_s_y, sf_mex_create("y",
    &chartInstance->c2_is_active_c2_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c2_y, 1, c2_s_y);
  sf_mex_assign(&c2_st, c2_y, false);
  return c2_st;
}

static void set_sim_state_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c2_st)
{
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb c2_r;
  const mxArray *c2_u;
  int32_T c2_i;
  int32_T c2_i1;
  c2_u = sf_mex_dup(c2_st);
  c2_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c2_u, 0)), "msg",
                      &c2_r);
  for (c2_i = 0; c2_i < 4; c2_i++) {
    ((uint8_T *)&((char_T *)chartInstance->c2_msg)[0])[c2_i] =
      c2_r.ModelName[c2_i];
  }

  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[8])[0] = c2_r.ModelName_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[8])[4] = c2_r.ModelName_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[72])[0] = c2_r.Q_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[72])[4] = c2_r.Q_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[136])[0] = c2_r.Qd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[136])[4] = c2_r.Qd_SL_Info.ReceivedLength;
  for (c2_i1 = 0; c2_i1 < 7; c2_i1++) {
    ((real_T *)&((char_T *)chartInstance->c2_msg)[16])[c2_i1] = c2_r.Q[c2_i1];
    ((real_T *)&((char_T *)chartInstance->c2_msg)[80])[c2_i1] = c2_r.Qd[c2_i1];
    ((real_T *)&((char_T *)chartInstance->c2_msg)[144])[c2_i1] = c2_r.Qdd[c2_i1];
  }

  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[200])[0] = c2_r.Qdd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[200])[4] = c2_r.Qdd_SL_Info.ReceivedLength;
  chartInstance->c2_is_active_c2_sliding_controller_rbdl = c2_g_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c2_u, 1)),
     "is_active_c2_sliding_controller_rbdl");
  sf_mex_destroy(&c2_u);
  sf_mex_destroy(&c2_st);
}

static void sf_gateway_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb c2_r;
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb
    *c2_b_gpu_blankMsg;
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_gpu_msg;
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_gpu_r;
  cudaMalloc(&c2_gpu_r, 208UL);
  cudaMalloc(&c2_gpu_msg, 208UL);
  cudaMalloc(&c2_b_gpu_blankMsg, 208UL);
  chartInstance->c2_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  cudaMemcpy(c2_b_gpu_blankMsg, chartInstance->c2_blankMsg, 208UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c2_gpu_msg, chartInstance->c2_msg, 208UL, cudaMemcpyHostToDevice);
  c2_sf_gateway_c2_sliding_controller_rbdl_kernel1<<<dim3(1U, 1U, 1U), dim3(32U,
    1U, 1U)>>>(c2_b_gpu_blankMsg, c2_gpu_msg);
  cudaMemcpy(chartInstance->c2_msg, c2_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c2_blankMsg, c2_b_gpu_blankMsg, 208UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[8])[0] = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_blankMsg)[8])[0];
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[8])[4] = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_blankMsg)[8])[4];
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[72])[0] = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_blankMsg)[72])[0];
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[72])[4] = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_blankMsg)[72])[4];
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[136])[0] = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_blankMsg)[136])[0];
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[136])[4] = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_blankMsg)[136])[4];
  cudaMemcpy(c2_b_gpu_blankMsg, chartInstance->c2_blankMsg, 208UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c2_gpu_msg, chartInstance->c2_msg, 208UL, cudaMemcpyHostToDevice);
  c2_sf_gateway_c2_sliding_controller_rbdl_kernel2<<<dim3(1U, 1U, 1U), dim3(32U,
    1U, 1U)>>>(c2_b_gpu_blankMsg, c2_gpu_msg);
  cudaMemcpy(chartInstance->c2_msg, c2_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c2_blankMsg, c2_b_gpu_blankMsg, 208UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[200])[0] = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_blankMsg)[200])[0];
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[200])[4] = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_blankMsg)[200])[4];
  cudaMemcpy(c2_gpu_msg, chartInstance->c2_msg, 208UL, cudaMemcpyHostToDevice);
  c2_sf_gateway_c2_sliding_controller_rbdl_kernel3<<<dim3(1U, 1U, 1U), dim3(32U,
    1U, 1U)>>>(c2_gpu_msg, c2_gpu_r);
  cudaMemcpy(chartInstance->c2_msg, c2_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c2_r, c2_gpu_r, 208UL, cudaMemcpyDeviceToHost);
  c2_r.ModelName_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c2_msg)[8])
    [0];
  c2_r.ModelName_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c2_msg)[8])
    [4];
  c2_r.Q_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c2_msg)
    [72])[0];
  c2_r.Q_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c2_msg)
    [72])[4];
  c2_r.Qd_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c2_msg)
    [136])[0];
  c2_r.Qd_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c2_msg)
    [136])[4];
  cudaMemcpy(c2_gpu_r, &c2_r, 208UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c2_gpu_msg, chartInstance->c2_msg, 208UL, cudaMemcpyHostToDevice);
  c2_sf_gateway_c2_sliding_controller_rbdl_kernel4<<<dim3(1U, 1U, 1U), dim3(32U,
    1U, 1U)>>>(c2_gpu_msg, c2_gpu_r);
  cudaMemcpy(chartInstance->c2_msg, c2_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c2_r, c2_gpu_r, 208UL, cudaMemcpyDeviceToHost);
  c2_r.Qdd_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c2_msg)
    [200])[0];
  c2_r.Qdd_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c2_msg)
    [200])[4];
  c2_eML_blk_kernel(chartInstance, &c2_r);
  cudaMemcpy(c2_gpu_r, &c2_r, 208UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c2_gpu_msg, chartInstance->c2_msg, 208UL, cudaMemcpyHostToDevice);
  c2_sf_gateway_c2_sliding_controller_rbdl_kernel5<<<dim3(1U, 1U, 1U), dim3(32U,
    1U, 1U)>>>(c2_gpu_r, c2_gpu_msg);
  cudaMemcpy(chartInstance->c2_msg, c2_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[8])[0] = c2_r.ModelName_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[8])[4] = c2_r.ModelName_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[72])[0] = c2_r.Q_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[72])[4] = c2_r.Q_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[136])[0] = c2_r.Qd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[136])[4] = c2_r.Qd_SL_Info.ReceivedLength;
  cudaMemcpy(c2_gpu_msg, chartInstance->c2_msg, 208UL, cudaMemcpyHostToDevice);
  c2_sf_gateway_c2_sliding_controller_rbdl_kernel6<<<dim3(1U, 1U, 1U), dim3(32U,
    1U, 1U)>>>(c2_gpu_r, c2_gpu_msg);
  cudaMemcpy(chartInstance->c2_msg, c2_gpu_msg, 208UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[200])[0] = c2_r.Qdd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c2_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c2_msg)[200])[4] = c2_r.Qdd_SL_Info.ReceivedLength;
  c2_do_animation_call_c2_sliding_controller_rbdl(chartInstance);
  cudaFree(c2_b_gpu_blankMsg);
  cudaFree(c2_gpu_msg);
  cudaFree(c2_gpu_r);
}

static void mdl_start_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c2_errCode;
  cudaFree(*chartInstance->c2_gpu_uv);
  cudaFree(chartInstance->c2_gpu_blankMsg);
  c2_errCode = cudaGetLastError();
  if (c2_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c2_errCode, (char_T *)cudaGetErrorName
                       (c2_errCode), (char_T *)cudaGetErrorString(c2_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c2_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc2_sliding_controller_rbdl
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c2_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c2_nameCaptureInfo = NULL;
  c2_nameCaptureInfo = NULL;
  sf_mex_assign(&c2_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c2_nameCaptureInfo;
}

static void c2_emlrt_marshallIn(SFc2_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c2_b_msg, const char_T *c2_identifier,
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_y)
{
  emlrtMsgIdentifier c2_thisId;
  c2_thisId.fIdentifier = const_cast<const char_T *>(c2_identifier);
  c2_thisId.fParent = NULL;
  c2_thisId.bParentIsCell = false;
  c2_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c2_b_msg), &c2_thisId, c2_y);
  sf_mex_destroy(&c2_b_msg);
}

static void c2_b_emlrt_marshallIn(SFc2_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_y)
{
  static const char_T *c2_fieldNames[8] = { "ModelName", "ModelName_SL_Info",
    "Q", "Q_SL_Info", "Qd", "Qd_SL_Info", "Qdd", "Qdd_SL_Info" };

  emlrtMsgIdentifier c2_thisId;
  c2_thisId.fParent = c2_parentId;
  c2_thisId.bParentIsCell = false;
  sf_mex_check_struct(c2_parentId, c2_u, 8, c2_fieldNames, 0U, NULL);
  c2_thisId.fIdentifier = "ModelName";
  c2_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c2_u,
    "ModelName", "ModelName", 0)), &c2_thisId, c2_y->ModelName);
  c2_thisId.fIdentifier = "ModelName_SL_Info";
  c2_y->ModelName_SL_Info = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c2_u, "ModelName_SL_Info", "ModelName_SL_Info", 0)),
    &c2_thisId);
  c2_thisId.fIdentifier = "Q";
  c2_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c2_u, "Q", "Q",
    0)), &c2_thisId, c2_y->Q);
  c2_thisId.fIdentifier = "Q_SL_Info";
  c2_y->Q_SL_Info = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c2_u, "Q_SL_Info", "Q_SL_Info", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "Qd";
  c2_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c2_u, "Qd",
    "Qd", 0)), &c2_thisId, c2_y->Qd);
  c2_thisId.fIdentifier = "Qd_SL_Info";
  c2_y->Qd_SL_Info = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c2_u, "Qd_SL_Info", "Qd_SL_Info", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "Qdd";
  c2_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c2_u, "Qdd",
    "Qdd", 0)), &c2_thisId, c2_y->Qdd);
  c2_thisId.fIdentifier = "Qdd_SL_Info";
  c2_y->Qdd_SL_Info = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c2_u, "Qdd_SL_Info", "Qdd_SL_Info", 0)), &c2_thisId);
  sf_mex_destroy(&c2_u);
}

static void c2_c_emlrt_marshallIn(SFc2_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  uint8_T c2_y[4])
{
  int32_T c2_i;
  uint8_T c2_uv[4];
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), c2_uv, 1, 3, 0U, 1, 0U, 1, 4);
  for (c2_i = 0; c2_i < 4; c2_i++) {
    c2_y[c2_i] = c2_uv[c2_i];
  }

  sf_mex_destroy(&c2_u);
}

static c2_SL_Bus_ROSVariableLengthArrayInfo c2_d_emlrt_marshallIn
  (SFc2_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c2_u, const emlrtMsgIdentifier *c2_parentId)
{
  static const char_T *c2_fieldNames[2] = { "CurrentLength", "ReceivedLength" };

  c2_SL_Bus_ROSVariableLengthArrayInfo c2_y;
  emlrtMsgIdentifier c2_thisId;
  c2_thisId.fParent = c2_parentId;
  c2_thisId.bParentIsCell = false;
  sf_mex_check_struct(c2_parentId, c2_u, 2, c2_fieldNames, 0U, NULL);
  c2_thisId.fIdentifier = "CurrentLength";
  c2_y.CurrentLength = c2_e_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c2_u, "CurrentLength", "CurrentLength", 0)), &c2_thisId);
  c2_thisId.fIdentifier = "ReceivedLength";
  c2_y.ReceivedLength = c2_e_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c2_u, "ReceivedLength", "ReceivedLength", 0)), &c2_thisId);
  sf_mex_destroy(&c2_u);
  return c2_y;
}

static uint32_T c2_e_emlrt_marshallIn(SFc2_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId)
{
  uint32_T c2_b_u;
  uint32_T c2_y;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), &c2_b_u, 1, 7, 0U, 0, 0U, 0);
  c2_y = c2_b_u;
  sf_mex_destroy(&c2_u);
  return c2_y;
}

static void c2_f_emlrt_marshallIn(SFc2_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[7])
{
  real_T c2_dv[7];
  int32_T c2_i;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), c2_dv, 1, 0, 0U, 1, 0U, 1, 7);
  for (c2_i = 0; c2_i < 7; c2_i++) {
    c2_y[c2_i] = c2_dv[c2_i];
  }

  sf_mex_destroy(&c2_u);
}

static uint8_T c2_g_emlrt_marshallIn(SFc2_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c2_b_is_active_c2_sliding_controller_rbdl, const
  char_T *c2_identifier)
{
  emlrtMsgIdentifier c2_thisId;
  uint8_T c2_y;
  c2_thisId.fIdentifier = const_cast<const char_T *>(c2_identifier);
  c2_thisId.fParent = NULL;
  c2_thisId.bParentIsCell = false;
  c2_y = c2_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c2_b_is_active_c2_sliding_controller_rbdl), &c2_thisId);
  sf_mex_destroy(&c2_b_is_active_c2_sliding_controller_rbdl);
  return c2_y;
}

static uint8_T c2_h_emlrt_marshallIn(SFc2_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId)
{
  uint8_T c2_b_u;
  uint8_T c2_y;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), &c2_b_u, 1, 3, 0U, 0, 0U, 0);
  c2_y = c2_b_u;
  sf_mex_destroy(&c2_u);
  return c2_y;
}

static void c2_eML_blk_kernel(SFc2_sliding_controller_rbdlInstanceStruct
  *chartInstance,
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb
  *c2_b_blankMsg)
{
  static uint8_T c2_uv[3] = { 101U, 120U, 111U };

  cudaMemcpy(chartInstance->c2_gpu_blankMsg, c2_b_blankMsg, 208UL,
             cudaMemcpyHostToDevice);
  c2_eML_blk_kernel_kernel7<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c2_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c2_gpu_uv, c2_uv, 3UL, cudaMemcpyHostToDevice);
  c2_eML_blk_kernel_kernel8<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c2_gpu_uv, chartInstance->c2_gpu_blankMsg);
  c2_eML_blk_kernel_kernel9<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c2_gpu_blankMsg);
  cudaMemcpy(c2_b_blankMsg, chartInstance->c2_gpu_blankMsg, 208UL,
             cudaMemcpyDeviceToHost);
}

static __global__ __launch_bounds__(32, 1) void
  c2_sf_gateway_c2_sliding_controller_rbdl_kernel1
  (c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb
   *c2_b_blankMsg,
   c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_b_msg)
{
  uint64_T c2_threadId;
  int32_T c2_i;
  c2_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c2_i = (int32_T)c2_threadId;
  if (c2_i < 4) {
    c2_b_msg->ModelName[c2_i] = c2_b_blankMsg->ModelName[c2_i];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c2_sf_gateway_c2_sliding_controller_rbdl_kernel2
  (c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb
   *c2_b_blankMsg,
   c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_b_msg)
{
  uint64_T c2_threadId;
  int32_T c2_i1;
  c2_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c2_i1 = (int32_T)c2_threadId;
  if (c2_i1 < 7) {
    c2_b_msg->Q[c2_i1] = c2_b_blankMsg->Q[c2_i1];
    c2_b_msg->Qd[c2_i1] = c2_b_blankMsg->Qd[c2_i1];
    c2_b_msg->Qdd[c2_i1] = c2_b_blankMsg->Qdd[c2_i1];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c2_sf_gateway_c2_sliding_controller_rbdl_kernel3
  (c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_b_msg,
   c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_r)
{
  uint64_T c2_threadId;
  int32_T c2_i2;
  c2_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c2_i2 = (int32_T)c2_threadId;
  if (c2_i2 < 4) {
    c2_r->ModelName[c2_i2] = c2_b_msg->ModelName[c2_i2];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c2_sf_gateway_c2_sliding_controller_rbdl_kernel4
  (c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_b_msg,
   c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_r)
{
  uint64_T c2_threadId;
  int32_T c2_i3;
  c2_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c2_i3 = (int32_T)c2_threadId;
  if (c2_i3 < 7) {
    c2_r->Q[c2_i3] = c2_b_msg->Q[c2_i3];
    c2_r->Qd[c2_i3] = c2_b_msg->Qd[c2_i3];
    c2_r->Qdd[c2_i3] = c2_b_msg->Qdd[c2_i3];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c2_sf_gateway_c2_sliding_controller_rbdl_kernel5(const
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_r,
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_b_msg)
{
  uint64_T c2_threadId;
  int32_T c2_i4;
  c2_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c2_i4 = (int32_T)c2_threadId;
  if (c2_i4 < 4) {
    c2_b_msg->ModelName[c2_i4] = c2_r->ModelName[c2_i4];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c2_sf_gateway_c2_sliding_controller_rbdl_kernel6(const
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_r,
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *c2_b_msg)
{
  uint64_T c2_threadId;
  int32_T c2_i5;
  c2_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c2_i5 = (int32_T)c2_threadId;
  if (c2_i5 < 7) {
    c2_b_msg->Q[c2_i5] = c2_r->Q[c2_i5];
    c2_b_msg->Qd[c2_i5] = c2_r->Qd[c2_i5];
    c2_b_msg->Qdd[c2_i5] = c2_r->Qdd[c2_i5];
  }
}

static __global__ __launch_bounds__(32, 1) void c2_eML_blk_kernel_kernel7
  (c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb
   *c2_b_blankMsg)
{
  uint64_T c2_threadId;
  int32_T c2_tmpIdx;
  c2_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c2_tmpIdx = (int32_T)c2_threadId;
  if (c2_tmpIdx < 1) {
    c2_b_blankMsg->ModelName_SL_Info.CurrentLength = 3U;
  }
}

static __global__ __launch_bounds__(32, 1) void c2_eML_blk_kernel_kernel8(const
  uint8_T c2_uv[3],
  c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb
  *c2_b_blankMsg)
{
  uint64_T c2_threadId;
  int32_T c2_i;
  c2_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c2_i = (int32_T)c2_threadId;
  if (c2_i < 3) {
    c2_b_blankMsg->ModelName[c2_i] = c2_uv[c2_i];
  }
}

static __global__ __launch_bounds__(32, 1) void c2_eML_blk_kernel_kernel9
  (c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb
   *c2_b_blankMsg)
{
  uint64_T c2_threadId;
  int32_T c2_tmpIdx;
  c2_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c2_tmpIdx = (int32_T)c2_threadId;
  if (c2_tmpIdx < 1) {
    c2_b_blankMsg->Q_SL_Info.CurrentLength = 7U;
    c2_b_blankMsg->Qd_SL_Info.CurrentLength = 7U;
    c2_b_blankMsg->Qdd_SL_Info.CurrentLength = 7U;
  }
}

static void init_dsm_address_info(SFc2_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc2_sliding_controller_rbdlInstanceStruct *
  chartInstance)
{
  chartInstance->c2_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c2_blankMsg =
    (c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *)
    ssGetInputPortSignal_wrapper(chartInstance->S, 0);
  chartInstance->c2_msg =
    (c2_SL_Bus_sliding_controller_rbdl_RBDLInverseDynamicsReques_yqmb *)
    ssGetOutputPortSignal_wrapper(chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c2_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(895492264U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(3401536428U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2965174071U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(321400159U);
}

mxArray *sf_c2_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c2_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c2_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c2_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WfBop8ZSb8AkJdbnA4JF2j4kG+/ggNl+i"
    "H2RxBwvwqK+yH8zOL4xOSSzLLU+GSj+OKczJTMvPT45Py8kqL8nJzUoviipJQcePwDAQA/hR5N"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c2_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sQcVcJOajzDCVpNPzYn1u6B";
}

static void sf_opaque_initialize_c2_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c2_sliding_controller_rbdl
    ((SFc2_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c2_sliding_controller_rbdl
    ((SFc2_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c2_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c2_sliding_controller_rbdl((SFc2_sliding_controller_rbdlInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c2_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c2_sliding_controller_rbdl((SFc2_sliding_controller_rbdlInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c2_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c2_sliding_controller_rbdl
    ((SFc2_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c2_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c2_sliding_controller_rbdl
    ((SFc2_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c2_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c2_sliding_controller_rbdl
    ((SFc2_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c2_sliding_controller_rbdl(void *
  chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc2_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c2_sliding_controller_rbdl
      ((SFc2_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc2_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc2_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c2_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c2_sliding_controller_rbdl
    ((SFc2_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c2_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c2_sliding_controller_rbdl
    ((SFc2_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc2_sliding_controller_rbdl
    ((SFc2_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c2_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c2_sliding_controller_rbdl
      ((SFc2_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc2_sliding_controller_rbdl
      ((SFc2_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c2_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u00oUdkNBIF1QhZDYIMECCVYIWCBWUOIkIqilvbgtICSi6fgkHjKeMfOTtix4A5YseIu",
    "7uNv7GEh3dZ/hPgJnbCdNHduhRFSAsOS6Y3/nzDnnOz8Tb6m77uF1Ae/Vi553Bp9n8W542XU6Xy",
    "9N3dn7Ze9Gvv6AQsLGm0SRWHu1lyAxPAMtuTVMiq7oy1IYE31QIChiE6lMlTbNYsuZGHasoE6ff",
    "h4xGgWRtDxsoiwJNwQ/QG2JNZuop8UUUNMBCE2kpB1EHU4GE4uV2fMjoENt4zoXNJjAJs4svW65",
    "YQmH9j7QrtCGoMX60LbAEAO+2a9003mqgzFQxglnRJR6GxEdQIIBNrCdhPh3wxp0qgijEVGmCRE",
    "ZgV5jw1SnFFDUyTR+2GWCGKkY4e2Y+05w1rZNjvasyxB4TUDQtqYCMkwkE6aa/6CDnrYF2eXQgl",
    "07qNYWwFvryN9hsAeqMm59X45AkQFsiMpN04C091O2JlkyCzMshh2iHlHkT0NYmb2YOTogyBNso",
    "UQVDFInu3pLsRGGt1KbjbsuM+eVjI0zsvU8WKqtPYI6FibaOlT4hHNdCduSyRqMgKdaW8SQelim",
    "tRynNQu3JAbYpXd1NVjBkPgc5ksRslK6RgVA2neeYmM5iqRWGxn7mLyttbXZz7OwrjCg+oRCWRd",
    "QhGnAmKXhrdYWMu24RyBaZVLzysBZhsxDebpvRWtPqiHGpKaJHLrgGK0ExnqAXGIlbGssmjqY43",
    "IejhIaQegaDOOwjmWD2JKYaNfaHmHdjZg5aIGmiiUlrFqsOmxDbZdQBwlsi6GQe6KjZBzkPT4LL",
    "wBmG1GCiUET+5c66ODuZVS4eXbbO5xnf3zFPBvLFZ83p/Qslejxpp7Ffc816vdt4H9L4/k7JXe+",
    "sM9yQc7hVvD+9Lr95u9/Hn++9f4Vjz7+11hk/78ax5v/F/L1lXGjnRTOaCZfHfbxlF3LJfovT+l",
    "fydf6T7pDn2yQN+9a/k7ydPPdS3HH3mtm/Myxt1Gwd/z+muv4mGVpfiraDfODiVsTm41rp//+lL",
    "1n5sTjXP4+u/5/uJj8pdUij2XxOnUkXqdc5R7J22/f/9rqYvLZ/i/m2H+9wPf1dK73iOsW0KN3e",
    "5qzECu9R6UwSnIOqqd2Q16sz2/N9+PKeScs97PY+Vvu+/P+NfPrpOW8E5Zb1L/jzvEfDV83D7wC",
    "fuUH9mPR89X3xv/rHe8cdDVfP5j81PEjxsOSU2/+GY+w/bKvv0CefgGKtbTt",
    ""
  };

  static char newstr [1261] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c2_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c2_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(1782931097U));
  ssSetChecksum1(S,(3578314164U));
  ssSetChecksum2(S,(1817935406U));
  ssSetChecksum3(S,(48141672U));
}

static void mdlRTW_c2_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c2_sliding_controller_rbdl(SimStruct *S)
{
  SFc2_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc2_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc2_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc2_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance) SFc2_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c2_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c2_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c2_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c2_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c2_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c2_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c2_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c2_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c2_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c2_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c2_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c2_sliding_controller_rbdl;
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
    chartInstance->c2_JITStateAnimation,
    chartInstance->c2_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c2_sliding_controller_rbdl(chartInstance);
}

void c2_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c2_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c2_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c2_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c2_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
