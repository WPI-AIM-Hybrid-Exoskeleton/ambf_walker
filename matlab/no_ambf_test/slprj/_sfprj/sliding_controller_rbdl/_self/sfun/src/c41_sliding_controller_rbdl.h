#ifndef __c41_sliding_controller_rbdl_h__
#define __c41_sliding_controller_rbdl_h__

/* Forward Declarations */
struct SFc41_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c41_sliding_controller_rbdlStackData
#define typedef_c41_sliding_controller_rbdlStackData

typedef struct {
} c41_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c41_sliding_controller_rbdlStackData */

#ifndef struct_SFc41_sliding_controller_rbdlInstanceStruct
#define struct_SFc41_sliding_controller_rbdlInstanceStruct

struct SFc41_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c41_is_active_c41_sliding_controller_rbdl;
  uint8_T c41_JITStateAnimation[1];
  uint8_T c41_JITTransitionAnimation[1];
  void *c41_fEmlrtCtx;
  real_T (*c41_u)[7];
  real_T (*c41_y)[7];
  real_T (*c41_gpu_y)[7];
};

#endif                                 /* struct_SFc41_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c41_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c41_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c41_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
