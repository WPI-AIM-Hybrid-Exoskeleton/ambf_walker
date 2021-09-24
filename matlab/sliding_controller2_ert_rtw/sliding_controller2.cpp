//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: sliding_controller2.cpp
//
// Code generated for Simulink model 'sliding_controller2'.
//
// Model version                  : 1.241
// Simulink Coder version         : 9.5 (R2021a) 14-Nov-2020
// C/C++ source code generated on : Wed Sep 22 10:27:22 2021
//
// Target selection: ert.tlc
// Embedded hardware selection: Generic->Unspecified (assume 32-bit Generic)
// Code generation objectives: Unspecified
// Validation result: Not run
//
#include "sliding_controller2.h"
#include "sliding_controller2_private.h"

// Exported block parameters
real_T Bn0[6] = { 58.746593701036218, 0.16410383281561694, 20.536021548942305,
  5.48457553040554, 0.13851216498912908, 79.802991113401646 } ;// Variable: Bn0
                                                                  //  Referenced by: '<S29>/Constant3'


real_T Bp0[6] = { 58.844076553064561, 3.3289570801148556, 5.0,
  15.315426081644212, 0.26905184384202963, 79.231999603721164 } ;// Variable: Bp0
                                                                    //  Referenced by: '<S29>/Constant2'


real_T Dm1[36] = { 101.7013888888889, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  101.7013888888889, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.9697916666666662, 0.0, 0.0,
  0.0, 0.0, 0.0, 0.0, 90.451388888888928, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  101.7013888888889, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.9562500000000012 } ;// Variable: Dm1
                                                                      //  Referenced by: '<S30>/human derative gain'


real_T Km1[36] = { 6120.1165289480969, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  2947.477314389203, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 101.7013888888889, 0.0, 0.0,
  0.0, 0.0, 0.0, 0.0, 6120.1165289481, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  2947.477314389203, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 101.7013888888889 } ;// Variable: Km1
                                                                      //  Referenced by: '<S30>/human proportional gain'


real_T Kn0[6] = { 56.749240138191531, 0.1350361480574542, 19.633413329604249,
  5.0, 3.1973368395978725, 79.931599039465411 } ;// Variable: Kn0
                                                    //  Referenced by: '<S29>/Constant1'


real_T Kp0[6] = { 5.2097074293865964, 3.2601741056625078, 5.0933179003966913,
  13.764285280125991, 3.2167483341481731, 10.015130598551972 } ;// Variable: Kp0
                                                                   //  Referenced by: '<S29>/Constant'


real_T dampener[4] = { 4.9828849689844468, 0.019933635594021309,
  0.0010709865934729718, 4.9882497221890665 } ;// Variable: dampener
                                                  //  Referenced by:
                                                  //    '<S36>/dampener left shank'
                                                  //    '<S37>/dampener left thigh'
                                                  //    '<S38>/dampener right shank'
                                                  //    '<S39>/dampener right shank'


real_T exo_sat = 30.0;                 // Variable: exo_sat
                                          //  Referenced by: '<S5>/exo sateration'

real_T invMd[36] = { 0.1, 0.0, 0.0, 0.0, 0.0, -0.0, 0.0, 0.1, 0.0, 0.0, 0.0,
  -0.0, 0.0, 0.0, 0.1, 0.0, 0.0, -0.0, 0.0, 0.0, 0.0, 0.1, 0.0, -0.0, 0.0, 0.0,
  0.0, 0.0, 0.1, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, 0.1 } ;// Variable: invMd
                                                               //  Referenced by: '<S29>/addmittance gain'


real_T lambda2[36] = { 0.02603110268879048, 0.0010112084094957324,
  0.001009726568272579, 0.0010003014940364742, 0.0010002946952867764,
  0.0010080155034459634, 0.0010003648872653529, 0.032999003451115887,
  0.0010003648872653529, 0.0010003648872653529, 0.0010053098946299595,
  0.0010022788298241856, 0.0010002966070063871, 0.0010003648872653529,
  0.025275476078416122, 0.001, 0.0010003648872653529, 0.001000563734634649,
  0.0010112084094957324, 0.0010112084094957324, 0.0010108675717832325,
  0.035650987803205185, 0.0010171945117347936, 0.0010014982162671038,
  0.0010112084094957324, 0.0010003648872653529, 0.0010003648872653529,
  0.0010112084094957324, 0.041233159195750907, 0.0010112084094957324,
  0.0010001216290884509, 0.0010014263366002474, 0.0010110846749144778,
  0.0010003009084973424, 0.0010005064294173977, 0.024002069732852228 } ;// Variable: lambda2
                                                                      //  Referenced by:
                                                                      //    '<S31>/Gain12'
                                                                      //    '<S31>/lambda SMC'


real_T rho2[36] = { 100.08537241679181, 0.0010001216290884509,
  0.0010037361364985775, 0.0010037361364985775, 0.0010037361364985775,
  0.0010037361364985775, 0.0019619089067217607, 745.51939763927646,
  0.0019741306869162575, 0.0010001216290884509, 0.0010001216290884509,
  0.0019404070545135659, 0.0010037361364985775, 0.0010001216290884509,
  144.74297754919994, 0.0010037361364985775, 0.0019735265890466012,
  0.0010037361364985775, 0.0019385605281046726, 0.0019962638635014226,
  0.0019998351963661639, 432.96362798904374, 0.0010037361364985775,
  0.0019998783709115489, 0.0010036144925610129, 0.0010037361364985775, 0.001,
  0.0010001216290884509, 792.5857098070187, 0.0010037361364985775,
  0.0010037361364985775, 0.0010037225517183371, 0.0010002432730260153,
  0.0010036987787965343, 0.0010037361364985775, 149.56124261867356 } ;// Variable: rho2
                                                                      //  Referenced by: '<S31>/rho SMC'


//
// This function updates continuous states using the ODE3 fixed-step
// solver algorithm
//
void sliding_controller2ModelClass::rt_ertODEUpdateContinuousStates
  (RTWSolverInfo *si )
{
  // Solver Matrices
  static const real_T rt_ODE3_A[3] = {
    1.0/2.0, 3.0/4.0, 1.0
  };

  static const real_T rt_ODE3_B[3][3] = {
    { 1.0/2.0, 0.0, 0.0 },

    { 0.0, 3.0/4.0, 0.0 },

    { 2.0/9.0, 1.0/3.0, 4.0/9.0 }
  };

  time_T t = rtsiGetT(si);
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE3_IntgData *id = static_cast<ODE3_IntgData *>(rtsiGetSolverData(si));
  real_T *y = id->y;
  real_T *f0 = id->f[0];
  real_T *f1 = id->f[1];
  real_T *f2 = id->f[2];
  real_T hB[3];
  int_T i;
  int_T nXc = 12;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);

  // Save the state values at time t in y, we'll use x as ynew.
  (void) memcpy(y, x,
                static_cast<uint_T>(nXc)*sizeof(real_T));

  // Assumes that rtsiSetT and ModelOutputs are up-to-date
  // f0 = f(t,y)
  rtsiSetdX(si, f0);
  sliding_controller2_derivatives();

  // f(:,2) = feval(odefile, t + hA(1), y + f*hB(:,1), args(:)(*));
  hB[0] = h * rt_ODE3_B[0][0];
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[0]);
  rtsiSetdX(si, f1);
  this->step();
  sliding_controller2_derivatives();

  // f(:,3) = feval(odefile, t + hA(2), y + f*hB(:,2), args(:)(*));
  for (i = 0; i <= 1; i++) {
    hB[i] = h * rt_ODE3_B[1][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[1]);
  rtsiSetdX(si, f2);
  this->step();
  sliding_controller2_derivatives();

  // tnew = t + hA(3);
  // ynew = y + f*hB(:,3);
  for (i = 0; i <= 2; i++) {
    hB[i] = h * rt_ODE3_B[2][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2]);
  }

  rtsiSetT(si, tnew);
  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

//
// Output and update for atomic system:
//    '<S22>/exo left'
//    '<S22>/exo right'
//    '<S22>/human left'
//    '<S22>/human right'
//
void sliding_controller2ModelClass::sliding_controller2_exoleft(const real_T
  rtu_q[2], const real_T rtu_qd[2], real_T rty_knee[2], real_T rty_dknee[2],
  real_T rty_ankle[2], real_T rty_danke[2])
{
  real_T a;
  real_T rty_knee_0;
  real_T rty_knee_1;
  real_T tmp;
  real_T tmp_0;
  tmp = cos(rtu_q[0]);
  tmp_0 = sin(rtu_q[0]);
  rty_knee[0] = -0.324 * tmp_0;
  rty_knee[1] = -0.324 * tmp;
  a = -0.324 * rtu_qd[0];
  rty_dknee[0] = a * tmp;
  rty_dknee[1] = a * -tmp_0;
  a = (rtu_qd[0] + rtu_qd[1]) * -0.39;
  rty_knee_0 = rty_knee[0];
  rty_knee_1 = rty_knee[1];
  tmp = rtu_q[0] + rtu_q[1];
  tmp_0 = sin(tmp);
  rty_ankle[0] = tmp_0 * -0.39 + rty_knee_0;
  tmp = cos(tmp);
  rty_ankle[1] = tmp * -0.39 + rty_knee_1;
  rty_knee_0 = rty_dknee[0];
  rty_knee_1 = rty_dknee[1];
  rty_danke[0] = tmp * a + rty_knee_0;
  rty_danke[1] = -tmp_0 * a + rty_knee_1;
}

//
// Output and update for atomic system:
//    '<S40>/MATLAB Function'
//    '<S41>/MATLAB Function'
//
void sliding_controller2ModelClass::sliding_controll_MATLABFunction(const real_T
  rtu_q[2], real_T rty_y[4])
{
  rty_y[0] = -0.324 * sin(rtu_q[0]);
  rty_y[2] = 0.0;
  rty_y[1] = 0.324 * cos(rtu_q[0]);
  rty_y[3] = 0.0;
}

//
// Output and update for atomic system:
//    '<S40>/MATLAB Function1'
//    '<S41>/MATLAB Function1'
//
void sliding_controller2ModelClass::sliding_control_MATLABFunction1(const real_T
  rtu_q[2], real_T rty_y[4])
{
  real_T tmp;
  real_T tmp_0;
  tmp_0 = rtu_q[0] + rtu_q[1];
  tmp = sin(tmp_0);
  rty_y[0] = -0.324 * sin(rtu_q[0]) - 0.39 * tmp;
  rty_y[2] = sin(rtu_q[0] + rtu_q[1]) * 0.39 + 0.324 * cos(rtu_q[0]);
  rty_y[1] = -0.39 * tmp;
  rty_y[3] = cos(tmp_0) * 0.39;
}

//
// Output and update for atomic system:
//    '<S5>/MATLAB Function1'
//    '<S31>/MATLAB Function1'
//    '<S31>/MATLAB Function2'
//    '<S31>/MATLAB Function3'
//
void sliding_controller2ModelClass::sliding_contr_MATLABFunction1_k(const real_T
  rtu_u[6], real_T rty_y[7])
{
  rty_y[0] = rtu_u[3];
  rty_y[1] = 0.0;
  rty_y[2] = rtu_u[0];
  rty_y[3] = rtu_u[1];
  rty_y[4] = rtu_u[4];
  rty_y[5] = rtu_u[5];
  rty_y[6] = rtu_u[2];
}

void sliding_controller2ModelClass::sliding_control_SystemCore_step(boolean_T
  *varargout_1, uint32_T *varargout_2_Header_Seq, real_T
  *varargout_2_Header_Stamp_Sec, real_T *varargout_2_Header_Stamp_Nsec, uint8_T
  varargout_2_Header_FrameId[128], uint32_T *varargout_2_Header_FrameId_SL_I,
  uint32_T *varargout_2_Header_FrameId_SL_0,
  SL_Bus_sliding_controller2_std_msgs_String varargout_2_Name[16], uint32_T
  *varargout_2_Name_SL_Info_Curren, uint32_T *varargout_2_Name_SL_Info_Receiv,
  real_T varargout_2_Position[7], uint32_T *varargout_2_Position_SL_Info_Cu,
  uint32_T *varargout_2_Position_SL_Info_Re, real_T varargout_2_Velocity[7],
  uint32_T *varargout_2_Velocity_SL_Info_Cu, uint32_T
  *varargout_2_Velocity_SL_Info_Re, real_T varargout_2_Effort[7],
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
  *varargout_2_Velocity_SL_Info_Cu =
    sliding_controller2_B.b_varargout_2_m.Velocity_SL_Info.CurrentLength;
  *varargout_2_Velocity_SL_Info_Re =
    sliding_controller2_B.b_varargout_2_m.Velocity_SL_Info.ReceivedLength;
  for (i = 0; i < 7; i++) {
    varargout_2_Position[i] = sliding_controller2_B.b_varargout_2_m.Position[i];
    varargout_2_Velocity[i] = sliding_controller2_B.b_varargout_2_m.Velocity[i];
    varargout_2_Effort[i] = sliding_controller2_B.b_varargout_2_m.Effort[i];
  }

  *varargout_2_Effort_SL_Info =
    sliding_controller2_B.b_varargout_2_m.Effort_SL_Info;
}

void sliding_controller2ModelClass::sliding_contr_SystemCore_step_k(boolean_T
  *varargout_1, uint32_T *varargout_2_Header_Seq, real_T
  *varargout_2_Header_Stamp_Sec, real_T *varargout_2_Header_Stamp_Nsec, uint8_T
  varargout_2_Header_FrameId[128], uint32_T *varargout_2_Header_FrameId_SL_I,
  uint32_T *varargout_2_Header_FrameId_SL_0,
  SL_Bus_sliding_controller2_std_msgs_String varargout_2_Name[16], uint32_T
  *varargout_2_Name_SL_Info_Curren, uint32_T *varargout_2_Name_SL_Info_Receiv,
  real_T varargout_2_Position[7], uint32_T *varargout_2_Position_SL_Info_Cu,
  uint32_T *varargout_2_Position_SL_Info_Re, real_T varargout_2_Velocity[7],
  uint32_T *varargout_2_Velocity_SL_Info_Cu, uint32_T
  *varargout_2_Velocity_SL_Info_Re, real_T varargout_2_Effort[7],
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
  *varargout_2_Velocity_SL_Info_Cu =
    sliding_controller2_B.b_varargout_2.Velocity_SL_Info.CurrentLength;
  *varargout_2_Velocity_SL_Info_Re =
    sliding_controller2_B.b_varargout_2.Velocity_SL_Info.ReceivedLength;
  for (i = 0; i < 7; i++) {
    varargout_2_Position[i] = sliding_controller2_B.b_varargout_2.Position[i];
    varargout_2_Velocity[i] = sliding_controller2_B.b_varargout_2.Velocity[i];
    varargout_2_Effort[i] = sliding_controller2_B.b_varargout_2.Effort[i];
  }

  *varargout_2_Effort_SL_Info =
    sliding_controller2_B.b_varargout_2.Effort_SL_Info;
}

