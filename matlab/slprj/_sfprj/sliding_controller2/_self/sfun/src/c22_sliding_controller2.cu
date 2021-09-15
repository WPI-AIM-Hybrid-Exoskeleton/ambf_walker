/* Include files */

#include "sliding_controller2_sfun.h"
#include "c22_sliding_controller2.h"
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
static void initialize_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance);
static void initialize_params_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance);
static void enable_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance);
static void disable_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance);
static void c22_do_animation_call_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance);
static void ext_mode_exec_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance);
static const mxArray *get_sim_state_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance);
static void set_sim_state_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance, const mxArray *c22_st);
static void sf_gateway_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance);
static void mdl_start_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance);
static void mdl_terminate_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance);
static void initSimStructsc22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance);
static void c22_eML_blk_kernel(SFc22_sliding_controller2InstanceStruct
  *chartInstance, real_T c22_b_u[6], real_T c22_b_y[7]);
static void c22_emlrt_marshallIn(SFc22_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c22_b_y, const char_T *c22_identifier, real_T
  c22_c_y[7]);
static void c22_b_emlrt_marshallIn(SFc22_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c22_b_u, const emlrtMsgIdentifier *c22_parentId,
  real_T c22_b_y[7]);
static uint8_T c22_c_emlrt_marshallIn(SFc22_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c22_b_is_active_c22_sliding_controller2, const
  char_T *c22_identifier);
static uint8_T c22_d_emlrt_marshallIn(SFc22_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c22_b_u, const emlrtMsgIdentifier *c22_parentId);
static __global__ void c22_eML_blk_kernel_kernel1(real_T c22_b_y[7]);
static void init_dsm_address_info(SFc22_sliding_controller2InstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc22_sliding_controller2InstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c22_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c22_is_active_c22_sliding_controller2 = 0U;
  cudaGetLastError();
  cudaMalloc(&chartInstance->c22_gpu_y, 56UL);
}

static void initialize_params_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance)
{
}

static void enable_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c22_do_animation_call_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance)
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
    &chartInstance->c22_is_active_c22_sliding_controller2, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c22_b_y, 1, c22_d_y);
  sf_mex_assign(&c22_st, c22_b_y, false);
  return c22_st;
}

static void set_sim_state_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance, const mxArray *c22_st)
{
  const mxArray *c22_b_u;
  c22_b_u = sf_mex_dup(c22_st);
  c22_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c22_b_u, 0)),
                       "y", *chartInstance->c22_y);
  chartInstance->c22_is_active_c22_sliding_controller2 = c22_c_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c22_b_u, 1)),
     "is_active_c22_sliding_controller2");
  sf_mex_destroy(&c22_b_u);
  sf_mex_destroy(&c22_st);
}

static void sf_gateway_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance)
{
  real_T c22_dv1[7];
  real_T c22_dv[6];
  int32_T c22_i;
  int32_T c22_i1;
  chartInstance->c22_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  for (c22_i = 0; c22_i < 6; c22_i++) {
    c22_dv[c22_i] = (*chartInstance->c22_u)[c22_i];
  }

  c22_eML_blk_kernel(chartInstance, c22_dv, c22_dv1);
  for (c22_i1 = 0; c22_i1 < 7; c22_i1++) {
    (*chartInstance->c22_y)[c22_i1] = c22_dv1[c22_i1];
  }

  c22_do_animation_call_c22_sliding_controller2(chartInstance);
}

static void mdl_start_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance)
{
}

