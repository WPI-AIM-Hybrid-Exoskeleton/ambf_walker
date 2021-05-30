/*
 * sliding_controller2.h
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

#ifndef RTW_HEADER_sliding_controller2_h_
#define RTW_HEADER_sliding_controller2_h_
#include <math.h>
#include <string.h>
#include <float.h>
#include <stddef.h>
#include "rtwtypes.h"
#include "rtw_extmode.h"
#include "sysran_types.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "dt_info.h"
#include "ext_work.h"
#include "slros_initialize.h"
#include "sliding_controller2_types.h"

/* Shared type includes */
#include "multiword_types.h"
#include "rtGetNaN.h"
#include "rt_nonfinite.h"
#include "rtGetInf.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetContStateDisabled
#define rtmGetContStateDisabled(rtm)   ((rtm)->contStateDisabled)
#endif

#ifndef rtmSetContStateDisabled
#define rtmSetContStateDisabled(rtm, val) ((rtm)->contStateDisabled = (val))
#endif

#ifndef rtmGetContStates
#define rtmGetContStates(rtm)          ((rtm)->contStates)
#endif

#ifndef rtmSetContStates
#define rtmSetContStates(rtm, val)     ((rtm)->contStates = (val))
#endif

#ifndef rtmGetContTimeOutputInconsistentWithStateAtMajorStepFlag
#define rtmGetContTimeOutputInconsistentWithStateAtMajorStepFlag(rtm) ((rtm)->CTOutputIncnstWithState)
#endif

#ifndef rtmSetContTimeOutputInconsistentWithStateAtMajorStepFlag
#define rtmSetContTimeOutputInconsistentWithStateAtMajorStepFlag(rtm, val) ((rtm)->CTOutputIncnstWithState = (val))
#endif

#ifndef rtmGetDerivCacheNeedsReset
#define rtmGetDerivCacheNeedsReset(rtm) ((rtm)->derivCacheNeedsReset)
#endif

#ifndef rtmSetDerivCacheNeedsReset
#define rtmSetDerivCacheNeedsReset(rtm, val) ((rtm)->derivCacheNeedsReset = (val))
#endif

#ifndef rtmGetFinalTime
#define rtmGetFinalTime(rtm)           ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetIntgData
#define rtmGetIntgData(rtm)            ((rtm)->intgData)
#endif

#ifndef rtmSetIntgData
#define rtmSetIntgData(rtm, val)       ((rtm)->intgData = (val))
#endif

#ifndef rtmGetOdeF
#define rtmGetOdeF(rtm)                ((rtm)->odeF)
#endif

#ifndef rtmSetOdeF
#define rtmSetOdeF(rtm, val)           ((rtm)->odeF = (val))
#endif

#ifndef rtmGetOdeY
#define rtmGetOdeY(rtm)                ((rtm)->odeY)
#endif

#ifndef rtmSetOdeY
#define rtmSetOdeY(rtm, val)           ((rtm)->odeY = (val))
#endif

#ifndef rtmGetPeriodicContStateIndices
#define rtmGetPeriodicContStateIndices(rtm) ((rtm)->periodicContStateIndices)
#endif

#ifndef rtmSetPeriodicContStateIndices
#define rtmSetPeriodicContStateIndices(rtm, val) ((rtm)->periodicContStateIndices = (val))
#endif

#ifndef rtmGetPeriodicContStateRanges
#define rtmGetPeriodicContStateRanges(rtm) ((rtm)->periodicContStateRanges)
#endif

#ifndef rtmSetPeriodicContStateRanges
#define rtmSetPeriodicContStateRanges(rtm, val) ((rtm)->periodicContStateRanges = (val))
#endif

#ifndef rtmGetRTWExtModeInfo
#define rtmGetRTWExtModeInfo(rtm)      ((rtm)->extModeInfo)
#endif

#ifndef rtmGetZCCacheNeedsReset
#define rtmGetZCCacheNeedsReset(rtm)   ((rtm)->zCCacheNeedsReset)
#endif

#ifndef rtmSetZCCacheNeedsReset
#define rtmSetZCCacheNeedsReset(rtm, val) ((rtm)->zCCacheNeedsReset = (val))
#endif

