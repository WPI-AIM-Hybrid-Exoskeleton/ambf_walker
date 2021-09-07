/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c35_sliding_controller_rbdl.h"
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
static void initialize_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c35_do_animation_call_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c35_st);
static void sf_gateway_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c35_eML_blk_kernel(SFc35_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c35_b_u[7], real_T c35_b_y[7]);
static void c35_emlrt_marshallIn(SFc35_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c35_b_y, const char_T *c35_identifier, real_T
  c35_c_y[7]);
static void c35_b_emlrt_marshallIn(SFc35_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c35_b_u, const emlrtMsgIdentifier *c35_parentId,
  real_T c35_b_y[7]);
static uint8_T c35_c_emlrt_marshallIn
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c35_b_is_active_c35_sliding_controller_rbdl, const char_T *c35_identifier);
static uint8_T c35_d_emlrt_marshallIn
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c35_b_u, const emlrtMsgIdentifier *c35_parentId);
static __global__ void c35_eML_blk_kernel_kernel1(real_T c35_b_y[7]);
static void init_dsm_address_info(SFc35_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc35_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c35_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c35_is_active_c35_sliding_controller_rbdl = 0U;
  cudaGetLastError();
  cudaMalloc(&chartInstance->c35_gpu_y, 56UL);
}

static void initialize_params_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c35_do_animation_call_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  const mxArray *c35_b_y = NULL;
  const mxArray *c35_c_y = NULL;
  const mxArray *c35_d_y = NULL;
  const mxArray *c35_st;
  c35_st = NULL;
  c35_b_y = NULL;
  sf_mex_assign(&c35_b_y, sf_mex_createcellmatrix(2, 1), false);
  c35_c_y = NULL;
  sf_mex_assign(&c35_c_y, sf_mex_create("y", *chartInstance->c35_y, 0, 0U, 1U,
    0U, 2, 1, 7), false);
  sf_mex_setcell(c35_b_y, 0, c35_c_y);
  c35_d_y = NULL;
  sf_mex_assign(&c35_d_y, sf_mex_create("y",
    &chartInstance->c35_is_active_c35_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c35_b_y, 1, c35_d_y);
  sf_mex_assign(&c35_st, c35_b_y, false);
  return c35_st;
}

static void set_sim_state_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c35_st)
{
  const mxArray *c35_b_u;
  c35_b_u = sf_mex_dup(c35_st);
  c35_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c35_b_u, 0)),
                       "y", *chartInstance->c35_y);
  chartInstance->c35_is_active_c35_sliding_controller_rbdl =
    c35_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c35_b_u, 1)),
    "is_active_c35_sliding_controller_rbdl");
  sf_mex_destroy(&c35_b_u);
  sf_mex_destroy(&c35_st);
}

static void sf_gateway_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  real_T c35_dv[7];
  real_T c35_dv1[7];
  int32_T c35_i;
  int32_T c35_i1;
  chartInstance->c35_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  for (c35_i = 0; c35_i < 7; c35_i++) {
    c35_dv[c35_i] = (*chartInstance->c35_u)[c35_i];
  }

  c35_eML_blk_kernel(chartInstance, c35_dv, c35_dv1);
  for (c35_i1 = 0; c35_i1 < 7; c35_i1++) {
    (*chartInstance->c35_y)[c35_i1] = c35_dv1[c35_i1];
  }

  c35_do_animation_call_c35_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c35_errCode;
  cudaFree(*chartInstance->c35_gpu_y);
  c35_errCode = cudaGetLastError();
  if (c35_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c35_errCode, (char_T *)cudaGetErrorName
                       (c35_errCode), (char_T *)cudaGetErrorString(c35_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c35_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc35_sliding_controller_rbdl
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c35_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c35_nameCaptureInfo = NULL;
  c35_nameCaptureInfo = NULL;
  sf_mex_assign(&c35_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c35_nameCaptureInfo;
}

static void c35_eML_blk_kernel(SFc35_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c35_b_u[7], real_T c35_b_y[7])
{
  c35_eML_blk_kernel_kernel1<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c35_gpu_y);
  cudaMemcpy(c35_b_y, *chartInstance->c35_gpu_y, 56UL, cudaMemcpyDeviceToHost);
  c35_b_y[0] = c35_b_u[3];
  c35_b_y[1] = c35_b_u[0];
  c35_b_y[2] = c35_b_u[1];
  c35_b_y[3] = c35_b_u[2];
  c35_b_y[4] = c35_b_u[4];
  c35_b_y[5] = c35_b_u[5];
}

static void c35_emlrt_marshallIn(SFc35_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c35_b_y, const char_T *c35_identifier, real_T
  c35_c_y[7])
{
  emlrtMsgIdentifier c35_thisId;
  c35_thisId.fIdentifier = const_cast<const char_T *>(c35_identifier);
  c35_thisId.fParent = NULL;
  c35_thisId.bParentIsCell = false;
  c35_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c35_b_y), &c35_thisId,
    c35_c_y);
  sf_mex_destroy(&c35_b_y);
}

