/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c25_sliding_controller_rbdl.h"
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
static void initialize_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c25_do_animation_call_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c25_st);
static void sf_gateway_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c25_eML_blk_kernel(SFc25_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c25_b_u[6], real_T c25_b_y[6]);
static void c25_emlrt_marshallIn(SFc25_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c25_b_y, const char_T *c25_identifier, real_T
  c25_c_y[6]);
static void c25_b_emlrt_marshallIn(SFc25_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c25_b_u, const emlrtMsgIdentifier *c25_parentId,
  real_T c25_b_y[6]);
static uint8_T c25_c_emlrt_marshallIn
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c25_b_is_active_c25_sliding_controller_rbdl, const char_T *c25_identifier);
static uint8_T c25_d_emlrt_marshallIn
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c25_b_u, const emlrtMsgIdentifier *c25_parentId);
static void init_dsm_address_info(SFc25_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc25_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c25_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c25_is_active_c25_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c25_do_animation_call_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  const mxArray *c25_b_y = NULL;
  const mxArray *c25_c_y = NULL;
  const mxArray *c25_d_y = NULL;
  const mxArray *c25_st;
  c25_st = NULL;
  c25_b_y = NULL;
  sf_mex_assign(&c25_b_y, sf_mex_createcellmatrix(2, 1), false);
  c25_c_y = NULL;
  sf_mex_assign(&c25_c_y, sf_mex_create("y", *chartInstance->c25_y, 0, 0U, 1U,
    0U, 2, 1, 6), false);
  sf_mex_setcell(c25_b_y, 0, c25_c_y);
  c25_d_y = NULL;
  sf_mex_assign(&c25_d_y, sf_mex_create("y",
    &chartInstance->c25_is_active_c25_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c25_b_y, 1, c25_d_y);
  sf_mex_assign(&c25_st, c25_b_y, false);
  return c25_st;
}

static void set_sim_state_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c25_st)
{
  const mxArray *c25_b_u;
  c25_b_u = sf_mex_dup(c25_st);
  c25_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c25_b_u, 0)),
                       "y", *chartInstance->c25_y);
  chartInstance->c25_is_active_c25_sliding_controller_rbdl =
    c25_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c25_b_u, 1)),
    "is_active_c25_sliding_controller_rbdl");
  sf_mex_destroy(&c25_b_u);
  sf_mex_destroy(&c25_st);
}

static void sf_gateway_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c25_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c25_eML_blk_kernel(chartInstance, *chartInstance->c25_u, *chartInstance->c25_y);
  c25_do_animation_call_c25_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c25_errCode;
  c25_errCode = cudaGetLastError();
  if (c25_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c25_errCode, (char_T *)cudaGetErrorName
                       (c25_errCode), (char_T *)cudaGetErrorString(c25_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c25_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc25_sliding_controller_rbdl
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c25_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c25_nameCaptureInfo = NULL;
  c25_nameCaptureInfo = NULL;
  sf_mex_assign(&c25_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c25_nameCaptureInfo;
}

static void c25_eML_blk_kernel(SFc25_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c25_b_u[6], real_T c25_b_y[6])
{
  c25_b_y[0] = c25_b_u[3];
  c25_b_y[1] = c25_b_u[0];
  c25_b_y[2] = c25_b_u[1];
  c25_b_y[3] = c25_b_u[2];
  c25_b_y[4] = c25_b_u[4];
  c25_b_y[5] = c25_b_u[5];
}

static void c25_emlrt_marshallIn(SFc25_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c25_b_y, const char_T *c25_identifier, real_T
  c25_c_y[6])
{
  emlrtMsgIdentifier c25_thisId;
  c25_thisId.fIdentifier = const_cast<const char_T *>(c25_identifier);
  c25_thisId.fParent = NULL;
  c25_thisId.bParentIsCell = false;
  c25_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c25_b_y), &c25_thisId,
    c25_c_y);
  sf_mex_destroy(&c25_b_y);
}

static void c25_b_emlrt_marshallIn(SFc25_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c25_b_u, const emlrtMsgIdentifier *c25_parentId,
  real_T c25_b_y[6])
{
  real_T c25_dv[6];
  int32_T c25_i;
  sf_mex_import(c25_parentId, sf_mex_dup(c25_b_u), c25_dv, 1, 0, 0U, 1, 0U, 2, 1,
                6);
  for (c25_i = 0; c25_i < 6; c25_i++) {
    c25_b_y[c25_i] = c25_dv[c25_i];
  }

  sf_mex_destroy(&c25_b_u);
}

static uint8_T c25_c_emlrt_marshallIn
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c25_b_is_active_c25_sliding_controller_rbdl, const char_T *c25_identifier)
{
  emlrtMsgIdentifier c25_thisId;
  uint8_T c25_b_y;
  c25_thisId.fIdentifier = const_cast<const char_T *>(c25_identifier);
  c25_thisId.fParent = NULL;
  c25_thisId.bParentIsCell = false;
  c25_b_y = c25_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c25_b_is_active_c25_sliding_controller_rbdl), &c25_thisId);
  sf_mex_destroy(&c25_b_is_active_c25_sliding_controller_rbdl);
  return c25_b_y;
}

static uint8_T c25_d_emlrt_marshallIn
  (SFc25_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c25_b_u, const emlrtMsgIdentifier *c25_parentId)
{
  uint8_T c25_b_y;
  uint8_T c25_c_u;
  sf_mex_import(c25_parentId, sf_mex_dup(c25_b_u), &c25_c_u, 1, 3, 0U, 0, 0U, 0);
  c25_b_y = c25_c_u;
  sf_mex_destroy(&c25_b_u);
  return c25_b_y;
}

