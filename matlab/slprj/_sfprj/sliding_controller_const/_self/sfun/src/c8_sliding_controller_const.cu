/* Include files */

#include "sliding_controller_const_sfun.h"
#include "c8_sliding_controller_const.h"
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
static void initialize_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance);
static void initialize_params_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance);
static void enable_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance);
static void disable_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance);
static void c8_do_animation_call_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance);
static void ext_mode_exec_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance);
static void set_sim_state_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c8_st);
static void sf_gateway_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_start_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_terminate_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance);
static void initSimStructsc8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance);
static void c8_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c8_b_msg, const char_T *c8_identifier,
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_y);
static void c8_b_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c8_u, const emlrtMsgIdentifier *c8_parentId,
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_y);
static void c8_c_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c8_u, const emlrtMsgIdentifier *c8_parentId,
  c8_SL_Bus_sliding_controller_const_std_msgs_Header *c8_y);
static uint32_T c8_d_emlrt_marshallIn
  (SFc8_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c8_u, const emlrtMsgIdentifier *c8_parentId);
static c8_SL_Bus_sliding_controller_const_ros_time_Time c8_e_emlrt_marshallIn
  (SFc8_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c8_u, const emlrtMsgIdentifier *c8_parentId);
static real_T c8_f_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c8_u, const emlrtMsgIdentifier *c8_parentId);
static void c8_g_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c8_u, const emlrtMsgIdentifier *c8_parentId,
  uint8_T c8_y[128]);
static c8_SL_Bus_ROSVariableLengthArrayInfo c8_h_emlrt_marshallIn
  (SFc8_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c8_u, const emlrtMsgIdentifier *c8_parentId);
static void c8_i_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c8_u, const emlrtMsgIdentifier *c8_parentId,
  c8_SL_Bus_sliding_controller_const_std_msgs_String c8_y[16]);
static void c8_j_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c8_u, const emlrtMsgIdentifier *c8_parentId,
  real_T c8_y[7]);
static uint8_T c8_k_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c8_b_is_active_c8_sliding_controller_const,
  const char_T *c8_identifier);
static uint8_T c8_l_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c8_u, const emlrtMsgIdentifier *c8_parentId);
static void c8_eML_blk_kernel(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState
  *c8_b_blankMsg);
static __global__ void c8_sf_gateway_c8_sliding_controller_const_kernel1
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg,
   c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_msg);
static __global__ void c8_sf_gateway_c8_sliding_controller_const_kernel2(const
  int32_T c8_i1, c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState
  *c8_b_blankMsg, c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState
  *c8_b_msg);
static __global__ void c8_sf_gateway_c8_sliding_controller_const_kernel3
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg,
   c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_msg);
static __global__ void c8_sf_gateway_c8_sliding_controller_const_kernel4
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_msg,
   c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_r);
static __global__ void c8_sf_gateway_c8_sliding_controller_const_kernel5(const
  int32_T c8_i5, c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState
  *c8_b_msg, c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_r);
static __global__ void c8_sf_gateway_c8_sliding_controller_const_kernel6
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_msg,
   c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_r);
static __global__ void c8_sf_gateway_c8_sliding_controller_const_kernel7(const
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_r,
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_msg);
static __global__ void c8_sf_gateway_c8_sliding_controller_const_kernel8(const
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_r, const int32_T
  c8_i9, c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_msg);
static __global__ void c8_sf_gateway_c8_sliding_controller_const_kernel9(const
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_r,
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_msg);
static __global__ void c8_eML_blk_kernel_kernel10
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg);
static __global__ void c8_eML_blk_kernel_kernel11(const uint8_T c8_uv[12],
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg);
static __global__ void c8_eML_blk_kernel_kernel12
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg);
static __global__ void c8_eML_blk_kernel_kernel13(const uint8_T c8_uv1[13],
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg);
static __global__ void c8_eML_blk_kernel_kernel14
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg);
static __global__ void c8_eML_blk_kernel_kernel15(const uint8_T c8_uv2[14],
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg);
static __global__ void c8_eML_blk_kernel_kernel16
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg);
static __global__ void c8_eML_blk_kernel_kernel17(const uint8_T c8_uv3[13],
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg);
static __global__ void c8_eML_blk_kernel_kernel18
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg);
static __global__ void c8_eML_blk_kernel_kernel19(const uint8_T c8_uv4[14],
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg);
static __global__ void c8_eML_blk_kernel_kernel20
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg);
static __global__ void c8_eML_blk_kernel_kernel21(const uint8_T c8_uv5[15],
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg);
static __global__ void c8_eML_blk_kernel_kernel22
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg);
static void init_dsm_address_info(SFc8_sliding_controller_constInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc8_sliding_controller_constInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c8_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c8_is_active_c8_sliding_controller_const = 0U;
  cudaGetLastError();
  cudaMalloc(&chartInstance->c8_gpu_uv5, 15UL);
  cudaMalloc(&chartInstance->c8_gpu_uv4, 14UL);
  cudaMalloc(&chartInstance->c8_gpu_uv3, 13UL);
  cudaMalloc(&chartInstance->c8_gpu_uv2, 14UL);
  cudaMalloc(&chartInstance->c8_gpu_uv1, 13UL);
  cudaMalloc(&chartInstance->c8_gpu_uv, 12UL);
  cudaMalloc(&chartInstance->c8_gpu_blankMsg, 2536UL);
}

