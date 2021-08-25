/* Include files */

#include "sliding_controller_const_sfun.h"
#include "c11_sliding_controller_const.h"
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
static void initialize_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance);
static void initialize_params_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance);
static void enable_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance);
static void disable_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance);
static void c11_do_animation_call_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance);
static void ext_mode_exec_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance);
static void set_sim_state_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c11_st);
static void sf_gateway_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_start_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_terminate_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance);
static void initSimStructsc11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance);
static void c11_eML_blk_kernel(SFc11_sliding_controller_constInstanceStruct
  *chartInstance, real_T c11_b_q[2], real_T c11_b_y[4]);
static void c11_emlrt_marshallIn(SFc11_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c11_b_y, const char_T *c11_identifier, real_T
  c11_c_y[4]);
static void c11_b_emlrt_marshallIn(SFc11_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c11_u, const emlrtMsgIdentifier *c11_parentId,
  real_T c11_b_y[4]);
static uint8_T c11_c_emlrt_marshallIn
  (SFc11_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c11_b_is_active_c11_sliding_controller_const, const char_T *c11_identifier);
static uint8_T c11_d_emlrt_marshallIn
  (SFc11_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c11_u, const emlrtMsgIdentifier *c11_parentId);
static void init_dsm_address_info(SFc11_sliding_controller_constInstanceStruct
  *chartInstance);
static void init_simulink_io_address
  (SFc11_sliding_controller_constInstanceStruct *chartInstance);

/* Function Definitions */
static void initialize_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c11_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c11_is_active_c11_sliding_controller_const = 0U;
  cudaGetLastError();
}

static void initialize_params_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void enable_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c11_do_animation_call_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance)
{
  const mxArray *c11_b_y = NULL;
  const mxArray *c11_c_y = NULL;
  const mxArray *c11_d_y = NULL;
  const mxArray *c11_st;
  c11_st = NULL;
  c11_b_y = NULL;
  sf_mex_assign(&c11_b_y, sf_mex_createcellmatrix(2, 1), false);
  c11_c_y = NULL;
  sf_mex_assign(&c11_c_y, sf_mex_create("y", *chartInstance->c11_y, 0, 0U, 1U,
    0U, 2, 2, 2), false);
  sf_mex_setcell(c11_b_y, 0, c11_c_y);
  c11_d_y = NULL;
  sf_mex_assign(&c11_d_y, sf_mex_create("y",
    &chartInstance->c11_is_active_c11_sliding_controller_const, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c11_b_y, 1, c11_d_y);
  sf_mex_assign(&c11_st, c11_b_y, false);
  return c11_st;
}

static void set_sim_state_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c11_st)
{
  const mxArray *c11_u;
  c11_u = sf_mex_dup(c11_st);
  c11_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c11_u, 0)), "y",
                       *chartInstance->c11_y);
  chartInstance->c11_is_active_c11_sliding_controller_const =
    c11_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c11_u, 1)),
    "is_active_c11_sliding_controller_const");
  sf_mex_destroy(&c11_u);
  sf_mex_destroy(&c11_st);
}

static void sf_gateway_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance)
{
  chartInstance->c11_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c11_eML_blk_kernel(chartInstance, *chartInstance->c11_q, *chartInstance->c11_y);
  c11_do_animation_call_c11_sliding_controller_const(chartInstance);
}

