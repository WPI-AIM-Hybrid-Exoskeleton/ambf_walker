/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c22_sliding_controller_rbdl.h"
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
static void initialize_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c22_do_animation_call_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c22_st);
static void sf_gateway_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c22_eML_blk_kernel(SFc22_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c22_b_u[6], real_T c22_b_y[7]);
static void c22_emlrt_marshallIn(SFc22_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c22_b_y, const char_T *c22_identifier, real_T
  c22_c_y[7]);
static void c22_b_emlrt_marshallIn(SFc22_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c22_b_u, const emlrtMsgIdentifier *c22_parentId,
  real_T c22_b_y[7]);
static uint8_T c22_c_emlrt_marshallIn
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c22_b_is_active_c22_sliding_controller_rbdl, const char_T *c22_identifier);
static uint8_T c22_d_emlrt_marshallIn
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c22_b_u, const emlrtMsgIdentifier *c22_parentId);
static void init_dsm_address_info(SFc22_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc22_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c22_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c22_is_active_c22_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c22_do_animation_call_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  const mxArray *c22_b_y = NULL;
  const mxArray *c22_c_y = NULL;
  const mxArray *c22_d_y = NULL;
  const mxArray *c22_st;
  c22_st = NULL;
  c22_b_y = NULL;
  sf_mex_assign(&c22_b_y, sf_mex_createcellmatrix(2, 1), false);
  c22_c_y = NULL;
  sf_mex_assign(&c22_c_y, sf_mex_create("y", *chartInstance->c22_y, 0, 0U, 1U,
    0U, 2, 1, 7), false);
  sf_mex_setcell(c22_b_y, 0, c22_c_y);
  c22_d_y = NULL;
  sf_mex_assign(&c22_d_y, sf_mex_create("y",
    &chartInstance->c22_is_active_c22_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c22_b_y, 1, c22_d_y);
  sf_mex_assign(&c22_st, c22_b_y, false);
  return c22_st;
}

static void set_sim_state_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c22_st)
{
  const mxArray *c22_b_u;
  c22_b_u = sf_mex_dup(c22_st);
  c22_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c22_b_u, 0)),
                       "y", *chartInstance->c22_y);
  chartInstance->c22_is_active_c22_sliding_controller_rbdl =
    c22_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c22_b_u, 1)),
    "is_active_c22_sliding_controller_rbdl");
  sf_mex_destroy(&c22_b_u);
  sf_mex_destroy(&c22_st);
}

static void sf_gateway_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c22_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c22_eML_blk_kernel(chartInstance, *chartInstance->c22_u, *chartInstance->c22_y);
  c22_do_animation_call_c22_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c22_errCode;
  c22_errCode = cudaGetLastError();
  if (c22_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c22_errCode, (char_T *)cudaGetErrorName
                       (c22_errCode), (char_T *)cudaGetErrorString(c22_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c22_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc22_sliding_controller_rbdl
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c22_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c22_nameCaptureInfo = NULL;
  c22_nameCaptureInfo = NULL;
  sf_mex_assign(&c22_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c22_nameCaptureInfo;
}

static void c22_eML_blk_kernel(SFc22_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c22_b_u[6], real_T c22_b_y[7])
{
  c22_b_y[0] = c22_b_u[3];
  c22_b_y[1] = 0.0;
  c22_b_y[2] = c22_b_u[0];
  c22_b_y[3] = c22_b_u[1];
  c22_b_y[4] = c22_b_u[4];
  c22_b_y[5] = c22_b_u[5];
  c22_b_y[6] = c22_b_u[2];
}

static void c22_emlrt_marshallIn(SFc22_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c22_b_y, const char_T *c22_identifier, real_T
  c22_c_y[7])
{
  emlrtMsgIdentifier c22_thisId;
  c22_thisId.fIdentifier = const_cast<const char_T *>(c22_identifier);
  c22_thisId.fParent = NULL;
  c22_thisId.bParentIsCell = false;
  c22_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c22_b_y), &c22_thisId,
    c22_c_y);
  sf_mex_destroy(&c22_b_y);
}

static void c22_b_emlrt_marshallIn(SFc22_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c22_b_u, const emlrtMsgIdentifier *c22_parentId,
  real_T c22_b_y[7])
{
  real_T c22_dv[7];
  int32_T c22_i;
  sf_mex_import(c22_parentId, sf_mex_dup(c22_b_u), c22_dv, 1, 0, 0U, 1, 0U, 2, 1,
                7);
  for (c22_i = 0; c22_i < 7; c22_i++) {
    c22_b_y[c22_i] = c22_dv[c22_i];
  }

  sf_mex_destroy(&c22_b_u);
}

static uint8_T c22_c_emlrt_marshallIn
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c22_b_is_active_c22_sliding_controller_rbdl, const char_T *c22_identifier)
{
  emlrtMsgIdentifier c22_thisId;
  uint8_T c22_b_y;
  c22_thisId.fIdentifier = const_cast<const char_T *>(c22_identifier);
  c22_thisId.fParent = NULL;
  c22_thisId.bParentIsCell = false;
  c22_b_y = c22_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c22_b_is_active_c22_sliding_controller_rbdl), &c22_thisId);
  sf_mex_destroy(&c22_b_is_active_c22_sliding_controller_rbdl);
  return c22_b_y;
}

static uint8_T c22_d_emlrt_marshallIn
  (SFc22_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c22_b_u, const emlrtMsgIdentifier *c22_parentId)
{
  uint8_T c22_b_y;
  uint8_T c22_c_u;
  sf_mex_import(c22_parentId, sf_mex_dup(c22_b_u), &c22_c_u, 1, 3, 0U, 0, 0U, 0);
  c22_b_y = c22_c_u;
  sf_mex_destroy(&c22_b_u);
  return c22_b_y;
}