static void initialize_params_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void enable_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c8_do_animation_call_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance)
{
  static const char_T *c8_sv[9] = { "Header", "Name", "Name_SL_Info", "Position",
    "Position_SL_Info", "Velocity", "Velocity_SL_Info", "Effort",
    "Effort_SL_Info" };

  static const char_T *c8_sv1[4] = { "Seq", "Stamp", "FrameId",
    "FrameId_SL_Info" };

  static const char_T *c8_sv2[2] = { "Sec", "Nsec" };

  static const char_T *c8_sv3[2] = { "CurrentLength", "ReceivedLength" };

  static const char_T *c8_sv4[2] = { "Data", "Data_SL_Info" };

  c8_SL_Bus_sliding_controller_const_std_msgs_String c8_g_u[16];
  const c8_SL_Bus_sliding_controller_const_std_msgs_String *c8_r;
  const mxArray *c8_ab_y = NULL;
  const mxArray *c8_b_y = NULL;
  const mxArray *c8_bb_y = NULL;
  const mxArray *c8_c_y = NULL;
  const mxArray *c8_cb_y = NULL;
  const mxArray *c8_d_y = NULL;
  const mxArray *c8_db_y = NULL;
  const mxArray *c8_e_y = NULL;
  const mxArray *c8_eb_y = NULL;
  const mxArray *c8_f_y = NULL;
  const mxArray *c8_fb_y = NULL;
  const mxArray *c8_g_y = NULL;
  const mxArray *c8_gb_y = NULL;
  const mxArray *c8_h_y = NULL;
  const mxArray *c8_i_y = NULL;
  const mxArray *c8_j_y = NULL;
  const mxArray *c8_k_y = NULL;
  const mxArray *c8_l_y = NULL;
  const mxArray *c8_m_y = NULL;
  const mxArray *c8_n_y = NULL;
  const mxArray *c8_o_y = NULL;
  const mxArray *c8_p_y = NULL;
  const mxArray *c8_q_y = NULL;
  const mxArray *c8_r_y = NULL;
  const mxArray *c8_s_y = NULL;
  const mxArray *c8_st;
  const mxArray *c8_t_y = NULL;
  const mxArray *c8_u_y = NULL;
  const mxArray *c8_v_y = NULL;
  const mxArray *c8_w_y = NULL;
  const mxArray *c8_x_y = NULL;
  const mxArray *c8_y = NULL;
  const mxArray *c8_y_y = NULL;
  real_T c8_l_u[7];
  real_T c8_b_u;
  real_T c8_c_u;
  real_T c8_u_Stamp_Nsec;
  real_T c8_u_Stamp_Sec;
  int32_T c8_iv[1];
  int32_T c8_b_i;
  int32_T c8_i;
  int32_T c8_i1;
  int32_T c8_i2;
  int32_T c8_i3;
  int32_T c8_i4;
  int32_T c8_i5;
  int32_T c8_i6;
  int32_T c8_i7;
  uint32_T c8_e_u;
  uint32_T c8_f_u;
  uint32_T c8_h_u;
  uint32_T c8_i_u;
  uint32_T c8_j_u;
  uint32_T c8_k_u;
  uint32_T c8_m_u;
  uint32_T c8_n_u;
  uint32_T c8_o_u;
  uint32_T c8_p_u;
  uint32_T c8_q_u;
  uint32_T c8_r_u;
  uint32_T c8_u;
  uint32_T c8_u_CurrentLength;
  uint32_T c8_u_FrameId_SL_Info_CurrentLength;
  uint32_T c8_u_FrameId_SL_Info_ReceivedLength;
  uint32_T c8_u_ReceivedLength;
  uint32_T c8_u_Seq;
  uint8_T c8_d_u[128];
  uint8_T c8_u_FrameId[128];
  c8_st = NULL;
  c8_y = NULL;
  sf_mex_assign(&c8_y, sf_mex_createcellmatrix(2, 1), false);
  c8_b_y = NULL;
  sf_mex_assign(&c8_b_y, sf_mex_createstruct("structure", 9, c8_sv, 2, 1, 1),
                false);
  c8_u_Seq = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_msg)[0])[0];
  c8_u_Stamp_Sec = *(real_T *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_ros_time_Time *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_msg)[0])[8])[0];
  c8_u_Stamp_Nsec = *(real_T *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_ros_time_Time *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_msg)[0])[8])[8];
  for (c8_i = 0; c8_i < 128; c8_i++) {
    c8_u_FrameId[c8_i] = ((uint8_T *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
      chartInstance->c8_msg)[0])[24])[c8_i];
  }

  c8_u_FrameId_SL_Info_CurrentLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_msg)[0])[152])[0];
  c8_u_FrameId_SL_Info_ReceivedLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_msg)[0])[152])[4];
  c8_c_y = NULL;
  sf_mex_assign(&c8_c_y, sf_mex_createstruct("structure", 4, c8_sv1, 2, 1, 1),
                false);
  c8_u = c8_u_Seq;
  c8_d_y = NULL;
  sf_mex_assign(&c8_d_y, sf_mex_create("y", &c8_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c8_c_y, 0, "Seq", c8_d_y, 0);
  c8_e_y = NULL;
  sf_mex_assign(&c8_e_y, sf_mex_createstruct("structure", 2, c8_sv2, 2, 1, 1),
                false);
  c8_b_u = c8_u_Stamp_Sec;
  c8_f_y = NULL;
  sf_mex_assign(&c8_f_y, sf_mex_create("y", &c8_b_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c8_e_y, 0, "Sec", c8_f_y, 0);
  c8_c_u = c8_u_Stamp_Nsec;
  c8_g_y = NULL;
  sf_mex_assign(&c8_g_y, sf_mex_create("y", &c8_c_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c8_e_y, 0, "Nsec", c8_g_y, 1);
  sf_mex_setfieldbynum(c8_c_y, 0, "Stamp", c8_e_y, 1);
  for (c8_i1 = 0; c8_i1 < 128; c8_i1++) {
    c8_d_u[c8_i1] = c8_u_FrameId[c8_i1];
  }

  c8_h_y = NULL;
  sf_mex_assign(&c8_h_y, sf_mex_create("y", c8_d_u, 3, 0U, 1U, 0U, 1, 128),
                false);
  sf_mex_setfieldbynum(c8_c_y, 0, "FrameId", c8_h_y, 2);
  c8_i_y = NULL;
  sf_mex_assign(&c8_i_y, sf_mex_createstruct("structure", 2, c8_sv3, 2, 1, 1),
                false);
  c8_e_u = c8_u_FrameId_SL_Info_CurrentLength;
  c8_j_y = NULL;
  sf_mex_assign(&c8_j_y, sf_mex_create("y", &c8_e_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c8_i_y, 0, "CurrentLength", c8_j_y, 0);
  c8_f_u = c8_u_FrameId_SL_Info_ReceivedLength;
  c8_k_y = NULL;
  sf_mex_assign(&c8_k_y, sf_mex_create("y", &c8_f_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c8_i_y, 0, "ReceivedLength", c8_k_y, 1);
  sf_mex_setfieldbynum(c8_c_y, 0, "FrameId_SL_Info", c8_i_y, 3);
  sf_mex_setfieldbynum(c8_b_y, 0, "Header", c8_c_y, 0);
  for (c8_i2 = 0; c8_i2 < 16; c8_i2++) {
    for (c8_i3 = 0; c8_i3 < 128; c8_i3++) {
      c8_g_u[c8_i2].Data[c8_i3] = ((uint8_T *)&((char_T *)
        (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
        (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
        chartInstance->c8_msg)[160])[136 * (int32_T)c8_i2])[0])[c8_i3];
    }

    c8_g_u[c8_i2].Data_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
      (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c8_msg)[160])[136 * (int32_T)c8_i2])[128])[0];
    c8_g_u[c8_i2].Data_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
      (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c8_msg)[160])[136 * (int32_T)c8_i2])[128])[4];
  }

  c8_l_y = NULL;
  c8_iv[0] = 16;
  sf_mex_assign(&c8_l_y, sf_mex_createstructarray("structure", 1, c8_iv, 2,
    c8_sv4), false);
  for (c8_b_i = 0; c8_b_i < 16; c8_b_i++) {
    c8_r = &c8_g_u[c8_b_i];
    for (c8_i4 = 0; c8_i4 < 128; c8_i4++) {
      c8_d_u[c8_i4] = c8_r->Data[c8_i4];
    }

    c8_n_y = NULL;
    sf_mex_assign(&c8_n_y, sf_mex_create("y", c8_d_u, 3, 0U, 1U, 0U, 1, 128),
                  false);
    sf_mex_setfieldbynum(c8_l_y, c8_b_i, "Data", c8_n_y, 0);
    c8_u_CurrentLength = c8_r->Data_SL_Info.CurrentLength;
    c8_u_ReceivedLength = c8_r->Data_SL_Info.ReceivedLength;
    c8_p_y = NULL;
    sf_mex_assign(&c8_p_y, sf_mex_createstruct("structure", 2, c8_sv3, 2, 1, 1),
                  false);
    c8_j_u = c8_u_CurrentLength;
    c8_r_y = NULL;
    sf_mex_assign(&c8_r_y, sf_mex_create("y", &c8_j_u, 7, 0U, 0U, 0U, 0), false);
    sf_mex_setfieldbynum(c8_p_y, 0, "CurrentLength", c8_r_y, 0);
    c8_k_u = c8_u_ReceivedLength;
    c8_s_y = NULL;
    sf_mex_assign(&c8_s_y, sf_mex_create("y", &c8_k_u, 7, 0U, 0U, 0U, 0), false);
    sf_mex_setfieldbynum(c8_p_y, 0, "ReceivedLength", c8_s_y, 1);
    sf_mex_setfieldbynum(c8_l_y, c8_b_i, "Data_SL_Info", c8_p_y, 1);
  }

  sf_mex_setfieldbynum(c8_b_y, 0, "Name", c8_l_y, 1);
  c8_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c8_msg)
    [2336])[0];
  c8_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c8_msg)
    [2336])[4];
  c8_m_y = NULL;
  sf_mex_assign(&c8_m_y, sf_mex_createstruct("structure", 2, c8_sv3, 2, 1, 1),
                false);
  c8_h_u = c8_u_CurrentLength;
  c8_o_y = NULL;
  sf_mex_assign(&c8_o_y, sf_mex_create("y", &c8_h_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c8_m_y, 0, "CurrentLength", c8_o_y, 0);
  c8_i_u = c8_u_ReceivedLength;
  c8_q_y = NULL;
  sf_mex_assign(&c8_q_y, sf_mex_create("y", &c8_i_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c8_m_y, 0, "ReceivedLength", c8_q_y, 1);
  sf_mex_setfieldbynum(c8_b_y, 0, "Name_SL_Info", c8_m_y, 2);
  for (c8_i5 = 0; c8_i5 < 7; c8_i5++) {
    c8_l_u[c8_i5] = ((real_T *)&((char_T *)chartInstance->c8_msg)[2344])[c8_i5];
  }

  c8_t_y = NULL;
  sf_mex_assign(&c8_t_y, sf_mex_create("y", c8_l_u, 0, 0U, 1U, 0U, 1, 7), false);
  sf_mex_setfieldbynum(c8_b_y, 0, "Position", c8_t_y, 3);
  c8_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c8_msg)
    [2400])[0];
  c8_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c8_msg)
    [2400])[4];
  c8_u_y = NULL;
  sf_mex_assign(&c8_u_y, sf_mex_createstruct("structure", 2, c8_sv3, 2, 1, 1),
                false);
  c8_m_u = c8_u_CurrentLength;
  c8_v_y = NULL;
  sf_mex_assign(&c8_v_y, sf_mex_create("y", &c8_m_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c8_u_y, 0, "CurrentLength", c8_v_y, 0);
  c8_n_u = c8_u_ReceivedLength;
  c8_w_y = NULL;
  sf_mex_assign(&c8_w_y, sf_mex_create("y", &c8_n_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c8_u_y, 0, "ReceivedLength", c8_w_y, 1);
  sf_mex_setfieldbynum(c8_b_y, 0, "Position_SL_Info", c8_u_y, 4);
  for (c8_i6 = 0; c8_i6 < 7; c8_i6++) {
    c8_l_u[c8_i6] = ((real_T *)&((char_T *)chartInstance->c8_msg)[2408])[c8_i6];
  }

  c8_x_y = NULL;
  sf_mex_assign(&c8_x_y, sf_mex_create("y", c8_l_u, 0, 0U, 1U, 0U, 1, 7), false);
  sf_mex_setfieldbynum(c8_b_y, 0, "Velocity", c8_x_y, 5);
  c8_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c8_msg)
    [2464])[0];
  c8_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c8_msg)
    [2464])[4];
  c8_y_y = NULL;
  sf_mex_assign(&c8_y_y, sf_mex_createstruct("structure", 2, c8_sv3, 2, 1, 1),
                false);
  c8_o_u = c8_u_CurrentLength;
  c8_ab_y = NULL;
  sf_mex_assign(&c8_ab_y, sf_mex_create("y", &c8_o_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c8_y_y, 0, "CurrentLength", c8_ab_y, 0);
  c8_p_u = c8_u_ReceivedLength;
  c8_bb_y = NULL;
  sf_mex_assign(&c8_bb_y, sf_mex_create("y", &c8_p_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c8_y_y, 0, "ReceivedLength", c8_bb_y, 1);
  sf_mex_setfieldbynum(c8_b_y, 0, "Velocity_SL_Info", c8_y_y, 6);
  for (c8_i7 = 0; c8_i7 < 7; c8_i7++) {
    c8_l_u[c8_i7] = ((real_T *)&((char_T *)chartInstance->c8_msg)[2472])[c8_i7];
  }

  c8_cb_y = NULL;
  sf_mex_assign(&c8_cb_y, sf_mex_create("y", c8_l_u, 0, 0U, 1U, 0U, 1, 7), false);
  sf_mex_setfieldbynum(c8_b_y, 0, "Effort", c8_cb_y, 7);
  c8_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c8_msg)
    [2528])[0];
  c8_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c8_msg)
    [2528])[4];
  c8_db_y = NULL;
  sf_mex_assign(&c8_db_y, sf_mex_createstruct("structure", 2, c8_sv3, 2, 1, 1),
                false);
  c8_q_u = c8_u_CurrentLength;
  c8_eb_y = NULL;
  sf_mex_assign(&c8_eb_y, sf_mex_create("y", &c8_q_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c8_db_y, 0, "CurrentLength", c8_eb_y, 0);
  c8_r_u = c8_u_ReceivedLength;
  c8_fb_y = NULL;
  sf_mex_assign(&c8_fb_y, sf_mex_create("y", &c8_r_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c8_db_y, 0, "ReceivedLength", c8_fb_y, 1);
  sf_mex_setfieldbynum(c8_b_y, 0, "Effort_SL_Info", c8_db_y, 8);
  sf_mex_setcell(c8_y, 0, c8_b_y);
  c8_gb_y = NULL;
  sf_mex_assign(&c8_gb_y, sf_mex_create("y",
    &chartInstance->c8_is_active_c8_sliding_controller_const, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c8_y, 1, c8_gb_y);
  sf_mex_assign(&c8_st, c8_y, false);
  return c8_st;
}

static void set_sim_state_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c8_st)
{
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState c8_r;
  const mxArray *c8_u;
  int32_T c8_i;
  int32_T c8_i1;
  int32_T c8_i2;
  int32_T c8_i3;
  c8_u = sf_mex_dup(c8_st);
  c8_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c8_u, 0)), "msg",
                      &c8_r);
  *(uint32_T *)&((char_T *)(c8_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c8_msg)[0])[0] = c8_r.Header.Seq;
  *(real_T *)&((char_T *)(c8_SL_Bus_sliding_controller_const_ros_time_Time *)
               &((char_T *)(c8_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c8_msg)[0])[8])[0] =
    c8_r.Header.Stamp.Sec;
  *(real_T *)&((char_T *)(c8_SL_Bus_sliding_controller_const_ros_time_Time *)
               &((char_T *)(c8_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c8_msg)[0])[8])[8] =
    c8_r.Header.Stamp.Nsec;
  for (c8_i = 0; c8_i < 128; c8_i++) {
    ((uint8_T *)&((char_T *)(c8_SL_Bus_sliding_controller_const_std_msgs_Header *)
                  &((char_T *)chartInstance->c8_msg)[0])[24])[c8_i] =
      c8_r.Header.FrameId[c8_i];
  }

  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_msg)[0])[152])[0] =
    c8_r.Header.FrameId_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_msg)[0])[152])[4] =
    c8_r.Header.FrameId_SL_Info.ReceivedLength;
  for (c8_i1 = 0; c8_i1 < 16; c8_i1++) {
    for (c8_i2 = 0; c8_i2 < 128; c8_i2++) {
      ((uint8_T *)&((char_T *)
                    (c8_SL_Bus_sliding_controller_const_std_msgs_String *)
                    &((char_T *)
                      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)
                      &((char_T *)chartInstance->c8_msg)[160])[136 * (int32_T)
                    c8_i1])[0])[c8_i2] = c8_r.Name[c8_i1].Data[c8_i2];
    }

    *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c8_msg)[160])[136 * (int32_T)c8_i1])[128])[0] =
      c8_r.Name[c8_i1].Data_SL_Info.CurrentLength;
    *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c8_msg)[160])[136 * (int32_T)c8_i1])[128])[4] =
      c8_r.Name[c8_i1].Data_SL_Info.ReceivedLength;
  }

  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2336])[0] = c8_r.Name_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2336])[4] = c8_r.Name_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2400])[0] = c8_r.Position_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2400])[4] = c8_r.Position_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2464])[0] = c8_r.Velocity_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2464])[4] = c8_r.Velocity_SL_Info.ReceivedLength;
  for (c8_i3 = 0; c8_i3 < 7; c8_i3++) {
    ((real_T *)&((char_T *)chartInstance->c8_msg)[2344])[c8_i3] =
      c8_r.Position[c8_i3];
    ((real_T *)&((char_T *)chartInstance->c8_msg)[2408])[c8_i3] =
      c8_r.Velocity[c8_i3];
    ((real_T *)&((char_T *)chartInstance->c8_msg)[2472])[c8_i3] =
      c8_r.Effort[c8_i3];
  }

  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2528])[0] = c8_r.Effort_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2528])[4] = c8_r.Effort_SL_Info.ReceivedLength;
  chartInstance->c8_is_active_c8_sliding_controller_const =
    c8_k_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c8_u, 1)),
    "is_active_c8_sliding_controller_const");
  sf_mex_destroy(&c8_u);
  sf_mex_destroy(&c8_st);
}

