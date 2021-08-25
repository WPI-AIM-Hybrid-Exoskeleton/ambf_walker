//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: simple_PD.h
//
// Code generated for Simulink model 'simple_PD'.
//
// Model version                  : 1.14
// Simulink Coder version         : 9.5 (R2021a) 14-Nov-2020
// C/C++ source code generated on : Sun Aug 22 17:11:15 2021
//
// Target selection: ert.tlc
// Embedded hardware selection: Generic->Unspecified (assume 32-bit Generic)
// Code generation objectives: Unspecified
// Validation result: Not run
//
#ifndef RTW_HEADER_simple_PD_h_
#define RTW_HEADER_simple_PD_h_
#include <string.h>
#include <stddef.h>
#include "rtwtypes.h"
#include "slros_initialize.h"
#include "simple_PD_types.h"

// Macros for accessing real-time model data structure
#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

// Block signals (default storage)
struct B_simple_PD_T {
  SL_Bus_simple_PD_sensor_msgs_JointState In1;// '<S21>/In1'
  SL_Bus_simple_PD_sensor_msgs_JointState In1_i;// '<S5>/In1'
  SL_Bus_simple_PD_sensor_msgs_JointState BusAssignment3;// '<S3>/Bus Assignment3' 
  SL_Bus_simple_PD_sensor_msgs_JointState b_varargout_2;
  SL_Bus_simple_PD_std_msgs_Float32MultiArray BusAssignment;// '<S15>/Bus Assignment' 
  SL_Bus_simple_PD_std_msgs_String b_varargout_2_Name[16];
  SL_Bus_simple_PD_ambf_walker_DesiredJoints In1_b;// '<S6>/In1'
  SL_Bus_simple_PD_ambf_walker_DesiredJoints b_varargout_2_m;
  SL_Bus_simple_PD_std_msgs_Header BusAssignment1_m;// '<Root>/Bus Assignment1'
  uint8_T b_varargout_2_Header_FrameId[128];
  real_T filtered[7];                  // '<S15>/Add2'
  real_T b_varargout_2_Position[7];
  real_T b_varargout_2_Velocity[7];
  real_T b_varargout_2_Effort[7];
  char_T b_zeroDelimTopic[24];
  char_T b_zeroDelimTopic_c[21];
  SL_Bus_simple_PD_ros_time_Time rtb_CurrentTime_k;
  real_T b_varargout_2_Header_Stamp_Sec;
  real_T b_varargout_2_Header_Stamp_Nsec;
  SL_Bus_ROSVariableLengthArrayInfo b_varargout_2_Effort_SL_Info;
  SL_Bus_simple_PD_std_msgs_Bool In1_n;// '<S22>/In1'
};

// Block states (default storage) for system '<Root>'
struct DW_simple_PD_T {
  ros_slros_internal_block_Curr_T obj; // '<Root>/Current Time'
  ros_slroscpp_internal_block_P_T obj_g;// '<S19>/SinkBlock'
  ros_slroscpp_internal_block_P_T obj_o;// '<S18>/SinkBlock'
  ros_slroscpp_internal_block_P_T obj_h;// '<S14>/SinkBlock'
  ros_slroscpp_internal_block_P_T obj_h1;// '<S13>/SinkBlock'
  ros_slroscpp_internal_block_S_T obj_n;// '<S9>/SourceBlock'
  ros_slroscpp_internal_block_S_T obj_d;// '<S8>/SourceBlock'
  ros_slroscpp_internal_block_S_T obj_a;// '<S7>/SourceBlock'
};

// Parameters (default storage)
struct P_simple_PD_T_ {
  real_T Dm1[49];                      // Variable: Dm1
                                          //  Referenced by: '<S15>/human derative gain'

  real_T Km1[49];                      // Variable: Km1
                                          //  Referenced by: '<S15>/human proportional gain'

  SL_Bus_simple_PD_sensor_msgs_JointState Constant_Value;// Computed Parameter: Constant_Value
                                                            //  Referenced by: '<S1>/Constant'

  SL_Bus_simple_PD_sensor_msgs_JointState Constant_Value_p;// Computed Parameter: Constant_Value_p
                                                              //  Referenced by: '<S11>/Constant'

  SL_Bus_simple_PD_sensor_msgs_JointState exo_Y0;// Computed Parameter: exo_Y0
                                                    //  Referenced by: '<S5>/exo'

  SL_Bus_simple_PD_sensor_msgs_JointState Out1_Y0;// Computed Parameter: Out1_Y0
                                                     //  Referenced by: '<S21>/Out1'

  SL_Bus_simple_PD_sensor_msgs_JointState Constant_Value_e;// Computed Parameter: Constant_Value_e
                                                              //  Referenced by: '<S8>/Constant'

