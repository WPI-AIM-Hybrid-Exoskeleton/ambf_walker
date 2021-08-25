/* Include files */

#include "sliding_controller_const_sfun.h"
#include "c15_sliding_controller_const.h"
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
static void initialize_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance);
static void initialize_params_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance);
static void enable_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance);
static void disable_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance);
static void c15_do_animation_call_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance);
static void ext_mode_exec_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance);
static void set_sim_state_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c15_st);
static void sf_gateway_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_start_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_terminate_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance);
static void initSimStructsc15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance);
static void c15_emlrt_marshallIn(SFc15_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c15_b_msg, const char_T *c15_identifier,
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_y);
static void c15_b_emlrt_marshallIn(SFc15_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c15_u, const emlrtMsgIdentifier *c15_parentId,
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_y);
static void c15_c_emlrt_marshallIn(SFc15_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c15_u, const emlrtMsgIdentifier *c15_parentId,
  c15_SL_Bus_sliding_controller_const_std_msgs_Header *c15_y);
static uint32_T c15_d_emlrt_marshallIn
  (SFc15_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c15_u, const emlrtMsgIdentifier *c15_parentId);
static c15_SL_Bus_sliding_controller_const_ros_time_Time c15_e_emlrt_marshallIn
  (SFc15_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c15_u, const emlrtMsgIdentifier *c15_parentId);
static real_T c15_f_emlrt_marshallIn
  (SFc15_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c15_u, const emlrtMsgIdentifier *c15_parentId);
static void c15_g_emlrt_marshallIn(SFc15_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c15_u, const emlrtMsgIdentifier *c15_parentId,
  uint8_T c15_y[128]);
static c15_SL_Bus_ROSVariableLengthArrayInfo c15_h_emlrt_marshallIn
  (SFc15_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c15_u, const emlrtMsgIdentifier *c15_parentId);
static void c15_i_emlrt_marshallIn(SFc15_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c15_u, const emlrtMsgIdentifier *c15_parentId,
  c15_SL_Bus_sliding_controller_const_std_msgs_String c15_y[16]);
static void c15_j_emlrt_marshallIn(SFc15_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c15_u, const emlrtMsgIdentifier *c15_parentId,
  real_T c15_y[7]);
static uint8_T c15_k_emlrt_marshallIn
  (SFc15_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c15_b_is_active_c15_sliding_controller_const, const char_T *c15_identifier);
static uint8_T c15_l_emlrt_marshallIn
  (SFc15_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c15_u, const emlrtMsgIdentifier *c15_parentId);
static void c15_eML_blk_kernel(SFc15_sliding_controller_constInstanceStruct
  *chartInstance, c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState
  *c15_b_blankMsg);
static __global__ void c15_sf_gateway_c15_sliding_controller_const_kernel1
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg,
   c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_msg);
static __global__ void c15_sf_gateway_c15_sliding_controller_const_kernel2(const
  int32_T c15_i1, c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState
  *c15_b_blankMsg, c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState
  *c15_b_msg);
static __global__ void c15_sf_gateway_c15_sliding_controller_const_kernel3
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg,
   c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_msg);
static __global__ void c15_sf_gateway_c15_sliding_controller_const_kernel4
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_msg,
   c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_r);
static __global__ void c15_sf_gateway_c15_sliding_controller_const_kernel5(const
  int32_T c15_i5, c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState
  *c15_b_msg, c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_r);
static __global__ void c15_sf_gateway_c15_sliding_controller_const_kernel6
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_msg,
   c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_r);
static __global__ void c15_sf_gateway_c15_sliding_controller_const_kernel7(const
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_r,
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_msg);
static __global__ void c15_sf_gateway_c15_sliding_controller_const_kernel8(const
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_r, const
  int32_T c15_i9, c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState
  *c15_b_msg);
static __global__ void c15_sf_gateway_c15_sliding_controller_const_kernel9(const
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_r,
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_msg);
static __global__ void c15_eML_blk_kernel_kernel10
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg);
static __global__ void c15_eML_blk_kernel_kernel11(const uint8_T c15_uv[7],
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg);
static __global__ void c15_eML_blk_kernel_kernel12
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg);
static __global__ void c15_eML_blk_kernel_kernel13(const uint8_T c15_uv1[8],
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg);
static __global__ void c15_eML_blk_kernel_kernel14
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg);
static __global__ void c15_eML_blk_kernel_kernel15(const uint8_T c15_uv2[9],
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg);
static __global__ void c15_eML_blk_kernel_kernel16
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg);
static __global__ void c15_eML_blk_kernel_kernel17(const uint8_T c15_uv3[8],
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg);
static __global__ void c15_eML_blk_kernel_kernel18
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg);
static __global__ void c15_eML_blk_kernel_kernel19(const uint8_T c15_uv4[9],
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg);
static __global__ void c15_eML_blk_kernel_kernel20
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg);
static __global__ void c15_eML_blk_kernel_kernel21(const uint8_T c15_uv5[10],
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg);
static __global__ void c15_eML_blk_kernel_kernel22
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg);
static __global__ void c15_eML_blk_kernel_kernel23(const uint8_T c15_uv6[6],
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg);
static __global__ void c15_eML_blk_kernel_kernel24
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg);
static void init_dsm_address_info(SFc15_sliding_controller_constInstanceStruct
  *chartInstance);
static void init_simulink_io_address
  (SFc15_sliding_controller_constInstanceStruct *chartInstance);

/* Function Definitions */
static void initialize_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c15_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c15_is_active_c15_sliding_controller_const = 0U;
  cudaGetLastError();
  cudaMalloc(&chartInstance->c15_gpu_uv6, 6UL);
  cudaMalloc(&chartInstance->c15_gpu_uv5, 10UL);
  cudaMalloc(&chartInstance->c15_gpu_uv4, 9UL);
  cudaMalloc(&chartInstance->c15_gpu_uv3, 8UL);
  cudaMalloc(&chartInstance->c15_gpu_uv2, 9UL);
  cudaMalloc(&chartInstance->c15_gpu_uv1, 8UL);
  cudaMalloc(&chartInstance->c15_gpu_uv, 7UL);
  cudaMalloc(&chartInstance->c15_gpu_blankMsg, 2536UL);
}

