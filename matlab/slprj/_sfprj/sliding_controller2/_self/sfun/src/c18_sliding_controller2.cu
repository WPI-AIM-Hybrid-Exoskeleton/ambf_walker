/* Include files */

#include "sliding_controller2_sfun.h"
#include "c18_sliding_controller2.h"
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
static void initialize_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance);
static void initialize_params_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance);
static void enable_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance);
static void disable_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance);
static void c18_do_animation_call_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance);
static void ext_mode_exec_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance);
static const mxArray *get_sim_state_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance);
static void set_sim_state_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance, const mxArray *c18_st);
static void sf_gateway_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance);
static void mdl_start_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance);
static void mdl_terminate_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance);
static void initSimStructsc18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance);
static void c18_eML_blk_kernel(SFc18_sliding_controller2InstanceStruct
  *chartInstance, real_T c18_b_u[6], real_T c18_b_y[7]);
static void c18_emlrt_marshallIn(SFc18_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c18_b_y, const char_T *c18_identifier, real_T
  c18_c_y[7]);
static void c18_b_emlrt_marshallIn(SFc18_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c18_b_u, const emlrtMsgIdentifier *c18_parentId,
  real_T c18_b_y[7]);
static uint8_T c18_c_emlrt_marshallIn(SFc18_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c18_b_is_active_c18_sliding_controller2, const
  char_T *c18_identifier);
static uint8_T c18_d_emlrt_marshallIn(SFc18_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c18_b_u, const emlrtMsgIdentifier *c18_parentId);
static __global__ void c18_eML_blk_kernel_kernel1(real_T c18_b_y[7]);
static void init_dsm_address_info(SFc18_sliding_controller2InstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc18_sliding_controller2InstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c18_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c18_is_active_c18_sliding_controller2 = 0U;
  cudaGetLastError();
  cudaMalloc(&chartInstance->c18_gpu_y, 56UL);
}

static void initialize_params_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance)
{
}

static void enable_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c18_do_animation_call_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance)
{
  const mxArray *c18_b_y = NULL;
  const mxArray *c18_c_y = NULL;
  const mxArray *c18_d_y = NULL;
  const mxArray *c18_st;
  c18_st = NULL;
  c18_b_y = NULL;
  sf_mex_assign(&c18_b_y, sf_mex_createcellmatrix(2, 1), false);
  c18_c_y = NULL;
  sf_mex_assign(&c18_c_y, sf_mex_create("y", *chartInstance->c18_y, 0, 0U, 1U,
    0U, 2, 1, 7), false);
  sf_mex_setcell(c18_b_y, 0, c18_c_y);
  c18_d_y = NULL;
  sf_mex_assign(&c18_d_y, sf_mex_create("y",
    &chartInstance->c18_is_active_c18_sliding_controller2, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c18_b_y, 1, c18_d_y);
  sf_mex_assign(&c18_st, c18_b_y, false);
  return c18_st;
}

static void set_sim_state_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance, const mxArray *c18_st)
{
  const mxArray *c18_b_u;
  c18_b_u = sf_mex_dup(c18_st);
  c18_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c18_b_u, 0)),
                       "y", *chartInstance->c18_y);
  chartInstance->c18_is_active_c18_sliding_controller2 = c18_c_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c18_b_u, 1)),
     "is_active_c18_sliding_controller2");
  sf_mex_destroy(&c18_b_u);
  sf_mex_destroy(&c18_st);
}

static void sf_gateway_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance)
{
  real_T c18_dv1[7];
  real_T c18_dv[6];
  int32_T c18_i;
  int32_T c18_i1;
  chartInstance->c18_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  for (c18_i = 0; c18_i < 6; c18_i++) {
    c18_dv[c18_i] = (*chartInstance->c18_u)[c18_i];
  }

  c18_eML_blk_kernel(chartInstance, c18_dv, c18_dv1);
  for (c18_i1 = 0; c18_i1 < 7; c18_i1++) {
    (*chartInstance->c18_y)[c18_i1] = c18_dv1[c18_i1];
  }

  c18_do_animation_call_c18_sliding_controller2(chartInstance);
}

