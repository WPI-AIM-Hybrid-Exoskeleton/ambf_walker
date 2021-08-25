#ifndef __c13_sliding_controller_const_h__
#define __c13_sliding_controller_const_h__

/* Forward Declarations */
struct SFc13_sliding_controller_constInstanceStruct;

/* Type Definitions */
#ifndef typedef_c13_sliding_controller_constStackData
#define typedef_c13_sliding_controller_constStackData

typedef struct {
} c13_sliding_controller_constStackData;

#endif                                 /* typedef_c13_sliding_controller_constStackData */

#ifndef struct_SFc13_sliding_controller_constInstanceStruct
#define struct_SFc13_sliding_controller_constInstanceStruct

struct SFc13_sliding_controller_constInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c13_is_active_c13_sliding_controller_const;
  uint8_T c13_JITStateAnimation[1];
  uint8_T c13_JITTransitionAnimation[1];
  void *c13_fEmlrtCtx;
  real_T (*c13_q)[2];
  real_T (*c13_y)[4];
};

#endif                                 /* struct_SFc13_sliding_controller_constInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c13_sliding_controller_const_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c13_sliding_controller_const_get_check_sum(mxArray *plhs[]);
extern void c13_sliding_controller_const_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
