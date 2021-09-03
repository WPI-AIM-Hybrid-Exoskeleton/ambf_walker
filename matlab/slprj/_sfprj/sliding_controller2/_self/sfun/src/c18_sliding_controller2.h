#ifndef __c18_sliding_controller2_h__
#define __c18_sliding_controller2_h__

/* Forward Declarations */
struct SFc18_sliding_controller2InstanceStruct;

/* Type Definitions */
#ifndef typedef_c18_sliding_controller2StackData
#define typedef_c18_sliding_controller2StackData

typedef struct {
} c18_sliding_controller2StackData;

#endif                                 /* typedef_c18_sliding_controller2StackData */

#ifndef struct_SFc18_sliding_controller2InstanceStruct
#define struct_SFc18_sliding_controller2InstanceStruct

struct SFc18_sliding_controller2InstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c18_is_active_c18_sliding_controller2;
  uint8_T c18_JITStateAnimation[1];
  uint8_T c18_JITTransitionAnimation[1];
  void *c18_fEmlrtCtx;
  real_T (*c18_u)[7];
  real_T (*c18_y)[7];
};

#endif                                 /* struct_SFc18_sliding_controller2InstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c18_sliding_controller2_get_eml_resolved_functions_info
  ();

/* Function Definitions */
extern void sf_c18_sliding_controller2_get_check_sum(mxArray *plhs[]);
extern void c18_sliding_controller2_method_dispatcher(SimStruct *S, int_T method,
  void *data);

#endif
