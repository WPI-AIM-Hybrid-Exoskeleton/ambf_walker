#ifndef __c18_sliding_controller_rbdl_h__
#define __c18_sliding_controller_rbdl_h__

/* Forward Declarations */
struct SFc18_sliding_controller_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c18_sliding_controller_rbdlStackData
#define typedef_c18_sliding_controller_rbdlStackData

typedef struct {
} c18_sliding_controller_rbdlStackData;

#endif                                 /* typedef_c18_sliding_controller_rbdlStackData */

#ifndef struct_SFc18_sliding_controller_rbdlInstanceStruct
#define struct_SFc18_sliding_controller_rbdlInstanceStruct

struct SFc18_sliding_controller_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c18_is_active_c18_sliding_controller_rbdl;
  uint8_T c18_JITStateAnimation[1];
  uint8_T c18_JITTransitionAnimation[1];
  void *c18_fEmlrtCtx;
  real_T (*c18_u)[6];
  real_T (*c18_y)[7];
};

#endif                                 /* struct_SFc18_sliding_controller_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c18_sliding_controller_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c18_sliding_controller_rbdl_get_check_sum(mxArray *plhs[]);
extern void c18_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
