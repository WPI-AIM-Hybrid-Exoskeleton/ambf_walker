/*
 * sliding_controller2.h
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "sliding_controller2".
 *
 * Model version              : 1.153
 * Simulink Coder version : 9.5 (R2021a) 14-Nov-2020
 * C++ source code generated on : Sat May 29 16:26:29 2021
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
#include <stddef.h>
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
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

#ifndef rtmGetTPtr
#define rtmGetTPtr(rtm)                ((rtm)->Timing.t)
#endif

/* Block signals for system '<S14>/exo left' */
struct B_exoleft_sliding_controller2_T {
  real_T knee[2];                      /* '<S14>/exo left' */
  real_T dknee[2];                     /* '<S14>/exo left' */
  real_T ankle[2];                     /* '<S14>/exo left' */
  real_T danke[2];                     /* '<S14>/exo left' */
};

/* Block signals for system '<S28>/MATLAB Function' */
struct B_MATLABFunction_sliding_cont_T {
  real_T y[4];                         /* '<S28>/MATLAB Function' */
};

/* Block signals for system '<S28>/MATLAB Function1' */
struct B_MATLABFunction1_sliding_con_T {
  real_T y[4];                         /* '<S28>/MATLAB Function1' */
};

/* Block signals for system '<S10>/Enabled Subsystem' */
struct B_EnabledSubsystem_sliding_co_T {
  SL_Bus_sliding_controller2_sensor_msgs_JointState In1;/* '<S45>/In1' */
};

/* Block signals (default storage) */
struct B_sliding_controller2_T {
  SL_Bus_sliding_controller2_sensor_msgs_JointState msg;/* '<Root>/exo msg' */
  SL_Bus_sliding_controller2_sensor_msgs_JointState In1;/* '<S7>/In1' */
  SL_Bus_sliding_controller2_sensor_msgs_JointState In1_j;/* '<S6>/In1' */
  SL_Bus_sliding_controller2_sensor_msgs_JointState BusAssignment1;/* '<S5>/Bus Assignment1' */
  SL_Bus_sliding_controller2_sensor_msgs_JointState msg_m;/* '<Root>/human msg' */
  SL_Bus_sliding_controller2_sensor_msgs_JointState SourceBlock_o2;/* '<S11>/SourceBlock' */
  SL_Bus_sliding_controller2_sensor_msgs_JointState SourceBlock_o2_k;/* '<S10>/SourceBlock' */
  SL_Bus_sliding_controller2_sensor_msgs_JointState b_varargout_2;
  SL_Bus_sliding_controller2_sensor_msgs_JointState b_varargout_2_c;
  SL_Bus_sliding_controller2_ambf_walker_DesiredJoints In1_a;/* '<S44>/In1' */
  SL_Bus_sliding_controller2_ambf_walker_DesiredJoints b_varargout_2_k;
  real_T change[49];
  real_T Y[49];
  SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex msg_o;
                            /* '<Root>/MATLAB Function - String Array Assign' */
  SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex BusAssignment;/* '<S19>/Bus Assignment' */
  SL_Bus_sliding_controller2_RBDLInverseDynamicsRespon_9vsb2h b_varargout_1;
  real_T qd_add_n[7];                  /* '<S17>/Gain5' */
  real_T Saturation3[7];               /* '<S4>/Saturation3' */
  real_T Saturation4[7];               /* '<S4>/Saturation4' */
  real_T K[49];                        /* '<S17>/MATLAB Function' */
  real_T B[49];                        /* '<S17>/MATLAB Function' */
  real_T b_x[7];
  real_T B_c[7];
  real_T A[7];
  real_T Add1_i[7];                    /* '<S19>/Add1' */
  real_T dv[7];
  real_T work[7];
  real_T vn1[7];
  real_T vn2[7];
  int32_T jpvt[7];
  char_T b_zeroDelimTopic[27];
  char_T b_zeroDelimTopic_b[25];
  char_T b_zeroDelimServiceName[17];
  real_T Add[2];                       /* '<S34>/Add' */
  real_T Add_c[2];                     /* '<S35>/Add' */
  real_T Sum[7];                       /* '<S17>/Sum' */
  real_T qd_add[7];                    /* '<S17>/Integrator' */
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
  real_T unnamed_idx_1_p;
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
  boolean_T SourceBlock_o1;            /* '<S9>/SourceBlock' */
  B_EnabledSubsystem_sliding_co_T EnabledSubsystem_i;/* '<S11>/Enabled Subsystem' */
  B_EnabledSubsystem_sliding_co_T EnabledSubsystem_l;/* '<S10>/Enabled Subsystem' */
  B_MATLABFunction1_sliding_con_T sf_MATLABFunction1_je;/* '<S35>/MATLAB Function1' */
  B_MATLABFunction_sliding_cont_T sf_MATLABFunction_a;/* '<S35>/MATLAB Function' */
  B_MATLABFunction1_sliding_con_T sf_MATLABFunction1_j;/* '<S34>/MATLAB Function1' */
  B_MATLABFunction_sliding_cont_T sf_MATLABFunction_p;/* '<S34>/MATLAB Function' */
  B_MATLABFunction1_sliding_con_T sf_MATLABFunction1_h;/* '<S29>/MATLAB Function1' */
  B_MATLABFunction_sliding_cont_T sf_MATLABFunction_o;/* '<S29>/MATLAB Function' */
  B_MATLABFunction1_sliding_con_T sf_MATLABFunction1;/* '<S28>/MATLAB Function1' */
  B_MATLABFunction_sliding_cont_T sf_MATLABFunction;/* '<S28>/MATLAB Function' */
  B_exoleft_sliding_controller2_T sf_humanright;/* '<S14>/human right' */
  B_exoleft_sliding_controller2_T sf_humanleft;/* '<S14>/human left' */
  B_exoleft_sliding_controller2_T sf_exoright;/* '<S14>/exo right' */
  B_exoleft_sliding_controller2_T sf_exoleft;/* '<S14>/exo left' */
};

