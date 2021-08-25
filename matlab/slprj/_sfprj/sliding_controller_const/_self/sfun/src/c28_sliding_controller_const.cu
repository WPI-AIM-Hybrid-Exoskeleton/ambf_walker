/* Include files */

#include "sliding_controller_const_sfun.h"
#include "c28_sliding_controller_const.h"
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
static void initialize_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance);
static void initialize_params_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance);
static void enable_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance);
static void disable_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance);
static void c28_do_animation_call_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance);
static void ext_mode_exec_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance);
static void set_sim_state_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c28_st);
static void sf_gateway_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_start_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_terminate_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance);
static void initSimStructsc28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance);
static void c28_eML_blk_kernel(SFc28_sliding_controller_constInstanceStruct
  *chartInstance, real_T c28_b_q[2], real_T c28_b_y[4]);
static void c28_emlrt_marshallIn(SFc28_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c28_b_y, const char_T *c28_identifier, real_T
  c28_c_y[4]);
static void c28_b_emlrt_marshallIn(SFc28_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c28_u, const emlrtMsgIdentifier *c28_parentId,
  real_T c28_b_y[4]);
static uint8_T c28_c_emlrt_marshallIn
  (SFc28_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c28_b_is_active_c28_sliding_controller_const, const char_T *c28_identifier);
static uint8_T c28_d_emlrt_marshallIn
  (SFc28_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c28_u, const emlrtMsgIdentifier *c28_parentId);
static void init_dsm_address_info(SFc28_sliding_controller_constInstanceStruct
  *chartInstance);
static void init_simulink_io_address
  (SFc28_sliding_controller_constInstanceStruct *chartInstance);

/* Function Definitions */
static void initialize_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c28_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c28_is_active_c28_sliding_controller_const = 0U;
  cudaGetLastError();
}

static void initialize_params_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void enable_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c28_do_animation_call_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance)
{
  const mxArray *c28_b_y = NULL;
  const mxArray *c28_c_y = NULL;
  const mxArray *c28_d_y = NULL;
  const mxArray *c28_st;
  c28_st = NULL;
  c28_b_y = NULL;
  sf_mex_assign(&c28_b_y, sf_mex_createcellmatrix(2, 1), false);
  c28_c_y = NULL;
  sf_mex_assign(&c28_c_y, sf_mex_create("y", *chartInstance->c28_y, 0, 0U, 1U,
    0U, 2, 2, 2), false);
  sf_mex_setcell(c28_b_y, 0, c28_c_y);
  c28_d_y = NULL;
  sf_mex_assign(&c28_d_y, sf_mex_create("y",
    &chartInstance->c28_is_active_c28_sliding_controller_const, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c28_b_y, 1, c28_d_y);
  sf_mex_assign(&c28_st, c28_b_y, false);
  return c28_st;
}

static void set_sim_state_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c28_st)
{
  const mxArray *c28_u;
  c28_u = sf_mex_dup(c28_st);
  c28_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c28_u, 0)), "y",
                       *chartInstance->c28_y);
  chartInstance->c28_is_active_c28_sliding_controller_const =
    c28_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c28_u, 1)),
    "is_active_c28_sliding_controller_const");
  sf_mex_destroy(&c28_u);
  sf_mex_destroy(&c28_st);
}

static void sf_gateway_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance)
{
  chartInstance->c28_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c28_eML_blk_kernel(chartInstance, *chartInstance->c28_q, *chartInstance->c28_y);
  c28_do_animation_call_c28_sliding_controller_const(chartInstance);
}