  SL_Bus_simple_PD_std_msgs_Float32MultiArray Constant_Value_j;// Computed Parameter: Constant_Value_j
                                                                  //  Referenced by: '<S17>/Constant'

  SL_Bus_simple_PD_ambf_walker_DesiredJoints exo_Y0_p;// Computed Parameter: exo_Y0_p
                                                         //  Referenced by: '<S6>/exo'

  SL_Bus_simple_PD_ambf_walker_DesiredJoints Out1_Y0_p;// Computed Parameter: Out1_Y0_p
                                                          //  Referenced by: '<S20>/Out1'

  SL_Bus_simple_PD_ambf_walker_DesiredJoints Constant_Value_jk;// Computed Parameter: Constant_Value_jk
                                                                  //  Referenced by: '<S7>/Constant'

  SL_Bus_simple_PD_std_msgs_Header Constant_Value_jz;// Computed Parameter: Constant_Value_jz
                                                        //  Referenced by: '<S2>/Constant'

  SL_Bus_simple_PD_std_msgs_Bool Constant_Value_g;// Computed Parameter: Constant_Value_g
                                                     //  Referenced by: '<S12>/Constant'

  SL_Bus_simple_PD_std_msgs_Bool Out1_Y0_d;// Computed Parameter: Out1_Y0_d
                                              //  Referenced by: '<S22>/Out1'

  SL_Bus_simple_PD_std_msgs_Bool Constant_Value_gu;// Computed Parameter: Constant_Value_gu
                                                      //  Referenced by: '<S9>/Constant'

  real_T exotau_Y0;                    // Computed Parameter: exotau_Y0
                                          //  Referenced by: '<S3>/exo tau'

  boolean_T Constant_Value_jv;         // Expression: true
                                          //  Referenced by: '<S3>/Constant'

};

// Real-time Model Data Structure
struct tag_RTM_simple_PD_T {
  const char_T *errorStatus;
};

// Block parameters (default storage)
#ifdef __cplusplus

extern "C" {

#endif

  extern P_simple_PD_T simple_PD_P;

#ifdef __cplusplus

}
#endif

// Block signals (default storage)
#ifdef __cplusplus

extern "C" {

#endif

  extern struct B_simple_PD_T simple_PD_B;

#ifdef __cplusplus

}
#endif

// Block states (default storage)
extern struct DW_simple_PD_T simple_PD_DW;

#ifdef __cplusplus

extern "C" {

#endif

  // Model entry point functions
  extern void simple_PD_initialize(void);
  extern void simple_PD_step(void);
  extern void simple_PD_terminate(void);

#ifdef __cplusplus

}
#endif

// Real-time Model object
#ifdef __cplusplus

extern "C" {

#endif

  extern RT_MODEL_simple_PD_T *const simple_PD_M;

#ifdef __cplusplus

}
#endif

//-
//  These blocks were eliminated from the model due to optimizations:
//
//  Block '<Root>/Constant' : Unused code path elimination
//  Block '<Root>/Constant1' : Unused code path elimination
//  Block '<S3>/Scope' : Unused code path elimination
//  Block '<Root>/To Workspace' : Unused code path elimination


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
//  '<Root>' : 'simple_PD'
//  '<S1>'   : 'simple_PD/Blank Message1'
//  '<S2>'   : 'simple_PD/Blank Message4'
//  '<S3>'   : 'simple_PD/Controller'
//  '<S4>'   : 'simple_PD/Enabled Subsystem'
//  '<S5>'   : 'simple_PD/Enabled Subsystem1'
//  '<S6>'   : 'simple_PD/Enabled Subsystem2'
//  '<S7>'   : 'simple_PD/Subscribe'
//  '<S8>'   : 'simple_PD/Subscribe1'
//  '<S9>'   : 'simple_PD/Subscribe4'
//  '<S10>'  : 'simple_PD/exo msg'
//  '<S11>'  : 'simple_PD/Controller/Blank Message2'
//  '<S12>'  : 'simple_PD/Controller/Blank Message5'
//  '<S13>'  : 'simple_PD/Controller/Publish1'
//  '<S14>'  : 'simple_PD/Controller/Publish2'
//  '<S15>'  : 'simple_PD/Controller/human controller'
//  '<S16>'  : 'simple_PD/Controller/human msg'
//  '<S17>'  : 'simple_PD/Controller/human controller/Blank Message'
//  '<S18>'  : 'simple_PD/Controller/human controller/Publish'
//  '<S19>'  : 'simple_PD/Enabled Subsystem/Publish1'
//  '<S20>'  : 'simple_PD/Subscribe/Enabled Subsystem'
//  '<S21>'  : 'simple_PD/Subscribe1/Enabled Subsystem'
//  '<S22>'  : 'simple_PD/Subscribe4/Enabled Subsystem'

#endif                                 // RTW_HEADER_simple_PD_h_

//
// File trailer for generated code.
//
// [EOF]
//
