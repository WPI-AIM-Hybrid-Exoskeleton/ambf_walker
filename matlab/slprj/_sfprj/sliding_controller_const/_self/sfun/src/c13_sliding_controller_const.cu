/* Include files */

#include "sliding_controller_const_sfun.h"
#include "c13_sliding_controller_const.h"
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
static void initialize_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance);
static void initialize_params_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance);
static void enable_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance);
static void disable_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance);
static void c13_do_animation_call_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance);
static void ext_mode_exec_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance);
static void set_sim_state_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c13_st);
static void sf_gateway_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_start_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_terminate_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance);
static void initSimStructsc13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance);
static void c13_eML_blk_kernel(SFc13_sliding_controller_constInstanceStruct
  *chartInstance, real_T c13_b_q[2], real_T c13_b_y[4]);
static void c13_emlrt_marshallIn(SFc13_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c13_b_y, const char_T *c13_identifier, real_T
  c13_c_y[4]);
static void c13_b_emlrt_marshallIn(SFc13_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c13_u, const emlrtMsgIdentifier *c13_parentId,
  real_T c13_b_y[4]);
static uint8_T c13_c_emlrt_marshallIn
  (SFc13_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c13_b_is_active_c13_sliding_controller_const, const char_T *c13_identifier);
static uint8_T c13_d_emlrt_marshallIn
  (SFc13_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c13_u, const emlrtMsgIdentifier *c13_parentId);
static void init_dsm_address_info(SFc13_sliding_controller_constInstanceStruct
  *chartInstance);
static void init_simulink_io_address
  (SFc13_sliding_controller_constInstanceStruct *chartInstance);

/* Function Definitions */
static void initialize_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c13_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c13_is_active_c13_sliding_controller_const = 0U;
  cudaGetLastError();
}

static void initialize_params_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void enable_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c13_do_animation_call_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance)
{
  const mxArray *c13_b_y = NULL;
  const mxArray *c13_c_y = NULL;
  const mxArray *c13_d_y = NULL;
  const mxArray *c13_st;
  c13_st = NULL;
  c13_b_y = NULL;
  sf_mex_assign(&c13_b_y, sf_mex_createcellmatrix(2, 1), false);
  c13_c_y = NULL;
  sf_mex_assign(&c13_c_y, sf_mex_create("y", *chartInstance->c13_y, 0, 0U, 1U,
    0U, 2, 2, 2), false);
  sf_mex_setcell(c13_b_y, 0, c13_c_y);
  c13_d_y = NULL;
  sf_mex_assign(&c13_d_y, sf_mex_create("y",
    &chartInstance->c13_is_active_c13_sliding_controller_const, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c13_b_y, 1, c13_d_y);
  sf_mex_assign(&c13_st, c13_b_y, false);
  return c13_st;
}

static void set_sim_state_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c13_st)
{
  const mxArray *c13_u;
  c13_u = sf_mex_dup(c13_st);
  c13_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c13_u, 0)), "y",
                       *chartInstance->c13_y);
  chartInstance->c13_is_active_c13_sliding_controller_const =
    c13_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c13_u, 1)),
    "is_active_c13_sliding_controller_const");
  sf_mex_destroy(&c13_u);
  sf_mex_destroy(&c13_st);
}

static void sf_gateway_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance)
{
  chartInstance->c13_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c13_eML_blk_kernel(chartInstance, *chartInstance->c13_q, *chartInstance->c13_y);
  c13_do_animation_call_c13_sliding_controller_const(chartInstance);
}

