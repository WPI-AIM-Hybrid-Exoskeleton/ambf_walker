#ifndef __c22_sliding_controller2_h__
#define __c22_sliding_controller2_h__

/* Forward Declarations */
struct SFc22_sliding_controller2InstanceStruct;

/* Type Definitions */
#ifndef typedef_c22_sliding_controller2StackData
#define typedef_c22_sliding_controller2StackData

typedef struct {
} c22_sliding_controller2StackData;

#endif                                 /* typedef_c22_sliding_controller2StackData */

#ifndef struct_SFc22_sliding_controller2InstanceStruct
#define struct_SFc22_sliding_controller2InstanceStruct

struct SFc22_sliding_controller2InstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c22_is_active_c22_sliding_controller2;
  uint8_T c22_JITStateAnimation[1];
  uint8_T c22_JITTransitionAnimation[1];
  void *c22_fEmlrtCtx;
  real_T (*c22_u)[7];
  real_T (*c22_y)[7];
};

#endif                                 /* struct_SFc22_sliding_controller2InstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c22_sliding_controller2_get_eml_resolved_functions_info
  ();

/* Function Definitions */
extern void sf_c22_sliding_controller2_get_check_sum(mxArray *plhs[]);
extern void c22_sliding_controller2_method_dispatcher(SimStruct *S, int_T method,
  void *data);

#endif