#ifndef rtmGetdX
#define rtmGetdX(rtm)                  ((rtm)->derivs)
#endif

#ifndef rtmSetdX
#define rtmSetdX(rtm, val)             ((rtm)->derivs = (val))
#endif

#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
#define rtmGetStopRequested(rtm)       ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
#define rtmSetStopRequested(rtm, val)  ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
#define rtmGetStopRequestedPtr(rtm)    (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
#define rtmGetT(rtm)                   (rtmGetTPtr((rtm))[0])
#endif

#ifndef rtmGetTFinal
#define rtmGetTFinal(rtm)              ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetTPtr
#define rtmGetTPtr(rtm)                ((rtm)->Timing.t)
#endif

/* Block signals for system '<S16>/exo left' */
struct B_exoleft_sliding_controller2_T {
  real_T knee[2];                      /* '<S16>/exo left' */
  real_T dknee[2];                     /* '<S16>/exo left' */
  real_T ankle[2];                     /* '<S16>/exo left' */
  real_T danke[2];                     /* '<S16>/exo left' */
};

/* Block signals for system '<S30>/MATLAB Function' */
struct B_MATLABFunction_sliding_cont_T {
  real_T y[4];                         /* '<S30>/MATLAB Function' */
};

/* Block signals for system '<S30>/MATLAB Function1' */
struct B_MATLABFunction1_sliding_con_T {
  real_T y[4];                         /* '<S30>/MATLAB Function1' */
};

/* Block signals for system '<S12>/Enabled Subsystem' */
struct B_EnabledSubsystem_sliding_co_T {
  SL_Bus_sliding_controller2_sensor_msgs_JointState In1;/* '<S47>/In1' */
};

/* Block states (default storage) for system '<S12>/Enabled Subsystem' */
struct DW_EnabledSubsystem_sliding_c_T {
  int8_T EnabledSubsystem_SubsysRanBC; /* '<S12>/Enabled Subsystem' */
};

