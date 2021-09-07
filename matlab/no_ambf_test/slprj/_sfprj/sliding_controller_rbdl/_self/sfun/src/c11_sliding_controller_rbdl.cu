/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c11_sliding_controller_rbdl.h"
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
static void initialize_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c11_do_animation_call_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c11_st);
static void sf_gateway_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c11_eML_blk_kernel(SFc11_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c11_b_q[2], real_T c11_b_y[4]);
static void c11_emlrt_marshallIn(SFc11_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c11_b_y, const char_T *c11_identifier, real_T
  c11_c_y[4]);
static void c11_b_emlrt_marshallIn(SFc11_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c11_u, const emlrtMsgIdentifier *c11_parentId,
  real_T c11_b_y[4]);
static uint8_T c11_c_emlrt_marshallIn
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c11_b_is_active_c11_sliding_controller_rbdl, const char_T *c11_identifier);
static uint8_T c11_d_emlrt_marshallIn
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c11_u, const emlrtMsgIdentifier *c11_parentId);
static void init_dsm_address_info(SFc11_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc11_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c11_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c11_is_active_c11_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c11_do_animation_call_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance)
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
    &chartInstance->c11_is_active_c11_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c11_b_y, 1, c11_d_y);
  sf_mex_assign(&c11_st, c11_b_y, false);
  return c11_st;
}

static void set_sim_state_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c11_st)
{
  const mxArray *c11_u;
  c11_u = sf_mex_dup(c11_st);
  c11_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c11_u, 0)), "y",
                       *chartInstance->c11_y);
  chartInstance->c11_is_active_c11_sliding_controller_rbdl =
    c11_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c11_u, 1)),
    "is_active_c11_sliding_controller_rbdl");
  sf_mex_destroy(&c11_u);
  sf_mex_destroy(&c11_st);
}

static void sf_gateway_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c11_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c11_eML_blk_kernel(chartInstance, *chartInstance->c11_q, *chartInstance->c11_y);
  c11_do_animation_call_c11_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance)
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

static void mdl_setup_runtime_resources_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc11_sliding_controller_rbdl
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c11_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c11_nameCaptureInfo = NULL;
  c11_nameCaptureInfo = NULL;
  sf_mex_assign(&c11_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c11_nameCaptureInfo;
}

static void c11_eML_blk_kernel(SFc11_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c11_b_q[2], real_T c11_b_y[4])
{
  c11_b_y[0] = -0.324 * muDoubleScalarCos(c11_b_q[0]) + -0.39 *
    muDoubleScalarCos(c11_b_q[0] + c11_b_q[1]);
  c11_b_y[2] = 0.0;
  c11_b_y[1] = 0.324 * muDoubleScalarSin(c11_b_q[0]) - -0.39 * muDoubleScalarSin
    (c11_b_q[0] + c11_b_q[1]);
  c11_b_y[3] = 0.0;
}

static void c11_emlrt_marshallIn(SFc11_sliding_controller_rbdlInstanceStruct
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

static void c11_b_emlrt_marshallIn(SFc11_sliding_controller_rbdlInstanceStruct
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

static uint8_T c11_c_emlrt_marshallIn
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c11_b_is_active_c11_sliding_controller_rbdl, const char_T *c11_identifier)
{
  emlrtMsgIdentifier c11_thisId;
  uint8_T c11_b_y;
  c11_thisId.fIdentifier = const_cast<const char_T *>(c11_identifier);
  c11_thisId.fParent = NULL;
  c11_thisId.bParentIsCell = false;
  c11_b_y = c11_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c11_b_is_active_c11_sliding_controller_rbdl), &c11_thisId);
  sf_mex_destroy(&c11_b_is_active_c11_sliding_controller_rbdl);
  return c11_b_y;
}

static uint8_T c11_d_emlrt_marshallIn
  (SFc11_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c11_u, const emlrtMsgIdentifier *c11_parentId)
{
  uint8_T c11_b_u;
  uint8_T c11_b_y;
  sf_mex_import(c11_parentId, sf_mex_dup(c11_u), &c11_b_u, 1, 3, 0U, 0, 0U, 0);
  c11_b_y = c11_b_u;
  sf_mex_destroy(&c11_u);
  return c11_b_y;
}