static void initialize_params_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void enable_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c15_do_animation_call_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance)
{
  static const char_T *c15_sv[9] = { "Header", "Name", "Name_SL_Info",
    "Position", "Position_SL_Info", "Velocity", "Velocity_SL_Info", "Effort",
    "Effort_SL_Info" };

  static const char_T *c15_sv1[4] = { "Seq", "Stamp", "FrameId",
    "FrameId_SL_Info" };

  static const char_T *c15_sv2[2] = { "Sec", "Nsec" };

  static const char_T *c15_sv3[2] = { "CurrentLength", "ReceivedLength" };

  static const char_T *c15_sv4[2] = { "Data", "Data_SL_Info" };

  c15_SL_Bus_sliding_controller_const_std_msgs_String c15_g_u[16];
  const c15_SL_Bus_sliding_controller_const_std_msgs_String *c15_r;
  const mxArray *c15_ab_y = NULL;
  const mxArray *c15_b_y = NULL;
  const mxArray *c15_bb_y = NULL;
  const mxArray *c15_c_y = NULL;
  const mxArray *c15_cb_y = NULL;
  const mxArray *c15_d_y = NULL;
  const mxArray *c15_db_y = NULL;
  const mxArray *c15_e_y = NULL;
  const mxArray *c15_eb_y = NULL;
  const mxArray *c15_f_y = NULL;
  const mxArray *c15_fb_y = NULL;
  const mxArray *c15_g_y = NULL;
  const mxArray *c15_gb_y = NULL;
  const mxArray *c15_h_y = NULL;
  const mxArray *c15_i_y = NULL;
  const mxArray *c15_j_y = NULL;
  const mxArray *c15_k_y = NULL;
  const mxArray *c15_l_y = NULL;
  const mxArray *c15_m_y = NULL;
  const mxArray *c15_n_y = NULL;
  const mxArray *c15_o_y = NULL;
  const mxArray *c15_p_y = NULL;
  const mxArray *c15_q_y = NULL;
  const mxArray *c15_r_y = NULL;
  const mxArray *c15_s_y = NULL;
  const mxArray *c15_st;
  const mxArray *c15_t_y = NULL;
  const mxArray *c15_u_y = NULL;
  const mxArray *c15_v_y = NULL;
  const mxArray *c15_w_y = NULL;
  const mxArray *c15_x_y = NULL;
  const mxArray *c15_y = NULL;
  const mxArray *c15_y_y = NULL;
  real_T c15_l_u[7];
  real_T c15_b_u;
  real_T c15_c_u;
  real_T c15_u_Stamp_Nsec;
  real_T c15_u_Stamp_Sec;
  int32_T c15_iv[1];
  int32_T c15_b_i;
  int32_T c15_i;
  int32_T c15_i1;
  int32_T c15_i2;
  int32_T c15_i3;
  int32_T c15_i4;
  int32_T c15_i5;
  int32_T c15_i6;
  int32_T c15_i7;
  uint32_T c15_e_u;
  uint32_T c15_f_u;
  uint32_T c15_h_u;
  uint32_T c15_i_u;
  uint32_T c15_j_u;
  uint32_T c15_k_u;
  uint32_T c15_m_u;
  uint32_T c15_n_u;
  uint32_T c15_o_u;
  uint32_T c15_p_u;
  uint32_T c15_q_u;
  uint32_T c15_r_u;
  uint32_T c15_u;
  uint32_T c15_u_CurrentLength;
  uint32_T c15_u_FrameId_SL_Info_CurrentLength;
  uint32_T c15_u_FrameId_SL_Info_ReceivedLength;
  uint32_T c15_u_ReceivedLength;
  uint32_T c15_u_Seq;
  uint8_T c15_d_u[128];
  uint8_T c15_u_FrameId[128];
  c15_st = NULL;
  c15_y = NULL;
  sf_mex_assign(&c15_y, sf_mex_createcellmatrix(2, 1), false);
  c15_b_y = NULL;
  sf_mex_assign(&c15_b_y, sf_mex_createstruct("structure", 9, c15_sv, 2, 1, 1),
                false);
  c15_u_Seq = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_msg)[0])[0];
  c15_u_Stamp_Sec = *(real_T *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_ros_time_Time *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_msg)[0])[8])[0];
  c15_u_Stamp_Nsec = *(real_T *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_ros_time_Time *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_msg)[0])[8])[8];
  for (c15_i = 0; c15_i < 128; c15_i++) {
    c15_u_FrameId[c15_i] = ((uint8_T *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
      chartInstance->c15_msg)[0])[24])[c15_i];
  }

  c15_u_FrameId_SL_Info_CurrentLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_msg)[0])[152])[0];
  c15_u_FrameId_SL_Info_ReceivedLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_msg)[0])[152])[4];
  c15_c_y = NULL;
  sf_mex_assign(&c15_c_y, sf_mex_createstruct("structure", 4, c15_sv1, 2, 1, 1),
                false);
  c15_u = c15_u_Seq;
  c15_d_y = NULL;
  sf_mex_assign(&c15_d_y, sf_mex_create("y", &c15_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c15_c_y, 0, "Seq", c15_d_y, 0);
  c15_e_y = NULL;
  sf_mex_assign(&c15_e_y, sf_mex_createstruct("structure", 2, c15_sv2, 2, 1, 1),
                false);
  c15_b_u = c15_u_Stamp_Sec;
  c15_f_y = NULL;
  sf_mex_assign(&c15_f_y, sf_mex_create("y", &c15_b_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c15_e_y, 0, "Sec", c15_f_y, 0);
  c15_c_u = c15_u_Stamp_Nsec;
  c15_g_y = NULL;
  sf_mex_assign(&c15_g_y, sf_mex_create("y", &c15_c_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c15_e_y, 0, "Nsec", c15_g_y, 1);
  sf_mex_setfieldbynum(c15_c_y, 0, "Stamp", c15_e_y, 1);
  for (c15_i1 = 0; c15_i1 < 128; c15_i1++) {
    c15_d_u[c15_i1] = c15_u_FrameId[c15_i1];
  }

  c15_h_y = NULL;
  sf_mex_assign(&c15_h_y, sf_mex_create("y", c15_d_u, 3, 0U, 1U, 0U, 1, 128),
                false);
  sf_mex_setfieldbynum(c15_c_y, 0, "FrameId", c15_h_y, 2);
  c15_i_y = NULL;
  sf_mex_assign(&c15_i_y, sf_mex_createstruct("structure", 2, c15_sv3, 2, 1, 1),
                false);
  c15_e_u = c15_u_FrameId_SL_Info_CurrentLength;
  c15_j_y = NULL;
  sf_mex_assign(&c15_j_y, sf_mex_create("y", &c15_e_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c15_i_y, 0, "CurrentLength", c15_j_y, 0);
  c15_f_u = c15_u_FrameId_SL_Info_ReceivedLength;
  c15_k_y = NULL;
  sf_mex_assign(&c15_k_y, sf_mex_create("y", &c15_f_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c15_i_y, 0, "ReceivedLength", c15_k_y, 1);
  sf_mex_setfieldbynum(c15_c_y, 0, "FrameId_SL_Info", c15_i_y, 3);
  sf_mex_setfieldbynum(c15_b_y, 0, "Header", c15_c_y, 0);
  for (c15_i2 = 0; c15_i2 < 16; c15_i2++) {
    for (c15_i3 = 0; c15_i3 < 128; c15_i3++) {
      c15_g_u[c15_i2].Data[c15_i3] = ((uint8_T *)&((char_T *)
        (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
        (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
        chartInstance->c15_msg)[160])[136 * (int32_T)c15_i2])[0])[c15_i3];
    }

    c15_g_u[c15_i2].Data_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
      (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c15_msg)[160])[136 * (int32_T)c15_i2])[128])[0];
    c15_g_u[c15_i2].Data_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
      (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c15_msg)[160])[136 * (int32_T)c15_i2])[128])[4];
  }

  c15_l_y = NULL;
  c15_iv[0] = 16;
  sf_mex_assign(&c15_l_y, sf_mex_createstructarray("structure", 1, c15_iv, 2,
    c15_sv4), false);
  for (c15_b_i = 0; c15_b_i < 16; c15_b_i++) {
    c15_r = &c15_g_u[c15_b_i];
    for (c15_i4 = 0; c15_i4 < 128; c15_i4++) {
      c15_d_u[c15_i4] = c15_r->Data[c15_i4];
    }

    c15_n_y = NULL;
    sf_mex_assign(&c15_n_y, sf_mex_create("y", c15_d_u, 3, 0U, 1U, 0U, 1, 128),
                  false);
    sf_mex_setfieldbynum(c15_l_y, c15_b_i, "Data", c15_n_y, 0);
    c15_u_CurrentLength = c15_r->Data_SL_Info.CurrentLength;
    c15_u_ReceivedLength = c15_r->Data_SL_Info.ReceivedLength;
    c15_p_y = NULL;
    sf_mex_assign(&c15_p_y, sf_mex_createstruct("structure", 2, c15_sv3, 2, 1, 1),
                  false);
    c15_j_u = c15_u_CurrentLength;
    c15_r_y = NULL;
    sf_mex_assign(&c15_r_y, sf_mex_create("y", &c15_j_u, 7, 0U, 0U, 0U, 0),
                  false);
    sf_mex_setfieldbynum(c15_p_y, 0, "CurrentLength", c15_r_y, 0);
    c15_k_u = c15_u_ReceivedLength;
    c15_s_y = NULL;
    sf_mex_assign(&c15_s_y, sf_mex_create("y", &c15_k_u, 7, 0U, 0U, 0U, 0),
                  false);
    sf_mex_setfieldbynum(c15_p_y, 0, "ReceivedLength", c15_s_y, 1);
    sf_mex_setfieldbynum(c15_l_y, c15_b_i, "Data_SL_Info", c15_p_y, 1);
  }

  sf_mex_setfieldbynum(c15_b_y, 0, "Name", c15_l_y, 1);
  c15_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c15_msg)
    [2336])[0];
  c15_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c15_msg)
    [2336])[4];
  c15_m_y = NULL;
  sf_mex_assign(&c15_m_y, sf_mex_createstruct("structure", 2, c15_sv3, 2, 1, 1),
                false);
  c15_h_u = c15_u_CurrentLength;
  c15_o_y = NULL;
  sf_mex_assign(&c15_o_y, sf_mex_create("y", &c15_h_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c15_m_y, 0, "CurrentLength", c15_o_y, 0);
  c15_i_u = c15_u_ReceivedLength;
  c15_q_y = NULL;
  sf_mex_assign(&c15_q_y, sf_mex_create("y", &c15_i_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c15_m_y, 0, "ReceivedLength", c15_q_y, 1);
  sf_mex_setfieldbynum(c15_b_y, 0, "Name_SL_Info", c15_m_y, 2);
  for (c15_i5 = 0; c15_i5 < 7; c15_i5++) {
    c15_l_u[c15_i5] = ((real_T *)&((char_T *)chartInstance->c15_msg)[2344])
      [c15_i5];
  }

  c15_t_y = NULL;
  sf_mex_assign(&c15_t_y, sf_mex_create("y", c15_l_u, 0, 0U, 1U, 0U, 1, 7),
                false);
  sf_mex_setfieldbynum(c15_b_y, 0, "Position", c15_t_y, 3);
  c15_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c15_msg)
    [2400])[0];
  c15_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c15_msg)
    [2400])[4];
  c15_u_y = NULL;
  sf_mex_assign(&c15_u_y, sf_mex_createstruct("structure", 2, c15_sv3, 2, 1, 1),
                false);
  c15_m_u = c15_u_CurrentLength;
  c15_v_y = NULL;
  sf_mex_assign(&c15_v_y, sf_mex_create("y", &c15_m_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c15_u_y, 0, "CurrentLength", c15_v_y, 0);
  c15_n_u = c15_u_ReceivedLength;
  c15_w_y = NULL;
  sf_mex_assign(&c15_w_y, sf_mex_create("y", &c15_n_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c15_u_y, 0, "ReceivedLength", c15_w_y, 1);
  sf_mex_setfieldbynum(c15_b_y, 0, "Position_SL_Info", c15_u_y, 4);
  for (c15_i6 = 0; c15_i6 < 7; c15_i6++) {
    c15_l_u[c15_i6] = ((real_T *)&((char_T *)chartInstance->c15_msg)[2408])
      [c15_i6];
  }

  c15_x_y = NULL;
  sf_mex_assign(&c15_x_y, sf_mex_create("y", c15_l_u, 0, 0U, 1U, 0U, 1, 7),
                false);
  sf_mex_setfieldbynum(c15_b_y, 0, "Velocity", c15_x_y, 5);
  c15_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c15_msg)
    [2464])[0];
  c15_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c15_msg)
    [2464])[4];
  c15_y_y = NULL;
  sf_mex_assign(&c15_y_y, sf_mex_createstruct("structure", 2, c15_sv3, 2, 1, 1),
                false);
  c15_o_u = c15_u_CurrentLength;
  c15_ab_y = NULL;
  sf_mex_assign(&c15_ab_y, sf_mex_create("y", &c15_o_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c15_y_y, 0, "CurrentLength", c15_ab_y, 0);
  c15_p_u = c15_u_ReceivedLength;
  c15_bb_y = NULL;
  sf_mex_assign(&c15_bb_y, sf_mex_create("y", &c15_p_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c15_y_y, 0, "ReceivedLength", c15_bb_y, 1);
  sf_mex_setfieldbynum(c15_b_y, 0, "Velocity_SL_Info", c15_y_y, 6);
  for (c15_i7 = 0; c15_i7 < 7; c15_i7++) {
    c15_l_u[c15_i7] = ((real_T *)&((char_T *)chartInstance->c15_msg)[2472])
      [c15_i7];
  }

  c15_cb_y = NULL;
  sf_mex_assign(&c15_cb_y, sf_mex_create("y", c15_l_u, 0, 0U, 1U, 0U, 1, 7),
                false);
  sf_mex_setfieldbynum(c15_b_y, 0, "Effort", c15_cb_y, 7);
  c15_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c15_msg)
    [2528])[0];
  c15_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c15_msg)
    [2528])[4];
  c15_db_y = NULL;
  sf_mex_assign(&c15_db_y, sf_mex_createstruct("structure", 2, c15_sv3, 2, 1, 1),
                false);
  c15_q_u = c15_u_CurrentLength;
  c15_eb_y = NULL;
  sf_mex_assign(&c15_eb_y, sf_mex_create("y", &c15_q_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c15_db_y, 0, "CurrentLength", c15_eb_y, 0);
  c15_r_u = c15_u_ReceivedLength;
  c15_fb_y = NULL;
  sf_mex_assign(&c15_fb_y, sf_mex_create("y", &c15_r_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c15_db_y, 0, "ReceivedLength", c15_fb_y, 1);
  sf_mex_setfieldbynum(c15_b_y, 0, "Effort_SL_Info", c15_db_y, 8);
  sf_mex_setcell(c15_y, 0, c15_b_y);
  c15_gb_y = NULL;
  sf_mex_assign(&c15_gb_y, sf_mex_create("y",
    &chartInstance->c15_is_active_c15_sliding_controller_const, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c15_y, 1, c15_gb_y);
  sf_mex_assign(&c15_st, c15_y, false);
  return c15_st;
}

static void set_sim_state_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c15_st)
{
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState c15_r;
  const mxArray *c15_u;
  int32_T c15_i;
  int32_T c15_i1;
  int32_T c15_i2;
  int32_T c15_i3;
  c15_u = sf_mex_dup(c15_st);
  c15_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c15_u, 0)),
                       "msg", &c15_r);
  *(uint32_T *)&((char_T *)(c15_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c15_msg)[0])[0] = c15_r.Header.Seq;
  *(real_T *)&((char_T *)(c15_SL_Bus_sliding_controller_const_ros_time_Time *)
               &((char_T *)(c15_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c15_msg)[0])[8])[0] =
    c15_r.Header.Stamp.Sec;
  *(real_T *)&((char_T *)(c15_SL_Bus_sliding_controller_const_ros_time_Time *)
               &((char_T *)(c15_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c15_msg)[0])[8])[8] =
    c15_r.Header.Stamp.Nsec;
  for (c15_i = 0; c15_i < 128; c15_i++) {
    ((uint8_T *)&((char_T *)(c15_SL_Bus_sliding_controller_const_std_msgs_Header
       *)&((char_T *)chartInstance->c15_msg)[0])[24])[c15_i] =
      c15_r.Header.FrameId[c15_i];
  }

  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_msg)[0])[152])[0] =
    c15_r.Header.FrameId_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_msg)[0])[152])[4] =
    c15_r.Header.FrameId_SL_Info.ReceivedLength;
  for (c15_i1 = 0; c15_i1 < 16; c15_i1++) {
    for (c15_i2 = 0; c15_i2 < 128; c15_i2++) {
      ((uint8_T *)&((char_T *)
                    (c15_SL_Bus_sliding_controller_const_std_msgs_String *)
                    &((char_T *)
                      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)
                      &((char_T *)chartInstance->c15_msg)[160])[136 * (int32_T)
                    c15_i1])[0])[c15_i2] = c15_r.Name[c15_i1].Data[c15_i2];
    }

    *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c15_msg)[160])[136 * (int32_T)c15_i1])[128])[0] =
      c15_r.Name[c15_i1].Data_SL_Info.CurrentLength;
    *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c15_msg)[160])[136 * (int32_T)c15_i1])[128])[4] =
      c15_r.Name[c15_i1].Data_SL_Info.ReceivedLength;
  }

  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2336])[0] = c15_r.Name_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2336])[4] = c15_r.Name_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2400])[0] = c15_r.Position_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2400])[4] = c15_r.Position_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2464])[0] = c15_r.Velocity_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2464])[4] = c15_r.Velocity_SL_Info.ReceivedLength;
  for (c15_i3 = 0; c15_i3 < 7; c15_i3++) {
    ((real_T *)&((char_T *)chartInstance->c15_msg)[2344])[c15_i3] =
      c15_r.Position[c15_i3];
    ((real_T *)&((char_T *)chartInstance->c15_msg)[2408])[c15_i3] =
      c15_r.Velocity[c15_i3];
    ((real_T *)&((char_T *)chartInstance->c15_msg)[2472])[c15_i3] =
      c15_r.Effort[c15_i3];
  }

  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2528])[0] = c15_r.Effort_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2528])[4] = c15_r.Effort_SL_Info.ReceivedLength;
  chartInstance->c15_is_active_c15_sliding_controller_const =
    c15_k_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c15_u, 1)),
    "is_active_c15_sliding_controller_const");
  sf_mex_destroy(&c15_u);
  sf_mex_destroy(&c15_st);
}

