/*
 * sliding_controller2_private.h
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "sliding_controller2".
 *
 * Model version              : 1.160
 * Simulink Coder version : 9.5 (R2021a) 14-Nov-2020
 * C++ source code generated on : Sat May 29 21:39:34 2021
 *
 * Target selection: ert.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Generic->Unspecified (assume 32-bit Generic)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_sliding_controller2_private_h_
#define RTW_HEADER_sliding_controller2_private_h_
#include "rtwtypes.h"
#include "multiword_types.h"
#include "sliding_controller2.h"

/* Private macros used by the generated code to access rtModel */
#ifndef rtmIsMajorTimeStep
#define rtmIsMajorTimeStep(rtm)        (((rtm)->Timing.simTimeStep) == MAJOR_TIME_STEP)
#endif

#ifndef rtmIsMinorTimeStep
#define rtmIsMinorTimeStep(rtm)        (((rtm)->Timing.simTimeStep) == MINOR_TIME_STEP)
#endif

#ifndef rtmSetTFinal
#define rtmSetTFinal(rtm, val)         ((rtm)->Timing.tFinal = (val))
#endif

#ifndef rtmSetTPtr
#define rtmSetTPtr(rtm, val)           ((rtm)->Timing.t = (val))
#endif

extern real_T rt_hypotd_snf(real_T u0, real_T u1);
extern void sliding_controller2_exoleft(const real_T rtu_q[2], const real_T
  rtu_qd[2], B_exoleft_sliding_controller2_T *localB);
extern void sliding_controll_MATLABFunction(const real_T rtu_q[2],
  B_MATLABFunction_sliding_cont_T *localB);
extern void sliding_control_MATLABFunction1(const real_T rtu_q[2],
  B_MATLABFunction1_sliding_con_T *localB);
extern void sliding_c_EnabledSubsystem_Init(B_EnabledSubsystem_sliding_co_T
  *localB, P_EnabledSubsystem_sliding_co_T *localP);
extern void sliding_contro_EnabledSubsystem(boolean_T rtu_Enable, const
  SL_Bus_sliding_controller2_sensor_msgs_JointState *rtu_In1,
  B_EnabledSubsystem_sliding_co_T *localB, DW_EnabledSubsystem_sliding_c_T
  *localDW);

/* private model entry point functions */
extern void sliding_controller2_derivatives(void);

#endif                           /* RTW_HEADER_sliding_controller2_private_h_ */
