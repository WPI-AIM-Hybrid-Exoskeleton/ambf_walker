#ifndef __c40_sliding_controller_rbdl_h__
#define __c40_sliding_controller_rbdl_h__

/* Forward Declarations */
struct SFc40_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c40_sliding_controller_rbdlStackData
#define typedef_c40_sliding_controller_rbdlStackData

typedef struct {
} c40_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c40_sliding_controller_rbdlStackData */

#ifndef struct_SFc40_sliding_controller_rbdlInstanceStruct
#define struct_SFc40_sliding_controller_rbdlInstanceStruct

struct SFc40_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c40_is_active_c40_sliding_controller_rbdl;
  uint8_T c40_JITStateAnimation[1];
  uint8_T c40_JITTransitionAnimation[1];
  void *c40_fEmlrtCtx;
  real_T (*c40_u)[7];
  real_T (*c40_y)[7];
  real_T (*c40_gpu_y)[7];
};

#endif                                 /* struct_SFc40_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c40_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c40_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c40_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