static void init_dsm_address_info(SFc11_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc11_sliding_controller_rbdlInstanceStruct
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
void sf_c11_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(2645569171U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(4271796742U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(4000730253U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3632441041U);
}

mxArray *sf_c11_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c11_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c11_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c11_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfl"
    "UU90P4mcXxicklmWWp8cmGhvHFOZkpmXnp8cn5eSVF+Tk5qUXxRUkpOUj+BAB1sx2t"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c11_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sgWZraubfEkzgYQvNqDcgxB";
}

static void sf_opaque_initialize_c11_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c11_sliding_controller_rbdl
    ((SFc11_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c11_sliding_controller_rbdl
    ((SFc11_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c11_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c11_sliding_controller_rbdl
    ((SFc11_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c11_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c11_sliding_controller_rbdl
    ((SFc11_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c11_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c11_sliding_controller_rbdl
    ((SFc11_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c11_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c11_sliding_controller_rbdl
    ((SFc11_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c11_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c11_sliding_controller_rbdl
    ((SFc11_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c11_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc11_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c11_sliding_controller_rbdl
      ((SFc11_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc11_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc11_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c11_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c11_sliding_controller_rbdl
    ((SFc11_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c11_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c11_sliding_controller_rbdl
    ((SFc11_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc11_sliding_controller_rbdl
    ((SFc11_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c11_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c11_sliding_controller_rbdl
      ((SFc11_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc11_sliding_controller_rbdl
      ((SFc11_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c11_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u1EgQdkYBLRKgaLXSXkDLBcERbnBhw/yxIyUkrJPA7mXU066xW9PuNv3jZLiv9rSHfRO",
    "OvAZIIB5jH4Fq2zMZPLaHMCICtJYcT9tfVVfVVz8db2Ow6+F1Fe/tHz3vIj5/wLvl5deFYr2xcO",
    "fvN71bxfofFBI23ieKxNprvASJ4XfQklvDpBiIsayEMTEGBYIiNpHK1GnTLLaciUnfCur06acRo",
    "5EfScuDNsqSYE/wKWpLrNlHPV2mgJo+QGAiJW0Y9TkJ5xYrc9yJgE60jZtc0GB8mziz9K7lhiUc",
    "eidAB0IbghbrU9t8Qwx0zEmtm85T7c+AMk44I6LS24hoHxIMsIHDJMC/e9agU2UYjYgybYhICnq",
    "HTTKdUkBZJ9P4YcQEMVIxwnsx7zjBZdv2OdqzKwPgDQFB29oKyCSRTJh6/v0+etoTZMShCyMb1m",
    "vz4bl15B8xOAZVG7dxR6agSAh7onbTLCC9k4yteZYswwyL4YiohxT50xDUZi9mjvYJ8gQHKFEHg",
    "8zJgT5QLMXw1mqz8cBl5qqSsXFOtl4Fy7T1UmhiYa6tT0WHcK5rYQcy2YEUeKa1SwxphuVaq3Fa",
    "s+BAYoBdetdXgxUMiS9gHSkCVklXWgJkfecxNpaPkdRqI+MOJm93Z2f58zJsIAyoMaFQ1QUUYRo",
    "wZll467UFTDvuEYhWmcy8KnCeIatQnh5b0T2WaoIxaWgipy44RmuBsQ6RS6yEQ41F0wRzXK7CUU",
    "IjCFyDYRx2sWwQWxET7VrbQ6y7lJlpFzRVLKlg1WLVYRvquYSaJnAoJkIei76SsV/0+Dy8AJhtR",
    "Akmwjb2LzXt4+5VVLh5dsc7nWeXP2GezeTKz9sLejYq9HgLz/K+l1rN+7bw18Zs/i7IXSnts1mS",
    "c7gtvP/+96/rr9+lcP9RfO/V0ds36+z/snW2+X+1WF+bNdp54aRL+eqwvy3YtVmh/+cF/VvFWod",
    "P/1TEjsa9yYvwjyfp4+ddGp60c35W2Nsq2Tt7f8N1fMyyLD8VHQTFwcStic3HtdN/b8Heiyvica",
    "l4n1///bqe/E/bZR43V8hv4a9pKW8/f/8b2+vJ5/s/W2H/zRLfN7O5PiSuW8CQ3r071JwFWOpDK",
    "oVRknNQQzUKeMnPz833s8p55yz3rdj5v9yX5/1T5td5y3nnLLeuf2ed418bvmkeeCX81lfsx7rn",
    "qy+Nf++d7Rz0S7F+MP9XpxMxHlSceovPeIQdV339DvL0A6q+tao=",
    ""
  };

  static char newstr [1253] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c11_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c11_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(495292807U));
  ssSetChecksum1(S,(1702287057U));
  ssSetChecksum2(S,(946685753U));
  ssSetChecksum3(S,(3537196728U));
}

static void mdlRTW_c11_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c11_sliding_controller_rbdl(SimStruct *S)
{
  SFc11_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc11_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc11_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc11_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc11_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c11_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c11_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c11_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c11_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c11_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c11_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c11_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c11_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c11_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c11_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c11_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c11_sliding_controller_rbdl;
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

  mdl_setup_runtime_resources_c11_sliding_controller_rbdl(chartInstance);
}

void c11_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c11_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c11_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c11_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c11_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
