/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c40_sliding_controller_rbdl.h"
#include "MWCudaDimUtility.hpp"
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
static void initialize_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c40_do_animation_call_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c40_st);
static void sf_gateway_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c40_eML_blk_kernel(SFc40_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c40_b_u[7], real_T c40_b_y[7]);
static void c40_emlrt_marshallIn(SFc40_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c40_b_y, const char_T *c40_identifier, real_T
  c40_c_y[7]);
static void c40_b_emlrt_marshallIn(SFc40_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c40_b_u, const emlrtMsgIdentifier *c40_parentId,
  real_T c40_b_y[7]);
static uint8_T c40_c_emlrt_marshallIn
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c40_b_is_active_c40_sliding_controller_rbdl, const char_T *c40_identifier);
static uint8_T c40_d_emlrt_marshallIn
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c40_b_u, const emlrtMsgIdentifier *c40_parentId);
static __global__ void c40_eML_blk_kernel_kernel1(real_T c40_b_y[7]);
static void init_dsm_address_info(SFc40_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc40_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c40_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c40_is_active_c40_sliding_controller_rbdl = 0U;
  cudaGetLastError();
  cudaMalloc(&chartInstance->c40_gpu_y, 56UL);
}

static void initialize_params_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c40_do_animation_call_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  const mxArray *c40_b_y = NULL;
  const mxArray *c40_c_y = NULL;
  const mxArray *c40_d_y = NULL;
  const mxArray *c40_st;
  c40_st = NULL;
  c40_b_y = NULL;
  sf_mex_assign(&c40_b_y, sf_mex_createcellmatrix(2, 1), false);
  c40_c_y = NULL;
  sf_mex_assign(&c40_c_y, sf_mex_create("y", *chartInstance->c40_y, 0, 0U, 1U,
    0U, 1, 7), false);
  sf_mex_setcell(c40_b_y, 0, c40_c_y);
  c40_d_y = NULL;
  sf_mex_assign(&c40_d_y, sf_mex_create("y",
    &chartInstance->c40_is_active_c40_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c40_b_y, 1, c40_d_y);
  sf_mex_assign(&c40_st, c40_b_y, false);
  return c40_st;
}

static void set_sim_state_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c40_st)
{
  const mxArray *c40_b_u;
  c40_b_u = sf_mex_dup(c40_st);
  c40_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c40_b_u, 0)),
                       "y", *chartInstance->c40_y);
  chartInstance->c40_is_active_c40_sliding_controller_rbdl =
    c40_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c40_b_u, 1)),
    "is_active_c40_sliding_controller_rbdl");
  sf_mex_destroy(&c40_b_u);
  sf_mex_destroy(&c40_st);
}

static void sf_gateway_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  real_T c40_dv[7];
  real_T c40_dv1[7];
  int32_T c40_i;
  int32_T c40_i1;
  chartInstance->c40_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  for (c40_i = 0; c40_i < 7; c40_i++) {
    c40_dv[c40_i] = (*chartInstance->c40_u)[c40_i];
  }

  c40_eML_blk_kernel(chartInstance, c40_dv, c40_dv1);
  for (c40_i1 = 0; c40_i1 < 7; c40_i1++) {
    (*chartInstance->c40_y)[c40_i1] = c40_dv1[c40_i1];
  }

  c40_do_animation_call_c40_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c40_errCode;
  cudaFree(*chartInstance->c40_gpu_y);
  c40_errCode = cudaGetLastError();
  if (c40_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c40_errCode, (char_T *)cudaGetErrorName
                       (c40_errCode), (char_T *)cudaGetErrorString(c40_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c40_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc40_sliding_controller_rbdl
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c40_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c40_nameCaptureInfo = NULL;
  c40_nameCaptureInfo = NULL;
  sf_mex_assign(&c40_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c40_nameCaptureInfo;
}

static void c40_eML_blk_kernel(SFc40_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c40_b_u[7], real_T c40_b_y[7])
{
  c40_eML_blk_kernel_kernel1<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c40_gpu_y);
  cudaMemcpy(c40_b_y, *chartInstance->c40_gpu_y, 56UL, cudaMemcpyDeviceToHost);
  c40_b_y[0] = c40_b_u[1];
  c40_b_y[1] = c40_b_u[2];
  c40_b_y[2] = c40_b_u[3];
  c40_b_y[3] = c40_b_u[0];
  c40_b_y[4] = c40_b_u[4];
  c40_b_y[5] = c40_b_u[5];
}

static void c40_emlrt_marshallIn(SFc40_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c40_b_y, const char_T *c40_identifier, real_T
  c40_c_y[7])
{
  emlrtMsgIdentifier c40_thisId;
  c40_thisId.fIdentifier = const_cast<const char_T *>(c40_identifier);
  c40_thisId.fParent = NULL;
  c40_thisId.bParentIsCell = false;
  c40_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c40_b_y), &c40_thisId,
    c40_c_y);
  sf_mex_destroy(&c40_b_y);
}

