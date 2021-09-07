//
//  sliding_controller2_dt.h
//
//  Academic License - for use in teaching, academic research, and meeting
//  course requirements at degree granting institutions only.  Not for
//  government, commercial, or other organizational use.
//
//  Code generation for model "sliding_controller2".
//
//  Model version              : 1.235
//  Simulink Coder version : 9.5 (R2021a) 14-Nov-2020
//  C++ source code generated on : Tue Sep  7 08:34:51 2021
//
//  Target selection: ert.tlc
//  Embedded hardware selection: Generic->Unspecified (assume 32-bit Generic)
//  Code generation objectives: Unspecified
//  Validation result: Not run


#include "ext_types.h"

// data type size table
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
  sizeof(SL_Bus_sliding_controller2_std_msgs_Float64),
  sizeof(SL_Bus_sliding_controller2_ros_time_Time),
  sizeof(SL_Bus_ROSVariableLengthArrayInfo),
  sizeof(SL_Bus_sliding_controller2_std_msgs_Header),
  sizeof(SL_Bus_sliding_controller2_std_msgs_String),
  sizeof(SL_Bus_sliding_controller2_sensor_msgs_JointState),
  sizeof(SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex),
  sizeof(SL_Bus_sliding_controller2_std_msgs_Bool),
  sizeof(SL_Bus_sliding_controller2_ambf_walker_DesiredJoints),
  sizeof(SL_Bus_sliding_controller2_std_srvs_SetBoolRequest),
  sizeof(SL_Bus_sliding_controller2_std_srvs_SetBoolResponse),
  sizeof(ros_slroscpp_internal_block_P_T),
  sizeof(ros_slros_internal_block_Curr_T),
  sizeof(ExampleHelperSimulationRateCo_T),
  sizeof(ros_slroscpp_internal_block_S_T),
  sizeof(ros_slroscpp_internal_block_k_T)
};

// data type name table
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
  "SL_Bus_sliding_controller2_std_msgs_Float64",
  "SL_Bus_sliding_controller2_ros_time_Time",
  "SL_Bus_ROSVariableLengthArrayInfo",
  "SL_Bus_sliding_controller2_std_msgs_Header",
  "SL_Bus_sliding_controller2_std_msgs_String",
  "SL_Bus_sliding_controller2_sensor_msgs_JointState",
  "SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex",
  "SL_Bus_sliding_controller2_std_msgs_Bool",
  "SL_Bus_sliding_controller2_ambf_walker_DesiredJoints",
  "SL_Bus_sliding_controller2_std_srvs_SetBoolRequest",
  "SL_Bus_sliding_controller2_std_srvs_SetBoolResponse",
  "ros_slroscpp_internal_block_P_T",
  "ros_slros_internal_block_Curr_T",
  "ExampleHelperSimulationRateCo_T",
  "ros_slroscpp_internal_block_S_T",
  "ros_slroscpp_internal_block_k_T"
};

// data type transitions for block I/O structure
static DataTypeTransition rtBTransitions[] = {
  { (char_T *)(&sliding_controller2_B.In1), 19, 0, 4 },

  { (char_T *)(&sliding_controller2_B.In1_a), 22, 0, 1 },

  { (char_T *)(&sliding_controller2_B.OutportBufferForexotau[0]), 0, 0, 14 },

  { (char_T *)(&sliding_controller2_B.Q[0]), 0, 0, 24 },

  { (char_T *)(&sliding_controller2_B.In1_k), 21, 0, 1 }
  ,

  { (char_T *)(&sliding_controller2_DW.obj), 26, 0, 1 },

  { (char_T *)(&sliding_controller2_DW.obj_m), 25, 0, 4 },

  { (char_T *)(&sliding_controller2_DW.obj_c), 28, 0, 4 },

  { (char_T *)(&sliding_controller2_DW.obj_i), 29, 0, 2 },

  { (char_T *)(&sliding_controller2_DW.ToWorkspace_PWORK.LoggedData), 11, 0, 5 },

  { (char_T *)(&sliding_controller2_DW.IfActionSubsystem_SubsysRanBC), 2, 0, 9 }
};

// data type transition table for block I/O structure
static DataTypeTransitionTable rtBTransTable = {
  11U,
  rtBTransitions
};

// data type transitions for Parameters structure
static DataTypeTransition rtPTransitions[] = {
  { (char_T *)(&sliding_controller2_P.Constant_Value), 19, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_d), 19, 0, 1 },

  { (char_T *)(&sliding_controller2_P.exo_Y0), 19, 0, 1 },

  { (char_T *)(&sliding_controller2_P.human_Y0), 19, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Out1_Y0), 19, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_a), 19, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Out1_Y0_f), 19, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_j), 19, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Out1_Y0_i), 22, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_b), 22, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_e), 20, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_i), 17, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_f), 24, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_dy), 24, 0, 1 },

  { (char_T *)(&sliding_controller2_P.exointernalcontrollerstate_Y0), 24, 0, 1 },

  { (char_T *)(&sliding_controller2_P.humaninternalcontrollerstate1_Y), 24, 0, 1
  },

  { (char_T *)(&sliding_controller2_P.Constant_Value_p), 21, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Out1_Y0_d), 21, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_ea), 21, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_o), 14, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_g), 23, 0, 1 },

  { (char_T *)(&sliding_controller2_P.Constant_Value_i1), 8, 0, 2 }
};

// data type transition table for Parameters structure
static DataTypeTransitionTable rtPTransTable = {
  22U,
  rtPTransitions
};

// [EOF] sliding_controller2_dt.h
