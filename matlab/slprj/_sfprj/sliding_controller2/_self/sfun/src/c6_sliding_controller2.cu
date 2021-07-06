/* Include files */

#include "sliding_controller2_sfun.h"
#include "c6_sliding_controller2.h"
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
static void initialize_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance);
static void initialize_params_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance);
static void enable_c6_sliding_controller2(SFc6_sliding_controller2InstanceStruct
  *chartInstance);
static void disable_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance);
static void c6_do_animation_call_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance);
static void ext_mode_exec_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance);
static const mxArray *get_sim_state_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance);
static void set_sim_state_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance, const mxArray *c6_st);
static void sf_gateway_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance);
static void mdl_start_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance);
static void mdl_terminate_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance);
static void initSimStructsc6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance);
static void c6_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_b_msg, const char_T *c6_identifier,
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_y);
static void c6_b_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId,
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_y);
static void c6_c_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId,
  c6_SL_Bus_sliding_controller2_std_msgs_Header *c6_y);
static uint32_T c6_d_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId);
static c6_SL_Bus_sliding_controller2_ros_time_Time c6_e_emlrt_marshallIn
  (SFc6_sliding_controller2InstanceStruct *chartInstance, const mxArray *c6_u,
   const emlrtMsgIdentifier *c6_parentId);
static real_T c6_f_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId);
static void c6_g_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId,
  uint8_T c6_y[128]);
static c6_SL_Bus_ROSVariableLengthArrayInfo c6_h_emlrt_marshallIn
  (SFc6_sliding_controller2InstanceStruct *chartInstance, const mxArray *c6_u,
   const emlrtMsgIdentifier *c6_parentId);
static void c6_i_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId,
  c6_SL_Bus_sliding_controller2_std_msgs_String c6_y[16]);
static void c6_j_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId,
  real_T c6_y[7]);
static uint8_T c6_k_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_b_is_active_c6_sliding_controller2, const
  char_T *c6_identifier);
static uint8_T c6_l_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId);
static void c6_eML_blk_kernel(SFc6_sliding_controller2InstanceStruct
  *chartInstance, c6_SL_Bus_sliding_controller2_sensor_msgs_JointState
  *c6_b_blankMsg);
static __global__ void c6_sf_gateway_c6_sliding_controller2_kernel1
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg,
   c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg);
static __global__ void c6_sf_gateway_c6_sliding_controller2_kernel2(const
  int32_T c6_i1, c6_SL_Bus_sliding_controller2_sensor_msgs_JointState
  *c6_b_blankMsg, c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg);
static __global__ void c6_sf_gateway_c6_sliding_controller2_kernel3
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg,
   c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg);
static __global__ void c6_sf_gateway_c6_sliding_controller2_kernel4
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg,
   c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_r);
static __global__ void c6_sf_gateway_c6_sliding_controller2_kernel5(const
  int32_T c6_i5, c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg,
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_r);
static __global__ void c6_sf_gateway_c6_sliding_controller2_kernel6
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg,
   c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_r);
static __global__ void c6_sf_gateway_c6_sliding_controller2_kernel7(const
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_r,
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg);
static __global__ void c6_sf_gateway_c6_sliding_controller2_kernel8(const
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_r, const int32_T
  c6_i9, c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg);
static __global__ void c6_sf_gateway_c6_sliding_controller2_kernel9(const
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_r,
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg);
static __global__ void c6_eML_blk_kernel_kernel10
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg);
static __global__ void c6_eML_blk_kernel_kernel11(const uint8_T c6_uv[10],
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg);
static __global__ void c6_eML_blk_kernel_kernel12
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg);
static __global__ void c6_eML_blk_kernel_kernel13(const uint8_T c6_uv1[11],
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg);
static __global__ void c6_eML_blk_kernel_kernel14
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg);
static __global__ void c6_eML_blk_kernel_kernel15(const uint8_T c6_uv2[12],
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg);
static __global__ void c6_eML_blk_kernel_kernel16
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg);
static __global__ void c6_eML_blk_kernel_kernel17(const uint8_T c6_uv3[11],
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg);
static __global__ void c6_eML_blk_kernel_kernel18
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg);
static __global__ void c6_eML_blk_kernel_kernel19(const uint8_T c6_uv4[12],
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg);
static __global__ void c6_eML_blk_kernel_kernel20
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg);
static __global__ void c6_eML_blk_kernel_kernel21(const uint8_T c6_uv5[13],
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg);
static __global__ void c6_eML_blk_kernel_kernel22
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg);
static __global__ void c6_eML_blk_kernel_kernel23(const uint8_T c6_uv6[8],
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg);
static __global__ void c6_eML_blk_kernel_kernel24
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg);
static void init_dsm_address_info(SFc6_sliding_controller2InstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc6_sliding_controller2InstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c6_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c6_is_active_c6_sliding_controller2 = 0U;
  cudaGetLastError();
  cudaMalloc(&chartInstance->c6_gpu_uv6, 8UL);
  cudaMalloc(&chartInstance->c6_gpu_uv5, 13UL);
  cudaMalloc(&chartInstance->c6_gpu_uv4, 12UL);
  cudaMalloc(&chartInstance->c6_gpu_uv3, 11UL);
  cudaMalloc(&chartInstance->c6_gpu_uv2, 12UL);
  cudaMalloc(&chartInstance->c6_gpu_uv1, 11UL);
  cudaMalloc(&chartInstance->c6_gpu_uv, 10UL);
  cudaMalloc(&chartInstance->c6_gpu_blankMsg, 2536UL);
}

static void initialize_params_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance)
{
}

