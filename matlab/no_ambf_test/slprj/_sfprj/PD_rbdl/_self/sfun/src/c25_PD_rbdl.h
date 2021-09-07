#ifndef __c25_PD_rbdl_h__
#define __c25_PD_rbdl_h__

/* Forward Declarations */
struct SFc25_PD_rbdlInstanceStruct;

/* Type Definitions */
#ifndef typedef_c25_PD_rbdlStackData
#define typedef_c25_PD_rbdlStackData

typedef struct {
} c25_PD_rbdlStackData;

#endif                                 /* typedef_c25_PD_rbdlStackData */

#ifndef struct_SFc25_PD_rbdlInstanceStruct
#define struct_SFc25_PD_rbdlInstanceStruct

struct SFc25_PD_rbdlInstanceStruct
{
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint8_T c25_is_active_c25_PD_rbdl;
  uint8_T c25_JITStateAnimation[1];
  uint8_T c25_JITTransitionAnimation[1];
  void *c25_fEmlrtCtx;
  real_T (*c25_u)[6];
  real_T (*c25_y)[6];
};

#endif                                 /* struct_SFc25_PD_rbdlInstanceStruct */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c25_PD_rbdl_get_eml_resolved_functions_info();

/* Function Definitions */
extern void sf_c25_PD_rbdl_get_check_sum(mxArray *plhs[]);
extern void c25_PD_rbdl_method_dispatcher(SimStruct *S, int_T method, void *data);

#endif
