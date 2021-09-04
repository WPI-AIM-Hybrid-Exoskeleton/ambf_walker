/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c16_sliding_controller_rbdl.h"
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
static void initialize_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c16_do_animation_call_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c16_st);
static void sf_gateway_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c16_emlrt_marshallIn(SFc16_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c16_b_msg, const char_T *c16_identifier,
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_y);
static void c16_b_emlrt_marshallIn(SFc16_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c16_u, const emlrtMsgIdentifier *c16_parentId,
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_y);
static void c16_c_emlrt_marshallIn(SFc16_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c16_u, const emlrtMsgIdentifier *c16_parentId,
  real_T c16_y[7]);
static c16_SL_Bus_ROSVariableLengthArrayInfo c16_d_emlrt_marshallIn
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c16_u, const emlrtMsgIdentifier *c16_parentId);
static uint32_T c16_e_emlrt_marshallIn
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c16_u, const emlrtMsgIdentifier *c16_parentId);
static void c16_f_emlrt_marshallIn(SFc16_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c16_u, const emlrtMsgIdentifier *c16_parentId,
  uint8_T c16_y[4]);
static uint8_T c16_g_emlrt_marshallIn
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c16_b_is_active_c16_sliding_controller_rbdl, const char_T *c16_identifier);
static uint8_T c16_h_emlrt_marshallIn
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c16_u, const emlrtMsgIdentifier *c16_parentId);
static void c16_eML_blk_kernel(SFc16_sliding_controller_rbdlInstanceStruct
  *chartInstance,
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq
  *c16_b_blankMsg);
static __global__ void c16_sf_gateway_c16_sliding_controller_rbdl_kernel1
  (c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq
   *c16_b_blankMsg,
   c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_b_msg);
static __global__ void c16_sf_gateway_c16_sliding_controller_rbdl_kernel2
  (c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq
   *c16_b_blankMsg,
   c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_b_msg);
static __global__ void c16_sf_gateway_c16_sliding_controller_rbdl_kernel3
  (c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_r,
   c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq
   *c16_b_blankMsg,
   c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_b_msg);
static __global__ void c16_sf_gateway_c16_sliding_controller_rbdl_kernel4
  (c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_b_msg,
   c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_r);
static __global__ void c16_sf_gateway_c16_sliding_controller_rbdl_kernel5
  (c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_b_msg,
   c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_r);
