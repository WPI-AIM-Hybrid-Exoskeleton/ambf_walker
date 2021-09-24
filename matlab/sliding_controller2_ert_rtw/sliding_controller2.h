//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: sliding_controller2.h
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
#include "rtGetNaN.h"
#include "rt_nonfinite.h"
#include "rtGetInf.h"

// Macros for accessing real-time model data structure
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

#ifndef ODE3_INTG
#define ODE3_INTG

// ODE3 Integration Data
struct ODE3_IntgData {
  real_T *y;                           // output
  real_T *f[3];                        // derivatives
};

#endif

//
//  Exported Global Parameters
//
//  Note: Exported global parameters are tunable parameters with an exported
//  global storage class designation.  Code generation will declare the memory for
//  these parameters and exports their symbols.
//

extern real_T Bn0[6];                  // Variable: Bn0
                                          //  Referenced by: '<S29>/Constant3'

extern real_T Bp0[6];                  // Variable: Bp0
                                          //  Referenced by: '<S29>/Constant2'

extern real_T Dm1[36];                 // Variable: Dm1
                                          //  Referenced by: '<S30>/human derative gain'

extern real_T Km1[36];                 // Variable: Km1
                                          //  Referenced by: '<S30>/human proportional gain'

extern real_T Kn0[6];                  // Variable: Kn0
                                          //  Referenced by: '<S29>/Constant1'

extern real_T Kp0[6];                  // Variable: Kp0
                                          //  Referenced by: '<S29>/Constant'

extern real_T dampener[4];             // Variable: dampener
                                          //  Referenced by:
                                          //    '<S36>/dampener left shank'
                                          //    '<S37>/dampener left thigh'
                                          //    '<S38>/dampener right shank'
                                          //    '<S39>/dampener right shank'

extern real_T exo_sat;                 // Variable: exo_sat
                                          //  Referenced by: '<S5>/exo sateration'

extern real_T invMd[36];               // Variable: invMd
                                          //  Referenced by: '<S29>/addmittance gain'

extern real_T lambda2[36];             // Variable: lambda2
                                          //  Referenced by:
                                          //    '<S31>/Gain12'
                                          //    '<S31>/lambda SMC'

extern real_T rho2[36];                // Variable: rho2
                                          //  Referenced by: '<S31>/rho SMC'


