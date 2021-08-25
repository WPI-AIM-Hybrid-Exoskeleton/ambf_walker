//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: simple_PD.cpp
//
// Code generated for Simulink model 'simple_PD'.
//
// Model version                  : 1.11
// Simulink Coder version         : 9.5 (R2021a) 14-Nov-2020
// C/C++ source code generated on : Sun Aug 22 14:20:24 2021
//
// Target selection: ert.tlc
// Embedded hardware selection: Generic->Unspecified (assume 32-bit Generic)
// Code generation objectives: Unspecified
// Validation result: Not run
//
#include "simple_PD.h"
#include "simple_PD_private.h"

// Block signals (default storage)
B_simple_PD_T simple_PD_B;

// Block states (default storage)
DW_simple_PD_T simple_PD_DW;

// Real-time model
RT_MODEL_simple_PD_T simple_PD_M_ = RT_MODEL_simple_PD_T();
RT_MODEL_simple_PD_T *const simple_PD_M = &simple_PD_M_;

// Forward declaration for local functions
static void simple_PD_SystemCore_step(boolean_T *varargout_1, uint32_T
  *varargout_2_Header_Seq, real_T *varargout_2_Header_Stamp_Sec, real_T
  *varargout_2_Header_Stamp_Nsec, uint8_T varargout_2_Header_FrameId[128],
  uint32_T *varargout_2_Header_FrameId_SL_I, uint32_T
  *varargout_2_Header_FrameId_SL_0, SL_Bus_simple_PD_std_msgs_String
  varargout_2_Name[16], uint32_T *varargout_2_Name_SL_Info_Curren, uint32_T
  *varargout_2_Name_SL_Info_Receiv, real_T varargout_2_Position[7], uint32_T
  *varargout_2_Position_SL_Info_Cu, uint32_T *varargout_2_Position_SL_Info_Re,
  real_T varargout_2_Velocity[7], uint32_T *varargout_2_Velocity_SL_Info_Cu,
  uint32_T *varargout_2_Velocity_SL_Info_Re, real_T varargout_2_Effort[7],
  SL_Bus_ROSVariableLengthArrayInfo *varargout_2_Effort_SL_Info);
static void simple_PD_SystemCore_step(boolean_T *varargout_1, uint32_T
  *varargout_2_Header_Seq, real_T *varargout_2_Header_Stamp_Sec, real_T
  *varargout_2_Header_Stamp_Nsec, uint8_T varargout_2_Header_FrameId[128],
  uint32_T *varargout_2_Header_FrameId_SL_I, uint32_T
  *varargout_2_Header_FrameId_SL_0, SL_Bus_simple_PD_std_msgs_String
  varargout_2_Name[16], uint32_T *varargout_2_Name_SL_Info_Curren, uint32_T
  *varargout_2_Name_SL_Info_Receiv, real_T varargout_2_Position[7], uint32_T
  *varargout_2_Position_SL_Info_Cu, uint32_T *varargout_2_Position_SL_Info_Re,
  real_T varargout_2_Velocity[7], uint32_T *varargout_2_Velocity_SL_Info_Cu,
  uint32_T *varargout_2_Velocity_SL_Info_Re, real_T varargout_2_Effort[7],
  SL_Bus_ROSVariableLengthArrayInfo *varargout_2_Effort_SL_Info)
{
  int32_T i;
  *varargout_1 = Sub_simple_PD_32.getLatestMessage(&simple_PD_B.b_varargout_2);
  *varargout_2_Header_Seq = simple_PD_B.b_varargout_2.Header.Seq;
  *varargout_2_Header_Stamp_Sec = simple_PD_B.b_varargout_2.Header.Stamp.Sec;
  *varargout_2_Header_Stamp_Nsec = simple_PD_B.b_varargout_2.Header.Stamp.Nsec;
  memcpy(&varargout_2_Header_FrameId[0],
         &simple_PD_B.b_varargout_2.Header.FrameId[0], sizeof(uint8_T) << 7U);
  *varargout_2_Header_FrameId_SL_I =
    simple_PD_B.b_varargout_2.Header.FrameId_SL_Info.CurrentLength;
  *varargout_2_Header_FrameId_SL_0 =
    simple_PD_B.b_varargout_2.Header.FrameId_SL_Info.ReceivedLength;
  memcpy(&varargout_2_Name[0], &simple_PD_B.b_varargout_2.Name[0], sizeof
         (SL_Bus_simple_PD_std_msgs_String) << 4U);
  *varargout_2_Name_SL_Info_Curren =
    simple_PD_B.b_varargout_2.Name_SL_Info.CurrentLength;
  *varargout_2_Name_SL_Info_Receiv =
    simple_PD_B.b_varargout_2.Name_SL_Info.ReceivedLength;
  *varargout_2_Position_SL_Info_Cu =
    simple_PD_B.b_varargout_2.Position_SL_Info.CurrentLength;
  *varargout_2_Position_SL_Info_Re =
    simple_PD_B.b_varargout_2.Position_SL_Info.ReceivedLength;
  *varargout_2_Velocity_SL_Info_Cu =
    simple_PD_B.b_varargout_2.Velocity_SL_Info.CurrentLength;
  *varargout_2_Velocity_SL_Info_Re =
    simple_PD_B.b_varargout_2.Velocity_SL_Info.ReceivedLength;
  for (i = 0; i < 7; i++) {
    varargout_2_Position[i] = simple_PD_B.b_varargout_2.Position[i];
    varargout_2_Velocity[i] = simple_PD_B.b_varargout_2.Velocity[i];
    varargout_2_Effort[i] = simple_PD_B.b_varargout_2.Effort[i];
  }

  *varargout_2_Effort_SL_Info = simple_PD_B.b_varargout_2.Effort_SL_Info;
}