// Function for MATLAB Function: '<S29>/MATLAB Function'
real_T sliding_controller2ModelClass::sliding_controller2_xnrm2(int32_T n, const
  real_T x[6], int32_T ix0)
{
  real_T y;
  int32_T k;
  int32_T kend;
  y = 0.0;
  if (n >= 1) {
    if (n == 1) {
      y = fabs(x[ix0 - 1]);
    } else {
      sliding_controller2_B.scale = 3.3121686421112381E-170;
      kend = (ix0 + n) - 1;
      for (k = ix0; k <= kend; k++) {
        sliding_controller2_B.absxk = fabs(x[k - 1]);
        if (sliding_controller2_B.absxk > sliding_controller2_B.scale) {
          sliding_controller2_B.t = sliding_controller2_B.scale /
            sliding_controller2_B.absxk;
          y = y * sliding_controller2_B.t * sliding_controller2_B.t + 1.0;
          sliding_controller2_B.scale = sliding_controller2_B.absxk;
        } else {
          sliding_controller2_B.t = sliding_controller2_B.absxk /
            sliding_controller2_B.scale;
          y += sliding_controller2_B.t * sliding_controller2_B.t;
        }
      }

      y = sliding_controller2_B.scale * sqrt(y);
    }
  }

  return y;
}

real_T rt_hypotd_snf(real_T u0, real_T u1)
{
  real_T a;
  real_T y;
  a = fabs(u0);
  y = fabs(u1);
  if (a < y) {
    a /= y;
    y *= sqrt(a * a + 1.0);
  } else if (a > y) {
    y /= a;
    y = sqrt(y * y + 1.0) * a;
  } else if (!rtIsNaN(y)) {
    y = a * 1.4142135623730951;
  }

  return y;
}

// Function for MATLAB Function: '<S29>/MATLAB Function'
void sliding_controller2ModelClass::sliding_controller2_qrpf(real_T A[6],
  int32_T ia0, int32_T m, int32_T n, real_T *tau, int32_T jpvt[6])
{
  int32_T exitg1;
  int32_T i;
  int32_T ia;
  int32_T ii_tmp;
  boolean_T exitg2;
  if (m < n) {
    sliding_controller2_B.minmn = m;
  } else {
    sliding_controller2_B.minmn = n;
  }

  for (i = 0; i < 6; i++) {
    sliding_controller2_B.work[i] = 0.0;
    sliding_controller2_B.vn1[i] = 0.0;
    sliding_controller2_B.vn2[i] = 0.0;
  }

  for (i = 0; i < n; i++) {
    sliding_controller2_B.vn1[i] = sliding_controller2_xnrm2(m, A, ia0 + i);
    sliding_controller2_B.vn2[i] = sliding_controller2_B.vn1[i];
  }

  for (i = 0; i < sliding_controller2_B.minmn; i++) {
    ii_tmp = ia0 + i;
    sliding_controller2_B.ii = (ii_tmp + i) - 1;
    sliding_controller2_B.nmi = n - i;
    sliding_controller2_B.mmi = (m - i) - 1;
    if (sliding_controller2_B.nmi < 1) {
      sliding_controller2_B.pvt = -1;
    } else {
      sliding_controller2_B.pvt = 0;
      if (sliding_controller2_B.nmi > 1) {
        sliding_controller2_B.ix = i;
        sliding_controller2_B.smax = fabs(sliding_controller2_B.vn1[i]);
        sliding_controller2_B.iy = 2;
        while (sliding_controller2_B.iy <= sliding_controller2_B.nmi) {
          sliding_controller2_B.ix++;
          sliding_controller2_B.beta1 = fabs
            (sliding_controller2_B.vn1[sliding_controller2_B.ix]);
          if (sliding_controller2_B.beta1 > sliding_controller2_B.smax) {
            sliding_controller2_B.pvt = sliding_controller2_B.iy - 1;
            sliding_controller2_B.smax = sliding_controller2_B.beta1;
          }

          sliding_controller2_B.iy++;
        }
      }
    }

    sliding_controller2_B.pvt += i;
    if (sliding_controller2_B.pvt + 1 != i + 1) {
      sliding_controller2_B.ix = (ia0 + sliding_controller2_B.pvt) - 1;
      sliding_controller2_B.iy = ii_tmp - 1;
      sliding_controller2_B.b_k = 0;
      while (sliding_controller2_B.b_k <= m - 1) {
        sliding_controller2_B.smax = A[sliding_controller2_B.ix];
        A[sliding_controller2_B.ix] = A[sliding_controller2_B.iy];
        A[sliding_controller2_B.iy] = sliding_controller2_B.smax;
        sliding_controller2_B.ix++;
        sliding_controller2_B.iy++;
        sliding_controller2_B.b_k++;
      }

      sliding_controller2_B.ix = jpvt[sliding_controller2_B.pvt];
      jpvt[sliding_controller2_B.pvt] = jpvt[i];
      jpvt[i] = sliding_controller2_B.ix;
      sliding_controller2_B.vn1[sliding_controller2_B.pvt] =
        sliding_controller2_B.vn1[i];
      sliding_controller2_B.vn2[sliding_controller2_B.pvt] =
        sliding_controller2_B.vn2[i];
    }

    if (i + 1 < m) {
      sliding_controller2_B.smax = A[sliding_controller2_B.ii];
      *tau = 0.0;
      if (sliding_controller2_B.mmi + 1 > 0) {
        sliding_controller2_B.beta1 = sliding_controller2_xnrm2
          (sliding_controller2_B.mmi, A, sliding_controller2_B.ii + 2);
        if (sliding_controller2_B.beta1 != 0.0) {
          sliding_controller2_B.beta1 = rt_hypotd_snf(A[sliding_controller2_B.ii],
            sliding_controller2_B.beta1);
          if (A[sliding_controller2_B.ii] >= 0.0) {
            sliding_controller2_B.beta1 = -sliding_controller2_B.beta1;
          }

          if (fabs(sliding_controller2_B.beta1) < 1.0020841800044864E-292) {
            sliding_controller2_B.pvt = -1;
            sliding_controller2_B.ix = (sliding_controller2_B.ii +
              sliding_controller2_B.mmi) + 1;
            do {
              sliding_controller2_B.pvt++;
              sliding_controller2_B.iy = sliding_controller2_B.ii + 1;
              while (sliding_controller2_B.iy + 1 <= sliding_controller2_B.ix) {
                A[sliding_controller2_B.iy] *= 9.9792015476736E+291;
                sliding_controller2_B.iy++;
              }

              sliding_controller2_B.beta1 *= 9.9792015476736E+291;
              sliding_controller2_B.smax *= 9.9792015476736E+291;
            } while (!(fabs(sliding_controller2_B.beta1) >=
                       1.0020841800044864E-292));

            sliding_controller2_B.beta1 = rt_hypotd_snf
              (sliding_controller2_B.smax, sliding_controller2_xnrm2
               (sliding_controller2_B.mmi, A, sliding_controller2_B.ii + 2));
            if (sliding_controller2_B.smax >= 0.0) {
              sliding_controller2_B.beta1 = -sliding_controller2_B.beta1;
            }

            *tau = (sliding_controller2_B.beta1 - sliding_controller2_B.smax) /
              sliding_controller2_B.beta1;
            sliding_controller2_B.smax = 1.0 / (sliding_controller2_B.smax -
              sliding_controller2_B.beta1);
            sliding_controller2_B.iy = sliding_controller2_B.ii + 1;
            while (sliding_controller2_B.iy + 1 <= sliding_controller2_B.ix) {
              A[sliding_controller2_B.iy] *= sliding_controller2_B.smax;
              sliding_controller2_B.iy++;
            }

            sliding_controller2_B.ix = 0;
            while (sliding_controller2_B.ix <= sliding_controller2_B.pvt) {
              sliding_controller2_B.beta1 *= 1.0020841800044864E-292;
              sliding_controller2_B.ix++;
            }

            sliding_controller2_B.smax = sliding_controller2_B.beta1;
          } else {
            *tau = (sliding_controller2_B.beta1 - A[sliding_controller2_B.ii]) /
              sliding_controller2_B.beta1;
            sliding_controller2_B.smax = 1.0 / (A[sliding_controller2_B.ii] -
              sliding_controller2_B.beta1);
            sliding_controller2_B.pvt = (sliding_controller2_B.ii +
              sliding_controller2_B.mmi) + 1;
            sliding_controller2_B.ix = sliding_controller2_B.ii + 1;
            while (sliding_controller2_B.ix + 1 <= sliding_controller2_B.pvt) {
              A[sliding_controller2_B.ix] *= sliding_controller2_B.smax;
              sliding_controller2_B.ix++;
            }

            sliding_controller2_B.smax = sliding_controller2_B.beta1;
          }
        }
      }

      A[sliding_controller2_B.ii] = sliding_controller2_B.smax;
    } else {
      *tau = 0.0;
    }

    if (i + 1 < n) {
      sliding_controller2_B.smax = A[sliding_controller2_B.ii];
      A[sliding_controller2_B.ii] = 1.0;
      if (*tau != 0.0) {
        sliding_controller2_B.pvt = sliding_controller2_B.mmi + 1;
        sliding_controller2_B.ix = sliding_controller2_B.ii +
          sliding_controller2_B.mmi;
        while ((sliding_controller2_B.pvt > 0) && (A[sliding_controller2_B.ix] ==
                0.0)) {
          sliding_controller2_B.pvt--;
          sliding_controller2_B.ix--;
        }

        sliding_controller2_B.nmi--;
        exitg2 = false;
        while ((!exitg2) && (sliding_controller2_B.nmi > 0)) {
          sliding_controller2_B.ix = (sliding_controller2_B.ii +
            sliding_controller2_B.nmi) + 1;
          sliding_controller2_B.iy = sliding_controller2_B.ix;
          do {
            exitg1 = 0;
            if (sliding_controller2_B.iy <= (sliding_controller2_B.ix +
                 sliding_controller2_B.pvt) - 1) {
              if (A[sliding_controller2_B.iy - 1] != 0.0) {
                exitg1 = 1;
              } else {
                sliding_controller2_B.iy++;
              }
            } else {
              sliding_controller2_B.nmi--;
              exitg1 = 2;
            }
          } while (exitg1 == 0);

          if (exitg1 == 1) {
            exitg2 = true;
          }
        }
      } else {
        sliding_controller2_B.pvt = 0;
        sliding_controller2_B.nmi = 0;
      }

      if (sliding_controller2_B.pvt > 0) {
        if (sliding_controller2_B.nmi != 0) {
          sliding_controller2_B.ix = 0;
          while (sliding_controller2_B.ix <= sliding_controller2_B.nmi - 1) {
            sliding_controller2_B.work[sliding_controller2_B.ix] = 0.0;
            sliding_controller2_B.ix++;
          }

          sliding_controller2_B.ix = 0;
          sliding_controller2_B.iy = (sliding_controller2_B.ii +
            sliding_controller2_B.nmi) + 1;
          sliding_controller2_B.b_k = sliding_controller2_B.ii + 2;
          while (sliding_controller2_B.b_k <= sliding_controller2_B.iy) {
            sliding_controller2_B.c_ix = sliding_controller2_B.ii;
            sliding_controller2_B.beta1 = 0.0;
            sliding_controller2_B.e = (sliding_controller2_B.b_k +
              sliding_controller2_B.pvt) - 1;
            for (ia = sliding_controller2_B.b_k; ia <= sliding_controller2_B.e;
                 ia++) {
              sliding_controller2_B.beta1 += A[ia - 1] *
                A[sliding_controller2_B.c_ix];
              sliding_controller2_B.c_ix++;
            }

            sliding_controller2_B.work[sliding_controller2_B.ix] +=
              sliding_controller2_B.beta1;
            sliding_controller2_B.ix++;
            sliding_controller2_B.b_k++;
          }
        }

        if (!(-*tau == 0.0)) {
          sliding_controller2_B.ix = sliding_controller2_B.ii + 1;
          sliding_controller2_B.iy = 0;
          sliding_controller2_B.b_k = 0;
          while (sliding_controller2_B.b_k <= sliding_controller2_B.nmi - 1) {
            if (sliding_controller2_B.work[sliding_controller2_B.iy] != 0.0) {
              sliding_controller2_B.beta1 =
                sliding_controller2_B.work[sliding_controller2_B.iy] * -*tau;
              sliding_controller2_B.c_ix = sliding_controller2_B.ii;
              sliding_controller2_B.e = sliding_controller2_B.pvt +
                sliding_controller2_B.ix;
              for (ia = sliding_controller2_B.ix; ia < sliding_controller2_B.e;
                   ia++) {
                A[ia] += A[sliding_controller2_B.c_ix] *
                  sliding_controller2_B.beta1;
                sliding_controller2_B.c_ix++;
              }
            }

            sliding_controller2_B.iy++;
            sliding_controller2_B.ix++;
            sliding_controller2_B.b_k++;
          }
        }
      }

      A[sliding_controller2_B.ii] = sliding_controller2_B.smax;
    }

    sliding_controller2_B.ii = i + 1;
    while (sliding_controller2_B.ii + 1 <= n) {
      sliding_controller2_B.pvt = ii_tmp + sliding_controller2_B.ii;
      if (sliding_controller2_B.vn1[sliding_controller2_B.ii] != 0.0) {
        sliding_controller2_B.smax = fabs(A[sliding_controller2_B.pvt - 1]) /
          sliding_controller2_B.vn1[sliding_controller2_B.ii];
        sliding_controller2_B.smax = 1.0 - sliding_controller2_B.smax *
          sliding_controller2_B.smax;
        if (sliding_controller2_B.smax < 0.0) {
          sliding_controller2_B.smax = 0.0;
        }

        sliding_controller2_B.beta1 =
          sliding_controller2_B.vn1[sliding_controller2_B.ii] /
          sliding_controller2_B.vn2[sliding_controller2_B.ii];
        sliding_controller2_B.beta1 = sliding_controller2_B.beta1 *
          sliding_controller2_B.beta1 * sliding_controller2_B.smax;
        if (sliding_controller2_B.beta1 <= 1.4901161193847656E-8) {
          if (i + 1 < m) {
            sliding_controller2_B.vn1[sliding_controller2_B.ii] =
              sliding_controller2_xnrm2(sliding_controller2_B.mmi, A,
              sliding_controller2_B.pvt + 1);
            sliding_controller2_B.vn2[sliding_controller2_B.ii] =
              sliding_controller2_B.vn1[sliding_controller2_B.ii];
          } else {
            sliding_controller2_B.vn1[sliding_controller2_B.ii] = 0.0;
            sliding_controller2_B.vn2[sliding_controller2_B.ii] = 0.0;
          }
        } else {
          sliding_controller2_B.vn1[sliding_controller2_B.ii] *= sqrt
            (sliding_controller2_B.smax);
        }
      }

      sliding_controller2_B.ii++;
    }
  }
}

