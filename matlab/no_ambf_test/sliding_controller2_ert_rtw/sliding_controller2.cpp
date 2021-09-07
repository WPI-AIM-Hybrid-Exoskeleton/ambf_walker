//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: sliding_controller2.cpp
//
// Code generated for Simulink model 'sliding_controller2'.
//
// Model version                  : 1.235
// Simulink Coder version         : 9.5 (R2021a) 14-Nov-2020
// C/C++ source code generated on : Tue Sep  7 08:34:51 2021
//
// Target selection: ert.tlc
// Embedded hardware selection: Generic->Unspecified (assume 32-bit Generic)
// Code generation objectives: Unspecified
// Validation result: Not run
//
#include "sliding_controller2.h"
#include "sliding_controller2_private.h"
#include "sliding_controller2_dt.h"

// Block signals (default storage)
B_sliding_controller2_T sliding_controller2_B;

// Block states (default storage)
DW_sliding_controller2_T sliding_controller2_DW;

// Real-time model
RT_MODEL_sliding_controller2_T sliding_controller2_M_ =
  RT_MODEL_sliding_controller2_T();
RT_MODEL_sliding_controller2_T *const sliding_controller2_M =
  &sliding_controller2_M_;

// Forward declaration for local functions
static void sliding_control_SystemCore_step(boolean_T *varargout_1, uint32_T
  *varargout_2_Header_Seq, real_T *varargout_2_Header_Stamp_Sec, real_T
  *varargout_2_Header_Stamp_Nsec, uint8_T varargout_2_Header_FrameId[128],
  uint32_T *varargout_2_Header_FrameId_SL_I, uint32_T
  *varargout_2_Header_FrameId_SL_0, SL_Bus_sliding_controller2_std_msgs_String
  varargout_2_Name[16], uint32_T *varargout_2_Name_SL_Info_Curren, uint32_T
  *varargout_2_Name_SL_Info_Receiv, real_T varargout_2_Position[6], uint32_T
  *varargout_2_Position_SL_Info_Cu, uint32_T *varargout_2_Position_SL_Info_Re,
  real_T varargout_2_Velocity[6], uint32_T *varargout_2_Velocity_SL_Info_Cu,
  uint32_T *varargout_2_Velocity_SL_Info_Re, real_T varargout_2_Effort[7],
  SL_Bus_ROSVariableLengthArrayInfo *varargout_2_Effort_SL_Info);
static void sliding_contr_SystemCore_step_k(boolean_T *varargout_1, uint32_T
  *varargout_2_Header_Seq, real_T *varargout_2_Header_Stamp_Sec, real_T
  *varargout_2_Header_Stamp_Nsec, uint8_T varargout_2_Header_FrameId[128],
  uint32_T *varargout_2_Header_FrameId_SL_I, uint32_T
  *varargout_2_Header_FrameId_SL_0, SL_Bus_sliding_controller2_std_msgs_String
  varargout_2_Name[16], uint32_T *varargout_2_Name_SL_Info_Curren, uint32_T
  *varargout_2_Name_SL_Info_Receiv, real_T varargout_2_Position[6], uint32_T
  *varargout_2_Position_SL_Info_Cu, uint32_T *varargout_2_Position_SL_Info_Re,
  real_T varargout_2_Velocity[6], uint32_T *varargout_2_Velocity_SL_Info_Cu,
  uint32_T *varargout_2_Velocity_SL_Info_Re, real_T varargout_2_Effort[7],
  SL_Bus_ROSVariableLengthArrayInfo *varargout_2_Effort_SL_Info);
static void sliding_control_SystemCore_step(boolean_T *varargout_1, uint32_T
  *varargout_2_Header_Seq, real_T *varargout_2_Header_Stamp_Sec, real_T
  *varargout_2_Header_Stamp_Nsec, uint8_T varargout_2_Header_FrameId[128],
  uint32_T *varargout_2_Header_FrameId_SL_I, uint32_T
  *varargout_2_Header_FrameId_SL_0, SL_Bus_sliding_controller2_std_msgs_String
  varargout_2_Name[16], uint32_T *varargout_2_Name_SL_Info_Curren, uint32_T
  *varargout_2_Name_SL_Info_Receiv, real_T varargout_2_Position[6], uint32_T
  *varargout_2_Position_SL_Info_Cu, uint32_T *varargout_2_Position_SL_Info_Re,
  real_T varargout_2_Velocity[6], uint32_T *varargout_2_Velocity_SL_Info_Cu,
  uint32_T *varargout_2_Velocity_SL_Info_Re, real_T varargout_2_Effort[7],
  SL_Bus_ROSVariableLengthArrayInfo *varargout_2_Effort_SL_Info)
{
  int32_T i;
  *varargout_1 = Sub_sliding_controller2_1262.getLatestMessage
    (&sliding_controller2_B.b_varargout_2_m);
  *varargout_2_Header_Seq = sliding_controller2_B.b_varargout_2_m.Header.Seq;
  *varargout_2_Header_Stamp_Sec =
    sliding_controller2_B.b_varargout_2_m.Header.Stamp.Sec;
  *varargout_2_Header_Stamp_Nsec =
    sliding_controller2_B.b_varargout_2_m.Header.Stamp.Nsec;
  memcpy(&varargout_2_Header_FrameId[0],
         &sliding_controller2_B.b_varargout_2_m.Header.FrameId[0], sizeof
         (uint8_T) << 7U);
  *varargout_2_Header_FrameId_SL_I =
    sliding_controller2_B.b_varargout_2_m.Header.FrameId_SL_Info.CurrentLength;
  *varargout_2_Header_FrameId_SL_0 =
    sliding_controller2_B.b_varargout_2_m.Header.FrameId_SL_Info.ReceivedLength;
  memcpy(&varargout_2_Name[0], &sliding_controller2_B.b_varargout_2_m.Name[0],
         sizeof(SL_Bus_sliding_controller2_std_msgs_String) << 4U);
  *varargout_2_Name_SL_Info_Curren =
    sliding_controller2_B.b_varargout_2_m.Name_SL_Info.CurrentLength;
  *varargout_2_Name_SL_Info_Receiv =
    sliding_controller2_B.b_varargout_2_m.Name_SL_Info.ReceivedLength;
  *varargout_2_Position_SL_Info_Cu =
    sliding_controller2_B.b_varargout_2_m.Position_SL_Info.CurrentLength;
  *varargout_2_Position_SL_Info_Re =
    sliding_controller2_B.b_varargout_2_m.Position_SL_Info.ReceivedLength;
  for (i = 0; i < 6; i++) {
    varargout_2_Position[i] = sliding_controller2_B.b_varargout_2_m.Position[i];
    varargout_2_Velocity[i] = sliding_controller2_B.b_varargout_2_m.Velocity[i];
  }

  *varargout_2_Velocity_SL_Info_Cu =
    sliding_controller2_B.b_varargout_2_m.Velocity_SL_Info.CurrentLength;
  *varargout_2_Velocity_SL_Info_Re =
    sliding_controller2_B.b_varargout_2_m.Velocity_SL_Info.ReceivedLength;
  for (i = 0; i < 7; i++) {
    varargout_2_Effort[i] = sliding_controller2_B.b_varargout_2_m.Effort[i];
  }

  *varargout_2_Effort_SL_Info =
    sliding_controller2_B.b_varargout_2_m.Effort_SL_Info;
}