static void mdl_start_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance)
{
  cudaError_t c13_errCode;
  c13_errCode = cudaGetLastError();
  if (c13_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c13_errCode, (char_T *)cudaGetErrorName
                       (c13_errCode), (char_T *)cudaGetErrorString(c13_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c13_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void initSimStructsc13_sliding_controller_const
  (SFc13_sliding_controller_constInstanceStruct *chartInstance)
{
}

const mxArray *sf_c13_sliding_controller_const_get_eml_resolved_functions_info()
{
  const mxArray *c13_nameCaptureInfo = NULL;
  c13_nameCaptureInfo = NULL;
  sf_mex_assign(&c13_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c13_nameCaptureInfo;
}

static void c13_eML_blk_kernel(SFc13_sliding_controller_constInstanceStruct
  *chartInstance, real_T c13_b_q[2], real_T c13_b_y[4])
{
  c13_b_y[0] = -0.324 * muDoubleScalarSin(c13_b_q[0]);
  c13_b_y[2] = 0.0;
  c13_b_y[1] = 0.324 * muDoubleScalarCos(c13_b_q[0]);
  c13_b_y[3] = 0.0;
}

static void c13_emlrt_marshallIn(SFc13_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c13_b_y, const char_T *c13_identifier, real_T
  c13_c_y[4])
{
  emlrtMsgIdentifier c13_thisId;
  c13_thisId.fIdentifier = const_cast<const char_T *>(c13_identifier);
  c13_thisId.fParent = NULL;
  c13_thisId.bParentIsCell = false;
  c13_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c13_b_y), &c13_thisId,
    c13_c_y);
  sf_mex_destroy(&c13_b_y);
}

static void c13_b_emlrt_marshallIn(SFc13_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c13_u, const emlrtMsgIdentifier *c13_parentId,
  real_T c13_b_y[4])
{
  real_T c13_dv[4];
  int32_T c13_i;
  sf_mex_import(c13_parentId, sf_mex_dup(c13_u), c13_dv, 1, 0, 0U, 1, 0U, 2, 2,
                2);
  for (c13_i = 0; c13_i < 4; c13_i++) {
    c13_b_y[c13_i] = c13_dv[c13_i];
  }

  sf_mex_destroy(&c13_u);
}

static uint8_T c13_c_emlrt_marshallIn
  (SFc13_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c13_b_is_active_c13_sliding_controller_const, const char_T *c13_identifier)
{
  emlrtMsgIdentifier c13_thisId;
  uint8_T c13_b_y;
  c13_thisId.fIdentifier = const_cast<const char_T *>(c13_identifier);
  c13_thisId.fParent = NULL;
  c13_thisId.bParentIsCell = false;
  c13_b_y = c13_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c13_b_is_active_c13_sliding_controller_const), &c13_thisId);
  sf_mex_destroy(&c13_b_is_active_c13_sliding_controller_const);
  return c13_b_y;
}

static uint8_T c13_d_emlrt_marshallIn
  (SFc13_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c13_u, const emlrtMsgIdentifier *c13_parentId)
{
  uint8_T c13_b_u;
  uint8_T c13_b_y;
  sf_mex_import(c13_parentId, sf_mex_dup(c13_u), &c13_b_u, 1, 3, 0U, 0, 0U, 0);
  c13_b_y = c13_b_u;
  sf_mex_destroy(&c13_u);
  return c13_b_y;
}

