/* Include files */

#include "PD_rbdl_sfun.h"
#include "c1_PD_rbdl.h"
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
static void initialize_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance);
static void initialize_params_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct
  *chartInstance);
static void enable_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance);
static void disable_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance);
static void c1_do_animation_call_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct
  *chartInstance);
static void ext_mode_exec_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct
  *chartInstance);
static void set_sim_state_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c1_st);
static void sf_gateway_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance);
static void mdl_start_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct
  *chartInstance);
static void mdl_cleanup_runtime_resources_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *
  chartInstance);
static void initSimStructsc1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance);
static void c1_eML_blk_kernel(SFc1_PD_rbdlInstanceStruct *chartInstance, real_T
  c1_b_u[6], real_T c1_b_y[6]);
static void c1_emlrt_marshallIn(SFc1_PD_rbdlInstanceStruct *chartInstance, const
  mxArray *c1_b_y, const char_T *c1_identifier, real_T c1_c_y[6]);
static void c1_b_emlrt_marshallIn(SFc1_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c1_b_u, const emlrtMsgIdentifier *c1_parentId, real_T c1_b_y[6]);
static uint8_T c1_c_emlrt_marshallIn(SFc1_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c1_b_is_active_c1_PD_rbdl, const char_T *c1_identifier);
static uint8_T c1_d_emlrt_marshallIn(SFc1_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c1_b_u, const emlrtMsgIdentifier *c1_parentId);
static void init_dsm_address_info(SFc1_PD_rbdlInstanceStruct *chartInstance);
static void init_simulink_io_address(SFc1_PD_rbdlInstanceStruct *chartInstance);

/* Function Definitions */
static void initialize_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c1_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c1_is_active_c1_PD_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct
  *chartInstance)
{
}

static void enable_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c1_do_animation_call_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct
  *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct
  *chartInstance)
{
  const mxArray *c1_b_y = NULL;
  const mxArray *c1_c_y = NULL;
  const mxArray *c1_d_y = NULL;
  const mxArray *c1_st;
  c1_st = NULL;
  c1_b_y = NULL;
  sf_mex_assign(&c1_b_y, sf_mex_createcellmatrix(2, 1), false);
  c1_c_y = NULL;
  sf_mex_assign(&c1_c_y, sf_mex_create("y", *chartInstance->c1_y, 0, 0U, 1U, 0U,
    1, 6), false);
  sf_mex_setcell(c1_b_y, 0, c1_c_y);
  c1_d_y = NULL;
  sf_mex_assign(&c1_d_y, sf_mex_create("y",
    &chartInstance->c1_is_active_c1_PD_rbdl, 3, 0U, 0U, 0U, 0), false);
  sf_mex_setcell(c1_b_y, 1, c1_d_y);
  sf_mex_assign(&c1_st, c1_b_y, false);
  return c1_st;
}

static void set_sim_state_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c1_st)
{
  const mxArray *c1_b_u;
  c1_b_u = sf_mex_dup(c1_st);
  c1_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c1_b_u, 0)), "y",
                      *chartInstance->c1_y);
  chartInstance->c1_is_active_c1_PD_rbdl = c1_c_emlrt_marshallIn(chartInstance,
    sf_mex_dup(sf_mex_getcell(c1_b_u, 1)), "is_active_c1_PD_rbdl");
  sf_mex_destroy(&c1_b_u);
  sf_mex_destroy(&c1_st);
}

static void sf_gateway_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c1_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c1_eML_blk_kernel(chartInstance, *chartInstance->c1_u, *chartInstance->c1_y);
  c1_do_animation_call_c1_PD_rbdl(chartInstance);
}

static void mdl_start_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c1_errCode;
  c1_errCode = cudaGetLastError();
  if (c1_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c1_errCode, (char_T *)cudaGetErrorName
                       (c1_errCode), (char_T *)cudaGetErrorString(c1_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c1_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct
  *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *
  chartInstance)
{
}

static void initSimStructsc1_PD_rbdl(SFc1_PD_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c1_PD_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c1_nameCaptureInfo = NULL;
  c1_nameCaptureInfo = NULL;
  sf_mex_assign(&c1_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c1_nameCaptureInfo;
}

static void c1_eML_blk_kernel(SFc1_PD_rbdlInstanceStruct *chartInstance, real_T
  c1_b_u[6], real_T c1_b_y[6])
{
  c1_b_y[0] = c1_b_u[1];
  c1_b_y[1] = c1_b_u[2];
  c1_b_y[2] = c1_b_u[3];
  c1_b_y[3] = c1_b_u[0];
  c1_b_y[4] = c1_b_u[4];
  c1_b_y[5] = c1_b_u[5];
}

static void c1_emlrt_marshallIn(SFc1_PD_rbdlInstanceStruct *chartInstance, const
  mxArray *c1_b_y, const char_T *c1_identifier, real_T c1_c_y[6])
{
  emlrtMsgIdentifier c1_thisId;
  c1_thisId.fIdentifier = const_cast<const char_T *>(c1_identifier);
  c1_thisId.fParent = NULL;
  c1_thisId.bParentIsCell = false;
  c1_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c1_b_y), &c1_thisId, c1_c_y);
  sf_mex_destroy(&c1_b_y);
}

