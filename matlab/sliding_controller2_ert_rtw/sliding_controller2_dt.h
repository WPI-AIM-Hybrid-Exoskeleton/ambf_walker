/*
 * sliding_controller2_dt.h
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

#include "ext_types.h"

/* data type size table */
static uint_T rtDataTypeSizes[] = {
  sizeof(real_T),
  sizeof(real32_T),
  sizeof(int8_T),
  sizeof(uint8_T),
  sizeof(int16_T),
  sizeof(uint16_T),
  sizeof(int32_T),
  sizeof(uint32_T),
  sizeof(boolean_T),
  sizeof(fcn_call_T),
  sizeof(int_T),
  sizeof(void*),
  sizeof(action_T),
  2*sizeof(uint32_T),
  sizeof(SL_Bus_sliding_controller2_std_msgs_Float32),
  sizeof(SL_Bus_sliding_controller2_ros_time_Time),
  sizeof(SL_Bus_ROSVariableLengthArrayInfo),
  sizeof(SL_Bus_sliding_controller2_std_msgs_Header),
  sizeof(SL_Bus_sliding_controller2_std_msgs_String),
  sizeof(SL_Bus_sliding_controller2_sensor_msgs_JointState),
  sizeof(SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex),
  sizeof(SL_Bus_sliding_controller2_RBDLInverseDynamicsRespon_9vsb2h),
  sizeof(SL_Bus_sliding_controller2_ambf_walker_DesiredJoints),
  sizeof(ros_slroscpp_internal_block_S_T),
  sizeof(ros_slroscpp_internal_block_P_T),
  sizeof(ExampleHelperSimulationRateCo_T),
  sizeof(ros_slroscpp_internal_block_k_T)
};

/* data type name table */
static const char_T * rtDataTypeNames[] = {
  "real_T",
  "real32_T",
  "int8_T",
  "uint8_T",
  "int16_T",
  "uint16_T",
  "int32_T",
  "uint32_T",
  "boolean_T",
  "fcn_call_T",
  "int_T",
  "pointer_T",
  "action_T",
  "timer_uint32_pair_T",
  "SL_Bus_sliding_controller2_std_msgs_Float32",
  "SL_Bus_sliding_controller2_ros_time_Time",
  "SL_Bus_ROSVariableLengthArrayInfo",
  "SL_Bus_sliding_controller2_std_msgs_Header",
  "SL_Bus_sliding_controller2_std_msgs_String",
  "SL_Bus_sliding_controller2_sensor_msgs_JointState",
  "SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex",
  "SL_Bus_sliding_controller2_RBDLInverseDynamicsRespon_9vsb2h",
  "SL_Bus_sliding_controller2_ambf_walker_DesiredJoints",
  "ros_slroscpp_internal_block_S_T",
  "ros_slroscpp_internal_block_P_T",
  "ExampleHelperSimulationRateCo_T",
  "ros_slroscpp_internal_block_k_T"
};

/* data type transitions for block I/O structure */
static DataTypeTransition rtBTransitions[] = {
  { (char_T *)(&sliding_controller2_B.msg), 19, 0, 3 },

  { (char_T *)(&sliding_controller2_B.In1_a), 22, 0, 1 },

  { (char_T *)(&sliding_controller2_B.msg_o), 20, 0, 1 },

  { (char_T *)(&sliding_controller2_B.qd_add[0]), 0, 0, 126 },

  { (char_T *)(&sliding_controller2_B.Add[0]), 0, 0, 11 },

  { (char_T *)(&sliding_controller2_B.SourceBlock_o1), 8, 0, 3 },

  { (char_T *)(&sliding_controller2_B.EnabledSubsystem_i.In1), 19, 0, 1 },

  { (char_T *)(&sliding_controller2_B.EnabledSubsystem_l.In1), 19, 0, 1 },

  { (char_T *)(&sliding_controller2_B.sf_MATLABFunction1_je.y[0]), 0, 0, 4 },

  { (char_T *)(&sliding_controller2_B.sf_MATLABFunction_a.y[0]), 0, 0, 4 },

  { (char_T *)(&sliding_controller2_B.sf_MATLABFunction1_j.y[0]), 0, 0, 4 },

  { (char_T *)(&sliding_controller2_B.sf_MATLABFunction_p.y[0]), 0, 0, 4 },

  { (char_T *)(&sliding_controller2_B.sf_MATLABFunction1_h.y[0]), 0, 0, 4 },

  { (char_T *)(&sliding_controller2_B.sf_MATLABFunction_o.y[0]), 0, 0, 4 },

  { (char_T *)(&sliding_controller2_B.sf_MATLABFunction1.y[0]), 0, 0, 4 },

  { (char_T *)(&sliding_controller2_B.sf_MATLABFunction.y[0]), 0, 0, 4 },

  { (char_T *)(&sliding_controller2_B.sf_humanright.knee[0]), 0, 0, 8 },

  { (char_T *)(&sliding_controller2_B.sf_humanleft.knee[0]), 0, 0, 8 },

  { (char_T *)(&sliding_controller2_B.sf_exoright.knee[0]), 0, 0, 8 },

  { (char_T *)(&sliding_controller2_B.sf_exoleft.knee[0]), 0, 0, 8 }
  ,

  { (char_T *)(&sliding_controller2_DW.obj), 23, 0, 1 },

  { (char_T *)(&sliding_controller2_DW.obj_m), 24, 0, 3 },

  { (char_T *)(&sliding_controller2_DW.obj_h), 26, 0, 3 },

  { (char_T *)(&sliding_controller2_DW.obj_k), 25, 0, 1 },

  { (char_T *)(&sliding_controller2_DW.EnabledSubsystem_SubsysRanBC), 2, 0, 5 },

  { (char_T *)(&sliding_controller2_DW.objisempty), 8, 0, 10 },

  { (char_T *)
    (&sliding_controller2_DW.EnabledSubsystem_i.EnabledSubsystem_SubsysRanBC), 2,
    0, 1 },

  { (char_T *)
    (&sliding_controller2_DW.EnabledSubsystem_l.EnabledSubsystem_SubsysRanBC), 2,
    0, 1 }
};

/* data type transition table for block I/O structure */
static DataTypeTransitionTable rtBTransTable = {
  28U,
  rtBTransitions
};

/* data type transitions for Parameters structure */
static DataTypeTransition rtPTransitions[] = {
  { (char_T *)(&sliding_controller2_P.Km1[0]), 0, 0, 206 },

  { (char_T *)(&sliding_controller2_P.Constant_Value), 19, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_d), 19, 0, 1 },

  { (char_T *)(&sliding_controller2_P.exo_Y0), 19, 0, 1 },

  { (char_T *)(&sliding_controller2_P.human_Y0), 19, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_a), 19, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_j), 19, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Out1_Y0), 22, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_b), 22, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_e), 20, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_bi), 21, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_o), 14, 0, 1 },

  { (char_T *)(&sliding_controller2_P.exotau_Y0), 0, 0, 21 },

  { (char_T *)(&sliding_controller2_P.EnabledSubsystem_i.Out1_Y0), 19, 0, 1 },

  { (char_T *)(&sliding_controller2_P.EnabledSubsystem_l.Out1_Y0), 19, 0, 1 }
  ,

  { (char_T *)(Dm1), 0, 0, 49 }
};

/* data type transition table for Parameters structure */
static DataTypeTransitionTable rtPTransTable = {
  16U,
  rtPTransitions
};

/* [EOF] sliding_controller2_dt.h */