static void init_dsm_address_info(SFc13_sliding_controller_constInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address
  (SFc13_sliding_controller_constInstanceStruct *chartInstance)
{
  chartInstance->c13_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c13_q = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c13_y = (real_T (*)[4])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c13_sliding_controller_const_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(536815311U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1945133011U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2900394615U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(32238838U);
}

mxArray *sf_c13_sliding_controller_const_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c13_sliding_controller_const_jit_fallback_info(void)
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

mxArray *sf_c13_sliding_controller_const_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c13_sliding_controller_const(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfj"
    "UU90P4mcXxicklmWWp8cmGxvHFOZkpmXnp8cn5eSVF+Tk5qUUgZnEJwp8AfBoeNA=="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c13_sliding_controller_const_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sFqlSox9r5ekjZXT2w93GAD";
}

static void sf_opaque_initialize_c13_sliding_controller_const(void
  *chartInstanceVar)
{
  initialize_params_c13_sliding_controller_const
    ((SFc13_sliding_controller_constInstanceStruct*) chartInstanceVar);
  initialize_c13_sliding_controller_const
    ((SFc13_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c13_sliding_controller_const(void *chartInstanceVar)
{
  enable_c13_sliding_controller_const
    ((SFc13_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c13_sliding_controller_const(void
  *chartInstanceVar)
{
  disable_c13_sliding_controller_const
    ((SFc13_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c13_sliding_controller_const(void
  *chartInstanceVar)
{
  sf_gateway_c13_sliding_controller_const
    ((SFc13_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c13_sliding_controller_const
  (SimStruct* S)
{
  return get_sim_state_c13_sliding_controller_const
    ((SFc13_sliding_controller_constInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c13_sliding_controller_const(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c13_sliding_controller_const
    ((SFc13_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c13_sliding_controller_const
  (void *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc13_sliding_controller_constInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_const_optimization_info();
    }

    mdl_cleanup_runtime_resources_c13_sliding_controller_const
      ((SFc13_sliding_controller_constInstanceStruct*) chartInstanceVar);
    ((SFc13_sliding_controller_constInstanceStruct*) chartInstanceVar)->
      ~SFc13_sliding_controller_constInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c13_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_start_c13_sliding_controller_const
    ((SFc13_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c13_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_terminate_c13_sliding_controller_const
    ((SFc13_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc13_sliding_controller_const
    ((SFc13_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c13_sliding_controller_const(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c13_sliding_controller_const
      ((SFc13_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr
       (S));
    initSimStructsc13_sliding_controller_const
      ((SFc13_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr
       (S));
  }
}

const char* sf_c13_sliding_controller_const_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u20YQpgXHqNHWMIICBYoC9SntMalhILmktvXTCpVro5R/0IuxXo7ErZa79P5I1gv01jf",
    "pIfe8SJ4gl176CJ0lKVmmSMq2YCMtQoAil/vN7Mx8szMrb6V94OG1gffuU89bw+cneNe89HqSjV",
    "dm7vT7qvdtNv4ThYSNjogikfYqL0Ei+BW05NYwKdqiJwthTPRAgaCIjaUyZdo0iyxnYtCygjp9+",
    "jRkNPRDaXmwj7IkOBR8jNpia45QT4MpoKYFEJhQSdsPW5z0pxYrM6qHQAfaRlUuaDC+jZ1Z+sBy",
    "w2IOzSugbaENQYv1tW2+IQbq5qrUTeep9idAGcWcEVHobUi0DzEG2MBxHODvoTXoVB5GQ6LMPoR",
    "kCLrDBolOKSCvk2mcuGCCGKkY4c2I153gvG1HHO05kAHwioCgbfsKyCCWTJhy/v0WetoU5IJDAy",
    "5sv1ybD5fWkX/CYASqNG69uhyCIn04FKWLJgFpXiVsTbNkHmZYBCdE7VHkT0NQmr2YOdonyBN0U",
    "aIMBomTbd1VbIjhLdVmo7bLzEVbxkYp2XoRLNHWHEIVC1NtLSrqhHNdCuvKuAND4InWBjGkGpZq",
    "LcZpzYKuxAC79C7fDVYwJD6D1aUIWCFdwxwgqTu/YGG5iaRWGxnVMXkbnc789DysLQyoHqFQVAU",
    "UYRowZkl4y7UFTDvuEYhWmcS8InCaIYtQnu5Z0RhJNcCYVBSRaxcco6XASPeRS9wJxxo3TRXMcb",
    "kIRwkNIXAFhnE4wG2D2IKYaFfa9nDfDZkZN0BTxeICVi3uOixDTZdQ4xiOxUDIkWgpGflZjU/DC",
    "4DZRpRgor+P9UuNW7h6ERWunz33rvvZZ7foZxO5/PO7GT0rBXq8mWd+3fVa9bo1fFuZ9N8Zuc9z",
    "66zm5BxuE++v/tp5/3ZbP+Gf/tz54+/TzjLrv6ndrf9vZOOvJ4V2unGGc/nqsD/N2LVaoP/LGf2",
    "b2Vi3Lrkvr16pHRj8/ttZ9/vRq+0f9xopPwvsreXsnXzfchUfsyzJT0XbQXYwcWNi03bt9L+csX",
    "dtQTzWs+/p9c8Py8l/sZvncXWB/Ca+jXN5e//1t3aXk0/XP1tg/7Mc38+Svn5OXLWAc/pi+1xzF",
    "uBWP6dSGCU5B+Vetbnp533z/a5y3iPL/Vfs/Cj38Lzfpn89tpz3yHLL+nfXPv6h4av6gZfDb37A",
    "fix7vnpo/Dvvbuegb7Lx6+lfnXrIeFBw6s2m8QjbK5r9H+Tpv1Tts4I=",
    ""
  };

  static char newstr [1257] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c13_sliding_controller_const(SimStruct *S)
{
  const char* newstr = sf_c13_sliding_controller_const_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(3862277146U));
  ssSetChecksum1(S,(91435963U));
  ssSetChecksum2(S,(1279986540U));
  ssSetChecksum3(S,(1280830342U));
}

static void mdlRTW_c13_sliding_controller_const(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c13_sliding_controller_const(SimStruct *S)
{
  SFc13_sliding_controller_constInstanceStruct *chartInstance;
  chartInstance = (SFc13_sliding_controller_constInstanceStruct *)utMalloc
    (sizeof(SFc13_sliding_controller_constInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc13_sliding_controller_constInstanceStruct));
  chartInstance = new (chartInstance)
    SFc13_sliding_controller_constInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c13_sliding_controller_const;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c13_sliding_controller_const;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c13_sliding_controller_const;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c13_sliding_controller_const;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c13_sliding_controller_const;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c13_sliding_controller_const;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c13_sliding_controller_const;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c13_sliding_controller_const;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c13_sliding_controller_const;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c13_sliding_controller_const;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c13_sliding_controller_const;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c13_sliding_controller_const;
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
    chartInstance->c13_JITStateAnimation,
    chartInstance->c13_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c13_sliding_controller_const(chartInstance);
}

void c13_sliding_controller_const_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c13_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c13_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c13_sliding_controller_const(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c13_sliding_controller_const_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