static void c1_b_emlrt_marshallIn(SFc1_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c1_b_u, const emlrtMsgIdentifier *c1_parentId, real_T c1_b_y[6])
{
  real_T c1_dv[6];
  int32_T c1_i;
  sf_mex_import(c1_parentId, sf_mex_dup(c1_b_u), c1_dv, 1, 0, 0U, 1, 0U, 1, 6);
  for (c1_i = 0; c1_i < 6; c1_i++) {
    c1_b_y[c1_i] = c1_dv[c1_i];
  }

  sf_mex_destroy(&c1_b_u);
}

static uint8_T c1_c_emlrt_marshallIn(SFc1_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c1_b_is_active_c1_PD_rbdl, const char_T *c1_identifier)
{
  emlrtMsgIdentifier c1_thisId;
  uint8_T c1_b_y;
  c1_thisId.fIdentifier = const_cast<const char_T *>(c1_identifier);
  c1_thisId.fParent = NULL;
  c1_thisId.bParentIsCell = false;
  c1_b_y = c1_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c1_b_is_active_c1_PD_rbdl), &c1_thisId);
  sf_mex_destroy(&c1_b_is_active_c1_PD_rbdl);
  return c1_b_y;
}

static uint8_T c1_d_emlrt_marshallIn(SFc1_PD_rbdlInstanceStruct *chartInstance,
  const mxArray *c1_b_u, const emlrtMsgIdentifier *c1_parentId)
{
  uint8_T c1_b_y;
  uint8_T c1_c_u;
  sf_mex_import(c1_parentId, sf_mex_dup(c1_b_u), &c1_c_u, 1, 3, 0U, 0, 0U, 0);
  c1_b_y = c1_c_u;
  sf_mex_destroy(&c1_b_u);
  return c1_b_y;
}

static void init_dsm_address_info(SFc1_PD_rbdlInstanceStruct *chartInstance)
{
}

static void init_simulink_io_address(SFc1_PD_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c1_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c1_u = (real_T (*)[6])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c1_y = (real_T (*)[6])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c1_PD_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1797144223U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(73479396U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(1318086020U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3398444244U);
}

mxArray *sf_c1_PD_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c1_PD_rbdl_jit_fallback_info(void)
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

mxArray *sf_c1_PD_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c1_PD_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPiD+wMjAwAakOYCYiQECWKF8RqgYI1ycBS6uAMQllQWpIPHiomTPFCCdl5gL5ie"
    "WVnjmpeWDzbdgQJjPhsV8RiTzOaHiEPDBnjL9Ig4g/QZI+lkI6BcAsiqh4QILH/LtV3CgTD/Efg"
    "8C7hdBcT+En1kcn5hcklmWGp9sGB/gEl+UlJLDgOQvAEWbF0A="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c1_PD_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sz4RAlAineuVo8CCV5Hr2sG";
}