/* Block states (default storage) for system '<Root>' */
struct DW_sliding_controller2_T {
  ros_slroscpp_internal_block_S_T obj; /* '<S41>/ServiceCaller' */
  ros_slroscpp_internal_block_P_T obj_m;/* '<S43>/SinkBlock' */
  ros_slroscpp_internal_block_P_T obj_n;/* '<S42>/SinkBlock' */
  ros_slroscpp_internal_block_k_T obj_h;/* '<S11>/SourceBlock' */
  ros_slroscpp_internal_block_k_T obj_c;/* '<S10>/SourceBlock' */
  ros_slroscpp_internal_block_k_T obj_g;/* '<S9>/SourceBlock' */
  ExampleHelperSimulationRateCo_T obj_k;/* '<Root>/Simulation Rate Control' */
  boolean_T objisempty;                /* '<S11>/SourceBlock' */
  boolean_T objisempty_n;              /* '<S10>/SourceBlock' */
  boolean_T objisempty_o;              /* '<S9>/SourceBlock' */
  boolean_T objisempty_oz;             /* '<Root>/Simulation Rate Control' */
  boolean_T objisempty_d;              /* '<S43>/SinkBlock' */
  boolean_T objisempty_c;              /* '<S42>/SinkBlock' */
  boolean_T objisempty_a;              /* '<S41>/ServiceCaller' */
  boolean_T EnabledSubsystem_MODE;     /* '<Root>/Enabled Subsystem' */
  boolean_T Controller_MODE;           /* '<Root>/Controller' */
};

/* Continuous states (default storage) */
struct X_sliding_controller2_T {
  real_T Integrator1_CSTATE[7];        /* '<S17>/Integrator1' */
  real_T Integrator_CSTATE[7];         /* '<S17>/Integrator' */
};

