/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c7_sliding_controller_rbdl.h"
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
static void initialize_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c7_do_animation_call_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c7_st);
static void sf_gateway_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c7_eML_blk_kernel(SFc7_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c7_b_q[2], real_T c7_b_y[4]);
static void c7_emlrt_marshallIn(SFc7_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c7_b_y, const char_T *c7_identifier, real_T
  c7_c_y[4]);
static void c7_b_emlrt_marshallIn(SFc7_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c7_u, const emlrtMsgIdentifier *c7_parentId,
  real_T c7_b_y[4]);
static uint8_T c7_c_emlrt_marshallIn(SFc7_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c7_b_is_active_c7_sliding_controller_rbdl, const
  char_T *c7_identifier);
static uint8_T c7_d_emlrt_marshallIn(SFc7_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c7_u, const emlrtMsgIdentifier *c7_parentId);
static void init_dsm_address_info(SFc7_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc7_sliding_controller_rbdlInstanceStruct *
  chartInstance);

/* Function Definitions */
static void initialize_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c7_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c7_is_active_c7_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c7_do_animation_call_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance)
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
    &chartInstance->c7_is_active_c7_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c7_b_y, 1, c7_d_y);
  sf_mex_assign(&c7_st, c7_b_y, false);
  return c7_st;
}

static void set_sim_state_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c7_st)
{
  const mxArray *c7_u;
  c7_u = sf_mex_dup(c7_st);
  c7_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c7_u, 0)), "y",
                      *chartInstance->c7_y);
  chartInstance->c7_is_active_c7_sliding_controller_rbdl = c7_c_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c7_u, 1)),
     "is_active_c7_sliding_controller_rbdl");
  sf_mex_destroy(&c7_u);
  sf_mex_destroy(&c7_st);
}

static void sf_gateway_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c7_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c7_eML_blk_kernel(chartInstance, *chartInstance->c7_q, *chartInstance->c7_y);
  c7_do_animation_call_c7_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance)
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

static void mdl_setup_runtime_resources_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc7_sliding_controller_rbdl
  (SFc7_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c7_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c7_nameCaptureInfo = NULL;
  c7_nameCaptureInfo = NULL;
  sf_mex_assign(&c7_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c7_nameCaptureInfo;
}

static void c7_eML_blk_kernel(SFc7_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c7_b_q[2], real_T c7_b_y[4])
{
  c7_b_y[0] = -0.324 * muDoubleScalarSin(c7_b_q[0]);
  c7_b_y[2] = 0.0;
  c7_b_y[1] = 0.324 * muDoubleScalarCos(c7_b_q[0]);
  c7_b_y[3] = 0.0;
}

static void c7_emlrt_marshallIn(SFc7_sliding_controller_rbdlInstanceStruct
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

static void c7_b_emlrt_marshallIn(SFc7_sliding_controller_rbdlInstanceStruct
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

static uint8_T c7_c_emlrt_marshallIn(SFc7_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c7_b_is_active_c7_sliding_controller_rbdl, const
  char_T *c7_identifier)
{
  emlrtMsgIdentifier c7_thisId;
  uint8_T c7_b_y;
  c7_thisId.fIdentifier = const_cast<const char_T *>(c7_identifier);
  c7_thisId.fParent = NULL;
  c7_thisId.bParentIsCell = false;
  c7_b_y = c7_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c7_b_is_active_c7_sliding_controller_rbdl), &c7_thisId);
  sf_mex_destroy(&c7_b_is_active_c7_sliding_controller_rbdl);
  return c7_b_y;
}

static uint8_T c7_d_emlrt_marshallIn(SFc7_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c7_u, const emlrtMsgIdentifier *c7_parentId)
{
  uint8_T c7_b_u;
  uint8_T c7_b_y;
  sf_mex_import(c7_parentId, sf_mex_dup(c7_u), &c7_b_u, 1, 3, 0U, 0, 0U, 0);
  c7_b_y = c7_b_u;
  sf_mex_destroy(&c7_u);
  return c7_b_y;
}

static void init_dsm_address_info(SFc7_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc7_sliding_controller_rbdlInstanceStruct *
  chartInstance)
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
void sf_c7_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(536815311U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1945133011U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2900394615U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(32238838U);
}

mxArray *sf_c7_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c7_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c7_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c7_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfh"
    "UU90P4mcXxicklmWWp8cnm8cU5mSmZeenxyfl5JUX5OTmpRfFFSSk5DEj+BAB5JB2A"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c7_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sFqlSox9r5ekjZXT2w93GAD";
}