boolean_T sliding_controller2ModelClass::sliding_cont_SystemCore_step_kc(void)
{
  return Sub_sliding_controller2_1779.getLatestMessage
    (&sliding_controller2_B.b_varargout_2_k);
}

boolean_T sliding_controller2ModelClass::sliding_con_SystemCore_step_kcj(void)
{
  return Sub_sliding_controller2_1780.getLatestMessage
    (&sliding_controller2_B.b_varargout_2_c);
}

// Model step function
void sliding_controller2ModelClass::step()
{
  SL_Bus_sliding_controller2_std_msgs_Bool b_varargout_2_0;
  SL_Bus_sliding_controller2_std_msgs_Bool rtb_BusAssignment2_d;
  uint8_T b_varargout_2;
  boolean_T isCreated;
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

  static const char_T tmp[16] = { '/', 'I', 'n', 'v', 'e', 'r', 's', 'e', 'D',
    'y', 'n', 'a', 'm', 'i', 'c', 's' };

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

  if (rtmIsMajorTimeStep((&sliding_controller2_M))) {
    // set solver stop time
    rtsiSetSolverStopTime(&(&sliding_controller2_M)->solverInfo,
                          (((&sliding_controller2_M)->Timing.clockTick0+1)*
      (&sliding_controller2_M)->Timing.stepSize0));
  }                                    // end MajorTimeStep

  // Update absolute time of base rate at minor time step
  if (rtmIsMinorTimeStep((&sliding_controller2_M))) {
    (&sliding_controller2_M)->Timing.t[0] = rtsiGetT(&(&sliding_controller2_M)
      ->solverInfo);
  }

  if (rtmIsMajorTimeStep((&sliding_controller2_M))) {
    // MATLAB Function: '<Root>/exo msg' incorporates:
    //   Constant: '<S1>/Constant'

    sliding_controller2_B.msg_n = sliding_controller2_P.Constant_Value;
    sliding_controller2_B.msg_n.Name_SL_Info.CurrentLength = 7U;
    sliding_controller2_B.msg_n.Effort_SL_Info.CurrentLength = 7U;
    for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 10;
         sliding_controller2_B.e_k++) {
      sliding_controller2_B.msg_n.Name[0].Data[sliding_controller2_B.e_k] =
        b[sliding_controller2_B.e_k];
    }

    sliding_controller2_B.msg_n.Name[0].Data_SL_Info.CurrentLength = 10U;
    for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 11;
         sliding_controller2_B.e_k++) {
      sliding_controller2_B.msg_n.Name[1].Data[sliding_controller2_B.e_k] =
        c[sliding_controller2_B.e_k];
    }

    sliding_controller2_B.msg_n.Name[1].Data_SL_Info.CurrentLength = 11U;
    for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 12;
         sliding_controller2_B.e_k++) {
      sliding_controller2_B.msg_n.Name[2].Data[sliding_controller2_B.e_k] =
        d[sliding_controller2_B.e_k];
    }

    sliding_controller2_B.msg_n.Name[2].Data_SL_Info.CurrentLength = 12U;
    for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 11;
         sliding_controller2_B.e_k++) {
      sliding_controller2_B.msg_n.Name[3].Data[sliding_controller2_B.e_k] =
        e[sliding_controller2_B.e_k];
    }

    sliding_controller2_B.msg_n.Name[3].Data_SL_Info.CurrentLength = 11U;
    for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 12;
         sliding_controller2_B.e_k++) {
      sliding_controller2_B.msg_n.Name[4].Data[sliding_controller2_B.e_k] =
        f[sliding_controller2_B.e_k];
    }

    sliding_controller2_B.msg_n.Name[4].Data_SL_Info.CurrentLength = 12U;
    for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 13;
         sliding_controller2_B.e_k++) {
      sliding_controller2_B.msg_n.Name[5].Data[sliding_controller2_B.e_k] =
        g[sliding_controller2_B.e_k];
    }

    sliding_controller2_B.msg_n.Name[5].Data_SL_Info.CurrentLength = 13U;
    for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 8;
         sliding_controller2_B.e_k++) {
      sliding_controller2_B.msg_n.Name[6].Data[sliding_controller2_B.e_k] =
        h[sliding_controller2_B.e_k];
    }

    sliding_controller2_B.msg_n.Name[6].Data_SL_Info.CurrentLength = 8U;

    // End of MATLAB Function: '<Root>/exo msg'

    // Outputs for Atomic SubSystem: '<Root>/Subscribe1'
    // MATLABSystem: '<S14>/SourceBlock'
    sliding_control_SystemCore_step(&sliding_controller2_B.SourceBlock_o1_hm,
      &sliding_controller2_B.b_varargout_2_Header_Seq,
      &sliding_controller2_B.b_varargout_2_Header_Stamp_Sec,
      &sliding_controller2_B.wj,
      sliding_controller2_B.b_varargout_2_Header_FrameId,
      &sliding_controller2_B.b_varargout_2_Header_FrameId_SL,
      &sliding_controller2_B.b_varargout_2_Header_FrameId__e,
      sliding_controller2_B.b_varargout_2_Name,
      &sliding_controller2_B.b_varargout_2_Name_SL_Info_Curr,
      &sliding_controller2_B.b_varargout_2_Name_SL_Info_Rece,
      sliding_controller2_B.rtb_y_n_g,
      &sliding_controller2_B.b_varargout_2_Position_SL_Info_,
      &sliding_controller2_B.b_varargout_2_Position_SL_Inf_a,
      sliding_controller2_B.rtb_Velocity_g,
      &sliding_controller2_B.b_varargout_2_Velocity_SL_Info_,
      &sliding_controller2_B.b_varargout_2_Velocity_SL_Inf_j,
      sliding_controller2_B.b_varargout_2_Effort,
      &sliding_controller2_B.b_varargout_2_Effort_SL_Info);

    // Outputs for Enabled SubSystem: '<S14>/Enabled Subsystem' incorporates:
    //   EnablePort: '<S60>/Enable'

    if (sliding_controller2_B.SourceBlock_o1_hm) {
      // Inport: '<S60>/In1' incorporates:
      //   MATLABSystem: '<S14>/SourceBlock'

      sliding_controller2_B.In1_n.Header.Seq =
        sliding_controller2_B.b_varargout_2_Header_Seq;
      sliding_controller2_B.In1_n.Header.Stamp.Sec =
        sliding_controller2_B.b_varargout_2_Header_Stamp_Sec;
      sliding_controller2_B.In1_n.Header.Stamp.Nsec = sliding_controller2_B.wj;
      memcpy(&sliding_controller2_B.In1_n.Header.FrameId[0],
             &sliding_controller2_B.b_varargout_2_Header_FrameId[0], sizeof
             (uint8_T) << 7U);
      sliding_controller2_B.In1_n.Header.FrameId_SL_Info.CurrentLength =
        sliding_controller2_B.b_varargout_2_Header_FrameId_SL;
      sliding_controller2_B.In1_n.Header.FrameId_SL_Info.ReceivedLength =
        sliding_controller2_B.b_varargout_2_Header_FrameId__e;
      memcpy(&sliding_controller2_B.In1_n.Name[0],
             &sliding_controller2_B.b_varargout_2_Name[0], sizeof
             (SL_Bus_sliding_controller2_std_msgs_String) << 4U);
      sliding_controller2_B.In1_n.Name_SL_Info.CurrentLength =
        sliding_controller2_B.b_varargout_2_Name_SL_Info_Curr;
      sliding_controller2_B.In1_n.Name_SL_Info.ReceivedLength =
        sliding_controller2_B.b_varargout_2_Name_SL_Info_Rece;
      sliding_controller2_B.In1_n.Position_SL_Info.CurrentLength =
        sliding_controller2_B.b_varargout_2_Position_SL_Info_;
      sliding_controller2_B.In1_n.Position_SL_Info.ReceivedLength =
        sliding_controller2_B.b_varargout_2_Position_SL_Inf_a;
      sliding_controller2_B.In1_n.Velocity_SL_Info.CurrentLength =
        sliding_controller2_B.b_varargout_2_Velocity_SL_Info_;
      sliding_controller2_B.In1_n.Velocity_SL_Info.ReceivedLength =
        sliding_controller2_B.b_varargout_2_Velocity_SL_Inf_j;
      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 7;
           sliding_controller2_B.i++) {
        sliding_controller2_B.In1_n.Position[sliding_controller2_B.i] =
          sliding_controller2_B.rtb_y_n_g[sliding_controller2_B.i];
        sliding_controller2_B.In1_n.Velocity[sliding_controller2_B.i] =
          sliding_controller2_B.rtb_Velocity_g[sliding_controller2_B.i];
        sliding_controller2_B.In1_n.Effort[sliding_controller2_B.i] =
          sliding_controller2_B.b_varargout_2_Effort[sliding_controller2_B.i];
      }

      sliding_controller2_B.In1_n.Effort_SL_Info =
        sliding_controller2_B.b_varargout_2_Effort_SL_Info;

      // End of Inport: '<S60>/In1'
    }

    // End of Outputs for SubSystem: '<S14>/Enabled Subsystem'
    // End of Outputs for SubSystem: '<Root>/Subscribe1'

    // Outputs for Atomic SubSystem: '<Root>/Subscribe2'
    // MATLABSystem: '<S15>/SourceBlock'
    sliding_contr_SystemCore_step_k(&sliding_controller2_B.SourceBlock_o1_i,
      &sliding_controller2_B.b_varargout_2_Header_Seq,
      &sliding_controller2_B.b_varargout_2_Header_Stamp_Sec,
      &sliding_controller2_B.wj,
      sliding_controller2_B.b_varargout_2_Header_FrameId,
      &sliding_controller2_B.b_varargout_2_Header_FrameId_SL,
      &sliding_controller2_B.b_varargout_2_Header_FrameId__e,
      sliding_controller2_B.b_varargout_2_Name,
      &sliding_controller2_B.b_varargout_2_Name_SL_Info_Curr,
      &sliding_controller2_B.b_varargout_2_Name_SL_Info_Rece,
      sliding_controller2_B.rtb_y_n_g,
      &sliding_controller2_B.b_varargout_2_Position_SL_Info_,
      &sliding_controller2_B.b_varargout_2_Position_SL_Inf_a,
      sliding_controller2_B.rtb_Velocity_g,
      &sliding_controller2_B.b_varargout_2_Velocity_SL_Info_,
      &sliding_controller2_B.b_varargout_2_Velocity_SL_Inf_j,
      sliding_controller2_B.b_varargout_2_Effort,
      &sliding_controller2_B.b_varargout_2_Effort_SL_Info);

    // Outputs for Enabled SubSystem: '<S15>/Enabled Subsystem' incorporates:
    //   EnablePort: '<S61>/Enable'

    if (sliding_controller2_B.SourceBlock_o1_i) {
      // Inport: '<S61>/In1' incorporates:
      //   MATLABSystem: '<S15>/SourceBlock'

      sliding_controller2_B.In1_g.Header.Seq =
        sliding_controller2_B.b_varargout_2_Header_Seq;
      sliding_controller2_B.In1_g.Header.Stamp.Sec =
        sliding_controller2_B.b_varargout_2_Header_Stamp_Sec;
      sliding_controller2_B.In1_g.Header.Stamp.Nsec = sliding_controller2_B.wj;
      memcpy(&sliding_controller2_B.In1_g.Header.FrameId[0],
             &sliding_controller2_B.b_varargout_2_Header_FrameId[0], sizeof
             (uint8_T) << 7U);
      sliding_controller2_B.In1_g.Header.FrameId_SL_Info.CurrentLength =
        sliding_controller2_B.b_varargout_2_Header_FrameId_SL;
      sliding_controller2_B.In1_g.Header.FrameId_SL_Info.ReceivedLength =
        sliding_controller2_B.b_varargout_2_Header_FrameId__e;
      memcpy(&sliding_controller2_B.In1_g.Name[0],
             &sliding_controller2_B.b_varargout_2_Name[0], sizeof
             (SL_Bus_sliding_controller2_std_msgs_String) << 4U);
      sliding_controller2_B.In1_g.Name_SL_Info.CurrentLength =
        sliding_controller2_B.b_varargout_2_Name_SL_Info_Curr;
      sliding_controller2_B.In1_g.Name_SL_Info.ReceivedLength =
        sliding_controller2_B.b_varargout_2_Name_SL_Info_Rece;
      sliding_controller2_B.In1_g.Position_SL_Info.CurrentLength =
        sliding_controller2_B.b_varargout_2_Position_SL_Info_;
      sliding_controller2_B.In1_g.Position_SL_Info.ReceivedLength =
        sliding_controller2_B.b_varargout_2_Position_SL_Inf_a;
      sliding_controller2_B.In1_g.Velocity_SL_Info.CurrentLength =
        sliding_controller2_B.b_varargout_2_Velocity_SL_Info_;
      sliding_controller2_B.In1_g.Velocity_SL_Info.ReceivedLength =
        sliding_controller2_B.b_varargout_2_Velocity_SL_Inf_j;
      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 7;
           sliding_controller2_B.i++) {
        sliding_controller2_B.In1_g.Position[sliding_controller2_B.i] =
          sliding_controller2_B.rtb_y_n_g[sliding_controller2_B.i];
        sliding_controller2_B.In1_g.Velocity[sliding_controller2_B.i] =
          sliding_controller2_B.rtb_Velocity_g[sliding_controller2_B.i];
        sliding_controller2_B.In1_g.Effort[sliding_controller2_B.i] =
          sliding_controller2_B.b_varargout_2_Effort[sliding_controller2_B.i];
      }

      sliding_controller2_B.In1_g.Effort_SL_Info =
        sliding_controller2_B.b_varargout_2_Effort_SL_Info;

      // End of Inport: '<S61>/In1'
    }

    // End of Outputs for SubSystem: '<S15>/Enabled Subsystem'
    // End of Outputs for SubSystem: '<Root>/Subscribe2'

    // Outputs for Atomic SubSystem: '<Root>/Subscribe4'
    // MATLABSystem: '<S17>/SourceBlock' incorporates:
    //   Inport: '<S63>/In1'

    isCreated = Sub_sliding_controller2_1418.getLatestMessage(&b_varargout_2_0);

    // Outputs for Enabled SubSystem: '<S17>/Enabled Subsystem' incorporates:
    //   EnablePort: '<S63>/Enable'

    if (isCreated) {
      sliding_controller2_B.In1_k = b_varargout_2_0;
    }

    // End of MATLABSystem: '<S17>/SourceBlock'
    // End of Outputs for SubSystem: '<S17>/Enabled Subsystem'
    // End of Outputs for SubSystem: '<Root>/Subscribe4'

    // Logic: '<Root>/Logical Operator'
    sliding_controller2_B.LogicalOperator = (sliding_controller2_B.In1_k.Data &&
      sliding_controller2_B.SourceBlock_o1_i &&
      sliding_controller2_B.SourceBlock_o1_hm);

    // MATLAB Function: '<Root>/human msg' incorporates:
    //   Constant: '<S2>/Constant'

    sliding_controller2_B.msg = sliding_controller2_P.Constant_Value_d;
    sliding_controller2_B.msg.Name_SL_Info.CurrentLength = 6U;
    sliding_controller2_B.msg.Effort_SL_Info.CurrentLength = 6U;
    for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 12;
         sliding_controller2_B.e_k++) {
      sliding_controller2_B.msg.Name[0].Data[sliding_controller2_B.e_k] =
        b_0[sliding_controller2_B.e_k];
    }

    sliding_controller2_B.msg.Name[0].Data_SL_Info.CurrentLength = 12U;
    for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 13;
         sliding_controller2_B.e_k++) {
      sliding_controller2_B.msg.Name[1].Data[sliding_controller2_B.e_k] =
        c_0[sliding_controller2_B.e_k];
    }

    sliding_controller2_B.msg.Name[1].Data_SL_Info.CurrentLength = 13U;
    for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 14;
         sliding_controller2_B.e_k++) {
      sliding_controller2_B.msg.Name[2].Data[sliding_controller2_B.e_k] =
        d_0[sliding_controller2_B.e_k];
    }

    sliding_controller2_B.msg.Name[2].Data_SL_Info.CurrentLength = 14U;
    for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 13;
         sliding_controller2_B.e_k++) {
      sliding_controller2_B.msg.Name[3].Data[sliding_controller2_B.e_k] =
        e_0[sliding_controller2_B.e_k];
    }

    sliding_controller2_B.msg.Name[3].Data_SL_Info.CurrentLength = 13U;
    for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 14;
         sliding_controller2_B.e_k++) {
      sliding_controller2_B.msg.Name[4].Data[sliding_controller2_B.e_k] =
        f_0[sliding_controller2_B.e_k];
    }

    sliding_controller2_B.msg.Name[4].Data_SL_Info.CurrentLength = 14U;
    for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 15;
         sliding_controller2_B.e_k++) {
      sliding_controller2_B.msg.Name[5].Data[sliding_controller2_B.e_k] =
        g_0[sliding_controller2_B.e_k];
    }

    sliding_controller2_B.msg.Name[5].Data_SL_Info.CurrentLength = 15U;

    // End of MATLAB Function: '<Root>/human msg'
  }

  // MATLABSystem: '<Root>/Current Time'
  currentROSTimeBus(&sliding_controller2_B.rtb_CurrentTime_d);

  // BusAssignment: '<Root>/Bus Assignment1' incorporates:
  //   Constant: '<S4>/Constant'
  //   MATLABSystem: '<Root>/Current Time'

  sliding_controller2_B.BusAssignment1_m =
    sliding_controller2_P.Constant_Value_i;
  sliding_controller2_B.BusAssignment1_m.Stamp =
    sliding_controller2_B.rtb_CurrentTime_d;
  if (rtmIsMajorTimeStep((&sliding_controller2_M))) {
    // Outputs for Atomic SubSystem: '<Root>/Subscribe'
    // MATLABSystem: '<S13>/SourceBlock' incorporates:
    //   Inport: '<S59>/In1'

    isCreated = Sub_sliding_controller2_35.getLatestMessage
      (&sliding_controller2_B.b_varargout_2_cx);

    // Outputs for Enabled SubSystem: '<S13>/Enabled Subsystem' incorporates:
    //   EnablePort: '<S59>/Enable'

    if (isCreated) {
      sliding_controller2_B.In1_a = sliding_controller2_B.b_varargout_2_cx;
    }

    // End of MATLABSystem: '<S13>/SourceBlock'
    // End of Outputs for SubSystem: '<S13>/Enabled Subsystem'
    // End of Outputs for SubSystem: '<Root>/Subscribe'

    // Outputs for Enabled SubSystem: '<Root>/Enabled Subsystem1' incorporates:
    //   EnablePort: '<S7>/Enable'

    if (sliding_controller2_B.SourceBlock_o1_hm) {
      // Inport: '<S7>/In1'
      sliding_controller2_B.In1_j = sliding_controller2_B.In1_n;
    }

    // End of Outputs for SubSystem: '<Root>/Enabled Subsystem1'

    // Outputs for Enabled SubSystem: '<Root>/Enabled Subsystem2' incorporates:
    //   EnablePort: '<S8>/Enable'

    if (sliding_controller2_B.SourceBlock_o1_i) {
      // Inport: '<S8>/In1'
      sliding_controller2_B.In1_e = sliding_controller2_B.In1_g;
    }

    // End of Outputs for SubSystem: '<Root>/Enabled Subsystem2'

    // MATLAB Function: '<Root>/MATLAB Function - String Array Assign' incorporates:
    //   Constant: '<S3>/Constant'

    sliding_controller2_B.msg_o = sliding_controller2_P.Constant_Value_e;
    sliding_controller2_B.msg_o.ModelName_SL_Info.CurrentLength = 3U;
    sliding_controller2_B.msg_o.ModelName[0] = 101U;
    sliding_controller2_B.msg_o.ModelName[1] = 120U;
    sliding_controller2_B.msg_o.ModelName[2] = 111U;
    sliding_controller2_B.msg_o.Q_SL_Info.CurrentLength = 7U;
    sliding_controller2_B.msg_o.Qd_SL_Info.CurrentLength = 7U;
    sliding_controller2_B.msg_o.Qdd_SL_Info.CurrentLength = 7U;

    // Outputs for Enabled SubSystem: '<Root>/Controller' incorporates:
    //   EnablePort: '<S5>/Enable'

    if (rtmIsMajorTimeStep((&sliding_controller2_M))) {
      sliding_controller2_DW.Controller_MODE =
        sliding_controller2_B.LogicalOperator;
    }

    // End of Outputs for SubSystem: '<Root>/Controller'
  }

  // Outputs for Enabled SubSystem: '<Root>/Controller' incorporates:
  //   EnablePort: '<S5>/Enable'

  if (sliding_controller2_DW.Controller_MODE) {
    if (rtmIsMajorTimeStep((&sliding_controller2_M))) {
      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 7;
           sliding_controller2_B.i++) {
        // SignalConversion generated from: '<S5>/Bus Selector1'
        sliding_controller2_B.Position[sliding_controller2_B.i] =
          sliding_controller2_B.In1_j.Position[sliding_controller2_B.i];
      }

      // MATLAB Function: '<S22>/exo right'
      sliding_controller2_exoleft(&sliding_controller2_B.Position[3],
        &sliding_controller2_B.In1_j.Velocity[3],
        sliding_controller2_B.rtb_danke_g_l, sliding_controller2_B.rtb_ankle_n,
        sliding_controller2_B.rtb_dknee_b, sliding_controller2_B.rtb_knee_b_l);
      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 7;
           sliding_controller2_B.i++) {
        // SignalConversion generated from: '<S5>/Bus Selector2'
        sliding_controller2_B.rtb_Velocity_g[sliding_controller2_B.i] =
          sliding_controller2_B.In1_e.Velocity[sliding_controller2_B.i];
      }

      // MATLAB Function: '<S22>/human right'
      sliding_controller2_exoleft(&sliding_controller2_B.In1_e.Position[3],
        &sliding_controller2_B.rtb_Velocity_g[3],
        sliding_controller2_B.rtb_Add_e_b, sliding_controller2_B.rtb_Product2_o,
        sliding_controller2_B.rtb_Add_c_h, sliding_controller2_B.rtb_knee_bj);

      // Sum: '<S38>/Subtract'
      sliding_controller2_B.rtb_dknee_idx_0 = sliding_controller2_B.rtb_dknee_b
        [0] - sliding_controller2_B.rtb_Add_c_h[0];

      // Sum: '<S38>/Subtract1'
      sliding_controller2_B.rtb_knee_b_idx_0 =
        sliding_controller2_B.rtb_knee_b_l[0] -
        sliding_controller2_B.rtb_knee_bj[0];

      // Sum: '<S38>/Subtract'
      sliding_controller2_B.rtb_dknee_idx_1 = sliding_controller2_B.rtb_dknee_b
        [1] - sliding_controller2_B.rtb_Add_c_h[1];

      // Sum: '<S38>/Subtract1'
      sliding_controller2_B.rtb_knee_b_idx_1 =
        sliding_controller2_B.rtb_knee_b_l[1] -
        sliding_controller2_B.rtb_knee_bj[1];

      // Sum: '<S36>/Subtract2' incorporates:
      //   Gain: '<S38>/dampener right shank'
      //   Gain: '<S38>/spring right thigh'
      //   Sum: '<S38>/Subtract2'

      sliding_controller2_B.rtb_Add_c_h[0] = (sliding_controller2_P.spring[0] *
        sliding_controller2_B.rtb_dknee_idx_0 + sliding_controller2_P.spring[2] *
        sliding_controller2_B.rtb_dknee_idx_1) + (dampener[0] *
        sliding_controller2_B.rtb_knee_b_idx_0 + dampener[2] *
        sliding_controller2_B.rtb_knee_b_idx_1);
      sliding_controller2_B.rtb_Add_c_h[1] = (sliding_controller2_P.spring[1] *
        sliding_controller2_B.rtb_dknee_idx_0 + sliding_controller2_P.spring[3] *
        sliding_controller2_B.rtb_dknee_idx_1) + (dampener[1] *
        sliding_controller2_B.rtb_knee_b_idx_0 + dampener[3] *
        sliding_controller2_B.rtb_knee_b_idx_1);

      // MATLAB Function: '<S46>/MATLAB Function' incorporates:
      //   MATLAB Function: '<S46>/MATLAB Function1'

      sliding_controller2_B.rtb_Add_e_tmp_tmp = sliding_controller2_B.Position[3]
        + sliding_controller2_B.Position[4];
      sliding_controller2_B.b_varargout_2_Header_Stamp_Sec = sin
        (sliding_controller2_B.rtb_Add_e_tmp_tmp);

      // Sum: '<S39>/Subtract'
      sliding_controller2_B.rtb_danke_g_idx_0 =
        sliding_controller2_B.rtb_danke_g_l[0] -
        sliding_controller2_B.rtb_Add_e_b[0];

      // Sum: '<S39>/Subtract1'
      sliding_controller2_B.rtb_dknee_idx_0 = sliding_controller2_B.rtb_ankle_n
        [0] - sliding_controller2_B.rtb_Product2_o[0];

      // Sum: '<S39>/Subtract'
      sliding_controller2_B.rtb_danke_g_idx_1 =
        sliding_controller2_B.rtb_danke_g_l[1] -
        sliding_controller2_B.rtb_Add_e_b[1];

      // Sum: '<S39>/Subtract1'
      sliding_controller2_B.rtb_knee_b_idx_0 =
        sliding_controller2_B.rtb_ankle_n[1] -
        sliding_controller2_B.rtb_Product2_o[1];

      // Sum: '<S39>/Subtract2' incorporates:
      //   Gain: '<S39>/dampener right shank'
      //   Gain: '<S39>/spring right thigh'

      sliding_controller2_B.wj = (sliding_controller2_P.spring[0] *
        sliding_controller2_B.rtb_danke_g_idx_0 + sliding_controller2_P.spring[2]
        * sliding_controller2_B.rtb_danke_g_idx_1) + (dampener[0] *
        sliding_controller2_B.rtb_dknee_idx_0 + dampener[2] *
        sliding_controller2_B.rtb_knee_b_idx_0);
      sliding_controller2_B.rtb_danke_g_idx_0 = (sliding_controller2_P.spring[1]
        * sliding_controller2_B.rtb_danke_g_idx_0 +
        sliding_controller2_P.spring[3] *
        sliding_controller2_B.rtb_danke_g_idx_1) + (dampener[1] *
        sliding_controller2_B.rtb_dknee_idx_0 + dampener[3] *
        sliding_controller2_B.rtb_knee_b_idx_0);

      // MATLAB Function: '<S46>/MATLAB Function1' incorporates:
      //   MATLAB Function: '<S46>/MATLAB Function'

      sliding_controller2_B.unnamed_idx_0_tmp = cos
        (sliding_controller2_B.rtb_Add_e_tmp_tmp) * -0.39;
      sliding_controller2_B.rtb_Add_e_tmp_tmp =
        sliding_controller2_B.unnamed_idx_0_tmp + -0.324 * cos
        (sliding_controller2_B.Position[3]);
      sliding_controller2_B.rtb_danke_g_idx_1_tmp = 0.324 * sin
        (sliding_controller2_B.Position[3]);

      // Product: '<S46>/Product2' incorporates:
      //   MATLAB Function: '<S46>/MATLAB Function'
      //   MATLAB Function: '<S46>/MATLAB Function1'

      sliding_controller2_B.rtb_danke_g_idx_1 =
        sliding_controller2_B.rtb_Add_e_tmp_tmp *
        sliding_controller2_B.rtb_Add_c_h[0] +
        (sliding_controller2_B.rtb_danke_g_idx_1_tmp -
         sliding_controller2_B.b_varargout_2_Header_Stamp_Sec * -0.39) *
        sliding_controller2_B.rtb_Add_c_h[1];
      sliding_controller2_B.unnamed_idx_0_tmp =
        sliding_controller2_B.unnamed_idx_0_tmp *
        sliding_controller2_B.rtb_Add_c_h[0] + 0.39 *
        sliding_controller2_B.b_varargout_2_Header_Stamp_Sec *
        sliding_controller2_B.rtb_Add_c_h[1];

      // MATLAB Function: '<S22>/exo left'
      sliding_controller2_exoleft(&sliding_controller2_B.Position[0],
        &sliding_controller2_B.In1_j.Velocity[0],
        sliding_controller2_B.rtb_knee_b_l, sliding_controller2_B.rtb_dknee_b,
        sliding_controller2_B.rtb_ankle_n, sliding_controller2_B.rtb_Add_e_b);

      // MATLAB Function: '<S22>/human left'
      sliding_controller2_exoleft(&sliding_controller2_B.In1_e.Position[0],
        &sliding_controller2_B.rtb_Velocity_g[0],
        sliding_controller2_B.rtb_knee_bj, sliding_controller2_B.rtb_Add_c_h,
        sliding_controller2_B.rtb_Product2_o,
        sliding_controller2_B.rtb_danke_g_l);

      // MATLAB Function: '<S47>/MATLAB Function' incorporates:
      //   MATLAB Function: '<S47>/MATLAB Function1'

      sliding_controller2_B.rtb_Saturation_tmp_tmp =
        sliding_controller2_B.Position[0] + sliding_controller2_B.Position[1];
      sliding_controller2_B.rtb_Saturation_tmp = sin
        (sliding_controller2_B.rtb_Saturation_tmp_tmp);

      // Sum: '<S37>/Subtract'
      sliding_controller2_B.rtb_knee_b_idx_0 =
        sliding_controller2_B.rtb_knee_b_l[0] -
        sliding_controller2_B.rtb_knee_bj[0];

      // Sum: '<S37>/Subtract1'
      sliding_controller2_B.rtb_dknee_idx_0 = sliding_controller2_B.rtb_dknee_b
        [0] - sliding_controller2_B.rtb_Add_c_h[0];

      // Sum: '<S37>/Subtract'
      sliding_controller2_B.rtb_knee_b_idx_1 =
        sliding_controller2_B.rtb_knee_b_l[1] -
        sliding_controller2_B.rtb_knee_bj[1];

      // Sum: '<S37>/Subtract1'
      sliding_controller2_B.rtb_dknee_idx_1 = sliding_controller2_B.rtb_dknee_b
        [1] - sliding_controller2_B.rtb_Add_c_h[1];

      // Sum: '<S37>/Subtract2' incorporates:
      //   Gain: '<S37>/dampener left thigh'
      //   Gain: '<S37>/spring left thigh'

      sliding_controller2_B.unnamed_idx_0 = (sliding_controller2_P.spring[0] *
        sliding_controller2_B.rtb_knee_b_idx_0 + sliding_controller2_P.spring[2]
        * sliding_controller2_B.rtb_knee_b_idx_1) + (dampener[0] *
        sliding_controller2_B.rtb_dknee_idx_0 + dampener[2] *
        sliding_controller2_B.rtb_dknee_idx_1);
      sliding_controller2_B.rtb_dknee_idx_1 = (sliding_controller2_P.spring[1] *
        sliding_controller2_B.rtb_knee_b_idx_0 + sliding_controller2_P.spring[3]
        * sliding_controller2_B.rtb_knee_b_idx_1) + (dampener[1] *
        sliding_controller2_B.rtb_dknee_idx_0 + dampener[3] *
        sliding_controller2_B.rtb_dknee_idx_1);

      // Sum: '<S36>/Subtract'
      sliding_controller2_B.rtb_dknee_idx_0 = sliding_controller2_B.rtb_ankle_n
        [0] - sliding_controller2_B.rtb_Product2_o[0];

      // Sum: '<S36>/Subtract1'
      sliding_controller2_B.rtb_Add_e_idx_0 = sliding_controller2_B.rtb_Add_e_b
        [0] - sliding_controller2_B.rtb_danke_g_l[0];

      // Sum: '<S36>/Subtract'
      sliding_controller2_B.rtb_knee_b_idx_0 =
        sliding_controller2_B.rtb_ankle_n[1] -
        sliding_controller2_B.rtb_Product2_o[1];

      // Sum: '<S36>/Subtract1'
      sliding_controller2_B.rtb_Add_e_idx_1 = sliding_controller2_B.rtb_Add_e_b
        [1] - sliding_controller2_B.rtb_danke_g_l[1];

      // Sum: '<S36>/Subtract2' incorporates:
      //   Gain: '<S36>/dampener left shank'
      //   Gain: '<S36>/spring left shank'

      sliding_controller2_B.rtb_knee_b_idx_1 = (sliding_controller2_P.spring[0] *
        sliding_controller2_B.rtb_dknee_idx_0 + sliding_controller2_P.spring[2] *
        sliding_controller2_B.rtb_knee_b_idx_0) + (dampener[0] *
        sliding_controller2_B.rtb_Add_e_idx_0 + dampener[2] *
        sliding_controller2_B.rtb_Add_e_idx_1);
      sliding_controller2_B.rtb_dknee_idx_0 = (sliding_controller2_P.spring[1] *
        sliding_controller2_B.rtb_dknee_idx_0 + sliding_controller2_P.spring[3] *
        sliding_controller2_B.rtb_knee_b_idx_0) + (dampener[1] *
        sliding_controller2_B.rtb_Add_e_idx_0 + dampener[3] *
        sliding_controller2_B.rtb_Add_e_idx_1);

      // Saturate: '<S5>/Saturation' incorporates:
      //   Constant: '<S47>/Constant'

      sliding_controller2_B.A[2] = sliding_controller2_P.Constant_Value_pa;

      // MATLAB Function: '<S47>/MATLAB Function' incorporates:
      //   MATLAB Function: '<S47>/MATLAB Function1'

      sliding_controller2_B.rtb_Saturation_tmp_tmp = cos
        (sliding_controller2_B.rtb_Saturation_tmp_tmp) * -0.39;
      sliding_controller2_B.rtb_knee_b_idx_0 =
        sliding_controller2_B.rtb_Saturation_tmp_tmp + -0.324 * cos
        (sliding_controller2_B.Position[0]);

      // Saturate: '<S5>/Saturation' incorporates:
      //   Constant: '<S46>/Constant'
      //   MATLAB Function: '<S46>/MATLAB Function'
      //   MATLAB Function: '<S47>/MATLAB Function'
      //   MATLAB Function: '<S47>/MATLAB Function1'
      //   Product: '<S46>/Product1'
      //   Product: '<S47>/Product1'
      //   Product: '<S47>/Product2'
      //   Sum: '<S46>/Add'
      //   Sum: '<S47>/Add'

      sliding_controller2_B.A[0] = (sliding_controller2_B.rtb_knee_b_idx_0 *
        sliding_controller2_B.unnamed_idx_0 + (0.324 * sin
        (sliding_controller2_B.Position[0]) - -0.39 *
        sliding_controller2_B.rtb_Saturation_tmp) *
        sliding_controller2_B.rtb_dknee_idx_1) +
        (sliding_controller2_B.rtb_knee_b_idx_0 *
         sliding_controller2_B.rtb_knee_b_idx_1 + (0.324 * sin
          (sliding_controller2_B.Position[0]) - sin
          (sliding_controller2_B.Position[0] + sliding_controller2_B.Position[1])
          * -0.39) * sliding_controller2_B.rtb_dknee_idx_0);
      sliding_controller2_B.A[3] = (sliding_controller2_B.rtb_Add_e_tmp_tmp *
        sliding_controller2_B.wj + (sliding_controller2_B.rtb_danke_g_idx_1_tmp
        - -0.39 * sliding_controller2_B.b_varargout_2_Header_Stamp_Sec) *
        sliding_controller2_B.rtb_danke_g_idx_0) +
        sliding_controller2_B.rtb_danke_g_idx_1;
      sliding_controller2_B.A[1] = (sliding_controller2_B.rtb_Saturation_tmp_tmp
        * sliding_controller2_B.rtb_knee_b_idx_1 + 0.39 *
        sliding_controller2_B.rtb_Saturation_tmp *
        sliding_controller2_B.rtb_dknee_idx_0) + (0.0 *
        sliding_controller2_B.unnamed_idx_0 + 0.0 *
        sliding_controller2_B.rtb_dknee_idx_1);
      sliding_controller2_B.A[4] = (0.0 * sliding_controller2_B.wj + 0.0 *
        sliding_controller2_B.rtb_danke_g_idx_0) +
        sliding_controller2_B.unnamed_idx_0_tmp;
      sliding_controller2_B.A[5] = sliding_controller2_P.Constant_Value_o;
      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 6;
           sliding_controller2_B.i++) {
        // Saturate: '<S5>/Saturation'
        sliding_controller2_B.b_varargout_2_Header_Stamp_Sec =
          sliding_controller2_B.A[sliding_controller2_B.i];
        if (sliding_controller2_B.b_varargout_2_Header_Stamp_Sec >
            sliding_controller2_P.interaction_sat) {
          // Saturate: '<S5>/Saturation'
          sliding_controller2_B.b_varargout_2_Header_Stamp_Sec =
            sliding_controller2_P.interaction_sat;
        } else if (sliding_controller2_B.b_varargout_2_Header_Stamp_Sec <
                   -sliding_controller2_P.interaction_sat) {
          // Saturate: '<S5>/Saturation'
          sliding_controller2_B.b_varargout_2_Header_Stamp_Sec =
            -sliding_controller2_P.interaction_sat;
        }

        // Sum: '<S29>/Sum' incorporates:
        //   SignalConversion generated from: '<S5>/Bus Selector'

        sliding_controller2_B.Sum[sliding_controller2_B.i] =
          sliding_controller2_B.In1_a.Other[sliding_controller2_B.i] -
          sliding_controller2_B.b_varargout_2_Header_Stamp_Sec;

        // Saturate: '<S5>/Saturation'
        sliding_controller2_B.rtb_Saturation_p[sliding_controller2_B.i] =
          sliding_controller2_B.b_varargout_2_Header_Stamp_Sec;
      }

      // MATLAB Function: '<S29>/MATLAB Function' incorporates:
      //   Constant: '<S29>/Constant'
      //   Constant: '<S29>/Constant1'
      //   Constant: '<S29>/Constant2'
      //   Constant: '<S29>/Constant3'
      //   Constant: '<S29>/Constant4'
      //   Constant: '<S29>/Constant5'
      //   SignalConversion generated from: '<S5>/Bus Selector'

      for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 36;
           sliding_controller2_B.e_k++) {
        sliding_controller2_B.Kp0_b[sliding_controller2_B.e_k] = 0.0;
      }

      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 6;
           sliding_controller2_B.i++) {
        sliding_controller2_B.Kp0_b[sliding_controller2_B.i + 6 *
          sliding_controller2_B.i] = Kp0[sliding_controller2_B.i];
      }

      for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 36;
           sliding_controller2_B.e_k++) {
        sliding_controller2_B.Kn0_p[sliding_controller2_B.e_k] = 0.0;
      }

      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 6;
           sliding_controller2_B.i++) {
        sliding_controller2_B.Kn0_p[sliding_controller2_B.i + 6 *
          sliding_controller2_B.i] = Kn0[sliding_controller2_B.i];
      }

      for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 36;
           sliding_controller2_B.e_k++) {
        sliding_controller2_B.Bp0_c[sliding_controller2_B.e_k] = 0.0;
      }

      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 6;
           sliding_controller2_B.i++) {
        sliding_controller2_B.Bp0_c[sliding_controller2_B.i + 6 *
          sliding_controller2_B.i] = Bp0[sliding_controller2_B.i];
      }

      for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 36;
           sliding_controller2_B.e_k++) {
        sliding_controller2_B.Bn0_f[sliding_controller2_B.e_k] = 0.0;
      }

      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 6;
           sliding_controller2_B.i++) {
        sliding_controller2_B.Bn0_f[sliding_controller2_B.i + 6 *
          sliding_controller2_B.i] = Bn0[sliding_controller2_B.i];
        sliding_controller2_B.b_varargout_2_Header_Stamp_Sec =
          sliding_controller2_B.Sum[sliding_controller2_B.i];
        sliding_controller2_B.wj =
          sliding_controller2_B.In1_a.Qd[sliding_controller2_B.i];
        sliding_controller2_B.jpvt[sliding_controller2_B.i] =
          sliding_controller2_B.i + 1;
        sliding_controller2_B.A[sliding_controller2_B.i] =
          sliding_controller2_B.In1_a.Other[sliding_controller2_B.i];
        if (sliding_controller2_B.b_varargout_2_Header_Stamp_Sec < 0.0) {
          sliding_controller2_B.rtb_Add1_l[sliding_controller2_B.i] = -1.0;
        } else if (sliding_controller2_B.b_varargout_2_Header_Stamp_Sec > 0.0) {
          sliding_controller2_B.rtb_Add1_l[sliding_controller2_B.i] = 1.0;
        } else if (sliding_controller2_B.b_varargout_2_Header_Stamp_Sec == 0.0)
        {
          sliding_controller2_B.rtb_Add1_l[sliding_controller2_B.i] = 0.0;
        } else {
          sliding_controller2_B.rtb_Add1_l[sliding_controller2_B.i] = (rtNaN);
        }

        if (sliding_controller2_B.wj < 0.0) {
          sliding_controller2_B.b_x[sliding_controller2_B.i] = -1.0;
        } else if (sliding_controller2_B.wj > 0.0) {
          sliding_controller2_B.b_x[sliding_controller2_B.i] = 1.0;
        } else if (sliding_controller2_B.wj == 0.0) {
          sliding_controller2_B.b_x[sliding_controller2_B.i] = 0.0;
        } else {
          sliding_controller2_B.b_x[sliding_controller2_B.i] = (rtNaN);
        }
      }

      sliding_controller2_B.b_varargout_2_Header_Stamp_Sec = 0.0;
      sliding_controller2_qrpf(sliding_controller2_B.A, 1, 1, 6,
        &sliding_controller2_B.b_varargout_2_Header_Stamp_Sec,
        sliding_controller2_B.jpvt);
      sliding_controller2_B.i = 0;
      sliding_controller2_B.wj = fabs(sliding_controller2_B.A[0]);
      if (!(sliding_controller2_B.wj <= 1.3322676295501878E-14 *
            sliding_controller2_B.wj)) {
        sliding_controller2_B.i = 1;
      }

      for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 36;
           sliding_controller2_B.e_k++) {
        sliding_controller2_B.change[sliding_controller2_B.e_k] = 0.0;
      }

      for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 6;
           sliding_controller2_B.e_k++) {
        sliding_controller2_B.B_n[sliding_controller2_B.e_k] =
          sliding_controller2_B.Sum[sliding_controller2_B.e_k];
        if (sliding_controller2_B.b_varargout_2_Header_Stamp_Sec != 0.0) {
          sliding_controller2_B.wj =
            sliding_controller2_B.b_varargout_2_Header_Stamp_Sec *
            sliding_controller2_B.B_n[sliding_controller2_B.e_k];
          if (sliding_controller2_B.wj != 0.0) {
            sliding_controller2_B.B_n[sliding_controller2_B.e_k] -=
              sliding_controller2_B.wj;
          }
        }

        if (0 <= sliding_controller2_B.i - 1) {
          sliding_controller2_B.change[(sliding_controller2_B.jpvt[0] + 6 *
            sliding_controller2_B.e_k) - 1] =
            sliding_controller2_B.B_n[sliding_controller2_B.e_k];
        }

        sliding_controller2_B.e_j = sliding_controller2_B.i;
        while (sliding_controller2_B.e_j > 0) {
          sliding_controller2_B.e_j = (6 * sliding_controller2_B.e_k +
            sliding_controller2_B.jpvt[0]) - 1;
          sliding_controller2_B.change[sliding_controller2_B.e_j] /=
            sliding_controller2_B.A[0];
          sliding_controller2_B.e_j = 0;
        }
      }

      for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 6;
           sliding_controller2_B.e_k++) {
        for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 6;
             sliding_controller2_B.i++) {
          sliding_controller2_B.Y[sliding_controller2_B.i + 6 *
            sliding_controller2_B.e_k] = sliding_controller2_B.change[6 *
            sliding_controller2_B.i + sliding_controller2_B.e_k];
        }
      }

      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 36;
           sliding_controller2_B.i++) {
        sliding_controller2_B.change[sliding_controller2_B.i] = fabs
          (sliding_controller2_B.Y[sliding_controller2_B.i]);
        sliding_controller2_B.K[sliding_controller2_B.i] = 0.0;
      }

      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 6;
           sliding_controller2_B.i++) {
        sliding_controller2_B.K[sliding_controller2_B.i + 6 *
          sliding_controller2_B.i] = 1.0;
      }

      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 36;
           sliding_controller2_B.i++) {
        sliding_controller2_B.B[sliding_controller2_B.i] = 0.0;
      }

      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 6;
           sliding_controller2_B.i++) {
        sliding_controller2_B.b_varargout_2_Header_Stamp_Sec =
          sliding_controller2_B.change[sliding_controller2_B.i];
        sliding_controller2_B.e_k = sliding_controller2_B.i + 6 *
          sliding_controller2_B.i;
        sliding_controller2_B.B[sliding_controller2_B.e_k] = 1.0;
        if (sliding_controller2_B.rtb_Add1_l[sliding_controller2_B.i] ==
            sliding_controller2_B.b_x[sliding_controller2_B.i]) {
          sliding_controller2_B.K[sliding_controller2_B.e_k] =
            sliding_controller2_B.Kp0_b[sliding_controller2_B.e_k] +
            sliding_controller2_P.gamma[0] *
            sliding_controller2_B.b_varargout_2_Header_Stamp_Sec;
          sliding_controller2_B.B[sliding_controller2_B.e_k] =
            sliding_controller2_B.Bp0_c[sliding_controller2_B.e_k] +
            sliding_controller2_P.alpha[0] *
            sliding_controller2_B.b_varargout_2_Header_Stamp_Sec;
        } else {
          sliding_controller2_B.K[sliding_controller2_B.e_k] =
            sliding_controller2_B.Kn0_p[sliding_controller2_B.e_k] -
            sliding_controller2_P.gamma[1] *
            sliding_controller2_B.b_varargout_2_Header_Stamp_Sec;
          sliding_controller2_B.B[sliding_controller2_B.e_k] =
            sliding_controller2_B.Bn0_f[sliding_controller2_B.e_k] -
            sliding_controller2_P.alpha[1] *
            sliding_controller2_B.b_varargout_2_Header_Stamp_Sec;
        }
      }

      // End of MATLAB Function: '<S29>/MATLAB Function'

      // MATLAB Function: '<S5>/MATLAB Function1'
      sliding_contr_MATLABFunction1_k(sliding_controller2_B.rtb_Saturation_p,
        sliding_controller2_B.rtb_y_n_g);

      // MATLAB Function: '<S31>/MATLAB Function1'
      sliding_contr_MATLABFunction1_k(&sliding_controller2_B.Position[0],
        sliding_controller2_B.y_e);

      // MATLAB Function: '<S31>/MATLAB Function2'
      sliding_contr_MATLABFunction1_k(&sliding_controller2_B.In1_j.Velocity[0],
        sliding_controller2_B.y);
      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 6;
           sliding_controller2_B.i++) {
        // SignalConversion generated from: '<S5>/Bus Selector'
        sliding_controller2_B.Q[sliding_controller2_B.i] =
          sliding_controller2_B.In1_a.Q[sliding_controller2_B.i];

        // Sum: '<S30>/Sum3'
        sliding_controller2_B.A[sliding_controller2_B.i] =
          sliding_controller2_B.Q[sliding_controller2_B.i] -
          sliding_controller2_B.In1_e.Position[sliding_controller2_B.i];

        // Sum: '<S30>/Sum1'
        sliding_controller2_B.b_x[sliding_controller2_B.i] =
          sliding_controller2_B.In1_a.Qd[sliding_controller2_B.i] -
          sliding_controller2_B.rtb_Velocity_g[sliding_controller2_B.i];

        // Gain: '<S30>/human proportional gain'
        sliding_controller2_B.rtb_Add1_l[sliding_controller2_B.i] = 0.0;
      }

      for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 6;
           sliding_controller2_B.e_k++) {
        // Gain: '<S30>/human derative gain'
        sliding_controller2_B.B_n[sliding_controller2_B.e_k] = 0.0;
        for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 6;
             sliding_controller2_B.i++) {
          // Gain: '<S30>/human proportional gain' incorporates:
          //   Gain: '<S30>/human derative gain'

          sliding_controller2_B.e_j = 6 * sliding_controller2_B.i +
            sliding_controller2_B.e_k;
          sliding_controller2_B.rtb_Add1_l[sliding_controller2_B.e_k] +=
            Km1[sliding_controller2_B.e_j] *
            sliding_controller2_B.A[sliding_controller2_B.i];

          // Gain: '<S30>/human derative gain'
          sliding_controller2_B.B_n[sliding_controller2_B.e_k] +=
            Dm1[sliding_controller2_B.e_j] *
            sliding_controller2_B.b_x[sliding_controller2_B.i];
        }

        // Sum: '<S5>/Sum2' incorporates:
        //   Sum: '<S30>/Add2'

        sliding_controller2_B.rtb_Saturation_p[sliding_controller2_B.e_k] =
          sliding_controller2_B.rtb_Add1_l[sliding_controller2_B.e_k] +
          sliding_controller2_B.B_n[sliding_controller2_B.e_k];
      }

      // MATLAB Function: '<S5>/MATLAB Function2'
      sliding_controller2_B.y_d[0] = sliding_controller2_B.rtb_Saturation_p[3];
      sliding_controller2_B.y_d[1] = sliding_controller2_B.rtb_Saturation_p[0];
      sliding_controller2_B.y_d[2] = sliding_controller2_B.rtb_Saturation_p[1];
      sliding_controller2_B.y_d[3] = sliding_controller2_B.rtb_Saturation_p[2];
      sliding_controller2_B.y_d[4] = sliding_controller2_B.rtb_Saturation_p[4];
      sliding_controller2_B.y_d[5] = sliding_controller2_B.rtb_Saturation_p[5];
      sliding_controller2_B.y_d[6] = 0.0;
      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 7;
           sliding_controller2_B.i++) {
        // Saturate: '<S5>/human sateration'
        sliding_controller2_B.b_varargout_2_Header_Stamp_Sec =
          sliding_controller2_B.y_d[sliding_controller2_B.i];
        if (sliding_controller2_B.b_varargout_2_Header_Stamp_Sec >
            sliding_controller2_P.human_sat) {
          // Saturate: '<S5>/human sateration'
          sliding_controller2_B.humansateration[sliding_controller2_B.i] =
            sliding_controller2_P.human_sat;
        } else if (sliding_controller2_B.b_varargout_2_Header_Stamp_Sec <
                   -sliding_controller2_P.human_sat) {
          // Saturate: '<S5>/human sateration'
          sliding_controller2_B.humansateration[sliding_controller2_B.i] =
            -sliding_controller2_P.human_sat;
        } else {
          // Saturate: '<S5>/human sateration'
          sliding_controller2_B.humansateration[sliding_controller2_B.i] =
            sliding_controller2_B.b_varargout_2_Header_Stamp_Sec;
        }

        // End of Saturate: '<S5>/human sateration'
      }
    }

    for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 6;
         sliding_controller2_B.i++) {
      // Integrator: '<S29>/Integrator'
      sliding_controller2_B.qd_add[sliding_controller2_B.i] =
        sliding_controller2_X.Integrator_CSTATE[sliding_controller2_B.i];

      // Sum: '<S29>/Sum2' incorporates:
      //   Sum: '<S29>/Sum8'

      sliding_controller2_B.rtb_Saturation_p[sliding_controller2_B.i] =
        sliding_controller2_B.In1_j.Velocity[sliding_controller2_B.i] -
        (sliding_controller2_B.qd_add[sliding_controller2_B.i] +
         sliding_controller2_B.In1_a.Qd[sliding_controller2_B.i]);

      // Sum: '<S29>/Sum1' incorporates:
      //   Integrator: '<S29>/Integrator1'
      //   Sum: '<S29>/Sum7'

      sliding_controller2_B.A[sliding_controller2_B.i] =
        sliding_controller2_B.Position[sliding_controller2_B.i] -
        (sliding_controller2_B.Q[sliding_controller2_B.i] +
         sliding_controller2_X.Integrator1_CSTATE[sliding_controller2_B.i]);
    }

    for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 6;
         sliding_controller2_B.e_k++) {
      // Sum: '<S31>/Add' incorporates:
      //   Gain: '<S31>/lambda SMC'

      sliding_controller2_B.rtb_Saturation_tmp_tmp = 0.0;
      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 6;
           sliding_controller2_B.i++) {
        sliding_controller2_B.rtb_Saturation_tmp_tmp += lambda2[6 *
          sliding_controller2_B.i + sliding_controller2_B.e_k] *
          sliding_controller2_B.A[sliding_controller2_B.i];
      }

      // Trigonometry: '<S31>/Tanh' incorporates:
      //   Gain: '<S31>/lambda SMC'
      //   Gain: '<S31>/surface width SMC'
      //   Sum: '<S31>/Add'

      sliding_controller2_B.b_x[sliding_controller2_B.e_k] = tanh
        ((sliding_controller2_B.rtb_Saturation_tmp_tmp +
          sliding_controller2_B.rtb_Saturation_p[sliding_controller2_B.e_k]) *
         sliding_controller2_P.beta[sliding_controller2_B.e_k]);
    }

    for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 6;
         sliding_controller2_B.e_k++) {
      // Sum: '<S31>/Add1'
      sliding_controller2_B.rtb_Saturation_tmp_tmp = 0.0;

      // Gain: '<S31>/Gain12'
      sliding_controller2_B.A[sliding_controller2_B.e_k] = 0.0;
      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 6;
           sliding_controller2_B.i++) {
        // Sum: '<S31>/Add1' incorporates:
        //   Gain: '<S31>/Gain12'
        //   Gain: '<S31>/rho SMC'

        sliding_controller2_B.e_j = 6 * sliding_controller2_B.i +
          sliding_controller2_B.e_k;
        sliding_controller2_B.rtb_Saturation_tmp_tmp +=
          rho2[sliding_controller2_B.e_j] *
          sliding_controller2_B.b_x[sliding_controller2_B.i];

        // Gain: '<S31>/Gain12'
        sliding_controller2_B.A[sliding_controller2_B.e_k] +=
          lambda2[sliding_controller2_B.e_j] *
          sliding_controller2_B.rtb_Saturation_p[sliding_controller2_B.i];
      }

      // Sum: '<S31>/Add1' incorporates:
      //   Gain: '<S31>/rho SMC'

      sliding_controller2_B.rtb_Add1_l[sliding_controller2_B.e_k] =
        (sliding_controller2_B.In1_a.Qdd[sliding_controller2_B.e_k] -
         sliding_controller2_B.rtb_Saturation_tmp_tmp) -
        sliding_controller2_B.A[sliding_controller2_B.e_k];
    }

    // MATLAB Function: '<S31>/MATLAB Function3'
    sliding_contr_MATLABFunction1_k(sliding_controller2_B.rtb_Add1_l,
      sliding_controller2_B.y_m);

    // BusAssignment: '<S31>/Bus Assignment' incorporates:
    //   SignalConversion generated from: '<S31>/Bus Assignment'

    sliding_controller2_B.BusAssignment = sliding_controller2_B.msg_o;
    for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 7;
         sliding_controller2_B.i++) {
      sliding_controller2_B.BusAssignment.Q[sliding_controller2_B.i] =
        sliding_controller2_B.y_e[sliding_controller2_B.i];
      sliding_controller2_B.BusAssignment.Qd[sliding_controller2_B.i] =
        sliding_controller2_B.y[sliding_controller2_B.i];
      sliding_controller2_B.BusAssignment.Qdd[sliding_controller2_B.i] =
        sliding_controller2_B.y_m[sliding_controller2_B.i];
    }

    // End of BusAssignment: '<S31>/Bus Assignment'

    // Outputs for Atomic SubSystem: '<S31>/Call Service'
    // MATLABSystem: '<S53>/ServiceCaller'
    isCreated = ServCall_sliding_controller2_1160.getIsCreated();
    if (!isCreated) {
      for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 16;
           sliding_controller2_B.e_k++) {
        sliding_controller2_B.b_zeroDelimServiceName[sliding_controller2_B.e_k] =
          tmp[sliding_controller2_B.e_k];
      }

      sliding_controller2_B.b_zeroDelimServiceName[16] = '\x00';
      b_varargout_2 = ServCall_sliding_controller2_1160.createServiceCaller
        (&sliding_controller2_B.b_zeroDelimServiceName[0], true, 1.0);
      if (b_varargout_2 != SLSuccess) {
      } else {
        ServCall_sliding_controller2_1160.call
          (&sliding_controller2_B.BusAssignment,
           &sliding_controller2_B.b_varargout_1);
      }
    } else {
      ServCall_sliding_controller2_1160.call
        (&sliding_controller2_B.BusAssignment,
         &sliding_controller2_B.b_varargout_1);
    }

    // End of Outputs for SubSystem: '<S31>/Call Service'
    for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 7;
         sliding_controller2_B.i++) {
      // Outputs for Atomic SubSystem: '<S31>/Call Service'
      // MATLABSystem: '<S53>/ServiceCaller'
      sliding_controller2_B.b_varargout_2_Header_Stamp_Sec =
        sliding_controller2_B.b_varargout_1.Tau[sliding_controller2_B.i];

      // End of Outputs for SubSystem: '<S31>/Call Service'

      // Saturate: '<S5>/exo sateration'
      if (sliding_controller2_B.b_varargout_2_Header_Stamp_Sec > exo_sat) {
        // Saturate: '<S5>/exo sateration'
        sliding_controller2_B.exosateration[sliding_controller2_B.i] = exo_sat;
      } else if (sliding_controller2_B.b_varargout_2_Header_Stamp_Sec < -exo_sat)
      {
        // Saturate: '<S5>/exo sateration'
        sliding_controller2_B.exosateration[sliding_controller2_B.i] = -exo_sat;
      } else {
        // Saturate: '<S5>/exo sateration'
        sliding_controller2_B.exosateration[sliding_controller2_B.i] =
          sliding_controller2_B.b_varargout_2_Header_Stamp_Sec;
      }

      // End of Saturate: '<S5>/exo sateration'
    }

    for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 6;
         sliding_controller2_B.e_k++) {
      // Product: '<S29>/Product'
      sliding_controller2_B.A[sliding_controller2_B.e_k] = 0.0;

      // Product: '<S29>/Product1'
      sliding_controller2_B.b_x[sliding_controller2_B.e_k] = 0.0;
      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 6;
           sliding_controller2_B.i++) {
        // Product: '<S29>/Product' incorporates:
        //   Integrator: '<S29>/Integrator1'
        //   Product: '<S29>/Product1'

        sliding_controller2_B.e_j = 6 * sliding_controller2_B.i +
          sliding_controller2_B.e_k;
        sliding_controller2_B.A[sliding_controller2_B.e_k] +=
          sliding_controller2_B.K[sliding_controller2_B.e_j] *
          sliding_controller2_X.Integrator1_CSTATE[sliding_controller2_B.i];

        // Product: '<S29>/Product1'
        sliding_controller2_B.b_x[sliding_controller2_B.e_k] +=
          sliding_controller2_B.B[sliding_controller2_B.e_j] *
          sliding_controller2_B.qd_add[sliding_controller2_B.i];
      }

      // Sum: '<S29>/Sum6' incorporates:
      //   Sum: '<S29>/Add1'

      sliding_controller2_B.rtb_Add1_l[sliding_controller2_B.e_k] =
        sliding_controller2_B.Sum[sliding_controller2_B.e_k] -
        (sliding_controller2_B.A[sliding_controller2_B.e_k] +
         sliding_controller2_B.b_x[sliding_controller2_B.e_k]);

      // Gain: '<S29>/addmittance gain'
      sliding_controller2_B.qd_add_n[sliding_controller2_B.e_k] = 0.0;
    }

    for (sliding_controller2_B.e_k = 0; sliding_controller2_B.e_k < 6;
         sliding_controller2_B.e_k++) {
      for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 6;
           sliding_controller2_B.i++) {
        // Gain: '<S29>/addmittance gain'
        sliding_controller2_B.qd_add_n[sliding_controller2_B.e_k] += invMd[6 *
          sliding_controller2_B.i + sliding_controller2_B.e_k] *
          sliding_controller2_B.rtb_Add1_l[sliding_controller2_B.i];
      }
    }

    if (rtmIsMajorTimeStep((&sliding_controller2_M))) {
      // MATLAB Function: '<S40>/MATLAB Function'
      sliding_controll_MATLABFunction(&sliding_controller2_B.In1_e.Position[0],
        sliding_controller2_B.rtb_y_f_j);

      // MATLAB Function: '<S40>/MATLAB Function1'
      sliding_control_MATLABFunction1(&sliding_controller2_B.In1_e.Position[0],
        sliding_controller2_B.rtb_y_f_j);

      // MATLAB Function: '<S41>/MATLAB Function'
      sliding_controll_MATLABFunction(&sliding_controller2_B.In1_e.Position[3],
        sliding_controller2_B.rtb_y_f_j);

      // MATLAB Function: '<S41>/MATLAB Function1'
      sliding_control_MATLABFunction1(&sliding_controller2_B.In1_e.Position[3],
        sliding_controller2_B.rtb_y_f_j);

      // BusAssignment: '<S5>/Bus Assignment2' incorporates:
      //   Constant: '<S5>/Constant'

      rtb_BusAssignment2_d.Data = sliding_controller2_P.Constant_Value_i1;

      // Outputs for Atomic SubSystem: '<S5>/Publish1'
      // MATLABSystem: '<S28>/SinkBlock'
      Pub_sliding_controller2_1405.publish(&rtb_BusAssignment2_d);

      // End of Outputs for SubSystem: '<S5>/Publish1'
    }
  }

  // End of Outputs for SubSystem: '<Root>/Controller'

  // Outputs for Enabled SubSystem: '<Root>/Enabled Subsystem' incorporates:
  //   EnablePort: '<S6>/Enable'

  if (rtmIsMajorTimeStep((&sliding_controller2_M)) && rtmIsMajorTimeStep
      ((&sliding_controller2_M))) {
    sliding_controller2_DW.EnabledSubsystem_MODE =
      sliding_controller2_B.LogicalOperator;
  }

  if (sliding_controller2_DW.EnabledSubsystem_MODE) {
    // BusAssignment: '<S6>/Bus Assignment1' incorporates:
    //   SignalConversion generated from: '<S6>/Bus Assignment1'

    sliding_controller2_B.BusAssignment1 = sliding_controller2_B.msg_n;
    for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 7;
         sliding_controller2_B.i++) {
      sliding_controller2_B.BusAssignment1.Effort[sliding_controller2_B.i] =
        sliding_controller2_B.exosateration[sliding_controller2_B.i];
    }

    sliding_controller2_B.BusAssignment1.Header =
      sliding_controller2_B.BusAssignment1_m;

    // End of BusAssignment: '<S6>/Bus Assignment1'

    // Outputs for Atomic SubSystem: '<S6>/Publish1'
    // MATLABSystem: '<S57>/SinkBlock'
    Pub_sliding_controller2_1242.publish(&sliding_controller2_B.BusAssignment1);

    // End of Outputs for SubSystem: '<S6>/Publish1'

    // BusAssignment: '<S6>/Bus Assignment2' incorporates:
    //   SignalConversion generated from: '<S6>/Bus Assignment2'

    sliding_controller2_B.BusAssignment1 = sliding_controller2_B.msg;
    for (sliding_controller2_B.i = 0; sliding_controller2_B.i < 7;
         sliding_controller2_B.i++) {
      sliding_controller2_B.BusAssignment1.Effort[sliding_controller2_B.i] =
        sliding_controller2_B.humansateration[sliding_controller2_B.i];
    }

    sliding_controller2_B.BusAssignment1.Header =
      sliding_controller2_B.BusAssignment1_m;

    // End of BusAssignment: '<S6>/Bus Assignment2'

    // Outputs for Atomic SubSystem: '<S6>/Publish2'
    // MATLABSystem: '<S58>/SinkBlock'
    Pub_sliding_controller2_1246.publish(&sliding_controller2_B.BusAssignment1);

    // End of Outputs for SubSystem: '<S6>/Publish2'
  }

  // End of Outputs for SubSystem: '<Root>/Enabled Subsystem'
  if (rtmIsMajorTimeStep((&sliding_controller2_M))) {
    // Outputs for Atomic SubSystem: '<Root>/Subscribe5'
    // MATLABSystem: '<S18>/SourceBlock'
    sliding_cont_SystemCore_step_kc();

    // End of Outputs for SubSystem: '<Root>/Subscribe5'

    // Outputs for Atomic SubSystem: '<Root>/Subscribe6'
    // MATLABSystem: '<S19>/SourceBlock'
    sliding_con_SystemCore_step_kcj();

    // End of Outputs for SubSystem: '<Root>/Subscribe6'

    // Outputs for Atomic SubSystem: '<Root>/Subscribe3'
    // MATLABSystem: '<S16>/SourceBlock'
    Sub_sliding_controller2_1778.getLatestMessage
      (&sliding_controller2_B.b_varargout_2_cx);

    // End of Outputs for SubSystem: '<Root>/Subscribe3'
  }

  if (rtmIsMajorTimeStep((&sliding_controller2_M))) {
    rt_ertODEUpdateContinuousStates(&(&sliding_controller2_M)->solverInfo);

    // Update absolute time for base rate
    // The "clockTick0" counts the number of times the code of this task has
    //  been executed. The absolute time is the multiplication of "clockTick0"
    //  and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
    //  overflow during the application lifespan selected.

    ++(&sliding_controller2_M)->Timing.clockTick0;
    (&sliding_controller2_M)->Timing.t[0] = rtsiGetSolverStopTime
      (&(&sliding_controller2_M)->solverInfo);

    {
      // Update absolute timer for sample time: [0.001s, 0.0s]
      // The "clockTick1" counts the number of times the code of this task has
      //  been executed. The resolution of this integer timer is 0.001, which is the step size
      //  of the task. Size of "clockTick1" ensures timer will not overflow during the
      //  application lifespan selected.

      (&sliding_controller2_M)->Timing.clockTick1++;
    }
  }                                    // end MajorTimeStep
}