static void sf_gateway_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance)
{
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState c8_r;
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_gpu_blankMsg;
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_gpu_msg;
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_gpu_r;
  int32_T c8_i1;
  int32_T c8_i5;
  int32_T c8_i9;
  cudaMalloc(&c8_gpu_r, 2536UL);
  cudaMalloc(&c8_gpu_msg, 2536UL);
  cudaMalloc(&c8_b_gpu_blankMsg, 2536UL);
  chartInstance->c8_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  *(uint32_T *)&((char_T *)(c8_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c8_msg)[0])[0] = *(uint32_T *)
    &((char_T *)(c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
       chartInstance->c8_blankMsg)[0])[0];
  *(real_T *)&((char_T *)(c8_SL_Bus_sliding_controller_const_ros_time_Time *)
               &((char_T *)(c8_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c8_msg)[0])[8])[0] = *(real_T *)
    &((char_T *)(c8_SL_Bus_sliding_controller_const_ros_time_Time *)&((char_T *)
       (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
        chartInstance->c8_blankMsg)[0])[8])[0];
  *(real_T *)&((char_T *)(c8_SL_Bus_sliding_controller_const_ros_time_Time *)
               &((char_T *)(c8_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c8_msg)[0])[8])[8] = *(real_T *)
    &((char_T *)(c8_SL_Bus_sliding_controller_const_ros_time_Time *)&((char_T *)
       (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
        chartInstance->c8_blankMsg)[0])[8])[8];
  cudaMemcpy(c8_b_gpu_blankMsg, chartInstance->c8_blankMsg, 2536UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c8_gpu_msg, chartInstance->c8_msg, 2536UL, cudaMemcpyHostToDevice);
  c8_sf_gateway_c8_sliding_controller_const_kernel1<<<dim3(1U, 1U, 1U), dim3
    (128U, 1U, 1U)>>>(c8_b_gpu_blankMsg, c8_gpu_msg);
  cudaMemcpy(chartInstance->c8_msg, c8_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c8_blankMsg, c8_b_gpu_blankMsg, 2536UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_msg)[0])[152])[0] = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_blankMsg)[0])[152])[0];
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_msg)[0])[152])[4] = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_blankMsg)[0])[152])[4];
  for (c8_i1 = 0; c8_i1 < 16; c8_i1++) {
    cudaMemcpy(c8_b_gpu_blankMsg, chartInstance->c8_blankMsg, 2536UL,
               cudaMemcpyHostToDevice);
    cudaMemcpy(c8_gpu_msg, chartInstance->c8_msg, 2536UL, cudaMemcpyHostToDevice);
    c8_sf_gateway_c8_sliding_controller_const_kernel2<<<dim3(1U, 1U, 1U), dim3
      (128U, 1U, 1U)>>>(c8_i1, c8_b_gpu_blankMsg, c8_gpu_msg);
    cudaMemcpy(chartInstance->c8_msg, c8_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
    cudaMemcpy(chartInstance->c8_blankMsg, c8_b_gpu_blankMsg, 2536UL,
               cudaMemcpyDeviceToHost);
    *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c8_msg)[160])[136 * (int32_T)c8_i1])[128])[0] = *(uint32_T *)
      &((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
         (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
          (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
           chartInstance->c8_blankMsg)[160])[136 * (int32_T)c8_i1])[128])[0];
    *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c8_msg)[160])[136 * (int32_T)c8_i1])[128])[4] = *(uint32_T *)
      &((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
         (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
          (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
           chartInstance->c8_blankMsg)[160])[136 * (int32_T)c8_i1])[128])[4];
  }

  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2336])[0] = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_blankMsg)[2336])[0];
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2336])[4] = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_blankMsg)[2336])[4];
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2400])[0] = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_blankMsg)[2400])[0];
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2400])[4] = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_blankMsg)[2400])[4];
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2464])[0] = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_blankMsg)[2464])[0];
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2464])[4] = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_blankMsg)[2464])[4];
  cudaMemcpy(c8_b_gpu_blankMsg, chartInstance->c8_blankMsg, 2536UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c8_gpu_msg, chartInstance->c8_msg, 2536UL, cudaMemcpyHostToDevice);
  c8_sf_gateway_c8_sliding_controller_const_kernel3<<<dim3(1U, 1U, 1U), dim3(32U,
    1U, 1U)>>>(c8_b_gpu_blankMsg, c8_gpu_msg);
  cudaMemcpy(chartInstance->c8_msg, c8_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c8_blankMsg, c8_b_gpu_blankMsg, 2536UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2528])[0] = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_blankMsg)[2528])[0];
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2528])[4] = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_blankMsg)[2528])[4];
  c8_r.Header.Seq = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_msg)[0])[0];
  c8_r.Header.Stamp.Sec = *(real_T *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_ros_time_Time *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_msg)[0])[8])[0];
  c8_r.Header.Stamp.Nsec = *(real_T *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_ros_time_Time *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_msg)[0])[8])[8];
  cudaMemcpy(c8_gpu_r, &c8_r, 2536UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c8_gpu_msg, chartInstance->c8_msg, 2536UL, cudaMemcpyHostToDevice);
  c8_sf_gateway_c8_sliding_controller_const_kernel4<<<dim3(1U, 1U, 1U), dim3
    (128U, 1U, 1U)>>>(c8_gpu_msg, c8_gpu_r);
  cudaMemcpy(chartInstance->c8_msg, c8_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c8_r, c8_gpu_r, 2536UL, cudaMemcpyDeviceToHost);
  c8_r.Header.FrameId_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_msg)[0])[152])[0];
  c8_r.Header.FrameId_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_msg)[0])[152])[4];
  for (c8_i5 = 0; c8_i5 < 16; c8_i5++) {
    cudaMemcpy(c8_gpu_r, &c8_r, 2536UL, cudaMemcpyHostToDevice);
    cudaMemcpy(c8_gpu_msg, chartInstance->c8_msg, 2536UL, cudaMemcpyHostToDevice);
    c8_sf_gateway_c8_sliding_controller_const_kernel5<<<dim3(1U, 1U, 1U), dim3
      (128U, 1U, 1U)>>>(c8_i5, c8_gpu_msg, c8_gpu_r);
    cudaMemcpy(chartInstance->c8_msg, c8_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
    cudaMemcpy(&c8_r, c8_gpu_r, 2536UL, cudaMemcpyDeviceToHost);
    c8_r.Name[c8_i5].Data_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
      (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c8_msg)[160])[136 * (int32_T)c8_i5])[128])[0];
    c8_r.Name[c8_i5].Data_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
      (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c8_msg)[160])[136 * (int32_T)c8_i5])[128])[4];
  }

  c8_r.Name_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c8_msg)
    [2336])[0];
  c8_r.Name_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c8_msg)
    [2336])[4];
  c8_r.Position_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c8_msg)
    [2400])[0];
  c8_r.Position_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c8_msg)
    [2400])[4];
  c8_r.Velocity_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c8_msg)
    [2464])[0];
  c8_r.Velocity_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c8_msg)
    [2464])[4];
  cudaMemcpy(c8_gpu_r, &c8_r, 2536UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c8_gpu_msg, chartInstance->c8_msg, 2536UL, cudaMemcpyHostToDevice);
  c8_sf_gateway_c8_sliding_controller_const_kernel6<<<dim3(1U, 1U, 1U), dim3(32U,
    1U, 1U)>>>(c8_gpu_msg, c8_gpu_r);
  cudaMemcpy(chartInstance->c8_msg, c8_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c8_r, c8_gpu_r, 2536UL, cudaMemcpyDeviceToHost);
  c8_r.Effort_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c8_msg)
    [2528])[0];
  c8_r.Effort_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c8_msg)
    [2528])[4];
  c8_eML_blk_kernel(chartInstance, &c8_r);
  *(uint32_T *)&((char_T *)(c8_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c8_msg)[0])[0] = c8_r.Header.Seq;
  *(real_T *)&((char_T *)(c8_SL_Bus_sliding_controller_const_ros_time_Time *)
               &((char_T *)(c8_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c8_msg)[0])[8])[0] =
    c8_r.Header.Stamp.Sec;
  *(real_T *)&((char_T *)(c8_SL_Bus_sliding_controller_const_ros_time_Time *)
               &((char_T *)(c8_SL_Bus_sliding_controller_const_std_msgs_Header *)
                 &((char_T *)chartInstance->c8_msg)[0])[8])[8] =
    c8_r.Header.Stamp.Nsec;
  cudaMemcpy(c8_gpu_r, &c8_r, 2536UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c8_gpu_msg, chartInstance->c8_msg, 2536UL, cudaMemcpyHostToDevice);
  c8_sf_gateway_c8_sliding_controller_const_kernel7<<<dim3(1U, 1U, 1U), dim3
    (128U, 1U, 1U)>>>(c8_gpu_r, c8_gpu_msg);
  cudaMemcpy(chartInstance->c8_msg, c8_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_msg)[0])[152])[0] =
    c8_r.Header.FrameId_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c8_SL_Bus_sliding_controller_const_std_msgs_Header *)&((char_T *)
    chartInstance->c8_msg)[0])[152])[4] =
    c8_r.Header.FrameId_SL_Info.ReceivedLength;
  for (c8_i9 = 0; c8_i9 < 16; c8_i9++) {
    cudaMemcpy(c8_gpu_msg, chartInstance->c8_msg, 2536UL, cudaMemcpyHostToDevice);
    c8_sf_gateway_c8_sliding_controller_const_kernel8<<<dim3(1U, 1U, 1U), dim3
      (128U, 1U, 1U)>>>(c8_gpu_r, c8_i9, c8_gpu_msg);
    cudaMemcpy(chartInstance->c8_msg, c8_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
    *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c8_msg)[160])[136 * (int32_T)c8_i9])[128])[0] =
      c8_r.Name[c8_i9].Data_SL_Info.CurrentLength;
    *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      (c8_SL_Bus_sliding_controller_const_std_msgs_String *)&((char_T *)
      chartInstance->c8_msg)[160])[136 * (int32_T)c8_i9])[128])[4] =
      c8_r.Name[c8_i9].Data_SL_Info.ReceivedLength;
  }

  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2336])[0] = c8_r.Name_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2336])[4] = c8_r.Name_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2400])[0] = c8_r.Position_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2400])[4] = c8_r.Position_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2464])[0] = c8_r.Velocity_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2464])[4] = c8_r.Velocity_SL_Info.ReceivedLength;
  cudaMemcpy(c8_gpu_msg, chartInstance->c8_msg, 2536UL, cudaMemcpyHostToDevice);
  c8_sf_gateway_c8_sliding_controller_const_kernel9<<<dim3(1U, 1U, 1U), dim3(32U,
    1U, 1U)>>>(c8_gpu_r, c8_gpu_msg);
  cudaMemcpy(chartInstance->c8_msg, c8_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2528])[0] = c8_r.Effort_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c8_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c8_msg)[2528])[4] = c8_r.Effort_SL_Info.ReceivedLength;
  c8_do_animation_call_c8_sliding_controller_const(chartInstance);
  cudaFree(c8_b_gpu_blankMsg);
  cudaFree(c8_gpu_msg);
  cudaFree(c8_gpu_r);
}