static __global__ void c16_sf_gateway_c16_sliding_controller_rbdl_kernel6(const
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_r,
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_b_msg);
static __global__ void c16_sf_gateway_c16_sliding_controller_rbdl_kernel7(const
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_r,
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_b_msg);
static __global__ void c16_sf_gateway_c16_sliding_controller_rbdl_kernel8(const
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_r,
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_b_msg);
static void init_dsm_address_info(SFc16_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc16_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c16_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c16_is_active_c16_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c16_do_animation_call_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  static const char_T *c16_sv[10] = { "Q", "Q_SL_Info", "Qd", "Qd_SL_Info",
    "Qdd", "Qdd_SL_Info", "Controller", "Controller_SL_Info", "Other",
    "Other_SL_Info" };

  static const char_T *c16_sv1[2] = { "CurrentLength", "ReceivedLength" };

  const mxArray *c16_b_y = NULL;
  const mxArray *c16_c_y = NULL;
  const mxArray *c16_d_y = NULL;
  const mxArray *c16_e_y = NULL;
  const mxArray *c16_f_y = NULL;
  const mxArray *c16_g_y = NULL;
  const mxArray *c16_h_y = NULL;
  const mxArray *c16_i_y = NULL;
  const mxArray *c16_j_y = NULL;
  const mxArray *c16_k_y = NULL;
  const mxArray *c16_l_y = NULL;
  const mxArray *c16_m_y = NULL;
  const mxArray *c16_n_y = NULL;
  const mxArray *c16_o_y = NULL;
  const mxArray *c16_p_y = NULL;
  const mxArray *c16_q_y = NULL;
  const mxArray *c16_r_y = NULL;
  const mxArray *c16_s_y = NULL;
  const mxArray *c16_st;
  const mxArray *c16_t_y = NULL;
  const mxArray *c16_u_y = NULL;
  const mxArray *c16_v_y = NULL;
  const mxArray *c16_w_y = NULL;
  const mxArray *c16_y = NULL;
  real_T c16_u[7];
  int32_T c16_i;
  int32_T c16_i1;
  int32_T c16_i2;
  int32_T c16_i3;
  int32_T c16_i4;
  uint32_T c16_b_u;
  uint32_T c16_c_u;
  uint32_T c16_d_u;
  uint32_T c16_e_u;
  uint32_T c16_f_u;
  uint32_T c16_g_u;
  uint32_T c16_i_u;
  uint32_T c16_j_u;
  uint32_T c16_k_u;
  uint32_T c16_l_u;
  uint32_T c16_u_CurrentLength;
  uint32_T c16_u_ReceivedLength;
  uint8_T c16_h_u[4];
  c16_st = NULL;
  c16_y = NULL;
  sf_mex_assign(&c16_y, sf_mex_createcellmatrix(2, 1), false);
  c16_b_y = NULL;
  sf_mex_assign(&c16_b_y, sf_mex_createstruct("structure", 10, c16_sv, 2, 1, 1),
                false);
  for (c16_i = 0; c16_i < 7; c16_i++) {
    c16_u[c16_i] = ((real_T *)&((char_T *)chartInstance->c16_msg)[0])[c16_i];
  }

  c16_c_y = NULL;
  sf_mex_assign(&c16_c_y, sf_mex_create("y", c16_u, 0, 0U, 1U, 0U, 1, 7), false);
  sf_mex_setfieldbynum(c16_b_y, 0, "Q", c16_c_y, 0);
  c16_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [56])[0];
  c16_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [56])[4];
  c16_d_y = NULL;
  sf_mex_assign(&c16_d_y, sf_mex_createstruct("structure", 2, c16_sv1, 2, 1, 1),
                false);
  c16_b_u = c16_u_CurrentLength;
  c16_e_y = NULL;
  sf_mex_assign(&c16_e_y, sf_mex_create("y", &c16_b_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c16_d_y, 0, "CurrentLength", c16_e_y, 0);
  c16_c_u = c16_u_ReceivedLength;
  c16_f_y = NULL;
  sf_mex_assign(&c16_f_y, sf_mex_create("y", &c16_c_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c16_d_y, 0, "ReceivedLength", c16_f_y, 1);
  sf_mex_setfieldbynum(c16_b_y, 0, "Q_SL_Info", c16_d_y, 1);
  for (c16_i1 = 0; c16_i1 < 7; c16_i1++) {
    c16_u[c16_i1] = ((real_T *)&((char_T *)chartInstance->c16_msg)[64])[c16_i1];
  }

  c16_g_y = NULL;
  sf_mex_assign(&c16_g_y, sf_mex_create("y", c16_u, 0, 0U, 1U, 0U, 1, 7), false);
  sf_mex_setfieldbynum(c16_b_y, 0, "Qd", c16_g_y, 2);
  c16_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [120])[0];
  c16_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [120])[4];
  c16_h_y = NULL;
  sf_mex_assign(&c16_h_y, sf_mex_createstruct("structure", 2, c16_sv1, 2, 1, 1),
                false);
  c16_d_u = c16_u_CurrentLength;
  c16_i_y = NULL;
  sf_mex_assign(&c16_i_y, sf_mex_create("y", &c16_d_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c16_h_y, 0, "CurrentLength", c16_i_y, 0);
  c16_e_u = c16_u_ReceivedLength;
  c16_j_y = NULL;
  sf_mex_assign(&c16_j_y, sf_mex_create("y", &c16_e_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c16_h_y, 0, "ReceivedLength", c16_j_y, 1);
  sf_mex_setfieldbynum(c16_b_y, 0, "Qd_SL_Info", c16_h_y, 3);
  for (c16_i2 = 0; c16_i2 < 7; c16_i2++) {
    c16_u[c16_i2] = ((real_T *)&((char_T *)chartInstance->c16_msg)[128])[c16_i2];
  }

  c16_k_y = NULL;
  sf_mex_assign(&c16_k_y, sf_mex_create("y", c16_u, 0, 0U, 1U, 0U, 1, 7), false);
  sf_mex_setfieldbynum(c16_b_y, 0, "Qdd", c16_k_y, 4);
  c16_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [184])[0];
  c16_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [184])[4];
  c16_l_y = NULL;
  sf_mex_assign(&c16_l_y, sf_mex_createstruct("structure", 2, c16_sv1, 2, 1, 1),
                false);
  c16_f_u = c16_u_CurrentLength;
  c16_m_y = NULL;
  sf_mex_assign(&c16_m_y, sf_mex_create("y", &c16_f_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c16_l_y, 0, "CurrentLength", c16_m_y, 0);
  c16_g_u = c16_u_ReceivedLength;
  c16_n_y = NULL;
  sf_mex_assign(&c16_n_y, sf_mex_create("y", &c16_g_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c16_l_y, 0, "ReceivedLength", c16_n_y, 1);
  sf_mex_setfieldbynum(c16_b_y, 0, "Qdd_SL_Info", c16_l_y, 5);
  for (c16_i3 = 0; c16_i3 < 4; c16_i3++) {
    c16_h_u[c16_i3] = ((uint8_T *)&((char_T *)chartInstance->c16_msg)[192])
      [c16_i3];
  }

  c16_o_y = NULL;
  sf_mex_assign(&c16_o_y, sf_mex_create("y", c16_h_u, 3, 0U, 1U, 0U, 1, 4),
                false);
  sf_mex_setfieldbynum(c16_b_y, 0, "Controller", c16_o_y, 6);
  c16_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [200])[0];
  c16_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [200])[4];
  c16_p_y = NULL;
  sf_mex_assign(&c16_p_y, sf_mex_createstruct("structure", 2, c16_sv1, 2, 1, 1),
                false);
  c16_i_u = c16_u_CurrentLength;
  c16_q_y = NULL;
  sf_mex_assign(&c16_q_y, sf_mex_create("y", &c16_i_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c16_p_y, 0, "CurrentLength", c16_q_y, 0);
  c16_j_u = c16_u_ReceivedLength;
  c16_r_y = NULL;
  sf_mex_assign(&c16_r_y, sf_mex_create("y", &c16_j_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c16_p_y, 0, "ReceivedLength", c16_r_y, 1);
  sf_mex_setfieldbynum(c16_b_y, 0, "Controller_SL_Info", c16_p_y, 7);
  for (c16_i4 = 0; c16_i4 < 7; c16_i4++) {
    c16_u[c16_i4] = ((real_T *)&((char_T *)chartInstance->c16_msg)[208])[c16_i4];
  }

  c16_s_y = NULL;
  sf_mex_assign(&c16_s_y, sf_mex_create("y", c16_u, 0, 0U, 1U, 0U, 1, 7), false);
  sf_mex_setfieldbynum(c16_b_y, 0, "Other", c16_s_y, 8);
  c16_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [264])[0];
  c16_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [264])[4];
  c16_t_y = NULL;
  sf_mex_assign(&c16_t_y, sf_mex_createstruct("structure", 2, c16_sv1, 2, 1, 1),
                false);
  c16_k_u = c16_u_CurrentLength;
  c16_u_y = NULL;
  sf_mex_assign(&c16_u_y, sf_mex_create("y", &c16_k_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c16_t_y, 0, "CurrentLength", c16_u_y, 0);
  c16_l_u = c16_u_ReceivedLength;
  c16_v_y = NULL;
  sf_mex_assign(&c16_v_y, sf_mex_create("y", &c16_l_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c16_t_y, 0, "ReceivedLength", c16_v_y, 1);
  sf_mex_setfieldbynum(c16_b_y, 0, "Other_SL_Info", c16_t_y, 9);
  sf_mex_setcell(c16_y, 0, c16_b_y);
  c16_w_y = NULL;
  sf_mex_assign(&c16_w_y, sf_mex_create("y",
    &chartInstance->c16_is_active_c16_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c16_y, 1, c16_w_y);
  sf_mex_assign(&c16_st, c16_y, false);
  return c16_st;
}

static void set_sim_state_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c16_st)
{
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq c16_r;
  const mxArray *c16_u;
  int32_T c16_i;
  int32_T c16_i1;
  int32_T c16_i2;
  c16_u = sf_mex_dup(c16_st);
  c16_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c16_u, 0)),
                       "msg", &c16_r);
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[56])[0] = c16_r.Q_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[56])[4] = c16_r.Q_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[120])[0] = c16_r.Qd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[120])[4] = c16_r.Qd_SL_Info.ReceivedLength;
  for (c16_i = 0; c16_i < 7; c16_i++) {
    ((real_T *)&((char_T *)chartInstance->c16_msg)[0])[c16_i] = c16_r.Q[c16_i];
    ((real_T *)&((char_T *)chartInstance->c16_msg)[64])[c16_i] = c16_r.Qd[c16_i];
    ((real_T *)&((char_T *)chartInstance->c16_msg)[128])[c16_i] =
      c16_r.Qdd[c16_i];
  }

  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[184])[0] = c16_r.Qdd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[184])[4] = c16_r.Qdd_SL_Info.ReceivedLength;
  for (c16_i1 = 0; c16_i1 < 4; c16_i1++) {
    ((uint8_T *)&((char_T *)chartInstance->c16_msg)[192])[c16_i1] =
      c16_r.Controller[c16_i1];
  }

  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[200])[0] = c16_r.Controller_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[200])[4] = c16_r.Controller_SL_Info.ReceivedLength;
  for (c16_i2 = 0; c16_i2 < 7; c16_i2++) {
    ((real_T *)&((char_T *)chartInstance->c16_msg)[208])[c16_i2] =
      c16_r.Other[c16_i2];
  }

  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[264])[0] = c16_r.Other_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[264])[4] = c16_r.Other_SL_Info.ReceivedLength;
  chartInstance->c16_is_active_c16_sliding_controller_rbdl =
    c16_g_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c16_u, 1)),
    "is_active_c16_sliding_controller_rbdl");
  sf_mex_destroy(&c16_u);
  sf_mex_destroy(&c16_st);
}