// Model step function
void simple_PD_step(void)
{
  SL_Bus_simple_PD_std_msgs_Bool rtb_BusAssignment2;
  int32_T i;
  int32_T i_0;
  int32_T i_1;
  int32_T tmp;
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

  static const uint8_T c_0[8] = { 76U, 101U, 102U, 116U, 75U, 110U, 101U, 101U };

  static const uint8_T b_0[7] = { 76U, 101U, 102U, 116U, 72U, 105U, 112U };

  static const uint8_T d_0[9] = { 76U, 101U, 102U, 116U, 65U, 110U, 107U, 108U,
    101U };

  static const uint8_T e_0[8] = { 82U, 105U, 103U, 104U, 116U, 72U, 105U, 112U };

  static const uint8_T f_0[9] = { 82U, 105U, 103U, 104U, 116U, 75U, 110U, 101U,
    101U };

  static const uint8_T g_0[10] = { 82U, 105U, 103U, 104U, 116U, 65U, 110U, 107U,
    108U, 101U };

  static const uint8_T h_0[6] = { 98U, 108U, 97U, 110U, 99U, 107U };

  // Outputs for Atomic SubSystem: '<Root>/Subscribe1'
  // MATLABSystem: '<S6>/SourceBlock' incorporates:
  //   Inport: '<S18>/In1'

  simple_PD_SystemCore_step(&b_varargout_1, &b_varargout_2_Header_Seq,
    &simple_PD_B.b_varargout_2_Header_Stamp_Sec,
    &simple_PD_B.b_varargout_2_Header_Stamp_Nsec,
    simple_PD_B.b_varargout_2_Header_FrameId, &b_varargout_2_Header_FrameId_SL,
    &b_varargout_2_Header_FrameId__0, simple_PD_B.b_varargout_2_Name,
    &b_varargout_2_Name_SL_Info_Curr, &b_varargout_2_Name_SL_Info_Rece,
    simple_PD_B.b_varargout_2_Position, &b_varargout_2_Position_SL_Info_,
    &b_varargout_2_Position_SL_Inf_0, simple_PD_B.b_varargout_2_Velocity,
    &b_varargout_2_Velocity_SL_Info_, &b_varargout_2_Velocity_SL_Inf_0,
    simple_PD_B.b_varargout_2_Effort, &simple_PD_B.b_varargout_2_Effort_SL_Info);

  // Outputs for Enabled SubSystem: '<Root>/Controller' incorporates:
  //   EnablePort: '<S3>/Enable'

  // Outputs for Enabled SubSystem: '<Root>/Enabled Subsystem1' incorporates:
  //   EnablePort: '<S5>/Enable'

  // Outputs for Enabled SubSystem: '<S6>/Enabled Subsystem' incorporates:
  //   EnablePort: '<S18>/Enable'

  if (b_varargout_1) {
    simple_PD_B.In1.Header.Seq = b_varargout_2_Header_Seq;
    simple_PD_B.In1.Header.Stamp.Sec =
      simple_PD_B.b_varargout_2_Header_Stamp_Sec;
    simple_PD_B.In1.Header.Stamp.Nsec =
      simple_PD_B.b_varargout_2_Header_Stamp_Nsec;
    memcpy(&simple_PD_B.In1.Header.FrameId[0],
           &simple_PD_B.b_varargout_2_Header_FrameId[0], sizeof(uint8_T) << 7U);
    simple_PD_B.In1.Header.FrameId_SL_Info.CurrentLength =
      b_varargout_2_Header_FrameId_SL;
    simple_PD_B.In1.Header.FrameId_SL_Info.ReceivedLength =
      b_varargout_2_Header_FrameId__0;
    memcpy(&simple_PD_B.In1.Name[0], &simple_PD_B.b_varargout_2_Name[0], sizeof
           (SL_Bus_simple_PD_std_msgs_String) << 4U);
    simple_PD_B.In1.Name_SL_Info.CurrentLength = b_varargout_2_Name_SL_Info_Curr;
    simple_PD_B.In1.Name_SL_Info.ReceivedLength =
      b_varargout_2_Name_SL_Info_Rece;
    simple_PD_B.In1.Position_SL_Info.CurrentLength =
      b_varargout_2_Position_SL_Info_;
    simple_PD_B.In1.Position_SL_Info.ReceivedLength =
      b_varargout_2_Position_SL_Inf_0;
    simple_PD_B.In1.Velocity_SL_Info.CurrentLength =
      b_varargout_2_Velocity_SL_Info_;
    simple_PD_B.In1.Velocity_SL_Info.ReceivedLength =
      b_varargout_2_Velocity_SL_Inf_0;
    simple_PD_B.In1.Effort_SL_Info = simple_PD_B.b_varargout_2_Effort_SL_Info;

    // BusAssignment: '<S3>/Bus Assignment3' incorporates:
    //   Constant: '<S9>/Constant'
    //   Inport: '<S18>/In1'
    //   MATLAB Function: '<S3>/human msg'

    simple_PD_B.BusAssignment3 = simple_PD_P.Constant_Value_p;

    // MATLAB Function: '<S3>/human msg' incorporates:
    //   BusAssignment: '<S3>/Bus Assignment3'
    //   Inport: '<S18>/In1'

    simple_PD_B.BusAssignment3.Name_SL_Info.CurrentLength = 7U;
    simple_PD_B.BusAssignment3.Velocity_SL_Info.CurrentLength = 7U;
    simple_PD_B.BusAssignment3.Position_SL_Info.CurrentLength = 7U;
    simple_PD_B.BusAssignment3.Effort_SL_Info.CurrentLength = 7U;
    for (i = 0; i < 7; i++) {
      simple_PD_B.In1.Position[i] = simple_PD_B.b_varargout_2_Position[i];
      simple_PD_B.In1.Velocity[i] = simple_PD_B.b_varargout_2_Velocity[i];
      simple_PD_B.In1.Effort[i] = simple_PD_B.b_varargout_2_Effort[i];
      simple_PD_B.BusAssignment3.Name[0].Data[i] = b_0[i];
    }

    simple_PD_B.BusAssignment3.Name[0].Data_SL_Info.CurrentLength = 7U;
    for (i_0 = 0; i_0 < 8; i_0++) {
      simple_PD_B.BusAssignment3.Name[1].Data[i_0] = c_0[i_0];
    }

    simple_PD_B.BusAssignment3.Name[1].Data_SL_Info.CurrentLength = 8U;
    for (i_0 = 0; i_0 < 9; i_0++) {
      simple_PD_B.BusAssignment3.Name[2].Data[i_0] = d_0[i_0];
    }

    simple_PD_B.BusAssignment3.Name[2].Data_SL_Info.CurrentLength = 9U;
    for (i_0 = 0; i_0 < 8; i_0++) {
      simple_PD_B.BusAssignment3.Name[3].Data[i_0] = e_0[i_0];
    }

    simple_PD_B.BusAssignment3.Name[3].Data_SL_Info.CurrentLength = 8U;
    for (i_0 = 0; i_0 < 9; i_0++) {
      simple_PD_B.BusAssignment3.Name[4].Data[i_0] = f_0[i_0];
    }

    simple_PD_B.BusAssignment3.Name[4].Data_SL_Info.CurrentLength = 9U;
    for (i_0 = 0; i_0 < 10; i_0++) {
      simple_PD_B.BusAssignment3.Name[5].Data[i_0] = g_0[i_0];
    }

    simple_PD_B.BusAssignment3.Name[5].Data_SL_Info.CurrentLength = 10U;
    for (i_0 = 0; i_0 < 6; i_0++) {
      simple_PD_B.BusAssignment3.Name[6].Data[i_0] = h_0[i_0];
    }

    simple_PD_B.BusAssignment3.Name[6].Data_SL_Info.CurrentLength = 6U;
    for (i = 0; i < 7; i++) {
      // Sum: '<S13>/Sum3' incorporates:
      //   Constant: '<Root>/Constant'
      //   Inport: '<S5>/In1'
      //   SignalConversion generated from: '<S3>/Bus Selector1'

      simple_PD_B.BusAssignment3.Position[i] = simple_PD_P.Constant_Value_b[i] -
        simple_PD_B.In1.Position[i];

      // Sum: '<S13>/Sum1' incorporates:
      //   Constant: '<Root>/Constant1'
      //   Inport: '<S5>/In1'
      //   Sum: '<S13>/Sum3'

      simple_PD_B.BusAssignment3.Velocity[i] = simple_PD_P.Constant1_Value[i] -
        simple_PD_B.In1.Velocity[i];

      // Gain: '<S13>/human proportional gain' incorporates:
      //   Sum: '<S13>/Sum3'

      simple_PD_B.b_varargout_2_Position[i] = 0.0;
    }

    for (i = 0; i < 7; i++) {
      // Gain: '<S13>/human derative gain' incorporates:
      //   Gain: '<S13>/human proportional gain'

      simple_PD_B.b_varargout_2_Velocity[i] = 0.0;

      // Gain: '<S13>/human proportional gain' incorporates:
      //   Gain: '<S13>/human derative gain'

      i_0 = 0;
      for (i_1 = 0; i_1 < 7; i_1++) {
        tmp = i_0 + i;
        simple_PD_B.b_varargout_2_Position[i] += simple_PD_P.Km1[tmp] *
          simple_PD_B.BusAssignment3.Position[i_1];
        simple_PD_B.b_varargout_2_Velocity[i] += simple_PD_P.Dm1[tmp] *
          simple_PD_B.BusAssignment3.Velocity[i_1];
        i_0 += 7;
      }

      // Sum: '<S13>/Add2' incorporates:
      //   Gain: '<S13>/human proportional gain'

      simple_PD_B.filtered[i] = simple_PD_B.b_varargout_2_Position[i] +
        simple_PD_B.b_varargout_2_Velocity[i];

      // BusAssignment: '<S3>/Bus Assignment3' incorporates:
      //   Gain: '<S13>/human proportional gain'

      simple_PD_B.BusAssignment3.Effort[i] = simple_PD_B.filtered[i];
    }

    // Outputs for Atomic SubSystem: '<S3>/Publish2'
    // MATLABSystem: '<S12>/SinkBlock'
    Pub_simple_PD_190.publish(&simple_PD_B.BusAssignment3);

    // End of Outputs for SubSystem: '<S3>/Publish2'

    // BusAssignment: '<S13>/Bus Assignment' incorporates:
    //   Constant: '<S15>/Constant'
    //   DataTypeConversion: '<S13>/Data Type Conversion'
    //   Inport: '<S5>/In1'
    //   SignalConversion generated from: '<S3>/Bus Selector1'

    simple_PD_B.BusAssignment = simple_PD_P.Constant_Value_j;
    for (i = 0; i < 7; i++) {
      simple_PD_B.BusAssignment.Data[i] = static_cast<real32_T>
        (simple_PD_B.In1.Position[i]);
    }

    // End of BusAssignment: '<S13>/Bus Assignment'

    // Outputs for Atomic SubSystem: '<S13>/Publish'
    // MATLABSystem: '<S16>/SinkBlock'
    Pub_simple_PD_271.publish(&simple_PD_B.BusAssignment);

    // End of Outputs for SubSystem: '<S13>/Publish'

    // BusAssignment: '<S3>/Bus Assignment2' incorporates:
    //   Constant: '<S3>/Constant'

    rtb_BusAssignment2.Data = simple_PD_P.Constant_Value_jv;

    // Outputs for Atomic SubSystem: '<S3>/Publish1'
    // MATLABSystem: '<S11>/SinkBlock'
    Pub_simple_PD_189.publish(&rtb_BusAssignment2);

    // End of Outputs for SubSystem: '<S3>/Publish1'
  }

  // End of Outputs for SubSystem: '<S6>/Enabled Subsystem'
  // End of Outputs for SubSystem: '<Root>/Enabled Subsystem1'
  // End of Outputs for SubSystem: '<Root>/Controller'
  // End of Outputs for SubSystem: '<Root>/Subscribe1'

  // MATLAB Function: '<Root>/exo msg' incorporates:
  //   Constant: '<S1>/Constant'

  simple_PD_B.BusAssignment3 = simple_PD_P.Constant_Value;
  simple_PD_B.BusAssignment3.Name_SL_Info.CurrentLength = 7U;
  simple_PD_B.BusAssignment3.Effort_SL_Info.CurrentLength = 7U;
  for (i_0 = 0; i_0 < 10; i_0++) {
    simple_PD_B.BusAssignment3.Name[0].Data[i_0] = b[i_0];
  }

  simple_PD_B.BusAssignment3.Name[0].Data_SL_Info.CurrentLength = 10U;
  for (i_0 = 0; i_0 < 11; i_0++) {
    simple_PD_B.BusAssignment3.Name[1].Data[i_0] = c[i_0];
  }

  simple_PD_B.BusAssignment3.Name[1].Data_SL_Info.CurrentLength = 11U;
  for (i_0 = 0; i_0 < 12; i_0++) {
    simple_PD_B.BusAssignment3.Name[2].Data[i_0] = d[i_0];
  }

  simple_PD_B.BusAssignment3.Name[2].Data_SL_Info.CurrentLength = 12U;
  for (i_0 = 0; i_0 < 11; i_0++) {
    simple_PD_B.BusAssignment3.Name[3].Data[i_0] = e[i_0];
  }

  simple_PD_B.BusAssignment3.Name[3].Data_SL_Info.CurrentLength = 11U;
  for (i_0 = 0; i_0 < 12; i_0++) {
    simple_PD_B.BusAssignment3.Name[4].Data[i_0] = f[i_0];
  }

  simple_PD_B.BusAssignment3.Name[4].Data_SL_Info.CurrentLength = 12U;
  for (i_0 = 0; i_0 < 13; i_0++) {
    simple_PD_B.BusAssignment3.Name[5].Data[i_0] = g[i_0];
  }

  simple_PD_B.BusAssignment3.Name[5].Data_SL_Info.CurrentLength = 13U;
  for (i_0 = 0; i_0 < 8; i_0++) {
    simple_PD_B.BusAssignment3.Name[6].Data[i_0] = h[i_0];
  }

  simple_PD_B.BusAssignment3.Name[6].Data_SL_Info.CurrentLength = 8U;

  // End of MATLAB Function: '<Root>/exo msg'

  // MATLABSystem: '<Root>/Current Time'
  currentROSTimeBus(&simple_PD_B.rtb_CurrentTime_m);

  // BusAssignment: '<Root>/Bus Assignment1' incorporates:
  //   Constant: '<S2>/Constant'
  //   MATLABSystem: '<Root>/Current Time'

  simple_PD_B.BusAssignment1_m = simple_PD_P.Constant_Value_jz;
  simple_PD_B.BusAssignment1_m.Stamp = simple_PD_B.rtb_CurrentTime_m;

  // Outputs for Enabled SubSystem: '<Root>/Enabled Subsystem' incorporates:
  //   EnablePort: '<S4>/Enable'

  // Outputs for Atomic SubSystem: '<Root>/Subscribe1'
  // MATLABSystem: '<S6>/SourceBlock'
  if (b_varargout_1) {
    // BusAssignment: '<S4>/Bus Assignment1'
    for (i = 0; i < 7; i++) {
      simple_PD_B.BusAssignment3.Effort[i] = simple_PD_B.filtered[i];
    }

    simple_PD_B.BusAssignment3.Header = simple_PD_B.BusAssignment1_m;

    // End of BusAssignment: '<S4>/Bus Assignment1'

    // Outputs for Atomic SubSystem: '<S4>/Publish1'
    // MATLABSystem: '<S17>/SinkBlock'
    Pub_simple_PD_15.publish(&simple_PD_B.BusAssignment3);

    // End of Outputs for SubSystem: '<S4>/Publish1'
  }

  // End of Outputs for SubSystem: '<Root>/Subscribe1'
  // End of Outputs for SubSystem: '<Root>/Enabled Subsystem'

  // Outputs for Atomic SubSystem: '<Root>/Subscribe4'
  // MATLABSystem: '<S7>/SourceBlock'
  Sub_simple_PD_34.getLatestMessage(&rtb_BusAssignment2);

  // End of Outputs for SubSystem: '<Root>/Subscribe4'
  // stepImpl Regulates simulation update
}

