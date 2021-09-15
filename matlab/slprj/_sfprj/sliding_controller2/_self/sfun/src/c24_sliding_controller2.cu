/* Include files */

#include "sliding_controller2_sfun.h"
#include "c24_sliding_controller2.h"
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
static void initialize_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance);
static void initialize_params_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance);
static void enable_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance);
static void disable_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance);
static void c24_do_animation_call_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance);
static void ext_mode_exec_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance);
static const mxArray *get_sim_state_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance);
static void set_sim_state_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance, const mxArray *c24_st);
static void sf_gateway_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance);
static void mdl_start_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance);
static void mdl_terminate_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance);
static void initSimStructsc24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance);
static void c24_eML_blk_kernel(SFc24_sliding_controller2InstanceStruct
  *chartInstance, real_T c24_b_u[6], real_T c24_b_y[7]);
static void c24_emlrt_marshallIn(SFc24_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c24_b_y, const char_T *c24_identifier, real_T
  c24_c_y[7]);
static void c24_b_emlrt_marshallIn(SFc24_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c24_b_u, const emlrtMsgIdentifier *c24_parentId,
  real_T c24_b_y[7]);
static uint8_T c24_c_emlrt_marshallIn(SFc24_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c24_b_is_active_c24_sliding_controller2, const
  char_T *c24_identifier);
static uint8_T c24_d_emlrt_marshallIn(SFc24_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c24_b_u, const emlrtMsgIdentifier *c24_parentId);
static void init_dsm_address_info(SFc24_sliding_controller2InstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc24_sliding_controller2InstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c24_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c24_is_active_c24_sliding_controller2 = 0U;
  cudaGetLastError();
}

static void initialize_params_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance)
{
}

static void enable_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c24_do_animation_call_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance)
{
  const mxArray *c24_b_y = NULL;
  const mxArray *c24_c_y = NULL;
  const mxArray *c24_d_y = NULL;
  const mxArray *c24_st;
  c24_st = NULL;
  c24_b_y = NULL;
  sf_mex_assign(&c24_b_y, sf_mex_createcellmatrix(2, 1), false);
  c24_c_y = NULL;
  sf_mex_assign(&c24_c_y, sf_mex_create("y", *chartInstance->c24_y, 0, 0U, 1U,
    0U, 2, 1, 7), false);
  sf_mex_setcell(c24_b_y, 0, c24_c_y);
  c24_d_y = NULL;
  sf_mex_assign(&c24_d_y, sf_mex_create("y",
    &chartInstance->c24_is_active_c24_sliding_controller2, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c24_b_y, 1, c24_d_y);
  sf_mex_assign(&c24_st, c24_b_y, false);
  return c24_st;
}

static void set_sim_state_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance, const mxArray *c24_st)
{
  const mxArray *c24_b_u;
  c24_b_u = sf_mex_dup(c24_st);
  c24_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c24_b_u, 0)),
                       "y", *chartInstance->c24_y);
  chartInstance->c24_is_active_c24_sliding_controller2 = c24_c_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c24_b_u, 1)),
     "is_active_c24_sliding_controller2");
  sf_mex_destroy(&c24_b_u);
  sf_mex_destroy(&c24_st);
}

static void sf_gateway_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance)
{
  chartInstance->c24_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c24_eML_blk_kernel(chartInstance, *chartInstance->c24_u, *chartInstance->c24_y);
  c24_do_animation_call_c24_sliding_controller2(chartInstance);
}

static void mdl_start_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance)
{
}

