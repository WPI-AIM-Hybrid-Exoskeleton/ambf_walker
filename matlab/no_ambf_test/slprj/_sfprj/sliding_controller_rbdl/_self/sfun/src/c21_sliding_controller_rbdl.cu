/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c21_sliding_controller_rbdl.h"
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
static void initialize_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c21_do_animation_call_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c21_st);
static void sf_gateway_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c21_eML_blk_kernel(SFc21_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c21_b_u[6], real_T c21_b_y[7]);
static void c21_emlrt_marshallIn(SFc21_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c21_b_y, const char_T *c21_identifier, real_T
  c21_c_y[7]);
static void c21_b_emlrt_marshallIn(SFc21_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c21_b_u, const emlrtMsgIdentifier *c21_parentId,
  real_T c21_b_y[7]);
static uint8_T c21_c_emlrt_marshallIn
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c21_b_is_active_c21_sliding_controller_rbdl, const char_T *c21_identifier);
static uint8_T c21_d_emlrt_marshallIn
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c21_b_u, const emlrtMsgIdentifier *c21_parentId);
static void init_dsm_address_info(SFc21_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc21_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c21_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c21_is_active_c21_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c21_do_animation_call_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  const mxArray *c21_b_y = NULL;
  const mxArray *c21_c_y = NULL;
  const mxArray *c21_d_y = NULL;
  const mxArray *c21_st;
  c21_st = NULL;
  c21_b_y = NULL;
  sf_mex_assign(&c21_b_y, sf_mex_createcellmatrix(2, 1), false);
  c21_c_y = NULL;
  sf_mex_assign(&c21_c_y, sf_mex_create("y", *chartInstance->c21_y, 0, 0U, 1U,
    0U, 2, 1, 7), false);
  sf_mex_setcell(c21_b_y, 0, c21_c_y);
  c21_d_y = NULL;
  sf_mex_assign(&c21_d_y, sf_mex_create("y",
    &chartInstance->c21_is_active_c21_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c21_b_y, 1, c21_d_y);
  sf_mex_assign(&c21_st, c21_b_y, false);
  return c21_st;
}

static void set_sim_state_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c21_st)
{
  const mxArray *c21_b_u;
  c21_b_u = sf_mex_dup(c21_st);
  c21_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c21_b_u, 0)),
                       "y", *chartInstance->c21_y);
  chartInstance->c21_is_active_c21_sliding_controller_rbdl =
    c21_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c21_b_u, 1)),
    "is_active_c21_sliding_controller_rbdl");
  sf_mex_destroy(&c21_b_u);
  sf_mex_destroy(&c21_st);
}

static void sf_gateway_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c21_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c21_eML_blk_kernel(chartInstance, *chartInstance->c21_u, *chartInstance->c21_y);
  c21_do_animation_call_c21_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c21_errCode;
  c21_errCode = cudaGetLastError();
  if (c21_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c21_errCode, (char_T *)cudaGetErrorName
                       (c21_errCode), (char_T *)cudaGetErrorString(c21_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c21_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc21_sliding_controller_rbdl
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c21_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c21_nameCaptureInfo = NULL;
  c21_nameCaptureInfo = NULL;
  sf_mex_assign(&c21_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c21_nameCaptureInfo;
}

static void c21_eML_blk_kernel(SFc21_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c21_b_u[6], real_T c21_b_y[7])
{
  c21_b_y[0] = c21_b_u[3];
  c21_b_y[1] = 0.0;
  c21_b_y[2] = c21_b_u[0];
  c21_b_y[3] = c21_b_u[1];
  c21_b_y[4] = c21_b_u[4];
  c21_b_y[5] = c21_b_u[5];
  c21_b_y[6] = c21_b_u[2];
}

static void c21_emlrt_marshallIn(SFc21_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c21_b_y, const char_T *c21_identifier, real_T
  c21_c_y[7])
{
  emlrtMsgIdentifier c21_thisId;
  c21_thisId.fIdentifier = const_cast<const char_T *>(c21_identifier);
  c21_thisId.fParent = NULL;
  c21_thisId.bParentIsCell = false;
  c21_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c21_b_y), &c21_thisId,
    c21_c_y);
  sf_mex_destroy(&c21_b_y);
}

static void c21_b_emlrt_marshallIn(SFc21_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c21_b_u, const emlrtMsgIdentifier *c21_parentId,
  real_T c21_b_y[7])
{
  real_T c21_dv[7];
  int32_T c21_i;
  sf_mex_import(c21_parentId, sf_mex_dup(c21_b_u), c21_dv, 1, 0, 0U, 1, 0U, 2, 1,
                7);
  for (c21_i = 0; c21_i < 7; c21_i++) {
    c21_b_y[c21_i] = c21_dv[c21_i];
  }

  sf_mex_destroy(&c21_b_u);
}

static uint8_T c21_c_emlrt_marshallIn
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c21_b_is_active_c21_sliding_controller_rbdl, const char_T *c21_identifier)
{
  emlrtMsgIdentifier c21_thisId;
  uint8_T c21_b_y;
  c21_thisId.fIdentifier = const_cast<const char_T *>(c21_identifier);
  c21_thisId.fParent = NULL;
  c21_thisId.bParentIsCell = false;
  c21_b_y = c21_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c21_b_is_active_c21_sliding_controller_rbdl), &c21_thisId);
  sf_mex_destroy(&c21_b_is_active_c21_sliding_controller_rbdl);
  return c21_b_y;
}

