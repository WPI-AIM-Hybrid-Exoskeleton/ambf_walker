#ifndef __c1_PD_rbdl_h__
#define __c1_PD_rbdl_h__

/* Forward Declarations */
struct SFc1_PD_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c1_PD_rbdlStackData
#define typedef_c1_PD_rbdlStackData

typedef struct {
} c1_PD_rbdlStackData;

#endif                                 /* typedef_c1_PD_rbdlStackData */

#ifndef struct_SFc1_PD_rbdlInstanceStruct
#define struct_SFc1_PD_rbdlInstanceStruct

struct SFc1_PD_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c1_is_active_c1_PD_rbdl;
  uint8_T c1_JITStateAnimation[1];
  uint8_T c1_JITTransitionAnimation[1];
  void *c1_fEmlrtCtx;
  real_T (*c1_u)[6];
  real_T (*c1_y)[6];
};

#endif                                 /* struct_SFc1_PD_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c1_PD_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c1_PD_rbdl_get_check_sum(mxArray *plhs[]);
extern void c1_PD_rbdl_method_dispatcher(SimStruct *S, int_T method, void *data);

#endif