/* Block signals (default storage) */
struct B_sliding_controller2_T {
  SL_Bus_sliding_controller2_sensor_msgs_JointState msg;/* '<Root>/exo msg' */
  SL_Bus_sliding_controller2_sensor_msgs_JointState In1;/* '<S8>/In1' */
  SL_Bus_sliding_controller2_sensor_msgs_JointState In1_j;/* '<S7>/In1' */
  SL_Bus_sliding_controller2_sensor_msgs_JointState BusAssignment1;/* '<S6>/Bus Assignment1' */
  SL_Bus_sliding_controller2_sensor_msgs_JointState msg_m;/* '<Root>/human msg' */
  SL_Bus_sliding_controller2_sensor_msgs_JointState SourceBlock_o2;/* '<S13>/SourceBlock' */
  SL_Bus_sliding_controller2_sensor_msgs_JointState SourceBlock_o2_k;/* '<S12>/SourceBlock' */
  SL_Bus_sliding_controller2_sensor_msgs_JointState b_varargout_2;
  SL_Bus_sliding_controller2_sensor_msgs_JointState b_varargout_2_c;
  SL_Bus_sliding_controller2_ambf_walker_DesiredJoints In1_a;/* '<S46>/In1' */
  SL_Bus_sliding_controller2_ambf_walker_DesiredJoints b_varargout_2_k;
  real_T change[49];
  real_T Y[49];
  SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex msg_o;
                            /* '<Root>/MATLAB Function - String Array Assign' */
  SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex BusAssignment;/* '<S21>/Bus Assignment' */
  SL_Bus_sliding_controller2_RBDLInverseDynamicsRespon_9vsb2h b_varargout_1;
  real_T qd_add[7];                    /* '<S19>/Integrator' */
  real_T qd_add_n[7];                  /* '<S19>/addmittance gain' */
  real_T exosateration[7];             /* '<S5>/exo sateration' */
  real_T humansateration[7];           /* '<S5>/human sateration' */
  real_T K[49];                        /* '<S19>/MATLAB Function' */
  real_T B[49];                        /* '<S19>/MATLAB Function' */
  real_T b_x[7];
  real_T B_c[7];
  real_T A[7];
  real_T Add1_i[7];                    /* '<S21>/Add1' */
  real_T dv[7];
  real_T work[7];
  real_T vn1[7];
  real_T vn2[7];
  int32_T jpvt[7];
  char_T b_zeroDelimTopic[27];
  char_T b_zeroDelimTopic_b[25];
  char_T b_zeroDelimTopic_p[24];
  char_T b_zeroDelimServiceName[17];
  real_T Add[2];                       /* '<S36>/Add' */
  real_T Add_c[2];                     /* '<S37>/Add' */
  real_T Sum[7];                       /* '<S19>/Sum' */
  real_T wj;
  real_T rtb_Subtract2_l_idx_0;
  real_T rtb_Subtract2_l_idx_1;
  real_T rtb_Subtract2_idx_0;
  real_T rtb_Subtract2_idx_1;
  real_T rtb_Add_m_idx_0;
  real_T rtb_Add_m_idx_1;
  real_T rtb_Product2_i_idx_0;
  real_T rtb_Product2_i_idx_1;
  real_T unnamed_idx_1;
  real_T unnamed_idx_1_c;
  real_T smax;
  real_T beta1;
  real_T scale;
  real_T absxk;
  real_T t;
  int32_T rankA;
  int32_T j;
  int32_T k;
  int32_T minmn;
  int32_T ii;
  int32_T nmi;
  int32_T mmi;
  int32_T pvt;
  int32_T ix;
  SL_Bus_sliding_controller2_std_msgs_Float32 BusAssignment_m;/* '<Root>/Bus Assignment' */
  boolean_T SourceBlock_o1;            /* '<S13>/SourceBlock' */
  boolean_T SourceBlock_o1_h;          /* '<S12>/SourceBlock' */
  boolean_T SourceBlock_o1_c;          /* '<S11>/SourceBlock' */
  B_EnabledSubsystem_sliding_co_T EnabledSubsystem_i;/* '<S13>/Enabled Subsystem' */
  B_EnabledSubsystem_sliding_co_T EnabledSubsystem_l;/* '<S12>/Enabled Subsystem' */
  B_MATLABFunction1_sliding_con_T sf_MATLABFunction1_je;/* '<S37>/MATLAB Function1' */
  B_MATLABFunction_sliding_cont_T sf_MATLABFunction_a;/* '<S37>/MATLAB Function' */
  B_MATLABFunction1_sliding_con_T sf_MATLABFunction1_j;/* '<S36>/MATLAB Function1' */
  B_MATLABFunction_sliding_cont_T sf_MATLABFunction_p;/* '<S36>/MATLAB Function' */
  B_MATLABFunction1_sliding_con_T sf_MATLABFunction1_h;/* '<S31>/MATLAB Function1' */
  B_MATLABFunction_sliding_cont_T sf_MATLABFunction_o;/* '<S31>/MATLAB Function' */
  B_MATLABFunction1_sliding_con_T sf_MATLABFunction1;/* '<S30>/MATLAB Function1' */
  B_MATLABFunction_sliding_cont_T sf_MATLABFunction;/* '<S30>/MATLAB Function' */
  B_exoleft_sliding_controller2_T sf_humanright;/* '<S16>/human right' */
  B_exoleft_sliding_controller2_T sf_humanleft;/* '<S16>/human left' */
  B_exoleft_sliding_controller2_T sf_exoright;/* '<S16>/exo right' */
  B_exoleft_sliding_controller2_T sf_exoleft;/* '<S16>/exo left' */
};

