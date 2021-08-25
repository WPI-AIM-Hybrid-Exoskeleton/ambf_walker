//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: sliding_controller_const.cpp
//
// Code generated for Simulink model 'sliding_controller_const'.
//
// Model version                  : 1.205
// Simulink Coder version         : 9.5 (R2021a) 14-Nov-2020
// C/C++ source code generated on : Wed Aug 25 09:23:23 2021
//
// Target selection: ert.tlc
// Embedded hardware selection: Generic->Unspecified (assume 32-bit Generic)
// Code generation objectives: Unspecified
// Validation result: Not run
//
#include "sliding_controller_const.h"
#include "sliding_controller_const_private.h"

// Exported block parameters
real_T Bn0[7] = { 508.81249047401235, 508.81249047401269, 508.81249047401269,
  508.81249047401235, 508.81249047401269, 508.81249047401269, 0.0 } ;// Variable: Bn0
                                                                      //  Referenced by: '<S26>/Constant3'


real_T Bp0[7] = { 498.49313176345015, 508.81249047401269, 508.81249047401269,
  498.49313176345015, 508.81249047401269, 508.81249047401269, 0.0 } ;// Variable: Bp0
                                                                      //  Referenced by: '<S26>/Constant2'


real_T Dm1[49] = { 496.5698213482, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 100.0, 0.0,
  0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 100.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  496.5698213482, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 100.0, 0.0, 0.0, 0.0, 0.0,
  0.0, 0.0, 0.0, 100.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 } ;// Variable: Dm1
                                                                     //  Referenced by: '<S27>/human derative gain'


real_T Km1[49] = { 6017.73151361233, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  2898.16820260871, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2898.16820260871, 0.0,
  0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 6017.73151361233, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  0.0, 2898.16820260871, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2898.16820260871,
  0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 } ;// Variable: Km1
                                               //  Referenced by: '<S27>/human proportional gain'


real_T Kn0[7] = { 508.81249047401235, 508.81249047401235, 508.81249047401235,
  508.81249047401235, 508.81249047401235, 508.81249047401235, 0.0 } ;// Variable: Kn0
                                                                      //  Referenced by: '<S26>/Constant1'


real_T Kp0[7] = { 0.50881249047401234, 0.50881249047401234, 0.50881249047401234,
  0.50881249047401234, 0.50881249047401234, 0.50881249047401234, 0.0 } ;// Variable: Kp0
                                                                      //  Referenced by: '<S26>/Constant'


real_T dampener[4] = { 30.0, 0.0, 0.0, 30.0 } ;// Variable: dampener
                                                  //  Referenced by:
                                                  //    '<S34>/dampener left shank'
                                                  //    '<S35>/dampener left thigh'
                                                  //    '<S36>/dampener right shank'
                                                  //    '<S37>/dampener right shank'


real_T exo_sat = 50.0;                 // Variable: exo_sat
                                          //  Referenced by: '<S6>/exo sateration'

real_T invMd[49] = { 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, -0.0, 0.0, 0.1, 0.0, 0.0, 0.0,
  0.0, -0.0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, -0.0, 0.0, 0.0, 0.0, 0.1, 0.0, 0.0,
  -0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.0, -0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, -0.0,
  -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, 0.1 } ;// Variable: invMd
                                                //  Referenced by: '<S26>/addmittance gain'


real_T lambda2[49] = { 1.1276851851851846, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  1.2388618589010809, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0,
  0.0, 0.0, 0.0, 1.1276851851851846, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  1.2388618589010809, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0,
  0.0, 0.0, 0.0, 0.0 } ;               // Variable: lambda2
                                          //  Referenced by:
                                          //    '<S29>/Gain12'
                                          //    '<S29>/lambda SMC'


real_T rho2[49] = { 152.64374714220378, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  457.93124142661219, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 50.0, 0.0, 0.0, 0.0,
  0.0, 0.0, 0.0, 0.0, 152.64374714220378, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  457.93124142661219, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 50.0, 0.0, 0.0, 0.0,
  0.0, 0.0, 0.0, 0.0, 0.0 } ;          // Variable: rho2
                                          //  Referenced by: '<S29>/rho SMC'


//
// This function updates continuous states using the ODE3 fixed-step
// solver algorithm
//
void sliding_controller_constModelClass::rt_ertODEUpdateContinuousStates
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
  int_T nXc = 14;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);

  // Save the state values at time t in y, we'll use x as ynew.
  (void) memcpy(y, x,
                static_cast<uint_T>(nXc)*sizeof(real_T));

  // Assumes that rtsiSetT and ModelOutputs are up-to-date
  // f0 = f(t,y)
  rtsiSetdX(si, f0);
  sliding_controller_const_derivatives();

  // f(:,2) = feval(odefile, t + hA(1), y + f*hB(:,1), args(:)(*));
  hB[0] = h * rt_ODE3_B[0][0];
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[0]);
  rtsiSetdX(si, f1);
  this->step();
  sliding_controller_const_derivatives();

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
  sliding_controller_const_derivatives();

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
//    '<S19>/exo left'
//    '<S19>/exo right'
//    '<S19>/human left'
//    '<S19>/human right'
//
void sliding_controller_constModelClass::sliding_controller_cons_exoleft(const
  real_T rtu_q[2], const real_T rtu_qd[2], real_T rty_knee[2], real_T rty_dknee
  [2], real_T rty_ankle[2], real_T rty_danke[2])
{
  real_T a;
  real_T rty_knee_0;
  real_T rty_knee_1;
  real_T tmp;
  real_T tmp_0;
  tmp = sin(rtu_q[0]);
  tmp_0 = cos(rtu_q[0]);
  rty_knee[0] = -0.324 * tmp_0;
  rty_knee[1] = -0.324 * tmp;
  a = -0.324 * rtu_qd[0];
  rty_dknee[0] = a * -tmp;
  rty_dknee[1] = a * tmp_0;
  a = (rtu_qd[0] + rtu_qd[1]) * -0.39;
  rty_knee_0 = rty_knee[0];
  rty_knee_1 = rty_knee[1];
  tmp = rtu_q[0] + rtu_q[1];
  tmp_0 = sin(tmp);
  rty_ankle[0] = rty_knee_0 - tmp_0 * -0.39;
  tmp = cos(tmp);
  rty_ankle[1] = rty_knee_1 - tmp * -0.39;
  rty_knee_0 = rty_dknee[0];
  rty_knee_1 = rty_dknee[1];
  rty_danke[0] = -tmp_0 * a + rty_knee_0;
  rty_danke[1] = tmp * a + rty_knee_1;
}

//
// Output and update for atomic system:
//    '<S38>/MATLAB Function'
//    '<S39>/MATLAB Function'
//    '<S44>/MATLAB Function'
//    '<S45>/MATLAB Function'
//
void sliding_controller_constModelClass::sliding_controll_MATLABFunction(const
  real_T rtu_q[2], real_T rty_y[4])
{
  rty_y[0] = -0.324 * sin(rtu_q[0]);
  rty_y[2] = 0.0;
  rty_y[1] = 0.324 * cos(rtu_q[0]);
  rty_y[3] = 0.0;
}

//
// Output and update for atomic system:
//    '<S38>/MATLAB Function1'
//    '<S39>/MATLAB Function1'
//    '<S44>/MATLAB Function1'
//    '<S45>/MATLAB Function1'
//
void sliding_controller_constModelClass::sliding_control_MATLABFunction1(const
  real_T rtu_q[2], real_T rty_y[4])
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

void sliding_controller_constModelClass::sliding_control_SystemCore_step
  (boolean_T *varargout_1, uint32_T *varargout_2_Header_Seq, real_T
   *varargout_2_Header_Stamp_Sec, real_T *varargout_2_Header_Stamp_Nsec, uint8_T
   varargout_2_Header_FrameId[128], uint32_T *varargout_2_Header_FrameId_SL_I,
   uint32_T *varargout_2_Header_FrameId_SL_0,
   SL_Bus_sliding_controller_const_std_msgs_String varargout_2_Name[16],
   uint32_T *varargout_2_Name_SL_Info_Curren, uint32_T
   *varargout_2_Name_SL_Info_Receiv, real_T varargout_2_Position[7], uint32_T
   *varargout_2_Position_SL_Info_Cu, uint32_T *varargout_2_Position_SL_Info_Re,
   real_T varargout_2_Velocity[7], uint32_T *varargout_2_Velocity_SL_Info_Cu,
   uint32_T *varargout_2_Velocity_SL_Info_Re, real_T varargout_2_Effort[7],
   SL_Bus_ROSVariableLengthArrayInfo *varargout_2_Effort_SL_Info)
{
  int32_T i;
  *varargout_1 = Sub_sliding_controller_const_1262.getLatestMessage
    (&sliding_controller_const_B.b_varargout_2_m);
  *varargout_2_Header_Seq =
    sliding_controller_const_B.b_varargout_2_m.Header.Seq;
  *varargout_2_Header_Stamp_Sec =
    sliding_controller_const_B.b_varargout_2_m.Header.Stamp.Sec;
  *varargout_2_Header_Stamp_Nsec =
    sliding_controller_const_B.b_varargout_2_m.Header.Stamp.Nsec;
  memcpy(&varargout_2_Header_FrameId[0],
         &sliding_controller_const_B.b_varargout_2_m.Header.FrameId[0], sizeof
         (uint8_T) << 7U);
  *varargout_2_Header_FrameId_SL_I =
    sliding_controller_const_B.b_varargout_2_m.Header.FrameId_SL_Info.CurrentLength;
  *varargout_2_Header_FrameId_SL_0 =
    sliding_controller_const_B.b_varargout_2_m.Header.FrameId_SL_Info.ReceivedLength;
  memcpy(&varargout_2_Name[0], &sliding_controller_const_B.b_varargout_2_m.Name
         [0], sizeof(SL_Bus_sliding_controller_const_std_msgs_String) << 4U);
  *varargout_2_Name_SL_Info_Curren =
    sliding_controller_const_B.b_varargout_2_m.Name_SL_Info.CurrentLength;
  *varargout_2_Name_SL_Info_Receiv =
    sliding_controller_const_B.b_varargout_2_m.Name_SL_Info.ReceivedLength;
  *varargout_2_Position_SL_Info_Cu =
    sliding_controller_const_B.b_varargout_2_m.Position_SL_Info.CurrentLength;
  *varargout_2_Position_SL_Info_Re =
    sliding_controller_const_B.b_varargout_2_m.Position_SL_Info.ReceivedLength;
  *varargout_2_Velocity_SL_Info_Cu =
    sliding_controller_const_B.b_varargout_2_m.Velocity_SL_Info.CurrentLength;
  *varargout_2_Velocity_SL_Info_Re =
    sliding_controller_const_B.b_varargout_2_m.Velocity_SL_Info.ReceivedLength;
  for (i = 0; i < 7; i++) {
    varargout_2_Position[i] =
      sliding_controller_const_B.b_varargout_2_m.Position[i];
    varargout_2_Velocity[i] =
      sliding_controller_const_B.b_varargout_2_m.Velocity[i];
    varargout_2_Effort[i] = sliding_controller_const_B.b_varargout_2_m.Effort[i];
  }

  *varargout_2_Effort_SL_Info =
    sliding_controller_const_B.b_varargout_2_m.Effort_SL_Info;
}

void sliding_controller_constModelClass::sliding_contr_SystemCore_step_f
  (boolean_T *varargout_1, uint32_T *varargout_2_Header_Seq, real_T
   *varargout_2_Header_Stamp_Sec, real_T *varargout_2_Header_Stamp_Nsec, uint8_T
   varargout_2_Header_FrameId[128], uint32_T *varargout_2_Header_FrameId_SL_I,
   uint32_T *varargout_2_Header_FrameId_SL_0,
   SL_Bus_sliding_controller_const_std_msgs_String varargout_2_Name[16],
   uint32_T *varargout_2_Name_SL_Info_Curren, uint32_T
   *varargout_2_Name_SL_Info_Receiv, real_T varargout_2_Position[7], uint32_T
   *varargout_2_Position_SL_Info_Cu, uint32_T *varargout_2_Position_SL_Info_Re,
   real_T varargout_2_Velocity[7], uint32_T *varargout_2_Velocity_SL_Info_Cu,
   uint32_T *varargout_2_Velocity_SL_Info_Re, real_T varargout_2_Effort[7],
   SL_Bus_ROSVariableLengthArrayInfo *varargout_2_Effort_SL_Info)
{
  int32_T i;
  *varargout_1 = Sub_sliding_controller_const_1277.getLatestMessage
    (&sliding_controller_const_B.b_varargout_2);
  *varargout_2_Header_Seq = sliding_controller_const_B.b_varargout_2.Header.Seq;
  *varargout_2_Header_Stamp_Sec =
    sliding_controller_const_B.b_varargout_2.Header.Stamp.Sec;
  *varargout_2_Header_Stamp_Nsec =
    sliding_controller_const_B.b_varargout_2.Header.Stamp.Nsec;
  memcpy(&varargout_2_Header_FrameId[0],
         &sliding_controller_const_B.b_varargout_2.Header.FrameId[0], sizeof
         (uint8_T) << 7U);
  *varargout_2_Header_FrameId_SL_I =
    sliding_controller_const_B.b_varargout_2.Header.FrameId_SL_Info.CurrentLength;
  *varargout_2_Header_FrameId_SL_0 =
    sliding_controller_const_B.b_varargout_2.Header.FrameId_SL_Info.ReceivedLength;
  memcpy(&varargout_2_Name[0], &sliding_controller_const_B.b_varargout_2.Name[0],
         sizeof(SL_Bus_sliding_controller_const_std_msgs_String) << 4U);
  *varargout_2_Name_SL_Info_Curren =
    sliding_controller_const_B.b_varargout_2.Name_SL_Info.CurrentLength;
  *varargout_2_Name_SL_Info_Receiv =
    sliding_controller_const_B.b_varargout_2.Name_SL_Info.ReceivedLength;
  *varargout_2_Position_SL_Info_Cu =
    sliding_controller_const_B.b_varargout_2.Position_SL_Info.CurrentLength;
  *varargout_2_Position_SL_Info_Re =
    sliding_controller_const_B.b_varargout_2.Position_SL_Info.ReceivedLength;
  *varargout_2_Velocity_SL_Info_Cu =
    sliding_controller_const_B.b_varargout_2.Velocity_SL_Info.CurrentLength;
  *varargout_2_Velocity_SL_Info_Re =
    sliding_controller_const_B.b_varargout_2.Velocity_SL_Info.ReceivedLength;
  for (i = 0; i < 7; i++) {
    varargout_2_Position[i] =
      sliding_controller_const_B.b_varargout_2.Position[i];
    varargout_2_Velocity[i] =
      sliding_controller_const_B.b_varargout_2.Velocity[i];
    varargout_2_Effort[i] = sliding_controller_const_B.b_varargout_2.Effort[i];
  }

  *varargout_2_Effort_SL_Info =
    sliding_controller_const_B.b_varargout_2.Effort_SL_Info;
}