// Class declaration for model sliding_controller2
class sliding_controller2ModelClass {
  // public data and function members
 public:
  // Block signals (default storage)
  struct B_sliding_controller2_T {
    SL_Bus_sliding_controller2_sensor_msgs_JointState msg;// '<Root>/human msg'
    SL_Bus_sliding_controller2_sensor_msgs_JointState msg_n;// '<Root>/exo msg'
    SL_Bus_sliding_controller2_sensor_msgs_JointState In1_g;// '<S61>/In1'
    SL_Bus_sliding_controller2_sensor_msgs_JointState In1_n;// '<S60>/In1'
    SL_Bus_sliding_controller2_sensor_msgs_JointState In1_e;// '<S8>/In1'
    SL_Bus_sliding_controller2_sensor_msgs_JointState In1_j;// '<S7>/In1'
    SL_Bus_sliding_controller2_sensor_msgs_JointState BusAssignment1;// '<S6>/Bus Assignment1' 
    SL_Bus_sliding_controller2_sensor_msgs_JointState b_varargout_2;
    SL_Bus_sliding_controller2_sensor_msgs_JointState b_varargout_2_m;
    SL_Bus_sliding_controller2_sensor_msgs_JointState b_varargout_2_c;
    SL_Bus_sliding_controller2_sensor_msgs_JointState b_varargout_2_k;
    SL_Bus_sliding_controller2_std_msgs_String b_varargout_2_Name[16];
    SL_Bus_sliding_controller2_ambf_walker_DesiredJoints In1_a;// '<S59>/In1'
    SL_Bus_sliding_controller2_ambf_walker_DesiredJoints b_varargout_2_cx;
    real_T change[36];
    real_T Kp0_b[36];
    real_T Kn0_p[36];
    real_T Bp0_c[36];
    real_T Bn0_f[36];
    real_T Y[36];
    SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex msg_o;
                              // '<Root>/MATLAB Function - String Array Assign'
    SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex BusAssignment;// '<S31>/Bus Assignment' 
    SL_Bus_sliding_controller2_std_msgs_Header BusAssignment1_m;// '<Root>/Bus Assignment1' 
    uint8_T b_varargout_2_Header_FrameId[128];
    SL_Bus_sliding_controller2_RBDLInverseDynamicsRespon_9vsb2h b_varargout_1;
    real_T Position[7];
    real_T b_varargout_2_Effort[7];
    real_T y_d[7];                     // '<S5>/MATLAB Function2'
    real_T rtb_y_n_g[7];
    real_T rtb_Velocity_g[7];
    real_T y_m[7];                     // '<S31>/MATLAB Function3'
    real_T Sum[6];                     // '<S29>/Sum'
    real_T Q[6];
    real_T humansateration[7];         // '<S5>/human sateration'
    real_T qd_add[6];                  // '<S29>/Integrator'
    real_T exosateration[7];           // '<S5>/exo sateration'
    real_T qd_add_n[6];                // '<S29>/addmittance gain'
    real_T y[7];                       // '<S31>/MATLAB Function2'
    real_T y_e[7];                     // '<S31>/MATLAB Function1'
    real_T K[36];                      // '<S29>/MATLAB Function'
    real_T B[36];                      // '<S29>/MATLAB Function'
    real_T b_x[6];
    real_T B_n[6];
    real_T A[6];
    real_T rtb_Saturation_p[6];
    real_T rtb_Add1_l[6];
    real_T work[6];
    real_T vn1[6];
    real_T vn2[6];
    real_T rtb_y_f_j[4];
    char_T b_zeroDelimTopic[24];
    char_T b_zeroDelimTopic_tmp[24];
    int32_T jpvt[6];
    char_T b_zeroDelimTopic_d[23];
    char_T b_zeroDelimTopic_g[21];
    char_T b_zeroDelimTopic_l[18];
    char_T b_zeroDelimTopic_tmp_d[18];
    char_T b_zeroDelimServiceName[17];
    SL_Bus_sliding_controller2_ros_time_Time rtb_CurrentTime_d;
    real_T rtb_danke_g_l[2];
    real_T rtb_Product2_o[2];
    real_T rtb_knee_bj[2];
    real_T rtb_ankle_n[2];
    real_T rtb_dknee_b[2];
    real_T rtb_knee_b_l[2];
    real_T rtb_Add_c_h[2];
    real_T rtb_Add_e_b[2];
    real_T wj;
    real_T b_varargout_2_Header_Stamp_Sec;
    real_T rtb_Saturation_tmp;
    real_T unnamed_idx_0;
    real_T rtb_Add_e_idx_0;
    real_T rtb_Add_e_idx_1;
    real_T rtb_danke_g_idx_0;
    real_T rtb_danke_g_idx_1;
    real_T rtb_dknee_idx_0;
    real_T rtb_knee_b_idx_0;
    real_T rtb_dknee_idx_1;
    real_T rtb_knee_b_idx_1;
    real_T rtb_Add_e_tmp_tmp;
    real_T unnamed_idx_0_tmp;
    real_T rtb_Saturation_tmp_tmp;
    real_T rtb_danke_g_idx_1_tmp;
    real_T smax;
    real_T beta1;
    real_T scale;
    real_T absxk;
    real_T t;
    SL_Bus_ROSVariableLengthArrayInfo b_varargout_2_Effort_SL_Info;
    SL_Bus_sliding_controller2_std_msgs_Bool In1_k;// '<S63>/In1'
    int32_T e_j;
    int32_T i;
    int32_T e_k;
    int32_T minmn;
    int32_T ii;
    int32_T nmi;
    int32_T mmi;
    int32_T pvt;
    int32_T ix;
    int32_T iy;
    int32_T b_k;
    int32_T c_ix;
    int32_T e;
    uint32_T b_varargout_2_Header_Seq;
    uint32_T b_varargout_2_Header_FrameId_SL;
    uint32_T b_varargout_2_Header_FrameId__e;
    uint32_T b_varargout_2_Name_SL_Info_Curr;
    uint32_T b_varargout_2_Name_SL_Info_Rece;
    uint32_T b_varargout_2_Position_SL_Info_;
    uint32_T b_varargout_2_Position_SL_Inf_a;
    uint32_T b_varargout_2_Velocity_SL_Info_;
    uint32_T b_varargout_2_Velocity_SL_Inf_j;
    boolean_T LogicalOperator;         // '<Root>/Logical Operator'
    boolean_T SourceBlock_o1_i;        // '<S15>/SourceBlock'
    boolean_T SourceBlock_o1_hm;       // '<S14>/SourceBlock'
  };