/* Block states (default storage) for system '<Root>' */
struct DW_sliding_controller2_T {
  ros_slroscpp_internal_block_S_T obj; /* '<S43>/ServiceCaller' */
  ros_slroscpp_internal_block_P_T obj_m;/* '<S10>/SinkBlock' */
  ros_slroscpp_internal_block_P_T obj_mp;/* '<S45>/SinkBlock' */
  ros_slroscpp_internal_block_P_T obj_n;/* '<S44>/SinkBlock' */
  ros_slroscpp_internal_block_k_T obj_h;/* '<S13>/SourceBlock' */
  ros_slroscpp_internal_block_k_T obj_c;/* '<S12>/SourceBlock' */
  ros_slroscpp_internal_block_k_T obj_g;/* '<S11>/SourceBlock' */
  ExampleHelperSimulationRateCo_T obj_k;/* '<Root>/Simulation Rate Control' */
  int8_T EnabledSubsystem_SubsysRanBC; /* '<S11>/Enabled Subsystem' */
  int8_T EnabledSubsystem2_SubsysRanBC;/* '<Root>/Enabled Subsystem2' */
  int8_T EnabledSubsystem1_SubsysRanBC;/* '<Root>/Enabled Subsystem1' */
  int8_T EnabledSubsystem_SubsysRanBC_c;/* '<Root>/Enabled Subsystem' */
  int8_T Controller_SubsysRanBC;       /* '<Root>/Controller' */
  boolean_T objisempty;                /* '<S13>/SourceBlock' */
  boolean_T objisempty_n;              /* '<S12>/SourceBlock' */
  boolean_T objisempty_o;              /* '<S11>/SourceBlock' */
  boolean_T objisempty_oz;             /* '<Root>/Simulation Rate Control' */
  boolean_T objisempty_h;              /* '<S10>/SinkBlock' */
  boolean_T objisempty_d;              /* '<S45>/SinkBlock' */
  boolean_T objisempty_c;              /* '<S44>/SinkBlock' */
  boolean_T objisempty_a;              /* '<S43>/ServiceCaller' */
  boolean_T EnabledSubsystem_MODE;     /* '<Root>/Enabled Subsystem' */
  boolean_T Controller_MODE;           /* '<Root>/Controller' */
  DW_EnabledSubsystem_sliding_c_T EnabledSubsystem_i;/* '<S13>/Enabled Subsystem' */
  DW_EnabledSubsystem_sliding_c_T EnabledSubsystem_l;/* '<S12>/Enabled Subsystem' */
};

/* Continuous states (default storage) */
struct X_sliding_controller2_T {
  real_T Integrator1_CSTATE[7];        /* '<S19>/Integrator1' */
  real_T Integrator_CSTATE[7];         /* '<S19>/Integrator' */
};

/* State derivatives (default storage) */
struct XDot_sliding_controller2_T {
  real_T Integrator1_CSTATE[7];        /* '<S19>/Integrator1' */
  real_T Integrator_CSTATE[7];         /* '<S19>/Integrator' */
};

/* State disabled  */
struct XDis_sliding_controller2_T {
  boolean_T Integrator1_CSTATE[7];     /* '<S19>/Integrator1' */
  boolean_T Integrator_CSTATE[7];      /* '<S19>/Integrator' */
};

#ifndef ODE3_INTG
#define ODE3_INTG

/* ODE3 Integration Data */
struct ODE3_IntgData {
  real_T *y;                           /* output */
  real_T *f[3];                        /* derivatives */
};

#endif

/* Parameters for system: '<S12>/Enabled Subsystem' */
struct P_EnabledSubsystem_sliding_co_T_ {
  SL_Bus_sliding_controller2_sensor_msgs_JointState Out1_Y0;/* Computed Parameter: Out1_Y0
                                                             * Referenced by: '<S47>/Out1'
                                                             */
};