static void sf_gateway_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance)
{
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState c15_r;
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_gpu_blankMsg;
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_gpu_msg;
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_gpu_r;
  int32_T c15_i1;
  int32_T c15_i5;
  int32_T c15_i9;
  cudaMalloc(&c15_gpu_r, 2536UL);
  cudaMalloc(&c15_gpu_msg, 2536UL);
  cudaMalloc(&c15_b_gpu_blankMsg, 2536UL);
  chartInstance->c15_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  *(uint32_T *)&((char_T *)(c15_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c15_msg)[0])[0] = *(uint32_T *)
    &((char_T *)(c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T
        *)chartInstance->c15_blankMsg)[0])[0];
  *(real_T *)&((char_T *)(c15_SL_Bus_sliding_controller_const_ros_time_Time *)
               &((char_T *)(c15_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c15_msg)[0])[8])[0] = *(real_T *)
    &((char_T *)(c15_SL_Bus_sliding_controller_const_ros_time_Time *)&((char_T *)
       (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
        chartInstance->c15_blankMsg)[0])[8])[0];
  *(real_T *)&((char_T *)(c15_SL_Bus_sliding_controller_const_ros_time_Time *)
               &((char_T *)(c15_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c15_msg)[0])[8])[8] = *(real_T *)
    &((char_T *)(c15_SL_Bus_sliding_controller_const_ros_time_Time *)&((char_T *)
       (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
        chartInstance->c15_blankMsg)[0])[8])[8];
  cudaMemcpy(c15_b_gpu_blankMsg, chartInstance->c15_blankMsg, 2536UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c15_gpu_msg, chartInstance->c15_msg, 2536UL, cudaMemcpyHostToDevice);
  c15_sf_gateway_c15_sliding_controller_const_kernel1<<<dim3(1U, 1U, 1U), dim3
    (128U, 1U, 1U)>>>(c15_b_gpu_blankMsg, c15_gpu_msg);
  cudaMemcpy(chartInstance->c15_msg, c15_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c15_blankMsg, c15_b_gpu_blankMsg, 2536UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_msg)[0])[152])[0] = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_blankMsg)[0])[152])[0];
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_msg)[0])[152])[4] = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_blankMsg)[0])[152])[4];
  for (c15_i1 = 0; c15_i1 < 16; c15_i1++) {
    cudaMemcpy(c15_b_gpu_blankMsg, chartInstance->c15_blankMsg, 2536UL,
               cudaMemcpyHostToDevice);
    cudaMemcpy(c15_gpu_msg, chartInstance->c15_msg, 2536UL,
               cudaMemcpyHostToDevice);
    c15_sf_gateway_c15_sliding_controller_const_kernel2<<<dim3(1U, 1U, 1U), dim3
      (128U, 1U, 1U)>>>(c15_i1, c15_b_gpu_blankMsg, c15_gpu_msg);
    cudaMemcpy(chartInstance->c15_msg, c15_gpu_msg, 2536UL,
               cudaMemcpyDeviceToHost);
    cudaMemcpy(chartInstance->c15_blankMsg, c15_b_gpu_blankMsg, 2536UL,
               cudaMemcpyDeviceToHost);
    *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c15_msg)[160])[136 * (int32_T)c15_i1])[128])[0] =
      *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)
                     &((char_T *)
                       (c15_SL_Bus_sliding_controller_const_std_msgs_String *)
                       &((char_T *)
                         (c15_SL_Bus_sliding_controller_const_std_msgs_String *)
                         &((char_T *)chartInstance->c15_blankMsg)[160])[136 *
                       (int32_T)c15_i1])[128])[0];
    *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c15_msg)[160])[136 * (int32_T)c15_i1])[128])[4] =
      *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)
                     &((char_T *)
                       (c15_SL_Bus_sliding_controller_const_std_msgs_String *)
                       &((char_T *)
                         (c15_SL_Bus_sliding_controller_const_std_msgs_String *)
                         &((char_T *)chartInstance->c15_blankMsg)[160])[136 *
                       (int32_T)c15_i1])[128])[4];
  }

  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2336])[0] = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_blankMsg)[2336])[0];
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2336])[4] = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_blankMsg)[2336])[4];
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2400])[0] = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_blankMsg)[2400])[0];
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2400])[4] = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_blankMsg)[2400])[4];
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2464])[0] = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_blankMsg)[2464])[0];
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2464])[4] = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_blankMsg)[2464])[4];
  cudaMemcpy(c15_b_gpu_blankMsg, chartInstance->c15_blankMsg, 2536UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c15_gpu_msg, chartInstance->c15_msg, 2536UL, cudaMemcpyHostToDevice);
  c15_sf_gateway_c15_sliding_controller_const_kernel3<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c15_b_gpu_blankMsg, c15_gpu_msg);
  cudaMemcpy(chartInstance->c15_msg, c15_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c15_blankMsg, c15_b_gpu_blankMsg, 2536UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2528])[0] = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_blankMsg)[2528])[0];
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2528])[4] = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_blankMsg)[2528])[4];
  c15_r.Header.Seq = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_msg)[0])[0];
  c15_r.Header.Stamp.Sec = *(real_T *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_ros_time_Time *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_msg)[0])[8])[0];
  c15_r.Header.Stamp.Nsec = *(real_T *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_ros_time_Time *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_msg)[0])[8])[8];
  cudaMemcpy(c15_gpu_r, &c15_r, 2536UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c15_gpu_msg, chartInstance->c15_msg, 2536UL, cudaMemcpyHostToDevice);
  c15_sf_gateway_c15_sliding_controller_const_kernel4<<<dim3(1U, 1U, 1U), dim3
    (128U, 1U, 1U)>>>(c15_gpu_msg, c15_gpu_r);
  cudaMemcpy(chartInstance->c15_msg, c15_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c15_r, c15_gpu_r, 2536UL, cudaMemcpyDeviceToHost);
  c15_r.Header.FrameId_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_msg)[0])[152])[0];
  c15_r.Header.FrameId_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_msg)[0])[152])[4];
  for (c15_i5 = 0; c15_i5 < 16; c15_i5++) {
    cudaMemcpy(c15_gpu_r, &c15_r, 2536UL, cudaMemcpyHostToDevice);
    cudaMemcpy(c15_gpu_msg, chartInstance->c15_msg, 2536UL,
               cudaMemcpyHostToDevice);
    c15_sf_gateway_c15_sliding_controller_const_kernel5<<<dim3(1U, 1U, 1U), dim3
      (128U, 1U, 1U)>>>(c15_i5, c15_gpu_msg, c15_gpu_r);
    cudaMemcpy(chartInstance->c15_msg, c15_gpu_msg, 2536UL,
               cudaMemcpyDeviceToHost);
    cudaMemcpy(&c15_r, c15_gpu_r, 2536UL, cudaMemcpyDeviceToHost);
    c15_r.Name[c15_i5].Data_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
      (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c15_msg)[160])[136 * (int32_T)c15_i5])[128])[0];
    c15_r.Name[c15_i5].Data_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
      (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c15_msg)[160])[136 * (int32_T)c15_i5])[128])[4];
  }

  c15_r.Name_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c15_msg)
    [2336])[0];
  c15_r.Name_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c15_msg)
    [2336])[4];
  c15_r.Position_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c15_msg)
    [2400])[0];
  c15_r.Position_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c15_msg)
    [2400])[4];
  c15_r.Velocity_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c15_msg)
    [2464])[0];
  c15_r.Velocity_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c15_msg)
    [2464])[4];
  cudaMemcpy(c15_gpu_r, &c15_r, 2536UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c15_gpu_msg, chartInstance->c15_msg, 2536UL, cudaMemcpyHostToDevice);
  c15_sf_gateway_c15_sliding_controller_const_kernel6<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c15_gpu_msg, c15_gpu_r);
  cudaMemcpy(chartInstance->c15_msg, c15_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c15_r, c15_gpu_r, 2536UL, cudaMemcpyDeviceToHost);
  c15_r.Effort_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c15_msg)
    [2528])[0];
  c15_r.Effort_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c15_msg)
    [2528])[4];
  c15_eML_blk_kernel(chartInstance, &c15_r);
  *(uint32_T *)&((char_T *)(c15_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c15_msg)[0])[0] = c15_r.Header.Seq;
  *(real_T *)&((char_T *)(c15_SL_Bus_sliding_controller_const_ros_time_Time *)
               &((char_T *)(c15_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c15_msg)[0])[8])[0] =
    c15_r.Header.Stamp.Sec;
  *(real_T *)&((char_T *)(c15_SL_Bus_sliding_controller_const_ros_time_Time *)
               &((char_T *)(c15_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c15_msg)[0])[8])[8] =
    c15_r.Header.Stamp.Nsec;
  cudaMemcpy(c15_gpu_r, &c15_r, 2536UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c15_gpu_msg, chartInstance->c15_msg, 2536UL, cudaMemcpyHostToDevice);
  c15_sf_gateway_c15_sliding_controller_const_kernel7<<<dim3(1U, 1U, 1U), dim3
    (128U, 1U, 1U)>>>(c15_gpu_r, c15_gpu_msg);
  cudaMemcpy(chartInstance->c15_msg, c15_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_msg)[0])[152])[0] =
    c15_r.Header.FrameId_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c15_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c15_msg)[0])[152])[4] =
    c15_r.Header.FrameId_SL_Info.ReceivedLength;
  for (c15_i9 = 0; c15_i9 < 16; c15_i9++) {
    cudaMemcpy(c15_gpu_msg, chartInstance->c15_msg, 2536UL,
               cudaMemcpyHostToDevice);
    c15_sf_gateway_c15_sliding_controller_const_kernel8<<<dim3(1U, 1U, 1U), dim3
      (128U, 1U, 1U)>>>(c15_gpu_r, c15_i9, c15_gpu_msg);
    cudaMemcpy(chartInstance->c15_msg, c15_gpu_msg, 2536UL,
               cudaMemcpyDeviceToHost);
    *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c15_msg)[160])[136 * (int32_T)c15_i9])[128])[0] =
      c15_r.Name[c15_i9].Data_SL_Info.CurrentLength;
    *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c15_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c15_msg)[160])[136 * (int32_T)c15_i9])[128])[4] =
      c15_r.Name[c15_i9].Data_SL_Info.ReceivedLength;
  }

  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2336])[0] = c15_r.Name_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2336])[4] = c15_r.Name_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2400])[0] = c15_r.Position_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2400])[4] = c15_r.Position_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2464])[0] = c15_r.Velocity_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2464])[4] = c15_r.Velocity_SL_Info.ReceivedLength;
  cudaMemcpy(c15_gpu_msg, chartInstance->c15_msg, 2536UL, cudaMemcpyHostToDevice);
  c15_sf_gateway_c15_sliding_controller_const_kernel9<<<dim3(1U, 1U, 1U), dim3
    (32U, 1U, 1U)>>>(c15_gpu_r, c15_gpu_msg);
  cudaMemcpy(chartInstance->c15_msg, c15_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2528])[0] = c15_r.Effort_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c15_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c15_msg)[2528])[4] = c15_r.Effort_SL_Info.ReceivedLength;
  c15_do_animation_call_c15_sliding_controller_const(chartInstance);
  cudaFree(c15_b_gpu_blankMsg);
  cudaFree(c15_gpu_msg);
  cudaFree(c15_gpu_r);
}

