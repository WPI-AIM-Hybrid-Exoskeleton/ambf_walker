#ifndef __c29_sliding_controller_rbdl_h__
#define __c29_sliding_controller_rbdl_h__

/* Forward Declarations */
struct SFc29_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c29_sliding_controller_rbdlStackData
#define typedef_c29_sliding_controller_rbdlStackData

typedef struct {
} c29_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c29_sliding_controller_rbdlStackData */

#ifndef struct_SFc29_sliding_controller_rbdlInstanceStruct
#define struct_SFc29_sliding_controller_rbdlInstanceStruct

struct SFc29_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c29_is_active_c29_sliding_controller_rbdl;
  uint8_T c29_JITStateAnimation[1];
  uint8_T c29_JITTransitionAnimation[1];
  void *c29_fEmlrtCtx;
  real_T (*c29_q)[2];
  real_T (*c29_y)[4];
};

#endif                                 /* struct_SFc29_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c29_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c29_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c29_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
