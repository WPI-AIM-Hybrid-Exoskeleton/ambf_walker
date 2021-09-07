//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: sliding_controller2.h
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
#ifndef RTW_HEADER_sliding_controller2_h_
#define RTW_HEADER_sliding_controller2_h_
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

// Shared type includes
#include "multiword_types.h"
#include "rtGetNaN.h"
#include "rt_nonfinite.h"
#include "rtGetInf.h"

// Macros for accessing real-time model data structure
#ifndef rtmGetFinalTime
#define rtmGetFinalTime(rtm)           ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetRTWExtModeInfo
#define rtmGetRTWExtModeInfo(rtm)      ((rtm)->extModeInfo)
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

// Block signals (default storage)
struct B_sliding_controller2_T {
  SL_Bus_sliding_controller2_sensor_msgs_JointState In1;// '<S25>/In1'
  SL_Bus_sliding_controller2_sensor_msgs_JointState In1_n;// '<S24>/In1'
  SL_Bus_sliding_controller2_sensor_msgs_JointState In1_e;// '<S9>/In1'
  SL_Bus_sliding_controller2_sensor_msgs_JointState In1_j;// '<S8>/In1'
  SL_Bus_sliding_controller2_sensor_msgs_JointState msg_n;// '<Root>/exo msg'
  SL_Bus_sliding_controller2_sensor_msgs_JointState msg;// '<Root>/human msg'
  SL_Bus_sliding_controller2_sensor_msgs_JointState b_varargout_2;
  SL_Bus_sliding_controller2_sensor_msgs_JointState b_varargout_2_m;
  SL_Bus_sliding_controller2_std_msgs_String b_varargout_2_Name[16];
  SL_Bus_sliding_controller2_ambf_walker_DesiredJoints In1_a;// '<S23>/In1'
  SL_Bus_sliding_controller2_ambf_walker_DesiredJoints b_varargout_2_c;
  SL_Bus_sliding_controller2_std_msgs_Header BusAssignment1_m;// '<Root>/Bus Assignment1' 
  uint8_T b_varargout_2_Header_FrameId[128];
  real_T OutportBufferForexotau[7];
  real_T OutportBufferForhumantau[7];
  real_T b_varargout_2_Effort[7];
  real_T Q[6];
  real_T Other[6];
  real_T Position[6];
  real_T Velocity[6];
  real_T b_varargout_2_Position[6];
  real_T b_varargout_2_Velocity[6];
  char_T b_zeroDelimTopic[24];
  char_T b_zeroDelimTopic_k[23];
  char_T b_zeroDelimTopic_c[21];
  char_T b_zeroDelimTopic_b[18];
  SL_Bus_sliding_controller2_ros_time_Time rtb_CurrentTime_p;
  real_T b_varargout_2_Header_Stamp_Sec;
  real_T b_varargout_2_Header_Stamp_Nsec;
  SL_Bus_sliding_controller2_std_msgs_Float64 BusAssignment_m;// '<Root>/Bus Assignment' 
  SL_Bus_sliding_controller2_std_msgs_Bool In1_k;// '<S26>/In1'
};

// Block states (default storage) for system '<Root>'
struct DW_sliding_controller2_T {
  ros_slros_internal_block_Curr_T obj; // '<Root>/Current Time'
  ros_slroscpp_internal_block_P_T obj_m;// '<S11>/SinkBlock'
  ros_slroscpp_internal_block_P_T obj_mp;// '<S22>/SinkBlock'
  ros_slroscpp_internal_block_P_T obj_n;// '<S21>/SinkBlock'
  ros_slroscpp_internal_block_P_T obj_o;// '<S20>/SinkBlock'
  ros_slroscpp_internal_block_S_T obj_c;// '<S15>/SourceBlock'
  ros_slroscpp_internal_block_S_T obj_h;// '<S14>/SourceBlock'
  ros_slroscpp_internal_block_S_T obj_cg;// '<S13>/SourceBlock'
  ros_slroscpp_internal_block_S_T obj_g;// '<S12>/SourceBlock'
  ros_slroscpp_internal_block_k_T obj_i;// '<S30>/ServiceCaller'
  ros_slroscpp_internal_block_k_T obj_b;// '<S29>/ServiceCaller'
  struct {
    void *LoggedData;
  } ToWorkspace_PWORK;                 // '<Root>/To Workspace'

  struct {
    void *LoggedData;
  } Scope1_PWORK;                      // '<S6>/Scope1'

  struct {
    void *LoggedData;
  } Scope2_PWORK;                      // '<S6>/Scope2'

  struct {
    void *LoggedData;
  } Scope_PWORK;                       // '<S6>/Scope'

  struct {
    void *LoggedData;
  } Scope3_PWORK;                      // '<S6>/Scope3'

