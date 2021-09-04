/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c29_sliding_controller_rbdl.h"
#include "mwmathutil.h"
#ifdef utFree
#undef utFree
#endif

#ifdef utMalloc
#undef utMalloc
#endif

#ifdef __cplusplus

extern "C" void *utMalloc(size_t size);
extern "C" void utFree(void*);

#else

extern void *utMalloc(size_t size);
extern void utFree(void*);

#endif

/* Forward Declarations */

/* Type Definitions */

/* Named Constants */
const int32_T CALL_EVENT = -1;

/* Variable Declarations */

/* Variable Definitions */
static real_T _sfTime_;

/* Function Declarations */
static void initialize_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c29_do_animation_call_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c29_st);
static void sf_gateway_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c29_eML_blk_kernel(SFc29_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c29_b_q[2], real_T c29_b_y[4]);
static void c29_emlrt_marshallIn(SFc29_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c29_b_y, const char_T *c29_identifier, real_T
  c29_c_y[4]);
static void c29_b_emlrt_marshallIn(SFc29_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c29_u, const emlrtMsgIdentifier *c29_parentId,
  real_T c29_b_y[4]);
static uint8_T c29_c_emlrt_marshallIn
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c29_b_is_active_c29_sliding_controller_rbdl, const char_T *c29_identifier);
static uint8_T c29_d_emlrt_marshallIn
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c29_u, const emlrtMsgIdentifier *c29_parentId);
static void init_dsm_address_info(SFc29_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc29_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c29_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c29_is_active_c29_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c29_do_animation_call_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  const mxArray *c29_b_y = NULL;
  const mxArray *c29_c_y = NULL;
  const mxArray *c29_d_y = NULL;
  const mxArray *c29_st;
  c29_st = NULL;
  c29_b_y = NULL;
  sf_mex_assign(&c29_b_y, sf_mex_createcellmatrix(2, 1), false);
  c29_c_y = NULL;
  sf_mex_assign(&c29_c_y, sf_mex_create("y", *chartInstance->c29_y, 0, 0U, 1U,
    0U, 2, 2, 2), false);
  sf_mex_setcell(c29_b_y, 0, c29_c_y);
  c29_d_y = NULL;
  sf_mex_assign(&c29_d_y, sf_mex_create("y",
    &chartInstance->c29_is_active_c29_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c29_b_y, 1, c29_d_y);
  sf_mex_assign(&c29_st, c29_b_y, false);
  return c29_st;
}

static void set_sim_state_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c29_st)
{
  const mxArray *c29_u;
  c29_u = sf_mex_dup(c29_st);
  c29_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c29_u, 0)), "y",
                       *chartInstance->c29_y);
  chartInstance->c29_is_active_c29_sliding_controller_rbdl =
    c29_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c29_u, 1)),
    "is_active_c29_sliding_controller_rbdl");
  sf_mex_destroy(&c29_u);
  sf_mex_destroy(&c29_st);
}

static void sf_gateway_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c29_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c29_eML_blk_kernel(chartInstance, *chartInstance->c29_q, *chartInstance->c29_y);
  c29_do_animation_call_c29_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c29_errCode;
  c29_errCode = cudaGetLastError();
  if (c29_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c29_errCode, (char_T *)cudaGetErrorName
                       (c29_errCode), (char_T *)cudaGetErrorString(c29_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c29_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc29_sliding_controller_rbdl
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c29_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c29_nameCaptureInfo = NULL;
  c29_nameCaptureInfo = NULL;
  sf_mex_assign(&c29_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c29_nameCaptureInfo;
}

static void c29_eML_blk_kernel(SFc29_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c29_b_q[2], real_T c29_b_y[4])
{
  c29_b_y[0] = -0.324 * muDoubleScalarSin(c29_b_q[0]) - 0.39 * muDoubleScalarSin
    (c29_b_q[0] + c29_b_q[1]);
  c29_b_y[2] = 0.324 * muDoubleScalarCos(c29_b_q[0]) + 0.39 * muDoubleScalarSin
    (c29_b_q[0] + c29_b_q[1]);
  c29_b_y[1] = -0.39 * muDoubleScalarSin(c29_b_q[0] + c29_b_q[1]);
  c29_b_y[3] = 0.39 * muDoubleScalarCos(c29_b_q[0] + c29_b_q[1]);
}

static void c29_emlrt_marshallIn(SFc29_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c29_b_y, const char_T *c29_identifier, real_T
  c29_c_y[4])
{
  emlrtMsgIdentifier c29_thisId;
  c29_thisId.fIdentifier = const_cast<const char_T *>(c29_identifier);
  c29_thisId.fParent = NULL;
  c29_thisId.bParentIsCell = false;
  c29_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c29_b_y), &c29_thisId,
    c29_c_y);
  sf_mex_destroy(&c29_b_y);
}