static void sf_gateway_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq c16_r;
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq
    *c16_gpu_blankMsg;
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_gpu_msg;
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_gpu_r;
  cudaMalloc(&c16_gpu_r, 272UL);
  cudaMalloc(&c16_gpu_msg, 272UL);
  cudaMalloc(&c16_gpu_blankMsg, 272UL);
  chartInstance->c16_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[56])[0] = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_blankMsg)[56])[0];
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[56])[4] = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_blankMsg)[56])[4];
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[120])[0] = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_blankMsg)[120])[0];
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[120])[4] = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_blankMsg)[120])[4];
  cudaMemcpy(c16_gpu_blankMsg, chartInstance->c16_blankMsg, 272UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c16_gpu_msg, chartInstance->c16_msg, 272UL, cudaMemcpyHostToDevice);
  c16_sf_gateway_c16_sliding_controller_rbdl_kernel1<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c16_gpu_blankMsg, c16_gpu_msg);
  cudaMemcpy(chartInstance->c16_msg, c16_gpu_msg, 272UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c16_blankMsg, c16_gpu_blankMsg, 272UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[184])[0] = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_blankMsg)[184])[0];
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[184])[4] = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_blankMsg)[184])[4];
  cudaMemcpy(c16_gpu_blankMsg, chartInstance->c16_blankMsg, 272UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c16_gpu_msg, chartInstance->c16_msg, 272UL, cudaMemcpyHostToDevice);
  c16_sf_gateway_c16_sliding_controller_rbdl_kernel2<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c16_gpu_blankMsg, c16_gpu_msg);
  cudaMemcpy(chartInstance->c16_msg, c16_gpu_msg, 272UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c16_blankMsg, c16_gpu_blankMsg, 272UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[200])[0] = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_blankMsg)[200])[0];
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[200])[4] = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_blankMsg)[200])[4];
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[264])[0] = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_blankMsg)[264])[0];
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[264])[4] = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_blankMsg)[264])[4];
  c16_r.Q_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [56])[0];
  c16_r.Q_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [56])[4];
  c16_r.Qd_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [120])[0];
  c16_r.Qd_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [120])[4];
  cudaMemcpy(c16_gpu_r, &c16_r, 272UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c16_gpu_blankMsg, chartInstance->c16_blankMsg, 272UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c16_gpu_msg, chartInstance->c16_msg, 272UL, cudaMemcpyHostToDevice);
  c16_sf_gateway_c16_sliding_controller_rbdl_kernel3<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c16_gpu_r, c16_gpu_blankMsg, c16_gpu_msg);
  cudaMemcpy(chartInstance->c16_msg, c16_gpu_msg, 272UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c16_blankMsg, c16_gpu_blankMsg, 272UL,
             cudaMemcpyDeviceToHost);
  cudaMemcpy(&c16_r, c16_gpu_r, 272UL, cudaMemcpyDeviceToHost);
  c16_r.Qdd_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [184])[0];
  c16_r.Qdd_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [184])[4];
  cudaMemcpy(c16_gpu_r, &c16_r, 272UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c16_gpu_msg, chartInstance->c16_msg, 272UL, cudaMemcpyHostToDevice);
  c16_sf_gateway_c16_sliding_controller_rbdl_kernel4<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c16_gpu_msg, c16_gpu_r);
  cudaMemcpy(chartInstance->c16_msg, c16_gpu_msg, 272UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c16_r, c16_gpu_r, 272UL, cudaMemcpyDeviceToHost);
  c16_r.Controller_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [200])[0];
  c16_r.Controller_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [200])[4];
  cudaMemcpy(c16_gpu_r, &c16_r, 272UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c16_gpu_msg, chartInstance->c16_msg, 272UL, cudaMemcpyHostToDevice);
  c16_sf_gateway_c16_sliding_controller_rbdl_kernel5<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c16_gpu_msg, c16_gpu_r);
  cudaMemcpy(chartInstance->c16_msg, c16_gpu_msg, 272UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c16_r, c16_gpu_r, 272UL, cudaMemcpyDeviceToHost);
  c16_r.Other_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [264])[0];
  c16_r.Other_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c16_msg)
    [264])[4];
  c16_eML_blk_kernel(chartInstance, &c16_r);
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[56])[0] = c16_r.Q_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[56])[4] = c16_r.Q_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[120])[0] = c16_r.Qd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[120])[4] = c16_r.Qd_SL_Info.ReceivedLength;
  cudaMemcpy(c16_gpu_r, &c16_r, 272UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c16_gpu_msg, chartInstance->c16_msg, 272UL, cudaMemcpyHostToDevice);
  c16_sf_gateway_c16_sliding_controller_rbdl_kernel6<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c16_gpu_r, c16_gpu_msg);
  cudaMemcpy(chartInstance->c16_msg, c16_gpu_msg, 272UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[184])[0] = c16_r.Qdd_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[184])[4] = c16_r.Qdd_SL_Info.ReceivedLength;
  cudaMemcpy(c16_gpu_msg, chartInstance->c16_msg, 272UL, cudaMemcpyHostToDevice);
  c16_sf_gateway_c16_sliding_controller_rbdl_kernel7<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c16_gpu_r, c16_gpu_msg);
  cudaMemcpy(chartInstance->c16_msg, c16_gpu_msg, 272UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[200])[0] = c16_r.Controller_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[200])[4] = c16_r.Controller_SL_Info.ReceivedLength;
  cudaMemcpy(c16_gpu_msg, chartInstance->c16_msg, 272UL, cudaMemcpyHostToDevice);
  c16_sf_gateway_c16_sliding_controller_rbdl_kernel8<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c16_gpu_r, c16_gpu_msg);
  cudaMemcpy(chartInstance->c16_msg, c16_gpu_msg, 272UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[264])[0] = c16_r.Other_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c16_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c16_msg)[264])[4] = c16_r.Other_SL_Info.ReceivedLength;
  c16_do_animation_call_c16_sliding_controller_rbdl(chartInstance);
  cudaFree(c16_gpu_blankMsg);
  cudaFree(c16_gpu_msg);
  cudaFree(c16_gpu_r);
}