// Function for MATLAB Function: '<S26>/MATLAB Function'
real_T sliding_controller_constModelClass::sliding_controller_const_xnrm2
  (int32_T n, const real_T x[7], int32_T ix0)
{
  real_T y;
  int32_T k;
  int32_T kend;
  y = 0.0;
  if (n >= 1) {
    if (n == 1) {
      y = fabs(x[ix0 - 1]);
    } else {
      sliding_controller_const_B.scale = 3.3121686421112381E-170;
      kend = (ix0 + n) - 1;
      for (k = ix0; k <= kend; k++) {
        sliding_controller_const_B.absxk = fabs(x[k - 1]);
        if (sliding_controller_const_B.absxk > sliding_controller_const_B.scale)
        {
          sliding_controller_const_B.t = sliding_controller_const_B.scale /
            sliding_controller_const_B.absxk;
          y = y * sliding_controller_const_B.t * sliding_controller_const_B.t +
            1.0;
          sliding_controller_const_B.scale = sliding_controller_const_B.absxk;
        } else {
          sliding_controller_const_B.t = sliding_controller_const_B.absxk /
            sliding_controller_const_B.scale;
          y += sliding_controller_const_B.t * sliding_controller_const_B.t;
        }
      }

      y = sliding_controller_const_B.scale * sqrt(y);
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

// Function for MATLAB Function: '<S26>/MATLAB Function'
void sliding_controller_constModelClass::sliding_controller_const_qrpf(real_T A
  [7], int32_T ia0, int32_T m, int32_T n, real_T *tau, int32_T jpvt[7])
{
  int32_T exitg1;
  int32_T i;
  int32_T ii_tmp;
  boolean_T exitg2;
  if (m < n) {
    sliding_controller_const_B.minmn = m;
  } else {
    sliding_controller_const_B.minmn = n;
  }

  for (i = 0; i < 7; i++) {
    sliding_controller_const_B.work[i] = 0.0;
    sliding_controller_const_B.vn1[i] = 0.0;
    sliding_controller_const_B.vn2[i] = 0.0;
  }

  for (i = 0; i < n; i++) {
    sliding_controller_const_B.vn1[i] = sliding_controller_const_xnrm2(m, A, ia0
      + i);
    sliding_controller_const_B.vn2[i] = sliding_controller_const_B.vn1[i];
  }

  for (i = 0; i < sliding_controller_const_B.minmn; i++) {
    ii_tmp = ia0 + i;
    sliding_controller_const_B.ii = (ii_tmp + i) - 1;
    sliding_controller_const_B.nmi = n - i;
    sliding_controller_const_B.mmi = (m - i) - 1;
    if (sliding_controller_const_B.nmi < 1) {
      sliding_controller_const_B.pvt = -1;
    } else {
      sliding_controller_const_B.pvt = 0;
      if (sliding_controller_const_B.nmi > 1) {
        sliding_controller_const_B.ix = i;
        sliding_controller_const_B.smax = fabs(sliding_controller_const_B.vn1[i]);
        sliding_controller_const_B.iy = 2;
        while (sliding_controller_const_B.iy <= sliding_controller_const_B.nmi)
        {
          sliding_controller_const_B.ix++;
          sliding_controller_const_B.beta1 = fabs
            (sliding_controller_const_B.vn1[sliding_controller_const_B.ix]);
          if (sliding_controller_const_B.beta1 > sliding_controller_const_B.smax)
          {
            sliding_controller_const_B.pvt = sliding_controller_const_B.iy - 1;
            sliding_controller_const_B.smax = sliding_controller_const_B.beta1;
          }

          sliding_controller_const_B.iy++;
        }
      }
    }

    sliding_controller_const_B.pvt += i;
    if (sliding_controller_const_B.pvt + 1 != i + 1) {
      sliding_controller_const_B.ix = (ia0 + sliding_controller_const_B.pvt) - 1;
      sliding_controller_const_B.iy = ii_tmp - 1;
      sliding_controller_const_B.b_k = 0;
      while (sliding_controller_const_B.b_k <= m - 1) {
        sliding_controller_const_B.smax = A[sliding_controller_const_B.ix];
        A[sliding_controller_const_B.ix] = A[sliding_controller_const_B.iy];
        A[sliding_controller_const_B.iy] = sliding_controller_const_B.smax;
        sliding_controller_const_B.ix++;
        sliding_controller_const_B.iy++;
        sliding_controller_const_B.b_k++;
      }

      sliding_controller_const_B.ix = jpvt[sliding_controller_const_B.pvt];
      jpvt[sliding_controller_const_B.pvt] = jpvt[i];
      jpvt[i] = sliding_controller_const_B.ix;
      sliding_controller_const_B.vn1[sliding_controller_const_B.pvt] =
        sliding_controller_const_B.vn1[i];
      sliding_controller_const_B.vn2[sliding_controller_const_B.pvt] =
        sliding_controller_const_B.vn2[i];
    }

    if (i + 1 < m) {
      sliding_controller_const_B.smax = A[sliding_controller_const_B.ii];
      *tau = 0.0;
      if (sliding_controller_const_B.mmi + 1 > 0) {
        sliding_controller_const_B.beta1 = sliding_controller_const_xnrm2
          (sliding_controller_const_B.mmi, A, sliding_controller_const_B.ii + 2);
        if (sliding_controller_const_B.beta1 != 0.0) {
          sliding_controller_const_B.beta1 = rt_hypotd_snf
            (A[sliding_controller_const_B.ii], sliding_controller_const_B.beta1);
          if (A[sliding_controller_const_B.ii] >= 0.0) {
            sliding_controller_const_B.beta1 = -sliding_controller_const_B.beta1;
          }

          if (fabs(sliding_controller_const_B.beta1) < 1.0020841800044864E-292)
          {
            sliding_controller_const_B.pvt = -1;
            sliding_controller_const_B.ix = (sliding_controller_const_B.ii +
              sliding_controller_const_B.mmi) + 1;
            do {
              sliding_controller_const_B.pvt++;
              sliding_controller_const_B.iy = sliding_controller_const_B.ii + 1;
              while (sliding_controller_const_B.iy + 1 <=
                     sliding_controller_const_B.ix) {
                A[sliding_controller_const_B.iy] *= 9.9792015476736E+291;
                sliding_controller_const_B.iy++;
              }

              sliding_controller_const_B.beta1 *= 9.9792015476736E+291;
              sliding_controller_const_B.smax *= 9.9792015476736E+291;
            } while (!(fabs(sliding_controller_const_B.beta1) >=
                       1.0020841800044864E-292));

            sliding_controller_const_B.beta1 = rt_hypotd_snf
              (sliding_controller_const_B.smax, sliding_controller_const_xnrm2
               (sliding_controller_const_B.mmi, A, sliding_controller_const_B.ii
                + 2));
            if (sliding_controller_const_B.smax >= 0.0) {
              sliding_controller_const_B.beta1 =
                -sliding_controller_const_B.beta1;
            }

            *tau = (sliding_controller_const_B.beta1 -
                    sliding_controller_const_B.smax) /
              sliding_controller_const_B.beta1;
            sliding_controller_const_B.smax = 1.0 /
              (sliding_controller_const_B.smax -
               sliding_controller_const_B.beta1);
            sliding_controller_const_B.iy = sliding_controller_const_B.ii + 1;
            while (sliding_controller_const_B.iy + 1 <=
                   sliding_controller_const_B.ix) {
              A[sliding_controller_const_B.iy] *=
                sliding_controller_const_B.smax;
              sliding_controller_const_B.iy++;
            }

            sliding_controller_const_B.ix = 0;
            while (sliding_controller_const_B.ix <=
                   sliding_controller_const_B.pvt) {
              sliding_controller_const_B.beta1 *= 1.0020841800044864E-292;
              sliding_controller_const_B.ix++;
            }

            sliding_controller_const_B.smax = sliding_controller_const_B.beta1;
          } else {
            *tau = (sliding_controller_const_B.beta1 -
                    A[sliding_controller_const_B.ii]) /
              sliding_controller_const_B.beta1;
            sliding_controller_const_B.smax = 1.0 /
              (A[sliding_controller_const_B.ii] -
               sliding_controller_const_B.beta1);
            sliding_controller_const_B.pvt = (sliding_controller_const_B.ii +
              sliding_controller_const_B.mmi) + 1;
            sliding_controller_const_B.ix = sliding_controller_const_B.ii + 1;
            while (sliding_controller_const_B.ix + 1 <=
                   sliding_controller_const_B.pvt) {
              A[sliding_controller_const_B.ix] *=
                sliding_controller_const_B.smax;
              sliding_controller_const_B.ix++;
            }

            sliding_controller_const_B.smax = sliding_controller_const_B.beta1;
          }
        }
      }

      A[sliding_controller_const_B.ii] = sliding_controller_const_B.smax;
    } else {
      *tau = 0.0;
    }

    if (i + 1 < n) {
      sliding_controller_const_B.smax = A[sliding_controller_const_B.ii];
      A[sliding_controller_const_B.ii] = 1.0;
      if (*tau != 0.0) {
        sliding_controller_const_B.pvt = sliding_controller_const_B.mmi + 1;
        sliding_controller_const_B.ix = sliding_controller_const_B.ii +
          sliding_controller_const_B.mmi;
        while ((sliding_controller_const_B.pvt > 0) &&
               (A[sliding_controller_const_B.ix] == 0.0)) {
          sliding_controller_const_B.pvt--;
          sliding_controller_const_B.ix--;
        }

        sliding_controller_const_B.nmi--;
        exitg2 = false;
        while ((!exitg2) && (sliding_controller_const_B.nmi > 0)) {
          sliding_controller_const_B.ix = (sliding_controller_const_B.ii +
            sliding_controller_const_B.nmi) + 1;
          sliding_controller_const_B.iy = sliding_controller_const_B.ix;
          do {
            exitg1 = 0;
            if (sliding_controller_const_B.iy <= (sliding_controller_const_B.ix
                 + sliding_controller_const_B.pvt) - 1) {
              if (A[sliding_controller_const_B.iy - 1] != 0.0) {
                exitg1 = 1;
              } else {
                sliding_controller_const_B.iy++;
              }
            } else {
              sliding_controller_const_B.nmi--;
              exitg1 = 2;
            }
          } while (exitg1 == 0);

          if (exitg1 == 1) {
            exitg2 = true;
          }
        }
      } else {
        sliding_controller_const_B.pvt = 0;
        sliding_controller_const_B.nmi = 0;
      }

      if (sliding_controller_const_B.pvt > 0) {
        if (sliding_controller_const_B.nmi != 0) {
          sliding_controller_const_B.ix = 0;
          while (sliding_controller_const_B.ix <= sliding_controller_const_B.nmi
                 - 1) {
            sliding_controller_const_B.work[sliding_controller_const_B.ix] = 0.0;
            sliding_controller_const_B.ix++;
          }

          sliding_controller_const_B.ix = 0;
          sliding_controller_const_B.iy = (sliding_controller_const_B.ii +
            sliding_controller_const_B.nmi) + 1;
          sliding_controller_const_B.b_k = sliding_controller_const_B.ii + 2;
          while (sliding_controller_const_B.b_k <= sliding_controller_const_B.iy)
          {
            sliding_controller_const_B.c_ix = sliding_controller_const_B.ii;
            sliding_controller_const_B.beta1 = 0.0;
            sliding_controller_const_B.e = (sliding_controller_const_B.b_k +
              sliding_controller_const_B.pvt) - 1;
            sliding_controller_const_B.ia = sliding_controller_const_B.b_k;
            while (sliding_controller_const_B.ia <= sliding_controller_const_B.e)
            {
              sliding_controller_const_B.beta1 +=
                A[sliding_controller_const_B.ia - 1] *
                A[sliding_controller_const_B.c_ix];
              sliding_controller_const_B.c_ix++;
              sliding_controller_const_B.ia++;
            }

            sliding_controller_const_B.work[sliding_controller_const_B.ix] +=
              sliding_controller_const_B.beta1;
            sliding_controller_const_B.ix++;
            sliding_controller_const_B.b_k++;
          }
        }

        if (!(-*tau == 0.0)) {
          sliding_controller_const_B.ix = sliding_controller_const_B.ii + 1;
          sliding_controller_const_B.iy = 0;
          sliding_controller_const_B.b_k = 0;
          while (sliding_controller_const_B.b_k <=
                 sliding_controller_const_B.nmi - 1) {
            if (sliding_controller_const_B.work[sliding_controller_const_B.iy]
                != 0.0) {
              sliding_controller_const_B.beta1 =
                sliding_controller_const_B.work[sliding_controller_const_B.iy] *
                -*tau;
              sliding_controller_const_B.c_ix = sliding_controller_const_B.ii;
              sliding_controller_const_B.e = sliding_controller_const_B.pvt +
                sliding_controller_const_B.ix;
              sliding_controller_const_B.ia = sliding_controller_const_B.ix;
              while (sliding_controller_const_B.ia + 1 <=
                     sliding_controller_const_B.e) {
                A[sliding_controller_const_B.ia] +=
                  A[sliding_controller_const_B.c_ix] *
                  sliding_controller_const_B.beta1;
                sliding_controller_const_B.c_ix++;
                sliding_controller_const_B.ia++;
              }
            }

            sliding_controller_const_B.iy++;
            sliding_controller_const_B.ix++;
            sliding_controller_const_B.b_k++;
          }
        }
      }

      A[sliding_controller_const_B.ii] = sliding_controller_const_B.smax;
    }

    sliding_controller_const_B.ii = i + 1;
    while (sliding_controller_const_B.ii + 1 <= n) {
      sliding_controller_const_B.pvt = ii_tmp + sliding_controller_const_B.ii;
      if (sliding_controller_const_B.vn1[sliding_controller_const_B.ii] != 0.0)
      {
        sliding_controller_const_B.smax = fabs(A[sliding_controller_const_B.pvt
          - 1]) / sliding_controller_const_B.vn1[sliding_controller_const_B.ii];
        sliding_controller_const_B.smax = 1.0 - sliding_controller_const_B.smax *
          sliding_controller_const_B.smax;
        if (sliding_controller_const_B.smax < 0.0) {
          sliding_controller_const_B.smax = 0.0;
        }

        sliding_controller_const_B.beta1 =
          sliding_controller_const_B.vn1[sliding_controller_const_B.ii] /
          sliding_controller_const_B.vn2[sliding_controller_const_B.ii];
        sliding_controller_const_B.beta1 = sliding_controller_const_B.beta1 *
          sliding_controller_const_B.beta1 * sliding_controller_const_B.smax;
        if (sliding_controller_const_B.beta1 <= 1.4901161193847656E-8) {
          if (i + 1 < m) {
            sliding_controller_const_B.vn1[sliding_controller_const_B.ii] =
              sliding_controller_const_xnrm2(sliding_controller_const_B.mmi, A,
              sliding_controller_const_B.pvt + 1);
            sliding_controller_const_B.vn2[sliding_controller_const_B.ii] =
              sliding_controller_const_B.vn1[sliding_controller_const_B.ii];
          } else {
            sliding_controller_const_B.vn1[sliding_controller_const_B.ii] = 0.0;
            sliding_controller_const_B.vn2[sliding_controller_const_B.ii] = 0.0;
          }
        } else {
          sliding_controller_const_B.vn1[sliding_controller_const_B.ii] *= sqrt
            (sliding_controller_const_B.smax);
        }
      }

      sliding_controller_const_B.ii++;
    }
  }
}

// Model step function
void sliding_controller_constModelClass::step()
{
  SL_Bus_sliding_controller_const_std_msgs_Bool b_varargout_2_0;
  SL_Bus_sliding_controller_const_std_msgs_Bool rtb_BusAssignment2_d;
  SL_Bus_sliding_controller_const_std_srvs_SetBoolRequest rtb_BusAssignment1_k2;
  SL_Bus_sliding_controller_const_std_srvs_SetBoolRequest rtb_BusAssignment_b3;
  int8_T rtAction;
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

  static const uint8_T b_0[7] = { 76U, 101U, 102U, 116U, 72U, 105U, 112U };

  static const uint8_T f[12] = { 82U, 105U, 103U, 104U, 116U, 69U, 120U, 111U,
    75U, 110U, 101U, 101U };

  static const uint8_T c_0[8] = { 76U, 101U, 102U, 116U, 75U, 110U, 101U, 101U };

  static const uint8_T g[13] = { 82U, 105U, 103U, 104U, 116U, 69U, 120U, 111U,
    65U, 110U, 107U, 108U, 101U };

  static const uint8_T d_0[9] = { 76U, 101U, 102U, 116U, 65U, 110U, 107U, 108U,
    101U };

  static const uint8_T h[8] = { 67U, 114U, 117U, 116U, 99U, 104U, 101U, 115U };

  static const uint8_T e_0[8] = { 82U, 105U, 103U, 104U, 116U, 72U, 105U, 112U };

  static const char_T tmp[21] = { '/', 'e', 'x', 'o', '_', 'c', 'o', 'n', 't',
    'r', 'o', 'l', 'l', 'e', 'r', '_', 'o', 'n', 'o', 'f', 'f' };

  static const uint8_T f_0[9] = { 82U, 105U, 103U, 104U, 116U, 75U, 110U, 101U,
    101U };

  static const uint8_T g_0[10] = { 82U, 105U, 103U, 104U, 116U, 65U, 110U, 107U,
    108U, 101U };

  static const uint8_T h_0[6] = { 98U, 108U, 97U, 110U, 99U, 107U };

  static const char_T tmp_0[23] = { '/', 'h', 'u', 'm', 'a', 'n', '_', 'c', 'o',
    'n', 't', 'r', 'o', 'l', 'l', 'e', 'r', '_', 'o', 'n', 'o', 'f', 'f' };

  static const char_T tmp_1[16] = { '/', 'I', 'n', 'v', 'e', 'r', 's', 'e', 'D',
    'y', 'n', 'a', 'm', 'i', 'c', 's' };

  static const uint8_T b_1[12] = { 76U, 101U, 102U, 116U, 72U, 117U, 109U, 97U,
    110U, 72U, 105U, 112U };

  static const uint8_T c_1[13] = { 76U, 101U, 102U, 116U, 72U, 117U, 109U, 97U,
    110U, 75U, 110U, 101U, 101U };

  static const uint8_T d_1[14] = { 76U, 101U, 102U, 116U, 72U, 117U, 109U, 97U,
    110U, 65U, 110U, 107U, 108U, 101U };

  static const uint8_T e_1[13] = { 82U, 105U, 103U, 104U, 116U, 72U, 117U, 109U,
    97U, 110U, 72U, 105U, 112U };

  static const uint8_T f_1[14] = { 82U, 105U, 103U, 104U, 116U, 72U, 117U, 109U,
    97U, 110U, 75U, 110U, 101U, 101U };

  static const uint8_T g_1[15] = { 82U, 105U, 103U, 104U, 116U, 72U, 117U, 109U,
    97U, 110U, 65U, 110U, 107U, 108U, 101U };

  if (rtmIsMajorTimeStep((&sliding_controller_const_M))) {
    // set solver stop time
    rtsiSetSolverStopTime(&(&sliding_controller_const_M)->solverInfo,
                          (((&sliding_controller_const_M)->Timing.clockTick0+1)*
      (&sliding_controller_const_M)->Timing.stepSize0));
  }                                    // end MajorTimeStep

  // Update absolute time of base rate at minor time step
  if (rtmIsMinorTimeStep((&sliding_controller_const_M))) {
    (&sliding_controller_const_M)->Timing.t[0] = rtsiGetT
      (&(&sliding_controller_const_M)->solverInfo);
  }

  // BusAssignment: '<Root>/Bus Assignment' incorporates:
  //   DataTypeConversion: '<Root>/Data Type Conversion'
  //   Sin: '<Root>/Sine Wave Function'

  sliding_controller_const_B.BusAssignment_m.Data = static_cast<real32_T>(sin
    (sliding_controller_const_P.SineWaveFunction_Freq *
     (&sliding_controller_const_M)->Timing.t[0] +
     sliding_controller_const_P.SineWaveFunction_Phase) *
    sliding_controller_const_P.SineWaveFunction_Amp +
    sliding_controller_const_P.SineWaveFunction_Bias);

  // Outputs for Atomic SubSystem: '<Root>/Publish'
  // MATLABSystem: '<S11>/SinkBlock'
  Pub_sliding_controller_const_1177.publish
    (&sliding_controller_const_B.BusAssignment_m);

  // End of Outputs for SubSystem: '<Root>/Publish'
  if (rtmIsMajorTimeStep((&sliding_controller_const_M))) {
    // MATLAB Function: '<Root>/exo msg' incorporates:
    //   Constant: '<S2>/Constant'

    sliding_controller_const_B.msg_n = sliding_controller_const_P.Constant_Value;
    sliding_controller_const_B.msg_n.Name_SL_Info.CurrentLength = 7U;
    sliding_controller_const_B.msg_n.Effort_SL_Info.CurrentLength = 7U;
    for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 10;
         sliding_controller_const_B.j++) {
      sliding_controller_const_B.msg_n.Name[0].Data[sliding_controller_const_B.j]
        = b[sliding_controller_const_B.j];
    }

    sliding_controller_const_B.msg_n.Name[0].Data_SL_Info.CurrentLength = 10U;
    for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 11;
         sliding_controller_const_B.j++) {
      sliding_controller_const_B.msg_n.Name[1].Data[sliding_controller_const_B.j]
        = c[sliding_controller_const_B.j];
    }

    sliding_controller_const_B.msg_n.Name[1].Data_SL_Info.CurrentLength = 11U;
    for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 12;
         sliding_controller_const_B.j++) {
      sliding_controller_const_B.msg_n.Name[2].Data[sliding_controller_const_B.j]
        = d[sliding_controller_const_B.j];
    }

    sliding_controller_const_B.msg_n.Name[2].Data_SL_Info.CurrentLength = 12U;
    for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 11;
         sliding_controller_const_B.j++) {
      sliding_controller_const_B.msg_n.Name[3].Data[sliding_controller_const_B.j]
        = e[sliding_controller_const_B.j];
    }

    sliding_controller_const_B.msg_n.Name[3].Data_SL_Info.CurrentLength = 11U;
    for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 12;
         sliding_controller_const_B.j++) {
      sliding_controller_const_B.msg_n.Name[4].Data[sliding_controller_const_B.j]
        = f[sliding_controller_const_B.j];
    }

    sliding_controller_const_B.msg_n.Name[4].Data_SL_Info.CurrentLength = 12U;
    for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 13;
         sliding_controller_const_B.j++) {
      sliding_controller_const_B.msg_n.Name[5].Data[sliding_controller_const_B.j]
        = g[sliding_controller_const_B.j];
    }

    sliding_controller_const_B.msg_n.Name[5].Data_SL_Info.CurrentLength = 13U;
    for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 8;
         sliding_controller_const_B.j++) {
      sliding_controller_const_B.msg_n.Name[6].Data[sliding_controller_const_B.j]
        = h[sliding_controller_const_B.j];
    }

    sliding_controller_const_B.msg_n.Name[6].Data_SL_Info.CurrentLength = 8U;

    // End of MATLAB Function: '<Root>/exo msg'

    // Outputs for Atomic SubSystem: '<Root>/Subscribe1'
    // MATLABSystem: '<S13>/SourceBlock'
    sliding_control_SystemCore_step(&sliding_controller_const_B.SourceBlock_o1_h,
      &sliding_controller_const_B.b_varargout_2_Header_Seq,
      &sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec,
      &sliding_controller_const_B.wj,
      sliding_controller_const_B.b_varargout_2_Header_FrameId,
      &sliding_controller_const_B.b_varargout_2_Header_FrameId_SL,
      &sliding_controller_const_B.b_varargout_2_Header_FrameId__b,
      sliding_controller_const_B.b_varargout_2_Name,
      &sliding_controller_const_B.b_varargout_2_Name_SL_Info_Curr,
      &sliding_controller_const_B.b_varargout_2_Name_SL_Info_Rece,
      sliding_controller_const_B.q_add_c,
      &sliding_controller_const_B.b_varargout_2_Position_SL_Info_,
      &sliding_controller_const_B.b_varargout_2_Position_SL_Inf_j,
      sliding_controller_const_B.q_add_j,
      &sliding_controller_const_B.b_varargout_2_Velocity_SL_Info_,
      &sliding_controller_const_B.b_varargout_2_Velocity_SL_Inf_a,
      sliding_controller_const_B.b_varargout_2_Effort,
      &sliding_controller_const_B.b_varargout_2_Effort_SL_Info);

    // Outputs for Enabled SubSystem: '<S13>/Enabled Subsystem' incorporates:
    //   EnablePort: '<S55>/Enable'

    if (sliding_controller_const_B.SourceBlock_o1_h) {
      // Inport: '<S55>/In1' incorporates:
      //   MATLABSystem: '<S13>/SourceBlock'

      sliding_controller_const_B.In1_n.Header.Seq =
        sliding_controller_const_B.b_varargout_2_Header_Seq;
      sliding_controller_const_B.In1_n.Header.Stamp.Sec =
        sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec;
      sliding_controller_const_B.In1_n.Header.Stamp.Nsec =
        sliding_controller_const_B.wj;
      memcpy(&sliding_controller_const_B.In1_n.Header.FrameId[0],
             &sliding_controller_const_B.b_varargout_2_Header_FrameId[0], sizeof
             (uint8_T) << 7U);
      sliding_controller_const_B.In1_n.Header.FrameId_SL_Info.CurrentLength =
        sliding_controller_const_B.b_varargout_2_Header_FrameId_SL;
      sliding_controller_const_B.In1_n.Header.FrameId_SL_Info.ReceivedLength =
        sliding_controller_const_B.b_varargout_2_Header_FrameId__b;
      memcpy(&sliding_controller_const_B.In1_n.Name[0],
             &sliding_controller_const_B.b_varargout_2_Name[0], sizeof
             (SL_Bus_sliding_controller_const_std_msgs_String) << 4U);
      sliding_controller_const_B.In1_n.Name_SL_Info.CurrentLength =
        sliding_controller_const_B.b_varargout_2_Name_SL_Info_Curr;
      sliding_controller_const_B.In1_n.Name_SL_Info.ReceivedLength =
        sliding_controller_const_B.b_varargout_2_Name_SL_Info_Rece;
      sliding_controller_const_B.In1_n.Position_SL_Info.CurrentLength =
        sliding_controller_const_B.b_varargout_2_Position_SL_Info_;
      sliding_controller_const_B.In1_n.Position_SL_Info.ReceivedLength =
        sliding_controller_const_B.b_varargout_2_Position_SL_Inf_j;
      sliding_controller_const_B.In1_n.Velocity_SL_Info.CurrentLength =
        sliding_controller_const_B.b_varargout_2_Velocity_SL_Info_;
      sliding_controller_const_B.In1_n.Velocity_SL_Info.ReceivedLength =
        sliding_controller_const_B.b_varargout_2_Velocity_SL_Inf_a;
      for (sliding_controller_const_B.i = 0; sliding_controller_const_B.i < 7;
           sliding_controller_const_B.i++) {
        sliding_controller_const_B.In1_n.Position[sliding_controller_const_B.i] =
          sliding_controller_const_B.q_add_c[sliding_controller_const_B.i];
        sliding_controller_const_B.In1_n.Velocity[sliding_controller_const_B.i] =
          sliding_controller_const_B.q_add_j[sliding_controller_const_B.i];
        sliding_controller_const_B.In1_n.Effort[sliding_controller_const_B.i] =
          sliding_controller_const_B.b_varargout_2_Effort[sliding_controller_const_B.i];
      }

      sliding_controller_const_B.In1_n.Effort_SL_Info =
        sliding_controller_const_B.b_varargout_2_Effort_SL_Info;

      // End of Inport: '<S55>/In1'
    }

    // End of Outputs for SubSystem: '<S13>/Enabled Subsystem'
    // End of Outputs for SubSystem: '<Root>/Subscribe1'

    // Outputs for Atomic SubSystem: '<Root>/Subscribe2'
    // MATLABSystem: '<S14>/SourceBlock'
    sliding_contr_SystemCore_step_f(&sliding_controller_const_B.SourceBlock_o1,
      &sliding_controller_const_B.b_varargout_2_Header_Seq,
      &sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec,
      &sliding_controller_const_B.wj,
      sliding_controller_const_B.b_varargout_2_Header_FrameId,
      &sliding_controller_const_B.b_varargout_2_Header_FrameId_SL,
      &sliding_controller_const_B.b_varargout_2_Header_FrameId__b,
      sliding_controller_const_B.b_varargout_2_Name,
      &sliding_controller_const_B.b_varargout_2_Name_SL_Info_Curr,
      &sliding_controller_const_B.b_varargout_2_Name_SL_Info_Rece,
      sliding_controller_const_B.q_add_c,
      &sliding_controller_const_B.b_varargout_2_Position_SL_Info_,
      &sliding_controller_const_B.b_varargout_2_Position_SL_Inf_j,
      sliding_controller_const_B.q_add_j,
      &sliding_controller_const_B.b_varargout_2_Velocity_SL_Info_,
      &sliding_controller_const_B.b_varargout_2_Velocity_SL_Inf_a,
      sliding_controller_const_B.b_varargout_2_Effort,
      &sliding_controller_const_B.b_varargout_2_Effort_SL_Info);

    // Outputs for Enabled SubSystem: '<S14>/Enabled Subsystem' incorporates:
    //   EnablePort: '<S56>/Enable'

    if (sliding_controller_const_B.SourceBlock_o1) {
      // Inport: '<S56>/In1' incorporates:
      //   MATLABSystem: '<S14>/SourceBlock'

      sliding_controller_const_B.In1.Header.Seq =
        sliding_controller_const_B.b_varargout_2_Header_Seq;
      sliding_controller_const_B.In1.Header.Stamp.Sec =
        sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec;
      sliding_controller_const_B.In1.Header.Stamp.Nsec =
        sliding_controller_const_B.wj;
      memcpy(&sliding_controller_const_B.In1.Header.FrameId[0],
             &sliding_controller_const_B.b_varargout_2_Header_FrameId[0], sizeof
             (uint8_T) << 7U);
      sliding_controller_const_B.In1.Header.FrameId_SL_Info.CurrentLength =
        sliding_controller_const_B.b_varargout_2_Header_FrameId_SL;
      sliding_controller_const_B.In1.Header.FrameId_SL_Info.ReceivedLength =
        sliding_controller_const_B.b_varargout_2_Header_FrameId__b;
      memcpy(&sliding_controller_const_B.In1.Name[0],
             &sliding_controller_const_B.b_varargout_2_Name[0], sizeof
             (SL_Bus_sliding_controller_const_std_msgs_String) << 4U);
      sliding_controller_const_B.In1.Name_SL_Info.CurrentLength =
        sliding_controller_const_B.b_varargout_2_Name_SL_Info_Curr;
      sliding_controller_const_B.In1.Name_SL_Info.ReceivedLength =
        sliding_controller_const_B.b_varargout_2_Name_SL_Info_Rece;
      sliding_controller_const_B.In1.Position_SL_Info.CurrentLength =
        sliding_controller_const_B.b_varargout_2_Position_SL_Info_;
      sliding_controller_const_B.In1.Position_SL_Info.ReceivedLength =
        sliding_controller_const_B.b_varargout_2_Position_SL_Inf_j;
      sliding_controller_const_B.In1.Velocity_SL_Info.CurrentLength =
        sliding_controller_const_B.b_varargout_2_Velocity_SL_Info_;
      sliding_controller_const_B.In1.Velocity_SL_Info.ReceivedLength =
        sliding_controller_const_B.b_varargout_2_Velocity_SL_Inf_a;
      for (sliding_controller_const_B.i = 0; sliding_controller_const_B.i < 7;
           sliding_controller_const_B.i++) {
        sliding_controller_const_B.In1.Position[sliding_controller_const_B.i] =
          sliding_controller_const_B.q_add_c[sliding_controller_const_B.i];
        sliding_controller_const_B.In1.Velocity[sliding_controller_const_B.i] =
          sliding_controller_const_B.q_add_j[sliding_controller_const_B.i];
        sliding_controller_const_B.In1.Effort[sliding_controller_const_B.i] =
          sliding_controller_const_B.b_varargout_2_Effort[sliding_controller_const_B.i];
      }

      sliding_controller_const_B.In1.Effort_SL_Info =
        sliding_controller_const_B.b_varargout_2_Effort_SL_Info;

      // End of Inport: '<S56>/In1'
    }

    // End of Outputs for SubSystem: '<S14>/Enabled Subsystem'
    // End of Outputs for SubSystem: '<Root>/Subscribe2'

    // Outputs for Atomic SubSystem: '<Root>/Subscribe4'
    // MATLABSystem: '<S15>/SourceBlock' incorporates:
    //   Inport: '<S57>/In1'

    isCreated = Sub_sliding_controller_const_1418.getLatestMessage
      (&b_varargout_2_0);

    // Outputs for Enabled SubSystem: '<S15>/Enabled Subsystem' incorporates:
    //   EnablePort: '<S57>/Enable'

    if (isCreated) {
      sliding_controller_const_B.In1_k = b_varargout_2_0;
    }

    // End of MATLABSystem: '<S15>/SourceBlock'
    // End of Outputs for SubSystem: '<S15>/Enabled Subsystem'
    // End of Outputs for SubSystem: '<Root>/Subscribe4'

    // Logic: '<Root>/Logical Operator'
    sliding_controller_const_B.LogicalOperator =
      (sliding_controller_const_B.In1_k.Data &&
       sliding_controller_const_B.SourceBlock_o1 &&
       sliding_controller_const_B.SourceBlock_o1_h);

    // MATLAB Function: '<Root>/human msg' incorporates:
    //   Constant: '<S3>/Constant'

    sliding_controller_const_B.msg = sliding_controller_const_P.Constant_Value_d;
    sliding_controller_const_B.msg.Name_SL_Info.CurrentLength = 6U;
    sliding_controller_const_B.msg.Effort_SL_Info.CurrentLength = 6U;
    for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 12;
         sliding_controller_const_B.j++) {
      sliding_controller_const_B.msg.Name[0].Data[sliding_controller_const_B.j] =
        b_1[sliding_controller_const_B.j];
    }

    sliding_controller_const_B.msg.Name[0].Data_SL_Info.CurrentLength = 12U;
    for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 13;
         sliding_controller_const_B.j++) {
      sliding_controller_const_B.msg.Name[1].Data[sliding_controller_const_B.j] =
        c_1[sliding_controller_const_B.j];
    }

    sliding_controller_const_B.msg.Name[1].Data_SL_Info.CurrentLength = 13U;
    for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 14;
         sliding_controller_const_B.j++) {
      sliding_controller_const_B.msg.Name[2].Data[sliding_controller_const_B.j] =
        d_1[sliding_controller_const_B.j];
    }

    sliding_controller_const_B.msg.Name[2].Data_SL_Info.CurrentLength = 14U;
    for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 13;
         sliding_controller_const_B.j++) {
      sliding_controller_const_B.msg.Name[3].Data[sliding_controller_const_B.j] =
        e_1[sliding_controller_const_B.j];
    }

    sliding_controller_const_B.msg.Name[3].Data_SL_Info.CurrentLength = 13U;
    for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 14;
         sliding_controller_const_B.j++) {
      sliding_controller_const_B.msg.Name[4].Data[sliding_controller_const_B.j] =
        f_1[sliding_controller_const_B.j];
    }

    sliding_controller_const_B.msg.Name[4].Data_SL_Info.CurrentLength = 14U;
    for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 15;
         sliding_controller_const_B.j++) {
      sliding_controller_const_B.msg.Name[5].Data[sliding_controller_const_B.j] =
        g_1[sliding_controller_const_B.j];
    }

    sliding_controller_const_B.msg.Name[5].Data_SL_Info.CurrentLength = 15U;

    // End of MATLAB Function: '<Root>/human msg'
  }

  // MATLABSystem: '<Root>/Current Time'
  currentROSTimeBus(&sliding_controller_const_B.rtb_CurrentTime_d);

  // BusAssignment: '<Root>/Bus Assignment1' incorporates:
  //   Constant: '<S5>/Constant'
  //   MATLABSystem: '<Root>/Current Time'

  sliding_controller_const_B.BusAssignment1_m =
    sliding_controller_const_P.Constant_Value_i;
  sliding_controller_const_B.BusAssignment1_m.Stamp =
    sliding_controller_const_B.rtb_CurrentTime_d;
  if (rtmIsMajorTimeStep((&sliding_controller_const_M))) {
    // Outputs for Enabled SubSystem: '<Root>/Enabled Subsystem1' incorporates:
    //   EnablePort: '<S8>/Enable'

    if (sliding_controller_const_B.SourceBlock_o1_h) {
      // Inport: '<S8>/In1'
      sliding_controller_const_B.In1_j = sliding_controller_const_B.In1_n;
    }

    // End of Outputs for SubSystem: '<Root>/Enabled Subsystem1'

    // Outputs for Enabled SubSystem: '<Root>/Enabled Subsystem2' incorporates:
    //   EnablePort: '<S9>/Enable'

    if (sliding_controller_const_B.SourceBlock_o1) {
      // Inport: '<S9>/In1'
      sliding_controller_const_B.In1_e = sliding_controller_const_B.In1;
    }

    // End of Outputs for SubSystem: '<Root>/Enabled Subsystem2'

    // MATLAB Function: '<Root>/MATLAB Function - String Array Assign' incorporates:
    //   Constant: '<S4>/Constant'

    sliding_controller_const_B.msg_o =
      sliding_controller_const_P.Constant_Value_e;
    sliding_controller_const_B.msg_o.ModelName_SL_Info.CurrentLength = 3U;
    sliding_controller_const_B.msg_o.ModelName[0] = 101U;
    sliding_controller_const_B.msg_o.ModelName[1] = 120U;
    sliding_controller_const_B.msg_o.ModelName[2] = 111U;
    sliding_controller_const_B.msg_o.Q_SL_Info.CurrentLength = 7U;
    sliding_controller_const_B.msg_o.Qd_SL_Info.CurrentLength = 7U;
    sliding_controller_const_B.msg_o.Qdd_SL_Info.CurrentLength = 7U;

    // Outputs for Enabled SubSystem: '<Root>/Controller' incorporates:
    //   EnablePort: '<S6>/Enable'

    if (rtmIsMajorTimeStep((&sliding_controller_const_M))) {
      sliding_controller_const_DW.Controller_MODE =
        sliding_controller_const_B.LogicalOperator;
    }

    // End of Outputs for SubSystem: '<Root>/Controller'
  }

  // Outputs for Enabled SubSystem: '<Root>/Controller' incorporates:
  //   EnablePort: '<S6>/Enable'

  if (sliding_controller_const_DW.Controller_MODE) {
    if (rtmIsMajorTimeStep((&sliding_controller_const_M))) {
      // MATLAB Function: '<S6>/human msg' incorporates:
      //   Constant: '<S20>/Constant'

      sliding_controller_const_B.msg_c =
        sliding_controller_const_P.Constant_Value_c;
      sliding_controller_const_B.msg_c.Name_SL_Info.CurrentLength = 7U;
      sliding_controller_const_B.msg_c.Velocity_SL_Info.CurrentLength = 7U;
      sliding_controller_const_B.msg_c.Position_SL_Info.CurrentLength = 7U;
      sliding_controller_const_B.msg_c.Effort_SL_Info.CurrentLength = 7U;
      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 7;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.msg_c.Name[0]
          .Data[sliding_controller_const_B.j] = b_0[sliding_controller_const_B.j];
      }

      sliding_controller_const_B.msg_c.Name[0].Data_SL_Info.CurrentLength = 7U;
      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 8;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.msg_c.Name[1]
          .Data[sliding_controller_const_B.j] = c_0[sliding_controller_const_B.j];
      }

      sliding_controller_const_B.msg_c.Name[1].Data_SL_Info.CurrentLength = 8U;
      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 9;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.msg_c.Name[2]
          .Data[sliding_controller_const_B.j] = d_0[sliding_controller_const_B.j];
      }

      sliding_controller_const_B.msg_c.Name[2].Data_SL_Info.CurrentLength = 9U;
      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 8;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.msg_c.Name[3]
          .Data[sliding_controller_const_B.j] = e_0[sliding_controller_const_B.j];
      }

      sliding_controller_const_B.msg_c.Name[3].Data_SL_Info.CurrentLength = 8U;
      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 9;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.msg_c.Name[4]
          .Data[sliding_controller_const_B.j] = f_0[sliding_controller_const_B.j];
      }

      sliding_controller_const_B.msg_c.Name[4].Data_SL_Info.CurrentLength = 9U;
      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 10;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.msg_c.Name[5]
          .Data[sliding_controller_const_B.j] = g_0[sliding_controller_const_B.j];
      }

      sliding_controller_const_B.msg_c.Name[5].Data_SL_Info.CurrentLength = 10U;
      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 6;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.msg_c.Name[6]
          .Data[sliding_controller_const_B.j] = h_0[sliding_controller_const_B.j];
      }

      sliding_controller_const_B.msg_c.Name[6].Data_SL_Info.CurrentLength = 6U;

      // End of MATLAB Function: '<S6>/human msg'
      for (sliding_controller_const_B.i = 0; sliding_controller_const_B.i < 7;
           sliding_controller_const_B.i++) {
        // SignalConversion generated from: '<S6>/Bus Selector1'
        sliding_controller_const_B.Position[sliding_controller_const_B.i] =
          sliding_controller_const_B.In1_j.Position[sliding_controller_const_B.i];
      }

      // MATLAB Function: '<S45>/MATLAB Function'
      sliding_controll_MATLABFunction(&sliding_controller_const_B.Position[0],
        sliding_controller_const_B.rtb_y_a_g);

      // MATLAB Function: '<S19>/human left'
      sliding_controller_cons_exoleft
        (&sliding_controller_const_B.In1_e.Position[0],
         &sliding_controller_const_B.In1_e.Velocity[0],
         sliding_controller_const_B.rtb_danke_e_o,
         sliding_controller_const_B.rtb_Add_c_b,
         sliding_controller_const_B.rtb_Product2_b,
         sliding_controller_const_B.rtb_Add_e_l);

      // MATLAB Function: '<S19>/exo left'
      sliding_controller_cons_exoleft(&sliding_controller_const_B.Position[0],
        &sliding_controller_const_B.In1_j.Velocity[0],
        sliding_controller_const_B.rtb_danke_m_l,
        sliding_controller_const_B.rtb_ankle_d,
        sliding_controller_const_B.rtb_dknee_d,
        sliding_controller_const_B.rtb_danke_n);

      // MATLAB Function: '<S45>/MATLAB Function1'
      sliding_control_MATLABFunction1(&sliding_controller_const_B.Position[0],
        sliding_controller_const_B.rtb_y_g2);

      // Sum: '<S34>/Subtract1'
      sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec =
        sliding_controller_const_B.rtb_danke_n[0] -
        sliding_controller_const_B.rtb_Add_e_l[0];

      // Sum: '<S34>/Subtract'
      sliding_controller_const_B.wj = sliding_controller_const_B.rtb_dknee_d[0]
        - sliding_controller_const_B.rtb_Product2_b[0];

      // Sum: '<S36>/Subtract1' incorporates:
      //   Sum: '<S34>/Subtract1'

      sliding_controller_const_B.rtb_danke_n[0] =
        sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec;

      // Sum: '<S34>/Subtract1'
      sliding_controller_const_B.rtb_danke_tmp =
        sliding_controller_const_B.rtb_danke_n[1] -
        sliding_controller_const_B.rtb_Add_e_l[1];

      // Sum: '<S34>/Subtract'
      sliding_controller_const_B.rtb_dknee_idx_1 =
        sliding_controller_const_B.rtb_dknee_d[1] -
        sliding_controller_const_B.rtb_Product2_b[1];

      // Sum: '<S36>/Subtract1' incorporates:
      //   Sum: '<S34>/Subtract1'

      sliding_controller_const_B.rtb_danke_n[1] =
        sliding_controller_const_B.rtb_danke_tmp;

      // Sum: '<S36>/Subtract2' incorporates:
      //   Gain: '<S34>/dampener left shank'
      //   Gain: '<S34>/spring left shank'
      //   Sum: '<S34>/Subtract1'
      //   Sum: '<S34>/Subtract2'

      sliding_controller_const_B.rtb_Subtract2_g[0] =
        (sliding_controller_const_P.spring[0] * sliding_controller_const_B.wj +
         sliding_controller_const_P.spring[2] *
         sliding_controller_const_B.rtb_dknee_idx_1) + (dampener[0] *
        sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec +
        sliding_controller_const_B.rtb_danke_tmp * dampener[2]);
      sliding_controller_const_B.rtb_Subtract2_g[1] =
        (sliding_controller_const_P.spring[1] * sliding_controller_const_B.wj +
         sliding_controller_const_P.spring[3] *
         sliding_controller_const_B.rtb_dknee_idx_1) +
        (sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec * dampener[1]
         + sliding_controller_const_B.rtb_danke_tmp * dampener[3]);

      // Sum: '<S44>/Add' incorporates:
      //   Math: '<S45>/Transpose2'
      //   Product: '<S45>/Product2'

      sliding_controller_const_B.rtb_Add_e_tmp =
        sliding_controller_const_B.rtb_y_g2[0] *
        sliding_controller_const_B.rtb_Subtract2_g[0] +
        sliding_controller_const_B.rtb_y_g2[1] *
        sliding_controller_const_B.rtb_Subtract2_g[1];
      sliding_controller_const_B.rtb_Add_e_l[0] =
        sliding_controller_const_B.rtb_Add_e_tmp;

      // Sum: '<S35>/Subtract'
      sliding_controller_const_B.rtb_dknee_idx_1 =
        sliding_controller_const_B.rtb_danke_m_l[0] -
        sliding_controller_const_B.rtb_danke_e_o[0];

      // Sum: '<S35>/Subtract1'
      sliding_controller_const_B.rtb_danke_tmp =
        sliding_controller_const_B.rtb_ankle_d[0] -
        sliding_controller_const_B.rtb_Add_c_b[0];

      // Sum: '<S44>/Add' incorporates:
      //   Math: '<S45>/Transpose2'
      //   Product: '<S45>/Product2'

      sliding_controller_const_B.rtb_Add_e_tmp_l =
        sliding_controller_const_B.rtb_Subtract2_g[0] *
        sliding_controller_const_B.rtb_y_g2[2] +
        sliding_controller_const_B.rtb_Subtract2_g[1] *
        sliding_controller_const_B.rtb_y_g2[3];
      sliding_controller_const_B.rtb_Add_e_l[1] =
        sliding_controller_const_B.rtb_Add_e_tmp_l;

      // Sum: '<S35>/Subtract'
      sliding_controller_const_B.rtb_danke_m_idx_1 =
        sliding_controller_const_B.rtb_danke_m_l[1] -
        sliding_controller_const_B.rtb_danke_e_o[1];

      // Sum: '<S35>/Subtract1'
      sliding_controller_const_B.rtb_ankle_idx_1 =
        sliding_controller_const_B.rtb_ankle_d[1] -
        sliding_controller_const_B.rtb_Add_c_b[1];

      // Sum: '<S35>/Subtract2' incorporates:
      //   Gain: '<S35>/dampener left thigh'
      //   Gain: '<S35>/spring left thigh'

      sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec =
        (sliding_controller_const_P.spring[0] *
         sliding_controller_const_B.rtb_dknee_idx_1 +
         sliding_controller_const_P.spring[2] *
         sliding_controller_const_B.rtb_danke_m_idx_1) + (dampener[0] *
        sliding_controller_const_B.rtb_danke_tmp + dampener[2] *
        sliding_controller_const_B.rtb_ankle_idx_1);
      sliding_controller_const_B.wj = (sliding_controller_const_P.spring[1] *
        sliding_controller_const_B.rtb_dknee_idx_1 +
        sliding_controller_const_P.spring[3] *
        sliding_controller_const_B.rtb_danke_m_idx_1) + (dampener[1] *
        sliding_controller_const_B.rtb_danke_tmp + dampener[3] *
        sliding_controller_const_B.rtb_ankle_idx_1);

      // Saturate: '<S6>/Saturation' incorporates:
      //   Math: '<S45>/Transpose1'
      //   Product: '<S45>/Product1'
      //   Sum: '<S45>/Add'

      sliding_controller_const_B.rtb_Add_c_f[0] =
        (sliding_controller_const_B.rtb_y_a_g[0] *
         sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec +
         sliding_controller_const_B.rtb_y_a_g[1] * sliding_controller_const_B.wj)
        + sliding_controller_const_B.rtb_Add_e_tmp;
      sliding_controller_const_B.rtb_Add_c_f[1] =
        (sliding_controller_const_B.rtb_y_a_g[2] *
         sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec +
         sliding_controller_const_B.rtb_y_a_g[3] * sliding_controller_const_B.wj)
        + sliding_controller_const_B.rtb_Add_e_tmp_l;

      // MATLAB Function: '<S44>/MATLAB Function'
      sliding_controll_MATLABFunction(&sliding_controller_const_B.Position[3],
        sliding_controller_const_B.rtb_y_a_g);

      // MATLAB Function: '<S19>/human right'
      sliding_controller_cons_exoleft
        (&sliding_controller_const_B.In1_e.Position[3],
         &sliding_controller_const_B.In1_e.Velocity[3],
         sliding_controller_const_B.rtb_danke_n,
         sliding_controller_const_B.rtb_Subtract2_g,
         sliding_controller_const_B.rtb_Product2_b,
         sliding_controller_const_B.rtb_danke_e_o);

      // MATLAB Function: '<S19>/exo right'
      sliding_controller_cons_exoleft(&sliding_controller_const_B.Position[3],
        &sliding_controller_const_B.In1_j.Velocity[3],
        sliding_controller_const_B.rtb_Add_e_l,
        sliding_controller_const_B.rtb_dknee_d,
        sliding_controller_const_B.rtb_ankle_d,
        sliding_controller_const_B.rtb_danke_m_l);

      // MATLAB Function: '<S44>/MATLAB Function1'
      sliding_control_MATLABFunction1(&sliding_controller_const_B.Position[3],
        sliding_controller_const_B.rtb_y_g2);

      // Sum: '<S37>/Subtract'
      sliding_controller_const_B.rtb_danke_tmp =
        sliding_controller_const_B.rtb_Add_e_l[0] -
        sliding_controller_const_B.rtb_danke_n[0];

      // Sum: '<S37>/Subtract1'
      sliding_controller_const_B.wj = sliding_controller_const_B.rtb_dknee_d[0]
        - sliding_controller_const_B.rtb_Subtract2_g[0];

      // Sum: '<S37>/Subtract'
      sliding_controller_const_B.rtb_danke_m_idx_1 =
        sliding_controller_const_B.rtb_Add_e_l[1] -
        sliding_controller_const_B.rtb_danke_n[1];

      // Sum: '<S37>/Subtract1'
      sliding_controller_const_B.rtb_dknee_idx_1 =
        sliding_controller_const_B.rtb_dknee_d[1] -
        sliding_controller_const_B.rtb_Subtract2_g[1];

      // Sum: '<S37>/Subtract2' incorporates:
      //   Gain: '<S37>/dampener right shank'
      //   Gain: '<S37>/spring right thigh'

      sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec =
        (sliding_controller_const_P.spring[0] *
         sliding_controller_const_B.rtb_danke_tmp +
         sliding_controller_const_P.spring[2] *
         sliding_controller_const_B.rtb_danke_m_idx_1) + (dampener[0] *
        sliding_controller_const_B.wj + dampener[2] *
        sliding_controller_const_B.rtb_dknee_idx_1);
      sliding_controller_const_B.wj = (sliding_controller_const_P.spring[1] *
        sliding_controller_const_B.rtb_danke_tmp +
        sliding_controller_const_P.spring[3] *
        sliding_controller_const_B.rtb_danke_m_idx_1) + (dampener[1] *
        sliding_controller_const_B.wj + dampener[3] *
        sliding_controller_const_B.rtb_dknee_idx_1);

      // Sum: '<S36>/Subtract'
      sliding_controller_const_B.rtb_danke_tmp =
        sliding_controller_const_B.rtb_ankle_d[0] -
        sliding_controller_const_B.rtb_Product2_b[0];

      // Sum: '<S36>/Subtract1'
      sliding_controller_const_B.rtb_dknee_idx_1 =
        sliding_controller_const_B.rtb_danke_m_l[0] -
        sliding_controller_const_B.rtb_danke_e_o[0];

      // Sum: '<S36>/Subtract'
      sliding_controller_const_B.rtb_ankle_idx_1 =
        sliding_controller_const_B.rtb_ankle_d[1] -
        sliding_controller_const_B.rtb_Product2_b[1];

      // Sum: '<S36>/Subtract1'
      sliding_controller_const_B.rtb_danke_m_idx_1 =
        sliding_controller_const_B.rtb_danke_m_l[1] -
        sliding_controller_const_B.rtb_danke_e_o[1];

      // Sum: '<S36>/Subtract2' incorporates:
      //   Gain: '<S36>/dampener right shank'
      //   Gain: '<S36>/spring right thigh'

      sliding_controller_const_B.rtb_Add_e_tmp =
        (sliding_controller_const_P.spring[0] *
         sliding_controller_const_B.rtb_danke_tmp +
         sliding_controller_const_P.spring[2] *
         sliding_controller_const_B.rtb_ankle_idx_1) + (dampener[0] *
        sliding_controller_const_B.rtb_dknee_idx_1 + dampener[2] *
        sliding_controller_const_B.rtb_danke_m_idx_1);
      sliding_controller_const_B.rtb_dknee_idx_1 =
        (sliding_controller_const_P.spring[1] *
         sliding_controller_const_B.rtb_danke_tmp +
         sliding_controller_const_P.spring[3] *
         sliding_controller_const_B.rtb_ankle_idx_1) + (dampener[1] *
        sliding_controller_const_B.rtb_dknee_idx_1 + dampener[3] *
        sliding_controller_const_B.rtb_danke_m_idx_1);

      // Saturate: '<S6>/Saturation' incorporates:
      //   Constant: '<S23>/Constant'
      //   Constant: '<S44>/Constant'
      //   Constant: '<S45>/Constant'
      //   Math: '<S44>/Transpose1'
      //   Math: '<S44>/Transpose2'
      //   Product: '<S44>/Product1'
      //   Product: '<S44>/Product2'
      //   Sum: '<S44>/Add'

      sliding_controller_const_B.rtb_Add_c_f[2] =
        sliding_controller_const_P.Constant_Value_pa;
      sliding_controller_const_B.rtb_Add_c_f[3] =
        (sliding_controller_const_B.rtb_y_a_g[0] *
         sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec +
         sliding_controller_const_B.rtb_y_a_g[1] * sliding_controller_const_B.wj)
        + (sliding_controller_const_B.rtb_y_g2[0] *
           sliding_controller_const_B.rtb_Add_e_tmp +
           sliding_controller_const_B.rtb_y_g2[1] *
           sliding_controller_const_B.rtb_dknee_idx_1);
      sliding_controller_const_B.rtb_Add_c_f[4] =
        (sliding_controller_const_B.rtb_y_a_g[2] *
         sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec +
         sliding_controller_const_B.rtb_y_a_g[3] * sliding_controller_const_B.wj)
        + (sliding_controller_const_B.rtb_y_g2[2] *
           sliding_controller_const_B.rtb_Add_e_tmp +
           sliding_controller_const_B.rtb_y_g2[3] *
           sliding_controller_const_B.rtb_dknee_idx_1);
      sliding_controller_const_B.rtb_Add_c_f[5] =
        sliding_controller_const_P.Constant_Value_ou;
      sliding_controller_const_B.rtb_Add_c_f[6] =
        sliding_controller_const_P.Constant_Value_l;
      for (sliding_controller_const_B.i = 0; sliding_controller_const_B.i < 7;
           sliding_controller_const_B.i++) {
        // Saturate: '<S6>/Saturation'
        sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec =
          sliding_controller_const_B.rtb_Add_c_f[sliding_controller_const_B.i];
        if (sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec >
            sliding_controller_const_P.interaction_sat) {
          // Saturate: '<S6>/Saturation'
          sliding_controller_const_B.Saturation[sliding_controller_const_B.i] =
            sliding_controller_const_P.interaction_sat;
        } else if (sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec <
                   -sliding_controller_const_P.interaction_sat) {
          // Saturate: '<S6>/Saturation'
          sliding_controller_const_B.Saturation[sliding_controller_const_B.i] =
            -sliding_controller_const_P.interaction_sat;
        } else {
          // Saturate: '<S6>/Saturation'
          sliding_controller_const_B.Saturation[sliding_controller_const_B.i] =
            sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec;
        }

        // Sum: '<S26>/Sum' incorporates:
        //   Constant: '<S6>/Constant3'

        sliding_controller_const_B.Sum[sliding_controller_const_B.i] =
          sliding_controller_const_P.Constant3_Value[sliding_controller_const_B.i]
          - sliding_controller_const_B.Saturation[sliding_controller_const_B.i];
      }

      // MATLAB Function: '<S26>/MATLAB Function' incorporates:
      //   Constant: '<S26>/Constant'
      //   Constant: '<S26>/Constant1'
      //   Constant: '<S26>/Constant2'
      //   Constant: '<S26>/Constant3'
      //   Constant: '<S26>/Constant4'
      //   Constant: '<S26>/Constant5'
      //   Constant: '<S6>/Constant2'
      //   Constant: '<S6>/Constant3'

      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 49;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.Kp0_k[sliding_controller_const_B.j] = 0.0;
      }

      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 7;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.Kp0_k[sliding_controller_const_B.j + 7 *
          sliding_controller_const_B.j] = Kp0[sliding_controller_const_B.j];
      }

      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 49;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.Kn0_c[sliding_controller_const_B.j] = 0.0;
      }

      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 7;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.Kn0_c[sliding_controller_const_B.j + 7 *
          sliding_controller_const_B.j] = Kn0[sliding_controller_const_B.j];
      }

      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 49;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.Bp0_b[sliding_controller_const_B.j] = 0.0;
      }

      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 7;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.Bp0_b[sliding_controller_const_B.j + 7 *
          sliding_controller_const_B.j] = Bp0[sliding_controller_const_B.j];
      }

      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 49;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.Bn0_p[sliding_controller_const_B.j] = 0.0;
      }

      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 7;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.Bn0_p[sliding_controller_const_B.j + 7 *
          sliding_controller_const_B.j] = Bn0[sliding_controller_const_B.j];
        sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec =
          sliding_controller_const_B.Sum[sliding_controller_const_B.j];
        sliding_controller_const_B.wj =
          sliding_controller_const_P.Constant2_Value[sliding_controller_const_B.j];
        sliding_controller_const_B.jpvt[sliding_controller_const_B.j] =
          sliding_controller_const_B.j + 1;
        sliding_controller_const_B.b_varargout_2_Effort[sliding_controller_const_B.j]
          =
          sliding_controller_const_P.Constant3_Value[sliding_controller_const_B.j];
        if (sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec < 0.0) {
          sliding_controller_const_B.q_add_c[sliding_controller_const_B.j] =
            -1.0;
        } else if (sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec >
                   0.0) {
          sliding_controller_const_B.q_add_c[sliding_controller_const_B.j] = 1.0;
        } else if (sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec ==
                   0.0) {
          sliding_controller_const_B.q_add_c[sliding_controller_const_B.j] = 0.0;
        } else {
          sliding_controller_const_B.q_add_c[sliding_controller_const_B.j] =
            (rtNaN);
        }

        if (sliding_controller_const_B.wj < 0.0) {
          sliding_controller_const_B.q_add_j[sliding_controller_const_B.j] =
            -1.0;
        } else if (sliding_controller_const_B.wj > 0.0) {
          sliding_controller_const_B.q_add_j[sliding_controller_const_B.j] = 1.0;
        } else if (sliding_controller_const_B.wj == 0.0) {
          sliding_controller_const_B.q_add_j[sliding_controller_const_B.j] = 0.0;
        } else {
          sliding_controller_const_B.q_add_j[sliding_controller_const_B.j] =
            (rtNaN);
        }
      }

      sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec = 0.0;
      sliding_controller_const_qrpf
        (sliding_controller_const_B.b_varargout_2_Effort, 1, 1, 7,
         &sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec,
         sliding_controller_const_B.jpvt);
      sliding_controller_const_B.i = 0;
      sliding_controller_const_B.wj = fabs
        (sliding_controller_const_B.b_varargout_2_Effort[0]);
      if (!(sliding_controller_const_B.wj <= 1.5543122344752192E-14 *
            sliding_controller_const_B.wj)) {
        sliding_controller_const_B.i = 1;
      }

      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 49;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.change[sliding_controller_const_B.j] = 0.0;
      }

      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 7;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.rtb_Add_c_f[sliding_controller_const_B.j] =
          sliding_controller_const_B.Sum[sliding_controller_const_B.j];
        if (sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec != 0.0) {
          sliding_controller_const_B.wj =
            sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec *
            sliding_controller_const_B.rtb_Add_c_f[sliding_controller_const_B.j];
          if (sliding_controller_const_B.wj != 0.0) {
            sliding_controller_const_B.rtb_Add_c_f[sliding_controller_const_B.j]
              -= sliding_controller_const_B.wj;
          }
        }

        if (0 <= sliding_controller_const_B.i - 1) {
          sliding_controller_const_B.change[(sliding_controller_const_B.jpvt[0]
            + 7 * sliding_controller_const_B.j) - 1] =
            sliding_controller_const_B.rtb_Add_c_f[sliding_controller_const_B.j];
        }

        sliding_controller_const_B.e_j = sliding_controller_const_B.i;
        while (sliding_controller_const_B.e_j > 0) {
          sliding_controller_const_B.e_j = (7 * sliding_controller_const_B.j +
            sliding_controller_const_B.jpvt[0]) - 1;
          sliding_controller_const_B.change[sliding_controller_const_B.e_j] /=
            sliding_controller_const_B.b_varargout_2_Effort[0];
          sliding_controller_const_B.e_j = 0;
        }
      }

      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 7;
           sliding_controller_const_B.j++) {
        for (sliding_controller_const_B.i = 0; sliding_controller_const_B.i < 7;
             sliding_controller_const_B.i++) {
          sliding_controller_const_B.Y[sliding_controller_const_B.i + 7 *
            sliding_controller_const_B.j] = sliding_controller_const_B.change[7 *
            sliding_controller_const_B.i + sliding_controller_const_B.j];
        }
      }

      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 49;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.change[sliding_controller_const_B.j] = fabs
          (sliding_controller_const_B.Y[sliding_controller_const_B.j]);
        sliding_controller_const_B.K[sliding_controller_const_B.j] = 0.0;
      }

      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 7;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.K[sliding_controller_const_B.j + 7 *
          sliding_controller_const_B.j] = 1.0;
      }

      for (sliding_controller_const_B.i = 0; sliding_controller_const_B.i < 49;
           sliding_controller_const_B.i++) {
        sliding_controller_const_B.B[sliding_controller_const_B.i] = 0.0;
      }

      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 7;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec =
          sliding_controller_const_B.change[sliding_controller_const_B.j];
        sliding_controller_const_B.i = sliding_controller_const_B.j + 7 *
          sliding_controller_const_B.j;
        sliding_controller_const_B.B[sliding_controller_const_B.i] = 1.0;
        if (sliding_controller_const_B.q_add_c[sliding_controller_const_B.j] ==
            sliding_controller_const_B.q_add_j[sliding_controller_const_B.j]) {
          sliding_controller_const_B.K[sliding_controller_const_B.i] =
            sliding_controller_const_B.Kp0_k[sliding_controller_const_B.i] +
            sliding_controller_const_P.gamma[0] *
            sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec;
          sliding_controller_const_B.B[sliding_controller_const_B.i] =
            sliding_controller_const_B.Bp0_b[sliding_controller_const_B.i] +
            sliding_controller_const_P.alpha[0] *
            sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec;
        } else {
          sliding_controller_const_B.K[sliding_controller_const_B.i] =
            sliding_controller_const_B.Kn0_c[sliding_controller_const_B.i] -
            sliding_controller_const_P.gamma[1] *
            sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec;
          sliding_controller_const_B.B[sliding_controller_const_B.i] =
            sliding_controller_const_B.Bn0_p[sliding_controller_const_B.i] -
            sliding_controller_const_P.alpha[1] *
            sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec;
        }
      }

      // End of MATLAB Function: '<S26>/MATLAB Function'
    }

    for (sliding_controller_const_B.i = 0; sliding_controller_const_B.i < 7;
         sliding_controller_const_B.i++) {
      // Integrator: '<S26>/Integrator'
      sliding_controller_const_B.qd_add[sliding_controller_const_B.i] =
        sliding_controller_const_X.Integrator_CSTATE[sliding_controller_const_B.i];

      // Product: '<S26>/Product' incorporates:
      //   Integrator: '<S26>/Integrator1'

      sliding_controller_const_B.b_varargout_2_Effort[sliding_controller_const_B.i]
        = 0.0;
      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 7;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.b_varargout_2_Effort[sliding_controller_const_B.i]
          += sliding_controller_const_B.K[7 * sliding_controller_const_B.j +
          sliding_controller_const_B.i] *
          sliding_controller_const_X.Integrator1_CSTATE[sliding_controller_const_B.j];
      }

      // End of Product: '<S26>/Product'

      // Product: '<S26>/Product1'
      sliding_controller_const_B.rtb_Add_c_f[sliding_controller_const_B.i] = 0.0;
    }

    for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 7;
         sliding_controller_const_B.j++) {
      // Product: '<S26>/Product1'
      for (sliding_controller_const_B.i = 0; sliding_controller_const_B.i < 7;
           sliding_controller_const_B.i++) {
        sliding_controller_const_B.rtb_Add_c_f[sliding_controller_const_B.j] +=
          sliding_controller_const_B.B[7 * sliding_controller_const_B.i +
          sliding_controller_const_B.j] *
          sliding_controller_const_B.qd_add[sliding_controller_const_B.i];
      }

      // Sum: '<S26>/Sum6' incorporates:
      //   Sum: '<S26>/Add1'

      sliding_controller_const_B.dv[sliding_controller_const_B.j] =
        sliding_controller_const_B.Sum[sliding_controller_const_B.j] -
        (sliding_controller_const_B.b_varargout_2_Effort[sliding_controller_const_B.j]
         + sliding_controller_const_B.rtb_Add_c_f[sliding_controller_const_B.j]);

      // Gain: '<S26>/addmittance gain'
      sliding_controller_const_B.qd_add_n[sliding_controller_const_B.j] = 0.0;
    }

    for (sliding_controller_const_B.i = 0; sliding_controller_const_B.i < 7;
         sliding_controller_const_B.i++) {
      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 7;
           sliding_controller_const_B.j++) {
        // Gain: '<S26>/addmittance gain'
        sliding_controller_const_B.qd_add_n[sliding_controller_const_B.i] +=
          invMd[7 * sliding_controller_const_B.j + sliding_controller_const_B.i]
          * sliding_controller_const_B.dv[sliding_controller_const_B.j];
      }

      // Sum: '<S26>/Sum2' incorporates:
      //   Constant: '<S6>/Constant2'
      //   Sum: '<S26>/Sum8'

      sliding_controller_const_B.q_add_c[sliding_controller_const_B.i] =
        sliding_controller_const_B.In1_j.Velocity[sliding_controller_const_B.i]
        - (sliding_controller_const_B.qd_add[sliding_controller_const_B.i] +
           sliding_controller_const_P.Constant2_Value[sliding_controller_const_B.i]);

      // Sum: '<S26>/Sum1' incorporates:
      //   Constant: '<S6>/Constant1'
      //   Integrator: '<S26>/Integrator1'
      //   Sum: '<S26>/Sum7'

      sliding_controller_const_B.q_add_j[sliding_controller_const_B.i] =
        sliding_controller_const_B.Position[sliding_controller_const_B.i] -
        (sliding_controller_const_P.Constant1_Value[sliding_controller_const_B.i]
         + sliding_controller_const_X.Integrator1_CSTATE[sliding_controller_const_B.i]);
    }

    if (rtmIsMajorTimeStep((&sliding_controller_const_M))) {
      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 7;
           sliding_controller_const_B.j++) {
        // Sum: '<S27>/Sum3' incorporates:
        //   Constant: '<S6>/Constant1'

        sliding_controller_const_B.b_varargout_2_Effort[sliding_controller_const_B.j]
          =
          sliding_controller_const_P.Constant1_Value[sliding_controller_const_B.j]
          - sliding_controller_const_B.In1_e.Position[sliding_controller_const_B.j];

        // Sum: '<S27>/Sum1' incorporates:
        //   Constant: '<S6>/Constant2'

        sliding_controller_const_B.rtb_Add_c_f[sliding_controller_const_B.j] =
          sliding_controller_const_P.Constant2_Value[sliding_controller_const_B.j]
          - sliding_controller_const_B.In1_e.Velocity[sliding_controller_const_B.j];

        // Gain: '<S27>/human proportional gain'
        sliding_controller_const_B.dv[sliding_controller_const_B.j] = 0.0;
      }

      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 7;
           sliding_controller_const_B.j++) {
        // Gain: '<S27>/human derative gain'
        sliding_controller_const_B.dv1[sliding_controller_const_B.j] = 0.0;
        for (sliding_controller_const_B.i = 0; sliding_controller_const_B.i < 7;
             sliding_controller_const_B.i++) {
          // Gain: '<S27>/human proportional gain' incorporates:
          //   Gain: '<S27>/human derative gain'

          sliding_controller_const_B.e_j = 7 * sliding_controller_const_B.i +
            sliding_controller_const_B.j;
          sliding_controller_const_B.dv[sliding_controller_const_B.j] +=
            Km1[sliding_controller_const_B.e_j] *
            sliding_controller_const_B.b_varargout_2_Effort[sliding_controller_const_B.i];

          // Gain: '<S27>/human derative gain'
          sliding_controller_const_B.dv1[sliding_controller_const_B.j] +=
            Dm1[sliding_controller_const_B.e_j] *
            sliding_controller_const_B.rtb_Add_c_f[sliding_controller_const_B.i];
        }

        // Saturate: '<S6>/human sateration' incorporates:
        //   Sum: '<S27>/Add2'

        sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec =
          sliding_controller_const_B.dv[sliding_controller_const_B.j] +
          sliding_controller_const_B.dv1[sliding_controller_const_B.j];
        if (sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec >
            sliding_controller_const_P.human_sat) {
          // Saturate: '<S6>/human sateration'
          sliding_controller_const_B.humansateration[sliding_controller_const_B.j]
            = sliding_controller_const_P.human_sat;
        } else if (sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec <
                   -sliding_controller_const_P.human_sat) {
          // Saturate: '<S6>/human sateration'
          sliding_controller_const_B.humansateration[sliding_controller_const_B.j]
            = -sliding_controller_const_P.human_sat;
        } else {
          // Saturate: '<S6>/human sateration'
          sliding_controller_const_B.humansateration[sliding_controller_const_B.j]
            = sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec;
        }

        // End of Saturate: '<S6>/human sateration'
      }
    }

    // BusAssignment: '<S29>/Bus Assignment' incorporates:
    //   SignalConversion generated from: '<S29>/Bus Assignment'

    sliding_controller_const_B.BusAssignment = sliding_controller_const_B.msg_o;
    for (sliding_controller_const_B.i = 0; sliding_controller_const_B.i < 7;
         sliding_controller_const_B.i++) {
      sliding_controller_const_B.BusAssignment.Q[sliding_controller_const_B.i] =
        sliding_controller_const_B.Position[sliding_controller_const_B.i];
      sliding_controller_const_B.BusAssignment.Qd[sliding_controller_const_B.i] =
        sliding_controller_const_B.In1_j.Velocity[sliding_controller_const_B.i];

      // Sum: '<S29>/Add' incorporates:
      //   Gain: '<S29>/lambda SMC'

      sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec = 0.0;
      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 7;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec += lambda2[7 *
          sliding_controller_const_B.j + sliding_controller_const_B.i] *
          sliding_controller_const_B.q_add_j[sliding_controller_const_B.j];
      }

      // Trigonometry: '<S29>/Tanh' incorporates:
      //   Gain: '<S29>/lambda SMC'
      //   Gain: '<S29>/surface width SMC'
      //   Sum: '<S29>/Add'

      sliding_controller_const_B.b_varargout_2_Effort[sliding_controller_const_B.i]
        = tanh((sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec +
                sliding_controller_const_B.q_add_c[sliding_controller_const_B.i])
               * sliding_controller_const_P.beta[sliding_controller_const_B.i]);
    }

    for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 7;
         sliding_controller_const_B.j++) {
      // Sum: '<S29>/Add1'
      sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec = 0.0;

      // Gain: '<S29>/Gain12'
      sliding_controller_const_B.rtb_Add_c_f[sliding_controller_const_B.j] = 0.0;
      for (sliding_controller_const_B.i = 0; sliding_controller_const_B.i < 7;
           sliding_controller_const_B.i++) {
        // Sum: '<S29>/Add1' incorporates:
        //   Gain: '<S29>/Gain12'
        //   Gain: '<S29>/rho SMC'

        sliding_controller_const_B.e_j = 7 * sliding_controller_const_B.i +
          sliding_controller_const_B.j;
        sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec +=
          rho2[sliding_controller_const_B.e_j] *
          sliding_controller_const_B.b_varargout_2_Effort[sliding_controller_const_B.i];

        // Gain: '<S29>/Gain12'
        sliding_controller_const_B.rtb_Add_c_f[sliding_controller_const_B.j] +=
          lambda2[sliding_controller_const_B.e_j] *
          sliding_controller_const_B.q_add_c[sliding_controller_const_B.i];
      }

      // BusAssignment: '<S29>/Bus Assignment' incorporates:
      //   Sum: '<S29>/Add1'

      sliding_controller_const_B.BusAssignment.Qdd[sliding_controller_const_B.j]
        = (0.0 - sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec) -
        sliding_controller_const_B.rtb_Add_c_f[sliding_controller_const_B.j];
    }

    // Outputs for Atomic SubSystem: '<S29>/Call Service'
    // MATLABSystem: '<S51>/ServiceCaller'
    isCreated = ServCall_sliding_controller_const_1160.getIsCreated();
    if (!isCreated) {
      for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 16;
           sliding_controller_const_B.j++) {
        sliding_controller_const_B.b_zeroDelimServiceName_j[sliding_controller_const_B.j]
          = tmp_1[sliding_controller_const_B.j];
      }

      sliding_controller_const_B.b_zeroDelimServiceName_j[16] = '\x00';
      b_varargout_2 = ServCall_sliding_controller_const_1160.createServiceCaller
        (&sliding_controller_const_B.b_zeroDelimServiceName_j[0], true, 1.0);
      if (b_varargout_2 != SLSuccess) {
      } else {
        ServCall_sliding_controller_const_1160.call
          (&sliding_controller_const_B.BusAssignment,
           &sliding_controller_const_B.b_varargout_1_c);
      }
    } else {
      ServCall_sliding_controller_const_1160.call
        (&sliding_controller_const_B.BusAssignment,
         &sliding_controller_const_B.b_varargout_1_c);
    }

    // End of Outputs for SubSystem: '<S29>/Call Service'

    // BusAssignment: '<S6>/Bus Assignment3' incorporates:
    //   SignalConversion generated from: '<S6>/Bus Assignment3'

    sliding_controller_const_B.BusAssignment3 = sliding_controller_const_B.msg_c;
    for (sliding_controller_const_B.i = 0; sliding_controller_const_B.i < 7;
         sliding_controller_const_B.i++) {
      // Outputs for Atomic SubSystem: '<S29>/Call Service'
      // MATLABSystem: '<S51>/ServiceCaller'
      sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec =
        sliding_controller_const_B.b_varargout_1_c.Tau[sliding_controller_const_B.i];

      // End of Outputs for SubSystem: '<S29>/Call Service'

      // Saturate: '<S6>/exo sateration'
      if (sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec > exo_sat) {
        // Saturate: '<S6>/exo sateration'
        sliding_controller_const_B.exosateration[sliding_controller_const_B.i] =
          exo_sat;
      } else if (sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec <
                 -exo_sat) {
        // Saturate: '<S6>/exo sateration'
        sliding_controller_const_B.exosateration[sliding_controller_const_B.i] =
          -exo_sat;
      } else {
        // Saturate: '<S6>/exo sateration'
        sliding_controller_const_B.exosateration[sliding_controller_const_B.i] =
          sliding_controller_const_B.b_varargout_2_Header_Stamp_Sec;
      }

      // End of Saturate: '<S6>/exo sateration'

      // BusAssignment: '<S6>/Bus Assignment3'
      sliding_controller_const_B.BusAssignment3.Position[sliding_controller_const_B.i]
        = sliding_controller_const_B.q_add_j[sliding_controller_const_B.i];
      sliding_controller_const_B.BusAssignment3.Velocity[sliding_controller_const_B.i]
        = sliding_controller_const_B.q_add_c[sliding_controller_const_B.i];
      sliding_controller_const_B.BusAssignment3.Effort[sliding_controller_const_B.i]
        = sliding_controller_const_B.Saturation[sliding_controller_const_B.i];
    }

    // Outputs for Atomic SubSystem: '<S6>/Publish2'
    // MATLABSystem: '<S25>/SinkBlock'
    Pub_sliding_controller_const_1454.publish
      (&sliding_controller_const_B.BusAssignment3);

    // End of Outputs for SubSystem: '<S6>/Publish2'
    if (rtmIsMajorTimeStep((&sliding_controller_const_M))) {
      // MATLAB Function: '<S38>/MATLAB Function'
      sliding_controll_MATLABFunction
        (&sliding_controller_const_B.In1_e.Position[0],
         sliding_controller_const_B.rtb_y_a_g);

      // MATLAB Function: '<S38>/MATLAB Function1'
      sliding_control_MATLABFunction1
        (&sliding_controller_const_B.In1_e.Position[0],
         sliding_controller_const_B.rtb_y_a_g);

      // MATLAB Function: '<S39>/MATLAB Function'
      sliding_controll_MATLABFunction
        (&sliding_controller_const_B.In1_e.Position[3],
         sliding_controller_const_B.rtb_y_a_g);

      // MATLAB Function: '<S39>/MATLAB Function1'
      sliding_control_MATLABFunction1
        (&sliding_controller_const_B.In1_e.Position[3],
         sliding_controller_const_B.rtb_y_a_g);

      // BusAssignment: '<S6>/Bus Assignment2' incorporates:
      //   Constant: '<S6>/Constant'

      rtb_BusAssignment2_d.Data = sliding_controller_const_P.Constant_Value_i1;

      // Outputs for Atomic SubSystem: '<S6>/Publish1'
      // MATLABSystem: '<S24>/SinkBlock'
      Pub_sliding_controller_const_1405.publish(&rtb_BusAssignment2_d);

      // End of Outputs for SubSystem: '<S6>/Publish1'
    }
  }

  // End of Outputs for SubSystem: '<Root>/Controller'

  // Outputs for Enabled SubSystem: '<Root>/Enabled Subsystem' incorporates:
  //   EnablePort: '<S7>/Enable'

  if (rtmIsMajorTimeStep((&sliding_controller_const_M)) && rtmIsMajorTimeStep
      ((&sliding_controller_const_M))) {
    sliding_controller_const_DW.EnabledSubsystem_MODE =
      sliding_controller_const_B.LogicalOperator;
  }

  if (sliding_controller_const_DW.EnabledSubsystem_MODE) {
    // BusAssignment: '<S7>/Bus Assignment1' incorporates:
    //   SignalConversion generated from: '<S7>/Bus Assignment1'

    sliding_controller_const_B.BusAssignment3 = sliding_controller_const_B.msg_n;
    for (sliding_controller_const_B.i = 0; sliding_controller_const_B.i < 7;
         sliding_controller_const_B.i++) {
      sliding_controller_const_B.BusAssignment3.Effort[sliding_controller_const_B.i]
        = sliding_controller_const_B.exosateration[sliding_controller_const_B.i];
    }

    sliding_controller_const_B.BusAssignment3.Header =
      sliding_controller_const_B.BusAssignment1_m;

    // End of BusAssignment: '<S7>/Bus Assignment1'

    // Outputs for Atomic SubSystem: '<S7>/Publish1'
    // MATLABSystem: '<S52>/SinkBlock'
    Pub_sliding_controller_const_1242.publish
      (&sliding_controller_const_B.BusAssignment3);

    // End of Outputs for SubSystem: '<S7>/Publish1'

    // BusAssignment: '<S7>/Bus Assignment2' incorporates:
    //   SignalConversion generated from: '<S7>/Bus Assignment2'

    sliding_controller_const_B.BusAssignment3 = sliding_controller_const_B.msg;
    for (sliding_controller_const_B.i = 0; sliding_controller_const_B.i < 7;
         sliding_controller_const_B.i++) {
      sliding_controller_const_B.BusAssignment3.Effort[sliding_controller_const_B.i]
        =
        sliding_controller_const_B.humansateration[sliding_controller_const_B.i];
    }

    sliding_controller_const_B.BusAssignment3.Header =
      sliding_controller_const_B.BusAssignment1_m;

    // End of BusAssignment: '<S7>/Bus Assignment2'

    // Outputs for Atomic SubSystem: '<S7>/Publish2'
    // MATLABSystem: '<S53>/SinkBlock'
    Pub_sliding_controller_const_1246.publish
      (&sliding_controller_const_B.BusAssignment3);

    // End of Outputs for SubSystem: '<S7>/Publish2'
  }

  // End of Outputs for SubSystem: '<Root>/Enabled Subsystem'
  if (rtmIsMajorTimeStep((&sliding_controller_const_M))) {
    // Outputs for Atomic SubSystem: '<Root>/Subscribe'
    // MATLABSystem: '<S12>/SourceBlock'
    // stepImpl Regulates simulation update
    Sub_sliding_controller_const_35.getLatestMessage
      (&sliding_controller_const_B.b_varargout_2_c);

    // End of Outputs for SubSystem: '<Root>/Subscribe'

    // If: '<S16>/If'
    if (rtmIsMajorTimeStep((&sliding_controller_const_M))) {
      rtAction = 1;
      sliding_controller_const_DW.If_ActiveSubsystem = 1;
    } else {
      rtAction = sliding_controller_const_DW.If_ActiveSubsystem;
    }

    if (rtAction == 0) {
      // Outputs for IfAction SubSystem: '<S16>/If Action Subsystem' incorporates:
      //   ActionPort: '<S58>/Action Port'

      // BusAssignment: '<S58>/Bus Assignment' incorporates:
      //   Constant: '<S16>/Constant'

      rtb_BusAssignment_b3.Data = sliding_controller_const_P.Constant_Value_op;

      // Outputs for Atomic SubSystem: '<S58>/Call Service'
      // MATLABSystem: '<S60>/ServiceCaller'
      isCreated = ServCall_sliding_controller_const_47.getIsCreated();
      if (!isCreated) {
        for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 21;
             sliding_controller_const_B.j++) {
          sliding_controller_const_B.b_zeroDelimServiceName_n[sliding_controller_const_B.j]
            = tmp[sliding_controller_const_B.j];
        }

        sliding_controller_const_B.b_zeroDelimServiceName_n[21] = '\x00';
        b_varargout_2 = ServCall_sliding_controller_const_47.createServiceCaller
          (&sliding_controller_const_B.b_zeroDelimServiceName_n[0], true, 5.0);
        if (b_varargout_2 != SLSuccess) {
        } else {
          ServCall_sliding_controller_const_47.call(&rtb_BusAssignment_b3,
            &sliding_controller_const_B.b_varargout_1);
        }
      } else {
        ServCall_sliding_controller_const_47.call(&rtb_BusAssignment_b3,
          &sliding_controller_const_B.b_varargout_1);
      }

      // End of MATLABSystem: '<S60>/ServiceCaller'
      // End of Outputs for SubSystem: '<S58>/Call Service'

      // BusAssignment: '<S58>/Bus Assignment1' incorporates:
      //   Constant: '<S16>/Constant'

      rtb_BusAssignment1_k2.Data = sliding_controller_const_P.Constant_Value_op;

      // Outputs for Atomic SubSystem: '<S58>/Call Service1'
      // MATLABSystem: '<S61>/ServiceCaller'
      isCreated = ServCall_sliding_controller_const_48.getIsCreated();
      if (!isCreated) {
        for (sliding_controller_const_B.j = 0; sliding_controller_const_B.j < 23;
             sliding_controller_const_B.j++) {
          sliding_controller_const_B.b_zeroDelimServiceName[sliding_controller_const_B.j]
            = tmp_0[sliding_controller_const_B.j];
        }

        sliding_controller_const_B.b_zeroDelimServiceName[23] = '\x00';
        b_varargout_2 = ServCall_sliding_controller_const_48.createServiceCaller
          (&sliding_controller_const_B.b_zeroDelimServiceName[0], true, 5.0);
        if (b_varargout_2 != SLSuccess) {
        } else {
          ServCall_sliding_controller_const_48.call(&rtb_BusAssignment1_k2,
            &sliding_controller_const_B.b_varargout_1);
        }
      } else {
        ServCall_sliding_controller_const_48.call(&rtb_BusAssignment1_k2,
          &sliding_controller_const_B.b_varargout_1);
      }

      // End of MATLABSystem: '<S61>/ServiceCaller'
      // End of Outputs for SubSystem: '<S58>/Call Service1'
      // End of Outputs for SubSystem: '<S16>/If Action Subsystem'
    }

    // End of If: '<S16>/If'
  }

  if (rtmIsMajorTimeStep((&sliding_controller_const_M))) {
    rt_ertODEUpdateContinuousStates(&(&sliding_controller_const_M)->solverInfo);

    // Update absolute time for base rate
    // The "clockTick0" counts the number of times the code of this task has
    //  been executed. The absolute time is the multiplication of "clockTick0"
    //  and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
    //  overflow during the application lifespan selected.

    ++(&sliding_controller_const_M)->Timing.clockTick0;
    (&sliding_controller_const_M)->Timing.t[0] = rtsiGetSolverStopTime
      (&(&sliding_controller_const_M)->solverInfo);

    {
      // Update absolute timer for sample time: [0.001s, 0.0s]
      // The "clockTick1" counts the number of times the code of this task has
      //  been executed. The resolution of this integer timer is 0.001, which is the step size
      //  of the task. Size of "clockTick1" ensures timer will not overflow during the
      //  application lifespan selected.

      (&sliding_controller_const_M)->Timing.clockTick1++;
    }
  }                                    // end MajorTimeStep
}