  int8_T IfActionSubsystem_SubsysRanBC;// '<S16>/If Action Subsystem'
  int8_T EnabledSubsystem_SubsysRanBC; // '<S15>/Enabled Subsystem'
  int8_T EnabledSubsystem_SubsysRanBC_i;// '<S14>/Enabled Subsystem'
  int8_T EnabledSubsystem_SubsysRanBC_o;// '<S13>/Enabled Subsystem'
  int8_T EnabledSubsystem_SubsysRanBC_g;// '<S12>/Enabled Subsystem'
  int8_T EnabledSubsystem2_SubsysRanBC;// '<Root>/Enabled Subsystem2'
  int8_T EnabledSubsystem1_SubsysRanBC;// '<Root>/Enabled Subsystem1'
  int8_T EnabledSubsystem_SubsysRanBC_c;// '<Root>/Enabled Subsystem'
  int8_T Controller_SubsysRanBC;       // '<Root>/Controller'
};

// Parameters (default storage)
struct P_sliding_controller2_T_ {
  SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value;// Computed Parameter: Constant_Value
                                                                      //  Referenced by: '<S2>/Constant'

  SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value_d;// Computed Parameter: Constant_Value_d
                                                                      //  Referenced by: '<S3>/Constant'

  SL_Bus_sliding_controller2_sensor_msgs_JointState exo_Y0;// Computed Parameter: exo_Y0
                                                              //  Referenced by: '<S8>/exo'

  SL_Bus_sliding_controller2_sensor_msgs_JointState human_Y0;// Computed Parameter: human_Y0
                                                                //  Referenced by: '<S9>/human'

  SL_Bus_sliding_controller2_sensor_msgs_JointState Out1_Y0;// Computed Parameter: Out1_Y0
                                                               //  Referenced by: '<S24>/Out1'

  SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value_a;// Computed Parameter: Constant_Value_a
                                                                      //  Referenced by: '<S13>/Constant'

  SL_Bus_sliding_controller2_sensor_msgs_JointState Out1_Y0_f;// Computed Parameter: Out1_Y0_f
                                                                 //  Referenced by: '<S25>/Out1'

  SL_Bus_sliding_controller2_sensor_msgs_JointState Constant_Value_j;// Computed Parameter: Constant_Value_j
                                                                      //  Referenced by: '<S14>/Constant'

  SL_Bus_sliding_controller2_ambf_walker_DesiredJoints Out1_Y0_i;// Computed Parameter: Out1_Y0_i
                                                                    //  Referenced by: '<S23>/Out1'

  SL_Bus_sliding_controller2_ambf_walker_DesiredJoints Constant_Value_b;// Computed Parameter: Constant_Value_b
                                                                      //  Referenced by: '<S12>/Constant'

  SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex Constant_Value_e;// Computed Parameter: Constant_Value_e
                                                                      //  Referenced by: '<S4>/Constant'

  SL_Bus_sliding_controller2_std_msgs_Header Constant_Value_i;// Computed Parameter: Constant_Value_i
                                                                 //  Referenced by: '<S5>/Constant'

  SL_Bus_sliding_controller2_std_srvs_SetBoolResponse Constant_Value_f;// Computed Parameter: Constant_Value_f
                                                                      //  Referenced by: '<S29>/Constant'

  SL_Bus_sliding_controller2_std_srvs_SetBoolResponse Constant_Value_dy;// Computed Parameter: Constant_Value_dy
                                                                      //  Referenced by: '<S30>/Constant'

  SL_Bus_sliding_controller2_std_srvs_SetBoolResponse
    exointernalcontrollerstate_Y0;
                            // Computed Parameter: exointernalcontrollerstate_Y0
                               //  Referenced by: '<S27>/exo internal controller state'

  SL_Bus_sliding_controller2_std_srvs_SetBoolResponse
    humaninternalcontrollerstate1_Y;
                          // Computed Parameter: humaninternalcontrollerstate1_Y
                             //  Referenced by: '<S27>/human internal controller state1'

  SL_Bus_sliding_controller2_std_msgs_Bool Constant_Value_p;// Computed Parameter: Constant_Value_p
                                                               //  Referenced by: '<S19>/Constant'

  SL_Bus_sliding_controller2_std_msgs_Bool Out1_Y0_d;// Computed Parameter: Out1_Y0_d
                                                        //  Referenced by: '<S26>/Out1'

  SL_Bus_sliding_controller2_std_msgs_Bool Constant_Value_ea;// Computed Parameter: Constant_Value_ea
                                                                //  Referenced by: '<S15>/Constant'

  SL_Bus_sliding_controller2_std_msgs_Float64 Constant_Value_o;// Computed Parameter: Constant_Value_o
                                                                  //  Referenced by: '<S1>/Constant'

  SL_Bus_sliding_controller2_std_srvs_SetBoolRequest Constant_Value_g;// Computed Parameter: Constant_Value_g
                                                                      //  Referenced by: '<S28>/Constant'

  boolean_T Constant_Value_i1;         // Expression: true
                                          //  Referenced by: '<S6>/Constant'

