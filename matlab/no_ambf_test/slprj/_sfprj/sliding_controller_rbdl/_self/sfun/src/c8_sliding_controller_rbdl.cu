/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c8_sliding_controller_rbdl.h"
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
static void initialize_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c8_do_animation_call_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c8_st);
static void sf_gateway_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c8_eML_blk_kernel(SFc8_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c8_b_u[7], real_T c8_b_y[6]);
static void c8_emlrt_marshallIn(SFc8_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c8_b_y, const char_T *c8_identifier, real_T
  c8_c_y[6]);
static void c8_b_emlrt_marshallIn(SFc8_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c8_b_u, const emlrtMsgIdentifier *c8_parentId,
  real_T c8_b_y[6]);
static uint8_T c8_c_emlrt_marshallIn(SFc8_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c8_b_is_active_c8_sliding_controller_rbdl, const
  char_T *c8_identifier);
static uint8_T c8_d_emlrt_marshallIn(SFc8_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c8_b_u, const emlrtMsgIdentifier *c8_parentId);
static void init_dsm_address_info(SFc8_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc8_sliding_controller_rbdlInstanceStruct *
  chartInstance);

/* Function Definitions */
static void initialize_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c8_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c8_is_active_c8_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c8_do_animation_call_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  const mxArray *c8_b_y = NULL;
  const mxArray *c8_c_y = NULL;
  const mxArray *c8_d_y = NULL;
  const mxArray *c8_st;
  c8_st = NULL;
  c8_b_y = NULL;
  sf_mex_assign(&c8_b_y, sf_mex_createcellmatrix(2, 1), false);
  c8_c_y = NULL;
  sf_mex_assign(&c8_c_y, sf_mex_create("y", *chartInstance->c8_y, 0, 0U, 1U, 0U,
    1, 6), false);
  sf_mex_setcell(c8_b_y, 0, c8_c_y);
  c8_d_y = NULL;
  sf_mex_assign(&c8_d_y, sf_mex_create("y",
    &chartInstance->c8_is_active_c8_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c8_b_y, 1, c8_d_y);
  sf_mex_assign(&c8_st, c8_b_y, false);
  return c8_st;
}

static void set_sim_state_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c8_st)
{
  const mxArray *c8_b_u;
  c8_b_u = sf_mex_dup(c8_st);
  c8_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c8_b_u, 0)), "y",
                      *chartInstance->c8_y);
  chartInstance->c8_is_active_c8_sliding_controller_rbdl = c8_c_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c8_b_u, 1)),
     "is_active_c8_sliding_controller_rbdl");
  sf_mex_destroy(&c8_b_u);
  sf_mex_destroy(&c8_st);
}

static void sf_gateway_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c8_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c8_eML_blk_kernel(chartInstance, *chartInstance->c8_u, *chartInstance->c8_y);
  c8_do_animation_call_c8_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c8_errCode;
  c8_errCode = cudaGetLastError();
  if (c8_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c8_errCode, (char_T *)cudaGetErrorName
                       (c8_errCode), (char_T *)cudaGetErrorString(c8_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c8_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc8_sliding_controller_rbdl
  (SFc8_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c8_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c8_nameCaptureInfo = NULL;
  c8_nameCaptureInfo = NULL;
  sf_mex_assign(&c8_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c8_nameCaptureInfo;
}

static void c8_eML_blk_kernel(SFc8_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c8_b_u[7], real_T c8_b_y[6])
{
  c8_b_y[0] = c8_b_u[2];
  c8_b_y[1] = c8_b_u[3];
  c8_b_y[2] = c8_b_u[6];
  c8_b_y[3] = c8_b_u[0];
  c8_b_y[4] = c8_b_u[4];
  c8_b_y[5] = c8_b_u[5];
}

static void c8_emlrt_marshallIn(SFc8_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c8_b_y, const char_T *c8_identifier, real_T
  c8_c_y[6])
{
  emlrtMsgIdentifier c8_thisId;
  c8_thisId.fIdentifier = const_cast<const char_T *>(c8_identifier);
  c8_thisId.fParent = NULL;
  c8_thisId.bParentIsCell = false;
  c8_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c8_b_y), &c8_thisId, c8_c_y);
  sf_mex_destroy(&c8_b_y);
}

static void c8_b_emlrt_marshallIn(SFc8_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c8_b_u, const emlrtMsgIdentifier *c8_parentId,
  real_T c8_b_y[6])
{
  real_T c8_dv[6];
  int32_T c8_i;
  sf_mex_import(c8_parentId, sf_mex_dup(c8_b_u), c8_dv, 1, 0, 0U, 1, 0U, 1, 6);
  for (c8_i = 0; c8_i < 6; c8_i++) {
    c8_b_y[c8_i] = c8_dv[c8_i];
  }

  sf_mex_destroy(&c8_b_u);
}

static uint8_T c8_c_emlrt_marshallIn(SFc8_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c8_b_is_active_c8_sliding_controller_rbdl, const
  char_T *c8_identifier)
{
  emlrtMsgIdentifier c8_thisId;
  uint8_T c8_b_y;
  c8_thisId.fIdentifier = const_cast<const char_T *>(c8_identifier);
  c8_thisId.fParent = NULL;
  c8_thisId.bParentIsCell = false;
  c8_b_y = c8_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c8_b_is_active_c8_sliding_controller_rbdl), &c8_thisId);
  sf_mex_destroy(&c8_b_is_active_c8_sliding_controller_rbdl);
  return c8_b_y;
}

static uint8_T c8_d_emlrt_marshallIn(SFc8_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c8_b_u, const emlrtMsgIdentifier *c8_parentId)
{
  uint8_T c8_b_y;
  uint8_T c8_c_u;
  sf_mex_import(c8_parentId, sf_mex_dup(c8_b_u), &c8_c_u, 1, 3, 0U, 0, 0U, 0);
  c8_b_y = c8_c_u;
  sf_mex_destroy(&c8_b_u);
  return c8_b_y;
}