// Derivatives for root system: '<Root>'
void sliding_controller2ModelClass::sliding_controller2_derivatives()
{
  sliding_controller2ModelClass::XDot_sliding_controller2_T *_rtXdot;
  int32_T i;
  _rtXdot = ((XDot_sliding_controller2_T *) (&sliding_controller2_M)->derivs);

  // Derivatives for Enabled SubSystem: '<Root>/Controller'
  if (sliding_controller2_DW.Controller_MODE) {
    for (i = 0; i < 6; i++) {
      // Derivatives for Integrator: '<S29>/Integrator1'
      _rtXdot->Integrator1_CSTATE[i] = sliding_controller2_B.qd_add[i];

      // Derivatives for Integrator: '<S29>/Integrator'
      _rtXdot->Integrator_CSTATE[i] = sliding_controller2_B.qd_add_n[i];
    }
  } else {
    {
      real_T *dx;
      int_T i;
      dx = &(((XDot_sliding_controller2_T *) (&sliding_controller2_M)->derivs)
             ->Integrator1_CSTATE[0]);
      for (i=0; i < 12; i++) {
        dx[i] = 0.0;
      }
    }
  }

  // End of Derivatives for SubSystem: '<Root>/Controller'
}

// Model initialize function
void sliding_controller2ModelClass::initialize()
{
  // Registration code

  // initialize non-finites
  rt_InitInfAndNaN(sizeof(real_T));

  {
    // Setup solver object
    rtsiSetSimTimeStepPtr(&(&sliding_controller2_M)->solverInfo,
                          &(&sliding_controller2_M)->Timing.simTimeStep);
    rtsiSetTPtr(&(&sliding_controller2_M)->solverInfo, &rtmGetTPtr
                ((&sliding_controller2_M)));
    rtsiSetStepSizePtr(&(&sliding_controller2_M)->solverInfo,
                       &(&sliding_controller2_M)->Timing.stepSize0);
    rtsiSetdXPtr(&(&sliding_controller2_M)->solverInfo, &(&sliding_controller2_M)
                 ->derivs);
    rtsiSetContStatesPtr(&(&sliding_controller2_M)->solverInfo, (real_T **)
                         &(&sliding_controller2_M)->contStates);
    rtsiSetNumContStatesPtr(&(&sliding_controller2_M)->solverInfo,
      &(&sliding_controller2_M)->Sizes.numContStates);
    rtsiSetNumPeriodicContStatesPtr(&(&sliding_controller2_M)->solverInfo,
      &(&sliding_controller2_M)->Sizes.numPeriodicContStates);
    rtsiSetPeriodicContStateIndicesPtr(&(&sliding_controller2_M)->solverInfo, &(
      &sliding_controller2_M)->periodicContStateIndices);
    rtsiSetPeriodicContStateRangesPtr(&(&sliding_controller2_M)->solverInfo,
      &(&sliding_controller2_M)->periodicContStateRanges);
    rtsiSetErrorStatusPtr(&(&sliding_controller2_M)->solverInfo,
                          (&rtmGetErrorStatus((&sliding_controller2_M))));
    rtsiSetRTModelPtr(&(&sliding_controller2_M)->solverInfo,
                      (&sliding_controller2_M));
  }

  rtsiSetSimTimeStep(&(&sliding_controller2_M)->solverInfo, MAJOR_TIME_STEP);
  (&sliding_controller2_M)->intgData.y = (&sliding_controller2_M)->odeY;
  (&sliding_controller2_M)->intgData.f[0] = (&sliding_controller2_M)->odeF[0];
  (&sliding_controller2_M)->intgData.f[1] = (&sliding_controller2_M)->odeF[1];
  (&sliding_controller2_M)->intgData.f[2] = (&sliding_controller2_M)->odeF[2];
  (&sliding_controller2_M)->contStates = ((X_sliding_controller2_T *)
    &sliding_controller2_X);
  rtsiSetSolverData(&(&sliding_controller2_M)->solverInfo, static_cast<void *>
                    (&(&sliding_controller2_M)->intgData));
  rtsiSetSolverName(&(&sliding_controller2_M)->solverInfo,"ode3");
  rtmSetTPtr((&sliding_controller2_M), &(&sliding_controller2_M)->Timing.tArray
             [0]);
  (&sliding_controller2_M)->Timing.stepSize0 = 0.001;

  {
    int32_T i;
    char_T b_zeroDelimTopic[16];
    char_T b_zeroDelimTopic_tmp[16];
    char_T b_zeroDelimTopic_0[11];
    char_T b_zeroDelimTopic_1[10];
    static const char_T tmp[15] = { '/', 'e', 'x', 'o', '_', 'j', 'o', 'i', 'n',
      't', 's', 't', 'a', 't', 'e' };

    static const char_T tmp_0[17] = { '/', 'h', 'u', 'm', 'a', 'n', '_', 'j',
      'o', 'i', 'n', 't', 's', 't', 'a', 't', 'e' };

    static const char_T tmp_1[10] = { '/', 's', 't', 'a', 'r', 't', '_', 's',
      'i', 'm' };

    static const char_T tmp_2[23] = { '/', 'e', 'x', 'o', 's', 'i', 'm', 'u',
      'l', 'i', 'n', 'k', '_', 's', 'e', 't', '_', 'p', 'o', 'i', 'n', 't', 's'
    };

    static const char_T tmp_3[9] = { '/', 'm', 'y', '_', 't', 'o', 'p', 'i', 'c'
    };

    static const char_T tmp_4[20] = { '/', 'e', 'x', 'o', '_', 's', 'i', 'm',
      'u', 'l', 'i', 'n', 'k', '_', 't', 'o', 'r', 'q', 'u', 'e' };

    static const char_T tmp_5[22] = { '/', 'h', 'u', 'm', 'a', 'n', '_', 's',
      'i', 'm', 'u', 'l', 'i', 'n', 'k', '_', 't', 'o', 'r', 'q', 'u', 'e' };

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe1'
    // SystemInitialize for Enabled SubSystem: '<S14>/Enabled Subsystem'
    // SystemInitialize for Outport: '<S60>/Out1' incorporates:
    //   Inport: '<S60>/In1'

    sliding_controller2_B.In1_n = sliding_controller2_P.Out1_Y0;

    // End of SystemInitialize for SubSystem: '<S14>/Enabled Subsystem'

    // Start for MATLABSystem: '<S14>/SourceBlock' incorporates:
    //   MATLABSystem: '<S18>/SourceBlock'

    sliding_controller2_DW.obj_cg.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_cg.isInitialized = 1;

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe5'
    for (i = 0; i < 15; i++) {
      b_zeroDelimTopic_tmp[i] = tmp[i];
    }

    b_zeroDelimTopic_tmp[15] = '\x00';

    // End of SystemInitialize for SubSystem: '<Root>/Subscribe5'
    for (i = 0; i < 16; i++) {
      b_zeroDelimTopic[i] = b_zeroDelimTopic_tmp[i];
    }

    Sub_sliding_controller2_1262.createSubscriber(&b_zeroDelimTopic[0], 1);
    sliding_controller2_DW.obj_cg.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S14>/SourceBlock'
    // End of SystemInitialize for SubSystem: '<Root>/Subscribe1'

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe2'
    // SystemInitialize for Enabled SubSystem: '<S15>/Enabled Subsystem'
    // SystemInitialize for Outport: '<S61>/Out1' incorporates:
    //   Inport: '<S61>/In1'

    sliding_controller2_B.In1_g = sliding_controller2_P.Out1_Y0_f;

    // End of SystemInitialize for SubSystem: '<S15>/Enabled Subsystem'

    // Start for MATLABSystem: '<S15>/SourceBlock' incorporates:
    //   MATLABSystem: '<S19>/SourceBlock'

    sliding_controller2_DW.obj_h.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_h.isInitialized = 1;

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe6'
    for (i = 0; i < 17; i++) {
      sliding_controller2_B.b_zeroDelimTopic_tmp_d[i] = tmp_0[i];
    }

    sliding_controller2_B.b_zeroDelimTopic_tmp_d[17] = '\x00';

    // End of SystemInitialize for SubSystem: '<Root>/Subscribe6'
    for (i = 0; i < 18; i++) {
      sliding_controller2_B.b_zeroDelimTopic_l[i] =
        sliding_controller2_B.b_zeroDelimTopic_tmp_d[i];
    }

    Sub_sliding_controller2_1277.createSubscriber
      (&sliding_controller2_B.b_zeroDelimTopic_l[0], 1);
    sliding_controller2_DW.obj_h.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S15>/SourceBlock'
    // End of SystemInitialize for SubSystem: '<Root>/Subscribe2'

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe4'
    // SystemInitialize for Enabled SubSystem: '<S17>/Enabled Subsystem'
    // SystemInitialize for Outport: '<S63>/Out1' incorporates:
    //   Inport: '<S63>/In1'

    sliding_controller2_B.In1_k = sliding_controller2_P.Out1_Y0_d;

    // End of SystemInitialize for SubSystem: '<S17>/Enabled Subsystem'

    // Start for MATLABSystem: '<S17>/SourceBlock'
    sliding_controller2_DW.obj_c.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_c.isInitialized = 1;
    for (i = 0; i < 10; i++) {
      b_zeroDelimTopic_0[i] = tmp_1[i];
    }

    b_zeroDelimTopic_0[10] = '\x00';
    Sub_sliding_controller2_1418.createSubscriber(&b_zeroDelimTopic_0[0], 1);
    sliding_controller2_DW.obj_c.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S17>/SourceBlock'
    // End of SystemInitialize for SubSystem: '<Root>/Subscribe4'

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe'
    // SystemInitialize for Enabled SubSystem: '<S13>/Enabled Subsystem'
    // SystemInitialize for Outport: '<S59>/Out1' incorporates:
    //   Inport: '<S59>/In1'

    sliding_controller2_B.In1_a = sliding_controller2_P.Out1_Y0_i;

    // End of SystemInitialize for SubSystem: '<S13>/Enabled Subsystem'

    // Start for MATLABSystem: '<S13>/SourceBlock' incorporates:
    //   MATLABSystem: '<S16>/SourceBlock'

    sliding_controller2_DW.obj_g.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_g.isInitialized = 1;

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe3'
    for (i = 0; i < 23; i++) {
      sliding_controller2_B.b_zeroDelimTopic_tmp[i] = tmp_2[i];
    }

    sliding_controller2_B.b_zeroDelimTopic_tmp[23] = '\x00';

    // End of SystemInitialize for SubSystem: '<Root>/Subscribe3'
    for (i = 0; i < 24; i++) {
      sliding_controller2_B.b_zeroDelimTopic[i] =
        sliding_controller2_B.b_zeroDelimTopic_tmp[i];
    }

    Sub_sliding_controller2_35.createSubscriber
      (&sliding_controller2_B.b_zeroDelimTopic[0], 1);
    sliding_controller2_DW.obj_g.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S13>/SourceBlock'
    // End of SystemInitialize for SubSystem: '<Root>/Subscribe'

    // SystemInitialize for Enabled SubSystem: '<Root>/Enabled Subsystem1'
    // SystemInitialize for Outport: '<S7>/exo' incorporates:
    //   Inport: '<S7>/In1'

    sliding_controller2_B.In1_j = sliding_controller2_P.exo_Y0;

    // End of SystemInitialize for SubSystem: '<Root>/Enabled Subsystem1'

    // SystemInitialize for Enabled SubSystem: '<Root>/Enabled Subsystem2'
    // SystemInitialize for Outport: '<S8>/human' incorporates:
    //   Inport: '<S8>/In1'

    sliding_controller2_B.In1_e = sliding_controller2_P.human_Y0;

    // End of SystemInitialize for SubSystem: '<Root>/Enabled Subsystem2'

    // SystemInitialize for Enabled SubSystem: '<Root>/Controller'
    for (i = 0; i < 6; i++) {
      // InitializeConditions for Integrator: '<S29>/Integrator1'
      sliding_controller2_X.Integrator1_CSTATE[i] =
        sliding_controller2_P.Integrator1_IC[i];

      // InitializeConditions for Integrator: '<S29>/Integrator'
      sliding_controller2_X.Integrator_CSTATE[i] =
        sliding_controller2_P.Integrator_IC;
    }

    // SystemInitialize for Atomic SubSystem: '<S31>/Call Service'
    // Start for MATLABSystem: '<S53>/ServiceCaller'
    sliding_controller2_DW.obj_ox.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_ox.isInitialized = 1;
    sliding_controller2_DW.obj_ox.isSetupComplete = true;

    // End of SystemInitialize for SubSystem: '<S31>/Call Service'

    // SystemInitialize for Atomic SubSystem: '<S5>/Publish1'
    // Start for MATLABSystem: '<S28>/SinkBlock'
    sliding_controller2_DW.obj_o.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_o.isInitialized = 1;
    for (i = 0; i < 9; i++) {
      b_zeroDelimTopic_1[i] = tmp_3[i];
    }

    b_zeroDelimTopic_1[9] = '\x00';
    Pub_sliding_controller2_1405.createPublisher(&b_zeroDelimTopic_1[0], 1);
    sliding_controller2_DW.obj_o.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S28>/SinkBlock'
    // End of SystemInitialize for SubSystem: '<S5>/Publish1'
    for (i = 0; i < 7; i++) {
      // SystemInitialize for Saturate: '<S5>/exo sateration' incorporates:
      //   Outport: '<S5>/exo tau'

      sliding_controller2_B.exosateration[i] = sliding_controller2_P.exotau_Y0;

      // SystemInitialize for Saturate: '<S5>/human sateration' incorporates:
      //   Outport: '<S5>/human tau'

      sliding_controller2_B.humansateration[i] =
        sliding_controller2_P.humantau_Y0;
    }

    // End of SystemInitialize for SubSystem: '<Root>/Controller'

    // SystemInitialize for Enabled SubSystem: '<Root>/Enabled Subsystem'
    // SystemInitialize for Atomic SubSystem: '<S6>/Publish1'
    // Start for MATLABSystem: '<S57>/SinkBlock'
    sliding_controller2_DW.obj_n.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_n.isInitialized = 1;
    for (i = 0; i < 20; i++) {
      sliding_controller2_B.b_zeroDelimTopic_g[i] = tmp_4[i];
    }

    sliding_controller2_B.b_zeroDelimTopic_g[20] = '\x00';
    Pub_sliding_controller2_1242.createPublisher
      (&sliding_controller2_B.b_zeroDelimTopic_g[0], 1);
    sliding_controller2_DW.obj_n.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S57>/SinkBlock'
    // End of SystemInitialize for SubSystem: '<S6>/Publish1'

    // SystemInitialize for Atomic SubSystem: '<S6>/Publish2'
    // Start for MATLABSystem: '<S58>/SinkBlock'
    sliding_controller2_DW.obj_m.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_m.isInitialized = 1;
    for (i = 0; i < 22; i++) {
      sliding_controller2_B.b_zeroDelimTopic_d[i] = tmp_5[i];
    }

    sliding_controller2_B.b_zeroDelimTopic_d[22] = '\x00';
    Pub_sliding_controller2_1246.createPublisher
      (&sliding_controller2_B.b_zeroDelimTopic_d[0], 1);
    sliding_controller2_DW.obj_m.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S58>/SinkBlock'
    // End of SystemInitialize for SubSystem: '<S6>/Publish2'
    // End of SystemInitialize for SubSystem: '<Root>/Enabled Subsystem'

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe5'
    // Start for MATLABSystem: '<S18>/SourceBlock'
    sliding_controller2_DW.obj_k.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_k.isInitialized = 1;
    Sub_sliding_controller2_1779.createSubscriber(&b_zeroDelimTopic_tmp[0], 1);
    sliding_controller2_DW.obj_k.isSetupComplete = true;

    // End of SystemInitialize for SubSystem: '<Root>/Subscribe5'

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe6'
    // Start for MATLABSystem: '<S19>/SourceBlock'
    sliding_controller2_DW.obj_j.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_j.isInitialized = 1;
    Sub_sliding_controller2_1780.createSubscriber
      (&sliding_controller2_B.b_zeroDelimTopic_tmp_d[0], 1);
    sliding_controller2_DW.obj_j.isSetupComplete = true;

    // End of SystemInitialize for SubSystem: '<Root>/Subscribe6'

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe3'
    // Start for MATLABSystem: '<S16>/SourceBlock'
    sliding_controller2_DW.obj_a.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj_a.isInitialized = 1;
    Sub_sliding_controller2_1778.createSubscriber
      (&sliding_controller2_B.b_zeroDelimTopic_tmp[0], 1);
    sliding_controller2_DW.obj_a.isSetupComplete = true;

    // End of SystemInitialize for SubSystem: '<Root>/Subscribe3'

    // Start for MATLABSystem: '<Root>/Current Time'
    sliding_controller2_DW.obj.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.obj.isInitialized = 1;
    sliding_controller2_DW.obj.isSetupComplete = true;
  }
}

