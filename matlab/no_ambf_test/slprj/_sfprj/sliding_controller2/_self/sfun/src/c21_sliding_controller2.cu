/* Include files */

#include "sliding_controller2_sfun.h"
#include "c21_sliding_controller2.h"
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
static void initialize_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance);
static void initialize_params_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance);
static void enable_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance);
static void disable_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance);
static void c21_do_animation_call_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance);
static void ext_mode_exec_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance);
static const mxArray *get_sim_state_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance);
static void set_sim_state_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance, const mxArray *c21_st);
static void sf_gateway_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance);
static void mdl_start_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance);
static void mdl_terminate_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance);
static void initSimStructsc21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance);
static void c21_eML_blk_kernel(SFc21_sliding_controller2InstanceStruct
  *chartInstance, real_T c21_b_u[6], real_T c21_b_y[7]);
static void c21_emlrt_marshallIn(SFc21_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c21_b_y, const char_T *c21_identifier, real_T
  c21_c_y[7]);
static void c21_b_emlrt_marshallIn(SFc21_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c21_b_u, const emlrtMsgIdentifier *c21_parentId,
  real_T c21_b_y[7]);
static uint8_T c21_c_emlrt_marshallIn(SFc21_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c21_b_is_active_c21_sliding_controller2, const
  char_T *c21_identifier);
static uint8_T c21_d_emlrt_marshallIn(SFc21_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c21_b_u, const emlrtMsgIdentifier *c21_parentId);
static __global__ void c21_eML_blk_kernel_kernel1(real_T c21_b_y[7]);
static void init_dsm_address_info(SFc21_sliding_controller2InstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc21_sliding_controller2InstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c21_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c21_is_active_c21_sliding_controller2 = 0U;
  cudaGetLastError();
  cudaMalloc(&chartInstance->c21_gpu_y, 56UL);
}

static void initialize_params_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance)
{
}

static void enable_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c21_do_animation_call_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance)
{
  const mxArray *c21_b_y = NULL;
  const mxArray *c21_c_y = NULL;
  const mxArray *c21_d_y = NULL;
  const mxArray *c21_st;
  c21_st = NULL;
  c21_b_y = NULL;
  sf_mex_assign(&c21_b_y, sf_mex_createcellmatrix(2, 1), false);
  c21_c_y = NULL;
  sf_mex_assign(&c21_c_y, sf_mex_create("y", *chartInstance->c21_y, 0, 0U, 1U,
    0U, 2, 1, 7), false);
  sf_mex_setcell(c21_b_y, 0, c21_c_y);
  c21_d_y = NULL;
  sf_mex_assign(&c21_d_y, sf_mex_create("y",
    &chartInstance->c21_is_active_c21_sliding_controller2, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c21_b_y, 1, c21_d_y);
  sf_mex_assign(&c21_st, c21_b_y, false);
  return c21_st;
}

static void set_sim_state_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance, const mxArray *c21_st)
{
  const mxArray *c21_b_u;
  c21_b_u = sf_mex_dup(c21_st);
  c21_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c21_b_u, 0)),
                       "y", *chartInstance->c21_y);
  chartInstance->c21_is_active_c21_sliding_controller2 = c21_c_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c21_b_u, 1)),
     "is_active_c21_sliding_controller2");
  sf_mex_destroy(&c21_b_u);
  sf_mex_destroy(&c21_st);
}

static void sf_gateway_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance)
{
  real_T c21_dv1[7];
  real_T c21_dv[6];
  int32_T c21_i;
  int32_T c21_i1;
  chartInstance->c21_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  for (c21_i = 0; c21_i < 6; c21_i++) {
    c21_dv[c21_i] = (*chartInstance->c21_u)[c21_i];
  }

  c21_eML_blk_kernel(chartInstance, c21_dv, c21_dv1);
  for (c21_i1 = 0; c21_i1 < 7; c21_i1++) {
    (*chartInstance->c21_y)[c21_i1] = c21_dv1[c21_i1];
  }

  c21_do_animation_call_c21_sliding_controller2(chartInstance);
}