static void mdl_start_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance)
{
}

static void mdl_terminate_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance)
{
  cudaError_t c18_errCode;
  cudaFree(*chartInstance->c18_gpu_y);
  c18_errCode = cudaGetLastError();
  if (c18_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c18_errCode, (char_T *)cudaGetErrorName
                       (c18_errCode), (char_T *)cudaGetErrorString(c18_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c18_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance)
{
}

static void initSimStructsc18_sliding_controller2
  (SFc18_sliding_controller2InstanceStruct *chartInstance)
{
}

const mxArray *sf_c18_sliding_controller2_get_eml_resolved_functions_info()
{
  const mxArray *c18_nameCaptureInfo = NULL;
  c18_nameCaptureInfo = NULL;
  sf_mex_assign(&c18_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c18_nameCaptureInfo;
}

static void c18_eML_blk_kernel(SFc18_sliding_controller2InstanceStruct
  *chartInstance, real_T c18_b_u[6], real_T c18_b_y[7])
{
  const mxArray *c18_c_y = NULL;
  c18_eML_blk_kernel_kernel1<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c18_gpu_y);
  cudaMemcpy(c18_b_y, *chartInstance->c18_gpu_y, 56UL, cudaMemcpyDeviceToHost);
  c18_b_y[0] = c18_b_u[3];
  c18_b_y[1] = 0.0;
  sf_mex_printf("%s =\\n", "reordered");
  c18_c_y = NULL;
  sf_mex_assign(&c18_c_y, sf_mex_create("y", c18_b_y, 0, 0U, 1U, 0U, 2, 1, 7),
                false);
  sf_mex_call(chartInstance->c18_fEmlrtCtx, NULL, "disp", 0U, 1U, 14, c18_c_y);
  c18_b_y[2] = c18_b_u[0];
  c18_b_y[3] = c18_b_u[1];
  c18_b_y[4] = c18_b_u[4];
  c18_b_y[5] = c18_b_u[5];
  c18_b_y[6] = c18_b_u[2];
}

static void c18_emlrt_marshallIn(SFc18_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c18_b_y, const char_T *c18_identifier, real_T
  c18_c_y[7])
{
  emlrtMsgIdentifier c18_thisId;
  c18_thisId.fIdentifier = const_cast<const char_T *>(c18_identifier);
  c18_thisId.fParent = NULL;
  c18_thisId.bParentIsCell = false;
  c18_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c18_b_y), &c18_thisId,
    c18_c_y);
  sf_mex_destroy(&c18_b_y);
}

static void c18_b_emlrt_marshallIn(SFc18_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c18_b_u, const emlrtMsgIdentifier *c18_parentId,
  real_T c18_b_y[7])
{
  real_T c18_dv[7];
  int32_T c18_i;
  sf_mex_import(c18_parentId, sf_mex_dup(c18_b_u), c18_dv, 1, 0, 0U, 1, 0U, 2, 1,
                7);
  for (c18_i = 0; c18_i < 7; c18_i++) {
    c18_b_y[c18_i] = c18_dv[c18_i];
  }

  sf_mex_destroy(&c18_b_u);
}

static uint8_T c18_c_emlrt_marshallIn(SFc18_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c18_b_is_active_c18_sliding_controller2, const
  char_T *c18_identifier)
{
  emlrtMsgIdentifier c18_thisId;
  uint8_T c18_b_y;
  c18_thisId.fIdentifier = const_cast<const char_T *>(c18_identifier);
  c18_thisId.fParent = NULL;
  c18_thisId.bParentIsCell = false;
  c18_b_y = c18_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c18_b_is_active_c18_sliding_controller2), &c18_thisId);
  sf_mex_destroy(&c18_b_is_active_c18_sliding_controller2);
  return c18_b_y;
}