static void sliding_contr_SystemCore_step_k(boolean_T *varargout_1, uint32_T
  *varargout_2_Header_Seq, real_T *varargout_2_Header_Stamp_Sec, real_T
  *varargout_2_Header_Stamp_Nsec, uint8_T varargout_2_Header_FrameId[128],
  uint32_T *varargout_2_Header_FrameId_SL_I, uint32_T
  *varargout_2_Header_FrameId_SL_0, SL_Bus_sliding_controller2_std_msgs_String
  varargout_2_Name[16], uint32_T *varargout_2_Name_SL_Info_Curren, uint32_T
  *varargout_2_Name_SL_Info_Receiv, real_T varargout_2_Position[6], uint32_T
  *varargout_2_Position_SL_Info_Cu, uint32_T *varargout_2_Position_SL_Info_Re,
  real_T varargout_2_Velocity[6], uint32_T *varargout_2_Velocity_SL_Info_Cu,
  uint32_T *varargout_2_Velocity_SL_Info_Re, real_T varargout_2_Effort[7],
  SL_Bus_ROSVariableLengthArrayInfo *varargout_2_Effort_SL_Info)
{
  int32_T i;
  *varargout_1 = Sub_sliding_controller2_1277.getLatestMessage
    (&sliding_controller2_B.b_varargout_2);
  *varargout_2_Header_Seq = sliding_controller2_B.b_varargout_2.Header.Seq;
  *varargout_2_Header_Stamp_Sec =
    sliding_controller2_B.b_varargout_2.Header.Stamp.Sec;
  *varargout_2_Header_Stamp_Nsec =
    sliding_controller2_B.b_varargout_2.Header.Stamp.Nsec;
  memcpy(&varargout_2_Header_FrameId[0],
         &sliding_controller2_B.b_varargout_2.Header.FrameId[0], sizeof(uint8_T)
         << 7U);
  *varargout_2_Header_FrameId_SL_I =
    sliding_controller2_B.b_varargout_2.Header.FrameId_SL_Info.CurrentLength;
  *varargout_2_Header_FrameId_SL_0 =
    sliding_controller2_B.b_varargout_2.Header.FrameId_SL_Info.ReceivedLength;
  memcpy(&varargout_2_Name[0], &sliding_controller2_B.b_varargout_2.Name[0],
         sizeof(SL_Bus_sliding_controller2_std_msgs_String) << 4U);
  *varargout_2_Name_SL_Info_Curren =
    sliding_controller2_B.b_varargout_2.Name_SL_Info.CurrentLength;
  *varargout_2_Name_SL_Info_Receiv =
    sliding_controller2_B.b_varargout_2.Name_SL_Info.ReceivedLength;
  *varargout_2_Position_SL_Info_Cu =
    sliding_controller2_B.b_varargout_2.Position_SL_Info.CurrentLength;
  *varargout_2_Position_SL_Info_Re =
    sliding_controller2_B.b_varargout_2.Position_SL_Info.ReceivedLength;
  for (i = 0; i < 6; i++) {
    varargout_2_Position[i] = sliding_controller2_B.b_varargout_2.Position[i];
    varargout_2_Velocity[i] = sliding_controller2_B.b_varargout_2.Velocity[i];
  }

  *varargout_2_Velocity_SL_Info_Cu =
    sliding_controller2_B.b_varargout_2.Velocity_SL_Info.CurrentLength;
  *varargout_2_Velocity_SL_Info_Re =
    sliding_controller2_B.b_varargout_2.Velocity_SL_Info.ReceivedLength;
  for (i = 0; i < 7; i++) {
    varargout_2_Effort[i] = sliding_controller2_B.b_varargout_2.Effort[i];
  }

  *varargout_2_Effort_SL_Info =
    sliding_controller2_B.b_varargout_2.Effort_SL_Info;
}

