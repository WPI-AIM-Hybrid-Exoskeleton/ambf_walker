#ifndef __c20_sliding_controller_rbdl_h__
#define __c20_sliding_controller_rbdl_h__

/* Forward Declarations */
struct SFc20_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c20_sliding_controller_rbdlStackData
#define typedef_c20_sliding_controller_rbdlStackData

typedef struct {
} c20_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c20_sliding_controller_rbdlStackData */

#ifndef struct_SFc20_sliding_controller_rbdlInstanceStruct
#define struct_SFc20_sliding_controller_rbdlInstanceStruct

struct SFc20_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c20_is_active_c20_sliding_controller_rbdl;
  uint8_T c20_JITStateAnimation[1];
  uint8_T c20_JITTransitionAnimation[1];
  void *c20_fEmlrtCtx;
  real_T (*c20_q)[2];
  real_T (*c20_knee)[2];
  real_T (*c20_dknee)[2];
  real_T (*c20_qd)[2];
  real_T (*c20_ankle)[2];
  real_T (*c20_danke)[2];
};

#endif                                 /* struct_SFc20_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c20_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c20_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c20_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
