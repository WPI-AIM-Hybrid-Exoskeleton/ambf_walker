/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c28_sliding_controller_rbdl.h"
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
static void initialize_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c28_do_animation_call_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c28_st);
static void sf_gateway_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c28_eML_blk_kernel(SFc28_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c28_b_q[2], real_T c28_b_y[4]);
static void c28_emlrt_marshallIn(SFc28_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c28_b_y, const char_T *c28_identifier, real_T
  c28_c_y[4]);
static void c28_b_emlrt_marshallIn(SFc28_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c28_u, const emlrtMsgIdentifier *c28_parentId,
  real_T c28_b_y[4]);
static uint8_T c28_c_emlrt_marshallIn
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c28_b_is_active_c28_sliding_controller_rbdl, const char_T *c28_identifier);
static uint8_T c28_d_emlrt_marshallIn
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c28_u, const emlrtMsgIdentifier *c28_parentId);
static void init_dsm_address_info(SFc28_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc28_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c28_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c28_is_active_c28_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c28_do_animation_call_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance)
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
    &chartInstance->c28_is_active_c28_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c28_b_y, 1, c28_d_y);
  sf_mex_assign(&c28_st, c28_b_y, false);
  return c28_st;
}

static void set_sim_state_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c28_st)
{
  const mxArray *c28_u;
  c28_u = sf_mex_dup(c28_st);
  c28_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c28_u, 0)), "y",
                       *chartInstance->c28_y);
  chartInstance->c28_is_active_c28_sliding_controller_rbdl =
    c28_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c28_u, 1)),
    "is_active_c28_sliding_controller_rbdl");
  sf_mex_destroy(&c28_u);
  sf_mex_destroy(&c28_st);
}

static void sf_gateway_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c28_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c28_eML_blk_kernel(chartInstance, *chartInstance->c28_q, *chartInstance->c28_y);
  c28_do_animation_call_c28_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance)
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

static void mdl_setup_runtime_resources_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc28_sliding_controller_rbdl
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c28_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c28_nameCaptureInfo = NULL;
  c28_nameCaptureInfo = NULL;
  sf_mex_assign(&c28_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c28_nameCaptureInfo;
}

static void c28_eML_blk_kernel(SFc28_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c28_b_q[2], real_T c28_b_y[4])
{
  c28_b_y[0] = -0.324 * muDoubleScalarSin(c28_b_q[0]);
  c28_b_y[2] = 0.0;
  c28_b_y[1] = 0.324 * muDoubleScalarCos(c28_b_q[0]);
  c28_b_y[3] = 0.0;
}

static void c28_emlrt_marshallIn(SFc28_sliding_controller_rbdlInstanceStruct
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

static void c28_b_emlrt_marshallIn(SFc28_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c28_u, const emlrtMsgIdentifier *c28_parentId,
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
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c28_b_is_active_c28_sliding_controller_rbdl, const char_T *c28_identifier)
{
  emlrtMsgIdentifier c28_thisId;
  uint8_T c28_b_y;
  c28_thisId.fIdentifier = const_cast<const char_T *>(c28_identifier);
  c28_thisId.fParent = NULL;
  c28_thisId.bParentIsCell = false;
  c28_b_y = c28_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c28_b_is_active_c28_sliding_controller_rbdl), &c28_thisId);
  sf_mex_destroy(&c28_b_is_active_c28_sliding_controller_rbdl);
  return c28_b_y;
}

static uint8_T c28_d_emlrt_marshallIn
  (SFc28_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c28_u, const emlrtMsgIdentifier *c28_parentId)
{
  uint8_T c28_b_u;
  uint8_T c28_b_y;
  sf_mex_import(c28_parentId, sf_mex_dup(c28_u), &c28_b_u, 1, 3, 0U, 0, 0U, 0);
  c28_b_y = c28_b_u;
  sf_mex_destroy(&c28_u);
  return c28_b_y;
}

static void init_dsm_address_info(SFc28_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc28_sliding_controller_rbdlInstanceStruct
  *chartInstance)
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
void sf_c28_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(536815311U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1945133011U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2900394615U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(32238838U);
}

mxArray *sf_c28_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c28_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c28_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c28_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfl"
    "UU90P4mcXxicklmWWp8clGFvHFOZkpmXnp8cn5eSVF+Tk5qUXxRUkpOUj+BAB21B21"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c28_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sFqlSox9r5ekjZXT2w93GAD";
}