static void mdl_terminate_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance)
{
  cudaError_t c22_errCode;
  cudaFree(*chartInstance->c22_gpu_y);
  c22_errCode = cudaGetLastError();
  if (c22_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c22_errCode, (char_T *)cudaGetErrorName
                       (c22_errCode), (char_T *)cudaGetErrorString(c22_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c22_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance)
{
}

static void initSimStructsc22_sliding_controller2
  (SFc22_sliding_controller2InstanceStruct *chartInstance)
{
}

const mxArray *sf_c22_sliding_controller2_get_eml_resolved_functions_info()
{
  const mxArray *c22_nameCaptureInfo = NULL;
  c22_nameCaptureInfo = NULL;
  sf_mex_assign(&c22_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c22_nameCaptureInfo;
}

static void c22_eML_blk_kernel(SFc22_sliding_controller2InstanceStruct
  *chartInstance, real_T c22_b_u[6], real_T c22_b_y[7])
{
  const mxArray *c22_c_y = NULL;
  c22_eML_blk_kernel_kernel1<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c22_gpu_y);
  cudaMemcpy(c22_b_y, *chartInstance->c22_gpu_y, 56UL, cudaMemcpyDeviceToHost);
  c22_b_y[0] = c22_b_u[3];
  c22_b_y[1] = 0.0;
  sf_mex_printf("%s =\\n", "reordered");
  c22_c_y = NULL;
  sf_mex_assign(&c22_c_y, sf_mex_create("y", c22_b_y, 0, 0U, 1U, 0U, 2, 1, 7),
                false);
  sf_mex_call(chartInstance->c22_fEmlrtCtx, NULL, "disp", 0U, 1U, 14, c22_c_y);
  c22_b_y[2] = c22_b_u[0];
  c22_b_y[3] = c22_b_u[1];
  c22_b_y[4] = c22_b_u[4];
  c22_b_y[5] = c22_b_u[5];
  c22_b_y[6] = c22_b_u[2];
}

static void c22_emlrt_marshallIn(SFc22_sliding_controller2InstanceStruct
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

static void c22_b_emlrt_marshallIn(SFc22_sliding_controller2InstanceStruct
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

static uint8_T c22_c_emlrt_marshallIn(SFc22_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c22_b_is_active_c22_sliding_controller2, const
  char_T *c22_identifier)
{
  emlrtMsgIdentifier c22_thisId;
  uint8_T c22_b_y;
  c22_thisId.fIdentifier = const_cast<const char_T *>(c22_identifier);
  c22_thisId.fParent = NULL;
  c22_thisId.bParentIsCell = false;
  c22_b_y = c22_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c22_b_is_active_c22_sliding_controller2), &c22_thisId);
  sf_mex_destroy(&c22_b_is_active_c22_sliding_controller2);
  return c22_b_y;
}

static uint8_T c22_d_emlrt_marshallIn(SFc22_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c22_b_u, const emlrtMsgIdentifier *c22_parentId)
{
  uint8_T c22_b_y;
  uint8_T c22_c_u;
  sf_mex_import(c22_parentId, sf_mex_dup(c22_b_u), &c22_c_u, 1, 3, 0U, 0, 0U, 0);
  c22_b_y = c22_c_u;
  sf_mex_destroy(&c22_b_u);
  return c22_b_y;
}

static __global__ __launch_bounds__(32, 1) void c22_eML_blk_kernel_kernel1
  (real_T c22_b_y[7])
{
  uint64_T c22_threadId;
  int32_T c22_i;
  c22_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c22_i = (int32_T)c22_threadId;
  if (c22_i < 7) {
    c22_b_y[c22_i] = 0.0;
  }
}

static void init_dsm_address_info(SFc22_sliding_controller2InstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc22_sliding_controller2InstanceStruct
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
void sf_c22_sliding_controller2_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1104270009U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(4002144469U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(1451542329U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(1457894201U);
}

mxArray *sf_c22_sliding_controller2_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c22_sliding_controller2_jit_fallback_info(void)
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

mxArray *sf_c22_sliding_controller2_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c22_sliding_controller2(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfk"
    "UU90P4mcXxicklmWWp8clGRvHFOZkpmXnp8cn5eSVF+Tk5qUVGSOaDAABbHhvW"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c22_sliding_controller2_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "scU9zZ5H1kMhWDkDI28BpgD";
}

static void sf_opaque_initialize_c22_sliding_controller2(void *chartInstanceVar)
{
  initialize_params_c22_sliding_controller2
    ((SFc22_sliding_controller2InstanceStruct*) chartInstanceVar);
  initialize_c22_sliding_controller2((SFc22_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c22_sliding_controller2(void *chartInstanceVar)
{
  enable_c22_sliding_controller2((SFc22_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c22_sliding_controller2(void *chartInstanceVar)
{
  disable_c22_sliding_controller2((SFc22_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c22_sliding_controller2(void *chartInstanceVar)
{
  sf_gateway_c22_sliding_controller2((SFc22_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c22_sliding_controller2(SimStruct*
  S)
{
  return get_sim_state_c22_sliding_controller2
    ((SFc22_sliding_controller2InstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c22_sliding_controller2(SimStruct* S, const
  mxArray *st)
{
  set_sim_state_c22_sliding_controller2((SFc22_sliding_controller2InstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_cleanup_runtime_resources_c22_sliding_controller2(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc22_sliding_controller2InstanceStruct*) chartInstanceVar
      )->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller2_optimization_info();
    }

    mdl_cleanup_runtime_resources_c22_sliding_controller2
      ((SFc22_sliding_controller2InstanceStruct*) chartInstanceVar);
    ((SFc22_sliding_controller2InstanceStruct*) chartInstanceVar)->
      ~SFc22_sliding_controller2InstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c22_sliding_controller2(void *chartInstanceVar)
{
  mdl_start_c22_sliding_controller2((SFc22_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c22_sliding_controller2(void
  *chartInstanceVar)
{
  mdl_terminate_c22_sliding_controller2((SFc22_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc22_sliding_controller2((SFc22_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c22_sliding_controller2(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c22_sliding_controller2
      ((SFc22_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc22_sliding_controller2
      ((SFc22_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c22_sliding_controller2_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u20YQpgU3iIEkMIoGvQRIckqPrQAX6aW1JUqwACs2SjsuejHWy5G40HKX3R/ZyisEuRS",
    "59JBnSJ6hQN6hl75DbwV66ixJySpFUnEEG25RAjS15DezM/PNz9pb6/U9vO7hvf2p593C5228G1",
    "52fZKv1+bu7P269yRfv0IhYeMDokisvdpLkBi+By25NUyKnhjIUhgTA1AgKGITqUyVNs1iy5kYd",
    "a2gTp8+jhiNgkhaHrZQloT7gk9QW2LNAerxmQJqugChiZS0w6jLyXBmsTJn7QjoSNu4zgUNJrCJ",
    "M0v3LTcs4dA5B9oT2hC0WF/YFhhioG3OK910nupgCpRxwhkRpd5GRAeQYIANHCUh/t23Bp0qwmh",
    "ElGlBRMag99go1SkFFHUyjR9OmSBGKkZ4J+ZtJ7ho2wFHe/oyBF4TELStpYCMEsmEqeY/6KKnHU",
    "FOOfhwaofV2gL4yTrynzM4A1UZt0FbjkGRIeyLyk3TgHTOU7ZmWbIIMyyG50TtUORPQ1iZvZg5O",
    "iDIExyiRBUMUid7+lCxMYa3UpuNey4zl5WMjTOy9TJYqq0zhjoWZtq6VLQJ57oSdiiTPRgDT7X6",
    "xJB6WKa1HKc1Cw8lBtild3U1WMGQ+BzWliJkpXSNC4C07zzDxvJPJLXayLiNyevv7S1+XoT1hAE",
    "1IBTKuoAiTAPGLA1vtbaQacc9AtEqk5pXBs4yZBnK0wMr/DOpRhiTmiZy4YJjtBIY6yFyiZVwpL",
    "Fo6mCOy2U4SmgEoWswjEMfywaxJTHRrrXtYN2NmZn4oKliSQmrFqsO21DHJdQkgSMxEvJMdJWMg",
    "7zHZ+EFwGwjSjAxbGH/UpMu7l5GhZtnX3oX8+zOB8yzqVzx+cWcnrUSPd7cs7jvRqN+3wb+WpvO",
    "3zm5u4V91gtyDreJ9/2/Xr7+8/Wbt+9//nrr91/e/7rK/u8al5v/9/L1g2mjnRXOeCFfHXZ3zq7",
    "1Ev2fz+nfzNeaHn3z4set3a9G/ejYH/m95tNWMvQzfpbY2yjYO33/yHV8zLI0PxXthfnBxK2Jzc",
    "a10/90zt5bS+Kxkb/Prj++W03+s+0ij+tL5Dfx16SQtx+//6Pt1eSz/X9YYv/jAt+P07l+Qly3g",
    "BPabJ5ozkIs9RMqhVGSc1DNkvr82Hy/rJx3zXL/Fjv/l7t63j9kfl23nHfNcqv6d9k5ftPwdfPA",
    "K+A3b7Afq56vrhr/m3e5c9DDfP3t7F+ddsR4WHLqzT/jEXZQ9vU/kKd/A13WtA4=",
    ""
  };

  static char newstr [1265] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c22_sliding_controller2(SimStruct *S)
{
  const char* newstr = sf_c22_sliding_controller2_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(2492201493U));
  ssSetChecksum1(S,(2946340087U));
  ssSetChecksum2(S,(892768965U));
  ssSetChecksum3(S,(3267729885U));
}

static void mdlRTW_c22_sliding_controller2(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c22_sliding_controller2(SimStruct *S)
{
  SFc22_sliding_controller2InstanceStruct *chartInstance;
  chartInstance = (SFc22_sliding_controller2InstanceStruct *)utMalloc(sizeof
    (SFc22_sliding_controller2InstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc22_sliding_controller2InstanceStruct));
  chartInstance = new (chartInstance) SFc22_sliding_controller2InstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c22_sliding_controller2;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c22_sliding_controller2;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c22_sliding_controller2;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c22_sliding_controller2;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c22_sliding_controller2;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c22_sliding_controller2;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c22_sliding_controller2;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c22_sliding_controller2;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c22_sliding_controller2;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c22_sliding_controller2;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c22_sliding_controller2;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c22_sliding_controller2;
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

  mdl_setup_runtime_resources_c22_sliding_controller2(chartInstance);
}

void c22_sliding_controller2_method_dispatcher(SimStruct *S, int_T method, void *
  data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c22_sliding_controller2(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c22_sliding_controller2(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c22_sliding_controller2(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c22_sliding_controller2_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