static void mdl_start_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance)
{
  cudaError_t c15_errCode;
  cudaFree(*chartInstance->c15_gpu_uv6);
  cudaFree(*chartInstance->c15_gpu_uv5);
  cudaFree(*chartInstance->c15_gpu_uv4);
  cudaFree(*chartInstance->c15_gpu_uv3);
  cudaFree(*chartInstance->c15_gpu_uv2);
  cudaFree(*chartInstance->c15_gpu_uv1);
  cudaFree(*chartInstance->c15_gpu_uv);
  cudaFree(chartInstance->c15_gpu_blankMsg);
  c15_errCode = cudaGetLastError();
  if (c15_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c15_errCode, (char_T *)cudaGetErrorName
                       (c15_errCode), (char_T *)cudaGetErrorString(c15_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c15_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void initSimStructsc15_sliding_controller_const
  (SFc15_sliding_controller_constInstanceStruct *chartInstance)
{
}

const mxArray *sf_c15_sliding_controller_const_get_eml_resolved_functions_info()
{
  const mxArray *c15_nameCaptureInfo = NULL;
  c15_nameCaptureInfo = NULL;
  sf_mex_assign(&c15_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c15_nameCaptureInfo;
}

static void c15_emlrt_marshallIn(SFc15_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c15_b_msg, const char_T *c15_identifier,
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_y)
{
  emlrtMsgIdentifier c15_thisId;
  c15_thisId.fIdentifier = const_cast<const char_T *>(c15_identifier);
  c15_thisId.fParent = NULL;
  c15_thisId.bParentIsCell = false;
  c15_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c15_b_msg), &c15_thisId,
    c15_y);
  sf_mex_destroy(&c15_b_msg);
}

static void c15_b_emlrt_marshallIn(SFc15_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c15_u, const emlrtMsgIdentifier *c15_parentId,
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_y)
{
  static const char_T *c15_fieldNames[9] = { "Header", "Name", "Name_SL_Info",
    "Position", "Position_SL_Info", "Velocity", "Velocity_SL_Info", "Effort",
    "Effort_SL_Info" };

  emlrtMsgIdentifier c15_thisId;
  c15_thisId.fParent = c15_parentId;
  c15_thisId.bParentIsCell = false;
  sf_mex_check_struct(c15_parentId, c15_u, 9, c15_fieldNames, 0U, NULL);
  c15_thisId.fIdentifier = "Header";
  c15_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c15_u,
    "Header", "Header", 0)), &c15_thisId, &c15_y->Header);
  c15_thisId.fIdentifier = "Name";
  c15_i_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c15_u, "Name",
    "Name", 0)), &c15_thisId, c15_y->Name);
  c15_thisId.fIdentifier = "Name_SL_Info";
  c15_y->Name_SL_Info = c15_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c15_u, "Name_SL_Info", "Name_SL_Info", 0)), &c15_thisId);
  c15_thisId.fIdentifier = "Position";
  c15_j_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c15_u,
    "Position", "Position", 0)), &c15_thisId, c15_y->Position);
  c15_thisId.fIdentifier = "Position_SL_Info";
  c15_y->Position_SL_Info = c15_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c15_u, "Position_SL_Info", "Position_SL_Info", 0)),
    &c15_thisId);
  c15_thisId.fIdentifier = "Velocity";
  c15_j_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c15_u,
    "Velocity", "Velocity", 0)), &c15_thisId, c15_y->Velocity);
  c15_thisId.fIdentifier = "Velocity_SL_Info";
  c15_y->Velocity_SL_Info = c15_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c15_u, "Velocity_SL_Info", "Velocity_SL_Info", 0)),
    &c15_thisId);
  c15_thisId.fIdentifier = "Effort";
  c15_j_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c15_u,
    "Effort", "Effort", 0)), &c15_thisId, c15_y->Effort);
  c15_thisId.fIdentifier = "Effort_SL_Info";
  c15_y->Effort_SL_Info = c15_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c15_u, "Effort_SL_Info", "Effort_SL_Info", 0)), &c15_thisId);
  sf_mex_destroy(&c15_u);
}

