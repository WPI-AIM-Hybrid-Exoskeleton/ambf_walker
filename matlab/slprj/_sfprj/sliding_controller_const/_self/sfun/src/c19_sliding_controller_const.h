#ifndef __c19_sliding_controller_const_h__
#define __c19_sliding_controller_const_h__

/* Forward Declarations */
struct SFc19_sliding_controller_constInstanceStruct;

/* Type Definitions */
#ifndef typedef_c19_sliding_controller_constStackData
#define typedef_c19_sliding_controller_constStackData

typedef struct {
} c19_sliding_controller_constStackData;

#endif                                 /* typedef_c19_sliding_controller_constStackData */

#ifndef struct_SFc19_sliding_controller_constInstanceStruct
#define struct_SFc19_sliding_controller_constInstanceStruct

struct SFc19_sliding_controller_constInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c19_is_active_c19_sliding_controller_const;
  uint8_T c19_JITStateAnimation[1];
  uint8_T c19_JITTransitionAnimation[1];
  void *c19_fEmlrtCtx;
  real_T (*c19_q)[2];
  real_T (*c19_knee)[2];
  real_T (*c19_dknee)[2];
  real_T (*c19_qd)[2];
  real_T (*c19_ankle)[2];
  real_T (*c19_danke)[2];
};

#endif                                 /* struct_SFc19_sliding_controller_constInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c19_sliding_controller_const_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c19_sliding_controller_const_get_check_sum(mxArray *plhs[]);
extern void c19_sliding_controller_const_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