/* Parameters (default storage) */
struct P_sliding_controller2_T_ {
  real_T Km1[49];                      /* Variable: Km1
                                        * Referenced by: '<S20>/human proportional gain'
                                        */
  real_T dampener[4];                  /* Variable: dampener
                                        * Referenced by:
                                        *   '<S26>/dampener left shank'
                                        *   '<S27>/dampener left thigh'
                                        *   '<S28>/dampener right shank'
                                        *   '<S29>/dampener right shank'
                                        */
  real_T exo_sat;                      /* Variable: exo_sat
                                        * Referenced by: '<S5>/exo sateration'
                                        */
  real_T human_sat;                    /* Variable: human_sat
                                        * Referenced by: '<S5>/human sateration'
                                        */
  real_T invMd[49];                    /* Variable: invMd
                                        * Referenced by: '<S19>/addmittance gain'
                                        */
  real_T lambda2[49];                  /* Variable: lambda2
                                        * Referenced by:
                                        *   '<S21>/Gain12'
                                        *   '<S21>/lambda SMC'
                                        */
  real_T rho2[49];                     /* Variable: rho2
                                        * Referenced by: '<S21>/rho SMC'
                                        */
  real_T spring[4];                    /* Variable: spring
                                        * Referenced by:
                                        *   '<S26>/spring left shank'
                                        *   '<S27>/spring left thigh'
                                        *   '<S28>/spring right thigh'
                                        *   '<S29>/spring right thigh'
                                        */
  SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value;/* Computed Parameter: Constant_Value
                                                                    * Referenced by: '<S2>/Constant'
                                                                    */
  SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value_d;/* Computed Parameter: Constant_Value_d
                                                                      * Referenced by: '<S3>/Constant'
                                                                      */
  SL_Bus_sliding_controller2_sensor_msgs_JointState exo_Y0;/* Computed Parameter: exo_Y0
                                                            * Referenced by: '<S7>/exo'
                                                            */
  SL_Bus_sliding_controller2_sensor_msgs_JointState human_Y0;/* Computed Parameter: human_Y0
                                                              * Referenced by: '<S8>/human'
                                                              */
  SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value_a;/* Computed Parameter: Constant_Value_a
                                                                      * Referenced by: '<S12>/Constant'
                                                                      */
  SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value_j;/* Computed Parameter: Constant_Value_j
                                                                      * Referenced by: '<S13>/Constant'
                                                                      */
  SL_Bus_sliding_controller2_ambf_walker_DesiredJoints Out1_Y0;/* Computed Parameter: Out1_Y0
                                                                * Referenced by: '<S46>/Out1'
                                                                */
  SL_Bus_sliding_controller2_ambf_walker_DesiredJoints Constant_Value_b;/* Computed Parameter: Constant_Value_b
                                                                      * Referenced by: '<S11>/Constant'
                                                                      */
  SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex Constant_Value_e;/* Computed Parameter: Constant_Value_e
                                                                      * Referenced by: '<S4>/Constant'
                                                                      */
  SL_Bus_sliding_controller2_RBDLInverseDynamicsRespon_9vsb2h Constant_Value_bi;/* Computed Parameter: Constant_Value_bi
                                                                      * Referenced by: '<S43>/Constant'
                                                                      */
  SL_Bus_sliding_controller2_std_msgs_Float32 Constant_Value_o;/* Computed Parameter: Constant_Value_o
                                                                * Referenced by: '<S1>/Constant'
                                                                */
  real_T exotau_Y0;                    /* Computed Parameter: exotau_Y0
                                        * Referenced by: '<S5>/exo tau'
                                        */
  real_T humantau_Y0;                  /* Computed Parameter: humantau_Y0
                                        * Referenced by: '<S5>/human tau'
                                        */
  real_T Constant_Value_l;             /* Expression: 0
                                        * Referenced by: '<S18>/Constant'
                                        */
  real_T Constant_Value_ou;            /* Expression: 0
                                        * Referenced by: '<S36>/Constant'
                                        */
  real_T Constant_Value_p;             /* Expression: 0
                                        * Referenced by: '<S37>/Constant'
                                        */
  real_T Integrator1_IC[7];       /* Expression: [-0.349,-0.2,0,-0.349,-0.2,0,0]
                                   * Referenced by: '<S19>/Integrator1'
                                   */
  real_T Integrator_IC;                /* Expression: 0
                                        * Referenced by: '<S19>/Integrator'
                                        */
  real_T surfacewidthSMC_Gain;         /* Expression: 0.5
                                        * Referenced by: '<S21>/surface width SMC'
                                        */
  real_T Constant_Value_c;             /* Expression: 0
                                        * Referenced by: '<S17>/Constant'
                                        */
  real_T Constant_Value_f;             /* Expression: 0
                                        * Referenced by: '<S30>/Constant'
                                        */
  real_T Constant_Value_k;             /* Expression: 0
                                        * Referenced by: '<S31>/Constant'
                                        */
  real_T SineWaveFunction_Amp;         /* Expression: 1
                                        * Referenced by: '<Root>/Sine Wave Function'
                                        */
  real_T SineWaveFunction_Bias;        /* Expression: 0
                                        * Referenced by: '<Root>/Sine Wave Function'
                                        */
  real_T SineWaveFunction_Freq;        /* Expression: 1
                                        * Referenced by: '<Root>/Sine Wave Function'
                                        */
  real_T SineWaveFunction_Phase;       /* Expression: 0
                                        * Referenced by: '<Root>/Sine Wave Function'
                                        */
  P_EnabledSubsystem_sliding_co_T EnabledSubsystem_i;/* '<S13>/Enabled Subsystem' */
  P_EnabledSubsystem_sliding_co_T EnabledSubsystem_l;/* '<S12>/Enabled Subsystem' */
};