static void enable_c6_sliding_controller2(SFc6_sliding_controller2InstanceStruct
  *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c6_do_animation_call_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance)
{
  static const char_T *c6_sv[9] = { "Header", "Name", "Name_SL_Info", "Position",
    "Position_SL_Info", "Velocity", "Velocity_SL_Info", "Effort",
    "Effort_SL_Info" };

  static const char_T *c6_sv1[4] = { "Seq", "Stamp", "FrameId",
    "FrameId_SL_Info" };

  static const char_T *c6_sv2[2] = { "Sec", "Nsec" };

  static const char_T *c6_sv3[2] = { "CurrentLength", "ReceivedLength" };

  static const char_T *c6_sv4[2] = { "Data", "Data_SL_Info" };

  c6_SL_Bus_sliding_controller2_std_msgs_String c6_g_u[16];
  const c6_SL_Bus_sliding_controller2_std_msgs_String *c6_r;
  const mxArray *c6_ab_y = NULL;
  const mxArray *c6_b_y = NULL;
  const mxArray *c6_bb_y = NULL;
  const mxArray *c6_c_y = NULL;
  const mxArray *c6_cb_y = NULL;
  const mxArray *c6_d_y = NULL;
  const mxArray *c6_db_y = NULL;
  const mxArray *c6_e_y = NULL;
  const mxArray *c6_eb_y = NULL;
  const mxArray *c6_f_y = NULL;
  const mxArray *c6_fb_y = NULL;
  const mxArray *c6_g_y = NULL;
  const mxArray *c6_gb_y = NULL;
  const mxArray *c6_h_y = NULL;
  const mxArray *c6_i_y = NULL;
  const mxArray *c6_j_y = NULL;
  const mxArray *c6_k_y = NULL;
  const mxArray *c6_l_y = NULL;
  const mxArray *c6_m_y = NULL;
  const mxArray *c6_n_y = NULL;
  const mxArray *c6_o_y = NULL;
  const mxArray *c6_p_y = NULL;
  const mxArray *c6_q_y = NULL;
  const mxArray *c6_r_y = NULL;
  const mxArray *c6_s_y = NULL;
  const mxArray *c6_st;
  const mxArray *c6_t_y = NULL;
  const mxArray *c6_u_y = NULL;
  const mxArray *c6_v_y = NULL;
  const mxArray *c6_w_y = NULL;
  const mxArray *c6_x_y = NULL;
  const mxArray *c6_y = NULL;
  const mxArray *c6_y_y = NULL;
  real_T c6_l_u[7];
  real_T c6_b_u;
  real_T c6_c_u;
  real_T c6_u_Stamp_Nsec;
  real_T c6_u_Stamp_Sec;
  int32_T c6_iv[1];
  int32_T c6_b_i;
  int32_T c6_i;
  int32_T c6_i1;
  int32_T c6_i2;
  int32_T c6_i3;
  int32_T c6_i4;
  int32_T c6_i5;
  int32_T c6_i6;
  int32_T c6_i7;
  uint32_T c6_e_u;
  uint32_T c6_f_u;
  uint32_T c6_h_u;
  uint32_T c6_i_u;
  uint32_T c6_j_u;
  uint32_T c6_k_u;
  uint32_T c6_m_u;
  uint32_T c6_n_u;
  uint32_T c6_o_u;
  uint32_T c6_p_u;
  uint32_T c6_q_u;
  uint32_T c6_r_u;
  uint32_T c6_u;
  uint32_T c6_u_CurrentLength;
  uint32_T c6_u_FrameId_SL_Info_CurrentLength;
  uint32_T c6_u_FrameId_SL_Info_ReceivedLength;
  uint32_T c6_u_ReceivedLength;
  uint32_T c6_u_Seq;
  uint8_T c6_d_u[128];
  uint8_T c6_u_FrameId[128];
  c6_st = NULL;
  c6_y = NULL;
  sf_mex_assign(&c6_y, sf_mex_createcellmatrix(2, 1), false);
  c6_b_y = NULL;
  sf_mex_assign(&c6_b_y, sf_mex_createstruct("structure", 9, c6_sv, 2, 1, 1),
                false);
  c6_u_Seq = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_msg)[0])[0];
  c6_u_Stamp_Sec = *(real_T *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_ros_time_Time *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_msg)[0])[8])[0];
  c6_u_Stamp_Nsec = *(real_T *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_ros_time_Time *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_msg)[0])[8])[8];
  for (c6_i = 0; c6_i < 128; c6_i++) {
    c6_u_FrameId[c6_i] = ((uint8_T *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
      chartInstance->c6_msg)[0])[24])[c6_i];
  }

  c6_u_FrameId_SL_Info_CurrentLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_msg)[0])[152])[0];
  c6_u_FrameId_SL_Info_ReceivedLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_msg)[0])[152])[4];
  c6_c_y = NULL;
  sf_mex_assign(&c6_c_y, sf_mex_createstruct("structure", 4, c6_sv1, 2, 1, 1),
                false);
  c6_u = c6_u_Seq;
  c6_d_y = NULL;
  sf_mex_assign(&c6_d_y, sf_mex_create("y", &c6_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c6_c_y, 0, "Seq", c6_d_y, 0);
  c6_e_y = NULL;
  sf_mex_assign(&c6_e_y, sf_mex_createstruct("structure", 2, c6_sv2, 2, 1, 1),
                false);
  c6_b_u = c6_u_Stamp_Sec;
  c6_f_y = NULL;
  sf_mex_assign(&c6_f_y, sf_mex_create("y", &c6_b_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c6_e_y, 0, "Sec", c6_f_y, 0);
  c6_c_u = c6_u_Stamp_Nsec;
  c6_g_y = NULL;
  sf_mex_assign(&c6_g_y, sf_mex_create("y", &c6_c_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c6_e_y, 0, "Nsec", c6_g_y, 1);
  sf_mex_setfieldbynum(c6_c_y, 0, "Stamp", c6_e_y, 1);
  for (c6_i1 = 0; c6_i1 < 128; c6_i1++) {
    c6_d_u[c6_i1] = c6_u_FrameId[c6_i1];
  }

  c6_h_y = NULL;
  sf_mex_assign(&c6_h_y, sf_mex_create("y", c6_d_u, 3, 0U, 1U, 0U, 1, 128),
                false);
  sf_mex_setfieldbynum(c6_c_y, 0, "FrameId", c6_h_y, 2);
  c6_i_y = NULL;
  sf_mex_assign(&c6_i_y, sf_mex_createstruct("structure", 2, c6_sv3, 2, 1, 1),
                false);
  c6_e_u = c6_u_FrameId_SL_Info_CurrentLength;
  c6_j_y = NULL;
  sf_mex_assign(&c6_j_y, sf_mex_create("y", &c6_e_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c6_i_y, 0, "CurrentLength", c6_j_y, 0);
  c6_f_u = c6_u_FrameId_SL_Info_ReceivedLength;
  c6_k_y = NULL;
  sf_mex_assign(&c6_k_y, sf_mex_create("y", &c6_f_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c6_i_y, 0, "ReceivedLength", c6_k_y, 1);
  sf_mex_setfieldbynum(c6_c_y, 0, "FrameId_SL_Info", c6_i_y, 3);
  sf_mex_setfieldbynum(c6_b_y, 0, "Header", c6_c_y, 0);
  for (c6_i2 = 0; c6_i2 < 16; c6_i2++) {
    for (c6_i3 = 0; c6_i3 < 128; c6_i3++) {
      c6_g_u[c6_i2].Data[c6_i3] = ((uint8_T *)&((char_T *)
        (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
        (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
        chartInstance->c6_msg)[160])[136 * (int32_T)c6_i2])[0])[c6_i3];
    }

    c6_g_u[c6_i2].Data_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
      (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      chartInstance->c6_msg)[160])[136 * (int32_T)c6_i2])[128])[0];
    c6_g_u[c6_i2].Data_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
      (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      chartInstance->c6_msg)[160])[136 * (int32_T)c6_i2])[128])[4];
  }

  c6_l_y = NULL;
  c6_iv[0] = 16;
  sf_mex_assign(&c6_l_y, sf_mex_createstructarray("structure", 1, c6_iv, 2,
    c6_sv4), false);
  for (c6_b_i = 0; c6_b_i < 16; c6_b_i++) {
    c6_r = &c6_g_u[c6_b_i];
    for (c6_i4 = 0; c6_i4 < 128; c6_i4++) {
      c6_d_u[c6_i4] = c6_r->Data[c6_i4];
    }

    c6_n_y = NULL;
    sf_mex_assign(&c6_n_y, sf_mex_create("y", c6_d_u, 3, 0U, 1U, 0U, 1, 128),
                  false);
    sf_mex_setfieldbynum(c6_l_y, c6_b_i, "Data", c6_n_y, 0);
    c6_u_CurrentLength = c6_r->Data_SL_Info.CurrentLength;
    c6_u_ReceivedLength = c6_r->Data_SL_Info.ReceivedLength;
    c6_p_y = NULL;
    sf_mex_assign(&c6_p_y, sf_mex_createstruct("structure", 2, c6_sv3, 2, 1, 1),
                  false);
    c6_j_u = c6_u_CurrentLength;
    c6_r_y = NULL;
    sf_mex_assign(&c6_r_y, sf_mex_create("y", &c6_j_u, 7, 0U, 0U, 0U, 0), false);
    sf_mex_setfieldbynum(c6_p_y, 0, "CurrentLength", c6_r_y, 0);
    c6_k_u = c6_u_ReceivedLength;
    c6_s_y = NULL;
    sf_mex_assign(&c6_s_y, sf_mex_create("y", &c6_k_u, 7, 0U, 0U, 0U, 0), false);
    sf_mex_setfieldbynum(c6_p_y, 0, "ReceivedLength", c6_s_y, 1);
    sf_mex_setfieldbynum(c6_l_y, c6_b_i, "Data_SL_Info", c6_p_y, 1);
  }

  sf_mex_setfieldbynum(c6_b_y, 0, "Name", c6_l_y, 1);
  c6_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c6_msg)
    [2336])[0];
  c6_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c6_msg)
    [2336])[4];
  c6_m_y = NULL;
  sf_mex_assign(&c6_m_y, sf_mex_createstruct("structure", 2, c6_sv3, 2, 1, 1),
                false);
  c6_h_u = c6_u_CurrentLength;
  c6_o_y = NULL;
  sf_mex_assign(&c6_o_y, sf_mex_create("y", &c6_h_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c6_m_y, 0, "CurrentLength", c6_o_y, 0);
  c6_i_u = c6_u_ReceivedLength;
  c6_q_y = NULL;
  sf_mex_assign(&c6_q_y, sf_mex_create("y", &c6_i_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c6_m_y, 0, "ReceivedLength", c6_q_y, 1);
  sf_mex_setfieldbynum(c6_b_y, 0, "Name_SL_Info", c6_m_y, 2);
  for (c6_i5 = 0; c6_i5 < 7; c6_i5++) {
    c6_l_u[c6_i5] = ((real_T *)&((char_T *)chartInstance->c6_msg)[2344])[c6_i5];
  }

  c6_t_y = NULL;
  sf_mex_assign(&c6_t_y, sf_mex_create("y", c6_l_u, 0, 0U, 1U, 0U, 1, 7), false);
  sf_mex_setfieldbynum(c6_b_y, 0, "Position", c6_t_y, 3);
  c6_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c6_msg)
    [2400])[0];
  c6_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c6_msg)
    [2400])[4];
  c6_u_y = NULL;
  sf_mex_assign(&c6_u_y, sf_mex_createstruct("structure", 2, c6_sv3, 2, 1, 1),
                false);
  c6_m_u = c6_u_CurrentLength;
  c6_v_y = NULL;
  sf_mex_assign(&c6_v_y, sf_mex_create("y", &c6_m_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c6_u_y, 0, "CurrentLength", c6_v_y, 0);
  c6_n_u = c6_u_ReceivedLength;
  c6_w_y = NULL;
  sf_mex_assign(&c6_w_y, sf_mex_create("y", &c6_n_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c6_u_y, 0, "ReceivedLength", c6_w_y, 1);
  sf_mex_setfieldbynum(c6_b_y, 0, "Position_SL_Info", c6_u_y, 4);
  for (c6_i6 = 0; c6_i6 < 7; c6_i6++) {
    c6_l_u[c6_i6] = ((real_T *)&((char_T *)chartInstance->c6_msg)[2408])[c6_i6];
  }

  c6_x_y = NULL;
  sf_mex_assign(&c6_x_y, sf_mex_create("y", c6_l_u, 0, 0U, 1U, 0U, 1, 7), false);
  sf_mex_setfieldbynum(c6_b_y, 0, "Velocity", c6_x_y, 5);
  c6_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c6_msg)
    [2464])[0];
  c6_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c6_msg)
    [2464])[4];
  c6_y_y = NULL;
  sf_mex_assign(&c6_y_y, sf_mex_createstruct("structure", 2, c6_sv3, 2, 1, 1),
                false);
  c6_o_u = c6_u_CurrentLength;
  c6_ab_y = NULL;
  sf_mex_assign(&c6_ab_y, sf_mex_create("y", &c6_o_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c6_y_y, 0, "CurrentLength", c6_ab_y, 0);
  c6_p_u = c6_u_ReceivedLength;
  c6_bb_y = NULL;
  sf_mex_assign(&c6_bb_y, sf_mex_create("y", &c6_p_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c6_y_y, 0, "ReceivedLength", c6_bb_y, 1);
  sf_mex_setfieldbynum(c6_b_y, 0, "Velocity_SL_Info", c6_y_y, 6);
  for (c6_i7 = 0; c6_i7 < 7; c6_i7++) {
    c6_l_u[c6_i7] = ((real_T *)&((char_T *)chartInstance->c6_msg)[2472])[c6_i7];
  }

  c6_cb_y = NULL;
  sf_mex_assign(&c6_cb_y, sf_mex_create("y", c6_l_u, 0, 0U, 1U, 0U, 1, 7), false);
  sf_mex_setfieldbynum(c6_b_y, 0, "Effort", c6_cb_y, 7);
  c6_u_CurrentLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c6_msg)
    [2528])[0];
  c6_u_ReceivedLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c6_msg)
    [2528])[4];
  c6_db_y = NULL;
  sf_mex_assign(&c6_db_y, sf_mex_createstruct("structure", 2, c6_sv3, 2, 1, 1),
                false);
  c6_q_u = c6_u_CurrentLength;
  c6_eb_y = NULL;
  sf_mex_assign(&c6_eb_y, sf_mex_create("y", &c6_q_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c6_db_y, 0, "CurrentLength", c6_eb_y, 0);
  c6_r_u = c6_u_ReceivedLength;
  c6_fb_y = NULL;
  sf_mex_assign(&c6_fb_y, sf_mex_create("y", &c6_r_u, 7, 0U, 0U, 0U, 0), false);
  sf_mex_setfieldbynum(c6_db_y, 0, "ReceivedLength", c6_fb_y, 1);
  sf_mex_setfieldbynum(c6_b_y, 0, "Effort_SL_Info", c6_db_y, 8);
  sf_mex_setcell(c6_y, 0, c6_b_y);
  c6_gb_y = NULL;
  sf_mex_assign(&c6_gb_y, sf_mex_create("y",
    &chartInstance->c6_is_active_c6_sliding_controller2, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c6_y, 1, c6_gb_y);
  sf_mex_assign(&c6_st, c6_y, false);
  return c6_st;
}

static void set_sim_state_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance, const mxArray *c6_st)
{
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState c6_r;
  const mxArray *c6_u;
  int32_T c6_i;
  int32_T c6_i1;
  int32_T c6_i2;
  int32_T c6_i3;
  c6_u = sf_mex_dup(c6_st);
  c6_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c6_u, 0)), "msg",
                      &c6_r);
  *(uint32_T *)&((char_T *)(c6_SL_Bus_sliding_controller2_std_msgs_Header *)
                 &((char_T *)chartInstance->c6_msg)[0])[0] = c6_r.Header.Seq;
  *(real_T *)&((char_T *)(c6_SL_Bus_sliding_controller2_ros_time_Time *)
               &((char_T *)(c6_SL_Bus_sliding_controller2_std_msgs_Header *)
                 &((char_T *)chartInstance->c6_msg)[0])[8])[0] =
    c6_r.Header.Stamp.Sec;
  *(real_T *)&((char_T *)(c6_SL_Bus_sliding_controller2_ros_time_Time *)
               &((char_T *)(c6_SL_Bus_sliding_controller2_std_msgs_Header *)
                 &((char_T *)chartInstance->c6_msg)[0])[8])[8] =
    c6_r.Header.Stamp.Nsec;
  for (c6_i = 0; c6_i < 128; c6_i++) {
    ((uint8_T *)&((char_T *)(c6_SL_Bus_sliding_controller2_std_msgs_Header *)
                  &((char_T *)chartInstance->c6_msg)[0])[24])[c6_i] =
      c6_r.Header.FrameId[c6_i];
  }

  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_msg)[0])[152])[0] =
    c6_r.Header.FrameId_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_msg)[0])[152])[4] =
    c6_r.Header.FrameId_SL_Info.ReceivedLength;
  for (c6_i1 = 0; c6_i1 < 16; c6_i1++) {
    for (c6_i2 = 0; c6_i2 < 128; c6_i2++) {
      ((uint8_T *)&((char_T *)(c6_SL_Bus_sliding_controller2_std_msgs_String *)
                    &((char_T *)(c6_SL_Bus_sliding_controller2_std_msgs_String *)
                      &((char_T *)chartInstance->c6_msg)[160])[136 * (int32_T)
                    c6_i1])[0])[c6_i2] = c6_r.Name[c6_i1].Data[c6_i2];
    }

    *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      chartInstance->c6_msg)[160])[136 * (int32_T)c6_i1])[128])[0] =
      c6_r.Name[c6_i1].Data_SL_Info.CurrentLength;
    *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      chartInstance->c6_msg)[160])[136 * (int32_T)c6_i1])[128])[4] =
      c6_r.Name[c6_i1].Data_SL_Info.ReceivedLength;
  }

  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2336])[0] = c6_r.Name_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2336])[4] = c6_r.Name_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2400])[0] = c6_r.Position_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2400])[4] = c6_r.Position_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2464])[0] = c6_r.Velocity_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2464])[4] = c6_r.Velocity_SL_Info.ReceivedLength;
  for (c6_i3 = 0; c6_i3 < 7; c6_i3++) {
    ((real_T *)&((char_T *)chartInstance->c6_msg)[2344])[c6_i3] =
      c6_r.Position[c6_i3];
    ((real_T *)&((char_T *)chartInstance->c6_msg)[2408])[c6_i3] =
      c6_r.Velocity[c6_i3];
    ((real_T *)&((char_T *)chartInstance->c6_msg)[2472])[c6_i3] =
      c6_r.Effort[c6_i3];
  }

  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2528])[0] = c6_r.Effort_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2528])[4] = c6_r.Effort_SL_Info.ReceivedLength;
  chartInstance->c6_is_active_c6_sliding_controller2 = c6_k_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c6_u, 1)),
     "is_active_c6_sliding_controller2");
  sf_mex_destroy(&c6_u);
  sf_mex_destroy(&c6_st);
}

