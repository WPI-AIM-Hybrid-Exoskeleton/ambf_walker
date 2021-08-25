/* Include files */

#include "sliding_controller_const_sfun.h"
#include "c7_sliding_controller_const.h"
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
static void initialize_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance);
static void initialize_params_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance);
static void enable_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance);
static void disable_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance);
static void c7_do_animation_call_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance);
static void ext_mode_exec_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance);
static void set_sim_state_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c7_st);
static void sf_gateway_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_start_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_terminate_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance);
static void initSimStructsc7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance);
static void c7_eML_blk_kernel(SFc7_sliding_controller_constInstanceStruct
  *chartInstance, real_T c7_b_q[2], real_T c7_b_y[4]);
static void c7_emlrt_marshallIn(SFc7_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c7_b_y, const char_T *c7_identifier, real_T
  c7_c_y[4]);
static void c7_b_emlrt_marshallIn(SFc7_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c7_u, const emlrtMsgIdentifier *c7_parentId,
  real_T c7_b_y[4]);
static uint8_T c7_c_emlrt_marshallIn(SFc7_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c7_b_is_active_c7_sliding_controller_const,
  const char_T *c7_identifier);
static uint8_T c7_d_emlrt_marshallIn(SFc7_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c7_u, const emlrtMsgIdentifier *c7_parentId);
static void init_dsm_address_info(SFc7_sliding_controller_constInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc7_sliding_controller_constInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c7_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c7_is_active_c7_sliding_controller_const = 0U;
  cudaGetLastError();
}

static void initialize_params_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void enable_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c7_do_animation_call_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance)
{
  const mxArray *c7_b_y = NULL;
  const mxArray *c7_c_y = NULL;
  const mxArray *c7_d_y = NULL;
  const mxArray *c7_st;
  c7_st = NULL;
  c7_b_y = NULL;
  sf_mex_assign(&c7_b_y, sf_mex_createcellmatrix(2, 1), false);
  c7_c_y = NULL;
  sf_mex_assign(&c7_c_y, sf_mex_create("y", *chartInstance->c7_y, 0, 0U, 1U, 0U,
    2, 2, 2), false);
  sf_mex_setcell(c7_b_y, 0, c7_c_y);
  c7_d_y = NULL;
  sf_mex_assign(&c7_d_y, sf_mex_create("y",
    &chartInstance->c7_is_active_c7_sliding_controller_const, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c7_b_y, 1, c7_d_y);
  sf_mex_assign(&c7_st, c7_b_y, false);
  return c7_st;
}

static void set_sim_state_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c7_st)
{
  const mxArray *c7_u;
  c7_u = sf_mex_dup(c7_st);
  c7_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c7_u, 0)), "y",
                      *chartInstance->c7_y);
  chartInstance->c7_is_active_c7_sliding_controller_const =
    c7_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c7_u, 1)),
    "is_active_c7_sliding_controller_const");
  sf_mex_destroy(&c7_u);
  sf_mex_destroy(&c7_st);
}

static void sf_gateway_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance)
{
  chartInstance->c7_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c7_eML_blk_kernel(chartInstance, *chartInstance->c7_q, *chartInstance->c7_y);
  c7_do_animation_call_c7_sliding_controller_const(chartInstance);
}