// Model initialize function
void simple_PD_initialize(void)
{
  {
    int32_T i;
    char_T b_zeroDelimTopic[16];
    char_T b_zeroDelimTopic_1[12];
    char_T b_zeroDelimTopic_0[11];
    char_T b_zeroDelimTopic_3[10];
    char_T b_zeroDelimTopic_2[9];
    static const char_T tmp[15] = { '/', 'e', 'x', 'o', '_', 'j', 'o', 'i', 'n',
      't', 's', 't', 'a', 't', 'e' };

    static const char_T tmp_0[11] = { 'a', 'd', 'd', 'm', 'i', 't', 't', 'a',
      'n', 'c', 'e' };

    static const char_T tmp_1[8] = { 'P', 'D', '_', 'e', 'r', 'r', 'o', 'r' };

    static const char_T tmp_2[9] = { '/', 'm', 'y', '_', 't', 'o', 'p', 'i', 'c'
    };

    static const char_T tmp_3[20] = { '/', 'e', 'x', 'o', '_', 's', 'i', 'm',
      'u', 'l', 'i', 'n', 'k', '_', 't', 'o', 'r', 'q', 'u', 'e' };

    static const char_T tmp_4[10] = { '/', 's', 't', 'a', 'r', 't', '_', 's',
      'i', 'm' };

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe1'
    // SystemInitialize for Enabled SubSystem: '<S6>/Enabled Subsystem'
    // SystemInitialize for Outport: '<S18>/Out1' incorporates:
    //   Inport: '<S18>/In1'

    simple_PD_B.In1 = simple_PD_P.Out1_Y0;

    // End of SystemInitialize for SubSystem: '<S6>/Enabled Subsystem'

    // Start for MATLABSystem: '<S6>/SourceBlock'
    simple_PD_DW.obj_d.matlabCodegenIsDeleted = false;
    simple_PD_DW.obj_d.isInitialized = 1;
    for (i = 0; i < 15; i++) {
      b_zeroDelimTopic[i] = tmp[i];
    }

    b_zeroDelimTopic[15] = '\x00';
    Sub_simple_PD_32.createSubscriber(&b_zeroDelimTopic[0], 1);
    simple_PD_DW.obj_d.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S6>/SourceBlock'
    // End of SystemInitialize for SubSystem: '<Root>/Subscribe1'

    // SystemInitialize for Enabled SubSystem: '<Root>/Controller'
    // SystemInitialize for Atomic SubSystem: '<S3>/Publish2'
    // Start for MATLABSystem: '<S12>/SinkBlock'
    simple_PD_DW.obj_h.matlabCodegenIsDeleted = false;
    simple_PD_DW.obj_h.isInitialized = 1;
    for (i = 0; i < 11; i++) {
      b_zeroDelimTopic_1[i] = tmp_0[i];
    }

    b_zeroDelimTopic_1[11] = '\x00';
    Pub_simple_PD_190.createPublisher(&b_zeroDelimTopic_1[0], 1);
    simple_PD_DW.obj_h.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S12>/SinkBlock'
    // End of SystemInitialize for SubSystem: '<S3>/Publish2'

    // SystemInitialize for Atomic SubSystem: '<S13>/Publish'
    // Start for MATLABSystem: '<S16>/SinkBlock'
    simple_PD_DW.obj_o.matlabCodegenIsDeleted = false;
    simple_PD_DW.obj_o.isInitialized = 1;
    for (i = 0; i < 8; i++) {
      b_zeroDelimTopic_2[i] = tmp_1[i];
    }

    b_zeroDelimTopic_2[8] = '\x00';
    Pub_simple_PD_271.createPublisher(&b_zeroDelimTopic_2[0], 1);
    simple_PD_DW.obj_o.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S16>/SinkBlock'
    // End of SystemInitialize for SubSystem: '<S13>/Publish'

    // SystemInitialize for Atomic SubSystem: '<S3>/Publish1'
    // Start for MATLABSystem: '<S11>/SinkBlock'
    simple_PD_DW.obj_h1.matlabCodegenIsDeleted = false;
    simple_PD_DW.obj_h1.isInitialized = 1;
    for (i = 0; i < 9; i++) {
      b_zeroDelimTopic_3[i] = tmp_2[i];
    }

    b_zeroDelimTopic_3[9] = '\x00';
    Pub_simple_PD_189.createPublisher(&b_zeroDelimTopic_3[0], 1);
    simple_PD_DW.obj_h1.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S11>/SinkBlock'
    // End of SystemInitialize for SubSystem: '<S3>/Publish1'
    for (i = 0; i < 7; i++) {
      // SystemInitialize for Sum: '<S13>/Add2' incorporates:
      //   Outport: '<S3>/exo tau'

      simple_PD_B.filtered[i] = simple_PD_P.exotau_Y0;
    }

    // End of SystemInitialize for SubSystem: '<Root>/Controller'

    // SystemInitialize for Enabled SubSystem: '<Root>/Enabled Subsystem'
    // SystemInitialize for Atomic SubSystem: '<S4>/Publish1'
    // Start for MATLABSystem: '<S17>/SinkBlock'
    simple_PD_DW.obj_g.matlabCodegenIsDeleted = false;
    simple_PD_DW.obj_g.isInitialized = 1;
    for (i = 0; i < 20; i++) {
      simple_PD_B.b_zeroDelimTopic[i] = tmp_3[i];
    }

    simple_PD_B.b_zeroDelimTopic[20] = '\x00';
    Pub_simple_PD_15.createPublisher(&simple_PD_B.b_zeroDelimTopic[0], 1);
    simple_PD_DW.obj_g.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S17>/SinkBlock'
    // End of SystemInitialize for SubSystem: '<S4>/Publish1'
    // End of SystemInitialize for SubSystem: '<Root>/Enabled Subsystem'

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe4'
    // Start for MATLABSystem: '<S7>/SourceBlock'
    simple_PD_DW.obj_n.matlabCodegenIsDeleted = false;
    simple_PD_DW.obj_n.isInitialized = 1;
    for (i = 0; i < 10; i++) {
      b_zeroDelimTopic_0[i] = tmp_4[i];
    }

    b_zeroDelimTopic_0[10] = '\x00';
    Sub_simple_PD_34.createSubscriber(&b_zeroDelimTopic_0[0], 1);
    simple_PD_DW.obj_n.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S7>/SourceBlock'
    // End of SystemInitialize for SubSystem: '<Root>/Subscribe4'

    // Start for MATLABSystem: '<Root>/Current Time'
    simple_PD_DW.obj.matlabCodegenIsDeleted = false;
    simple_PD_DW.obj.isInitialized = 1;
    simple_PD_DW.obj.isSetupComplete = true;

    // set.SampleTime setter for SampleTime
    // setupImpl Implement tasks that need to be performed only once,
    //  such as pre-computed constants.
    // resetImpl Initialize discrete-state properties.
  }
}

