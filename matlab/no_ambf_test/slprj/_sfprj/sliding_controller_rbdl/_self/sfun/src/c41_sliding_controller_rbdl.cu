/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c41_sliding_controller_rbdl.h"
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
static void initialize_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c41_do_animation_call_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c41_st);
static void sf_gateway_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c41_eML_blk_kernel(SFc41_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c41_b_u[7], real_T c41_b_y[7]);
static void c41_emlrt_marshallIn(SFc41_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c41_b_y, const char_T *c41_identifier, real_T
  c41_c_y[7]);
static void c41_b_emlrt_marshallIn(SFc41_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c41_b_u, const emlrtMsgIdentifier *c41_parentId,
  real_T c41_b_y[7]);
static uint8_T c41_c_emlrt_marshallIn
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c41_b_is_active_c41_sliding_controller_rbdl, const char_T *c41_identifier);
static uint8_T c41_d_emlrt_marshallIn
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c41_b_u, const emlrtMsgIdentifier *c41_parentId);
static __global__ void c41_eML_blk_kernel_kernel1(real_T c41_b_y[7]);
static void init_dsm_address_info(SFc41_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc41_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c41_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c41_is_active_c41_sliding_controller_rbdl = 0U;
  cudaGetLastError();
  cudaMalloc(&chartInstance->c41_gpu_y, 56UL);
}

static void initialize_params_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c41_do_animation_call_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  const mxArray *c41_b_y = NULL;
  const mxArray *c41_c_y = NULL;
  const mxArray *c41_d_y = NULL;
  const mxArray *c41_st;
  c41_st = NULL;
  c41_b_y = NULL;
  sf_mex_assign(&c41_b_y, sf_mex_createcellmatrix(2, 1), false);
  c41_c_y = NULL;
  sf_mex_assign(&c41_c_y, sf_mex_create("y", *chartInstance->c41_y, 0, 0U, 1U,
    0U, 1, 7), false);
  sf_mex_setcell(c41_b_y, 0, c41_c_y);
  c41_d_y = NULL;
  sf_mex_assign(&c41_d_y, sf_mex_create("y",
    &chartInstance->c41_is_active_c41_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c41_b_y, 1, c41_d_y);
  sf_mex_assign(&c41_st, c41_b_y, false);
  return c41_st;
}

static void set_sim_state_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c41_st)
{
  const mxArray *c41_b_u;
  c41_b_u = sf_mex_dup(c41_st);
  c41_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c41_b_u, 0)),
                       "y", *chartInstance->c41_y);
  chartInstance->c41_is_active_c41_sliding_controller_rbdl =
    c41_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c41_b_u, 1)),
    "is_active_c41_sliding_controller_rbdl");
  sf_mex_destroy(&c41_b_u);
  sf_mex_destroy(&c41_st);
}

static void sf_gateway_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  real_T c41_dv[7];
  real_T c41_dv1[7];
  int32_T c41_i;
  int32_T c41_i1;
  chartInstance->c41_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  for (c41_i = 0; c41_i < 7; c41_i++) {
    c41_dv[c41_i] = (*chartInstance->c41_u)[c41_i];
  }

  c41_eML_blk_kernel(chartInstance, c41_dv, c41_dv1);
  for (c41_i1 = 0; c41_i1 < 7; c41_i1++) {
    (*chartInstance->c41_y)[c41_i1] = c41_dv1[c41_i1];
  }

  c41_do_animation_call_c41_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c41_errCode;
  cudaFree(*chartInstance->c41_gpu_y);
  c41_errCode = cudaGetLastError();
  if (c41_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c41_errCode, (char_T *)cudaGetErrorName
                       (c41_errCode), (char_T *)cudaGetErrorString(c41_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c41_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc41_sliding_controller_rbdl
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c41_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c41_nameCaptureInfo = NULL;
  c41_nameCaptureInfo = NULL;
  sf_mex_assign(&c41_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c41_nameCaptureInfo;
}

static void c41_eML_blk_kernel(SFc41_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c41_b_u[7], real_T c41_b_y[7])
{
  c41_eML_blk_kernel_kernel1<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c41_gpu_y);
  cudaMemcpy(c41_b_y, *chartInstance->c41_gpu_y, 56UL, cudaMemcpyDeviceToHost);
  c41_b_y[0] = c41_b_u[1];
  c41_b_y[1] = c41_b_u[2];
  c41_b_y[2] = c41_b_u[3];
  c41_b_y[3] = c41_b_u[0];
  c41_b_y[4] = c41_b_u[4];
  c41_b_y[5] = c41_b_u[5];
}

static void c41_emlrt_marshallIn(SFc41_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c41_b_y, const char_T *c41_identifier, real_T
  c41_c_y[7])
{
  emlrtMsgIdentifier c41_thisId;
  c41_thisId.fIdentifier = const_cast<const char_T *>(c41_identifier);
  c41_thisId.fParent = NULL;
  c41_thisId.bParentIsCell = false;
  c41_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c41_b_y), &c41_thisId,
    c41_c_y);
  sf_mex_destroy(&c41_b_y);
}