static void sf_gateway_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance)
{
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState c6_r;
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_gpu_blankMsg;
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_gpu_msg;
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_gpu_r;
  int32_T c6_i1;
  int32_T c6_i5;
  int32_T c6_i9;
  cudaMalloc(&c6_gpu_r, 2536UL);
  cudaMalloc(&c6_gpu_msg, 2536UL);
  cudaMalloc(&c6_b_gpu_blankMsg, 2536UL);
  chartInstance->c6_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  *(uint32_T *)&((char_T *)(c6_SL_Bus_sliding_controller2_std_msgs_Header *)
                 &((char_T *)chartInstance->c6_msg)[0])[0] = *(uint32_T *)
    &((char_T *)(c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
       chartInstance->c6_blankMsg)[0])[0];
  *(real_T *)&((char_T *)(c6_SL_Bus_sliding_controller2_ros_time_Time *)
               &((char_T *)(c6_SL_Bus_sliding_controller2_std_msgs_Header *)
                 &((char_T *)chartInstance->c6_msg)[0])[8])[0] = *(real_T *)
    &((char_T *)(c6_SL_Bus_sliding_controller2_ros_time_Time *)&((char_T *)
       (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
        chartInstance->c6_blankMsg)[0])[8])[0];
  *(real_T *)&((char_T *)(c6_SL_Bus_sliding_controller2_ros_time_Time *)
               &((char_T *)(c6_SL_Bus_sliding_controller2_std_msgs_Header *)
                 &((char_T *)chartInstance->c6_msg)[0])[8])[8] = *(real_T *)
    &((char_T *)(c6_SL_Bus_sliding_controller2_ros_time_Time *)&((char_T *)
       (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
        chartInstance->c6_blankMsg)[0])[8])[8];
  cudaMemcpy(c6_b_gpu_blankMsg, chartInstance->c6_blankMsg, 2536UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c6_gpu_msg, chartInstance->c6_msg, 2536UL, cudaMemcpyHostToDevice);
  c6_sf_gateway_c6_sliding_controller2_kernel1<<<dim3(1U, 1U, 1U), dim3(128U, 1U,
    1U)>>>(c6_b_gpu_blankMsg, c6_gpu_msg);
  cudaMemcpy(chartInstance->c6_msg, c6_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c6_blankMsg, c6_b_gpu_blankMsg, 2536UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_msg)[0])[152])[0] = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_blankMsg)[0])[152])[0];
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_msg)[0])[152])[4] = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_blankMsg)[0])[152])[4];
  for (c6_i1 = 0; c6_i1 < 16; c6_i1++) {
    cudaMemcpy(c6_b_gpu_blankMsg, chartInstance->c6_blankMsg, 2536UL,
               cudaMemcpyHostToDevice);
    cudaMemcpy(c6_gpu_msg, chartInstance->c6_msg, 2536UL, cudaMemcpyHostToDevice);
    c6_sf_gateway_c6_sliding_controller2_kernel2<<<dim3(1U, 1U, 1U), dim3(128U,
      1U, 1U)>>>(c6_i1, c6_b_gpu_blankMsg, c6_gpu_msg);
    cudaMemcpy(chartInstance->c6_msg, c6_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
    cudaMemcpy(chartInstance->c6_blankMsg, c6_b_gpu_blankMsg, 2536UL,
               cudaMemcpyDeviceToHost);
    *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      chartInstance->c6_msg)[160])[136 * (int32_T)c6_i1])[128])[0] = *(uint32_T *)
      &((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
         (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
          (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
           chartInstance->c6_blankMsg)[160])[136 * (int32_T)c6_i1])[128])[0];
    *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      chartInstance->c6_msg)[160])[136 * (int32_T)c6_i1])[128])[4] = *(uint32_T *)
      &((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
         (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
          (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
           chartInstance->c6_blankMsg)[160])[136 * (int32_T)c6_i1])[128])[4];
  }

  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2336])[0] = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_blankMsg)[2336])[0];
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2336])[4] = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_blankMsg)[2336])[4];
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2400])[0] = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_blankMsg)[2400])[0];
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2400])[4] = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_blankMsg)[2400])[4];
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2464])[0] = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_blankMsg)[2464])[0];
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2464])[4] = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_blankMsg)[2464])[4];
  cudaMemcpy(c6_b_gpu_blankMsg, chartInstance->c6_blankMsg, 2536UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(c6_gpu_msg, chartInstance->c6_msg, 2536UL, cudaMemcpyHostToDevice);
  c6_sf_gateway_c6_sliding_controller2_kernel3<<<dim3(1U, 1U, 1U), dim3(32U, 1U,
    1U)>>>(c6_b_gpu_blankMsg, c6_gpu_msg);
  cudaMemcpy(chartInstance->c6_msg, c6_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(chartInstance->c6_blankMsg, c6_b_gpu_blankMsg, 2536UL,
             cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2528])[0] = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_blankMsg)[2528])[0];
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2528])[4] = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_blankMsg)[2528])[4];
  c6_r.Header.Seq = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_msg)[0])[0];
  c6_r.Header.Stamp.Sec = *(real_T *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_ros_time_Time *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_msg)[0])[8])[0];
  c6_r.Header.Stamp.Nsec = *(real_T *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_ros_time_Time *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_msg)[0])[8])[8];
  cudaMemcpy(c6_gpu_r, &c6_r, 2536UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c6_gpu_msg, chartInstance->c6_msg, 2536UL, cudaMemcpyHostToDevice);
  c6_sf_gateway_c6_sliding_controller2_kernel4<<<dim3(1U, 1U, 1U), dim3(128U, 1U,
    1U)>>>(c6_gpu_msg, c6_gpu_r);
  cudaMemcpy(chartInstance->c6_msg, c6_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c6_r, c6_gpu_r, 2536UL, cudaMemcpyDeviceToHost);
  c6_r.Header.FrameId_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_msg)[0])[152])[0];
  c6_r.Header.FrameId_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_msg)[0])[152])[4];
  for (c6_i5 = 0; c6_i5 < 16; c6_i5++) {
    cudaMemcpy(c6_gpu_r, &c6_r, 2536UL, cudaMemcpyHostToDevice);
    cudaMemcpy(c6_gpu_msg, chartInstance->c6_msg, 2536UL, cudaMemcpyHostToDevice);
    c6_sf_gateway_c6_sliding_controller2_kernel5<<<dim3(1U, 1U, 1U), dim3(128U,
      1U, 1U)>>>(c6_i5, c6_gpu_msg, c6_gpu_r);
    cudaMemcpy(chartInstance->c6_msg, c6_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
    cudaMemcpy(&c6_r, c6_gpu_r, 2536UL, cudaMemcpyDeviceToHost);
    c6_r.Name[c6_i5].Data_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
      (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      chartInstance->c6_msg)[160])[136 * (int32_T)c6_i5])[128])[0];
    c6_r.Name[c6_i5].Data_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
      (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      chartInstance->c6_msg)[160])[136 * (int32_T)c6_i5])[128])[4];
  }

  c6_r.Name_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c6_msg)
    [2336])[0];
  c6_r.Name_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c6_msg)
    [2336])[4];
  c6_r.Position_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c6_msg)
    [2400])[0];
  c6_r.Position_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c6_msg)
    [2400])[4];
  c6_r.Velocity_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c6_msg)
    [2464])[0];
  c6_r.Velocity_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c6_msg)
    [2464])[4];
  cudaMemcpy(c6_gpu_r, &c6_r, 2536UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c6_gpu_msg, chartInstance->c6_msg, 2536UL, cudaMemcpyHostToDevice);
  c6_sf_gateway_c6_sliding_controller2_kernel6<<<dim3(1U, 1U, 1U), dim3(32U, 1U,
    1U)>>>(c6_gpu_msg, c6_gpu_r);
  cudaMemcpy(chartInstance->c6_msg, c6_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(&c6_r, c6_gpu_r, 2536UL, cudaMemcpyDeviceToHost);
  c6_r.Effort_SL_Info.CurrentLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c6_msg)
    [2528])[0];
  c6_r.Effort_SL_Info.ReceivedLength = *(uint32_T *)&((char_T *)
    (c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)chartInstance->c6_msg)
    [2528])[4];
  c6_eML_blk_kernel(chartInstance, &c6_r);
  *(uint32_T *)&((char_T *)(c6_SL_Bus_sliding_controller2_std_msgs_Header *)
                 &((char_T *)chartInstance->c6_msg)[0])[0] = c6_r.Header.Seq;
  *(real_T *)&((char_T *)(c6_SL_Bus_sliding_controller2_ros_time_Time *)
               &((char_T *)(c6_SL_Bus_sliding_controller2_std_msgs_Header *)
                 &((char_T *)chartInstance->c6_msg)[0])[8])[0] =
    c6_r.Header.Stamp.Sec;
  *(real_T *)&((char_T *)(c6_SL_Bus_sliding_controller2_ros_time_Time *)
               &((char_T *)(c6_SL_Bus_sliding_controller2_std_msgs_Header *)
                 &((char_T *)chartInstance->c6_msg)[0])[8])[8] =
    c6_r.Header.Stamp.Nsec;
  cudaMemcpy(c6_gpu_r, &c6_r, 2536UL, cudaMemcpyHostToDevice);
  cudaMemcpy(c6_gpu_msg, chartInstance->c6_msg, 2536UL, cudaMemcpyHostToDevice);
  c6_sf_gateway_c6_sliding_controller2_kernel7<<<dim3(1U, 1U, 1U), dim3(128U, 1U,
    1U)>>>(c6_gpu_r, c6_gpu_msg);
  cudaMemcpy(chartInstance->c6_msg, c6_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_msg)[0])[152])[0] =
    c6_r.Header.FrameId_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    (c6_SL_Bus_sliding_controller2_std_msgs_Header *)&((char_T *)
    chartInstance->c6_msg)[0])[152])[4] =
    c6_r.Header.FrameId_SL_Info.ReceivedLength;
  for (c6_i9 = 0; c6_i9 < 16; c6_i9++) {
    cudaMemcpy(c6_gpu_msg, chartInstance->c6_msg, 2536UL, cudaMemcpyHostToDevice);
    c6_sf_gateway_c6_sliding_controller2_kernel8<<<dim3(1U, 1U, 1U), dim3(128U,
      1U, 1U)>>>(c6_gpu_r, c6_i9, c6_gpu_msg);
    cudaMemcpy(chartInstance->c6_msg, c6_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
    *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      chartInstance->c6_msg)[160])[136 * (int32_T)c6_i9])[128])[0] =
      c6_r.Name[c6_i9].Data_SL_Info.CurrentLength;
    *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      (c6_SL_Bus_sliding_controller2_std_msgs_String *)&((char_T *)
      chartInstance->c6_msg)[160])[136 * (int32_T)c6_i9])[128])[4] =
      c6_r.Name[c6_i9].Data_SL_Info.ReceivedLength;
  }

  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2336])[0] = c6_r.Name_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2336])[4] = c6_r.Name_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2400])[0] = c6_r.Position_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2400])[4] = c6_r.Position_SL_Info.ReceivedLength;
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2464])[0] = c6_r.Velocity_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2464])[4] = c6_r.Velocity_SL_Info.ReceivedLength;
  cudaMemcpy(c6_gpu_msg, chartInstance->c6_msg, 2536UL, cudaMemcpyHostToDevice);
  c6_sf_gateway_c6_sliding_controller2_kernel9<<<dim3(1U, 1U, 1U), dim3(32U, 1U,
    1U)>>>(c6_gpu_r, c6_gpu_msg);
  cudaMemcpy(chartInstance->c6_msg, c6_gpu_msg, 2536UL, cudaMemcpyDeviceToHost);
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2528])[0] = c6_r.Effort_SL_Info.CurrentLength;
  *(uint32_T *)&((char_T *)(c6_SL_Bus_ROSVariableLengthArrayInfo *)&((char_T *)
    chartInstance->c6_msg)[2528])[4] = c6_r.Effort_SL_Info.ReceivedLength;
  c6_do_animation_call_c6_sliding_controller2(chartInstance);
  cudaFree(c6_b_gpu_blankMsg);
  cudaFree(c6_gpu_msg);
  cudaFree(c6_gpu_r);
}

