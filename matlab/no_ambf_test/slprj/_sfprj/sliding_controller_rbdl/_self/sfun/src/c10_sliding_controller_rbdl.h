#ifndef __c10_sliding_controller_rbdl_h__
#define __c10_sliding_controller_rbdl_h__

/* Forward Declarations */
struct SFc10_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c10_sliding_controller_rbdlStackData
#define typedef_c10_sliding_controller_rbdlStackData

typedef struct {
} c10_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c10_sliding_controller_rbdlStackData */

#ifndef struct_SFc10_sliding_controller_rbdlInstanceStruct
#define struct_SFc10_sliding_controller_rbdlInstanceStruct

struct SFc10_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c10_is_active_c10_sliding_controller_rbdl;
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

#endif                                 /* struct_SFc10_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c10_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c10_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c10_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