static void mdl_start_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c16_errCode;
  c16_errCode = cudaGetLastError();
  if (c16_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c16_errCode, (char_T *)cudaGetErrorName
                       (c16_errCode), (char_T *)cudaGetErrorString(c16_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c16_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc16_sliding_controller_rbdl
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c16_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c16_nameCaptureInfo = NULL;
  c16_nameCaptureInfo = NULL;
  sf_mex_assign(&c16_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c16_nameCaptureInfo;
}

static void c16_emlrt_marshallIn(SFc16_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c16_b_msg, const char_T *c16_identifier,
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_y)
{
  emlrtMsgIdentifier c16_thisId;
  c16_thisId.fIdentifier = const_cast<const char_T *>(c16_identifier);
  c16_thisId.fParent = NULL;
  c16_thisId.bParentIsCell = false;
  c16_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c16_b_msg), &c16_thisId,
    c16_y);
  sf_mex_destroy(&c16_b_msg);
}

static void c16_b_emlrt_marshallIn(SFc16_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c16_u, const emlrtMsgIdentifier *c16_parentId,
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_y)
{
  static const char_T *c16_fieldNames[10] = { "Q", "Q_SL_Info", "Qd",
    "Qd_SL_Info", "Qdd", "Qdd_SL_Info", "Controller", "Controller_SL_Info",
    "Other", "Other_SL_Info" };

  emlrtMsgIdentifier c16_thisId;
  c16_thisId.fParent = c16_parentId;
  c16_thisId.bParentIsCell = false;
  sf_mex_check_struct(c16_parentId, c16_u, 10, c16_fieldNames, 0U, NULL);
  c16_thisId.fIdentifier = "Q";
  c16_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c16_u, "Q",
    "Q", 0)), &c16_thisId, c16_y->Q);
  c16_thisId.fIdentifier = "Q_SL_Info";
  c16_y->Q_SL_Info = c16_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c16_u, "Q_SL_Info", "Q_SL_Info", 0)), &c16_thisId);
  c16_thisId.fIdentifier = "Qd";
  c16_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c16_u, "Qd",
    "Qd", 0)), &c16_thisId, c16_y->Qd);
  c16_thisId.fIdentifier = "Qd_SL_Info";
  c16_y->Qd_SL_Info = c16_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c16_u, "Qd_SL_Info", "Qd_SL_Info", 0)), &c16_thisId);
  c16_thisId.fIdentifier = "Qdd";
  c16_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c16_u, "Qdd",
    "Qdd", 0)), &c16_thisId, c16_y->Qdd);
  c16_thisId.fIdentifier = "Qdd_SL_Info";
  c16_y->Qdd_SL_Info = c16_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c16_u, "Qdd_SL_Info", "Qdd_SL_Info", 0)), &c16_thisId);
  c16_thisId.fIdentifier = "Controller";
  c16_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c16_u,
    "Controller", "Controller", 0)), &c16_thisId, c16_y->Controller);
  c16_thisId.fIdentifier = "Controller_SL_Info";
  c16_y->Controller_SL_Info = c16_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c16_u, "Controller_SL_Info", "Controller_SL_Info", 0)),
    &c16_thisId);
  c16_thisId.fIdentifier = "Other";
  c16_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c16_u,
    "Other", "Other", 0)), &c16_thisId, c16_y->Other);
  c16_thisId.fIdentifier = "Other_SL_Info";
  c16_y->Other_SL_Info = c16_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c16_u, "Other_SL_Info", "Other_SL_Info", 0)), &c16_thisId);
  sf_mex_destroy(&c16_u);
}

