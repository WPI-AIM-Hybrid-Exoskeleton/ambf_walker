#ifndef __c6_sliding_controller_rbdl_h__
#define __c6_sliding_controller_rbdl_h__

/* Forward Declarations */
struct SFc6_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c6_sliding_controller_rbdlStackData
#define typedef_c6_sliding_controller_rbdlStackData

typedef struct {
} c6_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c6_sliding_controller_rbdlStackData */

#ifndef struct_SFc6_sliding_controller_rbdlInstanceStruct
#define struct_SFc6_sliding_controller_rbdlInstanceStruct

struct SFc6_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c6_is_active_c6_sliding_controller_rbdl;
  uint8_T c6_JITStateAnimation[1];
  uint8_T c6_JITTransitionAnimation[1];
  void *c6_fEmlrtCtx;
  real_T (*c6_u)[7];
  real_T (*c6_y)[6];
};

#endif                                 /* struct_SFc6_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c6_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c6_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c6_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
