#ifndef __c10_sliding_controller_const_h__
#define __c10_sliding_controller_const_h__

/* Forward Declarations */
struct SFc10_sliding_controller_constInstanceStruct;

/* Type Definitions */
#ifndef typedef_c10_sliding_controller_constStackData
#define typedef_c10_sliding_controller_constStackData

typedef struct {
} c10_sliding_controller_constStackData;

#endif                                 /* typedef_c10_sliding_controller_constStackData */

#ifndef struct_SFc10_sliding_controller_constInstanceStruct
#define struct_SFc10_sliding_controller_constInstanceStruct

struct SFc10_sliding_controller_constInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c10_is_active_c10_sliding_controller_const;
  uint8_T c10_JITStateAnimation[1];
  uint8_T c10_JITTransitionAnimation[1];
  void *c10_fEmlrtCtx;
  real_T (*c10_q)[2];
  real_T (*c10_knee)[2];
  real_T (*c10_dknee)[2];
  real_T (*c10_qd)[2];
  real_T (*c10_ankle)[2];
  real_T (*c10_danke)[2];
};

#endif                                 /* struct_SFc10_sliding_controller_constInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c10_sliding_controller_const_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c10_sliding_controller_const_get_check_sum(mxArray *plhs[]);
extern void c10_sliding_controller_const_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