static void mdl_start_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance)
{
}

static void mdl_terminate_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance)
{
  cudaError_t c21_errCode;
  cudaFree(*chartInstance->c21_gpu_y);
  c21_errCode = cudaGetLastError();
  if (c21_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c21_errCode, (char_T *)cudaGetErrorName
                       (c21_errCode), (char_T *)cudaGetErrorString(c21_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c21_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance)
{
}

static void initSimStructsc21_sliding_controller2
  (SFc21_sliding_controller2InstanceStruct *chartInstance)
{
}

const mxArray *sf_c21_sliding_controller2_get_eml_resolved_functions_info()
{
  const mxArray *c21_nameCaptureInfo = NULL;
  c21_nameCaptureInfo = NULL;
  sf_mex_assign(&c21_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c21_nameCaptureInfo;
}

static void c21_eML_blk_kernel(SFc21_sliding_controller2InstanceStruct
  *chartInstance, real_T c21_b_u[6], real_T c21_b_y[7])
{
  const mxArray *c21_c_y = NULL;
  c21_eML_blk_kernel_kernel1<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c21_gpu_y);
  cudaMemcpy(c21_b_y, *chartInstance->c21_gpu_y, 56UL, cudaMemcpyDeviceToHost);
  c21_b_y[0] = c21_b_u[3];
  c21_b_y[1] = 0.0;
  sf_mex_printf("%s =\\n", "reordered");
  c21_c_y = NULL;
  sf_mex_assign(&c21_c_y, sf_mex_create("y", c21_b_y, 0, 0U, 1U, 0U, 2, 1, 7),
                false);
  sf_mex_call(chartInstance->c21_fEmlrtCtx, NULL, "disp", 0U, 1U, 14, c21_c_y);
  c21_b_y[2] = c21_b_u[0];
  c21_b_y[3] = c21_b_u[1];
  c21_b_y[4] = c21_b_u[4];
  c21_b_y[5] = c21_b_u[5];
  c21_b_y[6] = c21_b_u[2];
}

static void c21_emlrt_marshallIn(SFc21_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c21_b_y, const char_T *c21_identifier, real_T
  c21_c_y[7])
{
  emlrtMsgIdentifier c21_thisId;
  c21_thisId.fIdentifier = const_cast<const char_T *>(c21_identifier);
  c21_thisId.fParent = NULL;
  c21_thisId.bParentIsCell = false;
  c21_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c21_b_y), &c21_thisId,
    c21_c_y);
  sf_mex_destroy(&c21_b_y);
}

static void c21_b_emlrt_marshallIn(SFc21_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c21_b_u, const emlrtMsgIdentifier *c21_parentId,
  real_T c21_b_y[7])
{
  real_T c21_dv[7];
  int32_T c21_i;
  sf_mex_import(c21_parentId, sf_mex_dup(c21_b_u), c21_dv, 1, 0, 0U, 1, 0U, 2, 1,
                7);
  for (c21_i = 0; c21_i < 7; c21_i++) {
    c21_b_y[c21_i] = c21_dv[c21_i];
  }

  sf_mex_destroy(&c21_b_u);
}

static uint8_T c21_c_emlrt_marshallIn(SFc21_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c21_b_is_active_c21_sliding_controller2, const
  char_T *c21_identifier)
{
  emlrtMsgIdentifier c21_thisId;
  uint8_T c21_b_y;
  c21_thisId.fIdentifier = const_cast<const char_T *>(c21_identifier);
  c21_thisId.fParent = NULL;
  c21_thisId.bParentIsCell = false;
  c21_b_y = c21_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c21_b_is_active_c21_sliding_controller2), &c21_thisId);
  sf_mex_destroy(&c21_b_is_active_c21_sliding_controller2);
  return c21_b_y;
}