static void mdl_start_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance)
{
  cudaError_t c11_errCode;
  c11_errCode = cudaGetLastError();
  if (c11_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c11_errCode, (char_T *)cudaGetErrorName
                       (c11_errCode), (char_T *)cudaGetErrorString(c11_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c11_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void initSimStructsc11_sliding_controller_const
  (SFc11_sliding_controller_constInstanceStruct *chartInstance)
{
}

const mxArray *sf_c11_sliding_controller_const_get_eml_resolved_functions_info()
{
  const mxArray *c11_nameCaptureInfo = NULL;
  c11_nameCaptureInfo = NULL;
  sf_mex_assign(&c11_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c11_nameCaptureInfo;
}

static void c11_eML_blk_kernel(SFc11_sliding_controller_constInstanceStruct
  *chartInstance, real_T c11_b_q[2], real_T c11_b_y[4])
{
  c11_b_y[0] = -0.324 * muDoubleScalarSin(c11_b_q[0]);
  c11_b_y[2] = 0.0;
  c11_b_y[1] = 0.324 * muDoubleScalarCos(c11_b_q[0]);
  c11_b_y[3] = 0.0;
}

static void c11_emlrt_marshallIn(SFc11_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c11_b_y, const char_T *c11_identifier, real_T
  c11_c_y[4])
{
  emlrtMsgIdentifier c11_thisId;
  c11_thisId.fIdentifier = const_cast<const char_T *>(c11_identifier);
  c11_thisId.fParent = NULL;
  c11_thisId.bParentIsCell = false;
  c11_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c11_b_y), &c11_thisId,
    c11_c_y);
  sf_mex_destroy(&c11_b_y);
}

static void c11_b_emlrt_marshallIn(SFc11_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c11_u, const emlrtMsgIdentifier *c11_parentId,
  real_T c11_b_y[4])
{
  real_T c11_dv[4];
  int32_T c11_i;
  sf_mex_import(c11_parentId, sf_mex_dup(c11_u), c11_dv, 1, 0, 0U, 1, 0U, 2, 2,
                2);
  for (c11_i = 0; c11_i < 4; c11_i++) {
    c11_b_y[c11_i] = c11_dv[c11_i];
  }

  sf_mex_destroy(&c11_u);
}

static uint8_T c11_c_emlrt_marshallIn
  (SFc11_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c11_b_is_active_c11_sliding_controller_const, const char_T *c11_identifier)
{
  emlrtMsgIdentifier c11_thisId;
  uint8_T c11_b_y;
  c11_thisId.fIdentifier = const_cast<const char_T *>(c11_identifier);
  c11_thisId.fParent = NULL;
  c11_thisId.bParentIsCell = false;
  c11_b_y = c11_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c11_b_is_active_c11_sliding_controller_const), &c11_thisId);
  sf_mex_destroy(&c11_b_is_active_c11_sliding_controller_const);
  return c11_b_y;
}

static uint8_T c11_d_emlrt_marshallIn
  (SFc11_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c11_u, const emlrtMsgIdentifier *c11_parentId)
{
  uint8_T c11_b_u;
  uint8_T c11_b_y;
  sf_mex_import(c11_parentId, sf_mex_dup(c11_u), &c11_b_u, 1, 3, 0U, 0, 0U, 0);
  c11_b_y = c11_b_u;
  sf_mex_destroy(&c11_u);
  return c11_b_y;
}

