/* Include files */

#include "sliding_controller_const_sfun.h"
#include "c12_sliding_controller_const.h"
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
static void initialize_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance);
static void initialize_params_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance);
static void enable_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance);
static void disable_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance);
static void c12_do_animation_call_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance);
static void ext_mode_exec_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance);
static void set_sim_state_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c12_st);
static void sf_gateway_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_start_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_terminate_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance);
static void initSimStructsc12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance);
static void c12_eML_blk_kernel(SFc12_sliding_controller_constInstanceStruct
  *chartInstance, real_T c12_b_q[2], real_T c12_b_y[4]);
static void c12_emlrt_marshallIn(SFc12_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c12_b_y, const char_T *c12_identifier, real_T
  c12_c_y[4]);
static void c12_b_emlrt_marshallIn(SFc12_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c12_u, const emlrtMsgIdentifier *c12_parentId,
  real_T c12_b_y[4]);
static uint8_T c12_c_emlrt_marshallIn
  (SFc12_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c12_b_is_active_c12_sliding_controller_const, const char_T *c12_identifier);
static uint8_T c12_d_emlrt_marshallIn
  (SFc12_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c12_u, const emlrtMsgIdentifier *c12_parentId);
static void init_dsm_address_info(SFc12_sliding_controller_constInstanceStruct
  *chartInstance);
static void init_simulink_io_address
  (SFc12_sliding_controller_constInstanceStruct *chartInstance);

/* Function Definitions */
static void initialize_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c12_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c12_is_active_c12_sliding_controller_const = 0U;
  cudaGetLastError();
}

static void initialize_params_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void enable_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c12_do_animation_call_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance)
{
  const mxArray *c12_b_y = NULL;
  const mxArray *c12_c_y = NULL;
  const mxArray *c12_d_y = NULL;
  const mxArray *c12_st;
  c12_st = NULL;
  c12_b_y = NULL;
  sf_mex_assign(&c12_b_y, sf_mex_createcellmatrix(2, 1), false);
  c12_c_y = NULL;
  sf_mex_assign(&c12_c_y, sf_mex_create("y", *chartInstance->c12_y, 0, 0U, 1U,
    0U, 2, 2, 2), false);
  sf_mex_setcell(c12_b_y, 0, c12_c_y);
  c12_d_y = NULL;
  sf_mex_assign(&c12_d_y, sf_mex_create("y",
    &chartInstance->c12_is_active_c12_sliding_controller_const, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c12_b_y, 1, c12_d_y);
  sf_mex_assign(&c12_st, c12_b_y, false);
  return c12_st;
}

static void set_sim_state_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c12_st)
{
  const mxArray *c12_u;
  c12_u = sf_mex_dup(c12_st);
  c12_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c12_u, 0)), "y",
                       *chartInstance->c12_y);
  chartInstance->c12_is_active_c12_sliding_controller_const =
    c12_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c12_u, 1)),
    "is_active_c12_sliding_controller_const");
  sf_mex_destroy(&c12_u);
  sf_mex_destroy(&c12_st);
}

static void sf_gateway_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance)
{
  chartInstance->c12_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c12_eML_blk_kernel(chartInstance, *chartInstance->c12_q, *chartInstance->c12_y);
  c12_do_animation_call_c12_sliding_controller_const(chartInstance);
}