static void c16_c_emlrt_marshallIn(SFc16_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c16_u, const emlrtMsgIdentifier *c16_parentId,
  real_T c16_y[7])
{
  real_T c16_dv[7];
  int32_T c16_i;
  sf_mex_import(c16_parentId, sf_mex_dup(c16_u), c16_dv, 1, 0, 0U, 1, 0U, 1, 7);
  for (c16_i = 0; c16_i < 7; c16_i++) {
    c16_y[c16_i] = c16_dv[c16_i];
  }

  sf_mex_destroy(&c16_u);
}

static c16_SL_Bus_ROSVariableLengthArrayInfo c16_d_emlrt_marshallIn
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c16_u, const emlrtMsgIdentifier *c16_parentId)
{
  static const char_T *c16_fieldNames[2] = { "CurrentLength", "ReceivedLength" };

  c16_SL_Bus_ROSVariableLengthArrayInfo c16_y;
  emlrtMsgIdentifier c16_thisId;
  c16_thisId.fParent = c16_parentId;
  c16_thisId.bParentIsCell = false;
  sf_mex_check_struct(c16_parentId, c16_u, 2, c16_fieldNames, 0U, NULL);
  c16_thisId.fIdentifier = "CurrentLength";
  c16_y.CurrentLength = c16_e_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c16_u, "CurrentLength", "CurrentLength", 0)), &c16_thisId);
  c16_thisId.fIdentifier = "ReceivedLength";
  c16_y.ReceivedLength = c16_e_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c16_u, "ReceivedLength", "ReceivedLength", 0)), &c16_thisId);
  sf_mex_destroy(&c16_u);
  return c16_y;
}