static void mdl_start_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance)
{
}

static void mdl_terminate_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance)
{
  cudaError_t c6_errCode;
  cudaFree(*chartInstance->c6_gpu_uv6);
  cudaFree(*chartInstance->c6_gpu_uv5);
  cudaFree(*chartInstance->c6_gpu_uv4);
  cudaFree(*chartInstance->c6_gpu_uv3);
  cudaFree(*chartInstance->c6_gpu_uv2);
  cudaFree(*chartInstance->c6_gpu_uv1);
  cudaFree(*chartInstance->c6_gpu_uv);
  cudaFree(chartInstance->c6_gpu_blankMsg);
  c6_errCode = cudaGetLastError();
  if (c6_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c6_errCode, (char_T *)cudaGetErrorName
                       (c6_errCode), (char_T *)cudaGetErrorString(c6_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c6_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance)
{
}

static void initSimStructsc6_sliding_controller2
  (SFc6_sliding_controller2InstanceStruct *chartInstance)
{
}

const mxArray *sf_c6_sliding_controller2_get_eml_resolved_functions_info()
{
  const mxArray *c6_nameCaptureInfo = NULL;
  c6_nameCaptureInfo = NULL;
  sf_mex_assign(&c6_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c6_nameCaptureInfo;
}

static void c6_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_b_msg, const char_T *c6_identifier,
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_y)
{
  emlrtMsgIdentifier c6_thisId;
  c6_thisId.fIdentifier = const_cast<const char_T *>(c6_identifier);
  c6_thisId.fParent = NULL;
  c6_thisId.bParentIsCell = false;
  c6_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c6_b_msg), &c6_thisId, c6_y);
  sf_mex_destroy(&c6_b_msg);
}