static void mdl_terminate_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance)
{
  cudaError_t c24_errCode;
  c24_errCode = cudaGetLastError();
  if (c24_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c24_errCode, (char_T *)cudaGetErrorName
                       (c24_errCode), (char_T *)cudaGetErrorString(c24_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c24_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance)
{
}

static void initSimStructsc24_sliding_controller2
  (SFc24_sliding_controller2InstanceStruct *chartInstance)
{
}

const mxArray *sf_c24_sliding_controller2_get_eml_resolved_functions_info()
{
  const mxArray *c24_nameCaptureInfo = NULL;
  c24_nameCaptureInfo = NULL;
  sf_mex_assign(&c24_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c24_nameCaptureInfo;
}

static void c24_eML_blk_kernel(SFc24_sliding_controller2InstanceStruct
  *chartInstance, real_T c24_b_u[6], real_T c24_b_y[7])
{
  c24_b_y[0] = c24_b_u[3];
  c24_b_y[1] = c24_b_u[0];
  c24_b_y[2] = c24_b_u[1];
  c24_b_y[3] = c24_b_u[2];
  c24_b_y[4] = c24_b_u[4];
  c24_b_y[5] = c24_b_u[5];
  c24_b_y[6] = 0.0;
}

static void c24_emlrt_marshallIn(SFc24_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c24_b_y, const char_T *c24_identifier, real_T
  c24_c_y[7])
{
  emlrtMsgIdentifier c24_thisId;
  c24_thisId.fIdentifier = const_cast<const char_T *>(c24_identifier);
  c24_thisId.fParent = NULL;
  c24_thisId.bParentIsCell = false;
  c24_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c24_b_y), &c24_thisId,
    c24_c_y);
  sf_mex_destroy(&c24_b_y);
}

static void c24_b_emlrt_marshallIn(SFc24_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c24_b_u, const emlrtMsgIdentifier *c24_parentId,
  real_T c24_b_y[7])
{
  real_T c24_dv[7];
  int32_T c24_i;
  sf_mex_import(c24_parentId, sf_mex_dup(c24_b_u), c24_dv, 1, 0, 0U, 1, 0U, 2, 1,
                7);
  for (c24_i = 0; c24_i < 7; c24_i++) {
    c24_b_y[c24_i] = c24_dv[c24_i];
  }

  sf_mex_destroy(&c24_b_u);
}

static uint8_T c24_c_emlrt_marshallIn(SFc24_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c24_b_is_active_c24_sliding_controller2, const
  char_T *c24_identifier)
{
  emlrtMsgIdentifier c24_thisId;
  uint8_T c24_b_y;
  c24_thisId.fIdentifier = const_cast<const char_T *>(c24_identifier);
  c24_thisId.fParent = NULL;
  c24_thisId.bParentIsCell = false;
  c24_b_y = c24_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c24_b_is_active_c24_sliding_controller2), &c24_thisId);
  sf_mex_destroy(&c24_b_is_active_c24_sliding_controller2);
  return c24_b_y;
}

static uint8_T c24_d_emlrt_marshallIn(SFc24_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c24_b_u, const emlrtMsgIdentifier *c24_parentId)
{
  uint8_T c24_b_y;
  uint8_T c24_c_u;
  sf_mex_import(c24_parentId, sf_mex_dup(c24_b_u), &c24_c_u, 1, 3, 0U, 0, 0U, 0);
  c24_b_y = c24_c_u;
  sf_mex_destroy(&c24_b_u);
  return c24_b_y;
}