static void c15_c_emlrt_marshallIn(SFc15_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c15_u, const emlrtMsgIdentifier *c15_parentId,
  c15_SL_Bus_sliding_controller_const_std_msgs_Header *c15_y)
{
  static const char_T *c15_fieldNames[4] = { "Seq", "Stamp", "FrameId",
    "FrameId_SL_Info" };

  emlrtMsgIdentifier c15_thisId;
  c15_thisId.fParent = c15_parentId;
  c15_thisId.bParentIsCell = false;
  sf_mex_check_struct(c15_parentId, c15_u, 4, c15_fieldNames, 0U, NULL);
  c15_thisId.fIdentifier = "Seq";
  c15_y->Seq = c15_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c15_u, "Seq", "Seq", 0)), &c15_thisId);
  c15_thisId.fIdentifier = "Stamp";
  c15_y->Stamp = c15_e_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c15_u, "Stamp", "Stamp", 0)), &c15_thisId);
  c15_thisId.fIdentifier = "FrameId";
  c15_g_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c15_u,
    "FrameId", "FrameId", 0)), &c15_thisId, c15_y->FrameId);
  c15_thisId.fIdentifier = "FrameId_SL_Info";
  c15_y->FrameId_SL_Info = c15_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c15_u, "FrameId_SL_Info", "FrameId_SL_Info", 0)),
    &c15_thisId);
  sf_mex_destroy(&c15_u);
}

static uint32_T c15_d_emlrt_marshallIn
  (SFc15_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c15_u, const emlrtMsgIdentifier *c15_parentId)
{
  uint32_T c15_b_u;
  uint32_T c15_y;
  sf_mex_import(c15_parentId, sf_mex_dup(c15_u), &c15_b_u, 1, 7, 0U, 0, 0U, 0);
  c15_y = c15_b_u;
  sf_mex_destroy(&c15_u);
  return c15_y;
}

static c15_SL_Bus_sliding_controller_const_ros_time_Time c15_e_emlrt_marshallIn
  (SFc15_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c15_u, const emlrtMsgIdentifier *c15_parentId)
{
  static const char_T *c15_fieldNames[2] = { "Sec", "Nsec" };

  c15_SL_Bus_sliding_controller_const_ros_time_Time c15_y;
  emlrtMsgIdentifier c15_thisId;
  c15_thisId.fParent = c15_parentId;
  c15_thisId.bParentIsCell = false;
  sf_mex_check_struct(c15_parentId, c15_u, 2, c15_fieldNames, 0U, NULL);
  c15_thisId.fIdentifier = "Sec";
  c15_y.Sec = c15_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c15_u, "Sec", "Sec", 0)), &c15_thisId);
  c15_thisId.fIdentifier = "Nsec";
  c15_y.Nsec = c15_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c15_u, "Nsec", "Nsec", 0)), &c15_thisId);
  sf_mex_destroy(&c15_u);
  return c15_y;
}

static real_T c15_f_emlrt_marshallIn
  (SFc15_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c15_u, const emlrtMsgIdentifier *c15_parentId)
{
  real_T c15_d;
  real_T c15_y;
  sf_mex_import(c15_parentId, sf_mex_dup(c15_u), &c15_d, 1, 0, 0U, 0, 0U, 0);
  c15_y = c15_d;
  sf_mex_destroy(&c15_u);
  return c15_y;
}