/* Real-time Model Data Structure */
struct tag_RTM_sliding_controller2_T {
  const char_T *errorStatus;
  RTWExtModeInfo *extModeInfo;
  RTWSolverInfo solverInfo;
  X_sliding_controller2_T *contStates;
  int_T *periodicContStateIndices;
  real_T *periodicContStateRanges;
  real_T *derivs;
  boolean_T *contStateDisabled;
  boolean_T zCCacheNeedsReset;
  boolean_T derivCacheNeedsReset;
  boolean_T CTOutputIncnstWithState;
  real_T odeY[14];
  real_T odeF[3][14];
  ODE3_IntgData intgData;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    uint32_T checksums[4];
    int_T numContStates;
    int_T numPeriodicContStates;
    int_T numSampTimes;
  } Sizes;

  /*
   * SpecialInfo:
   * The following substructure contains special information
   * related to other components that are dependent on RTW.
   */
  struct {
    const void *mappingInfo;
  } SpecialInfo;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    uint32_T clockTick0;
    uint32_T clockTickH0;
    time_T stepSize0;
    uint32_T clockTick1;
    uint32_T clockTickH1;
    time_T tFinal;
    SimTimeStep simTimeStep;
    boolean_T stopRequestedFlag;
    time_T *t;
    time_T tArray[2];
  } Timing;
};

/* Block parameters (default storage) */
#ifdef __cplusplus

extern "C" {

#endif

  extern P_sliding_controller2_T sliding_controller2_P;

#ifdef __cplusplus

}
#endif

/* Block signals (default storage) */
#ifdef __cplusplus

extern "C" {

#endif

  extern struct B_sliding_controller2_T sliding_controller2_B;

#ifdef __cplusplus

}
#endif

/* Continuous states (default storage) */
extern X_sliding_controller2_T sliding_controller2_X;

/* Block states (default storage) */
extern struct DW_sliding_controller2_T sliding_controller2_DW;

/* External data declarations for dependent source files */
extern const SL_Bus_sliding_controller2_sensor_msgs_JointState
  sliding_controller2_rtZSL_Bus_sliding_controller2_sensor_msgs_JointState;
                  /* SL_Bus_sliding_controller2_sensor_msgs_JointState ground */
extern const SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex
  sliding_controller2_rtZSL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex;
        /* SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex ground */
extern const SL_Bus_sliding_controller2_ambf_walker_DesiredJoints
  sliding_controller2_rtZSL_Bus_sliding_controller2_ambf_walker_DesiredJoints;
               /* SL_Bus_sliding_controller2_ambf_walker_DesiredJoints ground */

/*
 * Exported Global Parameters
 *
 * Note: Exported global parameters are tunable parameters with an exported
 * global storage class designation.  Code generation will declare the memory for
 * these parameters and exports their symbols.
 *
 */
extern real_T Dm1[49];                 /* Variable: Dm1
                                        * Referenced by: '<S20>/human derative gain'
                                        */

#ifdef __cplusplus

extern "C" {

#endif

  /* Model entry point functions */
  extern void sliding_controller2_initialize(void);
  extern void sliding_controller2_step(void);
  extern void sliding_controller2_terminate(void);

#ifdef __cplusplus

}
#endif

/* Real-time Model object */
#ifdef __cplusplus