static void mdl_start_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance)
{
  cudaError_t c7_errCode;
  c7_errCode = cudaGetLastError();
  if (c7_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c7_errCode, (char_T *)cudaGetErrorName
                       (c7_errCode), (char_T *)cudaGetErrorString(c7_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c7_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void initSimStructsc7_sliding_controller_const
  (SFc7_sliding_controller_constInstanceStruct *chartInstance)
{
}

const mxArray *sf_c7_sliding_controller_const_get_eml_resolved_functions_info()
{
  const mxArray *c7_nameCaptureInfo = NULL;
  c7_nameCaptureInfo = NULL;
  sf_mex_assign(&c7_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c7_nameCaptureInfo;
}

static void c7_eML_blk_kernel(SFc7_sliding_controller_constInstanceStruct
  *chartInstance, real_T c7_b_q[2], real_T c7_b_y[4])
{
  c7_b_y[0] = -0.324 * muDoubleScalarSin(c7_b_q[0]);
  c7_b_y[2] = 0.0;
  c7_b_y[1] = 0.324 * muDoubleScalarCos(c7_b_q[0]);
  c7_b_y[3] = 0.0;
}

static void c7_emlrt_marshallIn(SFc7_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c7_b_y, const char_T *c7_identifier, real_T
  c7_c_y[4])
{
  emlrtMsgIdentifier c7_thisId;
  c7_thisId.fIdentifier = const_cast<const char_T *>(c7_identifier);
  c7_thisId.fParent = NULL;
  c7_thisId.bParentIsCell = false;
  c7_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c7_b_y), &c7_thisId, c7_c_y);
  sf_mex_destroy(&c7_b_y);
}

static void c7_b_emlrt_marshallIn(SFc7_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c7_u, const emlrtMsgIdentifier *c7_parentId,
  real_T c7_b_y[4])
{
  real_T c7_dv[4];
  int32_T c7_i;
  sf_mex_import(c7_parentId, sf_mex_dup(c7_u), c7_dv, 1, 0, 0U, 1, 0U, 2, 2, 2);
  for (c7_i = 0; c7_i < 4; c7_i++) {
    c7_b_y[c7_i] = c7_dv[c7_i];
  }

  sf_mex_destroy(&c7_u);
}

static uint8_T c7_c_emlrt_marshallIn(SFc7_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c7_b_is_active_c7_sliding_controller_const,
  const char_T *c7_identifier)
{
  emlrtMsgIdentifier c7_thisId;
  uint8_T c7_b_y;
  c7_thisId.fIdentifier = const_cast<const char_T *>(c7_identifier);
  c7_thisId.fParent = NULL;
  c7_thisId.bParentIsCell = false;
  c7_b_y = c7_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c7_b_is_active_c7_sliding_controller_const), &c7_thisId);
  sf_mex_destroy(&c7_b_is_active_c7_sliding_controller_const);
  return c7_b_y;
}

static uint8_T c7_d_emlrt_marshallIn(SFc7_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c7_u, const emlrtMsgIdentifier *c7_parentId)
{
  uint8_T c7_b_u;
  uint8_T c7_b_y;
  sf_mex_import(c7_parentId, sf_mex_dup(c7_u), &c7_b_u, 1, 3, 0U, 0, 0U, 0);
  c7_b_y = c7_b_u;
  sf_mex_destroy(&c7_u);
  return c7_b_y;
}