static void c15_g_emlrt_marshallIn(SFc15_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c15_u, const emlrtMsgIdentifier *c15_parentId,
  uint8_T c15_y[128])
{
  int32_T c15_i;
  uint8_T c15_uv[128];
  sf_mex_import(c15_parentId, sf_mex_dup(c15_u), c15_uv, 1, 3, 0U, 1, 0U, 1, 128);
  for (c15_i = 0; c15_i < 128; c15_i++) {
    c15_y[c15_i] = c15_uv[c15_i];
  }

  sf_mex_destroy(&c15_u);
}

static c15_SL_Bus_ROSVariableLengthArrayInfo c15_h_emlrt_marshallIn
  (SFc15_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c15_u, const emlrtMsgIdentifier *c15_parentId)
{
  static const char_T *c15_fieldNames[2] = { "CurrentLength", "ReceivedLength" };

  c15_SL_Bus_ROSVariableLengthArrayInfo c15_y;
  emlrtMsgIdentifier c15_thisId;
  c15_thisId.fParent = c15_parentId;
  c15_thisId.bParentIsCell = false;
  sf_mex_check_struct(c15_parentId, c15_u, 2, c15_fieldNames, 0U, NULL);
  c15_thisId.fIdentifier = "CurrentLength";
  c15_y.CurrentLength = c15_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c15_u, "CurrentLength", "CurrentLength", 0)), &c15_thisId);
  c15_thisId.fIdentifier = "ReceivedLength";
  c15_y.ReceivedLength = c15_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c15_u, "ReceivedLength", "ReceivedLength", 0)), &c15_thisId);
  sf_mex_destroy(&c15_u);
  return c15_y;
}

static void c15_i_emlrt_marshallIn(SFc15_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c15_u, const emlrtMsgIdentifier *c15_parentId,
  c15_SL_Bus_sliding_controller_const_std_msgs_String c15_y[16])
{
  static const char_T *c15_fieldNames[2] = { "Data", "Data_SL_Info" };

  emlrtMsgIdentifier c15_thisId;
  int32_T c15_i;
  uint32_T c15_uv[1];
  c15_uv[0] = 16U;
  c15_thisId.fParent = c15_parentId;
  c15_thisId.bParentIsCell = false;
  sf_mex_check_struct(c15_parentId, c15_u, 2, c15_fieldNames, 1U, c15_uv);
  for (c15_i = 0; c15_i < 16; c15_i++) {
    c15_thisId.fIdentifier = "Data";
    c15_g_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c15_u,
      "Data", "Data", c15_i)), &c15_thisId, c15_y[c15_i].Data);
    c15_thisId.fIdentifier = "Data_SL_Info";
    c15_y[c15_i].Data_SL_Info = c15_h_emlrt_marshallIn(chartInstance, sf_mex_dup
      (sf_mex_getfield(c15_u, "Data_SL_Info", "Data_SL_Info", c15_i)),
      &c15_thisId);
  }

  sf_mex_destroy(&c15_u);
}

static void c15_j_emlrt_marshallIn(SFc15_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c15_u, const emlrtMsgIdentifier *c15_parentId,
  real_T c15_y[7])
{
  real_T c15_dv[7];
  int32_T c15_i;
  sf_mex_import(c15_parentId, sf_mex_dup(c15_u), c15_dv, 1, 0, 0U, 1, 0U, 1, 7);
  for (c15_i = 0; c15_i < 7; c15_i++) {
    c15_y[c15_i] = c15_dv[c15_i];
  }

  sf_mex_destroy(&c15_u);
}

static uint8_T c15_k_emlrt_marshallIn
  (SFc15_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c15_b_is_active_c15_sliding_controller_const, const char_T *c15_identifier)
{
  emlrtMsgIdentifier c15_thisId;
  uint8_T c15_y;
  c15_thisId.fIdentifier = const_cast<const char_T *>(c15_identifier);
  c15_thisId.fParent = NULL;
  c15_thisId.bParentIsCell = false;
  c15_y = c15_l_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c15_b_is_active_c15_sliding_controller_const), &c15_thisId);
  sf_mex_destroy(&c15_b_is_active_c15_sliding_controller_const);
  return c15_y;
}

static uint8_T c15_l_emlrt_marshallIn
  (SFc15_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c15_u, const emlrtMsgIdentifier *c15_parentId)
{
  uint8_T c15_b_u;
  uint8_T c15_y;
  sf_mex_import(c15_parentId, sf_mex_dup(c15_u), &c15_b_u, 1, 3, 0U, 0, 0U, 0);
  c15_y = c15_b_u;
  sf_mex_destroy(&c15_u);
  return c15_y;
}

static void c15_eML_blk_kernel(SFc15_sliding_controller_constInstanceStruct
  *chartInstance, c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState
  *c15_b_blankMsg)
{
  static uint8_T c15_uv5[10] = { 82U, 105U, 103U, 104U, 116U, 65U, 110U, 107U,
    108U, 101U };

  static uint8_T c15_uv2[9] = { 76U, 101U, 102U, 116U, 65U, 110U, 107U, 108U,
    101U };

  static uint8_T c15_uv4[9] = { 82U, 105U, 103U, 104U, 116U, 75U, 110U, 101U,
    101U };

  static uint8_T c15_uv1[8] = { 76U, 101U, 102U, 116U, 75U, 110U, 101U, 101U };

  static uint8_T c15_uv3[8] = { 82U, 105U, 103U, 104U, 116U, 72U, 105U, 112U };

  static uint8_T c15_uv[7] = { 76U, 101U, 102U, 116U, 72U, 105U, 112U };

  static uint8_T c15_uv6[6] = { 98U, 108U, 97U, 110U, 99U, 107U };

  cudaMemcpy(chartInstance->c15_gpu_blankMsg, c15_b_blankMsg, 2536UL,
             cudaMemcpyHostToDevice);
  c15_eML_blk_kernel_kernel10<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c15_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c15_gpu_uv, c15_uv, 7UL, cudaMemcpyHostToDevice);
  c15_eML_blk_kernel_kernel11<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c15_gpu_uv, chartInstance->c15_gpu_blankMsg);
  c15_eML_blk_kernel_kernel12<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c15_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c15_gpu_uv1, c15_uv1, 8UL, cudaMemcpyHostToDevice);
  c15_eML_blk_kernel_kernel13<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c15_gpu_uv1, chartInstance->c15_gpu_blankMsg);
  c15_eML_blk_kernel_kernel14<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c15_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c15_gpu_uv2, c15_uv2, 9UL, cudaMemcpyHostToDevice);
  c15_eML_blk_kernel_kernel15<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c15_gpu_uv2, chartInstance->c15_gpu_blankMsg);
  c15_eML_blk_kernel_kernel16<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c15_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c15_gpu_uv3, c15_uv3, 8UL, cudaMemcpyHostToDevice);
  c15_eML_blk_kernel_kernel17<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c15_gpu_uv3, chartInstance->c15_gpu_blankMsg);
  c15_eML_blk_kernel_kernel18<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c15_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c15_gpu_uv4, c15_uv4, 9UL, cudaMemcpyHostToDevice);
  c15_eML_blk_kernel_kernel19<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c15_gpu_uv4, chartInstance->c15_gpu_blankMsg);
  c15_eML_blk_kernel_kernel20<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c15_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c15_gpu_uv5, c15_uv5, 10UL, cudaMemcpyHostToDevice);
  c15_eML_blk_kernel_kernel21<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c15_gpu_uv5, chartInstance->c15_gpu_blankMsg);
  c15_eML_blk_kernel_kernel22<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c15_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c15_gpu_uv6, c15_uv6, 6UL, cudaMemcpyHostToDevice);
  c15_eML_blk_kernel_kernel23<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c15_gpu_uv6, chartInstance->c15_gpu_blankMsg);
  c15_eML_blk_kernel_kernel24<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c15_gpu_blankMsg);
  cudaMemcpy(c15_b_blankMsg, chartInstance->c15_gpu_blankMsg, 2536UL,
             cudaMemcpyDeviceToHost);
}

static __global__ __launch_bounds__(128, 1) void
  c15_sf_gateway_c15_sliding_controller_const_kernel1
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg,
   c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_msg)
{
  uint64_T c15_threadId;
  int32_T c15_i;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_i = (int32_T)c15_threadId;
  if (c15_i < 128) {
    c15_b_msg->Header.FrameId[c15_i] = c15_b_blankMsg->Header.FrameId[c15_i];
  }
}