static void mdl_start_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance)
{
  cudaError_t c12_errCode;
  c12_errCode = cudaGetLastError();
  if (c12_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c12_errCode, (char_T *)cudaGetErrorName
                       (c12_errCode), (char_T *)cudaGetErrorString(c12_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c12_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void initSimStructsc12_sliding_controller_const
  (SFc12_sliding_controller_constInstanceStruct *chartInstance)
{
}

const mxArray *sf_c12_sliding_controller_const_get_eml_resolved_functions_info()
{
  const mxArray *c12_nameCaptureInfo = NULL;
  c12_nameCaptureInfo = NULL;
  sf_mex_assign(&c12_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c12_nameCaptureInfo;
}

static void c12_eML_blk_kernel(SFc12_sliding_controller_constInstanceStruct
  *chartInstance, real_T c12_b_q[2], real_T c12_b_y[4])
{
  c12_b_y[0] = -0.324 * muDoubleScalarSin(c12_b_q[0]) - 0.39 * muDoubleScalarSin
    (c12_b_q[0] + c12_b_q[1]);
  c12_b_y[2] = 0.324 * muDoubleScalarCos(c12_b_q[0]) + 0.39 * muDoubleScalarSin
    (c12_b_q[0] + c12_b_q[1]);
  c12_b_y[1] = -0.39 * muDoubleScalarSin(c12_b_q[0] + c12_b_q[1]);
  c12_b_y[3] = 0.39 * muDoubleScalarCos(c12_b_q[0] + c12_b_q[1]);
}

static void c12_emlrt_marshallIn(SFc12_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c12_b_y, const char_T *c12_identifier, real_T
  c12_c_y[4])
{
  emlrtMsgIdentifier c12_thisId;
  c12_thisId.fIdentifier = const_cast<const char_T *>(c12_identifier);
  c12_thisId.fParent = NULL;
  c12_thisId.bParentIsCell = false;
  c12_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c12_b_y), &c12_thisId,
    c12_c_y);
  sf_mex_destroy(&c12_b_y);
}

static void c12_b_emlrt_marshallIn(SFc12_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c12_u, const emlrtMsgIdentifier *c12_parentId,
  real_T c12_b_y[4])
{
  real_T c12_dv[4];
  int32_T c12_i;
  sf_mex_import(c12_parentId, sf_mex_dup(c12_u), c12_dv, 1, 0, 0U, 1, 0U, 2, 2,
                2);
  for (c12_i = 0; c12_i < 4; c12_i++) {
    c12_b_y[c12_i] = c12_dv[c12_i];
  }

  sf_mex_destroy(&c12_u);
}

static uint8_T c12_c_emlrt_marshallIn
  (SFc12_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c12_b_is_active_c12_sliding_controller_const, const char_T *c12_identifier)
{
  emlrtMsgIdentifier c12_thisId;
  uint8_T c12_b_y;
  c12_thisId.fIdentifier = const_cast<const char_T *>(c12_identifier);
  c12_thisId.fParent = NULL;
  c12_thisId.bParentIsCell = false;
  c12_b_y = c12_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c12_b_is_active_c12_sliding_controller_const), &c12_thisId);
  sf_mex_destroy(&c12_b_is_active_c12_sliding_controller_const);
  return c12_b_y;
}

static uint8_T c12_d_emlrt_marshallIn
  (SFc12_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c12_u, const emlrtMsgIdentifier *c12_parentId)
{
  uint8_T c12_b_u;
  uint8_T c12_b_y;
  sf_mex_import(c12_parentId, sf_mex_dup(c12_u), &c12_b_u, 1, 3, 0U, 0, 0U, 0);
  c12_b_y = c12_b_u;
  sf_mex_destroy(&c12_u);
  return c12_b_y;
}

