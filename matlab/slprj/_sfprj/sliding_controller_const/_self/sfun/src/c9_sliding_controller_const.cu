/* Include files */

#include "sliding_controller_const_sfun.h"
#include "c9_sliding_controller_const.h"
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
static void initialize_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance);
static void initialize_params_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance);
static void enable_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance);
static void disable_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance);
static void c9_do_animation_call_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance);
static void ext_mode_exec_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance);
static void set_sim_state_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c9_st);
static void sf_gateway_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_start_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_terminate_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance);
static void initSimStructsc9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance);
static void c9_eML_blk_kernel(SFc9_sliding_controller_constInstanceStruct
  *chartInstance, real_T c9_b_q[2], real_T c9_b_y[4]);
static void c9_emlrt_marshallIn(SFc9_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c9_b_y, const char_T *c9_identifier, real_T
  c9_c_y[4]);
static void c9_b_emlrt_marshallIn(SFc9_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c9_u, const emlrtMsgIdentifier *c9_parentId,
  real_T c9_b_y[4]);
static uint8_T c9_c_emlrt_marshallIn(SFc9_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c9_b_is_active_c9_sliding_controller_const,
  const char_T *c9_identifier);
static uint8_T c9_d_emlrt_marshallIn(SFc9_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c9_u, const emlrtMsgIdentifier *c9_parentId);
static void init_dsm_address_info(SFc9_sliding_controller_constInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc9_sliding_controller_constInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c9_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c9_is_active_c9_sliding_controller_const = 0U;
  cudaGetLastError();
}

static void initialize_params_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void enable_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c9_do_animation_call_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance)
{
  const mxArray *c9_b_y = NULL;
  const mxArray *c9_c_y = NULL;
  const mxArray *c9_d_y = NULL;
  const mxArray *c9_st;
  c9_st = NULL;
  c9_b_y = NULL;
  sf_mex_assign(&c9_b_y, sf_mex_createcellmatrix(2, 1), false);
  c9_c_y = NULL;
  sf_mex_assign(&c9_c_y, sf_mex_create("y", *chartInstance->c9_y, 0, 0U, 1U, 0U,
    2, 2, 2), false);
  sf_mex_setcell(c9_b_y, 0, c9_c_y);
  c9_d_y = NULL;
  sf_mex_assign(&c9_d_y, sf_mex_create("y",
    &chartInstance->c9_is_active_c9_sliding_controller_const, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c9_b_y, 1, c9_d_y);
  sf_mex_assign(&c9_st, c9_b_y, false);
  return c9_st;
}

static void set_sim_state_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c9_st)
{
  const mxArray *c9_u;
  c9_u = sf_mex_dup(c9_st);
  c9_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c9_u, 0)), "y",
                      *chartInstance->c9_y);
  chartInstance->c9_is_active_c9_sliding_controller_const =
    c9_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c9_u, 1)),
    "is_active_c9_sliding_controller_const");
  sf_mex_destroy(&c9_u);
  sf_mex_destroy(&c9_st);
}

static void sf_gateway_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance)
{
  chartInstance->c9_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c9_eML_blk_kernel(chartInstance, *chartInstance->c9_q, *chartInstance->c9_y);
  c9_do_animation_call_c9_sliding_controller_const(chartInstance);
}