static void mdl_start_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance)
{
  cudaError_t c28_errCode;
  c28_errCode = cudaGetLastError();
  if (c28_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c28_errCode, (char_T *)cudaGetErrorName
                       (c28_errCode), (char_T *)cudaGetErrorString(c28_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c28_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void initSimStructsc28_sliding_controller_const
  (SFc28_sliding_controller_constInstanceStruct *chartInstance)
{
}

const mxArray *sf_c28_sliding_controller_const_get_eml_resolved_functions_info()
{
  const mxArray *c28_nameCaptureInfo = NULL;
  c28_nameCaptureInfo = NULL;
  sf_mex_assign(&c28_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c28_nameCaptureInfo;
}

static void c28_eML_blk_kernel(SFc28_sliding_controller_constInstanceStruct
  *chartInstance, real_T c28_b_q[2], real_T c28_b_y[4])
{
  c28_b_y[0] = -0.324 * muDoubleScalarSin(c28_b_q[0]);
  c28_b_y[2] = 0.0;
  c28_b_y[1] = 0.324 * muDoubleScalarCos(c28_b_q[0]);
  c28_b_y[3] = 0.0;
}

static void c28_emlrt_marshallIn(SFc28_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c28_b_y, const char_T *c28_identifier, real_T
  c28_c_y[4])
{
  emlrtMsgIdentifier c28_thisId;
  c28_thisId.fIdentifier = const_cast<const char_T *>(c28_identifier);
  c28_thisId.fParent = NULL;
  c28_thisId.bParentIsCell = false;
  c28_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c28_b_y), &c28_thisId,
    c28_c_y);
  sf_mex_destroy(&c28_b_y);
}

static void c28_b_emlrt_marshallIn(SFc28_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c28_u, const emlrtMsgIdentifier *c28_parentId,
  real_T c28_b_y[4])
{
  real_T c28_dv[4];
  int32_T c28_i;
  sf_mex_import(c28_parentId, sf_mex_dup(c28_u), c28_dv, 1, 0, 0U, 1, 0U, 2, 2,
                2);
  for (c28_i = 0; c28_i < 4; c28_i++) {
    c28_b_y[c28_i] = c28_dv[c28_i];
  }

  sf_mex_destroy(&c28_u);
}

static uint8_T c28_c_emlrt_marshallIn
  (SFc28_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c28_b_is_active_c28_sliding_controller_const, const char_T *c28_identifier)
{
  emlrtMsgIdentifier c28_thisId;
  uint8_T c28_b_y;
  c28_thisId.fIdentifier = const_cast<const char_T *>(c28_identifier);
  c28_thisId.fParent = NULL;
  c28_thisId.bParentIsCell = false;
  c28_b_y = c28_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c28_b_is_active_c28_sliding_controller_const), &c28_thisId);
  sf_mex_destroy(&c28_b_is_active_c28_sliding_controller_const);
  return c28_b_y;
}

static uint8_T c28_d_emlrt_marshallIn
  (SFc28_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c28_u, const emlrtMsgIdentifier *c28_parentId)
{
  uint8_T c28_b_u;
  uint8_T c28_b_y;
  sf_mex_import(c28_parentId, sf_mex_dup(c28_u), &c28_b_u, 1, 3, 0U, 0, 0U, 0);
  c28_b_y = c28_b_u;
  sf_mex_destroy(&c28_u);
  return c28_b_y;
}