// Derivatives for root system: '<Root>'
void sliding_controller_constModelClass::sliding_controller_const_derivatives()
{
  sliding_controller_constModelClass::XDot_sliding_controller_const_T *_rtXdot;
  int32_T i;
  _rtXdot = ((XDot_sliding_controller_const_T *) (&sliding_controller_const_M)
             ->derivs);

  // Derivatives for Enabled SubSystem: '<Root>/Controller'
  if (sliding_controller_const_DW.Controller_MODE) {
    for (i = 0; i < 7; i++) {
      // Derivatives for Integrator: '<S26>/Integrator1'
      _rtXdot->Integrator1_CSTATE[i] = sliding_controller_const_B.qd_add[i];

      // Derivatives for Integrator: '<S26>/Integrator'
      _rtXdot->Integrator_CSTATE[i] = sliding_controller_const_B.qd_add_n[i];
    }
  } else {
    {
      real_T *dx;
      int_T i;
      dx = &(((XDot_sliding_controller_const_T *) (&sliding_controller_const_M
              )->derivs)->Integrator1_CSTATE[0]);
      for (i=0; i < 14; i++) {
        dx[i] = 0.0;
      }
    }
  }

  // End of Derivatives for SubSystem: '<Root>/Controller'
}

// Model initialize function
void sliding_controller_constModelClass::initialize()
{
  // Registration code

  // initialize non-finites
  rt_InitInfAndNaN(sizeof(real_T));

  {
    // Setup solver object
    rtsiSetSimTimeStepPtr(&(&sliding_controller_const_M)->solverInfo,
                          &(&sliding_controller_const_M)->Timing.simTimeStep);
    rtsiSetTPtr(&(&sliding_controller_const_M)->solverInfo, &rtmGetTPtr
                ((&sliding_controller_const_M)));
    rtsiSetStepSizePtr(&(&sliding_controller_const_M)->solverInfo,
                       &(&sliding_controller_const_M)->Timing.stepSize0);
    rtsiSetdXPtr(&(&sliding_controller_const_M)->solverInfo,
                 &(&sliding_controller_const_M)->derivs);
    rtsiSetContStatesPtr(&(&sliding_controller_const_M)->solverInfo, (real_T **)
                         &(&sliding_controller_const_M)->contStates);
    rtsiSetNumContStatesPtr(&(&sliding_controller_const_M)->solverInfo,
      &(&sliding_controller_const_M)->Sizes.numContStates);
    rtsiSetNumPeriodicContStatesPtr(&(&sliding_controller_const_M)->solverInfo,
      &(&sliding_controller_const_M)->Sizes.numPeriodicContStates);
    rtsiSetPeriodicContStateIndicesPtr(&(&sliding_controller_const_M)
      ->solverInfo, &(&sliding_controller_const_M)->periodicContStateIndices);
    rtsiSetPeriodicContStateRangesPtr(&(&sliding_controller_const_M)->solverInfo,
      &(&sliding_controller_const_M)->periodicContStateRanges);
    rtsiSetErrorStatusPtr(&(&sliding_controller_const_M)->solverInfo,
                          (&rtmGetErrorStatus((&sliding_controller_const_M))));
    rtsiSetRTModelPtr(&(&sliding_controller_const_M)->solverInfo,
                      (&sliding_controller_const_M));
  }

  rtsiSetSimTimeStep(&(&sliding_controller_const_M)->solverInfo, MAJOR_TIME_STEP);
  (&sliding_controller_const_M)->intgData.y = (&sliding_controller_const_M)
    ->odeY;
  (&sliding_controller_const_M)->intgData.f[0] = (&sliding_controller_const_M)
    ->odeF[0];
  (&sliding_controller_const_M)->intgData.f[1] = (&sliding_controller_const_M)
    ->odeF[1];
  (&sliding_controller_const_M)->intgData.f[2] = (&sliding_controller_const_M)
    ->odeF[2];
  (&sliding_controller_const_M)->contStates = ((X_sliding_controller_const_T *)
    &sliding_controller_const_X);
  rtsiSetSolverData(&(&sliding_controller_const_M)->solverInfo, static_cast<void
                    *>(&(&sliding_controller_const_M)->intgData));
  rtsiSetSolverName(&(&sliding_controller_const_M)->solverInfo,"ode3");
  rtmSetTPtr((&sliding_controller_const_M), &(&sliding_controller_const_M)
             ->Timing.tArray[0]);
  (&sliding_controller_const_M)->Timing.stepSize0 = 0.001;

  {
    int32_T i;
    char_T b_zeroDelimTopic_0[16];
    char_T b_zeroDelimTopic_2[12];
    char_T b_zeroDelimTopic_1[11];
    char_T b_zeroDelimTopic[10];
    static const char_T tmp[9] = { '/', 's', 'i', 'n', '_', 'w', 'a', 'v', 'e' };

    static const char_T tmp_0[15] = { '/', 'e', 'x', 'o', '_', 'j', 'o', 'i',
      'n', 't', 's', 't', 'a', 't', 'e' };

    static const char_T tmp_1[17] = { '/', 'h', 'u', 'm', 'a', 'n', '_', 'j',
      'o', 'i', 'n', 't', 's', 't', 'a', 't', 'e' };

    static const char_T tmp_2[10] = { '/', 's', 't', 'a', 'r', 't', '_', 's',
      'i', 'm' };

    static const char_T tmp_3[11] = { 'a', 'd', 'd', 'm', 'i', 't', 't', 'a',
      'n', 'c', 'e' };

    static const char_T tmp_4[9] = { '/', 'm', 'y', '_', 't', 'o', 'p', 'i', 'c'
    };

    static const char_T tmp_5[20] = { '/', 'e', 'x', 'o', '_', 's', 'i', 'm',
      'u', 'l', 'i', 'n', 'k', '_', 't', 'o', 'r', 'q', 'u', 'e' };

    static const char_T tmp_6[22] = { '/', 'h', 'u', 'm', 'a', 'n', '_', 's',
      'i', 'm', 'u', 'l', 'i', 'n', 'k', '_', 't', 'o', 'r', 'q', 'u', 'e' };

    static const char_T tmp_7[23] = { '/', 'e', 'x', 'o', 's', 'i', 'm', 'u',
      'l', 'i', 'n', 'k', '_', 's', 'e', 't', '_', 'p', 'o', 'i', 'n', 't', 's'
    };

    // Start for If: '<S16>/If'
    sliding_controller_const_DW.If_ActiveSubsystem = -1;

    // SystemInitialize for Atomic SubSystem: '<Root>/Publish'
    // Start for MATLABSystem: '<S11>/SinkBlock'
    sliding_controller_const_DW.obj_m.matlabCodegenIsDeleted = false;
    sliding_controller_const_DW.obj_m.isInitialized = 1;
    for (i = 0; i < 9; i++) {
      b_zeroDelimTopic[i] = tmp[i];
    }

    b_zeroDelimTopic[9] = '\x00';
    Pub_sliding_controller_const_1177.createPublisher(&b_zeroDelimTopic[0], 1);
    sliding_controller_const_DW.obj_m.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S11>/SinkBlock'
    // End of SystemInitialize for SubSystem: '<Root>/Publish'

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe1'
    // SystemInitialize for Enabled SubSystem: '<S13>/Enabled Subsystem'
    // SystemInitialize for Outport: '<S55>/Out1' incorporates:
    //   Inport: '<S55>/In1'

    sliding_controller_const_B.In1_n = sliding_controller_const_P.Out1_Y0;

    // End of SystemInitialize for SubSystem: '<S13>/Enabled Subsystem'

    // Start for MATLABSystem: '<S13>/SourceBlock'
    sliding_controller_const_DW.obj_cg.matlabCodegenIsDeleted = false;
    sliding_controller_const_DW.obj_cg.isInitialized = 1;
    for (i = 0; i < 15; i++) {
      b_zeroDelimTopic_0[i] = tmp_0[i];
    }

    b_zeroDelimTopic_0[15] = '\x00';
    Sub_sliding_controller_const_1262.createSubscriber(&b_zeroDelimTopic_0[0], 1);
    sliding_controller_const_DW.obj_cg.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S13>/SourceBlock'
    // End of SystemInitialize for SubSystem: '<Root>/Subscribe1'

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe2'
    // SystemInitialize for Enabled SubSystem: '<S14>/Enabled Subsystem'
    // SystemInitialize for Outport: '<S56>/Out1' incorporates:
    //   Inport: '<S56>/In1'

    sliding_controller_const_B.In1 = sliding_controller_const_P.Out1_Y0_f;

    // End of SystemInitialize for SubSystem: '<S14>/Enabled Subsystem'

    // Start for MATLABSystem: '<S14>/SourceBlock'
    sliding_controller_const_DW.obj_h.matlabCodegenIsDeleted = false;
    sliding_controller_const_DW.obj_h.isInitialized = 1;
    for (i = 0; i < 17; i++) {
      sliding_controller_const_B.b_zeroDelimTopic_l[i] = tmp_1[i];
    }

    sliding_controller_const_B.b_zeroDelimTopic_l[17] = '\x00';
    Sub_sliding_controller_const_1277.createSubscriber
      (&sliding_controller_const_B.b_zeroDelimTopic_l[0], 1);
    sliding_controller_const_DW.obj_h.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S14>/SourceBlock'
    // End of SystemInitialize for SubSystem: '<Root>/Subscribe2'

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe4'
    // SystemInitialize for Enabled SubSystem: '<S15>/Enabled Subsystem'
    // SystemInitialize for Outport: '<S57>/Out1' incorporates:
    //   Inport: '<S57>/In1'

    sliding_controller_const_B.In1_k = sliding_controller_const_P.Out1_Y0_d;

    // End of SystemInitialize for SubSystem: '<S15>/Enabled Subsystem'

    // Start for MATLABSystem: '<S15>/SourceBlock'
    sliding_controller_const_DW.obj_c.matlabCodegenIsDeleted = false;
    sliding_controller_const_DW.obj_c.isInitialized = 1;
    for (i = 0; i < 10; i++) {
      b_zeroDelimTopic_1[i] = tmp_2[i];
    }

    b_zeroDelimTopic_1[10] = '\x00';
    Sub_sliding_controller_const_1418.createSubscriber(&b_zeroDelimTopic_1[0], 1);
    sliding_controller_const_DW.obj_c.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S15>/SourceBlock'
    // End of SystemInitialize for SubSystem: '<Root>/Subscribe4'

    // SystemInitialize for Enabled SubSystem: '<Root>/Enabled Subsystem1'
    // SystemInitialize for Outport: '<S8>/exo' incorporates:
    //   Inport: '<S8>/In1'

    sliding_controller_const_B.In1_j = sliding_controller_const_P.exo_Y0;

    // End of SystemInitialize for SubSystem: '<Root>/Enabled Subsystem1'

    // SystemInitialize for Enabled SubSystem: '<Root>/Enabled Subsystem2'
    // SystemInitialize for Outport: '<S9>/human' incorporates:
    //   Inport: '<S9>/In1'

    sliding_controller_const_B.In1_e = sliding_controller_const_P.human_Y0;

    // End of SystemInitialize for SubSystem: '<Root>/Enabled Subsystem2'

    // SystemInitialize for Enabled SubSystem: '<Root>/Controller'
    for (i = 0; i < 7; i++) {
      // InitializeConditions for Integrator: '<S26>/Integrator1'
      sliding_controller_const_X.Integrator1_CSTATE[i] =
        sliding_controller_const_P.Integrator1_IC[i];

      // InitializeConditions for Integrator: '<S26>/Integrator'
      sliding_controller_const_X.Integrator_CSTATE[i] =
        sliding_controller_const_P.Integrator_IC;
    }

    // SystemInitialize for Atomic SubSystem: '<S29>/Call Service'
    // Start for MATLABSystem: '<S51>/ServiceCaller'
    sliding_controller_const_DW.obj_ox.matlabCodegenIsDeleted = false;
    sliding_controller_const_DW.obj_ox.isInitialized = 1;
    sliding_controller_const_DW.obj_ox.isSetupComplete = true;

    // End of SystemInitialize for SubSystem: '<S29>/Call Service'

    // SystemInitialize for Atomic SubSystem: '<S6>/Publish2'
    // Start for MATLABSystem: '<S25>/SinkBlock'
    sliding_controller_const_DW.obj_j.matlabCodegenIsDeleted = false;
    sliding_controller_const_DW.obj_j.isInitialized = 1;
    for (i = 0; i < 11; i++) {
      b_zeroDelimTopic_2[i] = tmp_3[i];
    }

    b_zeroDelimTopic_2[11] = '\x00';
    Pub_sliding_controller_const_1454.createPublisher(&b_zeroDelimTopic_2[0], 1);
    sliding_controller_const_DW.obj_j.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S25>/SinkBlock'
    // End of SystemInitialize for SubSystem: '<S6>/Publish2'

    // SystemInitialize for Atomic SubSystem: '<S6>/Publish1'
    // Start for MATLABSystem: '<S24>/SinkBlock'
    sliding_controller_const_DW.obj_o.matlabCodegenIsDeleted = false;
    sliding_controller_const_DW.obj_o.isInitialized = 1;
    for (i = 0; i < 9; i++) {
      b_zeroDelimTopic[i] = tmp_4[i];
    }

    b_zeroDelimTopic[9] = '\x00';
    Pub_sliding_controller_const_1405.createPublisher(&b_zeroDelimTopic[0], 1);
    sliding_controller_const_DW.obj_o.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S24>/SinkBlock'
    // End of SystemInitialize for SubSystem: '<S6>/Publish1'
    for (i = 0; i < 7; i++) {
      // SystemInitialize for Saturate: '<S6>/exo sateration' incorporates:
      //   Outport: '<S6>/exo tau'

      sliding_controller_const_B.exosateration[i] =
        sliding_controller_const_P.exotau_Y0;

      // SystemInitialize for Saturate: '<S6>/human sateration' incorporates:
      //   Outport: '<S6>/human tau'

      sliding_controller_const_B.humansateration[i] =
        sliding_controller_const_P.humantau_Y0;
    }

    // End of SystemInitialize for SubSystem: '<Root>/Controller'

    // SystemInitialize for Enabled SubSystem: '<Root>/Enabled Subsystem'
    // SystemInitialize for Atomic SubSystem: '<S7>/Publish1'
    // Start for MATLABSystem: '<S52>/SinkBlock'
    sliding_controller_const_DW.obj_n.matlabCodegenIsDeleted = false;
    sliding_controller_const_DW.obj_n.isInitialized = 1;
    for (i = 0; i < 20; i++) {
      sliding_controller_const_B.b_zeroDelimTopic_p[i] = tmp_5[i];
    }

    sliding_controller_const_B.b_zeroDelimTopic_p[20] = '\x00';
    Pub_sliding_controller_const_1242.createPublisher
      (&sliding_controller_const_B.b_zeroDelimTopic_p[0], 1);
    sliding_controller_const_DW.obj_n.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S52>/SinkBlock'
    // End of SystemInitialize for SubSystem: '<S7>/Publish1'

    // SystemInitialize for Atomic SubSystem: '<S7>/Publish2'
    // Start for MATLABSystem: '<S53>/SinkBlock'
    sliding_controller_const_DW.obj_mp.matlabCodegenIsDeleted = false;
    sliding_controller_const_DW.obj_mp.isInitialized = 1;
    for (i = 0; i < 22; i++) {
      sliding_controller_const_B.b_zeroDelimTopic_m[i] = tmp_6[i];
    }

    sliding_controller_const_B.b_zeroDelimTopic_m[22] = '\x00';
    Pub_sliding_controller_const_1246.createPublisher
      (&sliding_controller_const_B.b_zeroDelimTopic_m[0], 1);
    sliding_controller_const_DW.obj_mp.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S53>/SinkBlock'
    // End of SystemInitialize for SubSystem: '<S7>/Publish2'
    // End of SystemInitialize for SubSystem: '<Root>/Enabled Subsystem'

    // SystemInitialize for Atomic SubSystem: '<Root>/Subscribe'
    // Start for MATLABSystem: '<S12>/SourceBlock'
    sliding_controller_const_DW.obj_g.matlabCodegenIsDeleted = false;
    sliding_controller_const_DW.obj_g.isInitialized = 1;
    for (i = 0; i < 23; i++) {
      sliding_controller_const_B.b_zeroDelimTopic[i] = tmp_7[i];
    }

    sliding_controller_const_B.b_zeroDelimTopic[23] = '\x00';
    Sub_sliding_controller_const_35.createSubscriber
      (&sliding_controller_const_B.b_zeroDelimTopic[0], 1);
    sliding_controller_const_DW.obj_g.isSetupComplete = true;

    // End of Start for MATLABSystem: '<S12>/SourceBlock'
    // End of SystemInitialize for SubSystem: '<Root>/Subscribe'

    // SystemInitialize for IfAction SubSystem: '<S16>/If Action Subsystem'
    // SystemInitialize for Atomic SubSystem: '<S58>/Call Service'
    // Start for MATLABSystem: '<S60>/ServiceCaller'
    sliding_controller_const_DW.obj_b.matlabCodegenIsDeleted = false;
    sliding_controller_const_DW.obj_b.isInitialized = 1;
    sliding_controller_const_DW.obj_b.isSetupComplete = true;

    // End of SystemInitialize for SubSystem: '<S58>/Call Service'

    // SystemInitialize for Atomic SubSystem: '<S58>/Call Service1'
    // Start for MATLABSystem: '<S61>/ServiceCaller'
    sliding_controller_const_DW.obj_i.matlabCodegenIsDeleted = false;
    sliding_controller_const_DW.obj_i.isInitialized = 1;
    sliding_controller_const_DW.obj_i.isSetupComplete = true;

    // End of SystemInitialize for SubSystem: '<S58>/Call Service1'
    // End of SystemInitialize for SubSystem: '<S16>/If Action Subsystem'

    // Start for MATLABSystem: '<Root>/Current Time'
    sliding_controller_const_DW.obj.matlabCodegenIsDeleted = false;
    sliding_controller_const_DW.obj.isInitialized = 1;
    sliding_controller_const_DW.obj.isSetupComplete = true;

    // set.SampleTime setter for SampleTime
    // setupImpl Implement tasks that need to be performed only once,
    //  such as pre-computed constants.
    // resetImpl Initialize discrete-state properties.
  }
}