static void mdl_start_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance)
{
  cudaError_t c8_errCode;
  cudaFree(*chartInstance->c8_gpu_uv5);
  cudaFree(*chartInstance->c8_gpu_uv4);
  cudaFree(*chartInstance->c8_gpu_uv3);
  cudaFree(*chartInstance->c8_gpu_uv2);
  cudaFree(*chartInstance->c8_gpu_uv1);
  cudaFree(*chartInstance->c8_gpu_uv);
  cudaFree(chartInstance->c8_gpu_blankMsg);
  c8_errCode = cudaGetLastError();
  if (c8_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c8_errCode, (char_T *)cudaGetErrorName
                       (c8_errCode), (char_T *)cudaGetErrorString(c8_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c8_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void initSimStructsc8_sliding_controller_const
  (SFc8_sliding_controller_constInstanceStruct *chartInstance)
{
}

const mxArray *sf_c8_sliding_controller_const_get_eml_resolved_functions_info()
{
  const mxArray *c8_nameCaptureInfo = NULL;
  c8_nameCaptureInfo = NULL;
  sf_mex_assign(&c8_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c8_nameCaptureInfo;
}

static void c8_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c8_b_msg, const char_T *c8_identifier,
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_y)
{
  emlrtMsgIdentifier c8_thisId;
  c8_thisId.fIdentifier = const_cast<const char_T *>(c8_identifier);
  c8_thisId.fParent = NULL;
  c8_thisId.bParentIsCell = false;
  c8_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c8_b_msg), &c8_thisId, c8_y);
  sf_mex_destroy(&c8_b_msg);
}

static void c8_b_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c8_u, const emlrtMsgIdentifier *c8_parentId,
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_y)
{
  static const char_T *c8_fieldNames[9] = { "Header", "Name", "Name_SL_Info",
    "Position", "Position_SL_Info", "Velocity", "Velocity_SL_Info", "Effort",
    "Effort_SL_Info" };

  emlrtMsgIdentifier c8_thisId;
  c8_thisId.fParent = c8_parentId;
  c8_thisId.bParentIsCell = false;
  sf_mex_check_struct(c8_parentId, c8_u, 9, c8_fieldNames, 0U, NULL);
  c8_thisId.fIdentifier = "Header";
  c8_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c8_u, "Header",
    "Header", 0)), &c8_thisId, &c8_y->Header);
  c8_thisId.fIdentifier = "Name";
  c8_i_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c8_u, "Name",
    "Name", 0)), &c8_thisId, c8_y->Name);
  c8_thisId.fIdentifier = "Name_SL_Info";
  c8_y->Name_SL_Info = c8_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c8_u, "Name_SL_Info", "Name_SL_Info", 0)), &c8_thisId);
  c8_thisId.fIdentifier = "Position";
  c8_j_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c8_u,
    "Position", "Position", 0)), &c8_thisId, c8_y->Position);
  c8_thisId.fIdentifier = "Position_SL_Info";
  c8_y->Position_SL_Info = c8_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c8_u, "Position_SL_Info", "Position_SL_Info", 0)),
    &c8_thisId);
  c8_thisId.fIdentifier = "Velocity";
  c8_j_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c8_u,
    "Velocity", "Velocity", 0)), &c8_thisId, c8_y->Velocity);
  c8_thisId.fIdentifier = "Velocity_SL_Info";
  c8_y->Velocity_SL_Info = c8_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c8_u, "Velocity_SL_Info", "Velocity_SL_Info", 0)),
    &c8_thisId);
  c8_thisId.fIdentifier = "Effort";
  c8_j_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c8_u, "Effort",
    "Effort", 0)), &c8_thisId, c8_y->Effort);
  c8_thisId.fIdentifier = "Effort_SL_Info";
  c8_y->Effort_SL_Info = c8_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c8_u, "Effort_SL_Info", "Effort_SL_Info", 0)), &c8_thisId);
  sf_mex_destroy(&c8_u);
}