static void init_dsm_address_info(SFc8_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc8_sliding_controller_rbdlInstanceStruct *
  chartInstance)
{
  chartInstance->c8_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c8_u = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c8_y = (real_T (*)[6])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c8_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(2339256118U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(2737773724U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(583777407U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(1172739197U);
}

mxArray *sf_c8_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c8_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c8_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c8_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfh"
    "UU90P4mcXxicklmWWp8ckW8cU5mSmZeenxyfl5JUX5OTmpRfFFSSk5DEj+BAB5SR2B"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c8_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "s0lpZ3UsJHBzJBVszsMYZmF";
}

static void sf_opaque_initialize_c8_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c8_sliding_controller_rbdl
    ((SFc8_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c8_sliding_controller_rbdl
    ((SFc8_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c8_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c8_sliding_controller_rbdl((SFc8_sliding_controller_rbdlInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c8_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c8_sliding_controller_rbdl((SFc8_sliding_controller_rbdlInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c8_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c8_sliding_controller_rbdl
    ((SFc8_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c8_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c8_sliding_controller_rbdl
    ((SFc8_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c8_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c8_sliding_controller_rbdl
    ((SFc8_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c8_sliding_controller_rbdl(void *
  chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc8_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c8_sliding_controller_rbdl
      ((SFc8_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc8_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc8_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c8_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c8_sliding_controller_rbdl
    ((SFc8_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c8_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c8_sliding_controller_rbdl
    ((SFc8_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc8_sliding_controller_rbdl
    ((SFc8_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c8_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c8_sliding_controller_rbdl
      ((SFc8_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc8_sliding_controller_rbdl
      ((SFc8_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c8_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV09v00gUd6MuAgmqCiEhJCTQCql7rHYPcIISJ1EDzbZat91dLtF0/BKPMp4x8ydt+A4c+BR",
    "75eMgLnvb836EfWM7adaxnZaIChCWXGfs33vz3vu9P1Nvrdvz8NrAe+e2513D53W8G152/ZCv1+",
    "bu7P26t5Wv36KQsPEBUSTWXu0lSAy/gZbcGiZFVwxkKYyJASgQFLGJVKZKm2ax5UyMOlZQp0//H",
    "jEaBZG0PGyiLAn3BZ+gtsSaA9TTYgqo6QCEJlLSDqMOJ8OZxcqc+hHQkbZxnQsaTGATZ5buWW5Y",
    "wqF9BrQrtCFosT63LTDEgG/OKt10nupgCpRxwhkRpd5GRAeQYIANHCUh/t23Bp0qwmhElGlCRMa",
    "g99go1SkFFHUyjR9OmCBGKkZ4O+a+E1y07YCjPT0ZAq8JCNrWVEBGiWTCVPMfdNDTtiAnHFpwYo",
    "fV2gJ4bR35xwxOQVXGbeDLMSgyhH1RuWkakPZZytYsSxZhhsVwTNRzivxpCCuzFzNHBwR5gkOUq",
    "IJB6mRXHyo2xvBWarNx12XmspKxcUa2XgZLtbXHUMfCTFuHCp9writhhzLZgzHwVGuLGFIPy7SW",
    "47Rm4aHEALv0rq4GKxgSn8N8KUJWSte4AEj7zq/YWP6PpFYbGfuYvK29vcXPi7CuMKAGhEJZF1C",
    "EacCYpeGt1hYy7bhHIFplUvPKwFmGLEN5emBF61SqEcakpomcu+AYrQTGeohcYiUcaSyaOpjjch",
    "mOEhpB6BoM49DDskFsSUy0a23Pse7GzExaoKliSQmrFqsO21DbJdQkgSMxEvJUdJSMg7zHZ+EFw",
    "GwjSjAxbGL/UpMO7l5GhZtn2975PLt5gXk2lSs+f5rTs1aix5t7Fve90ajft4G/1qbzd07uVmGf",
    "9YKcw23i/ePHv372/9llf7/bIt2X9x6vsv/7xuXm/0a+vj9ttLPCGS/kq8Puztm1XqL/7pz+zXy",
    "tt3ny6pcj/WK3+eZF81i/0b0/X8WdjJ8l9jYK9k7fP3QdH7MszU9Fu2F+MHFrYrNx7fQ/mbP32p",
    "J43MjfZ9e/z1aTv7NT5HF9ifwm/poU8vbT93+4s5p8tv8fS+x/VOD7UTrX+8R1C+jTJ33NWYiV3",
    "qdSGCU5B9VXJyEv1uen5vtl5bwrlvta7Pwu9/l5v8j8umo574rlVvXvsnP8S8PXzQOvgN/8gv1Y",
    "9Xz1ufEfvMudgx7k66ezf3X8iPGw5NSbf8Yj7KDs6zeQp/8BEBOzNw==",
    ""
  };

  static char newstr [1257] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c8_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c8_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(849861154U));
  ssSetChecksum1(S,(1766385219U));
  ssSetChecksum2(S,(1629983199U));
  ssSetChecksum3(S,(924404553U));
}

static void mdlRTW_c8_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c8_sliding_controller_rbdl(SimStruct *S)
{
  SFc8_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc8_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc8_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc8_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance) SFc8_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c8_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c8_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c8_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c8_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c8_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c8_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c8_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c8_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c8_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c8_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c8_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c8_sliding_controller_rbdl;
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
    chartInstance->c8_JITStateAnimation,
    chartInstance->c8_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c8_sliding_controller_rbdl(chartInstance);
}

void c8_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c8_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c8_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c8_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c8_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