static uint32_T c16_e_emlrt_marshallIn
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c16_u, const emlrtMsgIdentifier *c16_parentId)
{
  uint32_T c16_b_u;
  uint32_T c16_y;
  sf_mex_import(c16_parentId, sf_mex_dup(c16_u), &c16_b_u, 1, 7, 0U, 0, 0U, 0);
  c16_y = c16_b_u;
  sf_mex_destroy(&c16_u);
  return c16_y;
}

static void c16_f_emlrt_marshallIn(SFc16_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c16_u, const emlrtMsgIdentifier *c16_parentId,
  uint8_T c16_y[4])
{
  int32_T c16_i;
  uint8_T c16_uv[4];
  sf_mex_import(c16_parentId, sf_mex_dup(c16_u), c16_uv, 1, 3, 0U, 1, 0U, 1, 4);
  for (c16_i = 0; c16_i < 4; c16_i++) {
    c16_y[c16_i] = c16_uv[c16_i];
  }

  sf_mex_destroy(&c16_u);
}

static uint8_T c16_g_emlrt_marshallIn
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c16_b_is_active_c16_sliding_controller_rbdl, const char_T *c16_identifier)
{
  emlrtMsgIdentifier c16_thisId;
  uint8_T c16_y;
  c16_thisId.fIdentifier = const_cast<const char_T *>(c16_identifier);
  c16_thisId.fParent = NULL;
  c16_thisId.bParentIsCell = false;
  c16_y = c16_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c16_b_is_active_c16_sliding_controller_rbdl), &c16_thisId);
  sf_mex_destroy(&c16_b_is_active_c16_sliding_controller_rbdl);
  return c16_y;
}

static uint8_T c16_h_emlrt_marshallIn
  (SFc16_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c16_u, const emlrtMsgIdentifier *c16_parentId)
{
  uint8_T c16_b_u;
  uint8_T c16_y;
  sf_mex_import(c16_parentId, sf_mex_dup(c16_u), &c16_b_u, 1, 3, 0U, 0, 0U, 0);
  c16_y = c16_b_u;
  sf_mex_destroy(&c16_u);
  return c16_y;
}

static void c16_eML_blk_kernel(SFc16_sliding_controller_rbdlInstanceStruct
  *chartInstance,
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq
  *c16_b_blankMsg)
{
  c16_b_blankMsg->Q_SL_Info.CurrentLength = 7U;
  c16_b_blankMsg->Qd_SL_Info.CurrentLength = 7U;
  c16_b_blankMsg->Qdd_SL_Info.CurrentLength = 7U;
}