static void c40_b_emlrt_marshallIn(SFc40_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c40_b_u, const emlrtMsgIdentifier *c40_parentId,
  real_T c40_b_y[7])
{
  real_T c40_dv[7];
  int32_T c40_i;
  sf_mex_import(c40_parentId, sf_mex_dup(c40_b_u), c40_dv, 1, 0, 0U, 1, 0U, 1, 7);
  for (c40_i = 0; c40_i < 7; c40_i++) {
    c40_b_y[c40_i] = c40_dv[c40_i];
  }

  sf_mex_destroy(&c40_b_u);
}

static uint8_T c40_c_emlrt_marshallIn
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c40_b_is_active_c40_sliding_controller_rbdl, const char_T *c40_identifier)
{
  emlrtMsgIdentifier c40_thisId;
  uint8_T c40_b_y;
  c40_thisId.fIdentifier = const_cast<const char_T *>(c40_identifier);
  c40_thisId.fParent = NULL;
  c40_thisId.bParentIsCell = false;
  c40_b_y = c40_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c40_b_is_active_c40_sliding_controller_rbdl), &c40_thisId);
  sf_mex_destroy(&c40_b_is_active_c40_sliding_controller_rbdl);
  return c40_b_y;
}

static uint8_T c40_d_emlrt_marshallIn
  (SFc40_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c40_b_u, const emlrtMsgIdentifier *c40_parentId)
{
  uint8_T c40_b_y;
  uint8_T c40_c_u;
  sf_mex_import(c40_parentId, sf_mex_dup(c40_b_u), &c40_c_u, 1, 3, 0U, 0, 0U, 0);
  c40_b_y = c40_c_u;
  sf_mex_destroy(&c40_b_u);
  return c40_b_y;
}

static __global__ __launch_bounds__(32, 1) void c40_eML_blk_kernel_kernel1
  (real_T c40_b_y[7])
{
  uint64_T c40_threadId;
  int32_T c40_i;
  c40_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c40_i = (int32_T)c40_threadId;
  if (c40_i < 7) {
    c40_b_y[c40_i] = 0.0;
  }
}

static void init_dsm_address_info(SFc40_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc40_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
  chartInstance->c40_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c40_u = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c40_y = (real_T (*)[7])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c40_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(3761594018U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1451773495U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2587411843U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(4121430803U);
}

mxArray *sf_c40_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c40_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c40_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c40_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfl"
    "UU90P4mcXxicklmWWp8ckmBvHFOZkpmXnp8cn5eSVF+Tk5qUXxRUkpOUj+BAB1/h2v"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c40_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sEsyT33uilQMeLbc2q1KEGD";
}