static void init_dsm_address_info(SFc7_sliding_controller_constInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc7_sliding_controller_constInstanceStruct
  *chartInstance)
{
  chartInstance->c7_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c7_q = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c7_y = (real_T (*)[4])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c7_sliding_controller_const_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(536815311U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1945133011U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2900394615U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(32238838U);
}

mxArray *sf_c7_sliding_controller_const_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c7_sliding_controller_const_jit_fallback_info(void)
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

mxArray *sf_c7_sliding_controller_const_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c7_sliding_controller_const(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfl"
    "UU90P4mcXxicklmWWp8cnm8cU5mSmZeenxyfl5JUX5OTmpRSBmcQmSPwF/xh4F"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c7_sliding_controller_const_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sFqlSox9r5ekjZXT2w93GAD";
}

static void sf_opaque_initialize_c7_sliding_controller_const(void
  *chartInstanceVar)
{
  initialize_params_c7_sliding_controller_const
    ((SFc7_sliding_controller_constInstanceStruct*) chartInstanceVar);
  initialize_c7_sliding_controller_const
    ((SFc7_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c7_sliding_controller_const(void *chartInstanceVar)
{
  enable_c7_sliding_controller_const
    ((SFc7_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c7_sliding_controller_const(void *chartInstanceVar)
{
  disable_c7_sliding_controller_const
    ((SFc7_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c7_sliding_controller_const(void *chartInstanceVar)
{
  sf_gateway_c7_sliding_controller_const
    ((SFc7_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c7_sliding_controller_const
  (SimStruct* S)
{
  return get_sim_state_c7_sliding_controller_const
    ((SFc7_sliding_controller_constInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c7_sliding_controller_const(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c7_sliding_controller_const
    ((SFc7_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c7_sliding_controller_const(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc7_sliding_controller_constInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_const_optimization_info();
    }

    mdl_cleanup_runtime_resources_c7_sliding_controller_const
      ((SFc7_sliding_controller_constInstanceStruct*) chartInstanceVar);
    ((SFc7_sliding_controller_constInstanceStruct*) chartInstanceVar)->
      ~SFc7_sliding_controller_constInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c7_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_start_c7_sliding_controller_const
    ((SFc7_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c7_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_terminate_c7_sliding_controller_const
    ((SFc7_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc7_sliding_controller_const
    ((SFc7_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c7_sliding_controller_const(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c7_sliding_controller_const
      ((SFc7_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc7_sliding_controller_const
      ((SFc7_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c7_sliding_controller_const_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u00AQdqOCQPyoQkhICAkuCI4IhIALtM0PRKS0wikgLtV2PYmXrHfN/iTNC3DjTThw50V",
    "4Ai5ceARmbScNju1QIipAWHLs9X4zOzPf7MzGW2lveXidx3v9guedxOcpvGteep3Ixiszd/p91b",
    "uRjd+jkLDRDlEk0l7lJUgEz0FLbg2Toi16shDGRA8UCIrYWCpTpk2zyHImBi0rqNOnX4aMhn4oL",
    "Q82UZYE24KPUVtszQ7qaTAF1LQAAhMqafthi5P+1GJlRvUQ6EDbqMoFDca3sTNLb1luWMyheQC0",
    "LbQhaLE+tM03xEDdHJS66TzV/gQoo5gzIgq9DYn2IcYAG9iNA/zdtgadysNoSJTZhJAMQXfYINE",
    "pBeR1Mo0T+0wQIxUjvBnxuhOct22Hoz1bMgBeERC0bVMBGcSSCVPOv99CT5uC7HNowL7tl2vz4a",
    "115L9gMAJVGrdeXQ5BkT5si9JFk4A0DxK2plkyDzMsghdEbVDkT0NQmr2YOdonyBN0UaIMBomTb",
    "d1VbIjhLdVmo7bLzEVbxkYp2XoRLNHWHEIVC1NtLSrqhHNdCuvKuAND4InWBjGkGpZqLcZpzYKu",
    "xAC79C7fDVYwJD6D1aUIWCFdwxwgqTvPsLD8iKRWGxnVMXkbnc789DysLQyoHqFQVAUUYRowZkl",
    "4y7UFTDvuEYhWmcS8InCaIYtQnu5Z0RhJNcCYVBSRQxcco6XASPeRS9wJuxo3TRXMcbkIRwkNIX",
    "AFhnHYwm2D2IKYaFfaNnDfDZkZN0BTxeICVi3uOixDTZdQ4xh2xUDIkWgpGflZjU/DC4DZRpRgo",
    "r+J9UuNW7h6ERWun93yDvvZ2Z/oZxO5/PPmjJ6VAj3ezDO/7ula9bo1fFuZ9N8ZuXO5dVZzcg63",
    "hvflD3e/fLqjT/AzTzvvvr7sLLP+x9rR+v/5bHxlUminG2c4l68O+2TGrtUC/Zdm9K9lY916y31",
    "58EDdhcGb16+6t0cP7jzeaKT8LLC3lrN38v2aq/iYZUl+KtoOsoOJGxObtmun//6MvScXxON09j",
    "29vj1aTv7iep7H1QXya/g2zuXtr69/bX05+XT9Vwvsv57j+3rS1/eIqxawR+/tac4C3Ol7VAqjJ",
    "Oeg3Ks2OT9/Nd+PKucds9zfYud/ud/P+8/0r+OW845Zbln/jtrH/zR8VT/wcvi1P9iPZc9Xvxv/",
    "2TvaOehqNn44/atTDxkPCk692TQeYXtFs/9Ann4H9QuzUw==",
    ""
  };

  static char newstr [1249] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c7_sliding_controller_const(SimStruct *S)
{
  const char* newstr = sf_c7_sliding_controller_const_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(3862277146U));
  ssSetChecksum1(S,(91435963U));
  ssSetChecksum2(S,(1279986540U));
  ssSetChecksum3(S,(1280830342U));
}

static void mdlRTW_c7_sliding_controller_const(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c7_sliding_controller_const(SimStruct *S)
{
  SFc7_sliding_controller_constInstanceStruct *chartInstance;
  chartInstance = (SFc7_sliding_controller_constInstanceStruct *)utMalloc(sizeof
    (SFc7_sliding_controller_constInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc7_sliding_controller_constInstanceStruct));
  chartInstance = new (chartInstance)
    SFc7_sliding_controller_constInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c7_sliding_controller_const;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c7_sliding_controller_const;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c7_sliding_controller_const;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c7_sliding_controller_const;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c7_sliding_controller_const;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c7_sliding_controller_const;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c7_sliding_controller_const;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c7_sliding_controller_const;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c7_sliding_controller_const;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c7_sliding_controller_const;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c7_sliding_controller_const;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c7_sliding_controller_const;
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
    chartInstance->c7_JITStateAnimation,
    chartInstance->c7_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c7_sliding_controller_const(chartInstance);
}

void c7_sliding_controller_const_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c7_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c7_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c7_sliding_controller_const(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c7_sliding_controller_const_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