static void init_dsm_address_info(SFc25_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc25_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
  chartInstance->c25_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c25_u = (real_T (*)[6])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c25_y = (real_T (*)[6])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c25_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(355923390U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(3254592024U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(515668378U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(305817613U);
}

mxArray *sf_c25_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c25_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c25_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c25_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfl"
    "UU90P4mcXxicklmWWp8clGpvHFOZkpmXnp8cn5eSVF+Tk5qUXxRUkpOUj+BAB2aB2y"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c25_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sDt8ga6s3SmK65qEWTBZYi";
}

static void sf_opaque_initialize_c25_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c25_sliding_controller_rbdl
    ((SFc25_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c25_sliding_controller_rbdl
    ((SFc25_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c25_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c25_sliding_controller_rbdl
    ((SFc25_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c25_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c25_sliding_controller_rbdl
    ((SFc25_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c25_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c25_sliding_controller_rbdl
    ((SFc25_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c25_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c25_sliding_controller_rbdl
    ((SFc25_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c25_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c25_sliding_controller_rbdl
    ((SFc25_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c25_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc25_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c25_sliding_controller_rbdl
      ((SFc25_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc25_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc25_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c25_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c25_sliding_controller_rbdl
    ((SFc25_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c25_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c25_sliding_controller_rbdl
    ((SFc25_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc25_sliding_controller_rbdl
    ((SFc25_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c25_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c25_sliding_controller_rbdl
      ((SFc25_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc25_sliding_controller_rbdl
      ((SFc25_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c25_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u20YQpgXXqJEmNYLApwBJDkHSW5HARk6toz9EiBUbpWynuQjr5UhcaLnL7I9sPUSepb3",
    "1JfoAfYw8QmZJSlYokoot2HCLEqCpJb+ZnZlvftbeWqfr4XUP7737nreBz+/xrnnp9V22Xpu70/",
    "fr3rNs/QmFhI0OiSKR9iovQSL4DbTk1jApOmIgC2FMDECBoIiNpTJl2jSLLGdi1LaCOn36JGQ09",
    "ENpeVBHWRIcCD5BbbE1h6inyRRQ0wYITKikHYZtToYzi5U5a4RAR9pGVS5oML6NnVm6a7lhMYfW",
    "OdCO0IagxfrCNt8QAw1zXuqm81T7U6CMYs6IKPQ2JNqHGANs4CgO8O+BNehUHkZDokwdQjIGvc9",
    "GiU4pIK+TafxwygQxUjHCWxFvOMFF2w452tOVAfCKgKBtdQVkFEsmTDn/fhs9bQlyyqEJp3ZYrs",
    "2Hj9aRf8zgDFRp3AYNOQZFhnAgSjdNAtI6T9iaZckizLAIjol6TZE/DUFp9mLmaJ8gT9BDiTIYJ",
    "E52dE+xMYa3VJuNOi4zl5WMjVKy9TJYoq01hioWZtraVDQI57oU1pPxPoyBJ1qbxJBqWKq1GKc1",
    "C3oSA+zSu7warGBIfAZrSBGwQrrGOUDSd95hY/kaSa02Mmpg8jb39xc/L8I6woAaEApFXUARpgF",
    "jloS3XFvAtOMegWiVScwrAqcZsgzl6YEVzTOpRhiTiiZy4YJjtBQY6SFyiZVwpLFoqmCOy2U4Sm",
    "gIgWswjEMXywaxBTHRrrW9xrobMzNpgqaKxQWsWqw6bEMtl1CTGI7ESMgz0VYy8rMen4YXALONK",
    "MHEsI79S03auHsRFW6e/exdzLMfvmGeTeXyz+dzetYK9Hhzz/y+m7XqfWv4a206f+fk7ub2Wc/J",
    "OdwW3k/+6v5x+OOd7Z/43c3u9v2/V9n/z9rl5v+9bP1w2mhnhTNeyFeHfTNn13qB/u05/VvZWjf",
    "NqyHZ1S/96O3uzsfWSa/+4XeW8bPE3lrO3un7x67jY5Yl+aloJ8gOJm5NbDqunf5Xc/ZuLInHZv",
    "Y+vT7/upr8g708j+tL5Lfw1ySXt1ff//HeavLp/u+X2P80x/fTZK73iesW0KcvdvqaswBLvU+lM",
    "EpyDqqvTgOe8/Oq+X5ZOe+G5f4tdv4vd/28f8v8umk574blVvXvsnP8tuGr5oGXw2/dYj9WPV9d",
    "N/4f73LnoEfZ+pfZvzqNkPGg4NSbfcYj7KDo638gT78ABLuwQA==",
    ""
  };

  static char newstr [1253] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c25_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c25_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(2941105953U));
  ssSetChecksum1(S,(369823568U));
  ssSetChecksum2(S,(151874601U));
  ssSetChecksum3(S,(3423737421U));
}

static void mdlRTW_c25_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c25_sliding_controller_rbdl(SimStruct *S)
{
  SFc25_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc25_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc25_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc25_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc25_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c25_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c25_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c25_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c25_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c25_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c25_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c25_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c25_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c25_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c25_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c25_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c25_sliding_controller_rbdl;
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
    chartInstance->c25_JITStateAnimation,
    chartInstance->c25_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c25_sliding_controller_rbdl(chartInstance);
}

void c25_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c25_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c25_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c25_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c25_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