/* State derivatives (default storage) */
struct XDot_sliding_controller2_T {
  real_T Integrator1_CSTATE[7];        /* '<S17>/Integrator1' */
  real_T Integrator_CSTATE[7];         /* '<S17>/Integrator' */
};

/* State disabled  */
struct XDis_sliding_controller2_T {
  boolean_T Integrator1_CSTATE[7];     /* '<S17>/Integrator1' */
  boolean_T Integrator_CSTATE[7];      /* '<S17>/Integrator' */
};

#ifndef ODE3_INTG
#define ODE3_INTG

/* ODE3 Integration Data */
struct ODE3_IntgData {
  real_T *y;                           /* output */
  real_T *f[3];                        /* derivatives */
};

#endif

/* Parameters for system: '<S10>/Enabled Subsystem' */
struct P_EnabledSubsystem_sliding_co_T_ {
  SL_Bus_sliding_controller2_sensor_msgs_JointState Out1_Y0;/* Computed Parameter: Out1_Y0
                                                             * Referenced by: '<S45>/Out1'
                                                             */
};

/* Parameters (default storage) */
struct P_sliding_controller2_T_ {
  real_T Km1[49];                      /* Variable: Km1
                                        * Referenced by: '<S18>/Gain1'
                                        */
  real_T dampener[4];                  /* Variable: dampener
                                        * Referenced by:
                                        *   '<S24>/Gain4'
                                        *   '<S25>/Gain4'
                                        *   '<S26>/Gain4'
                                        *   '<S27>/Gain4'
                                        */
  real_T exo_sat;                      /* Variable: exo_sat
                                        * Referenced by:
                                        *   '<S4>/Saturation3'
                                        *   '<S4>/Saturation4'
                                        */
  real_T invMd[49];                    /* Variable: invMd
                                        * Referenced by: '<S17>/Gain5'
                                        */
  real_T lambda2[49];                  /* Variable: lambda2
                                        * Referenced by:
                                        *   '<S19>/Gain12'
                                        *   '<S19>/Gain3'
                                        */
  real_T rho2[49];                     /* Variable: rho2
                                        * Referenced by: '<S19>/Gain4'
                                        */
  real_T spring[4];                    /* Variable: spring
                                        * Referenced by:
                                        *   '<S24>/Gain3'
                                        *   '<S25>/Gain3'
                                        *   '<S26>/Gain3'
                                        *   '<S27>/Gain3'
                                        */
  SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value;/* Computed Parameter: Constant_Value
                                                                    * Referenced by: '<S1>/Constant'
                                                                    */
  SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value_d;/* Computed Parameter: Constant_Value_d
                                                                      * Referenced by: '<S2>/Constant'
                                                                      */
  SL_Bus_sliding_controller2_sensor_msgs_JointState exo_Y0;/* Computed Parameter: exo_Y0
                                                            * Referenced by: '<S6>/exo'
                                                            */
  SL_Bus_sliding_controller2_sensor_msgs_JointState human_Y0;/* Computed Parameter: human_Y0
                                                              * Referenced by: '<S7>/human'
                                                              */
  SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value_a;/* Computed Parameter: Constant_Value_a
                                                                      * Referenced by: '<S10>/Constant'
                                                                      */
  SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value_j;/* Computed Parameter: Constant_Value_j
                                                                      * Referenced by: '<S11>/Constant'
                                                                      */
  SL_Bus_sliding_controller2_ambf_walker_DesiredJoints Out1_Y0;/* Computed Parameter: Out1_Y0
                                                                * Referenced by: '<S44>/Out1'
                                                                */
  SL_Bus_sliding_controller2_ambf_walker_DesiredJoints Constant_Value_b;/* Computed Parameter: Constant_Value_b
                                                                      * Referenced by: '<S9>/Constant'
                                                                      */
  SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex Constant_Value_e;/* Computed Parameter: Constant_Value_e
                                                                      * Referenced by: '<S3>/Constant'
                                                                      */
  SL_Bus_sliding_controller2_RBDLInverseDynamicsRespon_9vsb2h Constant_Value_bi;/* Computed Parameter: Constant_Value_bi
                                                                      * Referenced by: '<S41>/Constant'
                                                                      */
  real_T exotau_Y0;                    /* Computed Parameter: exotau_Y0
                                        * Referenced by: '<S4>/exo tau'
                                        */
  real_T humantau_Y0;                  /* Computed Parameter: humantau_Y0
                                        * Referenced by: '<S4>/human tau'
                                        */
  real_T Constant_Value_l;             /* Expression: 0
                                        * Referenced by: '<S16>/Constant'
                                        */
  real_T Constant_Value_o;             /* Expression: 0
                                        * Referenced by: '<S34>/Constant'
                                        */
  real_T Constant_Value_p;             /* Expression: 0
                                        * Referenced by: '<S35>/Constant'
                                        */
  real_T Integrator1_IC[7];       /* Expression: [-0.349,-0.2,0,-0.349,-0.2,0,0]
                                   * Referenced by: '<S17>/Integrator1'
                                   */
  real_T Integrator_IC;                /* Expression: 0
                                        * Referenced by: '<S17>/Integrator'
                                        */
  real_T Gain18_Gain;                  /* Expression: 0.5
                                        * Referenced by: '<S19>/Gain18'
                                        */
  real_T Constant_Value_c;             /* Expression: 0
                                        * Referenced by: '<S15>/Constant'
                                        */
  real_T Constant_Value_f;             /* Expression: 0
                                        * Referenced by: '<S28>/Constant'
                                        */
  real_T Constant_Value_k;             /* Expression: 0
                                        * Referenced by: '<S29>/Constant'
                                        */
  P_EnabledSubsystem_sliding_co_T EnabledSubsystem_i;/* '<S11>/Enabled Subsystem' */
  P_EnabledSubsystem_sliding_co_T EnabledSubsystem_l;/* '<S10>/Enabled Subsystem' */
};

