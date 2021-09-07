#ifndef __c34_sliding_controller_rbdl_h__
#define __c34_sliding_controller_rbdl_h__

/* Forward Declarations */
struct SFc34_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c34_sliding_controller_rbdlStackData
#define typedef_c34_sliding_controller_rbdlStackData

typedef struct {
} c34_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c34_sliding_controller_rbdlStackData */

#ifndef struct_SFc34_sliding_controller_rbdlInstanceStruct
#define struct_SFc34_sliding_controller_rbdlInstanceStruct

struct SFc34_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c34_is_active_c34_sliding_controller_rbdl;
  uint8_T c34_JITStateAnimation[1];
  uint8_T c34_JITTransitionAnimation[1];
  void *c34_fEmlrtCtx;
  real_T (*c34_u)[7];
  real_T (*c34_y)[6];
};

#endif                                 /* struct_SFc34_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c34_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c34_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c34_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