static void init_dsm_address_info(SFc11_sliding_controller_constInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address
  (SFc11_sliding_controller_constInstanceStruct *chartInstance)
{
  chartInstance->c11_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c11_q = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c11_y = (real_T (*)[4])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c11_sliding_controller_const_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(536815311U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1945133011U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2900394615U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(32238838U);
}

mxArray *sf_c11_sliding_controller_const_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c11_sliding_controller_const_jit_fallback_info(void)
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

mxArray *sf_c11_sliding_controller_const_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c11_sliding_controller_const(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfj"
    "UU90P4mcXxicklmWWp8cmGhvHFOZkpmXnp8cn5eSVF+Tk5qUUgZnEJwp8Ae9IeMg=="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c11_sliding_controller_const_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sFqlSox9r5ekjZXT2w93GAD";
}

static void sf_opaque_initialize_c11_sliding_controller_const(void
  *chartInstanceVar)
{
  initialize_params_c11_sliding_controller_const
    ((SFc11_sliding_controller_constInstanceStruct*) chartInstanceVar);
  initialize_c11_sliding_controller_const
    ((SFc11_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c11_sliding_controller_const(void *chartInstanceVar)
{
  enable_c11_sliding_controller_const
    ((SFc11_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c11_sliding_controller_const(void
  *chartInstanceVar)
{
  disable_c11_sliding_controller_const
    ((SFc11_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c11_sliding_controller_const(void
  *chartInstanceVar)
{
  sf_gateway_c11_sliding_controller_const
    ((SFc11_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c11_sliding_controller_const
  (SimStruct* S)
{
  return get_sim_state_c11_sliding_controller_const
    ((SFc11_sliding_controller_constInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c11_sliding_controller_const(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c11_sliding_controller_const
    ((SFc11_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c11_sliding_controller_const
  (void *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc11_sliding_controller_constInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_const_optimization_info();
    }

    mdl_cleanup_runtime_resources_c11_sliding_controller_const
      ((SFc11_sliding_controller_constInstanceStruct*) chartInstanceVar);
    ((SFc11_sliding_controller_constInstanceStruct*) chartInstanceVar)->
      ~SFc11_sliding_controller_constInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c11_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_start_c11_sliding_controller_const
    ((SFc11_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c11_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_terminate_c11_sliding_controller_const
    ((SFc11_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc11_sliding_controller_const
    ((SFc11_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c11_sliding_controller_const(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c11_sliding_controller_const
      ((SFc11_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr
       (S));
    initSimStructsc11_sliding_controller_const
      ((SFc11_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr
       (S));
  }
}

const char* sf_c11_sliding_controller_const_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u00AQdqOCQPyoQkhICAlOwJEfIcEF2uYHIlJa4RQQl2q7nsRL1rtmf5LmBbjxJhy48yI",
    "8ARcuPAKztpMGx3YoERUgLDn2er+ZnZlvdmbjrbS3PLzO471+wfNO4vMU3jUvvU5k45WZO/2+6t",
    "3Ixu9RSNhohygSaa/yEiSC56Alt4ZJ0RY9WQhjogcKBEVsLJUp06ZZZDkTg5YV1OnTL0NGQz+Ul",
    "gebKEuCbcHHqC22Zgf1NJgCaloAgQmVtP2wxUl/arEyo3oIdKBtVOWCBuPb2Jmltyw3LObQPADa",
    "FtoQtFgf2uYbYqBuDkrddJ5qfwKUUcwZEYXehkT7EGOADezGAf5uW4NO5WE0JMpsQkiGoDtskOi",
    "UAvI6mcaJfSaIkYoR3ox43QnO27bD0Z4tGQCvCAjatqmADGLJhCnn32+hp01B9jk0YN/2y7X58N",
    "Y68l8wGIEqjVuvLoegSB+2RemiSUCaBwlb0yyZhxkWwQuiNijypyEozV7MHO0T5Am6KFEGg8TJt",
    "u4qNsTwlmqzUdtl5qItY6OUbL0IlmhrDqGKham2FhV1wrkuhXVl3IEh8ERrgxhSDUu1FuO0ZkFX",
    "YoBdepfvBisYEp/B6lIErJCuYQ6Q1J1nWFh+RFKrjYzqmLyNTmd+eh7WFgZUj1AoqgKKMA0YsyS",
    "85doCph33CESrTGJeETjNkEUoT/esaIykGmBMKorIoQuO0VJgpPvIJe6EXY2bpgrmuFyEo4SGEL",
    "gCwzhs4bZBbEFMtCttG7jvhsyMG6CpYnEBqxZ3HZahpkuocQy7YiDkSLSUjPysxqfhBcBsI0ow0",
    "d/E+qXGLVy9iArXz255h/3s7E/0s4lc/nlzRs9KgR5v5plf93Stet0avq1M+u+M3LncOqs5OYdb",
    "w/vyh3tfPt3VJ/iZp513X192lln/Y+1o/f98Nr4yKbTTjTOcy1eHfTJj12qB/ksz+teysW695b4",
    "8eKDuweDN61fdO6MHdx9vNFJ+Fthby9k7+X7NVXzMsiQ/FW0H2cHEjYlN27XTf3/G3pML4nE6+5",
    "5e3x4tJ39xPc/j6gL5NXwb5/L219e/tr6cfLr+qwX2X8/xfT3p63vEVQvYo7dv72nOAtzqe1QKo",
    "yTnoNyrNj/6+av5flQ575jl/hY7/8v9ft5/pn8dt5x3zHLL+nfUPv6n4av6gZfDr/3Bfix7vvrd",
    "+M/e0c5BV7Pxw+lfnXrIeFBw6s2m8QjbK5r9B/L0O0WFs4A=",
    ""
  };

  static char newstr [1249] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c11_sliding_controller_const(SimStruct *S)
{
  const char* newstr = sf_c11_sliding_controller_const_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(3862277146U));
  ssSetChecksum1(S,(91435963U));
  ssSetChecksum2(S,(1279986540U));
  ssSetChecksum3(S,(1280830342U));
}

static void mdlRTW_c11_sliding_controller_const(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c11_sliding_controller_const(SimStruct *S)
{
  SFc11_sliding_controller_constInstanceStruct *chartInstance;
  chartInstance = (SFc11_sliding_controller_constInstanceStruct *)utMalloc
    (sizeof(SFc11_sliding_controller_constInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc11_sliding_controller_constInstanceStruct));
  chartInstance = new (chartInstance)
    SFc11_sliding_controller_constInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c11_sliding_controller_const;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c11_sliding_controller_const;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c11_sliding_controller_const;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c11_sliding_controller_const;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c11_sliding_controller_const;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c11_sliding_controller_const;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c11_sliding_controller_const;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c11_sliding_controller_const;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c11_sliding_controller_const;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c11_sliding_controller_const;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c11_sliding_controller_const;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c11_sliding_controller_const;
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
    chartInstance->c11_JITStateAnimation,
    chartInstance->c11_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c11_sliding_controller_const(chartInstance);
}

void c11_sliding_controller_const_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c11_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c11_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c11_sliding_controller_const(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c11_sliding_controller_const_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
