#ifndef __c7_sliding_controller_const_h__
#define __c7_sliding_controller_const_h__

/* Forward Declarations */
struct SFc7_sliding_controller_constInstanceStruct;

/* Type Definitions */
#ifndef typedef_c7_sliding_controller_constStackData
#define typedef_c7_sliding_controller_constStackData

typedef struct {
} c7_sliding_controller_constStackData;

#endif                                 /* typedef_c7_sliding_controller_constStackData */

#ifndef struct_SFc7_sliding_controller_constInstanceStruct
#define struct_SFc7_sliding_controller_constInstanceStruct

struct SFc7_sliding_controller_constInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c7_is_active_c7_sliding_controller_const;
  uint8_T c7_JITStateAnimation[1];
  uint8_T c7_JITTransitionAnimation[1];
  void *c7_fEmlrtCtx;
  real_T (*c7_q)[2];
  real_T (*c7_y)[4];
};

#endif                                 /* struct_SFc7_sliding_controller_constInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c7_sliding_controller_const_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c7_sliding_controller_const_get_check_sum(mxArray *plhs[]);
extern void c7_sliding_controller_const_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