/* Real-time Model Data Structure */
struct tag_RTM_sliding_controller2_T {
  const char_T *errorStatus;
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
    int_T numContStates;
    int_T numPeriodicContStates;
    int_T numSampTimes;
  } Sizes;

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
    SimTimeStep simTimeStep;
    boolean_T stopRequestedFlag;
    time_T *t;
    time_T tArray[2];
  } Timing;
};

/*
 * Exported Global Parameters
 *
 * Note: Exported global parameters are tunable parameters with an exported
 * global storage class designation.  Code generation will declare the memory for
 * these parameters and exports their symbols.
 *
 */
extern real_T Dm1[49];                 /* Variable: Dm1
                                        * Referenced by: '<S18>/Gain2'
                                        */

/* Class declaration for model sliding_controller2 */
class sliding_controller2ModelClass {
  /* public data and function members */
 public:
  /* model initialize function */
  void initialize();

  /* model step function */
  void step();

  /* model terminate function */
  void terminate();

  /* Constructor */
  sliding_controller2ModelClass();

  /* Destructor */
  ~sliding_controller2ModelClass();

  /* Real-Time Model get method */
  RT_MODEL_sliding_controller2_T * getRTM();

  /* private data and function members */
 private:
  /* Tunable parameters */
  static P_sliding_controller2_T sliding_controller2_P;

  /* Block signals */
  B_sliding_controller2_T sliding_controller2_B;

  /* Block states */
  DW_sliding_controller2_T sliding_controller2_DW;
  X_sliding_controller2_T sliding_controller2_X;/* Block continuous states */

  /* Real-Time Model */
  RT_MODEL_sliding_controller2_T sliding_controller2_M;

  /* private member function(s) for subsystem '<S14>/exo left'*/
  static void sliding_controller2_exoleft(const real_T rtu_q[2], const real_T
    rtu_qd[2], B_exoleft_sliding_controller2_T *localB);

