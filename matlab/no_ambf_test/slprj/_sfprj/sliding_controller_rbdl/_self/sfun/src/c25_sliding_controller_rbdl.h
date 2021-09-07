#ifndef __c25_sliding_controller_rbdl_h__
#define __c25_sliding_controller_rbdl_h__

/* Forward Declarations */
struct SFc25_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c25_sliding_controller_rbdlStackData
#define typedef_c25_sliding_controller_rbdlStackData

typedef struct {
} c25_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c25_sliding_controller_rbdlStackData */

#ifndef struct_SFc25_sliding_controller_rbdlInstanceStruct
#define struct_SFc25_sliding_controller_rbdlInstanceStruct

struct SFc25_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c25_is_active_c25_sliding_controller_rbdl;
  uint8_T c25_JITStateAnimation[1];
  uint8_T c25_JITTransitionAnimation[1];
  void *c25_fEmlrtCtx;
  real_T (*c25_u)[6];
  real_T (*c25_y)[6];
};

#endif                                 /* struct_SFc25_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c25_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c25_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c25_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
