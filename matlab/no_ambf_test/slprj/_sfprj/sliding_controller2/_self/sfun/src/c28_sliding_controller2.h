#ifndef __c28_sliding_controller2_h__
#define __c28_sliding_controller2_h__

/* Forward Declarations */
struct SFc28_sliding_controller2InstanceStruct;

/* Type Definitions */
#ifndef typedef_c28_sliding_controller2StackData
#define typedef_c28_sliding_controller2StackData

typedef struct {
} c28_sliding_controller2StackData;

#endif                                 /* typedef_c28_sliding_controller2StackData */

#ifndef struct_SFc28_sliding_controller2InstanceStruct
#define struct_SFc28_sliding_controller2InstanceStruct

struct SFc28_sliding_controller2InstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c28_is_active_c28_sliding_controller2;
  uint8_T c28_JITStateAnimation[1];
  uint8_T c28_JITTransitionAnimation[1];
  void *c28_fEmlrtCtx;
  real_T (*c28_q)[2];
  real_T (*c28_y)[4];
};

#endif                                 /* struct_SFc28_sliding_controller2InstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c28_sliding_controller2_get_eml_resolved_functions_info
  ();

/* Function Definitions */
extern void sf_c28_sliding_controller2_get_check_sum(mxArray *plhs[]);
extern void c28_sliding_controller2_method_dispatcher(SimStruct *S, int_T method,
  void *data);

#endif