extern "C" {

#endif

  extern RT_MODEL_sliding_controller2_T *const sliding_controller2_M;

#ifdef __cplusplus

}
#endif

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'sliding_controller2'
 * '<S1>'   : 'sliding_controller2/Blank Message'
 * '<S2>'   : 'sliding_controller2/Blank Message1'
 * '<S3>'   : 'sliding_controller2/Blank Message2'
 * '<S4>'   : 'sliding_controller2/Blank Message3'
 * '<S5>'   : 'sliding_controller2/Controller'
 * '<S6>'   : 'sliding_controller2/Enabled Subsystem'
 * '<S7>'   : 'sliding_controller2/Enabled Subsystem1'
 * '<S8>'   : 'sliding_controller2/Enabled Subsystem2'
 * '<S9>'   : 'sliding_controller2/MATLAB Function - String Array Assign'
 * '<S10>'  : 'sliding_controller2/Publish'
 * '<S11>'  : 'sliding_controller2/Subscribe'
 * '<S12>'  : 'sliding_controller2/Subscribe1'
 * '<S13>'  : 'sliding_controller2/Subscribe2'
 * '<S14>'  : 'sliding_controller2/exo msg'
 * '<S15>'  : 'sliding_controller2/human msg'
 * '<S16>'  : 'sliding_controller2/Controller/ interaction sping-damper'
 * '<S17>'  : 'sliding_controller2/Controller/F->tau'
 * '<S18>'  : 'sliding_controller2/Controller/F->tau1'
 * '<S19>'  : 'sliding_controller2/Controller/addmittance'
 * '<S20>'  : 'sliding_controller2/Controller/human controller'
 * '<S21>'  : 'sliding_controller2/Controller/sliding mode controller'
 * '<S22>'  : 'sliding_controller2/Controller/ interaction sping-damper/exo left'
 * '<S23>'  : 'sliding_controller2/Controller/ interaction sping-damper/exo right'
 * '<S24>'  : 'sliding_controller2/Controller/ interaction sping-damper/human left'
 * '<S25>'  : 'sliding_controller2/Controller/ interaction sping-damper/human right'
 * '<S26>'  : 'sliding_controller2/Controller/ interaction sping-damper/left shank'
 * '<S27>'  : 'sliding_controller2/Controller/ interaction sping-damper/left thigh'
 * '<S28>'  : 'sliding_controller2/Controller/ interaction sping-damper/right shank'
 * '<S29>'  : 'sliding_controller2/Controller/ interaction sping-damper/right tight'
 * '<S30>'  : 'sliding_controller2/Controller/F->tau/Subsystem'
 * '<S31>'  : 'sliding_controller2/Controller/F->tau/Subsystem1'
 * '<S32>'  : 'sliding_controller2/Controller/F->tau/Subsystem/MATLAB Function'
 * '<S33>'  : 'sliding_controller2/Controller/F->tau/Subsystem/MATLAB Function1'
 * '<S34>'  : 'sliding_controller2/Controller/F->tau/Subsystem1/MATLAB Function'
 * '<S35>'  : 'sliding_controller2/Controller/F->tau/Subsystem1/MATLAB Function1'
 * '<S36>'  : 'sliding_controller2/Controller/F->tau1/Subsystem'
 * '<S37>'  : 'sliding_controller2/Controller/F->tau1/Subsystem1'
 * '<S38>'  : 'sliding_controller2/Controller/F->tau1/Subsystem/MATLAB Function'
 * '<S39>'  : 'sliding_controller2/Controller/F->tau1/Subsystem/MATLAB Function1'
 * '<S40>'  : 'sliding_controller2/Controller/F->tau1/Subsystem1/MATLAB Function'
 * '<S41>'  : 'sliding_controller2/Controller/F->tau1/Subsystem1/MATLAB Function1'
 * '<S42>'  : 'sliding_controller2/Controller/addmittance/MATLAB Function'
 * '<S43>'  : 'sliding_controller2/Controller/sliding mode controller/Call Service'
 * '<S44>'  : 'sliding_controller2/Enabled Subsystem/Publish1'
 * '<S45>'  : 'sliding_controller2/Enabled Subsystem/Publish2'
 * '<S46>'  : 'sliding_controller2/Subscribe/Enabled Subsystem'
 * '<S47>'  : 'sliding_controller2/Subscribe1/Enabled Subsystem'
 * '<S48>'  : 'sliding_controller2/Subscribe2/Enabled Subsystem'
 */
#endif                                 /* RTW_HEADER_sliding_controller2_h_ */