static void c8_c_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c8_u, const emlrtMsgIdentifier *c8_parentId,
  c8_SL_Bus_sliding_controller_const_std_msgs_Header *c8_y)
{
  static const char_T *c8_fieldNames[4] = { "Seq", "Stamp", "FrameId",
    "FrameId_SL_Info" };

  emlrtMsgIdentifier c8_thisId;
  c8_thisId.fParent = c8_parentId;
  c8_thisId.bParentIsCell = false;
  sf_mex_check_struct(c8_parentId, c8_u, 4, c8_fieldNames, 0U, NULL);
  c8_thisId.fIdentifier = "Seq";
  c8_y->Seq = c8_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c8_u, "Seq", "Seq", 0)), &c8_thisId);
  c8_thisId.fIdentifier = "Stamp";
  c8_y->Stamp = c8_e_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c8_u, "Stamp", "Stamp", 0)), &c8_thisId);
  c8_thisId.fIdentifier = "FrameId";
  c8_g_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c8_u,
    "FrameId", "FrameId", 0)), &c8_thisId, c8_y->FrameId);
  c8_thisId.fIdentifier = "FrameId_SL_Info";
  c8_y->FrameId_SL_Info = c8_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c8_u, "FrameId_SL_Info", "FrameId_SL_Info", 0)), &c8_thisId);
  sf_mex_destroy(&c8_u);
}

static uint32_T c8_d_emlrt_marshallIn
  (SFc8_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c8_u, const emlrtMsgIdentifier *c8_parentId)
{
  uint32_T c8_b_u;
  uint32_T c8_y;
  sf_mex_import(c8_parentId, sf_mex_dup(c8_u), &c8_b_u, 1, 7, 0U, 0, 0U, 0);
  c8_y = c8_b_u;
  sf_mex_destroy(&c8_u);
  return c8_y;
}

static c8_SL_Bus_sliding_controller_const_ros_time_Time c8_e_emlrt_marshallIn
  (SFc8_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c8_u, const emlrtMsgIdentifier *c8_parentId)
{
  static const char_T *c8_fieldNames[2] = { "Sec", "Nsec" };

  c8_SL_Bus_sliding_controller_const_ros_time_Time c8_y;
  emlrtMsgIdentifier c8_thisId;
  c8_thisId.fParent = c8_parentId;
  c8_thisId.bParentIsCell = false;
  sf_mex_check_struct(c8_parentId, c8_u, 2, c8_fieldNames, 0U, NULL);
  c8_thisId.fIdentifier = "Sec";
  c8_y.Sec = c8_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c8_u, "Sec", "Sec", 0)), &c8_thisId);
  c8_thisId.fIdentifier = "Nsec";
  c8_y.Nsec = c8_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c8_u, "Nsec", "Nsec", 0)), &c8_thisId);
  sf_mex_destroy(&c8_u);
  return c8_y;
}