static void mdl_start_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance)
{
  cudaError_t c9_errCode;
  c9_errCode = cudaGetLastError();
  if (c9_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c9_errCode, (char_T *)cudaGetErrorName
                       (c9_errCode), (char_T *)cudaGetErrorString(c9_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c9_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void initSimStructsc9_sliding_controller_const
  (SFc9_sliding_controller_constInstanceStruct *chartInstance)
{
}

const mxArray *sf_c9_sliding_controller_const_get_eml_resolved_functions_info()
{
  const mxArray *c9_nameCaptureInfo = NULL;
  c9_nameCaptureInfo = NULL;
  sf_mex_assign(&c9_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c9_nameCaptureInfo;
}

static void c9_eML_blk_kernel(SFc9_sliding_controller_constInstanceStruct
  *chartInstance, real_T c9_b_q[2], real_T c9_b_y[4])
{
  c9_b_y[0] = -0.324 * muDoubleScalarSin(c9_b_q[0]) - 0.39 * muDoubleScalarSin
    (c9_b_q[0] + c9_b_q[1]);
  c9_b_y[2] = 0.324 * muDoubleScalarCos(c9_b_q[0]) + 0.39 * muDoubleScalarSin
    (c9_b_q[0] + c9_b_q[1]);
  c9_b_y[1] = -0.39 * muDoubleScalarSin(c9_b_q[0] + c9_b_q[1]);
  c9_b_y[3] = 0.39 * muDoubleScalarCos(c9_b_q[0] + c9_b_q[1]);
}

static void c9_emlrt_marshallIn(SFc9_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c9_b_y, const char_T *c9_identifier, real_T
  c9_c_y[4])
{
  emlrtMsgIdentifier c9_thisId;
  c9_thisId.fIdentifier = const_cast<const char_T *>(c9_identifier);
  c9_thisId.fParent = NULL;
  c9_thisId.bParentIsCell = false;
  c9_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c9_b_y), &c9_thisId, c9_c_y);
  sf_mex_destroy(&c9_b_y);
}

static void c9_b_emlrt_marshallIn(SFc9_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c9_u, const emlrtMsgIdentifier *c9_parentId,
  real_T c9_b_y[4])
{
  real_T c9_dv[4];
  int32_T c9_i;
  sf_mex_import(c9_parentId, sf_mex_dup(c9_u), c9_dv, 1, 0, 0U, 1, 0U, 2, 2, 2);
  for (c9_i = 0; c9_i < 4; c9_i++) {
    c9_b_y[c9_i] = c9_dv[c9_i];
  }

  sf_mex_destroy(&c9_u);
}

static uint8_T c9_c_emlrt_marshallIn(SFc9_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c9_b_is_active_c9_sliding_controller_const,
  const char_T *c9_identifier)
{
  emlrtMsgIdentifier c9_thisId;
  uint8_T c9_b_y;
  c9_thisId.fIdentifier = const_cast<const char_T *>(c9_identifier);
  c9_thisId.fParent = NULL;
  c9_thisId.bParentIsCell = false;
  c9_b_y = c9_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c9_b_is_active_c9_sliding_controller_const), &c9_thisId);
  sf_mex_destroy(&c9_b_is_active_c9_sliding_controller_const);
  return c9_b_y;
}

static uint8_T c9_d_emlrt_marshallIn(SFc9_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c9_u, const emlrtMsgIdentifier *c9_parentId)
{
  uint8_T c9_b_u;
  uint8_T c9_b_y;
  sf_mex_import(c9_parentId, sf_mex_dup(c9_u), &c9_b_u, 1, 3, 0U, 0, 0U, 0);
  c9_b_y = c9_b_u;
  sf_mex_destroy(&c9_u);
  return c9_b_y;
}