// Model step function
void sliding_controller2_step(void)
{
  SL_Bus_ROSVariableLengthArrayInfo b_varargout_2_Effort_SL_Info;
  SL_Bus_sliding_controller2_std_msgs_Bool b_varargout_2;
  SL_Bus_sliding_controller2_std_msgs_Bool rtb_BusAssignment2_d;
  int32_T i;
  uint32_T b_varargout_2_Header_FrameId_SL;
  uint32_T b_varargout_2_Header_FrameId__0;
  uint32_T b_varargout_2_Header_Seq;
  uint32_T b_varargout_2_Name_SL_Info_Curr;
  uint32_T b_varargout_2_Name_SL_Info_Rece;
  uint32_T b_varargout_2_Position_SL_Inf_0;
  uint32_T b_varargout_2_Position_SL_Info_;
  uint32_T b_varargout_2_Velocity_SL_Inf_0;
  uint32_T b_varargout_2_Velocity_SL_Info_;
  boolean_T b_varargout_1;
  boolean_T b_varargout_1_0;
  boolean_T rtb_LogicalOperator;
  static const uint8_T b[10] = { 76U, 101U, 102U, 116U, 69U, 120U, 111U, 72U,
    105U, 112U };

  static const uint8_T c[11] = { 76U, 101U, 102U, 116U, 69U, 120U, 111U, 75U,
    110U, 101U, 101U };

  static const uint8_T d[12] = { 76U, 101U, 102U, 116U, 69U, 120U, 111U, 65U,
    110U, 107U, 108U, 101U };

  static const uint8_T e[11] = { 82U, 105U, 103U, 104U, 116U, 69U, 120U, 111U,
    72U, 105U, 112U };

  static const uint8_T f[12] = { 82U, 105U, 103U, 104U, 116U, 69U, 120U, 111U,
    75U, 110U, 101U, 101U };

  static const uint8_T g[13] = { 82U, 105U, 103U, 104U, 116U, 69U, 120U, 111U,
    65U, 110U, 107U, 108U, 101U };

  static const uint8_T h[8] = { 67U, 114U, 117U, 116U, 99U, 104U, 101U, 115U };

  static const uint8_T b_0[12] = { 76U, 101U, 102U, 116U, 72U, 117U, 109U, 97U,
    110U, 72U, 105U, 112U };

  static const uint8_T c_0[13] = { 76U, 101U, 102U, 116U, 72U, 117U, 109U, 97U,
    110U, 75U, 110U, 101U, 101U };

  static const uint8_T d_0[14] = { 76U, 101U, 102U, 116U, 72U, 117U, 109U, 97U,
    110U, 65U, 110U, 107U, 108U, 101U };

  static const uint8_T e_0[13] = { 82U, 105U, 103U, 104U, 116U, 72U, 117U, 109U,
    97U, 110U, 72U, 105U, 112U };

  static const uint8_T f_0[14] = { 82U, 105U, 103U, 104U, 116U, 72U, 117U, 109U,
    97U, 110U, 75U, 110U, 101U, 101U };

  static const uint8_T g_0[15] = { 82U, 105U, 103U, 104U, 116U, 72U, 117U, 109U,
    97U, 110U, 65U, 110U, 107U, 108U, 101U };

  // Reset subsysRan breadcrumbs
  srClearBC(sliding_controller2_DW.Controller_SubsysRanBC);

  // Reset subsysRan breadcrumbs
  srClearBC(sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_c);

  // Reset subsysRan breadcrumbs
  srClearBC(sliding_controller2_DW.EnabledSubsystem1_SubsysRanBC);

  // Reset subsysRan breadcrumbs
  srClearBC(sliding_controller2_DW.EnabledSubsystem2_SubsysRanBC);

  // Reset subsysRan breadcrumbs
  srClearBC(sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_g);

  // Reset subsysRan breadcrumbs
  srClearBC(sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_o);

  // Reset subsysRan breadcrumbs
  srClearBC(sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_i);

  // Reset subsysRan breadcrumbs
  srClearBC(sliding_controller2_DW.EnabledSubsystem_SubsysRanBC);

  // Reset subsysRan breadcrumbs
  srClearBC(sliding_controller2_DW.IfActionSubsystem_SubsysRanBC);

  // Outputs for Atomic SubSystem: '<Root>/Subscribe'
  // MATLABSystem: '<S12>/SourceBlock' incorporates:
  //   Inport: '<S23>/In1'

  rtb_LogicalOperator = Sub_sliding_controller2_35.getLatestMessage
    (&sliding_controller2_B.b_varargout_2_c);

  // Outputs for Enabled SubSystem: '<S12>/Enabled Subsystem' incorporates:
  //   EnablePort: '<S23>/Enable'

  if (rtb_LogicalOperator) {
    sliding_controller2_B.In1_a = sliding_controller2_B.b_varargout_2_c;
    srUpdateBC(sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_g);
  }

  // End of MATLABSystem: '<S12>/SourceBlock'
  // End of Outputs for SubSystem: '<S12>/Enabled Subsystem'
  // End of Outputs for SubSystem: '<Root>/Subscribe'

  // Outputs for Atomic SubSystem: '<Root>/Subscribe1'
  // MATLABSystem: '<S13>/SourceBlock' incorporates:
  //   Inport: '<S24>/In1'
  //   Inport: '<S8>/In1'

  sliding_control_SystemCore_step(&rtb_LogicalOperator,
    &b_varargout_2_Header_Seq,
    &sliding_controller2_B.b_varargout_2_Header_Stamp_Sec,
    &sliding_controller2_B.b_varargout_2_Header_Stamp_Nsec,
    sliding_controller2_B.b_varargout_2_Header_FrameId,
    &b_varargout_2_Header_FrameId_SL, &b_varargout_2_Header_FrameId__0,
    sliding_controller2_B.b_varargout_2_Name, &b_varargout_2_Name_SL_Info_Curr,
    &b_varargout_2_Name_SL_Info_Rece,
    sliding_controller2_B.b_varargout_2_Position,
    &b_varargout_2_Position_SL_Info_, &b_varargout_2_Position_SL_Inf_0,
    sliding_controller2_B.b_varargout_2_Velocity,
    &b_varargout_2_Velocity_SL_Info_, &b_varargout_2_Velocity_SL_Inf_0,
    sliding_controller2_B.b_varargout_2_Effort, &b_varargout_2_Effort_SL_Info);

  // Outputs for Enabled SubSystem: '<Root>/Enabled Subsystem1' incorporates:
  //   EnablePort: '<S8>/Enable'

  // Outputs for Enabled SubSystem: '<S13>/Enabled Subsystem' incorporates:
  //   EnablePort: '<S24>/Enable'

  if (rtb_LogicalOperator) {
    sliding_controller2_B.In1_n.Header.Seq = b_varargout_2_Header_Seq;
    sliding_controller2_B.In1_n.Header.Stamp.Sec =
      sliding_controller2_B.b_varargout_2_Header_Stamp_Sec;
    sliding_controller2_B.In1_n.Header.Stamp.Nsec =
      sliding_controller2_B.b_varargout_2_Header_Stamp_Nsec;
    memcpy(&sliding_controller2_B.In1_n.Header.FrameId[0],
           &sliding_controller2_B.b_varargout_2_Header_FrameId[0], sizeof
           (uint8_T) << 7U);
    sliding_controller2_B.In1_n.Header.FrameId_SL_Info.CurrentLength =
      b_varargout_2_Header_FrameId_SL;
    sliding_controller2_B.In1_n.Header.FrameId_SL_Info.ReceivedLength =
      b_varargout_2_Header_FrameId__0;
    memcpy(&sliding_controller2_B.In1_n.Name[0],
           &sliding_controller2_B.b_varargout_2_Name[0], sizeof
           (SL_Bus_sliding_controller2_std_msgs_String) << 4U);
    sliding_controller2_B.In1_n.Name_SL_Info.CurrentLength =
      b_varargout_2_Name_SL_Info_Curr;
    sliding_controller2_B.In1_n.Name_SL_Info.ReceivedLength =
      b_varargout_2_Name_SL_Info_Rece;
    sliding_controller2_B.In1_n.Position_SL_Info.CurrentLength =
      b_varargout_2_Position_SL_Info_;
    sliding_controller2_B.In1_n.Position_SL_Info.ReceivedLength =
      b_varargout_2_Position_SL_Inf_0;
    for (i = 0; i < 6; i++) {
      sliding_controller2_B.In1_n.Position[i] =
        sliding_controller2_B.b_varargout_2_Position[i];
      sliding_controller2_B.In1_n.Velocity[i] =
        sliding_controller2_B.b_varargout_2_Velocity[i];
    }

    sliding_controller2_B.In1_n.Velocity_SL_Info.CurrentLength =
      b_varargout_2_Velocity_SL_Info_;
    sliding_controller2_B.In1_n.Velocity_SL_Info.ReceivedLength =
      b_varargout_2_Velocity_SL_Inf_0;
    for (i = 0; i < 7; i++) {
      sliding_controller2_B.In1_n.Effort[i] =
        sliding_controller2_B.b_varargout_2_Effort[i];
    }

    sliding_controller2_B.In1_n.Effort_SL_Info = b_varargout_2_Effort_SL_Info;
    srUpdateBC(sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_o);
    sliding_controller2_B.In1_j = sliding_controller2_B.In1_n;
    srUpdateBC(sliding_controller2_DW.EnabledSubsystem1_SubsysRanBC);
  }

  // End of Outputs for SubSystem: '<S13>/Enabled Subsystem'
  // End of Outputs for SubSystem: '<Root>/Enabled Subsystem1'
  // End of Outputs for SubSystem: '<Root>/Subscribe1'

  // Outputs for Atomic SubSystem: '<Root>/Subscribe2'
  // MATLABSystem: '<S14>/SourceBlock' incorporates:
  //   Inport: '<S25>/In1'
  //   Inport: '<S9>/In1'

  sliding_contr_SystemCore_step_k(&b_varargout_1, &b_varargout_2_Header_Seq,
    &sliding_controller2_B.b_varargout_2_Header_Stamp_Sec,
    &sliding_controller2_B.b_varargout_2_Header_Stamp_Nsec,
    sliding_controller2_B.b_varargout_2_Header_FrameId,
    &b_varargout_2_Header_FrameId_SL, &b_varargout_2_Header_FrameId__0,
    sliding_controller2_B.b_varargout_2_Name, &b_varargout_2_Name_SL_Info_Curr,
    &b_varargout_2_Name_SL_Info_Rece,
    sliding_controller2_B.b_varargout_2_Position,
    &b_varargout_2_Position_SL_Info_, &b_varargout_2_Position_SL_Inf_0,
    sliding_controller2_B.b_varargout_2_Velocity,
    &b_varargout_2_Velocity_SL_Info_, &b_varargout_2_Velocity_SL_Inf_0,
    sliding_controller2_B.b_varargout_2_Effort, &b_varargout_2_Effort_SL_Info);

  // Outputs for Enabled SubSystem: '<Root>/Enabled Subsystem2' incorporates:
  //   EnablePort: '<S9>/Enable'

  // Outputs for Enabled SubSystem: '<S14>/Enabled Subsystem' incorporates:
  //   EnablePort: '<S25>/Enable'

  if (b_varargout_1) {
    sliding_controller2_B.In1.Header.Seq = b_varargout_2_Header_Seq;
    sliding_controller2_B.In1.Header.Stamp.Sec =
      sliding_controller2_B.b_varargout_2_Header_Stamp_Sec;
    sliding_controller2_B.In1.Header.Stamp.Nsec =
      sliding_controller2_B.b_varargout_2_Header_Stamp_Nsec;
    memcpy(&sliding_controller2_B.In1.Header.FrameId[0],
           &sliding_controller2_B.b_varargout_2_Header_FrameId[0], sizeof
           (uint8_T) << 7U);
    sliding_controller2_B.In1.Header.FrameId_SL_Info.CurrentLength =
      b_varargout_2_Header_FrameId_SL;
    sliding_controller2_B.In1.Header.FrameId_SL_Info.ReceivedLength =
      b_varargout_2_Header_FrameId__0;
    memcpy(&sliding_controller2_B.In1.Name[0],
           &sliding_controller2_B.b_varargout_2_Name[0], sizeof
           (SL_Bus_sliding_controller2_std_msgs_String) << 4U);
    sliding_controller2_B.In1.Name_SL_Info.CurrentLength =
      b_varargout_2_Name_SL_Info_Curr;
    sliding_controller2_B.In1.Name_SL_Info.ReceivedLength =
      b_varargout_2_Name_SL_Info_Rece;
    sliding_controller2_B.In1.Position_SL_Info.CurrentLength =
      b_varargout_2_Position_SL_Info_;
    sliding_controller2_B.In1.Position_SL_Info.ReceivedLength =
      b_varargout_2_Position_SL_Inf_0;
    for (i = 0; i < 6; i++) {
      sliding_controller2_B.In1.Position[i] =
        sliding_controller2_B.b_varargout_2_Position[i];
      sliding_controller2_B.In1.Velocity[i] =
        sliding_controller2_B.b_varargout_2_Velocity[i];
    }

    sliding_controller2_B.In1.Velocity_SL_Info.CurrentLength =
      b_varargout_2_Velocity_SL_Info_;
    sliding_controller2_B.In1.Velocity_SL_Info.ReceivedLength =
      b_varargout_2_Velocity_SL_Inf_0;
    for (i = 0; i < 7; i++) {
      sliding_controller2_B.In1.Effort[i] =
        sliding_controller2_B.b_varargout_2_Effort[i];
    }

    sliding_controller2_B.In1.Effort_SL_Info = b_varargout_2_Effort_SL_Info;
    srUpdateBC(sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_i);
    sliding_controller2_B.In1_e = sliding_controller2_B.In1;
    srUpdateBC(sliding_controller2_DW.EnabledSubsystem2_SubsysRanBC);
  }

  // End of Outputs for SubSystem: '<S14>/Enabled Subsystem'
  // End of Outputs for SubSystem: '<Root>/Enabled Subsystem2'
  // End of Outputs for SubSystem: '<Root>/Subscribe2'

  // Outputs for Atomic SubSystem: '<Root>/Subscribe4'
  // MATLABSystem: '<S15>/SourceBlock' incorporates:
  //   Inport: '<S26>/In1'

  b_varargout_1_0 = Sub_sliding_controller2_1418.getLatestMessage(&b_varargout_2);

  // Outputs for Enabled SubSystem: '<S15>/Enabled Subsystem' incorporates:
  //   EnablePort: '<S26>/Enable'

  if (b_varargout_1_0) {
    sliding_controller2_B.In1_k = b_varargout_2;
    srUpdateBC(sliding_controller2_DW.EnabledSubsystem_SubsysRanBC);
  }

  // End of MATLABSystem: '<S15>/SourceBlock'
  // End of Outputs for SubSystem: '<S15>/Enabled Subsystem'
  // End of Outputs for SubSystem: '<Root>/Subscribe4'

  // Outputs for Atomic SubSystem: '<Root>/Subscribe2'
  // Outputs for Atomic SubSystem: '<Root>/Subscribe1'
  // Logic: '<Root>/Logical Operator' incorporates:
  //   MATLABSystem: '<S13>/SourceBlock'
  //   MATLABSystem: '<S14>/SourceBlock'

  rtb_LogicalOperator = (sliding_controller2_B.In1_k.Data && b_varargout_1 &&
    rtb_LogicalOperator);

  // End of Outputs for SubSystem: '<Root>/Subscribe1'
  // End of Outputs for SubSystem: '<Root>/Subscribe2'

  // Outputs for Enabled SubSystem: '<Root>/Controller' incorporates:
  //   EnablePort: '<S6>/Enable'

  if (rtb_LogicalOperator) {
    for (i = 0; i < 7; i++) {
      // SignalConversion generated from: '<S6>/exo tau'
      sliding_controller2_B.OutportBufferForexotau[i] = 0.0;

      // SignalConversion generated from: '<S6>/human tau'
      sliding_controller2_B.OutportBufferForhumantau[i] = 0.0;
    }

    for (i = 0; i < 6; i++) {
      // SignalConversion generated from: '<S6>/Bus Selector'
      sliding_controller2_B.Q[i] = sliding_controller2_B.In1_a.Q[i];
    }

    for (i = 0; i < 6; i++) {
      // SignalConversion generated from: '<S6>/Bus Selector'
      sliding_controller2_B.Other[i] = sliding_controller2_B.In1_a.Other[i];
    }

    for (i = 0; i < 6; i++) {
      // SignalConversion generated from: '<S6>/Bus Selector1'
      sliding_controller2_B.Position[i] = sliding_controller2_B.In1_j.Position[i];
    }

    for (i = 0; i < 6; i++) {
      // SignalConversion generated from: '<S6>/Bus Selector2'
      sliding_controller2_B.Velocity[i] = sliding_controller2_B.In1_e.Velocity[i];
    }

    // BusAssignment: '<S6>/Bus Assignment2' incorporates:
    //   Constant: '<S6>/Constant'

    rtb_BusAssignment2_d.Data = sliding_controller2_P.Constant_Value_i1;

    // Outputs for Atomic SubSystem: '<S6>/Publish1'
    // MATLABSystem: '<S20>/SinkBlock'
    Pub_sliding_controller2_1405.publish(&rtb_BusAssignment2_d);

    // End of Outputs for SubSystem: '<S6>/Publish1'
    srUpdateBC(sliding_controller2_DW.Controller_SubsysRanBC);
  }

  // End of Outputs for SubSystem: '<Root>/Controller'

  // MATLAB Function: '<Root>/exo msg' incorporates:
  //   Constant: '<S2>/Constant'

  sliding_controller2_B.msg_n = sliding_controller2_P.Constant_Value;
  sliding_controller2_B.msg_n.Name_SL_Info.CurrentLength = 7U;
  sliding_controller2_B.msg_n.Effort_SL_Info.CurrentLength = 7U;
  for (i = 0; i < 10; i++) {
    sliding_controller2_B.msg_n.Name[0].Data[i] = b[i];
  }

  sliding_controller2_B.msg_n.Name[0].Data_SL_Info.CurrentLength = 10U;
  for (i = 0; i < 11; i++) {
    sliding_controller2_B.msg_n.Name[1].Data[i] = c[i];
  }

  sliding_controller2_B.msg_n.Name[1].Data_SL_Info.CurrentLength = 11U;
  for (i = 0; i < 12; i++) {
    sliding_controller2_B.msg_n.Name[2].Data[i] = d[i];
  }

  sliding_controller2_B.msg_n.Name[2].Data_SL_Info.CurrentLength = 12U;
  for (i = 0; i < 11; i++) {
    sliding_controller2_B.msg_n.Name[3].Data[i] = e[i];
  }

  sliding_controller2_B.msg_n.Name[3].Data_SL_Info.CurrentLength = 11U;
  for (i = 0; i < 12; i++) {
    sliding_controller2_B.msg_n.Name[4].Data[i] = f[i];
  }

  sliding_controller2_B.msg_n.Name[4].Data_SL_Info.CurrentLength = 12U;
  for (i = 0; i < 13; i++) {
    sliding_controller2_B.msg_n.Name[5].Data[i] = g[i];
  }

  sliding_controller2_B.msg_n.Name[5].Data_SL_Info.CurrentLength = 13U;
  for (i = 0; i < 8; i++) {
    sliding_controller2_B.msg_n.Name[6].Data[i] = h[i];
  }

  sliding_controller2_B.msg_n.Name[6].Data_SL_Info.CurrentLength = 8U;

  // End of MATLAB Function: '<Root>/exo msg'

  // MATLAB Function: '<Root>/human msg' incorporates:
  //   Constant: '<S3>/Constant'

  sliding_controller2_B.msg = sliding_controller2_P.Constant_Value_d;
  sliding_controller2_B.msg.Name_SL_Info.CurrentLength = 6U;
  sliding_controller2_B.msg.Effort_SL_Info.CurrentLength = 6U;
  for (i = 0; i < 12; i++) {
    sliding_controller2_B.msg.Name[0].Data[i] = b_0[i];
  }

  sliding_controller2_B.msg.Name[0].Data_SL_Info.CurrentLength = 12U;
  for (i = 0; i < 13; i++) {
    sliding_controller2_B.msg.Name[1].Data[i] = c_0[i];
  }

  sliding_controller2_B.msg.Name[1].Data_SL_Info.CurrentLength = 13U;
  for (i = 0; i < 14; i++) {
    sliding_controller2_B.msg.Name[2].Data[i] = d_0[i];
  }

  sliding_controller2_B.msg.Name[2].Data_SL_Info.CurrentLength = 14U;
  for (i = 0; i < 13; i++) {
    sliding_controller2_B.msg.Name[3].Data[i] = e_0[i];
  }

  sliding_controller2_B.msg.Name[3].Data_SL_Info.CurrentLength = 13U;
  for (i = 0; i < 14; i++) {
    sliding_controller2_B.msg.Name[4].Data[i] = f_0[i];
  }

  sliding_controller2_B.msg.Name[4].Data_SL_Info.CurrentLength = 14U;
  for (i = 0; i < 15; i++) {
    sliding_controller2_B.msg.Name[5].Data[i] = g_0[i];
  }

  sliding_controller2_B.msg.Name[5].Data_SL_Info.CurrentLength = 15U;

  // End of MATLAB Function: '<Root>/human msg'

  // MATLABSystem: '<Root>/Current Time'
  currentROSTimeBus(&sliding_controller2_B.rtb_CurrentTime_p);

  // BusAssignment: '<Root>/Bus Assignment1' incorporates:
  //   Constant: '<S5>/Constant'
  //   MATLABSystem: '<Root>/Current Time'

  sliding_controller2_B.BusAssignment1_m =
    sliding_controller2_P.Constant_Value_i;
  sliding_controller2_B.BusAssignment1_m.Stamp =
    sliding_controller2_B.rtb_CurrentTime_p;

  // Outputs for Enabled SubSystem: '<Root>/Enabled Subsystem' incorporates:
  //   EnablePort: '<S7>/Enable'

  if (rtb_LogicalOperator) {
    // BusAssignment: '<S7>/Bus Assignment1'
    for (i = 0; i < 7; i++) {
      sliding_controller2_B.msg_n.Effort[i] =
        sliding_controller2_B.OutportBufferForexotau[i];
    }

    sliding_controller2_B.msg_n.Header = sliding_controller2_B.BusAssignment1_m;

    // End of BusAssignment: '<S7>/Bus Assignment1'

    // Outputs for Atomic SubSystem: '<S7>/Publish1'
    // MATLABSystem: '<S21>/SinkBlock'
    Pub_sliding_controller2_1242.publish(&sliding_controller2_B.msg_n);

    // End of Outputs for SubSystem: '<S7>/Publish1'

    // BusAssignment: '<S7>/Bus Assignment2'
    for (i = 0; i < 7; i++) {
      sliding_controller2_B.msg.Effort[i] =
        sliding_controller2_B.OutportBufferForhumantau[i];
    }

    sliding_controller2_B.msg.Header = sliding_controller2_B.BusAssignment1_m;

    // End of BusAssignment: '<S7>/Bus Assignment2'

    // Outputs for Atomic SubSystem: '<S7>/Publish2'
    // MATLABSystem: '<S22>/SinkBlock'
    Pub_sliding_controller2_1246.publish(&sliding_controller2_B.msg);

    // End of Outputs for SubSystem: '<S7>/Publish2'
    srUpdateBC(sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_c);
  }

  // End of Outputs for SubSystem: '<Root>/Enabled Subsystem'

  // BusAssignment: '<Root>/Bus Assignment' incorporates:
  //   MATLABSystem: '<Root>/Simulation Rate Control'

  // stepImpl Regulates simulation update
  sliding_controller2_B.BusAssignment_m.Data = (rtNaN);

  // Outputs for Atomic SubSystem: '<Root>/Publish'
  // MATLABSystem: '<S11>/SinkBlock'
  Pub_sliding_controller2_1177.publish(&sliding_controller2_B.BusAssignment_m);

  // End of Outputs for SubSystem: '<Root>/Publish'

  // External mode
  rtExtModeUploadCheckTrigger(2);

  {                                    // Sample time: [0.0s, 0.0s]
    rtExtModeUpload(0, (real_T)sliding_controller2_M->Timing.t[0]);
  }

  {                                    // Sample time: [0.001s, 0.0s]
    rtExtModeUpload(1, (real_T)((sliding_controller2_M->Timing.clockTick1) *
      0.001));
  }

  // signal main to stop simulation
  {                                    // Sample time: [0.0s, 0.0s]
    if ((rtmGetTFinal(sliding_controller2_M)!=-1) &&
        !((rtmGetTFinal(sliding_controller2_M)-sliding_controller2_M->Timing.t[0])
          > sliding_controller2_M->Timing.t[0] * (DBL_EPSILON))) {
      rtmSetErrorStatus(sliding_controller2_M, "Simulation finished");
    }

    if (rtmGetStopRequested(sliding_controller2_M)) {
      rtmSetErrorStatus(sliding_controller2_M, "Simulation finished");
    }
  }

  // Update absolute time for base rate
  // The "clockTick0" counts the number of times the code of this task has
  //  been executed. The absolute time is the multiplication of "clockTick0"
  //  and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
  //  overflow during the application lifespan selected.

  sliding_controller2_M->Timing.t[0] =
    ((time_T)(++sliding_controller2_M->Timing.clockTick0)) *
    sliding_controller2_M->Timing.stepSize0;

  {
    // Update absolute timer for sample time: [0.001s, 0.0s]
    // The "clockTick1" counts the number of times the code of this task has
    //  been executed. The resolution of this integer timer is 0.001, which is the step size
    //  of the task. Size of "clockTick1" ensures timer will not overflow during the
    //  application lifespan selected.

    sliding_controller2_M->Timing.clockTick1++;
  }
}