static void c6_b_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId,
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_y)
{
  static const char_T *c6_fieldNames[9] = { "Header", "Name", "Name_SL_Info",
    "Position", "Position_SL_Info", "Velocity", "Velocity_SL_Info", "Effort",
    "Effort_SL_Info" };

  emlrtMsgIdentifier c6_thisId;
  c6_thisId.fParent = c6_parentId;
  c6_thisId.bParentIsCell = false;
  sf_mex_check_struct(c6_parentId, c6_u, 9, c6_fieldNames, 0U, NULL);
  c6_thisId.fIdentifier = "Header";
  c6_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c6_u, "Header",
    "Header", 0)), &c6_thisId, &c6_y->Header);
  c6_thisId.fIdentifier = "Name";
  c6_i_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c6_u, "Name",
    "Name", 0)), &c6_thisId, c6_y->Name);
  c6_thisId.fIdentifier = "Name_SL_Info";
  c6_y->Name_SL_Info = c6_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c6_u, "Name_SL_Info", "Name_SL_Info", 0)), &c6_thisId);
  c6_thisId.fIdentifier = "Position";
  c6_j_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c6_u,
    "Position", "Position", 0)), &c6_thisId, c6_y->Position);
  c6_thisId.fIdentifier = "Position_SL_Info";
  c6_y->Position_SL_Info = c6_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c6_u, "Position_SL_Info", "Position_SL_Info", 0)),
    &c6_thisId);
  c6_thisId.fIdentifier = "Velocity";
  c6_j_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c6_u,
    "Velocity", "Velocity", 0)), &c6_thisId, c6_y->Velocity);
  c6_thisId.fIdentifier = "Velocity_SL_Info";
  c6_y->Velocity_SL_Info = c6_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c6_u, "Velocity_SL_Info", "Velocity_SL_Info", 0)),
    &c6_thisId);
  c6_thisId.fIdentifier = "Effort";
  c6_j_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c6_u, "Effort",
    "Effort", 0)), &c6_thisId, c6_y->Effort);
  c6_thisId.fIdentifier = "Effort_SL_Info";
  c6_y->Effort_SL_Info = c6_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c6_u, "Effort_SL_Info", "Effort_SL_Info", 0)), &c6_thisId);
  sf_mex_destroy(&c6_u);
}

static void c6_c_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId,
  c6_SL_Bus_sliding_controller2_std_msgs_Header *c6_y)
{
  static const char_T *c6_fieldNames[4] = { "Seq", "Stamp", "FrameId",
    "FrameId_SL_Info" };

  emlrtMsgIdentifier c6_thisId;
  c6_thisId.fParent = c6_parentId;
  c6_thisId.bParentIsCell = false;
  sf_mex_check_struct(c6_parentId, c6_u, 4, c6_fieldNames, 0U, NULL);
  c6_thisId.fIdentifier = "Seq";
  c6_y->Seq = c6_d_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c6_u, "Seq", "Seq", 0)), &c6_thisId);
  c6_thisId.fIdentifier = "Stamp";
  c6_y->Stamp = c6_e_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c6_u, "Stamp", "Stamp", 0)), &c6_thisId);
  c6_thisId.fIdentifier = "FrameId";
  c6_g_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c6_u,
    "FrameId", "FrameId", 0)), &c6_thisId, c6_y->FrameId);
  c6_thisId.fIdentifier = "FrameId_SL_Info";
  c6_y->FrameId_SL_Info = c6_h_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c6_u, "FrameId_SL_Info", "FrameId_SL_Info", 0)), &c6_thisId);
  sf_mex_destroy(&c6_u);
}

static uint32_T c6_d_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId)
{
  uint32_T c6_b_u;
  uint32_T c6_y;
  sf_mex_import(c6_parentId, sf_mex_dup(c6_u), &c6_b_u, 1, 7, 0U, 0, 0U, 0);
  c6_y = c6_b_u;
  sf_mex_destroy(&c6_u);
  return c6_y;
}

static c6_SL_Bus_sliding_controller2_ros_time_Time c6_e_emlrt_marshallIn
  (SFc6_sliding_controller2InstanceStruct *chartInstance, const mxArray *c6_u,
   const emlrtMsgIdentifier *c6_parentId)
{
  static const char_T *c6_fieldNames[2] = { "Sec", "Nsec" };

  c6_SL_Bus_sliding_controller2_ros_time_Time c6_y;
  emlrtMsgIdentifier c6_thisId;
  c6_thisId.fParent = c6_parentId;
  c6_thisId.bParentIsCell = false;
  sf_mex_check_struct(c6_parentId, c6_u, 2, c6_fieldNames, 0U, NULL);
  c6_thisId.fIdentifier = "Sec";
  c6_y.Sec = c6_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c6_u, "Sec", "Sec", 0)), &c6_thisId);
  c6_thisId.fIdentifier = "Nsec";
  c6_y.Nsec = c6_f_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield
    (c6_u, "Nsec", "Nsec", 0)), &c6_thisId);
  sf_mex_destroy(&c6_u);
  return c6_y;
}

static real_T c6_f_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId)
{
  real_T c6_d;
  real_T c6_y;
  sf_mex_import(c6_parentId, sf_mex_dup(c6_u), &c6_d, 1, 0, 0U, 0, 0U, 0);
  c6_y = c6_d;
  sf_mex_destroy(&c6_u);
  return c6_y;
}

static void c6_g_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId,
  uint8_T c6_y[128])
{
  int32_T c6_i;
  uint8_T c6_uv[128];
  sf_mex_import(c6_parentId, sf_mex_dup(c6_u), c6_uv, 1, 3, 0U, 1, 0U, 1, 128);
  for (c6_i = 0; c6_i < 128; c6_i++) {
    c6_y[c6_i] = c6_uv[c6_i];
  }

  sf_mex_destroy(&c6_u);
}