static void init_dsm_address_info(SFc9_sliding_controller_constInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc9_sliding_controller_constInstanceStruct
  *chartInstance)
{
  chartInstance->c9_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c9_q = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c9_y = (real_T (*)[4])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c9_sliding_controller_const_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(552332206U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(2608078302U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(1441289006U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(4066884445U);
}

mxArray *sf_c9_sliding_controller_const_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c9_sliding_controller_const_jit_fallback_info(void)
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

mxArray *sf_c9_sliding_controller_const_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c9_sliding_controller_const(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfl"
    "UU90P4mcXxicklmWWp8cmW8cU5mSmZeenxyfl5JUX5OTmpRSBmcQmSPwGAEB4H"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c9_sliding_controller_const_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sjS5Om55RaK9v6MEldWgzUF";
}

static void sf_opaque_initialize_c9_sliding_controller_const(void
  *chartInstanceVar)
{
  initialize_params_c9_sliding_controller_const
    ((SFc9_sliding_controller_constInstanceStruct*) chartInstanceVar);
  initialize_c9_sliding_controller_const
    ((SFc9_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c9_sliding_controller_const(void *chartInstanceVar)
{
  enable_c9_sliding_controller_const
    ((SFc9_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c9_sliding_controller_const(void *chartInstanceVar)
{
  disable_c9_sliding_controller_const
    ((SFc9_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c9_sliding_controller_const(void *chartInstanceVar)
{
  sf_gateway_c9_sliding_controller_const
    ((SFc9_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c9_sliding_controller_const
  (SimStruct* S)
{
  return get_sim_state_c9_sliding_controller_const
    ((SFc9_sliding_controller_constInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c9_sliding_controller_const(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c9_sliding_controller_const
    ((SFc9_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c9_sliding_controller_const(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc9_sliding_controller_constInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_const_optimization_info();
    }

    mdl_cleanup_runtime_resources_c9_sliding_controller_const
      ((SFc9_sliding_controller_constInstanceStruct*) chartInstanceVar);
    ((SFc9_sliding_controller_constInstanceStruct*) chartInstanceVar)->
      ~SFc9_sliding_controller_constInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c9_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_start_c9_sliding_controller_const
    ((SFc9_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c9_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_terminate_c9_sliding_controller_const
    ((SFc9_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc9_sliding_controller_const
    ((SFc9_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c9_sliding_controller_const(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c9_sliding_controller_const
      ((SFc9_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc9_sliding_controller_const
      ((SFc9_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c9_sliding_controller_const_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV01v00wQdqPyKUAVQuKCRC8IjlyK4ACU5kNENLTCLXCrtutJvM161+yH2/Af3tMr/sF7fA/",
    "8Es7c+QNI/AFmbScNju1QIipAWHLs9T4zOzPP7MzGW+r2PLyu4L1+1fPO4vM83g0vu87k46WpO/",
    "u+7N3Ox/+gkLDRNlEk0l7tJUgEL0BLbg2Toiv6shTGRB8UCIrYWCpTpU2zyHImhh0rqNOnX4WMh",
    "n4oLQ82UJYEW4KPUFtszTbqaTEF1HQAAhMqaQdhh5PBxGJlDpsh0KG2UZ0LGoxvY2eW7lluWMyh",
    "fQS0K7QhaLE+ts03xEDTHFW66TzV/hgoo5gzIkq9DYn2IcYAG9iNA/zdsgadKsJoSJTZgJAkoDf",
    "ZMNUpBRR1Mo0T+0wQIxUjvB3xphOctW2boz09GQCvCQjatqGADGPJhKnm3++gp21B9jm0YN8Oqr",
    "X58MY68l8yOARVGbd+UyagyAC2ROWiaUDaRylbkyyZhRkWwUuinlDkT0NQmb2YOdonyBPsoEQVD",
    "FInu3pHsQTDW6nNRl2XmfO2jI0ysvU8WKqtnUAdCxNtHSqahHNdCduR8SYkwFOtLWJIPSzTWo7T",
    "mgU7EgPs0rt6N1jBkPgc1pQiYKV0JQVAWneeY2H5FkmtNjJqYvK2Njdnp2dhXWFA9QmFsiqgCNO",
    "AMUvDW60tYNpxj0C0yqTmlYGzDJmH8nTfitahVEOMSU0ROXbBMVoJjPQAucSdsKtx09TBHJfzcJ",
    "TQEAJXYBiHHm4bxJbERLvS9gT3XcLMqAWaKhaXsGpx12EZaruEGsWwK4ZCHoqOkpGf1/gsvACYb",
    "UQJJgYbWL/UqIOrl1Hh+tld77ifXfqOfjaWKz7vTOlZKtHjTT2L615o1K/bwLelcf+dkrtcWGe5",
    "IOdwK3hfPFh992X1/9GHf899enr7v4eLrP++cbL+fyUf3xgX2snGSWby1WGfTtm1XKL/+pT+lXy",
    "sD/y1rWht7QV59iC512vz4NXg7W4n42eOvY2CvePvq67iY5al+aloN8gPJm5MbNaunf77U/aenR",
    "OPC/n37Pr8eDH5a+tFHpfnyK/g26iQtz++/ur6YvLZ+q/n2H+rwPettK/vEVctYI8+2NOcBbjT9",
    "6gURknOQblXbQp+/mi+n1TOO2W538XOv3I/n/fv6V+nLeedstyi/p20j/9q+Lp+4BXwK7+wH4ue",
    "r342/qN3snPQzXz8aPJXpxkyHpScevNpPML2y2b/gDz9CkvHs7o=",
    ""
  };

  static char newstr [1253] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c9_sliding_controller_const(SimStruct *S)
{
  const char* newstr = sf_c9_sliding_controller_const_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(2501929482U));
  ssSetChecksum1(S,(2041323763U));
  ssSetChecksum2(S,(3808924622U));
  ssSetChecksum3(S,(1034168136U));
}

static void mdlRTW_c9_sliding_controller_const(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c9_sliding_controller_const(SimStruct *S)
{
  SFc9_sliding_controller_constInstanceStruct *chartInstance;
  chartInstance = (SFc9_sliding_controller_constInstanceStruct *)utMalloc(sizeof
    (SFc9_sliding_controller_constInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc9_sliding_controller_constInstanceStruct));
  chartInstance = new (chartInstance)
    SFc9_sliding_controller_constInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c9_sliding_controller_const;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c9_sliding_controller_const;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c9_sliding_controller_const;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c9_sliding_controller_const;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c9_sliding_controller_const;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c9_sliding_controller_const;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c9_sliding_controller_const;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c9_sliding_controller_const;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c9_sliding_controller_const;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c9_sliding_controller_const;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c9_sliding_controller_const;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c9_sliding_controller_const;
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
    chartInstance->c9_JITStateAnimation,
    chartInstance->c9_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c9_sliding_controller_const(chartInstance);
}

void c9_sliding_controller_const_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c9_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c9_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c9_sliding_controller_const(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c9_sliding_controller_const_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
