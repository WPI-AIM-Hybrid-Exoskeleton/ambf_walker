#ifndef __c19_sliding_controller_rbdl_h__
#define __c19_sliding_controller_rbdl_h__

/* Forward Declarations */
struct SFc19_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c19_sliding_controller_rbdlStackData
#define typedef_c19_sliding_controller_rbdlStackData

typedef struct {
} c19_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c19_sliding_controller_rbdlStackData */

#ifndef struct_SFc19_sliding_controller_rbdlInstanceStruct
#define struct_SFc19_sliding_controller_rbdlInstanceStruct

struct SFc19_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c19_is_active_c19_sliding_controller_rbdl;
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

#endif                                 /* struct_SFc19_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c19_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c19_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c19_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