static c6_SL_Bus_ROSVariableLengthArrayInfo c6_h_emlrt_marshallIn
  (SFc6_sliding_controller2InstanceStruct *chartInstance, const mxArray *c6_u,
   const emlrtMsgIdentifier *c6_parentId)
{
  static const char_T *c6_fieldNames[2] = { "CurrentLength", "ReceivedLength" };

  c6_SL_Bus_ROSVariableLengthArrayInfo c6_y;
  emlrtMsgIdentifier c6_thisId;
  c6_thisId.fParent = c6_parentId;
  c6_thisId.bParentIsCell = false;
  sf_mex_check_struct(c6_parentId, c6_u, 2, c6_fieldNames, 0U, NULL);
  c6_thisId.fIdentifier = "CurrentLength";
  c6_y.CurrentLength = c6_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c6_u, "CurrentLength", "CurrentLength", 0)), &c6_thisId);
  c6_thisId.fIdentifier = "ReceivedLength";
  c6_y.ReceivedLength = c6_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getfield(c6_u, "ReceivedLength", "ReceivedLength", 0)), &c6_thisId);
  sf_mex_destroy(&c6_u);
  return c6_y;
}

static void c6_i_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId,
  c6_SL_Bus_sliding_controller2_std_msgs_String c6_y[16])
{
  static const char_T *c6_fieldNames[2] = { "Data", "Data_SL_Info" };

  emlrtMsgIdentifier c6_thisId;
  int32_T c6_i;
  uint32_T c6_uv[1];
  c6_uv[0] = 16U;
  c6_thisId.fParent = c6_parentId;
  c6_thisId.bParentIsCell = false;
  sf_mex_check_struct(c6_parentId, c6_u, 2, c6_fieldNames, 1U, c6_uv);
  for (c6_i = 0; c6_i < 16; c6_i++) {
    c6_thisId.fIdentifier = "Data";
    c6_g_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getfield(c6_u, "Data",
      "Data", c6_i)), &c6_thisId, c6_y[c6_i].Data);
    c6_thisId.fIdentifier = "Data_SL_Info";
    c6_y[c6_i].Data_SL_Info = c6_h_emlrt_marshallIn(chartInstance, sf_mex_dup
      (sf_mex_getfield(c6_u, "Data_SL_Info", "Data_SL_Info", c6_i)), &c6_thisId);
  }

  sf_mex_destroy(&c6_u);
}

static void c6_j_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId,
  real_T c6_y[7])
{
  real_T c6_dv[7];
  int32_T c6_i;
  sf_mex_import(c6_parentId, sf_mex_dup(c6_u), c6_dv, 1, 0, 0U, 1, 0U, 1, 7);
  for (c6_i = 0; c6_i < 7; c6_i++) {
    c6_y[c6_i] = c6_dv[c6_i];
  }

  sf_mex_destroy(&c6_u);
}

static uint8_T c6_k_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_b_is_active_c6_sliding_controller2, const
  char_T *c6_identifier)
{
  emlrtMsgIdentifier c6_thisId;
  uint8_T c6_y;
  c6_thisId.fIdentifier = const_cast<const char_T *>(c6_identifier);
  c6_thisId.fParent = NULL;
  c6_thisId.bParentIsCell = false;
  c6_y = c6_l_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c6_b_is_active_c6_sliding_controller2), &c6_thisId);
  sf_mex_destroy(&c6_b_is_active_c6_sliding_controller2);
  return c6_y;
}

static uint8_T c6_l_emlrt_marshallIn(SFc6_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId)
{
  uint8_T c6_b_u;
  uint8_T c6_y;
  sf_mex_import(c6_parentId, sf_mex_dup(c6_u), &c6_b_u, 1, 3, 0U, 0, 0U, 0);
  c6_y = c6_b_u;
  sf_mex_destroy(&c6_u);
  return c6_y;
}

static void c6_eML_blk_kernel(SFc6_sliding_controller2InstanceStruct
  *chartInstance, c6_SL_Bus_sliding_controller2_sensor_msgs_JointState
  *c6_b_blankMsg)
{
  static uint8_T c6_uv5[13] = { 82U, 105U, 103U, 104U, 116U, 69U, 120U, 111U,
    65U, 110U, 107U, 108U, 101U };

  static uint8_T c6_uv2[12] = { 76U, 101U, 102U, 116U, 69U, 120U, 111U, 65U,
    110U, 107U, 108U, 101U };

  static uint8_T c6_uv4[12] = { 82U, 105U, 103U, 104U, 116U, 69U, 120U, 111U,
    75U, 110U, 101U, 101U };

  static uint8_T c6_uv1[11] = { 76U, 101U, 102U, 116U, 69U, 120U, 111U, 75U,
    110U, 101U, 101U };

  static uint8_T c6_uv3[11] = { 82U, 105U, 103U, 104U, 116U, 69U, 120U, 111U,
    72U, 105U, 112U };

  static uint8_T c6_uv[10] = { 76U, 101U, 102U, 116U, 69U, 120U, 111U, 72U, 105U,
    112U };

  static uint8_T c6_uv6[8] = { 67U, 114U, 117U, 116U, 99U, 104U, 101U, 115U };

  cudaMemcpy(chartInstance->c6_gpu_blankMsg, c6_b_blankMsg, 2536UL,
             cudaMemcpyHostToDevice);
  c6_eML_blk_kernel_kernel10<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c6_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c6_gpu_uv, c6_uv, 10UL, cudaMemcpyHostToDevice);
  c6_eML_blk_kernel_kernel11<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c6_gpu_uv, chartInstance->c6_gpu_blankMsg);
  c6_eML_blk_kernel_kernel12<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c6_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c6_gpu_uv1, c6_uv1, 11UL, cudaMemcpyHostToDevice);
  c6_eML_blk_kernel_kernel13<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c6_gpu_uv1, chartInstance->c6_gpu_blankMsg);
  c6_eML_blk_kernel_kernel14<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c6_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c6_gpu_uv2, c6_uv2, 12UL, cudaMemcpyHostToDevice);
  c6_eML_blk_kernel_kernel15<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c6_gpu_uv2, chartInstance->c6_gpu_blankMsg);
  c6_eML_blk_kernel_kernel16<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c6_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c6_gpu_uv3, c6_uv3, 11UL, cudaMemcpyHostToDevice);
  c6_eML_blk_kernel_kernel17<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c6_gpu_uv3, chartInstance->c6_gpu_blankMsg);
  c6_eML_blk_kernel_kernel18<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c6_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c6_gpu_uv4, c6_uv4, 12UL, cudaMemcpyHostToDevice);
  c6_eML_blk_kernel_kernel19<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c6_gpu_uv4, chartInstance->c6_gpu_blankMsg);
  c6_eML_blk_kernel_kernel20<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c6_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c6_gpu_uv5, c6_uv5, 13UL, cudaMemcpyHostToDevice);
  c6_eML_blk_kernel_kernel21<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c6_gpu_uv5, chartInstance->c6_gpu_blankMsg);
  c6_eML_blk_kernel_kernel22<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c6_gpu_blankMsg);
  cudaMemcpy(*chartInstance->c6_gpu_uv6, c6_uv6, 8UL, cudaMemcpyHostToDevice);
  c6_eML_blk_kernel_kernel23<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c6_gpu_uv6, chartInstance->c6_gpu_blankMsg);
  c6_eML_blk_kernel_kernel24<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (chartInstance->c6_gpu_blankMsg);
  cudaMemcpy(c6_b_blankMsg, chartInstance->c6_gpu_blankMsg, 2536UL,
             cudaMemcpyDeviceToHost);
}

static __global__ __launch_bounds__(128, 1) void
  c6_sf_gateway_c6_sliding_controller2_kernel1
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg,
   c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg)
{
  uint64_T c6_threadId;
  int32_T c6_i;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_i = (int32_T)c6_threadId;
  if (c6_i < 128) {
    c6_b_msg->Header.FrameId[c6_i] = c6_b_blankMsg->Header.FrameId[c6_i];
  }
}

static __global__ __launch_bounds__(128, 1) void
  c6_sf_gateway_c6_sliding_controller2_kernel2(const int32_T c6_i1,
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg,
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg)
{
  uint64_T c6_threadId;
  int32_T c6_i2;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_i2 = (int32_T)c6_threadId;
  if (c6_i2 < 128) {
    c6_b_msg->Name[c6_i1].Data[c6_i2] = c6_b_blankMsg->Name[c6_i1].Data[c6_i2];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c6_sf_gateway_c6_sliding_controller2_kernel3
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg,
   c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg)
{
  uint64_T c6_threadId;
  int32_T c6_i3;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_i3 = (int32_T)c6_threadId;
  if (c6_i3 < 7) {
    c6_b_msg->Position[c6_i3] = c6_b_blankMsg->Position[c6_i3];
    c6_b_msg->Velocity[c6_i3] = c6_b_blankMsg->Velocity[c6_i3];
    c6_b_msg->Effort[c6_i3] = c6_b_blankMsg->Effort[c6_i3];
  }
}

static __global__ __launch_bounds__(128, 1) void
  c6_sf_gateway_c6_sliding_controller2_kernel4
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg,
   c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_r)
{
  uint64_T c6_threadId;
  int32_T c6_i4;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_i4 = (int32_T)c6_threadId;
  if (c6_i4 < 128) {
    c6_r->Header.FrameId[c6_i4] = c6_b_msg->Header.FrameId[c6_i4];
  }
}

