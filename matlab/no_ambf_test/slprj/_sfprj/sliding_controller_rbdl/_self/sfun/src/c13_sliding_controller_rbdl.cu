/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c13_sliding_controller_rbdl.h"
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
static void initialize_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c13_do_animation_call_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c13_st);
static void sf_gateway_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c13_eML_blk_kernel(SFc13_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c13_b_q[2], real_T c13_b_y[4]);
static void c13_emlrt_marshallIn(SFc13_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c13_b_y, const char_T *c13_identifier, real_T
  c13_c_y[4]);
static void c13_b_emlrt_marshallIn(SFc13_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c13_u, const emlrtMsgIdentifier *c13_parentId,
  real_T c13_b_y[4]);
static uint8_T c13_c_emlrt_marshallIn
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c13_b_is_active_c13_sliding_controller_rbdl, const char_T *c13_identifier);
static uint8_T c13_d_emlrt_marshallIn
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c13_u, const emlrtMsgIdentifier *c13_parentId);
static void init_dsm_address_info(SFc13_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc13_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c13_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c13_is_active_c13_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c13_do_animation_call_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance)
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
    &chartInstance->c13_is_active_c13_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c13_b_y, 1, c13_d_y);
  sf_mex_assign(&c13_st, c13_b_y, false);
  return c13_st;
}

static void set_sim_state_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c13_st)
{
  const mxArray *c13_u;
  c13_u = sf_mex_dup(c13_st);
  c13_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c13_u, 0)), "y",
                       *chartInstance->c13_y);
  chartInstance->c13_is_active_c13_sliding_controller_rbdl =
    c13_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c13_u, 1)),
    "is_active_c13_sliding_controller_rbdl");
  sf_mex_destroy(&c13_u);
  sf_mex_destroy(&c13_st);
}

static void sf_gateway_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c13_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c13_eML_blk_kernel(chartInstance, *chartInstance->c13_q, *chartInstance->c13_y);
  c13_do_animation_call_c13_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance)
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

static void mdl_setup_runtime_resources_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc13_sliding_controller_rbdl
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c13_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c13_nameCaptureInfo = NULL;
  c13_nameCaptureInfo = NULL;
  sf_mex_assign(&c13_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c13_nameCaptureInfo;
}

static void c13_eML_blk_kernel(SFc13_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c13_b_q[2], real_T c13_b_y[4])
{
  c13_b_y[0] = -0.324 * muDoubleScalarCos(c13_b_q[0]) + -0.39 *
    muDoubleScalarCos(c13_b_q[0] + c13_b_q[1]);
  c13_b_y[2] = 0.0;
  c13_b_y[1] = 0.324 * muDoubleScalarSin(c13_b_q[0]) - -0.39 * muDoubleScalarSin
    (c13_b_q[0] + c13_b_q[1]);
  c13_b_y[3] = 0.0;
}

static void c13_emlrt_marshallIn(SFc13_sliding_controller_rbdlInstanceStruct
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

static void c13_b_emlrt_marshallIn(SFc13_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c13_u, const emlrtMsgIdentifier *c13_parentId,
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
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c13_b_is_active_c13_sliding_controller_rbdl, const char_T *c13_identifier)
{
  emlrtMsgIdentifier c13_thisId;
  uint8_T c13_b_y;
  c13_thisId.fIdentifier = const_cast<const char_T *>(c13_identifier);
  c13_thisId.fParent = NULL;
  c13_thisId.bParentIsCell = false;
  c13_b_y = c13_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c13_b_is_active_c13_sliding_controller_rbdl), &c13_thisId);
  sf_mex_destroy(&c13_b_is_active_c13_sliding_controller_rbdl);
  return c13_b_y;
}

static uint8_T c13_d_emlrt_marshallIn
  (SFc13_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c13_u, const emlrtMsgIdentifier *c13_parentId)
{
  uint8_T c13_b_u;
  uint8_T c13_b_y;
  sf_mex_import(c13_parentId, sf_mex_dup(c13_u), &c13_b_u, 1, 3, 0U, 0, 0U, 0);
  c13_b_y = c13_b_u;
  sf_mex_destroy(&c13_u);
  return c13_b_y;
}

static void init_dsm_address_info(SFc13_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc13_sliding_controller_rbdlInstanceStruct
  *chartInstance)
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
void sf_c13_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(3354674951U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1529774139U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2473256034U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2602264389U);
}

mxArray *sf_c13_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c13_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c13_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c13_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfl"
    "UU90P4mcXxicklmWWp8cmGxvHFOZkpmXnp8cn5eSVF+Tk5qUXxRUkpOUj+BAB1+x2v"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c13_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sKQAtHLtNrhPdUXOtv0bf0";
}