  // Block states (default storage) for system '<Root>'
  struct DW_sliding_controller2_T {
    ros_slros_internal_block_Curr_T obj;// '<Root>/Current Time'
    ros_slroscpp_internal_block_P_T obj_m;// '<S58>/SinkBlock'
    ros_slroscpp_internal_block_P_T obj_n;// '<S57>/SinkBlock'
    ros_slroscpp_internal_block_P_T obj_o;// '<S28>/SinkBlock'
    ros_slroscpp_internal_block_S_T obj_ox;// '<S53>/ServiceCaller'
    ros_slroscpp_internal_block_k_T obj_j;// '<S19>/SourceBlock'
    ros_slroscpp_internal_block_k_T obj_k;// '<S18>/SourceBlock'
    ros_slroscpp_internal_block_k_T obj_c;// '<S17>/SourceBlock'
    ros_slroscpp_internal_block_k_T obj_a;// '<S16>/SourceBlock'
    ros_slroscpp_internal_block_k_T obj_h;// '<S15>/SourceBlock'
    ros_slroscpp_internal_block_k_T obj_cg;// '<S14>/SourceBlock'
    ros_slroscpp_internal_block_k_T obj_g;// '<S13>/SourceBlock'
    boolean_T EnabledSubsystem_MODE;   // '<Root>/Enabled Subsystem'
    boolean_T Controller_MODE;         // '<Root>/Controller'
  };

  // Continuous states (default storage)
  struct X_sliding_controller2_T {
    real_T Integrator1_CSTATE[6];      // '<S29>/Integrator1'
    real_T Integrator_CSTATE[6];       // '<S29>/Integrator'
  };

  // State derivatives (default storage)
  struct XDot_sliding_controller2_T {
    real_T Integrator1_CSTATE[6];      // '<S29>/Integrator1'
    real_T Integrator_CSTATE[6];       // '<S29>/Integrator'
  };

  // State disabled
  struct XDis_sliding_controller2_T {
    boolean_T Integrator1_CSTATE[6];   // '<S29>/Integrator1'
    boolean_T Integrator_CSTATE[6];    // '<S29>/Integrator'
  };

  // Parameters (default storage)
  struct P_sliding_controller2_T {
    real_T alpha[2];                   // Variable: alpha
                                          //  Referenced by: '<S29>/Constant4'

    real_T beta[6];                    // Variable: beta
                                          //  Referenced by: '<S31>/surface width SMC'

    real_T gamma[2];                   // Variable: gamma
                                          //  Referenced by: '<S29>/Constant5'

    real_T human_sat;                  // Variable: human_sat
                                          //  Referenced by: '<S5>/human sateration'

    real_T interaction_sat;            // Variable: interaction_sat
                                          //  Referenced by: '<S5>/Saturation'

    real_T spring[4];                  // Variable: spring
                                          //  Referenced by:
                                          //    '<S36>/spring left shank'
                                          //    '<S37>/spring left thigh'
                                          //    '<S38>/spring right thigh'
                                          //    '<S39>/spring right thigh'

    SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value;// Computed Parameter: Constant_Value
                                                                      //  Referenced by: '<S1>/Constant'

    SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value_d;// Computed Parameter: Constant_Value_d
                                                                      //  Referenced by: '<S2>/Constant'

    SL_Bus_sliding_controller2_sensor_msgs_JointState exo_Y0;// Computed Parameter: exo_Y0
                                                                //  Referenced by: '<S7>/exo'

    SL_Bus_sliding_controller2_sensor_msgs_JointState human_Y0;// Computed Parameter: human_Y0
                                                                  //  Referenced by: '<S8>/human'

    SL_Bus_sliding_controller2_sensor_msgs_JointState exo_Y0_f;// Computed Parameter: exo_Y0_f
                                                                  //  Referenced by: '<S10>/exo'

    SL_Bus_sliding_controller2_sensor_msgs_JointState human_Y0_i;// Computed Parameter: human_Y0_i
                                                                    //  Referenced by: '<S11>/human'

    SL_Bus_sliding_controller2_sensor_msgs_JointState Out1_Y0;// Computed Parameter: Out1_Y0
                                                                 //  Referenced by: '<S60>/Out1'

    SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value_a;// Computed Parameter: Constant_Value_a
                                                                      //  Referenced by: '<S14>/Constant'

    SL_Bus_sliding_controller2_sensor_msgs_JointState Out1_Y0_f;// Computed Parameter: Out1_Y0_f
                                                                   //  Referenced by: '<S61>/Out1'

    SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value_j;// Computed Parameter: Constant_Value_j
                                                                      //  Referenced by: '<S15>/Constant'

    SL_Bus_sliding_controller2_sensor_msgs_JointState Out1_Y0_e;// Computed Parameter: Out1_Y0_e
                                                                   //  Referenced by: '<S64>/Out1'

    SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value_jl;// Computed Parameter: Constant_Value_jl
                                                                      //  Referenced by: '<S18>/Constant'

    SL_Bus_sliding_controller2_sensor_msgs_JointState Out1_Y0_fs;// Computed Parameter: Out1_Y0_fs
                                                                    //  Referenced by: '<S65>/Out1'

    SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value_m;// Computed Parameter: Constant_Value_m
                                                                      //  Referenced by: '<S19>/Constant'

    SL_Bus_sliding_controller2_ambf_walker_DesiredJoints exo_Y0_n;// Computed Parameter: exo_Y0_n
                                                                     //  Referenced by: '<S9>/exo'

    SL_Bus_sliding_controller2_ambf_walker_DesiredJoints Out1_Y0_i;// Computed Parameter: Out1_Y0_i
                                                                      //  Referenced by: '<S59>/Out1'

    SL_Bus_sliding_controller2_ambf_walker_DesiredJoints Constant_Value_b;// Computed Parameter: Constant_Value_b
                                                                      //  Referenced by: '<S13>/Constant'

    SL_Bus_sliding_controller2_ambf_walker_DesiredJoints Out1_Y0_j;// Computed Parameter: Out1_Y0_j
                                                                      //  Referenced by: '<S62>/Out1'

    SL_Bus_sliding_controller2_ambf_walker_DesiredJoints Constant_Value_b2;// Computed Parameter: Constant_Value_b2
                                                                      //  Referenced by: '<S16>/Constant'

    SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex Constant_Value_e;// Computed Parameter: Constant_Value_e
                                                                      //  Referenced by: '<S3>/Constant'

    SL_Bus_sliding_controller2_std_msgs_Header Constant_Value_i;// Computed Parameter: Constant_Value_i
                                                                   //  Referenced by: '<S4>/Constant'

    SL_Bus_sliding_controller2_RBDLInverseDynamicsRespon_9vsb2h
      Constant_Value_bi;               // Computed Parameter: Constant_Value_bi
                                          //  Referenced by: '<S53>/Constant'

    SL_Bus_sliding_controller2_std_msgs_Bool Constant_Value_p;// Computed Parameter: Constant_Value_p
                                                                 //  Referenced by: '<S23>/Constant'

