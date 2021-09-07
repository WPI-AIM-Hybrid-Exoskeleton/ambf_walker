#ifndef __c12_sliding_controller2_h__
#define __c12_sliding_controller2_h__

/* Forward Declarations */
struct SFc12_sliding_controller2InstanceStruct;

/* Type Definitions */
#ifndef typedef_c12_sliding_controller2StackData
#define typedef_c12_sliding_controller2StackData

typedef struct {
} c12_sliding_controller2StackData;

#endif                                 /* typedef_c12_sliding_controller2StackData */

#ifndef struct_SFc12_sliding_controller2InstanceStruct
#define struct_SFc12_sliding_controller2InstanceStruct

struct SFc12_sliding_controller2InstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c12_is_active_c12_sliding_controller2;
  uint8_T c12_JITStateAnimation[1];
  uint8_T c12_JITTransitionAnimation[1];
  void *c12_fEmlrtCtx;
  real_T (*c12_q)[2];
  real_T (*c12_y)[4];
};

#endif                                 /* struct_SFc12_sliding_controller2InstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c12_sliding_controller2_get_eml_resolved_functions_info
  ();

/* Function Definitions */
extern void sf_c12_sliding_controller2_get_check_sum(mxArray *plhs[]);
extern void c12_sliding_controller2_method_dispatcher(SimStruct *S, int_T method,
  void *data);

#endif