static __global__ __launch_bounds__(128, 1) void
  c6_sf_gateway_c6_sliding_controller2_kernel5(const int32_T c6_i5,
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg,
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_r)
{
  uint64_T c6_threadId;
  int32_T c6_i6;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_i6 = (int32_T)c6_threadId;
  if (c6_i6 < 128) {
    c6_r->Name[c6_i5].Data[c6_i6] = c6_b_msg->Name[c6_i5].Data[c6_i6];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c6_sf_gateway_c6_sliding_controller2_kernel6
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg,
   c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_r)
{
  uint64_T c6_threadId;
  int32_T c6_i7;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_i7 = (int32_T)c6_threadId;
  if (c6_i7 < 7) {
    c6_r->Position[c6_i7] = c6_b_msg->Position[c6_i7];
    c6_r->Velocity[c6_i7] = c6_b_msg->Velocity[c6_i7];
    c6_r->Effort[c6_i7] = c6_b_msg->Effort[c6_i7];
  }
}

static __global__ __launch_bounds__(128, 1) void
  c6_sf_gateway_c6_sliding_controller2_kernel7(const
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_r,
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg)
{
  uint64_T c6_threadId;
  int32_T c6_i8;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_i8 = (int32_T)c6_threadId;
  if (c6_i8 < 128) {
    c6_b_msg->Header.FrameId[c6_i8] = c6_r->Header.FrameId[c6_i8];
  }
}

static __global__ __launch_bounds__(128, 1) void
  c6_sf_gateway_c6_sliding_controller2_kernel8(const
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_r, const int32_T
  c6_i9, c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg)
{
  uint64_T c6_threadId;
  int32_T c6_i10;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_i10 = (int32_T)c6_threadId;
  if (c6_i10 < 128) {
    c6_b_msg->Name[c6_i9].Data[c6_i10] = c6_r->Name[c6_i9].Data[c6_i10];
  }
}

static __global__ __launch_bounds__(32, 1) void
  c6_sf_gateway_c6_sliding_controller2_kernel9(const
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_r,
  c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_msg)
{
  uint64_T c6_threadId;
  int32_T c6_i11;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_i11 = (int32_T)c6_threadId;
  if (c6_i11 < 7) {
    c6_b_msg->Position[c6_i11] = c6_r->Position[c6_i11];
    c6_b_msg->Velocity[c6_i11] = c6_r->Velocity[c6_i11];
    c6_b_msg->Effort[c6_i11] = c6_r->Effort[c6_i11];
  }
}

static __global__ __launch_bounds__(32, 1) void c6_eML_blk_kernel_kernel10
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg)
{
  uint64_T c6_threadId;
  int32_T c6_tmpIdx;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_tmpIdx = (int32_T)c6_threadId;
  if (c6_tmpIdx < 1) {
    c6_b_blankMsg->Name_SL_Info.CurrentLength = 7U;
    c6_b_blankMsg->Effort_SL_Info.CurrentLength = 7U;
  }
}

static __global__ __launch_bounds__(32, 1) void c6_eML_blk_kernel_kernel11(const
  uint8_T c6_uv[10], c6_SL_Bus_sliding_controller2_sensor_msgs_JointState
  *c6_b_blankMsg)
{
  uint64_T c6_threadId;
  int32_T c6_i;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_i = (int32_T)c6_threadId;
  if (c6_i < 10) {
    c6_b_blankMsg->Name[0].Data[c6_i] = c6_uv[c6_i];
  }
}

static __global__ __launch_bounds__(32, 1) void c6_eML_blk_kernel_kernel12
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg)
{
  uint64_T c6_threadId;
  int32_T c6_tmpIdx;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_tmpIdx = (int32_T)c6_threadId;
  if (c6_tmpIdx < 1) {
    c6_b_blankMsg->Name[0].Data_SL_Info.CurrentLength = 10U;
  }
}

static __global__ __launch_bounds__(32, 1) void c6_eML_blk_kernel_kernel13(const
  uint8_T c6_uv1[11], c6_SL_Bus_sliding_controller2_sensor_msgs_JointState
  *c6_b_blankMsg)
{
  uint64_T c6_threadId;
  int32_T c6_i1;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_i1 = (int32_T)c6_threadId;
  if (c6_i1 < 11) {
    c6_b_blankMsg->Name[1].Data[c6_i1] = c6_uv1[c6_i1];
  }
}

static __global__ __launch_bounds__(32, 1) void c6_eML_blk_kernel_kernel14
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg)
{
  uint64_T c6_threadId;
  int32_T c6_tmpIdx;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_tmpIdx = (int32_T)c6_threadId;
  if (c6_tmpIdx < 1) {
    c6_b_blankMsg->Name[1].Data_SL_Info.CurrentLength = 11U;
  }
}

static __global__ __launch_bounds__(32, 1) void c6_eML_blk_kernel_kernel15(const
  uint8_T c6_uv2[12], c6_SL_Bus_sliding_controller2_sensor_msgs_JointState
  *c6_b_blankMsg)
{
  uint64_T c6_threadId;
  int32_T c6_i2;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_i2 = (int32_T)c6_threadId;
  if (c6_i2 < 12) {
    c6_b_blankMsg->Name[2].Data[c6_i2] = c6_uv2[c6_i2];
  }
}

static __global__ __launch_bounds__(32, 1) void c6_eML_blk_kernel_kernel16
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg)
{
  uint64_T c6_threadId;
  int32_T c6_tmpIdx;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_tmpIdx = (int32_T)c6_threadId;
  if (c6_tmpIdx < 1) {
    c6_b_blankMsg->Name[2].Data_SL_Info.CurrentLength = 12U;
  }
}

static __global__ __launch_bounds__(32, 1) void c6_eML_blk_kernel_kernel17(const
  uint8_T c6_uv3[11], c6_SL_Bus_sliding_controller2_sensor_msgs_JointState
  *c6_b_blankMsg)
{
  uint64_T c6_threadId;
  int32_T c6_i3;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_i3 = (int32_T)c6_threadId;
  if (c6_i3 < 11) {
    c6_b_blankMsg->Name[3].Data[c6_i3] = c6_uv3[c6_i3];
  }
}

static __global__ __launch_bounds__(32, 1) void c6_eML_blk_kernel_kernel18
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg)
{
  uint64_T c6_threadId;
  int32_T c6_tmpIdx;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_tmpIdx = (int32_T)c6_threadId;
  if (c6_tmpIdx < 1) {
    c6_b_blankMsg->Name[3].Data_SL_Info.CurrentLength = 11U;
  }
}

static __global__ __launch_bounds__(32, 1) void c6_eML_blk_kernel_kernel19(const
  uint8_T c6_uv4[12], c6_SL_Bus_sliding_controller2_sensor_msgs_JointState
  *c6_b_blankMsg)
{
  uint64_T c6_threadId;
  int32_T c6_i4;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_i4 = (int32_T)c6_threadId;
  if (c6_i4 < 12) {
    c6_b_blankMsg->Name[4].Data[c6_i4] = c6_uv4[c6_i4];
  }
}

static __global__ __launch_bounds__(32, 1) void c6_eML_blk_kernel_kernel20
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg)
{
  uint64_T c6_threadId;
  int32_T c6_tmpIdx;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_tmpIdx = (int32_T)c6_threadId;
  if (c6_tmpIdx < 1) {
    c6_b_blankMsg->Name[4].Data_SL_Info.CurrentLength = 12U;
  }
}

static __global__ __launch_bounds__(32, 1) void c6_eML_blk_kernel_kernel21(const
  uint8_T c6_uv5[13], c6_SL_Bus_sliding_controller2_sensor_msgs_JointState
  *c6_b_blankMsg)
{
  uint64_T c6_threadId;
  int32_T c6_i5;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_i5 = (int32_T)c6_threadId;
  if (c6_i5 < 13) {
    c6_b_blankMsg->Name[5].Data[c6_i5] = c6_uv5[c6_i5];
  }
}

static __global__ __launch_bounds__(32, 1) void c6_eML_blk_kernel_kernel22
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg)
{
  uint64_T c6_threadId;
  int32_T c6_tmpIdx;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_tmpIdx = (int32_T)c6_threadId;
  if (c6_tmpIdx < 1) {
    c6_b_blankMsg->Name[5].Data_SL_Info.CurrentLength = 13U;
  }
}

