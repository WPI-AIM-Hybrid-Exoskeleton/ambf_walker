#ifndef __c13_sliding_controller_rbdl_h__
#define __c13_sliding_controller_rbdl_h__

/* Forward Declarations */
struct SFc13_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c13_sliding_controller_rbdlStackData
#define typedef_c13_sliding_controller_rbdlStackData

typedef struct {
} c13_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c13_sliding_controller_rbdlStackData */

#ifndef struct_SFc13_sliding_controller_rbdlInstanceStruct
#define struct_SFc13_sliding_controller_rbdlInstanceStruct

struct SFc13_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c13_is_active_c13_sliding_controller_rbdl;
  uint8_T c13_JITStateAnimation[1];
  uint8_T c13_JITTransitionAnimation[1];
  void *c13_fEmlrtCtx;
  real_T (*c13_q)[2];
  real_T (*c13_y)[4];
};

#endif                                 /* struct_SFc13_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c13_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c13_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c13_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