// Model initialize function
void sliding_controller2_initialize(void)
{
  // Registration code

  // initialize non-finites
  rt_InitInfAndNaN(sizeof(real_T));

  {
    // Setup solver object
    rtsiSetSimTimeStepPtr(&sliding_controller2_M->solverInfo,
                          &sliding_controller2_M->Timing.simTimeStep);
    rtsiSetTPtr(&sliding_controller2_M->solverInfo, &rtmGetTPtr
                (sliding_controller2_M));
    rtsiSetStepSizePtr(&sliding_controller2_M->solverInfo,
                       &sliding_controller2_M->Timing.stepSize0);
    rtsiSetErrorStatusPtr(&sliding_controller2_M->solverInfo,
                          (&rtmGetErrorStatus(sliding_controller2_M)));
    rtsiSetRTModelPtr(&sliding_controller2_M->solverInfo, sliding_controller2_M);
  }

  rtsiSetSimTimeStep(&sliding_controller2_M->solverInfo, MAJOR_TIME_STEP);
  rtsiSetSolverName(&sliding_controller2_M->solverInfo,"FixedStepDiscrete");
  rtmSetTPtr(sliding_controller2_M, &sliding_controller2_M->Timing.tArray[0]);
  rtmSetTFinal(sliding_controller2_M, -1);
  sliding_controller2_M->Timing.stepSize0 = 0.001;

  // External mode info
  sliding_controller2_M->Sizes.checksums[0] = (740940093U);
  sliding_controller2_M->Sizes.checksums[1] = (3379681156U);
  sliding_controller2_M->Sizes.checksums[2] = (73170083U);
  sliding_controller2_M->Sizes.checksums[3] = (3394592775U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[42];
    sliding_controller2_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = &rtAlwaysEnabled;
    systemRan[2] = &rtAlwaysEnabled;
    systemRan[3] = &rtAlwaysEnabled;
    systemRan[4] = &rtAlwaysEnabled;
    systemRan[5] = &rtAlwaysEnabled;
    systemRan[6] = (sysRanDType *)&sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[7] = (sysRanDType *)&sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[8] = (sysRanDType *)&sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[9] = (sysRanDType *)&sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[10] = &rtAlwaysEnabled;
    systemRan[11] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_c;
    systemRan[12] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_c;
    systemRan[13] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_c;
    systemRan[14] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_c;
    systemRan[15] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_c;
    systemRan[16] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem1_SubsysRanBC;
    systemRan[17] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem2_SubsysRanBC;
    systemRan[18] = &rtAlwaysEnabled;
    systemRan[19] = &rtAlwaysEnabled;
    systemRan[20] = &rtAlwaysEnabled;
    systemRan[21] = &rtAlwaysEnabled;
    systemRan[22] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_g;
    systemRan[23] = &rtAlwaysEnabled;
    systemRan[24] = &rtAlwaysEnabled;
    systemRan[25] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_o;
    systemRan[26] = &rtAlwaysEnabled;
    systemRan[27] = &rtAlwaysEnabled;
    systemRan[28] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_i;
    systemRan[29] = &rtAlwaysEnabled;
    systemRan[30] = &rtAlwaysEnabled;
    systemRan[31] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem_SubsysRanBC;
    systemRan[32] = &rtAlwaysEnabled;
    systemRan[33] = &rtAlwaysEnabled;
    systemRan[34] = (sysRanDType *)
      &sliding_controller2_DW.IfActionSubsystem_SubsysRanBC;
    systemRan[35] = (sysRanDType *)
      &sliding_controller2_DW.IfActionSubsystem_SubsysRanBC;
    systemRan[36] = (sysRanDType *)
      &sliding_controller2_DW.IfActionSubsystem_SubsysRanBC;
    systemRan[37] = (sysRanDType *)
      &sliding_controller2_DW.IfActionSubsystem_SubsysRanBC;
    systemRan[38] = (sysRanDType *)
      &sliding_controller2_DW.IfActionSubsystem_SubsysRanBC;
    systemRan[39] = (sysRanDType *)
      &sliding_controller2_DW.IfActionSubsystem_SubsysRanBC;
    systemRan[40] = &rtAlwaysEnabled;
    systemRan[41] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(sliding_controller2_M->extModeInfo,
      &sliding_controller2_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(sliding_controller2_M->extModeInfo,
                        sliding_controller2_M->Sizes.checksums);
    rteiSetTPtr(sliding_controller2_M->extModeInfo, rtmGetTPtr
                (sliding_controller2_M));
  }

  // data type transition information
  {
    static DataTypeTransInfo dtInfo;
    sliding_controller2_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 30;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    // Block I/O transition table
    dtInfo.BTransTable = &rtBTransTable;

    // Parameters transition table
    dtInfo.PTransTable = &rtPTransTable;
  }

  {
    int32_T i;
    char_T b_zeroDelimTopic[16];
    char_T b_zeroDelimTopic_0[11];
    char_T b_zeroDelimTopic_2[10];
    char_T b_zeroDelimTopic_1[9];
    static const char_T tmp[23] = { '/', 'e', 'x', 'o', 's', 'i', 'm', 'u', 'l',
      'i', 'n', 'k', '_', 's', 'e', 't', '_', 'p', 'o', 'i', 'n', 't', 's' };

    static const char_T tmp_0[15] = { '/', 'e', 'x', 'o', '_', 'j', 'o', 'i',
      'n', 't', 's', 't', 'a', 't', 'e' };

    static const char_T tmp_1[17] = { '/', 'h', 'u', 'm', 'a', 'n', '_', 'j',
      'o', 'i', 'n', 't', 's', 't', 'a', 't', 'e' };

    static const char_T tmp_2[10] = { '/', 's', 't', 'a', 'r', 't', '_', 's',
      'i', 'm' };

    static const char_T tmp_3[9] = { '/', 'm', 'y', '_', 't', 'o', 'p', 'i', 'c'
    };

    static const char_T tmp_4[20] = { '/', 'e', 'x', 'o', '_', 's', 'i', 'm',
      'u', 'l', 'i', 'n', 'k', '_', 't', 'o', 'r', 'q', 'u', 'e' };

    static const char_T tmp_5[22] = { '/', 'h', 'u', 'm', 'a', 'n', '_', 's',
      'i', 'm', 'u', 'l', 'i', 'n', 'k', '_', 't', 'o', 'r', 'q', 'u', 'e' };

    static const char_T tmp_6[8] = { '/', 'm', 'y', '_', 't', 'i', 'm', 'e' };

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe'
    // SystemInitialize for Enabled SubSystem: '<S12>/Enabled Subsystem'
    // SystemInitialize for Outport: '<S23>/Out1' incorporates:
    //   Inport: '<S23>/In1'

    sliding_controller2_B.In1_a = sliding_controller2_P.Out1_Y0_i;

    // End of SystemInitialize for SubSystem: '<S12>/Enabled Subsystem'

    // Start for MATLABSystem: '<S12>/SourceBlock'
    sliding_controller2_DW.obj_g.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_g.isInitialized = 1;
    for (i = 0; i < 23; i++) {
      sliding_controller2_B.b_zeroDelimTopic[i] = tmp[i];
    }

    sliding_controller2_B.b_zeroDelimTopic[23] = '\x00';
    Sub_sliding_controller2_35.createSubscriber
      (&sliding_controller2_B.b_zeroDelimTopic[0], 1);
    sliding_controller2_DW.obj_g.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S12>/SourceBlock'
    // End of SystemInitialize for SubSystem: '<Root>/Subscribe'

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe1'
    // SystemInitialize for Enabled SubSystem: '<S13>/Enabled Subsystem'
    // SystemInitialize for Outport: '<S24>/Out1' incorporates:
    //   Inport: '<S24>/In1'

    sliding_controller2_B.In1_n = sliding_controller2_P.Out1_Y0;

    // End of SystemInitialize for SubSystem: '<S13>/Enabled Subsystem'

    // Start for MATLABSystem: '<S13>/SourceBlock'
    sliding_controller2_DW.obj_cg.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_cg.isInitialized = 1;
    for (i = 0; i < 15; i++) {
      b_zeroDelimTopic[i] = tmp_0[i];
    }

    b_zeroDelimTopic[15] = '\x00';
    Sub_sliding_controller2_1262.createSubscriber(&b_zeroDelimTopic[0], 1);
    sliding_controller2_DW.obj_cg.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S13>/SourceBlock'
    // End of SystemInitialize for SubSystem: '<Root>/Subscribe1'

    // SystemInitialize for Enabled SubSystem: '<Root>/Enabled Subsystem1'
    // SystemInitialize for Outport: '<S8>/exo' incorporates:
    //   Inport: '<S8>/In1'

    sliding_controller2_B.In1_j = sliding_controller2_P.exo_Y0;

    // End of SystemInitialize for SubSystem: '<Root>/Enabled Subsystem1'

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe2'
    // SystemInitialize for Enabled SubSystem: '<S14>/Enabled Subsystem'
    // SystemInitialize for Outport: '<S25>/Out1' incorporates:
    //   Inport: '<S25>/In1'

    sliding_controller2_B.In1 = sliding_controller2_P.Out1_Y0_f;

    // End of SystemInitialize for SubSystem: '<S14>/Enabled Subsystem'

    // Start for MATLABSystem: '<S14>/SourceBlock'
    sliding_controller2_DW.obj_h.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_h.isInitialized = 1;
    for (i = 0; i < 17; i++) {
      sliding_controller2_B.b_zeroDelimTopic_b[i] = tmp_1[i];
    }

    sliding_controller2_B.b_zeroDelimTopic_b[17] = '\x00';
    Sub_sliding_controller2_1277.createSubscriber
      (&sliding_controller2_B.b_zeroDelimTopic_b[0], 1);
    sliding_controller2_DW.obj_h.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S14>/SourceBlock'
    // End of SystemInitialize for SubSystem: '<Root>/Subscribe2'

    // SystemInitialize for Enabled SubSystem: '<Root>/Enabled Subsystem2'
    // SystemInitialize for Outport: '<S9>/human' incorporates:
    //   Inport: '<S9>/In1'

    sliding_controller2_B.In1_e = sliding_controller2_P.human_Y0;

    // End of SystemInitialize for SubSystem: '<Root>/Enabled Subsystem2'

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe4'
    // SystemInitialize for Enabled SubSystem: '<S15>/Enabled Subsystem'
    // SystemInitialize for Outport: '<S26>/Out1' incorporates:
    //   Inport: '<S26>/In1'

    sliding_controller2_B.In1_k = sliding_controller2_P.Out1_Y0_d;

    // End of SystemInitialize for SubSystem: '<S15>/Enabled Subsystem'

    // Start for MATLABSystem: '<S15>/SourceBlock'
    sliding_controller2_DW.obj_c.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_c.isInitialized = 1;
    for (i = 0; i < 10; i++) {
      b_zeroDelimTopic_0[i] = tmp_2[i];
    }

    b_zeroDelimTopic_0[10] = '\x00';
    Sub_sliding_controller2_1418.createSubscriber(&b_zeroDelimTopic_0[0], 1);
    sliding_controller2_DW.obj_c.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S15>/SourceBlock'
    // End of SystemInitialize for SubSystem: '<Root>/Subscribe4'
    // SystemInitialize for Atomic SubSystem: '<S6>/Publish1'
    // Start for MATLABSystem: '<S20>/SinkBlock'
    sliding_controller2_DW.obj_o.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_o.isInitialized = 1;
    for (i = 0; i < 9; i++) {
      b_zeroDelimTopic_2[i] = tmp_3[i];
    }

    b_zeroDelimTopic_2[9] = '\x00';
    Pub_sliding_controller2_1405.createPublisher(&b_zeroDelimTopic_2[0], 1);
    sliding_controller2_DW.obj_o.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S20>/SinkBlock'
    // End of SystemInitialize for SubSystem: '<S6>/Publish1'
    // End of SystemInitialize for SubSystem: '<Root>/Controller'

    // SystemInitialize for Enabled SubSystem: '<Root>/Enabled Subsystem'
    // SystemInitialize for Atomic SubSystem: '<S7>/Publish1'
    // Start for MATLABSystem: '<S21>/SinkBlock'
    sliding_controller2_DW.obj_n.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_n.isInitialized = 1;
    for (i = 0; i < 20; i++) {
      sliding_controller2_B.b_zeroDelimTopic_c[i] = tmp_4[i];
    }

    sliding_controller2_B.b_zeroDelimTopic_c[20] = '\x00';
    Pub_sliding_controller2_1242.createPublisher
      (&sliding_controller2_B.b_zeroDelimTopic_c[0], 1);
    sliding_controller2_DW.obj_n.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S21>/SinkBlock'
    // End of SystemInitialize for SubSystem: '<S7>/Publish1'

    // SystemInitialize for Atomic SubSystem: '<S7>/Publish2'
    // Start for MATLABSystem: '<S22>/SinkBlock'
    sliding_controller2_DW.obj_mp.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_mp.isInitialized = 1;
    for (i = 0; i < 22; i++) {
      sliding_controller2_B.b_zeroDelimTopic_k[i] = tmp_5[i];
    }

    sliding_controller2_B.b_zeroDelimTopic_k[22] = '\x00';
    Pub_sliding_controller2_1246.createPublisher
      (&sliding_controller2_B.b_zeroDelimTopic_k[0], 1);
    sliding_controller2_DW.obj_mp.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S22>/SinkBlock'
    // End of SystemInitialize for SubSystem: '<S7>/Publish2'
    // End of SystemInitialize for SubSystem: '<Root>/Enabled Subsystem'

    // SystemInitialize for Atomic SubSystem: '<Root>/Publish'
    // Start for MATLABSystem: '<S11>/SinkBlock'
    sliding_controller2_DW.obj_m.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_m.isInitialized = 1;
    for (i = 0; i < 8; i++) {
      b_zeroDelimTopic_1[i] = tmp_6[i];
    }

    b_zeroDelimTopic_1[8] = '\x00';
    Pub_sliding_controller2_1177.createPublisher(&b_zeroDelimTopic_1[0], 1);
    sliding_controller2_DW.obj_m.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S11>/SinkBlock'
    // End of SystemInitialize for SubSystem: '<Root>/Publish'

    // SystemInitialize for IfAction SubSystem: '<S16>/If Action Subsystem'
    // SystemInitialize for Atomic SubSystem: '<S27>/Call Service'
    // Start for MATLABSystem: '<S29>/ServiceCaller'
    sliding_controller2_DW.obj_b.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_b.isInitialized = 1;
    sliding_controller2_DW.obj_b.isSetupComplete = true;

    // End of SystemInitialize for SubSystem: '<S27>/Call Service'

    // SystemInitialize for Atomic SubSystem: '<S27>/Call Service1'
    // Start for MATLABSystem: '<S30>/ServiceCaller'
    sliding_controller2_DW.obj_i.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_i.isInitialized = 1;
    sliding_controller2_DW.obj_i.isSetupComplete = true;

    // End of SystemInitialize for SubSystem: '<S27>/Call Service1'
    // End of SystemInitialize for SubSystem: '<S16>/If Action Subsystem'

    // Start for MATLABSystem: '<Root>/Current Time'
    sliding_controller2_DW.obj.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj.isInitialized = 1;
    sliding_controller2_DW.obj.isSetupComplete = true;

    // set.SampleTime setter for SampleTime
    // setupImpl Implement tasks that need to be performed only once,
    //  such as pre-computed constants.
    // resetImpl Initialize discrete-state properties.
  }
}

// Model terminate function
void sliding_controller2_terminate(void)
{
  // Terminate for Atomic SubSystem: '<Root>/Subscribe'
  // Terminate for MATLABSystem: '<S12>/SourceBlock'
  if (!sliding_controller2_DW.obj_g.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_g.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S12>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe'

  // Terminate for Atomic SubSystem: '<Root>/Subscribe1'
  // Terminate for MATLABSystem: '<S13>/SourceBlock'
  if (!sliding_controller2_DW.obj_cg.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_cg.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S13>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe1'

  // Terminate for Atomic SubSystem: '<Root>/Subscribe2'
  // Terminate for MATLABSystem: '<S14>/SourceBlock'
  if (!sliding_controller2_DW.obj_h.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_h.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S14>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe2'

  // Terminate for Atomic SubSystem: '<Root>/Subscribe4'
  // Terminate for MATLABSystem: '<S15>/SourceBlock'
  if (!sliding_controller2_DW.obj_c.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_c.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S15>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe4'

  // Terminate for Enabled SubSystem: '<Root>/Controller'
  // Terminate for Atomic SubSystem: '<S6>/Publish1'
  // Terminate for MATLABSystem: '<S20>/SinkBlock'
  if (!sliding_controller2_DW.obj_o.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_o.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S20>/SinkBlock'
  // End of Terminate for SubSystem: '<S6>/Publish1'
  // End of Terminate for SubSystem: '<Root>/Controller'

  // Terminate for MATLABSystem: '<Root>/Current Time'
  if (!sliding_controller2_DW.obj.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<Root>/Current Time'

  // Terminate for Enabled SubSystem: '<Root>/Enabled Subsystem'
  // Terminate for Atomic SubSystem: '<S7>/Publish1'
  // Terminate for MATLABSystem: '<S21>/SinkBlock'
  if (!sliding_controller2_DW.obj_n.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_n.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S21>/SinkBlock'
  // End of Terminate for SubSystem: '<S7>/Publish1'

  // Terminate for Atomic SubSystem: '<S7>/Publish2'
  // Terminate for MATLABSystem: '<S22>/SinkBlock'
  if (!sliding_controller2_DW.obj_mp.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_mp.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S22>/SinkBlock'
  // End of Terminate for SubSystem: '<S7>/Publish2'
  // End of Terminate for SubSystem: '<Root>/Enabled Subsystem'

  // Terminate for Atomic SubSystem: '<Root>/Publish'
  // Terminate for MATLABSystem: '<S11>/SinkBlock'
  if (!sliding_controller2_DW.obj_m.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_m.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S11>/SinkBlock'
  // End of Terminate for SubSystem: '<Root>/Publish'

  // Terminate for IfAction SubSystem: '<S16>/If Action Subsystem'
  // Terminate for Atomic SubSystem: '<S27>/Call Service'
  // Terminate for MATLABSystem: '<S29>/ServiceCaller'
  if (!sliding_controller2_DW.obj_b.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_b.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S29>/ServiceCaller'
  // End of Terminate for SubSystem: '<S27>/Call Service'

  // Terminate for Atomic SubSystem: '<S27>/Call Service1'
  // Terminate for MATLABSystem: '<S30>/ServiceCaller'
  if (!sliding_controller2_DW.obj_i.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_i.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S30>/ServiceCaller'
  // End of Terminate for SubSystem: '<S27>/Call Service1'
  // End of Terminate for SubSystem: '<S16>/If Action Subsystem'
}

//
// File trailer for generated code.
//
// [EOF]
//