// Model terminate function
void sliding_controller2ModelClass::terminate()
{
  // Terminate for Atomic SubSystem: '<Root>/Subscribe1'
  // Terminate for MATLABSystem: '<S14>/SourceBlock'
  if (!sliding_controller2_DW.obj_cg.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_cg.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S14>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe1'

  // Terminate for Atomic SubSystem: '<Root>/Subscribe2'
  // Terminate for MATLABSystem: '<S15>/SourceBlock'
  if (!sliding_controller2_DW.obj_h.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_h.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S15>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe2'

  // Terminate for Atomic SubSystem: '<Root>/Subscribe4'
  // Terminate for MATLABSystem: '<S17>/SourceBlock'
  if (!sliding_controller2_DW.obj_c.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_c.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S17>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe4'

  // Terminate for MATLABSystem: '<Root>/Current Time'
  if (!sliding_controller2_DW.obj.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<Root>/Current Time'

  // Terminate for Atomic SubSystem: '<Root>/Subscribe'
  // Terminate for MATLABSystem: '<S13>/SourceBlock'
  if (!sliding_controller2_DW.obj_g.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_g.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S13>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe'

  // Terminate for Enabled SubSystem: '<Root>/Controller'
  // Terminate for Atomic SubSystem: '<S31>/Call Service'
  // Terminate for MATLABSystem: '<S53>/ServiceCaller'
  if (!sliding_controller2_DW.obj_ox.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_ox.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S53>/ServiceCaller'
  // End of Terminate for SubSystem: '<S31>/Call Service'

  // Terminate for Atomic SubSystem: '<S5>/Publish1'
  // Terminate for MATLABSystem: '<S28>/SinkBlock'
  if (!sliding_controller2_DW.obj_o.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_o.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S28>/SinkBlock'
  // End of Terminate for SubSystem: '<S5>/Publish1'
  // End of Terminate for SubSystem: '<Root>/Controller'

  // Terminate for Enabled SubSystem: '<Root>/Enabled Subsystem'
  // Terminate for Atomic SubSystem: '<S6>/Publish1'
  // Terminate for MATLABSystem: '<S57>/SinkBlock'
  if (!sliding_controller2_DW.obj_n.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_n.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S57>/SinkBlock'
  // End of Terminate for SubSystem: '<S6>/Publish1'

  // Terminate for Atomic SubSystem: '<S6>/Publish2'
  // Terminate for MATLABSystem: '<S58>/SinkBlock'
  if (!sliding_controller2_DW.obj_m.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_m.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S58>/SinkBlock'
  // End of Terminate for SubSystem: '<S6>/Publish2'
  // End of Terminate for SubSystem: '<Root>/Enabled Subsystem'

  // Terminate for Atomic SubSystem: '<Root>/Subscribe5'
  // Terminate for MATLABSystem: '<S18>/SourceBlock'
  if (!sliding_controller2_DW.obj_k.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_k.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S18>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe5'

  // Terminate for Atomic SubSystem: '<Root>/Subscribe6'
  // Terminate for MATLABSystem: '<S19>/SourceBlock'
  if (!sliding_controller2_DW.obj_j.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_j.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S19>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe6'

  // Terminate for Atomic SubSystem: '<Root>/Subscribe3'
  // Terminate for MATLABSystem: '<S16>/SourceBlock'
  if (!sliding_controller2_DW.obj_a.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_a.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S16>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe3'
}

// Constructor
sliding_controller2ModelClass::sliding_controller2ModelClass() :
  sliding_controller2_B(),
  sliding_controller2_DW(),
  sliding_controller2_X(),
  sliding_controller2_M()
{
  // Currently there is no constructor body generated.
}

// Destructor
sliding_controller2ModelClass::~sliding_controller2ModelClass()
{
  // Currently there is no destructor body generated.
}

// Real-Time Model get method
sliding_controller2ModelClass::RT_MODEL_sliding_controller2_T
  * sliding_controller2ModelClass::getRTM()
{
  return (&sliding_controller2_M);
}

//
// File trailer for generated code.
//
// [EOF]
//