static void c29_b_emlrt_marshallIn(SFc29_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c29_u, const emlrtMsgIdentifier *c29_parentId,
  real_T c29_b_y[4])
{
  real_T c29_dv[4];
  int32_T c29_i;
  sf_mex_import(c29_parentId, sf_mex_dup(c29_u), c29_dv, 1, 0, 0U, 1, 0U, 2, 2,
                2);
  for (c29_i = 0; c29_i < 4; c29_i++) {
    c29_b_y[c29_i] = c29_dv[c29_i];
  }

  sf_mex_destroy(&c29_u);
}

static uint8_T c29_c_emlrt_marshallIn
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c29_b_is_active_c29_sliding_controller_rbdl, const char_T *c29_identifier)
{
  emlrtMsgIdentifier c29_thisId;
  uint8_T c29_b_y;
  c29_thisId.fIdentifier = const_cast<const char_T *>(c29_identifier);
  c29_thisId.fParent = NULL;
  c29_thisId.bParentIsCell = false;
  c29_b_y = c29_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c29_b_is_active_c29_sliding_controller_rbdl), &c29_thisId);
  sf_mex_destroy(&c29_b_is_active_c29_sliding_controller_rbdl);
  return c29_b_y;
}

static uint8_T c29_d_emlrt_marshallIn
  (SFc29_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c29_u, const emlrtMsgIdentifier *c29_parentId)
{
  uint8_T c29_b_u;
  uint8_T c29_b_y;
  sf_mex_import(c29_parentId, sf_mex_dup(c29_u), &c29_b_u, 1, 3, 0U, 0, 0U, 0);
  c29_b_y = c29_b_u;
  sf_mex_destroy(&c29_u);
  return c29_b_y;
}