static void init_dsm_address_info(SFc22_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc22_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
  chartInstance->c22_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c22_u = (real_T (*)[6])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c22_y = (real_T (*)[7])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c22_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(2517670966U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(4150444637U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(1981160258U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2051201109U);
}

mxArray *sf_c22_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c22_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c22_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c22_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfl"
    "UU90P4mcXxicklmWWp8clGRvHFOZkpmXnp8cn5eSVF+Tk5qUXxRUkpOUj+BAB1/B2v"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c22_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "svnY9loGNdJEcvDOTuc9pcC";
}

static void sf_opaque_initialize_c22_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c22_sliding_controller_rbdl
    ((SFc22_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c22_sliding_controller_rbdl
    ((SFc22_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c22_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c22_sliding_controller_rbdl
    ((SFc22_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c22_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c22_sliding_controller_rbdl
    ((SFc22_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c22_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c22_sliding_controller_rbdl
    ((SFc22_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c22_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c22_sliding_controller_rbdl
    ((SFc22_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c22_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c22_sliding_controller_rbdl
    ((SFc22_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c22_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc22_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c22_sliding_controller_rbdl
      ((SFc22_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc22_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc22_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c22_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c22_sliding_controller_rbdl
    ((SFc22_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c22_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c22_sliding_controller_rbdl
    ((SFc22_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc22_sliding_controller_rbdl
    ((SFc22_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c22_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c22_sliding_controller_rbdl
      ((SFc22_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc22_sliding_controller_rbdl
      ((SFc22_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c22_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV0uP00gQ9kQDAgnQCCFxQYIL2j0iLgsXGMZJIGhewhkep6inXYlbaXebfngm4sqVn8Av2Mv",
    "+nL1w5bziwpVq28lkHdthiBgBwpLHafur6qr66tHjrfV2PLyu4L151fPO4/MC3i0vv84V67W5O3",
    "+/7v1RrN+hkLDxPlEk1l7jJUgMz0BLbg2ToieGshLGxBAUCIrYRCpTp02z2HImxl0rqNOnX0SMR",
    "kEkLQ+3UJaEe4JPUFtizT7qaTMF1HQBQhMpaUdRl5PRzGJljvwI6FjbuMkFDSawiTNL71huWMKh",
    "cwy0J7QhaLE+sS0wxIBvjmvddJ7qYAqUccIZEZXeRkQHkGCADRwkIf7dswadKsNoRJTZgoikoLf",
    "ZONMpBZR1Mo0fDpkgRipGeCfmvhNctG2foz07MgTeEBC0bUsBGSeSCVPPf9BFTzuCHHJow6Ed1W",
    "sL4LV15D9ncASqNm5DX6agyAj2RO2mWUA6xxlbsyxZhBkWw3OiHlHkT0NYm72YOTogyBP0UaIOB",
    "pmTPd1XLMXw1mqzcc9l5rKSsXFOtl4Gy7R1UmhiYaatS4VPONe1sL5MtiEFnmltE0OaYbnWapzW",
    "LOxLDLBL7/pqsIIh8QXMlyJklXSlJUDWd3axsfwfSa02MvYxedvb24ufF2E9YUANCYWqLqAI04A",
    "xy8Jbry1k2nGPQLTKZOZVgfMMWYby9NCK9pFUY4xJQxM5ccExWguM9Qi5xEo40Fg0TTDH5TIcJT",
    "SC0DUYxmEHywaxFTHRrrU9wrpLmZm0QVPFkgpWLVYdtqGOS6hJAgdiLOSR6CoZB0WPz8MLgNlGl",
    "GBitIX9S026uHsVFW6e3fFO5tmlr5hnU7ny8885PWsVery5Z3nfi63mfVv4a206f+fkLpf2WS/J",
    "OdwG3h/f3/nUf/Oh9dfbv+NXnye7q+z/T+t08/9Ksb4xbbSzwkkX8tVhn8zZtV6h//qc/o1irVP",
    "x6j6Xj3fDpx2atvf6lt5PqJ/zs8TeVsne6ftbruNjlmX5qWgvLA4mbk1sPq6d/ntz9p5fEo+Lxf",
    "v8+u/havLXNss8ri+R38Bfk1Lefvv+tzZXk8/3f7nE/tslvm9nc31AXLeAAb17d6A5C7HUB1QKo",
    "yTnoAbqMOQlP781308r552x3M9i52+578/718yvs5bzzlhuVf9OO8d/NHzTPPBK+I0f2I9Vz1ff",
    "G/+vd7pz0M1i/WD2r44fMR5WnHqLz3iEHVZ9/QXy9AtTwrUz",
    ""
  };

  static char newstr [1249] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c22_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c22_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(4063272422U));
  ssSetChecksum1(S,(48069460U));
  ssSetChecksum2(S,(1839957047U));
  ssSetChecksum3(S,(1316616025U));
}

static void mdlRTW_c22_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c22_sliding_controller_rbdl(SimStruct *S)
{
  SFc22_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc22_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc22_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc22_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc22_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c22_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c22_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c22_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c22_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c22_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c22_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c22_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c22_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c22_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c22_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c22_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c22_sliding_controller_rbdl;
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
    chartInstance->c22_JITStateAnimation,
    chartInstance->c22_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c22_sliding_controller_rbdl(chartInstance);
}

void c22_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c22_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c22_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c22_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c22_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