static void init_dsm_address_info(SFc28_sliding_controller_constInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address
  (SFc28_sliding_controller_constInstanceStruct *chartInstance)
{
  chartInstance->c28_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c28_q = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c28_y = (real_T (*)[4])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c28_sliding_controller_const_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(536815311U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1945133011U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2900394615U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(32238838U);
}

mxArray *sf_c28_sliding_controller_const_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c28_sliding_controller_const_jit_fallback_info(void)
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

mxArray *sf_c28_sliding_controller_const_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c28_sliding_controller_const(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfj"
    "UU90P4mcXxicklmWWp8clGFvHFOZkpmXnp8cn5eSVF+Tk5qUUgZnEJwp8AfPMeOg=="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c28_sliding_controller_const_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sFqlSox9r5ekjZXT2w93GAD";
}

static void sf_opaque_initialize_c28_sliding_controller_const(void
  *chartInstanceVar)
{
  initialize_params_c28_sliding_controller_const
    ((SFc28_sliding_controller_constInstanceStruct*) chartInstanceVar);
  initialize_c28_sliding_controller_const
    ((SFc28_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c28_sliding_controller_const(void *chartInstanceVar)
{
  enable_c28_sliding_controller_const
    ((SFc28_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c28_sliding_controller_const(void
  *chartInstanceVar)
{
  disable_c28_sliding_controller_const
    ((SFc28_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c28_sliding_controller_const(void
  *chartInstanceVar)
{
  sf_gateway_c28_sliding_controller_const
    ((SFc28_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c28_sliding_controller_const
  (SimStruct* S)
{
  return get_sim_state_c28_sliding_controller_const
    ((SFc28_sliding_controller_constInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c28_sliding_controller_const(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c28_sliding_controller_const
    ((SFc28_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c28_sliding_controller_const
  (void *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc28_sliding_controller_constInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_const_optimization_info();
    }

    mdl_cleanup_runtime_resources_c28_sliding_controller_const
      ((SFc28_sliding_controller_constInstanceStruct*) chartInstanceVar);
    ((SFc28_sliding_controller_constInstanceStruct*) chartInstanceVar)->
      ~SFc28_sliding_controller_constInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c28_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_start_c28_sliding_controller_const
    ((SFc28_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c28_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_terminate_c28_sliding_controller_const
    ((SFc28_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc28_sliding_controller_const
    ((SFc28_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c28_sliding_controller_const(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c28_sliding_controller_const
      ((SFc28_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr
       (S));
    initSimStructsc28_sliding_controller_const
      ((SFc28_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr
       (S));
  }
}

const char* sf_c28_sliding_controller_const_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u00AQdqOCqPhRhZCQEBKcgCMCIcEF2uYHIlJa4RQQl2q7nsRL1rtmf5LmBbjxJhy48yI",
    "8ARcuPAKztpMGx3YoERUgLDn2er+ZnZlvdmbjrbS3Pbwu4L1x0fNO4/MM3jUvvU5l45WZO/2+6t",
    "3Mxu9RSNholygSaa/yEiSC56Alt4ZJ0RY9WQhjogcKBEVsLJUp06ZZZDkTg5YV1OnTL0NGQz+Ul",
    "gdbKEuCHcHHqC22Zhf1NJgCaloAgQmVtP2wxUl/arEyo3oIdKBtVOWCBuPb2Jmlty03LObQPATa",
    "FtoQtFgf2eYbYqBuDkvddJ5qfwKUUcwZEYXehkT7EGOADezFAf7uWINO5WE0JMpsQUiGoDtskOi",
    "UAvI6mcaJAyaIkYoR3ox43QnO27bL0Z5tGQCvCAjatqWADGLJhCnn32+hp01BDjg04MD2y7X58N",
    "Y68l8wGIEqjVuvLoegSB92ROmiSUCahwlb0yyZhxkWwQuiNinypyEozV7MHO0T5Am6KFEGg8TJt",
    "u4qNsTwlmqzUdtl5qItY6OUbL0IlmhrDqGKham2FhV1wrkuhXVl3IEh8ERrgxhSDUu1FuO0ZkFX",
    "YoBdepfvBisYEp/B6lIErJCuYQ6Q1J1nWFh+RFKrjYzqmLyNTmd+eh7WFgZUj1AoqgKKMA0YsyS",
    "85doCph33CESrTGJeETjNkEUoT/esaIykGmBMKorIkQuO0VJgpPvIJe6EPY2bpgrmuFyEo4SGEL",
    "gCwzhs47ZBbEFMtCttm7jvhsyMG6CpYnEBqxZ3HZahpkuocQx7YiDkSLSUjPysxqfhBcBsI0ow0",
    "d/C+qXGLVy9iArXz257R/3s3E/0s4lc/nlrRs9KgR5v5plfd61WvW4N31Ym/XdG7nxundWcnMOt",
    "433lw70vn+7qU/zs0867ry87y6z/sXa8/n8hG1+dFNrpxhnO5avDPpmxa7VA/+UZ/evZWLfecl8",
    "ePlD3YPDm9avundGDu483Gyk/C+yt5eydfL/uKj5mWZKfiraD7GDixsSm7drpvz9j7+kF8VjLvq",
    "fXt0fLyV/ayPO4ukB+Hd/Gubz99fWvbywnn67/aoH9N3J830j6+j5x1QL26Z37+5qzALf6PpXCK",
    "Mk5KPeqzY9+/mq+H1fOO2G5v8XO/3K/n/ef6V8nLeedsNyy/h23j/9p+Kp+4OXw63+wH8uer343",
    "/rN3vHPQtWz8cPpXpx4yHhScerNpPML2imb/gTz9DoMms4g=",
    ""
  };

  static char newstr [1249] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c28_sliding_controller_const(SimStruct *S)
{
  const char* newstr = sf_c28_sliding_controller_const_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(3862277146U));
  ssSetChecksum1(S,(91435963U));
  ssSetChecksum2(S,(1279986540U));
  ssSetChecksum3(S,(1280830342U));
}

static void mdlRTW_c28_sliding_controller_const(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c28_sliding_controller_const(SimStruct *S)
{
  SFc28_sliding_controller_constInstanceStruct *chartInstance;
  chartInstance = (SFc28_sliding_controller_constInstanceStruct *)utMalloc
    (sizeof(SFc28_sliding_controller_constInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc28_sliding_controller_constInstanceStruct));
  chartInstance = new (chartInstance)
    SFc28_sliding_controller_constInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c28_sliding_controller_const;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c28_sliding_controller_const;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c28_sliding_controller_const;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c28_sliding_controller_const;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c28_sliding_controller_const;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c28_sliding_controller_const;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c28_sliding_controller_const;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c28_sliding_controller_const;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c28_sliding_controller_const;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c28_sliding_controller_const;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c28_sliding_controller_const;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c28_sliding_controller_const;
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
    chartInstance->c28_JITStateAnimation,
    chartInstance->c28_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c28_sliding_controller_const(chartInstance);
}

void c28_sliding_controller_const_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c28_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c28_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c28_sliding_controller_const(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c28_sliding_controller_const_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
