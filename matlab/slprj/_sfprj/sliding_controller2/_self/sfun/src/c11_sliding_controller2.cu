/* Include files */

#include "sliding_controller2_sfun.h"
#include "c11_sliding_controller2.h"
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
static void initialize_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance);
static void initialize_params_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance);
static void enable_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance);
static void disable_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance);
static void c11_do_animation_call_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance);
static void ext_mode_exec_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance);
static const mxArray *get_sim_state_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance);
static void set_sim_state_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance, const mxArray *c11_st);
static void sf_gateway_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance);
static void mdl_start_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance);
static void mdl_terminate_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance);
static void initSimStructsc11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance);
static void c11_eML_blk_kernel(SFc11_sliding_controller2InstanceStruct
  *chartInstance, real_T c11_b_q[2], real_T c11_b_y[4]);
static void c11_emlrt_marshallIn(SFc11_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c11_b_y, const char_T *c11_identifier, real_T
  c11_c_y[4]);
static void c11_b_emlrt_marshallIn(SFc11_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c11_u, const emlrtMsgIdentifier *c11_parentId,
  real_T c11_b_y[4]);
static uint8_T c11_c_emlrt_marshallIn(SFc11_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c11_b_is_active_c11_sliding_controller2, const
  char_T *c11_identifier);
static uint8_T c11_d_emlrt_marshallIn(SFc11_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c11_u, const emlrtMsgIdentifier *c11_parentId);
static void init_dsm_address_info(SFc11_sliding_controller2InstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc11_sliding_controller2InstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c11_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c11_is_active_c11_sliding_controller2 = 0U;
  cudaGetLastError();
}

static void initialize_params_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance)
{
}

static void enable_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c11_do_animation_call_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance)
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
    &chartInstance->c11_is_active_c11_sliding_controller2, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c11_b_y, 1, c11_d_y);
  sf_mex_assign(&c11_st, c11_b_y, false);
  return c11_st;
}

static void set_sim_state_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance, const mxArray *c11_st)
{
  const mxArray *c11_u;
  c11_u = sf_mex_dup(c11_st);
  c11_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c11_u, 0)), "y",
                       *chartInstance->c11_y);
  chartInstance->c11_is_active_c11_sliding_controller2 = c11_c_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c11_u, 1)),
     "is_active_c11_sliding_controller2");
  sf_mex_destroy(&c11_u);
  sf_mex_destroy(&c11_st);
}

static void sf_gateway_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance)
{
  chartInstance->c11_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c11_eML_blk_kernel(chartInstance, *chartInstance->c11_q, *chartInstance->c11_y);
  c11_do_animation_call_c11_sliding_controller2(chartInstance);
}

static void mdl_start_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance)
{
}

static void mdl_terminate_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance)
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

static void mdl_setup_runtime_resources_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance)
{
}

static void initSimStructsc11_sliding_controller2
  (SFc11_sliding_controller2InstanceStruct *chartInstance)
{
}