  /* private member function(s) for subsystem '<S28>/MATLAB Function'*/
  static void sliding_controll_MATLABFunction(const real_T rtu_q[2],
    B_MATLABFunction_sliding_cont_T *localB);

  /* private member function(s) for subsystem '<S28>/MATLAB Function1'*/
  static void sliding_control_MATLABFunction1(const real_T rtu_q[2],
    B_MATLABFunction1_sliding_con_T *localB);

  /* private member function(s) for subsystem '<S10>/Enabled Subsystem'*/
  static void sliding_c_EnabledSubsystem_Init(B_EnabledSubsystem_sliding_co_T
    *localB, P_EnabledSubsystem_sliding_co_T *localP);
  static void sliding_contro_EnabledSubsystem(boolean_T rtu_Enable, const
    SL_Bus_sliding_controller2_sensor_msgs_JointState *rtu_In1,
    B_EnabledSubsystem_sliding_co_T *localB);

  /* private member function(s) for subsystem '<Root>'*/
  void sliding_control_SystemCore_step(boolean_T *varargout_1, uint32_T
    *varargout_2_Header_Seq, real_T *varargout_2_Header_Stamp_Sec, real_T
    *varargout_2_Header_Stamp_Nsec, uint8_T varargout_2_Header_FrameId[128],
    uint32_T *varargout_2_Header_FrameId_SL_I, uint32_T
    *varargout_2_Header_FrameId_SL_0, SL_Bus_sliding_controller2_std_msgs_String
    varargout_2_Name[16], uint32_T *varargout_2_Name_SL_Info_Curren, uint32_T
    *varargout_2_Name_SL_Info_Receiv, real_T varargout_2_Position[7], uint32_T
    *varargout_2_Position_SL_Info_Cu, uint32_T *varargout_2_Position_SL_Info_Re,
    real_T varargout_2_Velocity[7], uint32_T *varargout_2_Velocity_SL_Info_Cu,
    uint32_T *varargout_2_Velocity_SL_Info_Re, real_T varargout_2_Effort[7],
    SL_Bus_ROSVariableLengthArrayInfo *varargout_2_Effort_SL_Info);
  void sliding_contr_SystemCore_step_k(boolean_T *varargout_1, uint32_T
    *varargout_2_Header_Seq, real_T *varargout_2_Header_Stamp_Sec, real_T
    *varargout_2_Header_Stamp_Nsec, uint8_T varargout_2_Header_FrameId[128],
    uint32_T *varargout_2_Header_FrameId_SL_I, uint32_T
    *varargout_2_Header_FrameId_SL_0, SL_Bus_sliding_controller2_std_msgs_String
    varargout_2_Name[16], uint32_T *varargout_2_Name_SL_Info_Curren, uint32_T
    *varargout_2_Name_SL_Info_Receiv, real_T varargout_2_Position[7], uint32_T
    *varargout_2_Position_SL_Info_Cu, uint32_T *varargout_2_Position_SL_Info_Re,
    real_T varargout_2_Velocity[7], uint32_T *varargout_2_Velocity_SL_Info_Cu,
    uint32_T *varargout_2_Velocity_SL_Info_Re, real_T varargout_2_Effort[7],
    SL_Bus_ROSVariableLengthArrayInfo *varargout_2_Effort_SL_Info);
  real_T sliding_controller2_xnrm2(int32_T n, const real_T x[7], int32_T ix0);
  void sliding_controller2_qrpf(real_T A[7], int32_T ia0, int32_T m, int32_T n,
    real_T *tau, int32_T jpvt[7]);