static real_T c8_f_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c8_u, const emlrtMsgIdentifier *c8_parentId)
{
  real_T c8_d;
  real_T c8_y;
  sf_mex_import(c8_parentId, sf_mex_dup(c8_u), &c8_d, 1, 0, 0U, 0, 0U, 0);
  c8_y = c8_d;
  sf_mex_destroy(&c8_u);
  return c8_y;
}

static void c8_g_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c8_u, const emlrtMsgIdentifier *c8_parentId,
  uint8_T c8_y[128])
{
  int32_T c8_i;
  uint8_T c8_uv[128];
  sf_mex_import(c8_parentId, sf_mex_dup(c8_u), c8_uv, 1, 3, 0U, 1, 0U, 1, 128);
  for (c8_i = 0; c8_i < 128; c8_i++) {
    c8_y[c8_i] = c8_uv[c8_i];
  }

  sf_mex_destroy(&c8_u);
}

static c8_SL_Bus_ROSVariableLengthArrayInfo c8_h_emlrt_marshallIn
  (SFc8_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c8_u, const emlrtMsgIdentifier *c8_parentId)
{
  static const char_T *c8_fieldNames[2] = { "CurrentLength", "ReceivedLength" };

  c8_SL_Bus_ROSVariableLengthArrayInfo c8_y;
  emlrtMsgIdentifier c8_thisId;
  c8_thisId.fParent = c8_parentId;
  c8_thisId.bParentIsCell = false;
  sf_mex_check_struct(c8_parentId, c8_u, 2, c8_fieldNames, 0U, NULL);
  c8_thisId.fIdentifier = "CurrentLength";
  c8_y.CurrentLength = c8_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c8_u, "CurrentLength", "CurrentLength", 0)), &c8_thisId);
  c8_thisId.fIdentifier = "ReceivedLength";
  c8_y.ReceivedLength = c8_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c8_u, "ReceivedLength", "ReceivedLength", 0)), &c8_thisId);
  sf_mex_destroy(&c8_u);
  return c8_y;
}

static void c8_i_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c8_u, const emlrtMsgIdentifier *c8_parentId,
  c8_SL_Bus_sliding_controller_const_std_msgs_String c8_y[16])
{
  static const char_T *c8_fieldNames[2] = { "Data", "Data_SL_Info" };

  emlrtMsgIdentifier c8_thisId;
  int32_T c8_i;
  uint32_T c8_uv[1];
  c8_uv[0] = 16U;
  c8_thisId.fParent = c8_parentId;
  c8_thisId.bParentIsCell = false;
  sf_mex_check_struct(c8_parentId, c8_u, 2, c8_fieldNames, 1U, c8_uv);
  for (c8_i = 0; c8_i < 16; c8_i++) {
    c8_thisId.fIdentifier = "Data";
    c8_g_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c8_u, "Data",
      "Data", c8_i)), &c8_thisId, c8_y[c8_i].Data);
    c8_thisId.fIdentifier = "Data_SL_Info";
    c8_y[c8_i].Data_SL_Info = c8_h_emlrt_marshallIn(chartInstance, sf_mex_dup
      (sf_mex_getfield(c8_u, "Data_SL_Info", "Data_SL_Info", c8_i)), &c8_thisId);
  }

  sf_mex_destroy(&c8_u);
}

static void c8_j_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c8_u, const emlrtMsgIdentifier *c8_parentId,
  real_T c8_y[7])
{
  real_T c8_dv[7];
  int32_T c8_i;
  sf_mex_import(c8_parentId, sf_mex_dup(c8_u), c8_dv, 1, 0, 0U, 1, 0U, 1, 7);
  for (c8_i = 0; c8_i < 7; c8_i++) {
    c8_y[c8_i] = c8_dv[c8_i];
  }

  sf_mex_destroy(&c8_u);
}

static uint8_T c8_k_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c8_b_is_active_c8_sliding_controller_const,
  const char_T *c8_identifier)
{
  emlrtMsgIdentifier c8_thisId;
  uint8_T c8_y;
  c8_thisId.fIdentifier = const_cast<const char_T *>(c8_identifier);
  c8_thisId.fParent = NULL;
  c8_thisId.bParentIsCell = false;
  c8_y = c8_l_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c8_b_is_active_c8_sliding_controller_const), &c8_thisId);
  sf_mex_destroy(&c8_b_is_active_c8_sliding_controller_const);
  return c8_y;
}

static uint8_T c8_l_emlrt_marshallIn(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c8_u, const emlrtMsgIdentifier *c8_parentId)
{
  uint8_T c8_b_u;
  uint8_T c8_y;
  sf_mex_import(c8_parentId, sf_mex_dup(c8_u), &c8_b_u, 1, 3, 0U, 0, 0U, 0);
  c8_y = c8_b_u;
  sf_mex_destroy(&c8_u);
  return c8_y;
}

static void c8_eML_blk_kernel(SFc8_sliding_controller_constInstanceStruct
  *chartInstance, c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState
  *c8_b_blankMsg)
{
  static uint8_T c8_uv5[15] = { 82U, 105U, 103U, 104U, 116U, 72U, 117U, 109U,
    97U, 110U, 65U, 110U, 107U, 108U, 101U };

  static uint8_T c8_uv2[14] = { 76U, 101U, 102U, 116U, 72U, 117U, 109U, 97U,
    110U, 65U, 110U, 107U, 108U, 101U };

  static uint8_T c8_uv4[14] = { 82U, 105U, 103U, 104U, 116U, 72U, 117U, 109U,
    97U, 110U, 75U, 110U, 101U, 101U };

  static uint8_T c8_uv1[13] = { 76U, 101U, 102U, 116U, 72U, 117U, 109U, 97U,
    110U, 75U, 110U, 101U, 101U };

  static uint8_T c8_uv3[13] = { 82U, 105U, 103U, 104U, 116U, 72U, 117U, 109U,
    97U, 110U, 72U, 105U, 112U };

  static uint8_T c8_uv[12] = { 76U, 101U, 102U, 116U, 72U, 117U, 109U, 97U, 110U,
    72U, 105U, 112U };

  cudaMemcpy(chartInstance->c8_gpu_blankMsg, c8_b_blankMsg, 2536UL,
             cudaMemcpyHostToDevice);
  c8_eML_blk_kernel_kernel10<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c8_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c8_gpu_uv, c8_uv, 12UL, cudaMemcpyHostToDevice);
  c8_eML_blk_kernel_kernel11<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c8_gpu_uv, chartInstance->c8_gpu_blankMsg);
  c8_eML_blk_kernel_kernel12<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c8_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c8_gpu_uv1, c8_uv1, 13UL, cudaMemcpyHostToDevice);
  c8_eML_blk_kernel_kernel13<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c8_gpu_uv1, chartInstance->c8_gpu_blankMsg);
  c8_eML_blk_kernel_kernel14<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c8_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c8_gpu_uv2, c8_uv2, 14UL, cudaMemcpyHostToDevice);
  c8_eML_blk_kernel_kernel15<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c8_gpu_uv2, chartInstance->c8_gpu_blankMsg);
  c8_eML_blk_kernel_kernel16<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c8_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c8_gpu_uv3, c8_uv3, 13UL, cudaMemcpyHostToDevice);
  c8_eML_blk_kernel_kernel17<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c8_gpu_uv3, chartInstance->c8_gpu_blankMsg);
  c8_eML_blk_kernel_kernel18<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c8_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c8_gpu_uv4, c8_uv4, 14UL, cudaMemcpyHostToDevice);
  c8_eML_blk_kernel_kernel19<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c8_gpu_uv4, chartInstance->c8_gpu_blankMsg);
  c8_eML_blk_kernel_kernel20<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c8_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c8_gpu_uv5, c8_uv5, 15UL, cudaMemcpyHostToDevice);
  c8_eML_blk_kernel_kernel21<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c8_gpu_uv5, chartInstance->c8_gpu_blankMsg);
  c8_eML_blk_kernel_kernel22<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c8_gpu_blankMsg);
  cudaMemcpy(c8_b_blankMsg, chartInstance->c8_gpu_blankMsg, 2536UL,
             cudaMemcpyDeviceToHost);
}

static __global__ __launch_bounds__(128, 1) void
  c8_sf_gateway_c8_sliding_controller_const_kernel1
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg,
   c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_msg)
{
  uint64_T c8_threadId;
  int32_T c8_i;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_i = (int32_T)c8_threadId;
  if (c8_i < 128) {
    c8_b_msg->Header.FrameId[c8_i] = c8_b_blankMsg->Header.FrameId[c8_i];
  }
}