static __global__ __launch_bounds__(128, 1) void
  c15_sf_gateway_c15_sliding_controller_const_kernel2(const int32_T c15_i1,
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg,
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_msg)
{
  uint64_T c15_threadId;
  int32_T c15_i2;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_i2 = (int32_T)c15_threadId;
  if (c15_i2 < 128) {
    c15_b_msg->Name[c15_i1].Data[c15_i2] = c15_b_blankMsg->Name[c15_i1]
      .Data[c15_i2];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c15_sf_gateway_c15_sliding_controller_const_kernel3
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg,
   c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_msg)
{
  uint64_T c15_threadId;
  int32_T c15_i3;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_i3 = (int32_T)c15_threadId;
  if (c15_i3 < 7) {
    c15_b_msg->Position[c15_i3] = c15_b_blankMsg->Position[c15_i3];
    c15_b_msg->Velocity[c15_i3] = c15_b_blankMsg->Velocity[c15_i3];
    c15_b_msg->Effort[c15_i3] = c15_b_blankMsg->Effort[c15_i3];
  }
}

static __global__ __launch_bounds__(128, 1) void
  c15_sf_gateway_c15_sliding_controller_const_kernel4
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_msg,
   c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_r)
{
  uint64_T c15_threadId;
  int32_T c15_i4;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_i4 = (int32_T)c15_threadId;
  if (c15_i4 < 128) {
    c15_r->Header.FrameId[c15_i4] = c15_b_msg->Header.FrameId[c15_i4];
  }
}

static __global__ __launch_bounds__(128, 1) void
  c15_sf_gateway_c15_sliding_controller_const_kernel5(const int32_T c15_i5,
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_msg,
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_r)
{
  uint64_T c15_threadId;
  int32_T c15_i6;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_i6 = (int32_T)c15_threadId;
  if (c15_i6 < 128) {
    c15_r->Name[c15_i5].Data[c15_i6] = c15_b_msg->Name[c15_i5].Data[c15_i6];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c15_sf_gateway_c15_sliding_controller_const_kernel6
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_msg,
   c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_r)
{
  uint64_T c15_threadId;
  int32_T c15_i7;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_i7 = (int32_T)c15_threadId;
  if (c15_i7 < 7) {
    c15_r->Position[c15_i7] = c15_b_msg->Position[c15_i7];
    c15_r->Velocity[c15_i7] = c15_b_msg->Velocity[c15_i7];
    c15_r->Effort[c15_i7] = c15_b_msg->Effort[c15_i7];
  }
}

static __global__ __launch_bounds__(128, 1) void
  c15_sf_gateway_c15_sliding_controller_const_kernel7(const
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_r,
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_msg)
{
  uint64_T c15_threadId;
  int32_T c15_i8;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_i8 = (int32_T)c15_threadId;
  if (c15_i8 < 128) {
    c15_b_msg->Header.FrameId[c15_i8] = c15_r->Header.FrameId[c15_i8];
  }
}

static __global__ __launch_bounds__(128, 1) void
  c15_sf_gateway_c15_sliding_controller_const_kernel8(const
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_r, const
  int32_T c15_i9, c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState
  *c15_b_msg)
{
  uint64_T c15_threadId;
  int32_T c15_i10;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_i10 = (int32_T)c15_threadId;
  if (c15_i10 < 128) {
    c15_b_msg->Name[c15_i9].Data[c15_i10] = c15_r->Name[c15_i9].Data[c15_i10];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c15_sf_gateway_c15_sliding_controller_const_kernel9(const
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_r,
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_msg)
{
  uint64_T c15_threadId;
  int32_T c15_i11;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_i11 = (int32_T)c15_threadId;
  if (c15_i11 < 7) {
    c15_b_msg->Position[c15_i11] = c15_r->Position[c15_i11];
    c15_b_msg->Velocity[c15_i11] = c15_r->Velocity[c15_i11];
    c15_b_msg->Effort[c15_i11] = c15_r->Effort[c15_i11];
  }
}

static __global__ __launch_bounds__(32, 1) void c15_eML_blk_kernel_kernel10
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg)
{
  uint64_T c15_threadId;
  int32_T c15_tmpIdx;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_tmpIdx = (int32_T)c15_threadId;
  if (c15_tmpIdx < 1) {
    c15_b_blankMsg->Name_SL_Info.CurrentLength = 7U;
    c15_b_blankMsg->Velocity_SL_Info.CurrentLength = 7U;
    c15_b_blankMsg->Position_SL_Info.CurrentLength = 7U;
    c15_b_blankMsg->Effort_SL_Info.CurrentLength = 7U;
  }
}

static __global__ __launch_bounds__(32, 1) void c15_eML_blk_kernel_kernel11(
  const uint8_T c15_uv[7],
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg)
{
  uint64_T c15_threadId;
  int32_T c15_i;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_i = (int32_T)c15_threadId;
  if (c15_i < 7) {
    c15_b_blankMsg->Name[0].Data[c15_i] = c15_uv[c15_i];
  }
}

static __global__ __launch_bounds__(32, 1) void c15_eML_blk_kernel_kernel12
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg)
{
  uint64_T c15_threadId;
  int32_T c15_tmpIdx;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_tmpIdx = (int32_T)c15_threadId;
  if (c15_tmpIdx < 1) {
    c15_b_blankMsg->Name[0].Data_SL_Info.CurrentLength = 7U;
  }
}

static __global__ __launch_bounds__(32, 1) void c15_eML_blk_kernel_kernel13(
  const uint8_T c15_uv1[8],
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg)
{
  uint64_T c15_threadId;
  int32_T c15_i1;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_i1 = (int32_T)c15_threadId;
  if (c15_i1 < 8) {
    c15_b_blankMsg->Name[1].Data[c15_i1] = c15_uv1[c15_i1];
  }
}

static __global__ __launch_bounds__(32, 1) void c15_eML_blk_kernel_kernel14
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg)
{
  uint64_T c15_threadId;
  int32_T c15_tmpIdx;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_tmpIdx = (int32_T)c15_threadId;
  if (c15_tmpIdx < 1) {
    c15_b_blankMsg->Name[1].Data_SL_Info.CurrentLength = 8U;
  }
}

static __global__ __launch_bounds__(32, 1) void c15_eML_blk_kernel_kernel15(
  const uint8_T c15_uv2[9],
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg)
{
  uint64_T c15_threadId;
  int32_T c15_i2;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_i2 = (int32_T)c15_threadId;
  if (c15_i2 < 9) {
    c15_b_blankMsg->Name[2].Data[c15_i2] = c15_uv2[c15_i2];
  }
}

static __global__ __launch_bounds__(32, 1) void c15_eML_blk_kernel_kernel16
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg)
{
  uint64_T c15_threadId;
  int32_T c15_tmpIdx;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_tmpIdx = (int32_T)c15_threadId;
  if (c15_tmpIdx < 1) {
    c15_b_blankMsg->Name[2].Data_SL_Info.CurrentLength = 9U;
  }
}

static __global__ __launch_bounds__(32, 1) void c15_eML_blk_kernel_kernel17(
  const uint8_T c15_uv3[8],
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg)
{
  uint64_T c15_threadId;
  int32_T c15_i3;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_i3 = (int32_T)c15_threadId;
  if (c15_i3 < 8) {
    c15_b_blankMsg->Name[3].Data[c15_i3] = c15_uv3[c15_i3];
  }
}

static __global__ __launch_bounds__(32, 1) void c15_eML_blk_kernel_kernel18
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg)
{
  uint64_T c15_threadId;
  int32_T c15_tmpIdx;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_tmpIdx = (int32_T)c15_threadId;
  if (c15_tmpIdx < 1) {
    c15_b_blankMsg->Name[3].Data_SL_Info.CurrentLength = 8U;
  }
}

static __global__ __launch_bounds__(32, 1) void c15_eML_blk_kernel_kernel19(
  const uint8_T c15_uv4[9],
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg)
{
  uint64_T c15_threadId;
  int32_T c15_i4;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_i4 = (int32_T)c15_threadId;
  if (c15_i4 < 9) {
    c15_b_blankMsg->Name[4].Data[c15_i4] = c15_uv4[c15_i4];
  }
}

static __global__ __launch_bounds__(32, 1) void c15_eML_blk_kernel_kernel20
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg)
{
  uint64_T c15_threadId;
  int32_T c15_tmpIdx;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_tmpIdx = (int32_T)c15_threadId;
  if (c15_tmpIdx < 1) {
    c15_b_blankMsg->Name[4].Data_SL_Info.CurrentLength = 9U;
  }
}

static __global__ __launch_bounds__(32, 1) void c15_eML_blk_kernel_kernel21(
  const uint8_T c15_uv5[10],
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg)
{
  uint64_T c15_threadId;
  int32_T c15_i5;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_i5 = (int32_T)c15_threadId;
  if (c15_i5 < 10) {
    c15_b_blankMsg->Name[5].Data[c15_i5] = c15_uv5[c15_i5];
  }
}