static void init_dsm_address_info(SFc29_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc29_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
  chartInstance->c29_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c29_q = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c29_y = (real_T (*)[4])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c29_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(552332206U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(2608078302U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(1441289006U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(4066884445U);
}

mxArray *sf_c29_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c29_sliding_controller_rbdl_jit_fallback_info(void)
{
  const char *infoFields[] = { "fallbackType", "fallbackReason",
    "hiddenFallbackType", "hiddenFallbackReason", "incompatibleSymbol" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 5, infoFields);
  mxArray *fallbackType = mxCreateString("pre");
  mxArray *fallbackReason = mxCreateString("GPUAcceleration");
  mxArray *hiddenFallbackType = mxCreateString("none");
  mxArray *hiddenFallbackReason = mxCreateString("");
  mxArray *incompatibleSymbol = mxCreateString("");
  mxSetField(mxInfo, 0, infoFields[0], fallbackType);
  mxSetField(mxInfo, 0, infoFields[1], fallbackReason);
  mxSetField(mxInfo, 0, infoFields[2], hiddenFallbackType);
  mxSetField(mxInfo, 0, infoFields[3], hiddenFallbackReason);
  mxSetField(mxInfo, 0, infoFields[4], incompatibleSymbol);
  return mxInfo;
}

mxArray *sf_c29_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c29_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfl"
    "UU90P4mcXxicklmWWp8clGlvHFOZkpmXnp8cn5eSVF+Tk5qUXxRUkpOUj+BAB2+B22"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c29_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sjS5Om55RaK9v6MEldWgzUF";
}

static void sf_opaque_initialize_c29_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c29_sliding_controller_rbdl
    ((SFc29_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c29_sliding_controller_rbdl
    ((SFc29_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c29_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c29_sliding_controller_rbdl
    ((SFc29_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c29_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c29_sliding_controller_rbdl
    ((SFc29_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c29_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c29_sliding_controller_rbdl
    ((SFc29_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c29_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c29_sliding_controller_rbdl
    ((SFc29_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c29_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c29_sliding_controller_rbdl
    ((SFc29_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c29_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc29_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c29_sliding_controller_rbdl
      ((SFc29_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc29_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc29_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c29_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c29_sliding_controller_rbdl
    ((SFc29_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c29_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c29_sliding_controller_rbdl
    ((SFc29_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc29_sliding_controller_rbdl
    ((SFc29_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c29_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c29_sliding_controller_rbdl
      ((SFc29_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc29_sliding_controller_rbdl
      ((SFc29_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c29_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u5EQQdkZh2SBYRQhpL0jkEoUjQgoiByDJ/CijzZAoTrLcRp12zbgz7W7TP06Gd9jTijf",
    "guAeeZM975wWQeAGqbc9k8NieTUaJAsKS42n7q+qq+uqn4610ex5ez/De/dTznuDzKd4NL7s+yN",
    "crM3f2ftXbytevUEjY6JgoEmmv9hIkghPQklvDpOiKgSyFMTEABYIiNpbKVGnTLLKciVHHCur06",
    "Zcho6EfSsuDfZQlwZHgY9QWW3OMelpMATUdgMCEStph2OFkOLVYmatmCHSkbVTnggbj29iZpXuW",
    "GxZzaF8D7QptCFqsb2zzDTHQNNeVbjpPtT8ByijmjIhSb0OifYgxwAbO4gD/HlmDThVhNCTK7EN",
    "IEtCHbJTqlAKKOpnGDxdMECMVI7wd8aYTnLftmKM9PRkArwkI2ravgIxiyYSp5t/voKdtQS44tO",
    "DCDqu1+fCzdeSfM7gCVRm3QVMmoMgQjkTlpmlA2tcpW9MsmYcZFsE5UXsU+dMQVGYvZo72CfIEp",
    "yhRBYPUya4+VSzB8FZqs1HXZeaikrFRRrZeBEu1tROoY2GqrUNFk3CuK2GnMj6EBHiqtUUMqYdl",
    "WstxWrPgVGKAXXpXV4MVDInPYU0pAlZKV1IApH3nR2ws/0RSq42Mmpi8rcPD+c/zsK4woAaEQlk",
    "XUIRpwJil4a3WFjDtuEcgWmVS88rAWYYsQnl6YEXrSqoRxqSmidy44BitBEZ6iFxiJZxpLJo6mO",
    "NyEY4SGkLgGgzj0MOyQWxJTLRrbXtYdwkz4xZoqlhcwqrFqsM21HYJNY7hTIyEvBIdJSM/7/FZe",
    "AEw24gSTAz3sX+pcQd3L6PCzbOvvJt59vF7zLOJXPH55YyelRI93syzuO9ao37fBv5amczfGblP",
    "CvusFuQcbh3vjy43fv1r48347esP/zjY+u27Zfb/vXG7+f8sX38+abTTwknm8tVhD2bsWi3R/3x",
    "G/3q+1pf+9lG0vX1CXuwk3/TaPHg5/OWsk/GzwN5Gwd7J+w3X8THL0vxUtBvkBxO3JjYb107/tz",
    "P2PlkQj7X8fXb9+cNy8p/tFnlcXSC/jr/Ghby9+/4bu8vJZ/v/tMD+zQLfm+lc7xPXLaBPv97pa",
    "84CLPU+lcIoyTmovroIeMHPu+b7beW8B5b7t9j5v9z98/4+8+uh5bwHllvWv9vO8ceGr5sHXgG/",
    "/oj9WPZ8dd/4d97tzkFf5Ovvp//qNEPGg5JTb/4Zj7CDsq//gTz9G93ys2k=",
    ""
  };

  static char newstr [1261] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c29_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c29_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(2501929482U));
  ssSetChecksum1(S,(2041323763U));
  ssSetChecksum2(S,(3808924622U));
  ssSetChecksum3(S,(1034168136U));
}

static void mdlRTW_c29_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c29_sliding_controller_rbdl(SimStruct *S)
{
  SFc29_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc29_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc29_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc29_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc29_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c29_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c29_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c29_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c29_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c29_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c29_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c29_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c29_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c29_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c29_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c29_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c29_sliding_controller_rbdl;
  chartInstance->chartInfo.callGetHoverDataForMsg = NULL;
  chartInstance->chartInfo.extModeExec = NULL;
  chartInstance->chartInfo.restoreLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.restoreBeforeLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.storeCurrentConfiguration = NULL;
  chartInstance->chartInfo.callAtomicSubchartUserFcn = NULL;
  chartInstance->chartInfo.callAtomicSubchartAutoFcn = NULL;
  chartInstance->chartInfo.callAtomicSubchartEventFcn = NULL;
  chartInstance->chartInfo.chartStateSetterFcn = NULL;
  chartInstance->chartInfo.chartStateGetterFcn = NULL;
  chartInstance->S = S;
  chartInstance->chartInfo.dispatchToExportedFcn = NULL;
  sf_init_ChartRunTimeInfo(S, &(chartInstance->chartInfo), false, 0,
    chartInstance->c29_JITStateAnimation,
    chartInstance->c29_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c29_sliding_controller_rbdl(chartInstance);
}

void c29_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c29_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c29_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c29_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c29_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