  boolean_T Constant_Value_op;         // Expression: false
                                          //  Referenced by: '<S16>/Constant'

};

// Real-time Model Data Structure
struct tag_RTM_sliding_controller2_T {
  const char_T *errorStatus;
  RTWExtModeInfo *extModeInfo;
  RTWSolverInfo solverInfo;

  //
  //  Sizes:
  //  The following substructure contains sizes information
  //  for many of the model attributes such as inputs, outputs,
  //  dwork, sample times, etc.

  struct {
    uint32_T checksums[4];
  } Sizes;

  //
  //  SpecialInfo:
  //  The following substructure contains special information
  //  related to other components that are dependent on RTW.

  struct {
    const void *mappingInfo;
  } SpecialInfo;

  //
  //  Timing:
  //  The following substructure contains information regarding
  //  the timing information for the model.

  struct {
    uint32_T clockTick0;
    time_T stepSize0;
    uint32_T clockTick1;
    time_T tFinal;
    SimTimeStep simTimeStep;
    boolean_T stopRequestedFlag;
    time_T *t;
    time_T tArray[2];
  } Timing;
};

// Block parameters (default storage)
#ifdef __cplusplus

extern "C" {

#endif

  extern P_sliding_controller2_T sliding_controller2_P;

#ifdef __cplusplus

}
#endif

// Block signals (default storage)
#ifdef __cplusplus

extern "C" {

#endif

  extern struct B_sliding_controller2_T sliding_controller2_B;

#ifdef __cplusplus

}
#endif

// Block states (default storage)
extern struct DW_sliding_controller2_T sliding_controller2_DW;

#ifdef __cplusplus

extern "C" {

#endif

  // Model entry point functions
  extern void sliding_controller2_initialize(void);
  extern void sliding_controller2_step(void);
  extern void sliding_controller2_terminate(void);

#ifdef __cplusplus

}
#endif

// Real-time Model object
#ifdef __cplusplus

extern "C" {

#endif

  extern RT_MODEL_sliding_controller2_T *const sliding_controller2_M;

#ifdef __cplusplus

}
#endif

//-
//  These blocks were eliminated from the model due to optimizations:
//
//  Block '<Root>/Sine Wave Function' : Unused code path elimination
//  Block '<Root>/Data Type Conversion' : Eliminate redundant data type conversion
//  Block '<S16>/Data Type Conversion' : Eliminate redundant data type conversion


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
//  '<S1>'   : 'sliding_controller2/Blank Message'
//  '<S2>'   : 'sliding_controller2/Blank Message1'
//  '<S3>'   : 'sliding_controller2/Blank Message2'
//  '<S4>'   : 'sliding_controller2/Blank Message3'
//  '<S5>'   : 'sliding_controller2/Blank Message4'
//  '<S6>'   : 'sliding_controller2/Controller'
//  '<S7>'   : 'sliding_controller2/Enabled Subsystem'
//  '<S8>'   : 'sliding_controller2/Enabled Subsystem1'
//  '<S9>'   : 'sliding_controller2/Enabled Subsystem2'
//  '<S10>'  : 'sliding_controller2/MATLAB Function - String Array Assign'
//  '<S11>'  : 'sliding_controller2/Publish'
//  '<S12>'  : 'sliding_controller2/Subscribe'
//  '<S13>'  : 'sliding_controller2/Subscribe1'
//  '<S14>'  : 'sliding_controller2/Subscribe2'
//  '<S15>'  : 'sliding_controller2/Subscribe4'
//  '<S16>'  : 'sliding_controller2/Subsystem1'
//  '<S17>'  : 'sliding_controller2/exo msg'
//  '<S18>'  : 'sliding_controller2/human msg'
//  '<S19>'  : 'sliding_controller2/Controller/Blank Message5'
//  '<S20>'  : 'sliding_controller2/Controller/Publish1'
//  '<S21>'  : 'sliding_controller2/Enabled Subsystem/Publish1'
//  '<S22>'  : 'sliding_controller2/Enabled Subsystem/Publish2'
//  '<S23>'  : 'sliding_controller2/Subscribe/Enabled Subsystem'
//  '<S24>'  : 'sliding_controller2/Subscribe1/Enabled Subsystem'
//  '<S25>'  : 'sliding_controller2/Subscribe2/Enabled Subsystem'
//  '<S26>'  : 'sliding_controller2/Subscribe4/Enabled Subsystem'
//  '<S27>'  : 'sliding_controller2/Subsystem1/If Action Subsystem'
//  '<S28>'  : 'sliding_controller2/Subsystem1/If Action Subsystem/Blank Message'
//  '<S29>'  : 'sliding_controller2/Subsystem1/If Action Subsystem/Call Service'
//  '<S30>'  : 'sliding_controller2/Subsystem1/If Action Subsystem/Call Service1'

#endif                                 // RTW_HEADER_sliding_controller2_h_

//
// File trailer for generated code.
//
// [EOF]
//