static uint8_T c21_d_emlrt_marshallIn(SFc21_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c21_b_u, const emlrtMsgIdentifier *c21_parentId)
{
  uint8_T c21_b_y;
  uint8_T c21_c_u;
  sf_mex_import(c21_parentId, sf_mex_dup(c21_b_u), &c21_c_u, 1, 3, 0U, 0, 0U, 0);
  c21_b_y = c21_c_u;
  sf_mex_destroy(&c21_b_u);
  return c21_b_y;
}

static __global__ __launch_bounds__(32, 1) void c21_eML_blk_kernel_kernel1
  (real_T c21_b_y[7])
{
  uint64_T c21_threadId;
  int32_T c21_i;
  c21_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c21_i = (int32_T)c21_threadId;
  if (c21_i < 7) {
    c21_b_y[c21_i] = 0.0;
  }
}

static void init_dsm_address_info(SFc21_sliding_controller2InstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc21_sliding_controller2InstanceStruct
  *chartInstance)
{
  chartInstance->c21_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c21_u = (real_T (*)[6])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c21_y = (real_T (*)[7])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c21_sliding_controller2_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1104270009U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(4002144469U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(1451542329U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(1457894201U);
}

mxArray *sf_c21_sliding_controller2_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c21_sliding_controller2_jit_fallback_info(void)
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

mxArray *sf_c21_sliding_controller2_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c21_sliding_controller2(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfk"
    "UU90P4mcXxicklmWWp8clGhvHFOZkpmXnp8cn5eSVF+Tk5qUVGSOaDAABa+hvV"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c21_sliding_controller2_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "scU9zZ5H1kMhWDkDI28BpgD";
}

static void sf_opaque_initialize_c21_sliding_controller2(void *chartInstanceVar)
{
  initialize_params_c21_sliding_controller2
    ((SFc21_sliding_controller2InstanceStruct*) chartInstanceVar);
  initialize_c21_sliding_controller2((SFc21_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c21_sliding_controller2(void *chartInstanceVar)
{
  enable_c21_sliding_controller2((SFc21_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c21_sliding_controller2(void *chartInstanceVar)
{
  disable_c21_sliding_controller2((SFc21_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c21_sliding_controller2(void *chartInstanceVar)
{
  sf_gateway_c21_sliding_controller2((SFc21_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c21_sliding_controller2(SimStruct*
  S)
{
  return get_sim_state_c21_sliding_controller2
    ((SFc21_sliding_controller2InstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c21_sliding_controller2(SimStruct* S, const
  mxArray *st)
{
  set_sim_state_c21_sliding_controller2((SFc21_sliding_controller2InstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_cleanup_runtime_resources_c21_sliding_controller2(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc21_sliding_controller2InstanceStruct*) chartInstanceVar
      )->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller2_optimization_info();
    }

    mdl_cleanup_runtime_resources_c21_sliding_controller2
      ((SFc21_sliding_controller2InstanceStruct*) chartInstanceVar);
    ((SFc21_sliding_controller2InstanceStruct*) chartInstanceVar)->
      ~SFc21_sliding_controller2InstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c21_sliding_controller2(void *chartInstanceVar)
{
  mdl_start_c21_sliding_controller2((SFc21_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c21_sliding_controller2(void
  *chartInstanceVar)
{
  mdl_terminate_c21_sliding_controller2((SFc21_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc21_sliding_controller2((SFc21_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c21_sliding_controller2(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c21_sliding_controller2
      ((SFc21_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc21_sliding_controller2
      ((SFc21_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c21_sliding_controller2_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV09v00gUd6OCFglQtWLFBQk4wREqsYLLbkmciEgNrXALaC/VdPwSjzKeMfMnbfgKiAviwoH",
    "PAJ8Bie/Ahe/ADYkTb2wnDY7tUCIqdrWWXGfs33vz3vu9P1Nvpdvz8DqP98bvnncan7/h3fCy61",
    "S+Xpm5s/er3rV8/RyFhI23iSKx9movQWJ4AFpya5gUXdGXpTAm+qBAUMQmUpkqbZrFljMx7FhBn",
    "T79KGI0CiJpedhEWRJuCT5GbYk126jHZwqo6QCEJlLSDqIOJ4OpxcoctCKgQ23jOhc0mMAmzizd",
    "s9ywhEP7EGhXaEPQYn1kW2CIgZY5rHTTeaqDCVDGCWdElHobER1AggE2sJuE+HfLGnSqCKMRUaY",
    "JERmB3mTDVKcUUNTJNH7YZ4IYqRjh7Zi3nOC8bdsc7enJEHhNQNC2pgIyTCQTppr/oIOetgXZ5+",
    "DDvh1UawvgiXXkP2RwAKoybv2WHIEiA9gSlZumAWkfpmxNs2QeZlgMD4m6S5E/DWFl9mLm6IAgT",
    "7CDElUwSJ3s6h3FRhjeSm027rrMXFQyNs7I1otgqbb2COpYmGrrUNEinOtK2I5MNmEEPNXqE0Pq",
    "YZnWcpzWLNyRGGCX3tXVYAVD4nNYS4qQldI1KgDSvnMfG8u3SGq1kXELk9ff3Jz/PA/rCgOqTyi",
    "UdQFFmAaMWRream0h0457BKJVJjWvDJxlyCKUp/tW+AdSDTEmNU3kyAXHaCUw1gPkEithV2PR1M",
    "Ecl4twlNAIQtdgGIcelg1iS2KiXWu7i3U3Ymbsg6aKJSWsWqw6bENtl1DjBHbFUMgD0VEyDvIen",
    "4UXALONKMHEoIn9S407uHsZFW6e3fCO5tnZ75hnE7ni8/qMnpUSPd7Ms7jvmUb9vg38tTKZvzNy",
    "5wr7rBbkHG4N7z++PHv5+eXrN+9f/Hnr46v375bZ/23jePP/fL6+NGm008IZzeWrw96bsWu1RP/",
    "FGf1r+VrT3TtP/7l17+awFz3yh353/XYzGfgZPwvsbRTsnby/4jo+Zlman4p2w/xg4tbEZuPa6b",
    "89Y+/pBfE4k7/Prk9/Lyd/YaPI4+oC+TX8NS7k7Y/vf2VjOfls/8cL7L9a4PtqOtf3iOsWsEfXb",
    "+5pzkIs9T0qhVGSc1DrJfX5o/l+XDnvhOX+LXb+L/fzef+e+XXSct4Jyy3r33Hn+K+Gr5sHXgG/",
    "9gv7sez56mfjP3jHOwddztd/Tf/VaUWMhyWn3vwzHmH7ZV//A3n6FVYitA0=",
    ""
  };

  static char newstr [1261] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c21_sliding_controller2(SimStruct *S)
{
  const char* newstr = sf_c21_sliding_controller2_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(2492201493U));
  ssSetChecksum1(S,(2946340087U));
  ssSetChecksum2(S,(892768965U));
  ssSetChecksum3(S,(3267729885U));
}

static void mdlRTW_c21_sliding_controller2(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c21_sliding_controller2(SimStruct *S)
{
  SFc21_sliding_controller2InstanceStruct *chartInstance;
  chartInstance = (SFc21_sliding_controller2InstanceStruct *)utMalloc(sizeof
    (SFc21_sliding_controller2InstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc21_sliding_controller2InstanceStruct));
  chartInstance = new (chartInstance) SFc21_sliding_controller2InstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c21_sliding_controller2;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c21_sliding_controller2;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c21_sliding_controller2;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c21_sliding_controller2;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c21_sliding_controller2;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c21_sliding_controller2;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c21_sliding_controller2;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c21_sliding_controller2;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c21_sliding_controller2;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c21_sliding_controller2;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c21_sliding_controller2;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c21_sliding_controller2;
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
    chartInstance->c21_JITStateAnimation,
    chartInstance->c21_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c21_sliding_controller2(chartInstance);
}

void c21_sliding_controller2_method_dispatcher(SimStruct *S, int_T method, void *
  data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c21_sliding_controller2(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c21_sliding_controller2(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c21_sliding_controller2(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c21_sliding_controller2_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
