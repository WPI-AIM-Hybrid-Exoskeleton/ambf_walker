#ifndef __c12_sliding_controller_rbdl_h__
#define __c12_sliding_controller_rbdl_h__

/* Forward Declarations */
struct SFc12_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c12_sliding_controller_rbdlStackData
#define typedef_c12_sliding_controller_rbdlStackData

typedef struct {
} c12_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c12_sliding_controller_rbdlStackData */

#ifndef struct_SFc12_sliding_controller_rbdlInstanceStruct
#define struct_SFc12_sliding_controller_rbdlInstanceStruct

struct SFc12_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c12_is_active_c12_sliding_controller_rbdl;
  uint8_T c12_JITStateAnimation[1];
  uint8_T c12_JITTransitionAnimation[1];
  void *c12_fEmlrtCtx;
  real_T (*c12_q)[2];
  real_T (*c12_y)[4];
};

#endif                                 /* struct_SFc12_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c12_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c12_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c12_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