static __global__ __launch_bounds__(32, 1) void c15_eML_blk_kernel_kernel22
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg)
{
  uint64_T c15_threadId;
  int32_T c15_tmpIdx;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_tmpIdx = (int32_T)c15_threadId;
  if (c15_tmpIdx < 1) {
    c15_b_blankMsg->Name[5].Data_SL_Info.CurrentLength = 10U;
  }
}

static __global__ __launch_bounds__(32, 1) void c15_eML_blk_kernel_kernel23(
  const uint8_T c15_uv6[6],
  c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg)
{
  uint64_T c15_threadId;
  int32_T c15_i6;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_i6 = (int32_T)c15_threadId;
  if (c15_i6 < 6) {
    c15_b_blankMsg->Name[6].Data[c15_i6] = c15_uv6[c15_i6];
  }
}

static __global__ __launch_bounds__(32, 1) void c15_eML_blk_kernel_kernel24
  (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c15_b_blankMsg)
{
  uint64_T c15_threadId;
  int32_T c15_tmpIdx;
  c15_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c15_tmpIdx = (int32_T)c15_threadId;
  if (c15_tmpIdx < 1) {
    c15_b_blankMsg->Name[6].Data_SL_Info.CurrentLength = 6U;
  }
}

static void init_dsm_address_info(SFc15_sliding_controller_constInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address
  (SFc15_sliding_controller_constInstanceStruct *chartInstance)
{
  chartInstance->c15_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c15_blankMsg =
    (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *)
    ssGetInputPortSignal_wrapper(chartInstance->S, 0);
  chartInstance->c15_msg =
    (c15_SL_Bus_sliding_controller_const_sensor_msgs_JointState *)
    ssGetOutputPortSignal_wrapper(chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c15_sliding_controller_const_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(2735176283U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(345749275U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(939477939U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(7884259U);
}

mxArray *sf_c15_sliding_controller_const_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c15_sliding_controller_const_jit_fallback_info(void)
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

mxArray *sf_c15_sliding_controller_const_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c15_sliding_controller_const(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WfBop8ZSb8AkJdbnA4JF2j4kG+/ggNl+i"
    "H2RxBwvxqK+yH8zOL4xOSSzLLU+GRD0/jinMyUzLz0+OT8vJKi/Jyc1CIQs7iEAe5PAEN8Hwg="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c15_sliding_controller_const_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "smwuocKm6OMBjJNMYsbyoM";
}

static void sf_opaque_initialize_c15_sliding_controller_const(void
  *chartInstanceVar)
{
  initialize_params_c15_sliding_controller_const
    ((SFc15_sliding_controller_constInstanceStruct*) chartInstanceVar);
  initialize_c15_sliding_controller_const
    ((SFc15_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c15_sliding_controller_const(void *chartInstanceVar)
{
  enable_c15_sliding_controller_const
    ((SFc15_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c15_sliding_controller_const(void
  *chartInstanceVar)
{
  disable_c15_sliding_controller_const
    ((SFc15_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c15_sliding_controller_const(void
  *chartInstanceVar)
{
  sf_gateway_c15_sliding_controller_const
    ((SFc15_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c15_sliding_controller_const
  (SimStruct* S)
{
  return get_sim_state_c15_sliding_controller_const
    ((SFc15_sliding_controller_constInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c15_sliding_controller_const(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c15_sliding_controller_const
    ((SFc15_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c15_sliding_controller_const
  (void *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc15_sliding_controller_constInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_const_optimization_info();
    }

    mdl_cleanup_runtime_resources_c15_sliding_controller_const
      ((SFc15_sliding_controller_constInstanceStruct*) chartInstanceVar);
    ((SFc15_sliding_controller_constInstanceStruct*) chartInstanceVar)->
      ~SFc15_sliding_controller_constInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c15_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_start_c15_sliding_controller_const
    ((SFc15_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c15_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_terminate_c15_sliding_controller_const
    ((SFc15_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc15_sliding_controller_const
    ((SFc15_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c15_sliding_controller_const(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c15_sliding_controller_const
      ((SFc15_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr
       (S));
    initSimStructsc15_sliding_controller_const
      ((SFc15_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr
       (S));
  }
}

const char* sf_c15_sliding_controller_const_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u00AQdkNBIAGqEOKEBAcE3IADiBO0+ROBhla45edUbdeTeMl61+xP0py4cOVdeAWeAQn",
    "xGDwCs7aTpo7tUCIqQFhynbW/mZ2Zb3623kqn6+F1Ee/1S553Bp9n8a556XU6W6/M3On7Ve9Wtv",
    "6IQsJG20SRSHuVlyARvAAtuTVMio7oyUIYEz1QIChiY6lMmTbNIsuZGLStoE6ffhUyGvqhtDyoo",
    "ywJtgQfo7bYmm3U02QKqGkDBCZU0vbDNif9qcXKjBoh0IG2UZULGoxvY2eW7lpuWMyhdQC0I7Qh",
    "aLE+tM03xEDDHJS66TzV/gQoo5gzIgq9DYn2IcYAG9iNA/y7ZQ06lYfRkChTh5AMQW+yQaJTCsj",
    "rZBo/7DNBjFSM8FbEG05w3rZtjvZ0ZQC8IiBoW10BGcSSCVPOv99GT1uC7HNowr7tl2vz4Z115L",
    "9kMAJVGrdeQw5BkT5sidJNk4C0DhK2plkyDzMsgpdEbVDkT0NQmr2YOdonyBPsoEQZDBInO3pHs",
    "SGGt1SbjTouMxeVjI1SsvUiWKKtNYQqFqba2lQ0COe6FLYj400YAk+0Nokh1bBUazFOaxbsSAyw",
    "S+/yarCCIfEZrCFFwArpGuYASd95jo3lKJJabWTUwORtbm7Of56HdYQB1SMUirqAIkwDxiwJb7m",
    "2gGnHPQLRKpOYVwROM2QRytM9K5ojqQYYk4omcuiCY7QUGOk+comVsKuxaKpgjstFOEpoCIFrMI",
    "xDF8sGsQUx0a61bWDdDZkZN0FTxeICVi1WHbahlkuocQy7YiDkSLSVjPysx6fhBcBsI0ow0a9j/",
    "1LjNu5eRIWbZ3e9w3l2/ifm2UQu/7w9o2elQI8388zve65WvW8Nf61M5u+M3IXcPqs5OYdbw7uv",
    "7I3eh9b7L18fX/q8Ed5ZZv9PtePN/4vZ+uqk0U4LZziXrw77ZMau1QL9V2b0r2VrHY2spM+iB1v",
    "d+tunz7tv9P5YdjN+Fthby9k7eX/ddXzMsiQ/Fe0E2cHErYlNx7XT/3DG3jML4nEue59e3x8vJ3",
    "95Pc9jUbxOHYnXKVe5R/L21/e/vr6cfLr/6wX238zxfTOZ63vEdQvYo/fu72nOAiz1PSqFUZJzU",
    "O6nNkfr81fz/bhy3gnL/S12/pf7/bz/zPw6aTnvhOWW9e+4c/xPw1fNAy+HX/uD/Vj2fPW78d+8",
    "452DrmXrR9N/dRoh40HBqTf7jEfYXtHXfyBPfwArwLTp",
    ""
  };

  static char newstr [1245] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c15_sliding_controller_const(SimStruct *S)
{
  const char* newstr = sf_c15_sliding_controller_const_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(611676775U));
  ssSetChecksum1(S,(2135262310U));
  ssSetChecksum2(S,(306173651U));
  ssSetChecksum3(S,(795361729U));
}

static void mdlRTW_c15_sliding_controller_const(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c15_sliding_controller_const(SimStruct *S)
{
  SFc15_sliding_controller_constInstanceStruct *chartInstance;
  chartInstance = (SFc15_sliding_controller_constInstanceStruct *)utMalloc
    (sizeof(SFc15_sliding_controller_constInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc15_sliding_controller_constInstanceStruct));
  chartInstance = new (chartInstance)
    SFc15_sliding_controller_constInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c15_sliding_controller_const;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c15_sliding_controller_const;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c15_sliding_controller_const;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c15_sliding_controller_const;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c15_sliding_controller_const;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c15_sliding_controller_const;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c15_sliding_controller_const;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c15_sliding_controller_const;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c15_sliding_controller_const;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c15_sliding_controller_const;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c15_sliding_controller_const;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c15_sliding_controller_const;
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
    chartInstance->c15_JITStateAnimation,
    chartInstance->c15_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c15_sliding_controller_const(chartInstance);
}

void c15_sliding_controller_const_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c15_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c15_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c15_sliding_controller_const(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c15_sliding_controller_const_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