static void sf_opaque_initialize_c1_PD_rbdl(void *chartInstanceVar)
{
  initialize_params_c1_PD_rbdl((SFc1_PD_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c1_PD_rbdl((SFc1_PD_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c1_PD_rbdl(void *chartInstanceVar)
{
  enable_c1_PD_rbdl((SFc1_PD_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c1_PD_rbdl(void *chartInstanceVar)
{
  disable_c1_PD_rbdl((SFc1_PD_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c1_PD_rbdl(void *chartInstanceVar)
{
  sf_gateway_c1_PD_rbdl((SFc1_PD_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c1_PD_rbdl(SimStruct* S)
{
  return get_sim_state_c1_PD_rbdl((SFc1_PD_rbdlInstanceStruct *)
    sf_get_chart_instance_ptr(S));     /* raw sim ctx */
}

static void sf_opaque_set_sim_state_c1_PD_rbdl(SimStruct* S, const mxArray *st)
{
  set_sim_state_c1_PD_rbdl((SFc1_PD_rbdlInstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_cleanup_runtime_resources_c1_PD_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc1_PD_rbdlInstanceStruct*) chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_PD_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c1_PD_rbdl((SFc1_PD_rbdlInstanceStruct*)
      chartInstanceVar);
    ((SFc1_PD_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc1_PD_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c1_PD_rbdl(void *chartInstanceVar)
{
  mdl_start_c1_PD_rbdl((SFc1_PD_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c1_PD_rbdl(void *chartInstanceVar)
{
  mdl_terminate_c1_PD_rbdl((SFc1_PD_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc1_PD_rbdl((SFc1_PD_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c1_PD_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c1_PD_rbdl((SFc1_PD_rbdlInstanceStruct*)
      sf_get_chart_instance_ptr(S));
    initSimStructsc1_PD_rbdl((SFc1_PD_rbdlInstanceStruct*)
      sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c1_PD_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV01v00AQdaKCAEFVoUpwQKI3OAICqVygrZNApJZWdVqO1daexKusd939SBskuHHkP3Dhyt+",
    "BOxdOqBIHrsw6bhoc22mJWgHCkuus/ebtzLzZ2a1Taa45eM3ife+641zE5yW8q87gupCOKyP34P",
    "2Mcycdv0MjbqINIkmknNKLkwg2QQlmNBW8ydsiF0Z5GyRwH7GxkLqITdHIMMq7DcN9y6dehtQPv",
    "VAYFqygLQnWOesjW2z0BvLUqARfNwACHUphOmGDkc7QY6n33RD8rjJRWQgKtGdi65ZaM0zTmEH9",
    "APwmV5qgx+rYN08TDa4+KAzTRqq8I6CIYkYJz402JMqDGBOsYSsO8O+60RhUFuaHROoVCEkP1Cr",
    "tJpyCQ5aTKvywSznRQlLC6hFzreG4bxsM/VkTAbCShKBvKxJINxaU62L9vQZGWudkl0ENdk2nmM",
    "2DPWPF36awD7Iwb21X9ECSDqzzwkmThNQPErWGVTIO0zSCbSKXfdRPQVBYvVg5yiOoE7TQoggGS",
    "ZBN1ZK0h+ktZDNR01bmpCVjooHYahIsYav3oEyFIVvD5y5hTBXCWiJehR6whLVGNCmHDVjzcUrR",
    "oCUwwba8i1eD4RSFT2Gu4AHNlauXASR95wU2ll+RvlFaRC4Wb211dfzzOKzJNcg28SGvC0hCFWD",
    "OkvQWswVUWe0RiF7pxL088KBCJqEc1Ta8ti9kF3NS0kSOQ7CKFgIj1UEtcSVsKVw0ZTCr5SScT/",
    "wQAttgKIM1XDaIzcmJsq1tGdddj+p+DZQvaZyjqsFVh22obguqH8MW73KxzxtSRF7a4wfpBcBqI",
    "5JT3lnB/iX7DZw9T4pkP3OO97OrJ9jPjuyyz7sjPJUcHmfkmZ33crV83ir+qqR2SyN21zLzzGTs",
    "LG4O7x8f9j5+uXnl67e3rz99f/ymNc3876un2/9n0/Gto0Y7XDi9sXq12Ocjfs3k8N8Y4Z9Lx+r",
    "Vw81ltkw5mG2x6Lrbj57LB+pZwndYKfe3mvH36P2C7fhYZUl9Sr8ZpAcTOyZmsF1b/sURfy9OyM",
    "fl9P3gOnw6nf38UlbHmQn2c/irn6nb359/YWk6+5PpPZ/Rez7Z13eI7Raw49/f2ajtyN2AZdfj7",
    "9b3ae2cc7b7W/z8b3f2up9kvzpvO+ec7aaN77T79p+GL+v/TgY/9wfHMe156qzxn53TnXtup+Mn",
    "w39t3JCyIOeUm37GI2s77+s/UKc/Af73r2c=",
    ""
  };

  static char newstr [1237] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c1_PD_rbdl(SimStruct *S)
{
  const char* newstr = sf_c1_PD_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(2926683639U));
  ssSetChecksum1(S,(3892975843U));
  ssSetChecksum2(S,(3615327726U));
  ssSetChecksum3(S,(1417558515U));
}

static void mdlRTW_c1_PD_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c1_PD_rbdl(SimStruct *S)
{
  SFc1_PD_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc1_PD_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc1_PD_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc1_PD_rbdlInstanceStruct));
  chartInstance = new (chartInstance) SFc1_PD_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway = sf_opaque_gateway_c1_PD_rbdl;
  chartInstance->chartInfo.initializeChart = sf_opaque_initialize_c1_PD_rbdl;
  chartInstance->chartInfo.mdlStart = sf_opaque_mdl_start_c1_PD_rbdl;
  chartInstance->chartInfo.mdlTerminate = sf_opaque_mdl_terminate_c1_PD_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c1_PD_rbdl;
  chartInstance->chartInfo.enableChart = sf_opaque_enable_c1_PD_rbdl;
  chartInstance->chartInfo.disableChart = sf_opaque_disable_c1_PD_rbdl;
  chartInstance->chartInfo.getSimState = sf_opaque_get_sim_state_c1_PD_rbdl;
  chartInstance->chartInfo.setSimState = sf_opaque_set_sim_state_c1_PD_rbdl;
  chartInstance->chartInfo.getSimStateInfo = sf_get_sim_state_info_c1_PD_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c1_PD_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths = mdlSetWorkWidths_c1_PD_rbdl;
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
    chartInstance->c1_JITStateAnimation,
    chartInstance->c1_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c1_PD_rbdl(chartInstance);
}

void c1_PD_rbdl_method_dispatcher(SimStruct *S, int_T method, void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c1_PD_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c1_PD_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c1_PD_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c1_PD_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