static __global__ __launch_bounds__(128, 1) void
  c8_sf_gateway_c8_sliding_controller_const_kernel2(const int32_T c8_i1,
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg,
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_msg)
{
  uint64_T c8_threadId;
  int32_T c8_i2;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_i2 = (int32_T)c8_threadId;
  if (c8_i2 < 128) {
    c8_b_msg->Name[c8_i1].Data[c8_i2] = c8_b_blankMsg->Name[c8_i1].Data[c8_i2];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c8_sf_gateway_c8_sliding_controller_const_kernel3
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg,
   c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_msg)
{
  uint64_T c8_threadId;
  int32_T c8_i3;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_i3 = (int32_T)c8_threadId;
  if (c8_i3 < 7) {
    c8_b_msg->Position[c8_i3] = c8_b_blankMsg->Position[c8_i3];
    c8_b_msg->Velocity[c8_i3] = c8_b_blankMsg->Velocity[c8_i3];
    c8_b_msg->Effort[c8_i3] = c8_b_blankMsg->Effort[c8_i3];
  }
}

static __global__ __launch_bounds__(128, 1) void
  c8_sf_gateway_c8_sliding_controller_const_kernel4
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_msg,
   c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_r)
{
  uint64_T c8_threadId;
  int32_T c8_i4;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_i4 = (int32_T)c8_threadId;
  if (c8_i4 < 128) {
    c8_r->Header.FrameId[c8_i4] = c8_b_msg->Header.FrameId[c8_i4];
  }
}

static __global__ __launch_bounds__(128, 1) void
  c8_sf_gateway_c8_sliding_controller_const_kernel5(const int32_T c8_i5,
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_msg,
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_r)
{
  uint64_T c8_threadId;
  int32_T c8_i6;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_i6 = (int32_T)c8_threadId;
  if (c8_i6 < 128) {
    c8_r->Name[c8_i5].Data[c8_i6] = c8_b_msg->Name[c8_i5].Data[c8_i6];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c8_sf_gateway_c8_sliding_controller_const_kernel6
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_msg,
   c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_r)
{
  uint64_T c8_threadId;
  int32_T c8_i7;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_i7 = (int32_T)c8_threadId;
  if (c8_i7 < 7) {
    c8_r->Position[c8_i7] = c8_b_msg->Position[c8_i7];
    c8_r->Velocity[c8_i7] = c8_b_msg->Velocity[c8_i7];
    c8_r->Effort[c8_i7] = c8_b_msg->Effort[c8_i7];
  }
}

static __global__ __launch_bounds__(128, 1) void
  c8_sf_gateway_c8_sliding_controller_const_kernel7(const
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_r,
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_msg)
{
  uint64_T c8_threadId;
  int32_T c8_i8;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_i8 = (int32_T)c8_threadId;
  if (c8_i8 < 128) {
    c8_b_msg->Header.FrameId[c8_i8] = c8_r->Header.FrameId[c8_i8];
  }
}

static __global__ __launch_bounds__(128, 1) void
  c8_sf_gateway_c8_sliding_controller_const_kernel8(const
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_r, const int32_T
  c8_i9, c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_msg)
{
  uint64_T c8_threadId;
  int32_T c8_i10;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_i10 = (int32_T)c8_threadId;
  if (c8_i10 < 128) {
    c8_b_msg->Name[c8_i9].Data[c8_i10] = c8_r->Name[c8_i9].Data[c8_i10];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c8_sf_gateway_c8_sliding_controller_const_kernel9(const
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_r,
  c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_msg)
{
  uint64_T c8_threadId;
  int32_T c8_i11;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_i11 = (int32_T)c8_threadId;
  if (c8_i11 < 7) {
    c8_b_msg->Position[c8_i11] = c8_r->Position[c8_i11];
    c8_b_msg->Velocity[c8_i11] = c8_r->Velocity[c8_i11];
    c8_b_msg->Effort[c8_i11] = c8_r->Effort[c8_i11];
  }
}

static __global__ __launch_bounds__(32, 1) void c8_eML_blk_kernel_kernel10
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg)
{
  uint64_T c8_threadId;
  int32_T c8_tmpIdx;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_tmpIdx = (int32_T)c8_threadId;
  if (c8_tmpIdx < 1) {
    c8_b_blankMsg->Name_SL_Info.CurrentLength = 6U;
    c8_b_blankMsg->Effort_SL_Info.CurrentLength = 6U;
  }
}

static __global__ __launch_bounds__(32, 1) void c8_eML_blk_kernel_kernel11(const
  uint8_T c8_uv[12], c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState
  *c8_b_blankMsg)
{
  uint64_T c8_threadId;
  int32_T c8_i;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_i = (int32_T)c8_threadId;
  if (c8_i < 12) {
    c8_b_blankMsg->Name[0].Data[c8_i] = c8_uv[c8_i];
  }
}

static __global__ __launch_bounds__(32, 1) void c8_eML_blk_kernel_kernel12
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg)
{
  uint64_T c8_threadId;
  int32_T c8_tmpIdx;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_tmpIdx = (int32_T)c8_threadId;
  if (c8_tmpIdx < 1) {
    c8_b_blankMsg->Name[0].Data_SL_Info.CurrentLength = 12U;
  }
}

static __global__ __launch_bounds__(32, 1) void c8_eML_blk_kernel_kernel13(const
  uint8_T c8_uv1[13], c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *
  c8_b_blankMsg)
{
  uint64_T c8_threadId;
  int32_T c8_i1;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_i1 = (int32_T)c8_threadId;
  if (c8_i1 < 13) {
    c8_b_blankMsg->Name[1].Data[c8_i1] = c8_uv1[c8_i1];
  }
}

static __global__ __launch_bounds__(32, 1) void c8_eML_blk_kernel_kernel14
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg)
{
  uint64_T c8_threadId;
  int32_T c8_tmpIdx;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_tmpIdx = (int32_T)c8_threadId;
  if (c8_tmpIdx < 1) {
    c8_b_blankMsg->Name[1].Data_SL_Info.CurrentLength = 13U;
  }
}

static __global__ __launch_bounds__(32, 1) void c8_eML_blk_kernel_kernel15(const
  uint8_T c8_uv2[14], c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *
  c8_b_blankMsg)
{
  uint64_T c8_threadId;
  int32_T c8_i2;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_i2 = (int32_T)c8_threadId;
  if (c8_i2 < 14) {
    c8_b_blankMsg->Name[2].Data[c8_i2] = c8_uv2[c8_i2];
  }
}

static __global__ __launch_bounds__(32, 1) void c8_eML_blk_kernel_kernel16
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg)
{
  uint64_T c8_threadId;
  int32_T c8_tmpIdx;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_tmpIdx = (int32_T)c8_threadId;
  if (c8_tmpIdx < 1) {
    c8_b_blankMsg->Name[2].Data_SL_Info.CurrentLength = 14U;
  }
}

static __global__ __launch_bounds__(32, 1) void c8_eML_blk_kernel_kernel17(const
  uint8_T c8_uv3[13], c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *
  c8_b_blankMsg)
{
  uint64_T c8_threadId;
  int32_T c8_i3;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_i3 = (int32_T)c8_threadId;
  if (c8_i3 < 13) {
    c8_b_blankMsg->Name[3].Data[c8_i3] = c8_uv3[c8_i3];
  }
}

static __global__ __launch_bounds__(32, 1) void c8_eML_blk_kernel_kernel18
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg)
{
  uint64_T c8_threadId;
  int32_T c8_tmpIdx;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_tmpIdx = (int32_T)c8_threadId;
  if (c8_tmpIdx < 1) {
    c8_b_blankMsg->Name[3].Data_SL_Info.CurrentLength = 13U;
  }
}

static __global__ __launch_bounds__(32, 1) void c8_eML_blk_kernel_kernel19(const
  uint8_T c8_uv4[14], c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *
  c8_b_blankMsg)
{
  uint64_T c8_threadId;
  int32_T c8_i4;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_i4 = (int32_T)c8_threadId;
  if (c8_i4 < 14) {
    c8_b_blankMsg->Name[4].Data[c8_i4] = c8_uv4[c8_i4];
  }
}

