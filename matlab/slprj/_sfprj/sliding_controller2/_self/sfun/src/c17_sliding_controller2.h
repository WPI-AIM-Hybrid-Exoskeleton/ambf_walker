#ifndef __c17_sliding_controller2_h__
#define __c17_sliding_controller2_h__
#include "MWCUSOLVERUtils.hpp"
#include "math_constants.h"

/* Forward Declarations */
struct SFc17_sliding_controller2InstanceStruct;

/* Type Definitions */
#ifndef typedef_c17_sliding_controller2StackData
#define typedef_c17_sliding_controller2StackData

typedef struct {
} c17_sliding_controller2StackData;

#endif                                 /* typedef_c17_sliding_controller2StackData */

#ifndef struct_SFc17_sliding_controller2InstanceStruct
#define struct_SFc17_sliding_controller2InstanceStruct

struct SFc17_sliding_controller2InstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c17_is_active_c17_sliding_controller2;
  uint8_T c17_JITStateAnimation[1];
  uint8_T c17_JITTransitionAnimation[1];
  void *c17_fEmlrtCtx;
  real_T (*c17_Kp0)[7];
  real_T (*c17_Kn0)[7];
  real_T (*c17_Bp0)[7];
  real_T (*c17_Bn0)[7];
  real_T (*c17_beta)[2];
  real_T (*c17_alpha)[2];
  real_T (*c17_Tid)[7];
  real_T (*c17_K)[49];
  real_T (*c17_Th)[7];
  real_T (*c17_qd)[7];
  real_T (*c17_B)[49];
  real_T (*c17_gpu_beta)[2];
  real_T (*c17_gpu_alpha)[2];
  real_T (*c17_gpu_B)[49];
  real_T (*c17_gpu_K)[49];
  real_T (*c17_gpu_Y)[49];
  int32_T *c17_gpu_info_t;
  real_T *c17_gpu_tau;
  real_T (*c17_b_gpu_B)[7];
  real_T (*c17_gpu_change)[49];
  int32_T (*c17_gpu_jpvt)[7];
  real_T (*c17_gpu_x)[7];
  real_T (*c17_b_gpu_x)[7];
  real_T (*c17_gpu_A)[7];
  ptrdiff_t (*c17_gpu_jpvt_t)[7];
  real_T (*c17_gpu_Bn0)[7];
  real_T (*c17_gpu_Th)[7];
  real_T (*c17_gpu_qd)[7];
  real_T (*c17_gpu_Tid)[7];
  real_T (*c17_b_gpu_Bn0)[49];
  real_T (*c17_gpu_Bp0)[7];
  real_T (*c17_b_gpu_Bp0)[49];
  real_T (*c17_gpu_Kn0)[7];
  real_T (*c17_b_gpu_Kn0)[49];
  real_T (*c17_gpu_Kp0)[7];
  real_T (*c17_b_gpu_Kp0)[49];
};

#endif                                 /* struct_SFc17_sliding_controller2InstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c17_sliding_controller2_get_eml_resolved_functions_info
  ();

/* Function Definitions */
extern void sf_c17_sliding_controller2_get_check_sum(mxArray *plhs[]);
extern void c17_sliding_controller2_method_dispatcher(SimStruct *S, int_T method,
  void *data);

#endif