static __global__ __launch_bounds__(32, 1) void c6_eML_blk_kernel_kernel23(const
  uint8_T c6_uv6[8], c6_SL_Bus_sliding_controller2_sensor_msgs_JointState
  *c6_b_blankMsg)
{
  uint64_T c6_threadId;
  int32_T c6_i6;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_i6 = (int32_T)c6_threadId;
  if (c6_i6 < 8) {
    c6_b_blankMsg->Name[6].Data[c6_i6] = c6_uv6[c6_i6];
  }
}

static __global__ __launch_bounds__(32, 1) void c6_eML_blk_kernel_kernel24
  (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *c6_b_blankMsg)
{
  uint64_T c6_threadId;
  int32_T c6_tmpIdx;
  c6_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c6_tmpIdx = (int32_T)c6_threadId;
  if (c6_tmpIdx < 1) {
    c6_b_blankMsg->Name[6].Data_SL_Info.CurrentLength = 8U;
  }
}

static void init_dsm_address_info(SFc6_sliding_controller2InstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc6_sliding_controller2InstanceStruct
  *chartInstance)
{
  chartInstance->c6_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c6_blankMsg =
    (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *)
    ssGetInputPortSignal_wrapper(chartInstance->S, 0);
  chartInstance->c6_msg = (c6_SL_Bus_sliding_controller2_sensor_msgs_JointState *)
    ssGetOutputPortSignal_wrapper(chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c6_sliding_controller2_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(936871815U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(3255440910U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2911217935U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2629295146U);
}

mxArray *sf_c6_sliding_controller2_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c6_sliding_controller2_jit_fallback_info(void)
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

mxArray *sf_c6_sliding_controller2_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c6_sliding_controller2(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPiD+wcjAwAakOYCYiQECWKF8RqgYI1ycBS6uAMQllQWpIPHiomTPFCCdl5gL5ie"
    "WVnjmpeWDzbdgQJjPhsV8RiTzOaHiEPDBnjL9Ig4g/QZI+lmw6GdG0i8A5OUWp4PdDQsf8u1XcK"
    "BMP8T+AALuV0BxP4SfWRyfmFySWZYan2wWX5yTmZKZlx6fnJ9XUpSfk5NaZATzHwAnbh1n"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c6_sliding_controller2_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "s8raH7go15DoxtI0f9CCC6G";
}

static void sf_opaque_initialize_c6_sliding_controller2(void *chartInstanceVar)
{
  initialize_params_c6_sliding_controller2
    ((SFc6_sliding_controller2InstanceStruct*) chartInstanceVar);
  initialize_c6_sliding_controller2((SFc6_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c6_sliding_controller2(void *chartInstanceVar)
{
  enable_c6_sliding_controller2((SFc6_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c6_sliding_controller2(void *chartInstanceVar)
{
  disable_c6_sliding_controller2((SFc6_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c6_sliding_controller2(void *chartInstanceVar)
{
  sf_gateway_c6_sliding_controller2((SFc6_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c6_sliding_controller2(SimStruct*
  S)
{
  return get_sim_state_c6_sliding_controller2
    ((SFc6_sliding_controller2InstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c6_sliding_controller2(SimStruct* S, const
  mxArray *st)
{
  set_sim_state_c6_sliding_controller2((SFc6_sliding_controller2InstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_cleanup_runtime_resources_c6_sliding_controller2(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc6_sliding_controller2InstanceStruct*) chartInstanceVar
      )->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller2_optimization_info();
    }

    mdl_cleanup_runtime_resources_c6_sliding_controller2
      ((SFc6_sliding_controller2InstanceStruct*) chartInstanceVar);
    ((SFc6_sliding_controller2InstanceStruct*) chartInstanceVar)->
      ~SFc6_sliding_controller2InstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c6_sliding_controller2(void *chartInstanceVar)
{
  mdl_start_c6_sliding_controller2((SFc6_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c6_sliding_controller2(void
  *chartInstanceVar)
{
  mdl_terminate_c6_sliding_controller2((SFc6_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc6_sliding_controller2((SFc6_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c6_sliding_controller2(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c6_sliding_controller2
      ((SFc6_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc6_sliding_controller2((SFc6_sliding_controller2InstanceStruct*)
      sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c6_sliding_controller2_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u00AQdkJBIEFVISQuSPQGR0CiwAVKnQQitbTCLRyr7XoSr7LeNfuTtneQuHDlGRAvg7g",
    "BT8GRI7O2m6aO7VACFSAsue7a33w7/7PxGt01D695vO9e9Lwz+DyLd9PLrtP5ujF2Z+/nvGv5+g",
    "0KCRtvEEVi7dVegsTwFLTk1jApuqInS2FM9ECBoIhNpDJVbJrFljMx6FhBHZ9+HjEaBZG0PFxBW",
    "RKuC76PbIk1G8jTYgqo6QCEJlLS9qMOJ/2Rxsrs+hHQgbZxnQkaTGATp5Zes9ywhEN7D2hXaENQ",
    "Y32oW2CIAd/sVZrpLNXBAVDGCWdElFobER1Agg42sJWE+HfdGjSqCKMRUWYFIjIEvcoGKacUUOR",
    "kGj/sMEGMVIzwdsx9Jzip2wZHfdZkCLzGIajbigIySCQTpjr+QQctbQuyw6EFO7ZfzRbAC+uC/4",
    "zBLqhKv/V8OQRF+rAuKjdNHdLeS6M1ypJJmGExPCPqIcX4aQgrsxczRwcE4wSbKFEFg9TIrt5Ub",
    "IjurWSzcddl5rSSsXEWbD0NlrK1h1AXhRFbhwqfcK4rYZsyWYUh8JS1RQyph2Ws5TitWbgp0cEu",
    "vaurwQqGgc9hvhQhKw3XsABI+84TbCxHkdRqI2Mfk7e1ujr5eRLWFQZUj1Ao6wKKMA3os9S91Ww",
    "h0y72CEStTKpeGTjLkGkoT/esaO1KNUCf1DSRQxNcRCuBse5jLLEStjQWTR3MxXIajhIaQegaDO",
    "OwhmWD2BKfaNfaHmLdDZnZb4GmiiUlUbVYddiG2i6h9hPYEgMhd0VHyTjIe3zmXgDMNqIEE/0V7",
    "F9qv4O7l4XCzbMb3uE8O/8D8+xArvi8PsbTKOHxxp7Ffc816/dt4n+NXG55TO5CYZ+5gpzDLeD9",
    "8fP7lx+XLr969/bL7S8fWq9n2f9d83jzfz5fXzlotKPCGU7kq8M+HtNrroT/8hj/Qr7WdxV5fKc",
    "vb95uyT3TvdG75/v+0qOU71ujXt9mQd+D94uu42OWpfmpaDfMDyZuTWw2rtPz0Ji+Z6b441z+Pr",
    "u+PphN/tJyMY5l/jp1xF+nXOUeyduf339xeTb5bP+NKfovFuK9mM71beK6BWzTpW3NWYiVvk2lM",
    "EpyDurW/C+os+PKeScs97fo+V/u98f9R+bWSct5Jyw3q33Hnd9/Gr5uDngF/MIfbMes56rfjf/k",
    "He/8czVf3x/9xPEjxsOS027+GY+uvbKv/0Cefgd7CLTe",
    ""
  };

  static char newstr [1245] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c6_sliding_controller2(SimStruct *S)
{
  const char* newstr = sf_c6_sliding_controller2_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(2225789393U));
  ssSetChecksum1(S,(2232891089U));
  ssSetChecksum2(S,(903517864U));
  ssSetChecksum3(S,(2286211034U));
}

static void mdlRTW_c6_sliding_controller2(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c6_sliding_controller2(SimStruct *S)
{
  SFc6_sliding_controller2InstanceStruct *chartInstance;
  chartInstance = (SFc6_sliding_controller2InstanceStruct *)utMalloc(sizeof
    (SFc6_sliding_controller2InstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc6_sliding_controller2InstanceStruct));
  chartInstance = new (chartInstance) SFc6_sliding_controller2InstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c6_sliding_controller2;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c6_sliding_controller2;
  chartInstance->chartInfo.mdlStart = sf_opaque_mdl_start_c6_sliding_controller2;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c6_sliding_controller2;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c6_sliding_controller2;
  chartInstance->chartInfo.enableChart = sf_opaque_enable_c6_sliding_controller2;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c6_sliding_controller2;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c6_sliding_controller2;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c6_sliding_controller2;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c6_sliding_controller2;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c6_sliding_controller2;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c6_sliding_controller2;
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
    chartInstance->c6_JITStateAnimation,
    chartInstance->c6_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c6_sliding_controller2(chartInstance);
}

void c6_sliding_controller2_method_dispatcher(SimStruct *S, int_T method, void
  *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c6_sliding_controller2(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c6_sliding_controller2(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c6_sliding_controller2(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c6_sliding_controller2_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