static void c35_b_emlrt_marshallIn(SFc35_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c35_b_u, const emlrtMsgIdentifier *c35_parentId,
  real_T c35_b_y[7])
{
  real_T c35_dv[7];
  int32_T c35_i;
  sf_mex_import(c35_parentId, sf_mex_dup(c35_b_u), c35_dv, 1, 0, 0U, 1, 0U, 2, 1,
                7);
  for (c35_i = 0; c35_i < 7; c35_i++) {
    c35_b_y[c35_i] = c35_dv[c35_i];
  }

  sf_mex_destroy(&c35_b_u);
}

static uint8_T c35_c_emlrt_marshallIn
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c35_b_is_active_c35_sliding_controller_rbdl, const char_T *c35_identifier)
{
  emlrtMsgIdentifier c35_thisId;
  uint8_T c35_b_y;
  c35_thisId.fIdentifier = const_cast<const char_T *>(c35_identifier);
  c35_thisId.fParent = NULL;
  c35_thisId.bParentIsCell = false;
  c35_b_y = c35_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c35_b_is_active_c35_sliding_controller_rbdl), &c35_thisId);
  sf_mex_destroy(&c35_b_is_active_c35_sliding_controller_rbdl);
  return c35_b_y;
}

static uint8_T c35_d_emlrt_marshallIn
  (SFc35_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c35_b_u, const emlrtMsgIdentifier *c35_parentId)
{
  uint8_T c35_b_y;
  uint8_T c35_c_u;
  sf_mex_import(c35_parentId, sf_mex_dup(c35_b_u), &c35_c_u, 1, 3, 0U, 0, 0U, 0);
  c35_b_y = c35_c_u;
  sf_mex_destroy(&c35_b_u);
  return c35_b_y;
}

static __global__ __launch_bounds__(32, 1) void c35_eML_blk_kernel_kernel1
  (real_T c35_b_y[7])
{
  uint64_T c35_threadId;
  int32_T c35_i;
  c35_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c35_i = (int32_T)c35_threadId;
  if (c35_i < 7) {
    c35_b_y[c35_i] = 0.0;
  }
}

static void init_dsm_address_info(SFc35_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc35_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
  chartInstance->c35_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c35_u = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c35_y = (real_T (*)[7])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c35_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(3695039179U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(714296334U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2541404152U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3670390759U);
}

mxArray *sf_c35_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c35_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c35_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c35_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfl"
    "UU90P4mcXxicklmWWp8cnGpvHFOZkpmXnp8cn5eSVF+Tk5qUXxRUkpOUj+BAB2jR2z"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c35_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "spfioONSEyxKl3rszkFZWnD";
}