static __global__ __launch_bounds__(32, 1) void c8_eML_blk_kernel_kernel20
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg)
{
  uint64_T c8_threadId;
  int32_T c8_tmpIdx;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_tmpIdx = (int32_T)c8_threadId;
  if (c8_tmpIdx < 1) {
    c8_b_blankMsg->Name[4].Data_SL_Info.CurrentLength = 14U;
  }
}

static __global__ __launch_bounds__(32, 1) void c8_eML_blk_kernel_kernel21(const
  uint8_T c8_uv5[15], c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *
  c8_b_blankMsg)
{
  uint64_T c8_threadId;
  int32_T c8_i5;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_i5 = (int32_T)c8_threadId;
  if (c8_i5 < 15) {
    c8_b_blankMsg->Name[5].Data[c8_i5] = c8_uv5[c8_i5];
  }
}

static __global__ __launch_bounds__(32, 1) void c8_eML_blk_kernel_kernel22
  (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *c8_b_blankMsg)
{
  uint64_T c8_threadId;
  int32_T c8_tmpIdx;
  c8_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c8_tmpIdx = (int32_T)c8_threadId;
  if (c8_tmpIdx < 1) {
    c8_b_blankMsg->Name[5].Data_SL_Info.CurrentLength = 15U;
  }
}

static void init_dsm_address_info(SFc8_sliding_controller_constInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc8_sliding_controller_constInstanceStruct
  *chartInstance)
{
  chartInstance->c8_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c8_blankMsg =
    (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *)
    ssGetInputPortSignal_wrapper(chartInstance->S, 0);
  chartInstance->c8_msg =
    (c8_SL_Bus_sliding_controller_const_sensor_msgs_JointState *)
    ssGetOutputPortSignal_wrapper(chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c8_sliding_controller_const_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(3784877350U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(3397629398U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2349802474U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(426083053U);
}

mxArray *sf_c8_sliding_controller_const_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c8_sliding_controller_const_jit_fallback_info(void)
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

mxArray *sf_c8_sliding_controller_const_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c8_sliding_controller_const(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WfBop8ZSb8AkJdbnA4JF2j4kG+/ggNl+i"
    "H2RxBwvyqK+yH8zOL4xOSSzLLU+GSL+OKczJTMvPT45Py8kqL8nJzUIhCzuAQW/0AAAEcFHtg="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c8_sliding_controller_const_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sOiu2rNucHOolxgc4QjETf";
}

static void sf_opaque_initialize_c8_sliding_controller_const(void
  *chartInstanceVar)
{
  initialize_params_c8_sliding_controller_const
    ((SFc8_sliding_controller_constInstanceStruct*) chartInstanceVar);
  initialize_c8_sliding_controller_const
    ((SFc8_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c8_sliding_controller_const(void *chartInstanceVar)
{
  enable_c8_sliding_controller_const
    ((SFc8_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c8_sliding_controller_const(void *chartInstanceVar)
{
  disable_c8_sliding_controller_const
    ((SFc8_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c8_sliding_controller_const(void *chartInstanceVar)
{
  sf_gateway_c8_sliding_controller_const
    ((SFc8_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c8_sliding_controller_const
  (SimStruct* S)
{
  return get_sim_state_c8_sliding_controller_const
    ((SFc8_sliding_controller_constInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c8_sliding_controller_const(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c8_sliding_controller_const
    ((SFc8_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c8_sliding_controller_const(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc8_sliding_controller_constInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_const_optimization_info();
    }

    mdl_cleanup_runtime_resources_c8_sliding_controller_const
      ((SFc8_sliding_controller_constInstanceStruct*) chartInstanceVar);
    ((SFc8_sliding_controller_constInstanceStruct*) chartInstanceVar)->
      ~SFc8_sliding_controller_constInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c8_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_start_c8_sliding_controller_const
    ((SFc8_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c8_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_terminate_c8_sliding_controller_const
    ((SFc8_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc8_sliding_controller_const
    ((SFc8_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c8_sliding_controller_const(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c8_sliding_controller_const
      ((SFc8_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc8_sliding_controller_const
      ((SFc8_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c8_sliding_controller_const_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV0tv00AQdkNBlJcqhDgh0UsFJ4QQh56gbR4iUksKToFbtV1P4iXrXbOPtL1w5cQ/4cB/4cK",
    "Rn8CFAzdmbSdNHduhRFSAsOTYa38zOzPfPBxvob3t4XENz/XrnncBrxfxrHnpcT5bL0yc6fNF70",
    "62fo9CwkY7RJFIe5WHIBE8By25NUyKtujJQhgTPVAgKGJjqUyZNs0iy5kYtKygTp9+GTIa+qG0P",
    "NhEWRJ0BD9CbbE1O6inwRRQ0wIITKik7YctTvpji5U5qIdAB9pGVS5oML6NnVl623LDYg7NQ6Bt",
    "oQ1Bi/Wxbb4hBurmsNRN56n2R0AZxZwRUehtSLQPMQbYwG4c4G/HGnQqD6MhUWYTQjIEvcUGiU4",
    "pIK+TaXyxzwQxUjHCmxGvO8Fp23Y42rMtA+AVAUHbNhWQQSyZMOX8+y30tCnIPocG7Nt+uTYf3l",
    "hH/gsGB6BK49aryyEo0oeOKN00CUjzMGFrnCXTMMMieEHUBkX+NASl2YuZo32CPEEXJcpgkDjZ1",
    "l3FhhjeUm02arvMnFUyNkrJ1rNgibbmEKpYGGtrUVEnnOtSWFfGWzAEnmhtEEOqYanWYpzWLOhK",
    "DLBL7/JqsIIh8RmsLkXACuka5gBJ33mKjeUkklptZFTH5G1sbU2/noa1hQHVIxSKuoAiTAPGLAl",
    "vubaAacc9AtEqk5hXBE4zZBbK0z0rGgdSDTAmFU3k2AXHaCkw0n3kEithV2PRVMEcl7NwlNAQAt",
    "dgGIdtLBvEFsREu9a2gXU3ZOaoAZoqFhewarHqsA01XUIdxbArBkIeiJaSkZ/1+DS8AJhtRAkm+",
    "pvYv9RRC3cvosLNs/ve8Ty78hPzbCSXv96d0LNQoMebuOb3XapV71vDu4XR/J2Qu5rbZzEn53DL",
    "7kZ+vxe+u/RttXH505e3H9bm2f9j7XTz/1q2vjVqtOPCGU7lq8M+mbBrsUD/zQn9y9lad5h9oJ5",
    "a+qQj+WGfPnz2utntZfzMsLeWs3f0fMV1fMyyJD8VbQfZh4lbE5uOa6d/bcLeCzPisZQ9T4+vj+",
    "eTv7Ge57EoXudOxOucq9wTefvr+6+szyef7v9qhv2rOb5Xk7m+R1y3gD26tqc5C7DS96gURknOQ",
    "blbbXL1+av5flo574zl/hY7/8v9ft5/Zn6dtZx3xnLz+nfaOf6n4avmgZfDL//Bfsz7ffW78Z+9",
    "030H3c7Wj8Z/deoh40HBV2/2Gj9he0Vv/4E8/QHYrbUD",
    ""
  };

  static char newstr [1245] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c8_sliding_controller_const(SimStruct *S)
{
  const char* newstr = sf_c8_sliding_controller_const_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(788098816U));
  ssSetChecksum1(S,(4111107944U));
  ssSetChecksum2(S,(3540730917U));
  ssSetChecksum3(S,(950828768U));
}

static void mdlRTW_c8_sliding_controller_const(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c8_sliding_controller_const(SimStruct *S)
{
  SFc8_sliding_controller_constInstanceStruct *chartInstance;
  chartInstance = (SFc8_sliding_controller_constInstanceStruct *)utMalloc(sizeof
    (SFc8_sliding_controller_constInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc8_sliding_controller_constInstanceStruct));
  chartInstance = new (chartInstance)
    SFc8_sliding_controller_constInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c8_sliding_controller_const;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c8_sliding_controller_const;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c8_sliding_controller_const;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c8_sliding_controller_const;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c8_sliding_controller_const;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c8_sliding_controller_const;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c8_sliding_controller_const;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c8_sliding_controller_const;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c8_sliding_controller_const;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c8_sliding_controller_const;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c8_sliding_controller_const;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c8_sliding_controller_const;
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
    chartInstance->c8_JITStateAnimation,
    chartInstance->c8_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c8_sliding_controller_const(chartInstance);
}

void c8_sliding_controller_const_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c8_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c8_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c8_sliding_controller_const(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c8_sliding_controller_const_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
