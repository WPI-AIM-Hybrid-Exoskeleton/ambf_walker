#ifndef __c24_sliding_controller2_h__
#define __c24_sliding_controller2_h__

/* Forward Declarations */
struct SFc24_sliding_controller2InstanceStruct;

/* Type Definitions */
#ifndef typedef_c24_sliding_controller2StackData
#define typedef_c24_sliding_controller2StackData

typedef struct {
} c24_sliding_controller2StackData;

#endif                                 /* typedef_c24_sliding_controller2StackData */

#ifndef struct_SFc24_sliding_controller2InstanceStruct
#define struct_SFc24_sliding_controller2InstanceStruct

struct SFc24_sliding_controller2InstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c24_is_active_c24_sliding_controller2;
  uint8_T c24_JITStateAnimation[1];
  uint8_T c24_JITTransitionAnimation[1];
  void *c24_fEmlrtCtx;
  real_T (*c24_u)[6];
  real_T (*c24_y)[7];
  real_T (*c24_gpu_y)[7];
};

#endif                                 /* struct_SFc24_sliding_controller2InstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c24_sliding_controller2_get_eml_resolved_functions_info
  ();

/* Function Definitions */
extern void sf_c24_sliding_controller2_get_check_sum(mxArray *plhs[]);
extern void c24_sliding_controller2_method_dispatcher(SimStruct *S, int_T method,
  void *data);

#endif