static uint8_T c18_d_emlrt_marshallIn(SFc18_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c18_b_u, const emlrtMsgIdentifier *c18_parentId)
{
  uint8_T c18_b_y;
  uint8_T c18_c_u;
  sf_mex_import(c18_parentId, sf_mex_dup(c18_b_u), &c18_c_u, 1, 3, 0U, 0, 0U, 0);
  c18_b_y = c18_c_u;
  sf_mex_destroy(&c18_b_u);
  return c18_b_y;
}

static __global__ __launch_bounds__(32, 1) void c18_eML_blk_kernel_kernel1
  (real_T c18_b_y[7])
{
  uint64_T c18_threadId;
  int32_T c18_i;
  c18_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c18_i = (int32_T)c18_threadId;
  if (c18_i < 7) {
    c18_b_y[c18_i] = 0.0;
  }
}

static void init_dsm_address_info(SFc18_sliding_controller2InstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc18_sliding_controller2InstanceStruct
  *chartInstance)
{
  chartInstance->c18_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c18_u = (real_T (*)[6])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c18_y = (real_T (*)[7])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c18_sliding_controller2_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1104270009U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(4002144469U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(1451542329U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(1457894201U);
}

mxArray *sf_c18_sliding_controller2_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c18_sliding_controller2_jit_fallback_info(void)
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

mxArray *sf_c18_sliding_controller2_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c18_sliding_controller2(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfk"
    "UU90P4mcXxicklmWWp8cmGFvHFOZkpmXnp8cn5eSVF+Tk5qUVGSOaDAABb0Rvb"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c18_sliding_controller2_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "scU9zZ5H1kMhWDkDI28BpgD";
}

static void sf_opaque_initialize_c18_sliding_controller2(void *chartInstanceVar)
{
  initialize_params_c18_sliding_controller2
    ((SFc18_sliding_controller2InstanceStruct*) chartInstanceVar);
  initialize_c18_sliding_controller2((SFc18_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c18_sliding_controller2(void *chartInstanceVar)
{
  enable_c18_sliding_controller2((SFc18_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c18_sliding_controller2(void *chartInstanceVar)
{
  disable_c18_sliding_controller2((SFc18_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c18_sliding_controller2(void *chartInstanceVar)
{
  sf_gateway_c18_sliding_controller2((SFc18_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c18_sliding_controller2(SimStruct*
  S)
{
  return get_sim_state_c18_sliding_controller2
    ((SFc18_sliding_controller2InstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c18_sliding_controller2(SimStruct* S, const
  mxArray *st)
{
  set_sim_state_c18_sliding_controller2((SFc18_sliding_controller2InstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_cleanup_runtime_resources_c18_sliding_controller2(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc18_sliding_controller2InstanceStruct*) chartInstanceVar
      )->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller2_optimization_info();
    }

    mdl_cleanup_runtime_resources_c18_sliding_controller2
      ((SFc18_sliding_controller2InstanceStruct*) chartInstanceVar);
    ((SFc18_sliding_controller2InstanceStruct*) chartInstanceVar)->
      ~SFc18_sliding_controller2InstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c18_sliding_controller2(void *chartInstanceVar)
{
  mdl_start_c18_sliding_controller2((SFc18_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c18_sliding_controller2(void
  *chartInstanceVar)
{
  mdl_terminate_c18_sliding_controller2((SFc18_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc18_sliding_controller2((SFc18_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c18_sliding_controller2(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c18_sliding_controller2
      ((SFc18_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc18_sliding_controller2
      ((SFc18_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c18_sliding_controller2_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV09v00gUd6MuAglQhRZxWYly2j0uSKDuBdrEiYjUbKt1Cysu1XT8Eo8ynvHOn7ThKyAuqBc",
    "OfAb4DEh8By58h72ttKd9Yztp1rEdSkQFCEuuM/bvvXnv/d6fqbfS7Xl4XcV785rnXcDnRbwbXn",
    "b9kK9XZu7s/ar3c75+jkLCxrtEkVh7tZcgMfwBWnJrmBRd0ZelMCb6oEBQxCZSmSptmsWWMzHsW",
    "EGdPv04YjQKIml52ERZEu4IPkZtiTW7qMdnCqjpAIQmUtIOog4ng6nFyhy1IqBDbeM6FzSYwCbO",
    "LN2z3LCEQ/sYaFdoQ9BifWpbYIiBljmudNN5qoMJUMYJZ0SUehsRHUCCATawn4T4d8cadKoIoxF",
    "RpgkRGYHeZsNUpxRQ1Mk0fjhkghipGOHtmLec4Lxtuxzt6ckQeE1A0LamAjJMJBOmmv+gg562BT",
    "nk4MOhHVRrC+Av68h/xOAIVGXc+i05AkUGsCMqN00D0j5O2ZpmyTzMsBgeEbVFkT8NYWX2Yubog",
    "CBPsIcSVTBInezqPcVGGN5KbTbuusxcVDI2zsjWi2CptvYI6liYautQ0SKc60rYnky2YQQ81eoT",
    "Q+phmdZynNYs3JMYYJfe1dVgBUPic1hLipCV0jUqANK+8zs2lv8jqdVGxi1MXn97e/7zPKwrDKg",
    "+oVDWBRRhGjBmaXirtYVMO+4RiFaZ1LwycJYhi1Ce7lvhH0k1xJjUNJFTFxyjlcBYD5BLrIR9jU",
    "VTB3NcLsJRQiMIXYNhHHpYNogtiYl2rW0L627EzNgHTRVLSli1WHXYhtouocYJ7IuhkEeio2Qc5",
    "D0+Cy8AZhtRgolBE/uXGndw9zIq3Dz71TudZ5c/Yp5N5IrPX2b0rJTo8WaexX0vNer3beCvlcn8",
    "nZG7UthntSDncGt4X//32ck/J69ev3tx7+6Hl+/eLrP/m8bZ5v/VfP3TpNFOC2c0l68O+3DGrtU",
    "S/Tdm9K/la033f3v65O7D28Ne9Ngf+t07G81k4Gf8LLC3UbB38n7ddXzMsjQ/Fe2G+cHErYnNxr",
    "XTvzFj74UF8biUv8+uvx8sJ//jZpHH1QXya/hrXMjbT99/fXM5+Wz/PxfYf6vA9610rh8Q1y3gg",
    "N7eONCchVjqB1QKoyTnoO6U1Oen5vtZ5bxzlvta7Pwu9/l5/5j5dd5y3jnLLevfWef4l4avmwde",
    "Ab/2Bfux7Pnqc+Pfe2c7B93M1/en/+q0IsbDklNv/hmPsP2yr99Anv4HhFm0Ew==",
    ""
  };

  static char newstr [1265] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c18_sliding_controller2(SimStruct *S)
{
  const char* newstr = sf_c18_sliding_controller2_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(2492201493U));
  ssSetChecksum1(S,(2946340087U));
  ssSetChecksum2(S,(892768965U));
  ssSetChecksum3(S,(3267729885U));
}

static void mdlRTW_c18_sliding_controller2(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c18_sliding_controller2(SimStruct *S)
{
  SFc18_sliding_controller2InstanceStruct *chartInstance;
  chartInstance = (SFc18_sliding_controller2InstanceStruct *)utMalloc(sizeof
    (SFc18_sliding_controller2InstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc18_sliding_controller2InstanceStruct));
  chartInstance = new (chartInstance) SFc18_sliding_controller2InstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c18_sliding_controller2;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c18_sliding_controller2;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c18_sliding_controller2;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c18_sliding_controller2;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c18_sliding_controller2;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c18_sliding_controller2;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c18_sliding_controller2;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c18_sliding_controller2;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c18_sliding_controller2;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c18_sliding_controller2;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c18_sliding_controller2;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c18_sliding_controller2;
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
    chartInstance->c18_JITStateAnimation,
    chartInstance->c18_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c18_sliding_controller2(chartInstance);
}

void c18_sliding_controller2_method_dispatcher(SimStruct *S, int_T method, void *
  data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c18_sliding_controller2(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c18_sliding_controller2(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c18_sliding_controller2(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c18_sliding_controller2_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