static void sf_opaque_initialize_c28_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c28_sliding_controller_rbdl
    ((SFc28_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c28_sliding_controller_rbdl
    ((SFc28_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c28_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c28_sliding_controller_rbdl
    ((SFc28_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c28_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c28_sliding_controller_rbdl
    ((SFc28_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c28_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c28_sliding_controller_rbdl
    ((SFc28_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c28_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c28_sliding_controller_rbdl
    ((SFc28_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c28_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c28_sliding_controller_rbdl
    ((SFc28_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c28_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc28_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c28_sliding_controller_rbdl
      ((SFc28_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc28_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc28_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c28_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c28_sliding_controller_rbdl
    ((SFc28_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c28_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c28_sliding_controller_rbdl
    ((SFc28_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc28_sliding_controller_rbdl
    ((SFc28_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c28_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c28_sliding_controller_rbdl
      ((SFc28_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc28_sliding_controller_rbdl
      ((SFc28_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c28_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u20YQpgXbaNA2MIoCBYIA8SVoj4UNA8mlta2fVIhcG6UcG70I6+VI3Gq5S++PZL1Ab32",
    "THHLPi/QJcsmlj9BZkpJViqRiCzbcogRoaslvZmfmm5+1t9Y+8vB6jPf+V563ic/P8K556bWRrd",
    "fm7vT9uvdttv4DhYSNTogikfYqL0Ei+AW05NYwKdqiLwthTPRBgaCIjaUyZdo0iyxnYtiygjp9+",
    "ixkNPRDaXlwiLIkOBZ8gtpia05QT4MpoKYFEJhQSTsIW5wMZhYrM66HQIfaRlUuaDC+jZ1Z+shy",
    "w2IOzSugbaENQYv1tW2+IQbq5qrUTeep9qdAGcWcEVHobUi0DzEG2MBpHODfY2vQqTyMhkSZQwj",
    "JCHSHDROdUkBeJ9P44YIJYqRihDcjXneCi7adcLTnSAbAKwKCth0qIMNYMmHK+fdb6GlTkAsODb",
    "iwg3JtPlxaR/4bBmNQpXHr1+UIFBnAsSjdNAlI8ypha5YlizDDInhD1AFF/jQEpdmLmaN9gjxBF",
    "yXKYJA42dZdxUYY3lJtNmq7zFxWMjZKydbLYIm25giqWJhpa1FRJ5zrUlhXxh0YAU+0Nogh1bBU",
    "azFOaxZ0JQbYpXd5NVjBkPgMVpciYIV0jXKApO/8jI3ln0hqtZFRHZO30eksfl6EtYUB1ScUirq",
    "AIkwDxiwJb7m2gGnHPQLRKpOYVwROM2QZytN9KxpjqYYYk4omcu2CY7QUGOkBcomVcKqxaKpgjs",
    "tlOEpoCIFrMIzDEZYNYgtiol1rO8C6GzEzaYCmisUFrFqsOmxDTZdQkxhOxVDIsWgpGflZj0/DC",
    "4DZRpRgYnCI/UtNWrh7ERVunn3vXc+zLz5hnk3l8s/v5vSsFejx5p75fR/Vqvet4a+16fydk/sy",
    "t896Ts7htvB+8nbvw/tdvcE/f935/eNZZ5X939VuNv8fZ+un00Y7K5zRQr467E9zdq0X6P9mTv9",
    "WttatS+7Lq5dqD4a//Xre3Rm/3H110Ej5WWJvLWfv9P226/iYZUl+KtoOsoOJWxObjmun/8WcvZ",
    "tL4vEoe59ef/24mvzX+3ke15fIb+GvSS5vb7//9v5q8un+50vsf57j+3ky13vEdQvo0Z0XPc1Zg",
    "KXeo1IYJTkH1VMXAc/5edt8v6mcd89y/xY7/5e7e94/ZX7dt5x3z3Kr+nfTOf7Q8FXzwMvhtx6w",
    "H6uer+4a/6d3s3PQs2z9w+xfnXrIeFBw6s0+4xG2X/T1P5CnfwOO+7MD",
    ""
  };

  static char newstr [1257] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c28_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c28_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(3862277146U));
  ssSetChecksum1(S,(91435963U));
  ssSetChecksum2(S,(1279986540U));
  ssSetChecksum3(S,(1280830342U));
}

static void mdlRTW_c28_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c28_sliding_controller_rbdl(SimStruct *S)
{
  SFc28_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc28_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc28_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc28_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc28_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c28_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c28_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c28_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c28_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c28_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c28_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c28_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c28_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c28_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c28_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c28_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c28_sliding_controller_rbdl;
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

  mdl_setup_runtime_resources_c28_sliding_controller_rbdl(chartInstance);
}

void c28_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c28_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c28_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c28_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c28_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
