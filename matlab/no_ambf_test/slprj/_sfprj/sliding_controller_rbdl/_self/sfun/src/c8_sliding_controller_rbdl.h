#ifndef __c8_sliding_controller_rbdl_h__
#define __c8_sliding_controller_rbdl_h__

/* Forward Declarations */
struct SFc8_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c8_sliding_controller_rbdlStackData
#define typedef_c8_sliding_controller_rbdlStackData

typedef struct {
} c8_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c8_sliding_controller_rbdlStackData */

#ifndef struct_SFc8_sliding_controller_rbdlInstanceStruct
#define struct_SFc8_sliding_controller_rbdlInstanceStruct

struct SFc8_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c8_is_active_c8_sliding_controller_rbdl;
  uint8_T c8_JITStateAnimation[1];
  uint8_T c8_JITTransitionAnimation[1];
  void *c8_fEmlrtCtx;
  real_T (*c8_u)[7];
  real_T (*c8_y)[6];
};

#endif                                 /* struct_SFc8_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c8_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c8_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c8_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