const mxArray *sf_c11_sliding_controller2_get_eml_resolved_functions_info()
{
  const mxArray *c11_nameCaptureInfo = NULL;
  c11_nameCaptureInfo = NULL;
  sf_mex_assign(&c11_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c11_nameCaptureInfo;
}

static void c11_eML_blk_kernel(SFc11_sliding_controller2InstanceStruct
  *chartInstance, real_T c11_b_q[2], real_T c11_b_y[4])
{
  c11_b_y[0] = -0.324 * muDoubleScalarSin(c11_b_q[0]);
  c11_b_y[2] = 0.0;
  c11_b_y[1] = 0.324 * muDoubleScalarCos(c11_b_q[0]);
  c11_b_y[3] = 0.0;
}

static void c11_emlrt_marshallIn(SFc11_sliding_controller2InstanceStruct
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

static void c11_b_emlrt_marshallIn(SFc11_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c11_u, const emlrtMsgIdentifier *c11_parentId,
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

static uint8_T c11_c_emlrt_marshallIn(SFc11_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c11_b_is_active_c11_sliding_controller2, const
  char_T *c11_identifier)
{
  emlrtMsgIdentifier c11_thisId;
  uint8_T c11_b_y;
  c11_thisId.fIdentifier = const_cast<const char_T *>(c11_identifier);
  c11_thisId.fParent = NULL;
  c11_thisId.bParentIsCell = false;
  c11_b_y = c11_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c11_b_is_active_c11_sliding_controller2), &c11_thisId);
  sf_mex_destroy(&c11_b_is_active_c11_sliding_controller2);
  return c11_b_y;
}

static uint8_T c11_d_emlrt_marshallIn(SFc11_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c11_u, const emlrtMsgIdentifier *c11_parentId)
{
  uint8_T c11_b_u;
  uint8_T c11_b_y;
  sf_mex_import(c11_parentId, sf_mex_dup(c11_u), &c11_b_u, 1, 3, 0U, 0, 0U, 0);
  c11_b_y = c11_b_u;
  sf_mex_destroy(&c11_u);
  return c11_b_y;
}

static void init_dsm_address_info(SFc11_sliding_controller2InstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc11_sliding_controller2InstanceStruct
  *chartInstance)
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
void sf_c11_sliding_controller2_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(536815311U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1945133011U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2900394615U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(32238838U);
}

mxArray *sf_c11_sliding_controller2_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c11_sliding_controller2_jit_fallback_info(void)
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

mxArray *sf_c11_sliding_controller2_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c11_sliding_controller2(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfk"
    "UU90P4mcXxicklmWWp8cmGhvHFOZkpmXnp8cn5eSVF+Tk5qUVGSOaDAABa1RvU"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c11_sliding_controller2_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sFqlSox9r5ekjZXT2w93GAD";
}

static void sf_opaque_initialize_c11_sliding_controller2(void *chartInstanceVar)
{
  initialize_params_c11_sliding_controller2
    ((SFc11_sliding_controller2InstanceStruct*) chartInstanceVar);
  initialize_c11_sliding_controller2((SFc11_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c11_sliding_controller2(void *chartInstanceVar)
{
  enable_c11_sliding_controller2((SFc11_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c11_sliding_controller2(void *chartInstanceVar)
{
  disable_c11_sliding_controller2((SFc11_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c11_sliding_controller2(void *chartInstanceVar)
{
  sf_gateway_c11_sliding_controller2((SFc11_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c11_sliding_controller2(SimStruct*
  S)
{
  return get_sim_state_c11_sliding_controller2
    ((SFc11_sliding_controller2InstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c11_sliding_controller2(SimStruct* S, const
  mxArray *st)
{
  set_sim_state_c11_sliding_controller2((SFc11_sliding_controller2InstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_cleanup_runtime_resources_c11_sliding_controller2(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc11_sliding_controller2InstanceStruct*) chartInstanceVar
      )->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller2_optimization_info();
    }

    mdl_cleanup_runtime_resources_c11_sliding_controller2
      ((SFc11_sliding_controller2InstanceStruct*) chartInstanceVar);
    ((SFc11_sliding_controller2InstanceStruct*) chartInstanceVar)->
      ~SFc11_sliding_controller2InstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c11_sliding_controller2(void *chartInstanceVar)
{
  mdl_start_c11_sliding_controller2((SFc11_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c11_sliding_controller2(void
  *chartInstanceVar)
{
  mdl_terminate_c11_sliding_controller2((SFc11_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc11_sliding_controller2((SFc11_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c11_sliding_controller2(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c11_sliding_controller2
      ((SFc11_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc11_sliding_controller2
      ((SFc11_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c11_sliding_controller2_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV0tv00AQdqOCQDxUISQkhASc4MhDSHCBtnlAREornALiUm3Xk3jJetfsI2n+ADf+CQfu/BF",
    "+ARcu/ARmbScNju1QIipAWHKdtb+ZnZlvHltvpb3l4XUe7/ULnncSn6fwrnnpdSJbr8zc6ftV70",
    "a2fo9CwkY7RJFIe5WXIBE8By25NUyKtujJQhgTPVAgKGJjqUyZNs0iy5kYtKygTp9+GTIa+qG0P",
    "NhEWRJsCz5GbbE1O6inwRRQ0wIITKik7YctTvpTi5UZ1UOgA22jKhc0GN/Gziy9ZblhMYfmAdC2",
    "0IagxfrQNt8QA3VzUOqm81T7E6CMYs6IKPQ2JNqHGANsYDcO8O+2NehUHkZDoswmhGQIusMGiU4",
    "pIK+TafywzwQxUjHCmxGvO8F523Y42rMlA+AVAUHbNhWQQSyZMOX8+y30tCnIPocG7Nt+uTYf3l",
    "pH/gsGI1ClcevV5RAU6cO2KN00CUjzIGFrmiXzMMMieEHUBkX+NASl2YuZo32CPEEXJcpgkDjZ1",
    "l3FhhjeUm02arvMXFQyNkrJ1otgibbmEKpYmGprUVEnnOtSWFfGHRgCT7Q2iCHVsFRrMU5rFnQl",
    "Btild3k1WMGQ+AxWlyJghXQNc4Ck7zzDxvIjklptZFTH5G10OvOf52FtYUD1CIWiLqAI04AxS8J",
    "bri1g2nGPQLTKJOYVgdMMWYTydM+KxkiqAcakookcuuAYLQVGuo9cYiXsaiyaKpjjchGOEhpC4B",
    "oM47CFZYPYgpho19o2sO6GzIwboKlicQGrFqsO21DTJdQ4hl0xEHIkWkpGftbj0/ACYLYRJZjob",
    "2L/UuMW7l5EhZtnt7zDeXb2J+bZRC7/vDmjZ6VAjzfzzO97ula9bw1/rUzm74zcudw+qzk5h1vD",
    "+/KHe18+3dUn+JmnnXdfX3aW2f9j7Wjz/3y2vjJptNPCGc7lq8M+mbFrtUD/pRn9a9lat95yXx4",
    "8UPdg8Ob1q+6d0YO7jzcaKT8L7K3l7J28v+Y6PmZZkp+KtoPsYOLWxKbj2um/P2PvyQXxOJ29T6",
    "9vj5aTv7ie53F1gfwa/hrn8vbX97+2vpx8uv+rBfZfz/F9PZnre8R1C9ijt2/vac4CLPU9KoVRk",
    "nNQdwrq81fz/ahy3jHL/S12/pf7/bz/zPw6bjnvmOWW9e+oc/xPw1fNAy+HX/uD/Vj2fPW78Z+9",
    "o52Drmbrh9N/deoh40HBqTf7jEfYXtHXfyBPvwM8mrEi",
    ""
  };

  static char newstr [1245] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c11_sliding_controller2(SimStruct *S)
{
  const char* newstr = sf_c11_sliding_controller2_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(3862277146U));
  ssSetChecksum1(S,(91435963U));
  ssSetChecksum2(S,(1279986540U));
  ssSetChecksum3(S,(1280830342U));
}

static void mdlRTW_c11_sliding_controller2(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c11_sliding_controller2(SimStruct *S)
{
  SFc11_sliding_controller2InstanceStruct *chartInstance;
  chartInstance = (SFc11_sliding_controller2InstanceStruct *)utMalloc(sizeof
    (SFc11_sliding_controller2InstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc11_sliding_controller2InstanceStruct));
  chartInstance = new (chartInstance) SFc11_sliding_controller2InstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c11_sliding_controller2;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c11_sliding_controller2;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c11_sliding_controller2;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c11_sliding_controller2;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c11_sliding_controller2;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c11_sliding_controller2;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c11_sliding_controller2;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c11_sliding_controller2;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c11_sliding_controller2;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c11_sliding_controller2;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c11_sliding_controller2;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c11_sliding_controller2;
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

  mdl_setup_runtime_resources_c11_sliding_controller2(chartInstance);
}

void c11_sliding_controller2_method_dispatcher(SimStruct *S, int_T method, void *
  data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c11_sliding_controller2(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c11_sliding_controller2(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c11_sliding_controller2(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c11_sliding_controller2_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