// Model terminate function
void sliding_controller_constModelClass::terminate()
{
  // Terminate for Atomic SubSystem: '<Root>/Publish'
  // Terminate for MATLABSystem: '<S11>/SinkBlock'
  if (!sliding_controller_const_DW.obj_m.matlabCodegenIsDeleted) {
    sliding_controller_const_DW.obj_m.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S11>/SinkBlock'
  // End of Terminate for SubSystem: '<Root>/Publish'

  // Terminate for Atomic SubSystem: '<Root>/Subscribe1'
  // Terminate for MATLABSystem: '<S13>/SourceBlock'
  if (!sliding_controller_const_DW.obj_cg.matlabCodegenIsDeleted) {
    sliding_controller_const_DW.obj_cg.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S13>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe1'

  // Terminate for Atomic SubSystem: '<Root>/Subscribe2'
  // Terminate for MATLABSystem: '<S14>/SourceBlock'
  if (!sliding_controller_const_DW.obj_h.matlabCodegenIsDeleted) {
    sliding_controller_const_DW.obj_h.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S14>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe2'

  // Terminate for Atomic SubSystem: '<Root>/Subscribe4'
  // Terminate for MATLABSystem: '<S15>/SourceBlock'
  if (!sliding_controller_const_DW.obj_c.matlabCodegenIsDeleted) {
    sliding_controller_const_DW.obj_c.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S15>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe4'

  // Terminate for MATLABSystem: '<Root>/Current Time'
  if (!sliding_controller_const_DW.obj.matlabCodegenIsDeleted) {
    sliding_controller_const_DW.obj.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<Root>/Current Time'

  // Terminate for Enabled SubSystem: '<Root>/Controller'
  // Terminate for Atomic SubSystem: '<S29>/Call Service'
  // Terminate for MATLABSystem: '<S51>/ServiceCaller'
  if (!sliding_controller_const_DW.obj_ox.matlabCodegenIsDeleted) {
    sliding_controller_const_DW.obj_ox.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S51>/ServiceCaller'
  // End of Terminate for SubSystem: '<S29>/Call Service'

  // Terminate for Atomic SubSystem: '<S6>/Publish2'
  // Terminate for MATLABSystem: '<S25>/SinkBlock'
  if (!sliding_controller_const_DW.obj_j.matlabCodegenIsDeleted) {
    sliding_controller_const_DW.obj_j.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S25>/SinkBlock'
  // End of Terminate for SubSystem: '<S6>/Publish2'

  // Terminate for Atomic SubSystem: '<S6>/Publish1'
  // Terminate for MATLABSystem: '<S24>/SinkBlock'
  if (!sliding_controller_const_DW.obj_o.matlabCodegenIsDeleted) {
    sliding_controller_const_DW.obj_o.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S24>/SinkBlock'
  // End of Terminate for SubSystem: '<S6>/Publish1'
  // End of Terminate for SubSystem: '<Root>/Controller'

  // Terminate for Enabled SubSystem: '<Root>/Enabled Subsystem'
  // Terminate for Atomic SubSystem: '<S7>/Publish1'
  // Terminate for MATLABSystem: '<S52>/SinkBlock'
  if (!sliding_controller_const_DW.obj_n.matlabCodegenIsDeleted) {
    sliding_controller_const_DW.obj_n.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S52>/SinkBlock'
  // End of Terminate for SubSystem: '<S7>/Publish1'

  // Terminate for Atomic SubSystem: '<S7>/Publish2'
  // Terminate for MATLABSystem: '<S53>/SinkBlock'
  if (!sliding_controller_const_DW.obj_mp.matlabCodegenIsDeleted) {
    sliding_controller_const_DW.obj_mp.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S53>/SinkBlock'
  // End of Terminate for SubSystem: '<S7>/Publish2'
  // End of Terminate for SubSystem: '<Root>/Enabled Subsystem'

  // Terminate for Atomic SubSystem: '<Root>/Subscribe'
  // Terminate for MATLABSystem: '<S12>/SourceBlock'
  if (!sliding_controller_const_DW.obj_g.matlabCodegenIsDeleted) {
    sliding_controller_const_DW.obj_g.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S12>/SourceBlock'
  // End of Terminate for SubSystem: '<Root>/Subscribe'

  // Terminate for IfAction SubSystem: '<S16>/If Action Subsystem'
  // Terminate for Atomic SubSystem: '<S58>/Call Service'
  // Terminate for MATLABSystem: '<S60>/ServiceCaller'
  if (!sliding_controller_const_DW.obj_b.matlabCodegenIsDeleted) {
    sliding_controller_const_DW.obj_b.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S60>/ServiceCaller'
  // End of Terminate for SubSystem: '<S58>/Call Service'

  // Terminate for Atomic SubSystem: '<S58>/Call Service1'
  // Terminate for MATLABSystem: '<S61>/ServiceCaller'
  if (!sliding_controller_const_DW.obj_i.matlabCodegenIsDeleted) {
    sliding_controller_const_DW.obj_i.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<S61>/ServiceCaller'
  // End of Terminate for SubSystem: '<S58>/Call Service1'
  // End of Terminate for SubSystem: '<S16>/If Action Subsystem'
}

// Constructor
sliding_controller_constModelClass::sliding_controller_constModelClass() :
  sliding_controller_const_B(),
  sliding_controller_const_DW(),
  sliding_controller_const_X(),
  sliding_controller_const_M()
{
  // Currently there is no constructor body generated.
}

// Destructor
sliding_controller_constModelClass::~sliding_controller_constModelClass()
{
  // Currently there is no destructor body generated.
}

// Real-Time Model get method
sliding_controller_constModelClass::RT_MODEL_sliding_controller_c_T
  * sliding_controller_constModelClass::getRTM()
{
  return (&sliding_controller_const_M);
}

//
// File trailer for generated code.
//
// [EOF]
//