    SL_Bus_sliding_controller2_std_msgs_Bool Out1_Y0_d;// Computed Parameter: Out1_Y0_d
                                                          //  Referenced by: '<S63>/Out1'

    SL_Bus_sliding_controller2_std_msgs_Bool Constant_Value_ea;// Computed Parameter: Constant_Value_ea
                                                                  //  Referenced by: '<S17>/Constant'

    real_T exotau_Y0;                  // Computed Parameter: exotau_Y0
                                          //  Referenced by: '<S5>/exo tau'

    real_T humantau_Y0;                // Computed Parameter: humantau_Y0
                                          //  Referenced by: '<S5>/human tau'

    real_T Constant_Value_o;           // Expression: 0
                                          //  Referenced by: '<S46>/Constant'

    real_T Constant_Value_pa;          // Expression: 0
                                          //  Referenced by: '<S47>/Constant'

    real_T Integrator1_IC[6];
                       // Expression: [0.3234, 0.568, 0.07, 0.3234, 0.568, 0.07]
                          //  Referenced by: '<S29>/Integrator1'

    real_T Integrator_IC;              // Expression: 0
                                          //  Referenced by: '<S29>/Integrator'

    boolean_T Constant_Value_i1;       // Expression: true
                                          //  Referenced by: '<S5>/Constant'

  };

  // Real-time Model Data Structure
  struct RT_MODEL_sliding_controller2_T {
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
    real_T odeY[12];
    real_T odeF[3][12];
    ODE3_IntgData intgData;

    //
    //  Sizes:
    //  The following substructure contains sizes information
    //  for many of the model attributes such as inputs, outputs,
    //  dwork, sample times, etc.

    struct {
      int_T numContStates;
      int_T numPeriodicContStates;
      int_T numSampTimes;
    } Sizes;

    //
    //  Timing:
    //  The following substructure contains information regarding
    //  the timing information for the model.

    struct {
      uint32_T clockTick0;
      time_T stepSize0;
      uint32_T clockTick1;
      SimTimeStep simTimeStep;
      boolean_T stopRequestedFlag;
      time_T *t;
      time_T tArray[2];
    } Timing;
  };

  // model initialize function
  void initialize();

  // model step function
  void step();

  // model terminate function
  void terminate();

  // Constructor
  sliding_controller2ModelClass();

  // Destructor
  ~sliding_controller2ModelClass();

  // Real-Time Model get method
  sliding_controller2ModelClass::RT_MODEL_sliding_controller2_T * getRTM();

  // private data and function members
 private:
  // Tunable parameters
  static P_sliding_controller2_T sliding_controller2_P;

  // Block signals
  B_sliding_controller2_T sliding_controller2_B;

  // Block states
  DW_sliding_controller2_T sliding_controller2_DW;
  X_sliding_controller2_T sliding_controller2_X;// Block continuous states

  // Real-Time Model
  RT_MODEL_sliding_controller2_T sliding_controller2_M;

  // private member function(s) for subsystem '<S22>/exo left'
  static void sliding_controller2_exoleft(const real_T rtu_q[2], const real_T
    rtu_qd[2], real_T rty_knee[2], real_T rty_dknee[2], real_T rty_ankle[2],
    real_T rty_danke[2]);

  // private member function(s) for subsystem '<S40>/MATLAB Function'
  static void sliding_controll_MATLABFunction(const real_T rtu_q[2], real_T
    rty_y[4]);

  // private member function(s) for subsystem '<S40>/MATLAB Function1'
  static void sliding_control_MATLABFunction1(const real_T rtu_q[2], real_T
    rty_y[4]);

  // private member function(s) for subsystem '<S5>/MATLAB Function1'
  static void sliding_contr_MATLABFunction1_k(const real_T rtu_u[6], real_T
    rty_y[7]);

  // private member function(s) for subsystem '<Root>'
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
  real_T sliding_controller2_xnrm2(int32_T n, const real_T x[6], int32_T ix0);
  void sliding_controller2_qrpf(real_T A[6], int32_T ia0, int32_T m, int32_T n,
    real_T *tau, int32_T jpvt[6]);
  boolean_T sliding_cont_SystemCore_step_kc(void);
  boolean_T sliding_con_SystemCore_step_kcj(void);