static void c41_b_emlrt_marshallIn(SFc41_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c41_b_u, const emlrtMsgIdentifier *c41_parentId,
  real_T c41_b_y[7])
{
  real_T c41_dv[7];
  int32_T c41_i;
  sf_mex_import(c41_parentId, sf_mex_dup(c41_b_u), c41_dv, 1, 0, 0U, 1, 0U, 1, 7);
  for (c41_i = 0; c41_i < 7; c41_i++) {
    c41_b_y[c41_i] = c41_dv[c41_i];
  }

  sf_mex_destroy(&c41_b_u);
}

static uint8_T c41_c_emlrt_marshallIn
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c41_b_is_active_c41_sliding_controller_rbdl, const char_T *c41_identifier)
{
  emlrtMsgIdentifier c41_thisId;
  uint8_T c41_b_y;
  c41_thisId.fIdentifier = const_cast<const char_T *>(c41_identifier);
  c41_thisId.fParent = NULL;
  c41_thisId.bParentIsCell = false;
  c41_b_y = c41_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c41_b_is_active_c41_sliding_controller_rbdl), &c41_thisId);
  sf_mex_destroy(&c41_b_is_active_c41_sliding_controller_rbdl);
  return c41_b_y;
}

static uint8_T c41_d_emlrt_marshallIn
  (SFc41_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c41_b_u, const emlrtMsgIdentifier *c41_parentId)
{
  uint8_T c41_b_y;
  uint8_T c41_c_u;
  sf_mex_import(c41_parentId, sf_mex_dup(c41_b_u), &c41_c_u, 1, 3, 0U, 0, 0U, 0);
  c41_b_y = c41_c_u;
  sf_mex_destroy(&c41_b_u);
  return c41_b_y;
}

static __global__ __launch_bounds__(32, 1) void c41_eML_blk_kernel_kernel1
  (real_T c41_b_y[7])
{
  uint64_T c41_threadId;
  int32_T c41_i;
  c41_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c41_i = (int32_T)c41_threadId;
  if (c41_i < 7) {
    c41_b_y[c41_i] = 0.0;
  }
}

static void init_dsm_address_info(SFc41_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc41_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
  chartInstance->c41_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c41_u = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c41_y = (real_T (*)[7])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c41_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(3761594018U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1451773495U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2587411843U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(4121430803U);
}

mxArray *sf_c41_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c41_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c41_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c41_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfl"
    "UU90P4mcXxicklmWWp8ckmhvHFOZkpmXnp8cn5eSVF+Tk5qUXxRUkpOUj+BAB2Ih2w"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c41_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sEsyT33uilQMeLbc2q1KEGD";
}