static void init_dsm_address_info(SFc12_sliding_controller_constInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address
  (SFc12_sliding_controller_constInstanceStruct *chartInstance)
{
  chartInstance->c12_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c12_q = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c12_y = (real_T (*)[4])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c12_sliding_controller_const_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(552332206U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(2608078302U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(1441289006U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(4066884445U);
}

mxArray *sf_c12_sliding_controller_const_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c12_sliding_controller_const_jit_fallback_info(void)
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

mxArray *sf_c12_sliding_controller_const_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c12_sliding_controller_const(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfj"
    "UU90P4mcXxicklmWWp8cmGRvHFOZkpmXnp8cn5eSVF+Tk5qUUgZnEJwp8Ae/YeMw=="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c12_sliding_controller_const_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sjS5Om55RaK9v6MEldWgzUF";
}

static void sf_opaque_initialize_c12_sliding_controller_const(void
  *chartInstanceVar)
{
  initialize_params_c12_sliding_controller_const
    ((SFc12_sliding_controller_constInstanceStruct*) chartInstanceVar);
  initialize_c12_sliding_controller_const
    ((SFc12_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c12_sliding_controller_const(void *chartInstanceVar)
{
  enable_c12_sliding_controller_const
    ((SFc12_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c12_sliding_controller_const(void
  *chartInstanceVar)
{
  disable_c12_sliding_controller_const
    ((SFc12_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c12_sliding_controller_const(void
  *chartInstanceVar)
{
  sf_gateway_c12_sliding_controller_const
    ((SFc12_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c12_sliding_controller_const
  (SimStruct* S)
{
  return get_sim_state_c12_sliding_controller_const
    ((SFc12_sliding_controller_constInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c12_sliding_controller_const(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c12_sliding_controller_const
    ((SFc12_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c12_sliding_controller_const
  (void *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc12_sliding_controller_constInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_const_optimization_info();
    }

    mdl_cleanup_runtime_resources_c12_sliding_controller_const
      ((SFc12_sliding_controller_constInstanceStruct*) chartInstanceVar);
    ((SFc12_sliding_controller_constInstanceStruct*) chartInstanceVar)->
      ~SFc12_sliding_controller_constInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c12_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_start_c12_sliding_controller_const
    ((SFc12_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c12_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_terminate_c12_sliding_controller_const
    ((SFc12_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc12_sliding_controller_const
    ((SFc12_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c12_sliding_controller_const(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c12_sliding_controller_const
      ((SFc12_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr
       (S));
    initSimStructsc12_sliding_controller_const
      ((SFc12_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr
       (S));
  }
}

const char* sf_c12_sliding_controller_const_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u20YQpgXXrYM2MIoAvQSoT3aPbQEX7aGJbf3AQqzaMGW7N2O9HIkbLXeZ/aGtvkNOQd+",
    "gxxzyJD333hco0BfoLEnJMkVScYQYaVECFLncb2Zn5pudWXkr3Z6H10O8dz/3vDV8foJ3w8uuj/",
    "LxysydfV/1tvPxSxQSNjomikTaq70EieAEtOTWMCm6YiBLYUwMQIGgiI2lMlXaNIssZ2LUsYI6f",
    "fo8ZDT0Q2l5sI+yJDgSfIzaYmuOUU+LKaCmAxCYUEk7DDucDKcWK3PVDIGOtI3qXNBgfBs7s3TP",
    "csNiDu1roF2hDUGL9Y1tviEGmua60k3nqfYnQBnFnBFR6m1ItA8xBtjAaRzg75E16FQRRkOizD6",
    "EJAF9yEapTimgqJNpnLhkghipGOHtiDed4Lxtxxzt6ckAeE1A0LZ9BWQUSyZMNf9+Bz1tC3LJoQ",
    "WXdlitzYcX1pF/xuAKVGXcBk2ZgCJDOBKVi6YBaV+nbE2zZB5mWARnRO1R5E9DUJm9mDnaJ8gT9",
    "FGiCgapk13dVyzB8FZqs1HXZeaiLWOjjGy9CJZqaydQx8JUW4eKJuFcV8L6Mj6EBHiqtUUMqYdl",
    "WstxWrOgLzHALr2rd4MVDInPYU0pAlZKV1IApHXnJywst5HUaiOjJiZv6/Bwfnoe1hUG1IBQKKs",
    "CijANGLM0vNXaAqYd9whEq0xqXhk4y5BFKE8PrGhdSTXCmNQUkRsXHKOVwEgPkUvcCacaN00dzH",
    "G5CEcJDSFwBYZx6OG2QWxJTLQrbXu47xJmxi3QVLG4hFWLuw7LUNsl1DiGUzES8kp0lIz8vMZn4",
    "QXAbCNKMDHcx/qlxh1cvYwK18++9m762adv0c8mcsXnVzN6Vkr0eDPP4rrrjfp1G/i2Mum/M3Kf",
    "FdZZLcg53AbeD55v/vr35uvx768+/vNg+7cfl1n/TeNu/f9hPn48KbTTjZPM5avDHszYtVqi/4s",
    "Z/Rv5WD/3d46inZ0T8uyH5Ltemwfnw19OOxk/C+xtFOydfN90FR+zLM1PRbtBfjBxY2Kzdu30fz",
    "9j79qCeKzn37Prr6fLyT/aLfK4ukB+A9/Ghbx99/U3d5eTz9b/eYH9WwW+t9K+fkFctYAL+s23F",
    "5qzALf6BZXCKMk5KPeqzW0/3zXf7yrn3bPcv8XO/+XeP+9v07/uW867Z7ll/btrH//Q8HX9wCvg",
    "Nz5gP5Y9X71v/B/e3c5BX+bjJ9O/Os2Q8aDk1JtP4xF2UDb7H8jTfwCUfLPm",
    ""
  };

  static char newstr [1261] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c12_sliding_controller_const(SimStruct *S)
{
  const char* newstr = sf_c12_sliding_controller_const_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(2501929482U));
  ssSetChecksum1(S,(2041323763U));
  ssSetChecksum2(S,(3808924622U));
  ssSetChecksum3(S,(1034168136U));
}

static void mdlRTW_c12_sliding_controller_const(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c12_sliding_controller_const(SimStruct *S)
{
  SFc12_sliding_controller_constInstanceStruct *chartInstance;
  chartInstance = (SFc12_sliding_controller_constInstanceStruct *)utMalloc
    (sizeof(SFc12_sliding_controller_constInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc12_sliding_controller_constInstanceStruct));
  chartInstance = new (chartInstance)
    SFc12_sliding_controller_constInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c12_sliding_controller_const;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c12_sliding_controller_const;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c12_sliding_controller_const;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c12_sliding_controller_const;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c12_sliding_controller_const;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c12_sliding_controller_const;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c12_sliding_controller_const;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c12_sliding_controller_const;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c12_sliding_controller_const;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c12_sliding_controller_const;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c12_sliding_controller_const;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c12_sliding_controller_const;
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
    chartInstance->c12_JITStateAnimation,
    chartInstance->c12_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c12_sliding_controller_const(chartInstance);
}

void c12_sliding_controller_const_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c12_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c12_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c12_sliding_controller_const(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c12_sliding_controller_const_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
