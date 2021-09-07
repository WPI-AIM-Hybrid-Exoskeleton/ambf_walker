#ifndef __c17_sliding_controller_rbdl_h__
#define __c17_sliding_controller_rbdl_h__
#include "MWCUSOLVERUtils.hpp"
#include "math_constants.h"

/* Forward Declarations */
struct SFc17_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c17_sliding_controller_rbdlStackData
#define typedef_c17_sliding_controller_rbdlStackData

typedef struct {
} c17_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c17_sliding_controller_rbdlStackData */

#ifndef struct_SFc17_sliding_controller_rbdlInstanceStruct
#define struct_SFc17_sliding_controller_rbdlInstanceStruct

struct SFc17_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c17_is_active_c17_sliding_controller_rbdl;
  uint8_T c17_JITStateAnimation[1];
  uint8_T c17_JITTransitionAnimation[1];
  void *c17_fEmlrtCtx;
  real_T (*c17_Kp0)[6];
  real_T (*c17_Kn0)[6];
  real_T (*c17_Bp0)[6];
  real_T (*c17_Bn0)[6];
  real_T (*c17_beta)[2];
  real_T (*c17_alpha)[2];
  real_T (*c17_Tid)[6];
  real_T (*c17_K)[36];
  real_T (*c17_Th)[6];
  real_T (*c17_qd)[6];
  real_T (*c17_B)[36];
  real_T (*c17_gpu_beta)[2];
  real_T (*c17_gpu_alpha)[2];
  real_T (*c17_gpu_B)[36];
  real_T (*c17_gpu_K)[36];
  real_T (*c17_gpu_Y)[36];
  int32_T *c17_gpu_info_t;
  real_T *c17_gpu_tau;
  real_T (*c17_b_gpu_B)[6];
  real_T (*c17_gpu_change)[36];
  int32_T (*c17_gpu_jpvt)[6];
  real_T (*c17_gpu_x)[6];
  real_T (*c17_b_gpu_x)[6];
  real_T (*c17_gpu_A)[6];
  ptrdiff_t (*c17_gpu_jpvt_t)[6];
  real_T (*c17_gpu_Bn0)[6];
  real_T (*c17_gpu_Th)[6];
  real_T (*c17_gpu_qd)[6];
  real_T (*c17_gpu_Tid)[6];
  real_T (*c17_b_gpu_Bn0)[36];
  real_T (*c17_gpu_Bp0)[6];
  real_T (*c17_b_gpu_Bp0)[36];
  real_T (*c17_gpu_Kn0)[6];
  real_T (*c17_b_gpu_Kn0)[36];
  real_T (*c17_gpu_Kp0)[6];
  real_T (*c17_b_gpu_Kp0)[36];
};

#endif                                 /* struct_SFc17_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c17_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c17_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c17_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
