#ifndef __c23_sliding_controller2_h__
#define __c23_sliding_controller2_h__

/* Forward Declarations */
struct SFc23_sliding_controller2InstanceStruct;

/* Type Definitions */
#ifndef typedef_c23_sliding_controller2StackData
#define typedef_c23_sliding_controller2StackData

typedef struct {
} c23_sliding_controller2StackData;

#endif                                 /* typedef_c23_sliding_controller2StackData */

#ifndef struct_SFc23_sliding_controller2InstanceStruct
#define struct_SFc23_sliding_controller2InstanceStruct

struct SFc23_sliding_controller2InstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c23_is_active_c23_sliding_controller2;
  uint8_T c23_JITStateAnimation[1];
  uint8_T c23_JITTransitionAnimation[1];
  void *c23_fEmlrtCtx;
  real_T (*c23_u)[7];
  real_T (*c23_y)[7];
};

#endif                                 /* struct_SFc23_sliding_controller2InstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c23_sliding_controller2_get_eml_resolved_functions_info
  ();

/* Function Definitions */
extern void sf_c23_sliding_controller2_get_check_sum(mxArray *plhs[]);
extern void c23_sliding_controller2_method_dispatcher(SimStruct *S, int_T method,
  void *data);

#endif
