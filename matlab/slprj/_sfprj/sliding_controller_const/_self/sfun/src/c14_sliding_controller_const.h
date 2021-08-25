#ifndef __c14_sliding_controller_const_h__
#define __c14_sliding_controller_const_h__

/* Forward Declarations */
struct SFc14_sliding_controller_constInstanceStruct;

/* Type Definitions */
#ifndef typedef_c14_sliding_controller_constStackData
#define typedef_c14_sliding_controller_constStackData

typedef struct {
} c14_sliding_controller_constStackData;

#endif                                 /* typedef_c14_sliding_controller_constStackData */

#ifndef struct_SFc14_sliding_controller_constInstanceStruct
#define struct_SFc14_sliding_controller_constInstanceStruct

struct SFc14_sliding_controller_constInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c14_is_active_c14_sliding_controller_const;
  uint8_T c14_JITStateAnimation[1];
  uint8_T c14_JITTransitionAnimation[1];
  void *c14_fEmlrtCtx;
  real_T (*c14_q)[2];
  real_T (*c14_y)[4];
};

#endif                                 /* struct_SFc14_sliding_controller_constInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c14_sliding_controller_const_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c14_sliding_controller_const_get_check_sum(mxArray *plhs[]);
extern void c14_sliding_controller_const_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