static void init_dsm_address_info(SFc24_sliding_controller2InstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc24_sliding_controller2InstanceStruct
  *chartInstance)
{
  chartInstance->c24_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c24_u = (real_T (*)[6])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c24_y = (real_T (*)[7])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c24_sliding_controller2_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(3080704608U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(2208426765U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2131008065U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2283259860U);
}

mxArray *sf_c24_sliding_controller2_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c24_sliding_controller2_jit_fallback_info(void)
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

mxArray *sf_c24_sliding_controller2_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c24_sliding_controller2(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfk"
    "UU90P4mcXxicklmWWp8clGJvHFOZkpmXnp8cn5eSVF+Tk5qUVGSOaDAABbZhvY"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c24_sliding_controller2_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sApjR2e37QLsrAPnkhirTIF";
}

static void sf_opaque_initialize_c24_sliding_controller2(void *chartInstanceVar)
{
  initialize_params_c24_sliding_controller2
    ((SFc24_sliding_controller2InstanceStruct*) chartInstanceVar);
  initialize_c24_sliding_controller2((SFc24_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c24_sliding_controller2(void *chartInstanceVar)
{
  enable_c24_sliding_controller2((SFc24_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c24_sliding_controller2(void *chartInstanceVar)
{
  disable_c24_sliding_controller2((SFc24_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c24_sliding_controller2(void *chartInstanceVar)
{
  sf_gateway_c24_sliding_controller2((SFc24_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c24_sliding_controller2(SimStruct*
  S)
{
  return get_sim_state_c24_sliding_controller2
    ((SFc24_sliding_controller2InstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c24_sliding_controller2(SimStruct* S, const
  mxArray *st)
{
  set_sim_state_c24_sliding_controller2((SFc24_sliding_controller2InstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_cleanup_runtime_resources_c24_sliding_controller2(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc24_sliding_controller2InstanceStruct*) chartInstanceVar
      )->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller2_optimization_info();
    }

    mdl_cleanup_runtime_resources_c24_sliding_controller2
      ((SFc24_sliding_controller2InstanceStruct*) chartInstanceVar);
    ((SFc24_sliding_controller2InstanceStruct*) chartInstanceVar)->
      ~SFc24_sliding_controller2InstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c24_sliding_controller2(void *chartInstanceVar)
{
  mdl_start_c24_sliding_controller2((SFc24_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c24_sliding_controller2(void
  *chartInstanceVar)
{
  mdl_terminate_c24_sliding_controller2((SFc24_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc24_sliding_controller2((SFc24_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c24_sliding_controller2(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c24_sliding_controller2
      ((SFc24_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc24_sliding_controller2
      ((SFc24_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c24_sliding_controller2_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u1EgQdkYhu5EWFKGV9rLSwmkRl0UBCS5AkvnRjjQh2XjCj4QUddo1495pd3v7Z5J5gD1",
    "y57SvsHkHXoJX4IDEgQeg2vZMBo/tSRgRAcKS42n7q+qq+uqn4y21tz28ruC9cdXzVvD5I941L7",
    "0uZeulqTt9v+z9nq1foJCw0S5RJNJe5SVIBHugJbeGSdEWPVkIY6IHCgRFbCyVKdOmWWQ5E4OWF",
    "dTp009CRkM/lJYHWyhLgh3BR6gttmYX9TSYAmpaAIEJlbT9sMVJf2KxMkf1EOhA26jKBQ3Gt7Ez",
    "S29bbljMoXkMtC20IWixPrXNN8RA3RyXuuk81f4YKKOYMyIKvQ2J9iHGABvYjwP8u2MNOpWH0ZA",
    "oswUhGYLusEGiUwrI62QaPxwyQYxUjPBmxOtOcNa2XY72bMsAeEVA0LYtBWQQSyZMOf9+Cz1tCn",
    "LIoQGHtl+uzYd/rCP/MYMjUKVx69XlEBTpw44o3TQJSPM4YWuSJbMwwyJ4TNQmRf40BKXZi5mjf",
    "YI8QRclymCQONnWXcWGGN5SbTZqu8ycVzI2SsnW82CJtuYQqliYaGtRUSec61JYV8YdGAJPtDaI",
    "IdWwVGsxTmsWdCUG2KV3eTVYwZD4DFaXImCFdA1zgKTvPMLG8jGSWm1kVMfkbXQ6s59nYW1hQPU",
    "IhaIuoAjTgDFLwluuLWDacY9AtMok5hWB0wyZh/J0z4rGkVQDjElFEzl1wTFaCox0H7nEStjXWD",
    "RVMMflPBwlNITANRjGYRvLBrEFMdGutW1i3Q2ZGTVAU8XiAlYtVh22oaZLqFEM+2Ig5JFoKRn5W",
    "Y9PwwuA2UaUYKK/hf1LjVq4exEVbp7d8k7n2U9nmGdjufzzxpSepQI93tQzv+9qrXrfGv5aGs/f",
    "KbnLuX2Wc3IOt4b3fzfvv3r+5uTuDy+fvX3/7x//L7L/Se188/9Ktv513GgnhTOcyVeH/XPKruU",
    "C/b9M6V/L1noz/ntvHW7f/auj1eauGIRMddutlJ859tZy9o7fX3MdH7MsyU9F20F2MHFrYtNx7f",
    "Tfm7J3ZU48VrP36fXu4WLyP2/keVyeI7+Gv0a5vP30/a9tLCaf7v90jv3Xc3xfT+b6AXHdAg7o+",
    "p0DzVmApX5ApTBKcg5qvaA+PzXfzyvnXbDc12Lnd7nPz/tZ5tdFy3kXLLeof+ed418avmoeeDn8",
    "2hfsx6Lnq8+Nf+2d7xz0W7Z+MPlXpx4yHhScerPPeITtFX39BvL0A1G+sw8=",
    ""
  };

  static char newstr [1261] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c24_sliding_controller2(SimStruct *S)
{
  const char* newstr = sf_c24_sliding_controller2_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(3275565726U));
  ssSetChecksum1(S,(934340956U));
  ssSetChecksum2(S,(3982071815U));
  ssSetChecksum3(S,(2939127284U));
}

static void mdlRTW_c24_sliding_controller2(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c24_sliding_controller2(SimStruct *S)
{
  SFc24_sliding_controller2InstanceStruct *chartInstance;
  chartInstance = (SFc24_sliding_controller2InstanceStruct *)utMalloc(sizeof
    (SFc24_sliding_controller2InstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc24_sliding_controller2InstanceStruct));
  chartInstance = new (chartInstance) SFc24_sliding_controller2InstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c24_sliding_controller2;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c24_sliding_controller2;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c24_sliding_controller2;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c24_sliding_controller2;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c24_sliding_controller2;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c24_sliding_controller2;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c24_sliding_controller2;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c24_sliding_controller2;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c24_sliding_controller2;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c24_sliding_controller2;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c24_sliding_controller2;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c24_sliding_controller2;
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
    chartInstance->c24_JITStateAnimation,
    chartInstance->c24_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c24_sliding_controller2(chartInstance);
}

void c24_sliding_controller2_method_dispatcher(SimStruct *S, int_T method, void *
  data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c24_sliding_controller2(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c24_sliding_controller2(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c24_sliding_controller2(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c24_sliding_controller2_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