static void sf_opaque_initialize_c40_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c40_sliding_controller_rbdl
    ((SFc40_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c40_sliding_controller_rbdl
    ((SFc40_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c40_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c40_sliding_controller_rbdl
    ((SFc40_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c40_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c40_sliding_controller_rbdl
    ((SFc40_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c40_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c40_sliding_controller_rbdl
    ((SFc40_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c40_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c40_sliding_controller_rbdl
    ((SFc40_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c40_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c40_sliding_controller_rbdl
    ((SFc40_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c40_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc40_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c40_sliding_controller_rbdl
      ((SFc40_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc40_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc40_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c40_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c40_sliding_controller_rbdl
    ((SFc40_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c40_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c40_sliding_controller_rbdl
    ((SFc40_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc40_sliding_controller_rbdl
    ((SFc40_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c40_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c40_sliding_controller_rbdl
      ((SFc40_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc40_sliding_controller_rbdl
      ((SFc40_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c40_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81uE0kQnlgJAmkXRQiJCxLhgNhjIBw4QYh/wFp7k91xAjer3VP2tNzTPfSPE1/3tJd9BV5",
    "gL4gn4DH2Cfa8l71v9czYMeOZMcEiAsRIk3HPfFVdVV/9dLyNdtfD6zre+zc87wo+r+Jd89JrK1",
    "tvLNzp+03vfrb+E4WEjY6IIpH2Ki9BIvgNtOTWMCnaYigLYUwMQYGgiI2lMmXaNIssZ2LcsoI6f",
    "fplyGjoh9Ly4ABlSXAo+BS1xdYcoZ4GU0BNCyAwoZJ2FLY4Gc0tVua0HgIdaxtVuaDB+DZ2Zumu",
    "5YbFHJpnQNtCG4IW63PbfEMM1M1ZqZvOU+3PgDKKOSOi0NuQaB9iDLCB4zjAv4fWoFN5GA2JMgc",
    "QkgnoDhsnOqWAvE6m8cOACWKkYoQ3I153gsu2HXG0pysD4BUBQdsOFJBxLJkw5fz7LfS0KciAQw",
    "MGdlSuzYfX1pF/wuAUVGnchnU5AUVGcChKN00C0jxL2JpnyTLMsAhOiHpGkT8NQWn2YuZonyBP0",
    "EOJMhgkTrZ1T7EJhrdUm43aLjNXlYyNUrL1KliirTmBKhbm2lpU1AnnuhTWk3EHJsATrQ1iSDUs",
    "1VqM05oFPYkBduldXg1WMCQ+g9WlCFghXZMcIOk7v2Bj+RBJrTYyqmPyNjqd5c/LsLYwoIaEQlE",
    "XUIRpwJgl4S3XFjDtuEcgWmUS84rAaYasQnl6aEXjVKoxxqSiiZy74BgtBUZ6hFxiJRxrLJoqmO",
    "NyFY4SGkLgGgzj0MWyQWxBTLRrbc+w7ibMTBugqWJxAasWqw7bUNMl1DSGYzEW8lS0lIz8rMen4",
    "QXAbCNKMDE6wP6lpi3cvYgKN892vfN59sNHzLOZXP7504KejQI93sIzv++1WvW+Nfy1MZu/C3I/",
    "5vbZzMk53Dbe73f+eCp+f7f16r9/9t/c/evNOvu/rV1s/l/P1rdnjXZeOJOlfHXYFwt2bRbov7W",
    "gfztb66ae9vb2LOO/dqEzoA9fP/i5+byR8rPC3lrO3tn7HdfxMcuS/FS0HWQHE7cmNh3XTv/jBX",
    "uvrIjHtex9ev37dD35m/t5HjdXyG/jr2kubz99/5399eTT/V+tsP9eju97yVzvE9ctoE8f7fY1Z",
    "wGWep9KYZTkHFRfDQKe8/NT8/2ict4ly30tdn6X+/y8f8z8umw575Ll1vXvonP8S8NXzQMvh9/+",
    "gv1Y93z1ufF/exc7B93J1k/m/+rUQ8aDglNv9hmPsMOir99Anv4Pacq0Nw==",
    ""
  };

  static char newstr [1261] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c40_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c40_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(1065885888U));
  ssSetChecksum1(S,(95584878U));
  ssSetChecksum2(S,(1088877912U));
  ssSetChecksum3(S,(2662015390U));
}

static void mdlRTW_c40_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c40_sliding_controller_rbdl(SimStruct *S)
{
  SFc40_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc40_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc40_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc40_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc40_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c40_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c40_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c40_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c40_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c40_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c40_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c40_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c40_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c40_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c40_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c40_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c40_sliding_controller_rbdl;
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
    chartInstance->c40_JITStateAnimation,
    chartInstance->c40_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c40_sliding_controller_rbdl(chartInstance);
}

void c40_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c40_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c40_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c40_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c40_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