static void sf_opaque_initialize_c35_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c35_sliding_controller_rbdl
    ((SFc35_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c35_sliding_controller_rbdl
    ((SFc35_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c35_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c35_sliding_controller_rbdl
    ((SFc35_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c35_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c35_sliding_controller_rbdl
    ((SFc35_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c35_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c35_sliding_controller_rbdl
    ((SFc35_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c35_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c35_sliding_controller_rbdl
    ((SFc35_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c35_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c35_sliding_controller_rbdl
    ((SFc35_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c35_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc35_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c35_sliding_controller_rbdl
      ((SFc35_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc35_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc35_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c35_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c35_sliding_controller_rbdl
    ((SFc35_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c35_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c35_sliding_controller_rbdl
    ((SFc35_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc35_sliding_controller_rbdl
    ((SFc35_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c35_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c35_sliding_controller_rbdl
      ((SFc35_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc35_sliding_controller_rbdl
      ((SFc35_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c35_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV91u00gUdqNuBVoWVQgJISEBF2hXXK1UIXEFbZNYRDS0wi2sVlpF0/FJPMp4xsxPmuztXu8",
    "DcMcj8BTcc7e3+wb7CHvGdtLg2E7biAoQllxn7O+cOed852fqrXW6Hl7X8d6+4Xkb+LyCd8PLrh",
    "/y9drcnb1f937O13+jkLDxAVEk1l7tJUgML0FLbg2ToiP6shTGRB8UCIrYRCpTpU2z2HImhr4V1",
    "OnTryNGoyCSloe7KEvCfcEnqC2x5gD1tJgCanyA0ERK2kHkczKYWazMSTMCOtQ2rnNBgwls4szS",
    "XcsNSzi0x0A7QhuCFutT2wJDDDTNuNJN56kOpkAZJ5wRUeptRHQACQbYwFES4t99a9CpIoxGRJl",
    "diMgI9B4bpjqlgKJOpvHDMRPESMUIb8e86QQXbTvgaE9XhsBrAoK27Sogw0QyYar5D3z0tC3IMY",
    "cWHNtBtbYA3lhH/isGJ6Aq49ZvyhEoMoB9UblpGpD2OGVrliWLMMNieEXUDkX+NISV2YuZowOCP",
    "MEhSlTBIHWyow8VG2F4K7XZuOMyc1nJ2DgjWy+DpdraI6hjYabNp6JJONeVsEOZ7MEIeKq1RQyp",
    "h2Vay3Fas/BQYoBdeldXgxUMic9hTSlCVkrXqABI+84LbCyfIqnVRsZNTN7W3t7i50VYRxhQfUK",
    "hrAsowjRgzNLwVmsLmXbcIxCtMql5ZeAsQ5ahPN23onUi1RBjUtNETl1wjFYCYz1ALrESjjQWTR",
    "3McbkMRwmNIHQNhnHoYtkgtiQm2rW2Hay7ETOTFmiqWFLCqsWqwzbUdgk1SeBIDIU8Eb6ScZD3+",
    "Cy8AJhtRAkmBrvYv9TEx93LqHDz7FfvdJ5dO8M8m8oVn7/M6Vkr0ePNPYv7Xm3U79vAX2vT+Tsn",
    "91Nhn/WCnMNt4v3u37/++PH2248PX94PP4z97ir7v2+cb/5fz9d3po12VjijhXx12Gdzdq2X6L8",
    "1p38zX+ukz+T+i6A9GT/nW0r/OfR/fy1aGT9L7G0U7J2+v+c6PmZZmp+KdsL8YOLWxGbj2ul/PG",
    "fvxpJ4XM3fZ9d/T1eTv7ld5HF9ifwm/poU8vbi+9/bXk0+2/+3JfY/KPD9IJ3rPeK6BfTo1qOe5",
    "izEUu9RKYySnIPqqeOQF/y8aL6fV867ZLmvxc7vcp+f97PMr8uW8y5ZblX/zjvHvzR83TzwCvjN",
    "L9iPVc9Xnxv/j3e+c9DdfP1k9q9OM2I8LDn15p/xCNsv+/oN5On/EZK0LA==",
    ""
  };

  static char newstr [1261] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c35_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c35_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(1568924064U));
  ssSetChecksum1(S,(3516471563U));
  ssSetChecksum2(S,(1679905322U));
  ssSetChecksum3(S,(1296464070U));
}

static void mdlRTW_c35_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c35_sliding_controller_rbdl(SimStruct *S)
{
  SFc35_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc35_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc35_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc35_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc35_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c35_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c35_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c35_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c35_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c35_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c35_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c35_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c35_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c35_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c35_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c35_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c35_sliding_controller_rbdl;
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
    chartInstance->c35_JITStateAnimation,
    chartInstance->c35_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c35_sliding_controller_rbdl(chartInstance);
}

void c35_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c35_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c35_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c35_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c35_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