  /* Continuous states update member function*/
  void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si );

  /* Derivatives member function */
  void sliding_controller2_derivatives();
};

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
 * '<S1>'   : 'sliding_controller2/Blank Message1'
 * '<S2>'   : 'sliding_controller2/Blank Message2'
 * '<S3>'   : 'sliding_controller2/Blank Message3'
 * '<S4>'   : 'sliding_controller2/Controller'
 * '<S5>'   : 'sliding_controller2/Enabled Subsystem'
 * '<S6>'   : 'sliding_controller2/Enabled Subsystem1'
 * '<S7>'   : 'sliding_controller2/Enabled Subsystem2'
 * '<S8>'   : 'sliding_controller2/MATLAB Function - String Array Assign'
 * '<S9>'   : 'sliding_controller2/Subscribe'
 * '<S10>'  : 'sliding_controller2/Subscribe1'
 * '<S11>'  : 'sliding_controller2/Subscribe2'
 * '<S12>'  : 'sliding_controller2/exo msg'
 * '<S13>'  : 'sliding_controller2/human msg'
 * '<S14>'  : 'sliding_controller2/Controller/ interaction sping-damper'
 * '<S15>'  : 'sliding_controller2/Controller/F->tau'
 * '<S16>'  : 'sliding_controller2/Controller/F->tau1'
 * '<S17>'  : 'sliding_controller2/Controller/addmittance1'
 * '<S18>'  : 'sliding_controller2/Controller/human controller'
 * '<S19>'  : 'sliding_controller2/Controller/sliding mode controller'
 * '<S20>'  : 'sliding_controller2/Controller/ interaction sping-damper/exo left'
 * '<S21>'  : 'sliding_controller2/Controller/ interaction sping-damper/exo right'
 * '<S22>'  : 'sliding_controller2/Controller/ interaction sping-damper/human left'
 * '<S23>'  : 'sliding_controller2/Controller/ interaction sping-damper/human right'
 * '<S24>'  : 'sliding_controller2/Controller/ interaction sping-damper/left shank'
 * '<S25>'  : 'sliding_controller2/Controller/ interaction sping-damper/left thigh'
 * '<S26>'  : 'sliding_controller2/Controller/ interaction sping-damper/right shank'
 * '<S27>'  : 'sliding_controller2/Controller/ interaction sping-damper/right tight'
 * '<S28>'  : 'sliding_controller2/Controller/F->tau/Subsystem'
 * '<S29>'  : 'sliding_controller2/Controller/F->tau/Subsystem1'
 * '<S30>'  : 'sliding_controller2/Controller/F->tau/Subsystem/MATLAB Function'
 * '<S31>'  : 'sliding_controller2/Controller/F->tau/Subsystem/MATLAB Function1'
 * '<S32>'  : 'sliding_controller2/Controller/F->tau/Subsystem1/MATLAB Function'
 * '<S33>'  : 'sliding_controller2/Controller/F->tau/Subsystem1/MATLAB Function1'
 * '<S34>'  : 'sliding_controller2/Controller/F->tau1/Subsystem'
 * '<S35>'  : 'sliding_controller2/Controller/F->tau1/Subsystem1'
 * '<S36>'  : 'sliding_controller2/Controller/F->tau1/Subsystem/MATLAB Function'
 * '<S37>'  : 'sliding_controller2/Controller/F->tau1/Subsystem/MATLAB Function1'
 * '<S38>'  : 'sliding_controller2/Controller/F->tau1/Subsystem1/MATLAB Function'
 * '<S39>'  : 'sliding_controller2/Controller/F->tau1/Subsystem1/MATLAB Function1'
 * '<S40>'  : 'sliding_controller2/Controller/addmittance1/MATLAB Function'
 * '<S41>'  : 'sliding_controller2/Controller/sliding mode controller/Call Service'
 * '<S42>'  : 'sliding_controller2/Enabled Subsystem/Publish1'
 * '<S43>'  : 'sliding_controller2/Enabled Subsystem/Publish2'
 * '<S44>'  : 'sliding_controller2/Subscribe/Enabled Subsystem'
 * '<S45>'  : 'sliding_controller2/Subscribe1/Enabled Subsystem'
 * '<S46>'  : 'sliding_controller2/Subscribe2/Enabled Subsystem'
 */
#endif                                 /* RTW_HEADER_sliding_controller2_h_ */
