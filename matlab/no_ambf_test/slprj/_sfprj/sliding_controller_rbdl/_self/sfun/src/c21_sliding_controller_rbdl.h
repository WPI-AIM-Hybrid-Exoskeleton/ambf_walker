#ifndef __c21_sliding_controller_rbdl_h__
#define __c21_sliding_controller_rbdl_h__

/* Forward Declarations */
struct SFc21_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c21_sliding_controller_rbdlStackData
#define typedef_c21_sliding_controller_rbdlStackData

typedef struct {
} c21_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c21_sliding_controller_rbdlStackData */

#ifndef struct_SFc21_sliding_controller_rbdlInstanceStruct
#define struct_SFc21_sliding_controller_rbdlInstanceStruct

struct SFc21_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c21_is_active_c21_sliding_controller_rbdl;
  uint8_T c21_JITStateAnimation[1];
  uint8_T c21_JITTransitionAnimation[1];
  void *c21_fEmlrtCtx;
  real_T (*c21_u)[7];
  real_T (*c21_y)[7];
};

#endif                                 /* struct_SFc21_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c21_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c21_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c21_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