static uint8_T c21_d_emlrt_marshallIn
  (SFc21_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c21_b_u, const emlrtMsgIdentifier *c21_parentId)
{
  uint8_T c21_b_y;
  uint8_T c21_c_u;
  sf_mex_import(c21_parentId, sf_mex_dup(c21_b_u), &c21_c_u, 1, 3, 0U, 0, 0U, 0);
  c21_b_y = c21_c_u;
  sf_mex_destroy(&c21_b_u);
  return c21_b_y;
}

static void init_dsm_address_info(SFc21_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc21_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
  chartInstance->c21_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c21_u = (real_T (*)[6])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c21_y = (real_T (*)[7])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c21_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(3669229500U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(490348266U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2982423110U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(1200777508U);
}

mxArray *sf_c21_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c21_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c21_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c21_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfl"
    "UU90P4mcXxicklmWWp8clGhvHFOZkpmXnp8cn5eSVF+Tk5qUXxRUkpOUj+BAB12B2u"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c21_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sStKXtzIzHLETxtLQhJoVxG";
}

static void sf_opaque_initialize_c21_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c21_sliding_controller_rbdl
    ((SFc21_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c21_sliding_controller_rbdl
    ((SFc21_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c21_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c21_sliding_controller_rbdl
    ((SFc21_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c21_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c21_sliding_controller_rbdl
    ((SFc21_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c21_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c21_sliding_controller_rbdl
    ((SFc21_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c21_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c21_sliding_controller_rbdl
    ((SFc21_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c21_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c21_sliding_controller_rbdl
    ((SFc21_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c21_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc21_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c21_sliding_controller_rbdl
      ((SFc21_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc21_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc21_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c21_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c21_sliding_controller_rbdl
    ((SFc21_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c21_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c21_sliding_controller_rbdl
    ((SFc21_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc21_sliding_controller_rbdl
    ((SFc21_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c21_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c21_sliding_controller_rbdl
      ((SFc21_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc21_sliding_controller_rbdl
      ((SFc21_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c21_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV91u00gUdqNSgbRbVQiJGwTcoN3LBWklrqA0P5Al3XZxWqq9iabjk3iU8YyZnzThDfZi3wU",
    "J8R57uXfc7AP0EfaM7aTBsZ22ERUgLLnO2N85c875zs/UW2vvenht4r190/M28Hkd75qXXtey9d",
    "rcnb5f937K1n+jkLDRPlEk0l7lJUgEr0BLbg2Toi36shDGRB8UCIrYWCpTpk2zyHImhi0rqNOnX",
    "4eMhn4oLQ92UJYEe4JPUFtszT7qaTAF1LQAAhMqaQdhi5PBzGJlTuoh0KG2UZULGoxvY2eW3rXc",
    "sJhDcwy0LbQhaLE+s803xEDdjEvddJ5qfwqUUcwZEYXehkT7EGOADRzEAf7dswadysNoSJTZgZC",
    "MQHfYMNEpBeR1Mo0fjpkgRipGeDPidSe4aNs+R3t2ZQC8IiBo244CMowlE6acf7+FnjYFOebQgG",
    "M7KNfmwxvryD9kcAKqNG79uhyBIgPYE6WbJgFpjhO2ZlmyCDMsgkOinlHkT0NQmr2YOdonyBN0U",
    "aIMBomTbd1VbIThLdVmo7bLzGUlY6OUbL0MlmhrjqCKhZm2FhV1wrkuhXVl3IER8ERrgxhSDUu1",
    "FuO0ZkFXYoBdepdXgxUMic9gdSkCVkjXKAdI+s7v2Fg+RVKrjYzqmLyNTmfx8yKsLQyoPqFQ1AU",
    "UYRowZkl4y7UFTDvuEYhWmcS8InCaIctQnu5b0TiRaogxqWgiZy44RkuBkR4gl1gJBxqLpgrmuF",
    "yGo4SGELgGwzjsYtkgtiAm2rW2Z1h3I2YmDdBUsbiAVYtVh22o6RJqEsOBGAp5IlpKRn7W49PwA",
    "mC2ESWYGOxg/1KTFu5eRIWbZ794Z/Psh3PMs6lc/vnznJ61Aj3e3DO/741a9b41/LU2nb9zcj/m",
    "9lnPyTncFt5/ffQPP/75z393f30vbp1+uL3K/u9qF5v/m9n6zrTRzgpntJCvDvtizq71Av235/R",
    "vZWvtm5dH5m377YtOszs2nT/C3+Th+HnKzxJ7azl7p+/vu46PWZbkp6LtIDuYuDWx6bh2+h/P2b",
    "uxJB43svfpdfp0Nflb23ke15fIb+GvSS5vL7///e3V5NP9j5bY/yDH94NkrveI6xbQo48e9jRnA",
    "ZZ6j0phlOQcVE8dBzzn52Xz/aJy3hXLfS12fpf7/LyfZ35dtZx3xXKr+nfROf6l4avmgZfDb33B",
    "fqx6vvrc+H+9i52D7mXrJ7N/deoh40HBqTf7jEfYftHXbyBP/wctPLV+",
    ""
  };

  static char newstr [1257] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c21_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c21_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(1448337289U));
  ssSetChecksum1(S,(3838859999U));
  ssSetChecksum2(S,(1857238302U));
  ssSetChecksum3(S,(397799444U));
}

static void mdlRTW_c21_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c21_sliding_controller_rbdl(SimStruct *S)
{
  SFc21_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc21_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc21_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc21_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc21_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c21_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c21_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c21_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c21_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c21_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c21_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c21_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c21_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c21_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c21_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c21_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c21_sliding_controller_rbdl;
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
    chartInstance->c21_JITStateAnimation,
    chartInstance->c21_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c21_sliding_controller_rbdl(chartInstance);
}

void c21_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c21_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c21_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c21_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c21_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