static void sf_opaque_initialize_c41_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c41_sliding_controller_rbdl
    ((SFc41_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c41_sliding_controller_rbdl
    ((SFc41_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c41_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c41_sliding_controller_rbdl
    ((SFc41_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c41_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c41_sliding_controller_rbdl
    ((SFc41_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c41_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c41_sliding_controller_rbdl
    ((SFc41_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c41_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c41_sliding_controller_rbdl
    ((SFc41_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c41_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c41_sliding_controller_rbdl
    ((SFc41_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c41_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc41_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c41_sliding_controller_rbdl
      ((SFc41_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc41_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc41_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c41_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c41_sliding_controller_rbdl
    ((SFc41_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c41_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c41_sliding_controller_rbdl
    ((SFc41_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc41_sliding_controller_rbdl
    ((SFc41_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c41_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c41_sliding_controller_rbdl
      ((SFc41_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc41_sliding_controller_rbdl
      ((SFc41_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c41_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV82O00gQ9kQDWiRAI7TSXpAYDgiOy8+B0zJMfiAiYWZxBrhFnXYlbqXdbfonM7ly4sIr8AJ",
    "cEE/AY/AEnLlwp9p2MsGxHYaIEazWksdp+6vqqvrqp8fbaHc9vC7ivXPJ887i8w+8a156ncnWGw",
    "t3+n7Tu56tX6OQsNE+USTSXuUlSARPQEtuDZOiLYayEMbEEBQIithYKlOmTbPIcibGLSuo06efh",
    "YyGfigtD3ZRlgR7gk9RW2zNPuppMAXUtAACEyppR2GLk9HcYmUO6yHQsbZRlQsajG9jZ5buWm5Y",
    "zKF5BLQttCFosT62zTfEQN0clbrpPNX+DCijmDMiCr0NifYhxgAbOIgD/LtnDTqVh9GQKLMLIZm",
    "A7rBxolMKyOtkGj8MmCBGKkZ4M+J1J7hs2z5He7oyAF4RELRtVwEZx5IJU86/30JPm4IMODRgYE",
    "fl2nx4YR35TxkcgiqN27AuJ6DICPZE6aZJQJpHCVvzLFmGGRbBU6LuU+RPQ1CavZg52ifIE/RQo",
    "gwGiZNt3VNsguEt1WajtsvMVSVjo5RsvQqWaGtOoIqFubYWFXXCuS6F9WTcgQnwRGuDGFINS7UW",
    "47RmQU9igF16l1eDFQyJz2B1KQJWSNckB0j6zmNsLN8iqdVGRnVM3kans/x5GdYWBtSQUCjqAoo",
    "wDRizJLzl2gKmHfcIRKtMYl4ROM2QVShPD61oHEo1xphUNJFjFxyjpcBIj5BLrIQDjUVTBXNcrs",
    "JRQkMIXINhHLpYNogtiIl2re0+1t2EmWkDNFUsLmDVYtVhG2q6hJrGcCDGQh6KlpKRn/X4NLwAm",
    "G1ECSZGu9i/1LSFuxdR4ebZ397xPDv/HfNsJpd/3ljQs1Ggx1t45vc9V6vet4a/Nmbzd0HuQm6f",
    "zZycw23h/WH71T3x8v2Z518+7by5+vbNOvu/q51s/l/M1pdnjXZeOJOlfHXYhwt2bRbo/2tB/1a",
    "21k097d2+bRn/twudAb314uaj5oNGys8Ke2s5e2fvt13HxyxL8lPRdpAdTNya2HRcO/13F+w9uy",
    "Ie57L36fX53nryf+7kedxcIb+Fv6a5vP3x/bd31pNP93++wv5rOb6vJXO9T1y3gD69c7OvOQuw1",
    "PtUCqMk56D6ahDwnJ8/mu8nlfNOWe53sfN/uZ/P+/fMr9OW805Zbl3/TjrHfzV81TzwcvitX9iP",
    "dc9XPxv/0TvZOehKtv5n/q9OPWQ8KDj1Zp/xCDss+vofyNOvcX60OA==",
    ""
  };

  static char newstr [1257] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c41_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c41_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(1065885888U));
  ssSetChecksum1(S,(95584878U));
  ssSetChecksum2(S,(1088877912U));
  ssSetChecksum3(S,(2662015390U));
}

static void mdlRTW_c41_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c41_sliding_controller_rbdl(SimStruct *S)
{
  SFc41_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc41_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc41_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc41_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc41_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c41_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c41_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c41_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c41_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c41_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c41_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c41_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c41_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c41_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c41_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c41_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c41_sliding_controller_rbdl;
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
    chartInstance->c41_JITStateAnimation,
    chartInstance->c41_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c41_sliding_controller_rbdl(chartInstance);
}

void c41_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c41_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c41_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c41_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c41_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