  // Continuous states update member function
  void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si );

  // Derivatives member function
  void sliding_controller2_derivatives();
};

//-
//  These blocks were eliminated from the model due to optimizations:
//
//  Block '<S40>/Add' : Unused code path elimination
//  Block '<S40>/Constant' : Unused code path elimination
//  Block '<S40>/Product1' : Unused code path elimination
//  Block '<S40>/Product2' : Unused code path elimination
//  Block '<S40>/Transpose1' : Unused code path elimination
//  Block '<S40>/Transpose2' : Unused code path elimination
//  Block '<S41>/Add' : Unused code path elimination
//  Block '<S41>/Constant' : Unused code path elimination
//  Block '<S41>/Product1' : Unused code path elimination
//  Block '<S41>/Product2' : Unused code path elimination
//  Block '<S41>/Transpose1' : Unused code path elimination
//  Block '<S41>/Transpose2' : Unused code path elimination
//  Block '<S5>/Scope' : Unused code path elimination
//  Block '<S5>/Scope1' : Unused code path elimination
//  Block '<S5>/Scope2' : Unused code path elimination
//  Block '<S5>/Scope3' : Unused code path elimination
//  Block '<Root>/Scope' : Unused code path elimination
//  Block '<Root>/Scope1' : Unused code path elimination
//  Block '<Root>/Scope2' : Unused code path elimination
//  Block '<Root>/Scope3' : Unused code path elimination