static __global__ __launch_bounds__(32, 1) void
  c16_sf_gateway_c16_sliding_controller_rbdl_kernel1
  (c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq
   *c16_b_blankMsg,
   c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_b_msg)
{
  uint64_T c16_threadId;
  int32_T c16_i;
  c16_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c16_i = (int32_T)c16_threadId;
  if (c16_i < 7) {
    c16_b_msg->Q[c16_i] = c16_b_blankMsg->Q[c16_i];
    c16_b_msg->Qd[c16_i] = c16_b_blankMsg->Qd[c16_i];
    c16_b_msg->Qdd[c16_i] = c16_b_blankMsg->Qdd[c16_i];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c16_sf_gateway_c16_sliding_controller_rbdl_kernel2
  (c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq
   *c16_b_blankMsg,
   c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_b_msg)
{
  uint64_T c16_threadId;
  int32_T c16_i1;
  c16_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c16_i1 = (int32_T)c16_threadId;
  if (c16_i1 < 4) {
    c16_b_msg->Controller[c16_i1] = c16_b_blankMsg->Controller[c16_i1];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c16_sf_gateway_c16_sliding_controller_rbdl_kernel3
  (c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_r,
   c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq
   *c16_b_blankMsg,
   c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_b_msg)
{
  uint64_T c16_threadId;
  int32_T c16_i2;
  c16_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c16_i2 = (int32_T)c16_threadId;
  if (c16_i2 < 7) {
    c16_b_msg->Other[c16_i2] = c16_b_blankMsg->Other[c16_i2];
    c16_r->Q[c16_i2] = c16_b_msg->Q[c16_i2];
    c16_r->Qd[c16_i2] = c16_b_msg->Qd[c16_i2];
    c16_r->Qdd[c16_i2] = c16_b_msg->Qdd[c16_i2];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c16_sf_gateway_c16_sliding_controller_rbdl_kernel4
  (c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_b_msg,
   c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_r)
{
  uint64_T c16_threadId;
  int32_T c16_i3;
  c16_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c16_i3 = (int32_T)c16_threadId;
  if (c16_i3 < 4) {
    c16_r->Controller[c16_i3] = c16_b_msg->Controller[c16_i3];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c16_sf_gateway_c16_sliding_controller_rbdl_kernel5
  (c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_b_msg,
   c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_r)
{
  uint64_T c16_threadId;
  int32_T c16_i4;
  c16_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c16_i4 = (int32_T)c16_threadId;
  if (c16_i4 < 7) {
    c16_r->Other[c16_i4] = c16_b_msg->Other[c16_i4];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c16_sf_gateway_c16_sliding_controller_rbdl_kernel6(const
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_r,
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_b_msg)
{
  uint64_T c16_threadId;
  int32_T c16_i5;
  c16_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c16_i5 = (int32_T)c16_threadId;
  if (c16_i5 < 7) {
    c16_b_msg->Q[c16_i5] = c16_r->Q[c16_i5];
    c16_b_msg->Qd[c16_i5] = c16_r->Qd[c16_i5];
    c16_b_msg->Qdd[c16_i5] = c16_r->Qdd[c16_i5];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c16_sf_gateway_c16_sliding_controller_rbdl_kernel7(const
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_r,
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_b_msg)
{
  uint64_T c16_threadId;
  int32_T c16_i6;
  c16_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c16_i6 = (int32_T)c16_threadId;
  if (c16_i6 < 4) {
    c16_b_msg->Controller[c16_i6] = c16_r->Controller[c16_i6];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c16_sf_gateway_c16_sliding_controller_rbdl_kernel8(const
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_r,
  c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *c16_b_msg)
{
  uint64_T c16_threadId;
  int32_T c16_i7;
  c16_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c16_i7 = (int32_T)c16_threadId;
  if (c16_i7 < 7) {
    c16_b_msg->Other[c16_i7] = c16_r->Other[c16_i7];
  }
}

static void init_dsm_address_info(SFc16_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc16_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
  chartInstance->c16_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c16_blankMsg =
    (c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *)
    ssGetInputPortSignal_wrapper(chartInstance->S, 0);
  chartInstance->c16_msg =
    (c16_SL_Bus_sliding_controller_rbdl_DesiredJointsCmdRequest_rfbsq *)
    ssGetOutputPortSignal_wrapper(chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c16_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(2412018572U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1870368763U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(254930633U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2940839482U);
}

mxArray *sf_c16_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c16_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c16_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c16_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WfBop8ZSb8AkJdbnA4JF2j4kG+/ggNl+i"
    "H2RxBwvyqK+yH8zOL4xOSSzLLU+GRDs/jinMyUzLz0+OT8vJKi/Jyc1KL4oqSUHFj8AwEAPYEeh"
    "A=="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c16_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sbp4IWq9s75xwXA1Mt6Z23";
}

static void sf_opaque_initialize_c16_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c16_sliding_controller_rbdl
    ((SFc16_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c16_sliding_controller_rbdl
    ((SFc16_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c16_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c16_sliding_controller_rbdl
    ((SFc16_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c16_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c16_sliding_controller_rbdl
    ((SFc16_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c16_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c16_sliding_controller_rbdl
    ((SFc16_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c16_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c16_sliding_controller_rbdl
    ((SFc16_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c16_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c16_sliding_controller_rbdl
    ((SFc16_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c16_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc16_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c16_sliding_controller_rbdl
      ((SFc16_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc16_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc16_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c16_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c16_sliding_controller_rbdl
    ((SFc16_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c16_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c16_sliding_controller_rbdl
    ((SFc16_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc16_sliding_controller_rbdl
    ((SFc16_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c16_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c16_sliding_controller_rbdl
      ((SFc16_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc16_sliding_controller_rbdl
      ((SFc16_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c16_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u20YQphXXaIA0MIogJwPNIUZ7bP7bS2pbP4gAqzZKOwl6EVbLkbjQcpfZH8p+gp6Cvkp",
    "vOeU9ij5Cc0mAPEBnSUqWKZKKI8RIixKg6SW/mZ2Zb35W3lq35+F1He+drz1vA59f4t3wsuuLfL",
    "02d2fv171v8/VLFBI2OiSKRNqrvQSJ4BfQklvDpOiKoSyFMTEEBYIiNpbKVGnTLLKciXHHCur06",
    "Wcho6EfSsuDPZQlwYHgp6gttuYQ9bSYAmo6AIEJlbSjsMPJaGaxMpNmCHSsbVTnggbj29iZpXuW",
    "GxZzaJ8A7QptCFqsz2zzDTHQNCeVbjpPtT8FyijmjIhSb0OifYgxwAaO4wD/HliDThVhNCTK7EF",
    "IEtD7bJzqlAKKOpnGDwMmiJGKEd6OeNMJLtp2yNGengyA1wQEbdtTQMaxZMJU8+930NO2IAMOLR",
    "jYUbU2H15YR/5TBhNQlXEbNmUCiozgQFRumgakfZKyNcuSRZhhETwlapcifxqCyuzFzNE+QZ7gC",
    "CWqYJA62dVHiiUY3kptNuq6zFxWMjbKyNbLYKm2dgJ1LMy0dahoEs51JexIxvuQAE+1togh9bBM",
    "azlOaxYcSQywS+/qarCCIfE5rClFwErpSgqAtO/8jI3lPJJabWTUxORt7e8vfl6EdYUBNSQUyrq",
    "AIkwDxiwNb7W2gGnHPQLRKpOaVwbOMmQZytNDK1oTqcYYk5omcuaCY7QSGOkRcomVcKyxaOpgjs",
    "tlOEpoCIFrMIxDD8sGsSUx0a617WLdJcyctkBTxeISVi1WHbahtkuo0xiOxVjIiegoGfl5j8/CC",
    "4DZRpRgYrSH/UuddnD3MircPPveO5tn1z5gnk3lis/v5vSslejx5p7Ffa826vdt4H9r0/k7J/dV",
    "YZ/1gpzDbeL919bt7eT1+9823vz9+7tG8GqV/f9oXGz+X8/XW9NGOyucZCFfHfbJnF3rJfpvzun",
    "fzNd6EN/vPnvxo3704GTyfPdOzzz89e69nJ8l9jYK9k7f33IdH7MszU9Fu0F+MHFrYrNx7fT/MG",
    "fvxpJ4XM3fZ9fbn1aTv7FT5LEsXlfOxeuKq9xzefvx+9/aWU0+2//5Evu3C3xvp3O9T1y3gD698",
    "7CvOQuw1PtUCqMk56D6ahDwQn1+bL5fVM67ZLl/i53/y3163j9kfl22nHfJcqv6d9E5/rnh6+aB",
    "V8BvfsZ+rHq++tT4P72LnYO+ydePZz91miHjQcmpN/+MR9hh2df/QJ7+AwkwtQw=",
    ""
  };

  static char newstr [1265] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c16_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c16_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(623123674U));
  ssSetChecksum1(S,(2280963446U));
  ssSetChecksum2(S,(2414537478U));
  ssSetChecksum3(S,(3076784881U));
}

static void mdlRTW_c16_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c16_sliding_controller_rbdl(SimStruct *S)
{
  SFc16_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc16_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc16_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc16_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc16_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c16_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c16_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c16_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c16_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c16_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c16_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c16_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c16_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c16_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c16_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c16_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c16_sliding_controller_rbdl;
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
    chartInstance->c16_JITStateAnimation,
    chartInstance->c16_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c16_sliding_controller_rbdl(chartInstance);
}

void c16_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c16_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c16_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c16_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c16_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