static void sf_opaque_initialize_c7_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c7_sliding_controller_rbdl
    ((SFc7_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c7_sliding_controller_rbdl
    ((SFc7_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c7_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c7_sliding_controller_rbdl((SFc7_sliding_controller_rbdlInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c7_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c7_sliding_controller_rbdl((SFc7_sliding_controller_rbdlInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c7_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c7_sliding_controller_rbdl
    ((SFc7_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c7_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c7_sliding_controller_rbdl
    ((SFc7_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c7_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c7_sliding_controller_rbdl
    ((SFc7_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c7_sliding_controller_rbdl(void *
  chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc7_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c7_sliding_controller_rbdl
      ((SFc7_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc7_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc7_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c7_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c7_sliding_controller_rbdl
    ((SFc7_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c7_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c7_sliding_controller_rbdl
    ((SFc7_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc7_sliding_controller_rbdl
    ((SFc7_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c7_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c7_sliding_controller_rbdl
      ((SFc7_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc7_sliding_controller_rbdl
      ((SFc7_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c7_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u00oUdqMWgeCiCiEhISRYIHGXCISADbTND0Q3va1wCohNNB2fxEPGM2Z+kuYF2PEmd3H",
    "390V4AjZseIR7xnbS4NhOS0QFCEuuM/Z3zpxzvvMz9dbaux5el/HeuuJ55/B5Hu+al14b2Xpt7k",
    "7fr3t3svUHFBI22ieKRNqrvASJ4AVoya1hUrRFXxbCmOiDAkERG0tlyrRpFlnOxLBlBXX69KuQ0",
    "dAPpeXBDsqSYE/wCWqLrdlHPQ2mgJoWQGBCJe0gbHEymFmszLgeAh1qG1W5oMH4NnZm6V3LDYs5",
    "NI+AtoU2BC3Wx7b5hhiom6NSN52n2p8CZRRzRkShtyHRPsQYYAMHcYB/96xBp/IwGhJldiAkI9A",
    "dNkx0SgF5nUzjh0MmiJGKEd6MeN0JLtq2z9GeXRkArwgI2rajgAxjyYQp599voadNQQ45NODQDs",
    "q1+fDOOvJfMhiDKo1bvy5HoMgA9kTppklAmkcJW7MsWYQZFsFLorYp8qchKM1ezBztE+QJuihRB",
    "oPEybbuKjbC8JZqs1HbZeaykrFRSrZeBku0NUdQxcJMW4uKOuFcl8K6Mu7ACHiitUEMqYalWotx",
    "WrOgKzHALr3Lq8EKhsRnsLoUASuka5QDJH3nb2wsXyOp1UZGdUzeRqez+HkR1hYGVJ9QKOoCijA",
    "NGLMkvOXaAqYd9whEq0xiXhE4zZBlKE/3rWiMpRpiTCqayLELjtFSYKQHyCVWwoHGoqmCOS6X4S",
    "ihIQSuwTAOu1g2iC2IiXatbRvrbsTMpAGaKhYXsGqx6rANNV1CTWI4EEMhx6KlZORnPT4NLwBmG",
    "1GCicEO9i81aeHuRVS4eXbXO55nl04wz6Zy+eefc3rWCvR4c8/8vhdq1fvW8NfadP7Oyf2R22c9",
    "J+dwm3hf/+fBp//u6w1+8a/O+8+vOqvs/2/tdPP/cra+MW20s8IZLeSrwz6fs2u9QP+1Of2b2Vq",
    "33nFfHj1WD2D49s3r7r3x4/vPthspP0vsreXsnb6/5To+ZlmSn4q2g+xg4tbEpuPa6X80Z++5Jf",
    "G4kL1Pry9PV5O/upXncX2J/Cb+muTy9tv3v7W1mny6/+sl9t/O8X07mes94roF9OjDnuYswErvU",
    "SmMkpyD6qnDgOfr81vz/bRy3hnL/Sx2/pb7/ryfZH6dtZx3xnKr+nfaOf6j4avmgZfDb/7Afqx6",
    "vvre+I/e6c5BN7P1k9m/OvWQ8aDg1Jt9xiNsv+jrL5Cn/wMAbLLO",
    ""
  };

  static char newstr [1253] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c7_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c7_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(3862277146U));
  ssSetChecksum1(S,(91435963U));
  ssSetChecksum2(S,(1279986540U));
  ssSetChecksum3(S,(1280830342U));
}

static void mdlRTW_c7_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c7_sliding_controller_rbdl(SimStruct *S)
{
  SFc7_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc7_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc7_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc7_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance) SFc7_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c7_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c7_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c7_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c7_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c7_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c7_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c7_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c7_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c7_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c7_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c7_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c7_sliding_controller_rbdl;
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

  mdl_setup_runtime_resources_c7_sliding_controller_rbdl(chartInstance);
}

void c7_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c7_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c7_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c7_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c7_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