//-
//  The generated code includes comments that allow you to trace directly
//  back to the appropriate location in the model.  The basic format
//  is <system>/block_name, where system is the system number (uniquely
//  assigned by Simulink) and block_name is the name of the block.
//
//  Use the MATLAB hilite_system command to trace the generated code back
//  to the model.  For example,
//
//  hilite_system('<S3>')    - opens system 3
//  hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
//
//  Here is the system hierarchy for this model
//
//  '<Root>' : 'sliding_controller2'
//  '<S1>'   : 'sliding_controller2/Blank Message1'
//  '<S2>'   : 'sliding_controller2/Blank Message2'
//  '<S3>'   : 'sliding_controller2/Blank Message3'
//  '<S4>'   : 'sliding_controller2/Blank Message4'
//  '<S5>'   : 'sliding_controller2/Controller'
//  '<S6>'   : 'sliding_controller2/Enabled Subsystem'
//  '<S7>'   : 'sliding_controller2/Enabled Subsystem1'
//  '<S8>'   : 'sliding_controller2/Enabled Subsystem2'
//  '<S9>'   : 'sliding_controller2/Enabled Subsystem3'
//  '<S10>'  : 'sliding_controller2/Enabled Subsystem4'
//  '<S11>'  : 'sliding_controller2/Enabled Subsystem5'
//  '<S12>'  : 'sliding_controller2/MATLAB Function - String Array Assign'
//  '<S13>'  : 'sliding_controller2/Subscribe'
//  '<S14>'  : 'sliding_controller2/Subscribe1'
//  '<S15>'  : 'sliding_controller2/Subscribe2'
//  '<S16>'  : 'sliding_controller2/Subscribe3'
//  '<S17>'  : 'sliding_controller2/Subscribe4'
//  '<S18>'  : 'sliding_controller2/Subscribe5'
//  '<S19>'  : 'sliding_controller2/Subscribe6'
//  '<S20>'  : 'sliding_controller2/exo msg'
//  '<S21>'  : 'sliding_controller2/human msg'
//  '<S22>'  : 'sliding_controller2/Controller/ interaction sping-damper'
//  '<S23>'  : 'sliding_controller2/Controller/Blank Message5'
//  '<S24>'  : 'sliding_controller2/Controller/F->tau'
//  '<S25>'  : 'sliding_controller2/Controller/F->tau1'
//  '<S26>'  : 'sliding_controller2/Controller/MATLAB Function1'
//  '<S27>'  : 'sliding_controller2/Controller/MATLAB Function2'
//  '<S28>'  : 'sliding_controller2/Controller/Publish1'
//  '<S29>'  : 'sliding_controller2/Controller/addmittance'
//  '<S30>'  : 'sliding_controller2/Controller/human controller'
//  '<S31>'  : 'sliding_controller2/Controller/sliding mode controller'
//  '<S32>'  : 'sliding_controller2/Controller/ interaction sping-damper/exo left'
//  '<S33>'  : 'sliding_controller2/Controller/ interaction sping-damper/exo right'
//  '<S34>'  : 'sliding_controller2/Controller/ interaction sping-damper/human left'
//  '<S35>'  : 'sliding_controller2/Controller/ interaction sping-damper/human right'
//  '<S36>'  : 'sliding_controller2/Controller/ interaction sping-damper/left shank'
//  '<S37>'  : 'sliding_controller2/Controller/ interaction sping-damper/left thigh'
//  '<S38>'  : 'sliding_controller2/Controller/ interaction sping-damper/right shank'
//  '<S39>'  : 'sliding_controller2/Controller/ interaction sping-damper/right tight'
//  '<S40>'  : 'sliding_controller2/Controller/F->tau/Subsystem'
//  '<S41>'  : 'sliding_controller2/Controller/F->tau/Subsystem1'
//  '<S42>'  : 'sliding_controller2/Controller/F->tau/Subsystem/MATLAB Function'
//  '<S43>'  : 'sliding_controller2/Controller/F->tau/Subsystem/MATLAB Function1'
//  '<S44>'  : 'sliding_controller2/Controller/F->tau/Subsystem1/MATLAB Function'
//  '<S45>'  : 'sliding_controller2/Controller/F->tau/Subsystem1/MATLAB Function1'
//  '<S46>'  : 'sliding_controller2/Controller/F->tau1/Subsystem'
//  '<S47>'  : 'sliding_controller2/Controller/F->tau1/Subsystem1'
//  '<S48>'  : 'sliding_controller2/Controller/F->tau1/Subsystem/MATLAB Function'
//  '<S49>'  : 'sliding_controller2/Controller/F->tau1/Subsystem/MATLAB Function1'
//  '<S50>'  : 'sliding_controller2/Controller/F->tau1/Subsystem1/MATLAB Function'
//  '<S51>'  : 'sliding_controller2/Controller/F->tau1/Subsystem1/MATLAB Function1'
//  '<S52>'  : 'sliding_controller2/Controller/addmittance/MATLAB Function'
//  '<S53>'  : 'sliding_controller2/Controller/sliding mode controller/Call Service'
//  '<S54>'  : 'sliding_controller2/Controller/sliding mode controller/MATLAB Function1'
//  '<S55>'  : 'sliding_controller2/Controller/sliding mode controller/MATLAB Function2'
//  '<S56>'  : 'sliding_controller2/Controller/sliding mode controller/MATLAB Function3'
//  '<S57>'  : 'sliding_controller2/Enabled Subsystem/Publish1'
//  '<S58>'  : 'sliding_controller2/Enabled Subsystem/Publish2'
//  '<S59>'  : 'sliding_controller2/Subscribe/Enabled Subsystem'
//  '<S60>'  : 'sliding_controller2/Subscribe1/Enabled Subsystem'
//  '<S61>'  : 'sliding_controller2/Subscribe2/Enabled Subsystem'
//  '<S62>'  : 'sliding_controller2/Subscribe3/Enabled Subsystem'
//  '<S63>'  : 'sliding_controller2/Subscribe4/Enabled Subsystem'
//  '<S64>'  : 'sliding_controller2/Subscribe5/Enabled Subsystem'
//  '<S65>'  : 'sliding_controller2/Subscribe6/Enabled Subsystem'

#endif                                 // RTW_HEADER_sliding_controller2_h_

//
// File trailer for generated code.
//
// [EOF]
//
