#ifndef __c7_sliding_controller_rbdl_h__
#define __c7_sliding_controller_rbdl_h__

/* Forward Declarations */
struct SFc7_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c7_sliding_controller_rbdlStackData
#define typedef_c7_sliding_controller_rbdlStackData

typedef struct {
} c7_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c7_sliding_controller_rbdlStackData */

#ifndef struct_SFc7_sliding_controller_rbdlInstanceStruct
#define struct_SFc7_sliding_controller_rbdlInstanceStruct

struct SFc7_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c7_is_active_c7_sliding_controller_rbdl;
  uint8_T c7_JITStateAnimation[1];
  uint8_T c7_JITTransitionAnimation[1];
  void *c7_fEmlrtCtx;
  real_T (*c7_q)[2];
  real_T (*c7_y)[4];
};

#endif                                 /* struct_SFc7_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c7_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c7_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c7_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