// Model terminate function
void simple_PD_terminate(void)
{
  // Terminate for Atomic SubSystem: '<Root>/Subscribe1'
  // Terminate for MATLABSystem: '<S6>/SourceBlock'
  if (!simple_PD_DW.obj_d.matlabCodegenIsDeleted) {
    simple_PD_DW.obj_d.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S6>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe1'

  // Terminate for Enabled SubSystem: '<Root>/Controller'
  // Terminate for Atomic SubSystem: '<S3>/Publish2'
  // Terminate for MATLABSystem: '<S12>/SinkBlock'
  if (!simple_PD_DW.obj_h.matlabCodegenIsDeleted) {
    simple_PD_DW.obj_h.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S12>/SinkBlock'
  // End of Terminate for SubSystem: '<S3>/Publish2'

  // Terminate for Atomic SubSystem: '<S13>/Publish'
  // Terminate for MATLABSystem: '<S16>/SinkBlock'
  if (!simple_PD_DW.obj_o.matlabCodegenIsDeleted) {
    simple_PD_DW.obj_o.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S16>/SinkBlock'
  // End of Terminate for SubSystem: '<S13>/Publish'

  // Terminate for Atomic SubSystem: '<S3>/Publish1'
  // Terminate for MATLABSystem: '<S11>/SinkBlock'
  if (!simple_PD_DW.obj_h1.matlabCodegenIsDeleted) {
    simple_PD_DW.obj_h1.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S11>/SinkBlock'
  // End of Terminate for SubSystem: '<S3>/Publish1'
  // End of Terminate for SubSystem: '<Root>/Controller'

  // Terminate for MATLABSystem: '<Root>/Current Time'
  if (!simple_PD_DW.obj.matlabCodegenIsDeleted) {
    simple_PD_DW.obj.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<Root>/Current Time'

  // Terminate for Enabled SubSystem: '<Root>/Enabled Subsystem'
  // Terminate for Atomic SubSystem: '<S4>/Publish1'
  // Terminate for MATLABSystem: '<S17>/SinkBlock'
  if (!simple_PD_DW.obj_g.matlabCodegenIsDeleted) {
    simple_PD_DW.obj_g.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S17>/SinkBlock'
  // End of Terminate for SubSystem: '<S4>/Publish1'
  // End of Terminate for SubSystem: '<Root>/Enabled Subsystem'

  // Terminate for Atomic SubSystem: '<Root>/Subscribe4'
  // Terminate for MATLABSystem: '<S7>/SourceBlock'
  if (!simple_PD_DW.obj_n.matlabCodegenIsDeleted) {
    simple_PD_DW.obj_n.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S7>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe4'
}

//
// File trailer for generated code.
//
// [EOF]
//