static void sf_opaque_initialize_c13_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c13_sliding_controller_rbdl
    ((SFc13_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c13_sliding_controller_rbdl
    ((SFc13_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c13_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c13_sliding_controller_rbdl
    ((SFc13_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c13_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c13_sliding_controller_rbdl
    ((SFc13_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c13_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c13_sliding_controller_rbdl
    ((SFc13_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c13_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c13_sliding_controller_rbdl
    ((SFc13_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c13_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c13_sliding_controller_rbdl
    ((SFc13_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c13_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc13_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c13_sliding_controller_rbdl
      ((SFc13_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc13_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc13_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c13_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c13_sliding_controller_rbdl
    ((SFc13_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c13_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c13_sliding_controller_rbdl
    ((SFc13_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc13_sliding_controller_rbdl
    ((SFc13_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c13_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c13_sliding_controller_rbdl
      ((SFc13_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc13_sliding_controller_rbdl
      ((SFc13_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c13_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u00oUdqOCqASoQlesroANgmURG1bctvkREekPuAV20WR8Eo8ynvGdH7d5CCQehT0SD8A",
    "T8ArsWLNAnLGdNDi2Q4mo4Opacp2xv3PmnPOdn6m31t3z8LqO9/YNz7uMzyt4N7zsupSv1+bu7P",
    "26dy9fv0YhYaNDokikvdpLkAieg5bcGiZFVwxlKYyJISgQFLGxVKZKm2aR5UyMO1ZQp0+/DBkN/",
    "VBaHuyiLAkOBJ+gttiaQ9TTYgqo6QAEJlTSjsIOJ6OZxcqcNEOgY22jOhc0GN/Gziy9Z7lhMYf2",
    "KdCu0IagxfrMNt8QA01zWumm81T7U6CMYs6IKPU2JNqHGANs4DgO8O+BNehUEUZDoswuhCQB3WP",
    "jVKcUUNTJNH4YMEGMVIzwdsSbTnDRtkOO9uzJAHhNQNC2XQVkHEsmTDX/fgc9bQsy4NCCgR1Va/",
    "PhX+vIf8HgBFRl3IZNmYAiIzgQlZumAWmfpmzNsmQRZlgEL4jaocifhqAyezFztE+QJzhCiSoYp",
    "E529ZFiCYa3UpuNui4zl5WMjTKy9TJYqq2dQB0LM20dKpqEc10JO5JxDxLgqdYWMaQelmktx2nN",
    "giOJAXbpXV0NVjAkPoc1pQhYKV1JAZD2nX1sLN8jqdVGRk1M3lavt/h5EdYVBtSQUCjrAoowDRi",
    "zNLzV2gKmHfcIRKtMal4ZOMuQZShPD61onUg1xpjUNJEzFxyjlcBIj5BLrIRjjUVTB3NcLsNRQk",
    "MIXINhHPawbBBbEhPtWtsO1l3CzKQFmioWl7BqseqwDbVdQk1iOBZjIU9ER8nIz3t8Fl4AzDaiB",
    "BOjXexfatLB3cuocPNsyzubZ1d/YJ5N5YrP+3N61kr0eHPP4r4bjfp9G/hrbTp/5+SuFfZZL8g5",
    "3KYrBvN40vj0bv/9m40vX599uLXK/m8b55v/1/P139NGOyucZCFfHfbJnF3rJfpvzunfzNf66bM",
    "d86Rn9lV4GBy/OjDJ1mC4lfOzxN5Gwd7p+zuu42OWpfmpaDfIDyZuTWw2rp3+R3P2Xl4Sj438fX",
    "Z9/mc1+b+2izyuL5HfxF+TQt7+/P53tleTz/Z/tcT+uwW+76ZzvU9ct4A+ffCwrzkLsNT7VAqjJ",
    "Oeg+moQ8IKfP5vv55XzLljuT7Hzf7lfz/uPzK+LlvMuWG5V/847x383fN088Ar4zd/Yj1XPV78a",
    "/9E73znodr5+PPtXpxkyHpScevPPeIQdln39D+TpNzSrtJQ=",
    ""
  };

  static char newstr [1249] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c13_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c13_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(2034136182U));
  ssSetChecksum1(S,(1320937730U));
  ssSetChecksum2(S,(4194930878U));
  ssSetChecksum3(S,(516575742U));
}

static void mdlRTW_c13_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c13_sliding_controller_rbdl(SimStruct *S)
{
  SFc13_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc13_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc13_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc13_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc13_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c13_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c13_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c13_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c13_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c13_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c13_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c13_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c13_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c13_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c13_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c13_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c13_sliding_controller_rbdl;
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

  mdl_setup_runtime_resources_c13_sliding_controller_rbdl(chartInstance);
}

void c13_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c13_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c13_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c13_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c13_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
