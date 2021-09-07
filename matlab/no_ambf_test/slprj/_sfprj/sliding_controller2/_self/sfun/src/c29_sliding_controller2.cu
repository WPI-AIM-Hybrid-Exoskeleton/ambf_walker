/* Include files */

#include "sliding_controller2_sfun.h"
#include "c29_sliding_controller2.h"
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
static void initialize_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance);
static void initialize_params_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance);
static void enable_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance);
static void disable_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance);
static void c29_do_animation_call_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance);
static void ext_mode_exec_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance);
static const mxArray *get_sim_state_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance);
static void set_sim_state_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance, const mxArray *c29_st);
static void sf_gateway_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance);
static void mdl_start_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance);
static void mdl_terminate_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance);
static void initSimStructsc29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance);
static void c29_eML_blk_kernel(SFc29_sliding_controller2InstanceStruct
  *chartInstance, real_T c29_b_q[2], real_T c29_b_y[4]);
static void c29_emlrt_marshallIn(SFc29_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c29_b_y, const char_T *c29_identifier, real_T
  c29_c_y[4]);
static void c29_b_emlrt_marshallIn(SFc29_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c29_u, const emlrtMsgIdentifier *c29_parentId,
  real_T c29_b_y[4]);
static uint8_T c29_c_emlrt_marshallIn(SFc29_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c29_b_is_active_c29_sliding_controller2, const
  char_T *c29_identifier);
static uint8_T c29_d_emlrt_marshallIn(SFc29_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c29_u, const emlrtMsgIdentifier *c29_parentId);
static void init_dsm_address_info(SFc29_sliding_controller2InstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc29_sliding_controller2InstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c29_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c29_is_active_c29_sliding_controller2 = 0U;
  cudaGetLastError();
}

static void initialize_params_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance)
{
}

static void enable_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c29_do_animation_call_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance)
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
    &chartInstance->c29_is_active_c29_sliding_controller2, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c29_b_y, 1, c29_d_y);
  sf_mex_assign(&c29_st, c29_b_y, false);
  return c29_st;
}

static void set_sim_state_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance, const mxArray *c29_st)
{
  const mxArray *c29_u;
  c29_u = sf_mex_dup(c29_st);
  c29_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c29_u, 0)), "y",
                       *chartInstance->c29_y);
  chartInstance->c29_is_active_c29_sliding_controller2 = c29_c_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c29_u, 1)),
     "is_active_c29_sliding_controller2");
  sf_mex_destroy(&c29_u);
  sf_mex_destroy(&c29_st);
}

static void sf_gateway_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance)
{
  chartInstance->c29_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c29_eML_blk_kernel(chartInstance, *chartInstance->c29_q, *chartInstance->c29_y);
  c29_do_animation_call_c29_sliding_controller2(chartInstance);
}

static void mdl_start_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance)
{
}

static void mdl_terminate_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance)
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

static void mdl_setup_runtime_resources_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance)
{
}

static void initSimStructsc29_sliding_controller2
  (SFc29_sliding_controller2InstanceStruct *chartInstance)
{
}

const mxArray *sf_c29_sliding_controller2_get_eml_resolved_functions_info()
{
  const mxArray *c29_nameCaptureInfo = NULL;
  c29_nameCaptureInfo = NULL;
  sf_mex_assign(&c29_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c29_nameCaptureInfo;
}

static void c29_eML_blk_kernel(SFc29_sliding_controller2InstanceStruct
  *chartInstance, real_T c29_b_q[2], real_T c29_b_y[4])
{
  c29_b_y[0] = -0.324 * muDoubleScalarSin(c29_b_q[0]) - 0.39 * muDoubleScalarSin
    (c29_b_q[0] + c29_b_q[1]);
  c29_b_y[2] = 0.324 * muDoubleScalarCos(c29_b_q[0]) + 0.39 * muDoubleScalarSin
    (c29_b_q[0] + c29_b_q[1]);
  c29_b_y[1] = -0.39 * muDoubleScalarSin(c29_b_q[0] + c29_b_q[1]);
  c29_b_y[3] = 0.39 * muDoubleScalarCos(c29_b_q[0] + c29_b_q[1]);
}

static void c29_emlrt_marshallIn(SFc29_sliding_controller2InstanceStruct
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

static void c29_b_emlrt_marshallIn(SFc29_sliding_controller2InstanceStruct
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

static uint8_T c29_c_emlrt_marshallIn(SFc29_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c29_b_is_active_c29_sliding_controller2, const
  char_T *c29_identifier)
{
  emlrtMsgIdentifier c29_thisId;
  uint8_T c29_b_y;
  c29_thisId.fIdentifier = const_cast<const char_T *>(c29_identifier);
  c29_thisId.fParent = NULL;
  c29_thisId.bParentIsCell = false;
  c29_b_y = c29_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c29_b_is_active_c29_sliding_controller2), &c29_thisId);
  sf_mex_destroy(&c29_b_is_active_c29_sliding_controller2);
  return c29_b_y;
}

static uint8_T c29_d_emlrt_marshallIn(SFc29_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c29_u, const emlrtMsgIdentifier *c29_parentId)
{
  uint8_T c29_b_u;
  uint8_T c29_b_y;
  sf_mex_import(c29_parentId, sf_mex_dup(c29_u), &c29_b_u, 1, 3, 0U, 0, 0U, 0);
  c29_b_y = c29_b_u;
  sf_mex_destroy(&c29_u);
  return c29_b_y;
}

static void init_dsm_address_info(SFc29_sliding_controller2InstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc29_sliding_controller2InstanceStruct
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
void sf_c29_sliding_controller2_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(552332206U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(2608078302U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(1441289006U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(4066884445U);
}

mxArray *sf_c29_sliding_controller2_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c29_sliding_controller2_jit_fallback_info(void)
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

mxArray *sf_c29_sliding_controller2_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c29_sliding_controller2(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfk"
    "UU90P4mcXxicklmWWp8clGlvHFOZkpmXnp8cn5eSVF+Tk5qUVGSOaDAABcGhvd"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c29_sliding_controller2_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sjS5Om55RaK9v6MEldWgzUF";
}

static void sf_opaque_initialize_c29_sliding_controller2(void *chartInstanceVar)
{
  initialize_params_c29_sliding_controller2
    ((SFc29_sliding_controller2InstanceStruct*) chartInstanceVar);
  initialize_c29_sliding_controller2((SFc29_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c29_sliding_controller2(void *chartInstanceVar)
{
  enable_c29_sliding_controller2((SFc29_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c29_sliding_controller2(void *chartInstanceVar)
{
  disable_c29_sliding_controller2((SFc29_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c29_sliding_controller2(void *chartInstanceVar)
{
  sf_gateway_c29_sliding_controller2((SFc29_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c29_sliding_controller2(SimStruct*
  S)
{
  return get_sim_state_c29_sliding_controller2
    ((SFc29_sliding_controller2InstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c29_sliding_controller2(SimStruct* S, const
  mxArray *st)
{
  set_sim_state_c29_sliding_controller2((SFc29_sliding_controller2InstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_cleanup_runtime_resources_c29_sliding_controller2(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc29_sliding_controller2InstanceStruct*) chartInstanceVar
      )->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller2_optimization_info();
    }

    mdl_cleanup_runtime_resources_c29_sliding_controller2
      ((SFc29_sliding_controller2InstanceStruct*) chartInstanceVar);
    ((SFc29_sliding_controller2InstanceStruct*) chartInstanceVar)->
      ~SFc29_sliding_controller2InstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c29_sliding_controller2(void *chartInstanceVar)
{
  mdl_start_c29_sliding_controller2((SFc29_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c29_sliding_controller2(void
  *chartInstanceVar)
{
  mdl_terminate_c29_sliding_controller2((SFc29_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc29_sliding_controller2((SFc29_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c29_sliding_controller2(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c29_sliding_controller2
      ((SFc29_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc29_sliding_controller2
      ((SFc29_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c29_sliding_controller2_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u20YQpgUnjYs2MIoAuQSIc0qPgQEHyaGNbf3AQq3aMK0kN2O9HIlrLXeZ/aGtvENOQd6",
    "gxx76JD3nnhco0BfoLEnJKkVScYQYSVECNLXkN7Mz883P2lvp9jy8buO9/YPn3cTnLbwbXnbdyN",
    "crM3f2ftV7mK/foJCw0SFRJNJe7SVIBEegJbeGSdEVA1kKY2IACgRFbCyVqdKmWWQ5E6OOFdTp0",
    "y9CRkM/lJYHuyhLggPBx6gttuYQ9bSYAmo6AIEJlbTDsMPJcGqxMufNEOhI26jOBQ3Gt7EzS/cs",
    "Nyzm0L4A2hXaELRYX9rmG2KgaS4q3XSean8ClFHMGRGl3oZE+xBjgA304wD/HliDThVhNCTK7EJ",
    "IEtD7bJTqlAKKOpnGD6dMECMVI7wd8aYTnLftkKM9PRkArwkI2rargIxiyYSp5t/voKdtQU45tO",
    "DUDqu1+fDKOvKfMzgHVRm3QVMmoMgQDkTlpmlA2hcpW9MsmYcZFsFzonYo8qchqMxezBztE+QJj",
    "lGiCgapk119rFiC4a3UZqOuy8xFJWOjjGy9CJZqaydQx8JUW4eKJuFcV8KOZbwPCfBUa4sYUg/L",
    "tJbjtGbBscQAu/SurgYrGBKfw5pSBKyUrqQASPvOr9hY/o2kVhsZNTF5W/v785/nYV1hQA0IhbI",
    "uoAjTgDFLw1utLWDacY9AtMqk5pWBswxZhPL0wIrWuVQjjElNE7l0wTFaCYz0ELnESuhrLJo6mO",
    "NyEY4SGkLgGgzj0MOyQWxJTLRrbTtYdwkz4xZoqlhcwqrFqsM21HYJNY6hL0ZCnouOkpGf9/gsv",
    "ACYbUQJJoa72L/UuIO7l1Hh5tkj73KeffcR82wiV3z+OKNnpUSPN/Ms7rvWqN+3gb9WJvN3Ru77",
    "wj6rBTmHW8f727ONd39v/D7+8+03H/Ye/vbTMvv/0bja/L+dr+9NGu20cJK5fHXYvRm7Vkv0353",
    "Rv56v9Zm/dRBtbR2RX54mj3ttHrwYvu53Mn4W2Nso2Dt5v+E6PmZZmp+KdoP8YOLWxGbj2ul/Mm",
    "PvzQXxWMvfZ9dfz5aTv7Nd5HF1gfw6/hoX8vbT99/YXk4+2//lAvsfFPh+kM71E+K6BZzQzacnm",
    "rMAS/2ESmGU5BzUZkl9fmq+X1XOu2a5r8XO/+U+P+8fM7+uW867Zrll/bvqHP/S8HXzwCvg179g",
    "P5Y9X31u/Hvvaueg+/n65+m/Os2Q8aDk1Jt/xiPsoOzrfyBP/wHJMrGQ",
    ""
  };

  static char newstr [1257] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c29_sliding_controller2(SimStruct *S)
{
  const char* newstr = sf_c29_sliding_controller2_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(2501929482U));
  ssSetChecksum1(S,(2041323763U));
  ssSetChecksum2(S,(3808924622U));
  ssSetChecksum3(S,(1034168136U));
}

static void mdlRTW_c29_sliding_controller2(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c29_sliding_controller2(SimStruct *S)
{
  SFc29_sliding_controller2InstanceStruct *chartInstance;
  chartInstance = (SFc29_sliding_controller2InstanceStruct *)utMalloc(sizeof
    (SFc29_sliding_controller2InstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc29_sliding_controller2InstanceStruct));
  chartInstance = new (chartInstance) SFc29_sliding_controller2InstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c29_sliding_controller2;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c29_sliding_controller2;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c29_sliding_controller2;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c29_sliding_controller2;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c29_sliding_controller2;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c29_sliding_controller2;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c29_sliding_controller2;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c29_sliding_controller2;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c29_sliding_controller2;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c29_sliding_controller2;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c29_sliding_controller2;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c29_sliding_controller2;
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

  mdl_setup_runtime_resources_c29_sliding_controller2(chartInstance);
}

void c29_sliding_controller2_method_dispatcher(SimStruct *S, int_T method, void *
  data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c29_sliding_controller2(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c29_sliding_controller2(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c29_sliding_controller2(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c29_sliding_controller2_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
