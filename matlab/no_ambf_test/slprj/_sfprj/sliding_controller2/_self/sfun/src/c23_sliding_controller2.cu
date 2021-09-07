/* Include files */

#include "sliding_controller2_sfun.h"
#include "c23_sliding_controller2.h"
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
static void initialize_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance);
static void initialize_params_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance);
static void enable_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance);
static void disable_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance);
static void c23_do_animation_call_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance);
static void ext_mode_exec_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance);
static const mxArray *get_sim_state_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance);
static void set_sim_state_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance, const mxArray *c23_st);
static void sf_gateway_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance);
static void mdl_start_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance);
static void mdl_terminate_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance);
static void initSimStructsc23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance);
static void c23_eML_blk_kernel(SFc23_sliding_controller2InstanceStruct
  *chartInstance, real_T c23_b_u[6], real_T c23_b_y[7]);
static void c23_emlrt_marshallIn(SFc23_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c23_b_y, const char_T *c23_identifier, real_T
  c23_c_y[7]);
static void c23_b_emlrt_marshallIn(SFc23_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c23_b_u, const emlrtMsgIdentifier *c23_parentId,
  real_T c23_b_y[7]);
static uint8_T c23_c_emlrt_marshallIn(SFc23_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c23_b_is_active_c23_sliding_controller2, const
  char_T *c23_identifier);
static uint8_T c23_d_emlrt_marshallIn(SFc23_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c23_b_u, const emlrtMsgIdentifier *c23_parentId);
static __global__ void c23_eML_blk_kernel_kernel1(real_T c23_b_y[7]);
static void init_dsm_address_info(SFc23_sliding_controller2InstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc23_sliding_controller2InstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c23_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c23_is_active_c23_sliding_controller2 = 0U;
  cudaGetLastError();
  cudaMalloc(&chartInstance->c23_gpu_y, 56UL);
}

static void initialize_params_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance)
{
}

static void enable_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c23_do_animation_call_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance)
{
  const mxArray *c23_b_y = NULL;
  const mxArray *c23_c_y = NULL;
  const mxArray *c23_d_y = NULL;
  const mxArray *c23_st;
  c23_st = NULL;
  c23_b_y = NULL;
  sf_mex_assign(&c23_b_y, sf_mex_createcellmatrix(2, 1), false);
  c23_c_y = NULL;
  sf_mex_assign(&c23_c_y, sf_mex_create("y", *chartInstance->c23_y, 0, 0U, 1U,
    0U, 2, 1, 7), false);
  sf_mex_setcell(c23_b_y, 0, c23_c_y);
  c23_d_y = NULL;
  sf_mex_assign(&c23_d_y, sf_mex_create("y",
    &chartInstance->c23_is_active_c23_sliding_controller2, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c23_b_y, 1, c23_d_y);
  sf_mex_assign(&c23_st, c23_b_y, false);
  return c23_st;
}

static void set_sim_state_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance, const mxArray *c23_st)
{
  const mxArray *c23_b_u;
  c23_b_u = sf_mex_dup(c23_st);
  c23_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c23_b_u, 0)),
                       "y", *chartInstance->c23_y);
  chartInstance->c23_is_active_c23_sliding_controller2 = c23_c_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c23_b_u, 1)),
     "is_active_c23_sliding_controller2");
  sf_mex_destroy(&c23_b_u);
  sf_mex_destroy(&c23_st);
}

static void sf_gateway_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance)
{
  real_T c23_dv1[7];
  real_T c23_dv[6];
  int32_T c23_i;
  int32_T c23_i1;
  chartInstance->c23_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  for (c23_i = 0; c23_i < 6; c23_i++) {
    c23_dv[c23_i] = (*chartInstance->c23_u)[c23_i];
  }

  c23_eML_blk_kernel(chartInstance, c23_dv, c23_dv1);
  for (c23_i1 = 0; c23_i1 < 7; c23_i1++) {
    (*chartInstance->c23_y)[c23_i1] = c23_dv1[c23_i1];
  }

  c23_do_animation_call_c23_sliding_controller2(chartInstance);
}

static void mdl_start_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance)
{
}

static void mdl_terminate_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance)
{
  cudaError_t c23_errCode;
  cudaFree(*chartInstance->c23_gpu_y);
  c23_errCode = cudaGetLastError();
  if (c23_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c23_errCode, (char_T *)cudaGetErrorName
                       (c23_errCode), (char_T *)cudaGetErrorString(c23_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c23_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance)
{
}

static void initSimStructsc23_sliding_controller2
  (SFc23_sliding_controller2InstanceStruct *chartInstance)
{
}

const mxArray *sf_c23_sliding_controller2_get_eml_resolved_functions_info()
{
  const mxArray *c23_nameCaptureInfo = NULL;
  c23_nameCaptureInfo = NULL;
  sf_mex_assign(&c23_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c23_nameCaptureInfo;
}

static void c23_eML_blk_kernel(SFc23_sliding_controller2InstanceStruct
  *chartInstance, real_T c23_b_u[6], real_T c23_b_y[7])
{
  const mxArray *c23_c_y = NULL;
  c23_eML_blk_kernel_kernel1<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c23_gpu_y);
  cudaMemcpy(c23_b_y, *chartInstance->c23_gpu_y, 56UL, cudaMemcpyDeviceToHost);
  c23_b_y[0] = c23_b_u[3];
  c23_b_y[1] = 0.0;
  sf_mex_printf("%s =\\n", "reordered");
  c23_c_y = NULL;
  sf_mex_assign(&c23_c_y, sf_mex_create("y", c23_b_y, 0, 0U, 1U, 0U, 2, 1, 7),
                false);
  sf_mex_call(chartInstance->c23_fEmlrtCtx, NULL, "disp", 0U, 1U, 14, c23_c_y);
  c23_b_y[2] = c23_b_u[0];
  c23_b_y[3] = c23_b_u[1];
  c23_b_y[4] = c23_b_u[4];
  c23_b_y[5] = c23_b_u[5];
  c23_b_y[6] = c23_b_u[2];
}

static void c23_emlrt_marshallIn(SFc23_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c23_b_y, const char_T *c23_identifier, real_T
  c23_c_y[7])
{
  emlrtMsgIdentifier c23_thisId;
  c23_thisId.fIdentifier = const_cast<const char_T *>(c23_identifier);
  c23_thisId.fParent = NULL;
  c23_thisId.bParentIsCell = false;
  c23_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c23_b_y), &c23_thisId,
    c23_c_y);
  sf_mex_destroy(&c23_b_y);
}

static void c23_b_emlrt_marshallIn(SFc23_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c23_b_u, const emlrtMsgIdentifier *c23_parentId,
  real_T c23_b_y[7])
{
  real_T c23_dv[7];
  int32_T c23_i;
  sf_mex_import(c23_parentId, sf_mex_dup(c23_b_u), c23_dv, 1, 0, 0U, 1, 0U, 2, 1,
                7);
  for (c23_i = 0; c23_i < 7; c23_i++) {
    c23_b_y[c23_i] = c23_dv[c23_i];
  }

  sf_mex_destroy(&c23_b_u);
}

static uint8_T c23_c_emlrt_marshallIn(SFc23_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c23_b_is_active_c23_sliding_controller2, const
  char_T *c23_identifier)
{
  emlrtMsgIdentifier c23_thisId;
  uint8_T c23_b_y;
  c23_thisId.fIdentifier = const_cast<const char_T *>(c23_identifier);
  c23_thisId.fParent = NULL;
  c23_thisId.bParentIsCell = false;
  c23_b_y = c23_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c23_b_is_active_c23_sliding_controller2), &c23_thisId);
  sf_mex_destroy(&c23_b_is_active_c23_sliding_controller2);
  return c23_b_y;
}

static uint8_T c23_d_emlrt_marshallIn(SFc23_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c23_b_u, const emlrtMsgIdentifier *c23_parentId)
{
  uint8_T c23_b_y;
  uint8_T c23_c_u;
  sf_mex_import(c23_parentId, sf_mex_dup(c23_b_u), &c23_c_u, 1, 3, 0U, 0, 0U, 0);
  c23_b_y = c23_c_u;
  sf_mex_destroy(&c23_b_u);
  return c23_b_y;
}

static __global__ __launch_bounds__(32, 1) void c23_eML_blk_kernel_kernel1
  (real_T c23_b_y[7])
{
  uint64_T c23_threadId;
  int32_T c23_i;
  c23_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c23_i = (int32_T)c23_threadId;
  if (c23_i < 7) {
    c23_b_y[c23_i] = 0.0;
  }
}

static void init_dsm_address_info(SFc23_sliding_controller2InstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc23_sliding_controller2InstanceStruct
  *chartInstance)
{
  chartInstance->c23_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c23_u = (real_T (*)[6])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c23_y = (real_T (*)[7])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c23_sliding_controller2_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1104270009U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(4002144469U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(1451542329U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(1457894201U);
}

mxArray *sf_c23_sliding_controller2_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c23_sliding_controller2_jit_fallback_info(void)
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

mxArray *sf_c23_sliding_controller2_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c23_sliding_controller2(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfk"
    "UU90P4mcXxicklmWWp8clGxvHFOZkpmXnp8cn5eSVF+Tk5qUVGSOaDAABbQhvX"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c23_sliding_controller2_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "scU9zZ5H1kMhWDkDI28BpgD";
}

static void sf_opaque_initialize_c23_sliding_controller2(void *chartInstanceVar)
{
  initialize_params_c23_sliding_controller2
    ((SFc23_sliding_controller2InstanceStruct*) chartInstanceVar);
  initialize_c23_sliding_controller2((SFc23_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c23_sliding_controller2(void *chartInstanceVar)
{
  enable_c23_sliding_controller2((SFc23_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c23_sliding_controller2(void *chartInstanceVar)
{
  disable_c23_sliding_controller2((SFc23_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c23_sliding_controller2(void *chartInstanceVar)
{
  sf_gateway_c23_sliding_controller2((SFc23_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c23_sliding_controller2(SimStruct*
  S)
{
  return get_sim_state_c23_sliding_controller2
    ((SFc23_sliding_controller2InstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c23_sliding_controller2(SimStruct* S, const
  mxArray *st)
{
  set_sim_state_c23_sliding_controller2((SFc23_sliding_controller2InstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_cleanup_runtime_resources_c23_sliding_controller2(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc23_sliding_controller2InstanceStruct*) chartInstanceVar
      )->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller2_optimization_info();
    }

    mdl_cleanup_runtime_resources_c23_sliding_controller2
      ((SFc23_sliding_controller2InstanceStruct*) chartInstanceVar);
    ((SFc23_sliding_controller2InstanceStruct*) chartInstanceVar)->
      ~SFc23_sliding_controller2InstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c23_sliding_controller2(void *chartInstanceVar)
{
  mdl_start_c23_sliding_controller2((SFc23_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c23_sliding_controller2(void
  *chartInstanceVar)
{
  mdl_terminate_c23_sliding_controller2((SFc23_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc23_sliding_controller2((SFc23_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c23_sliding_controller2(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c23_sliding_controller2
      ((SFc23_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc23_sliding_controller2
      ((SFc23_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c23_sliding_controller2_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV09v00gUd6OCQAJUrRZxQQJO7BGKWMEFSuJERGpotW4Bcamm45d4lPGMmT9pw1dAXFZc9sB",
    "ngM+AxHfgst9hbyvtiTe2kwbHdigRFYuw5Dpj/96b997v/Zl6K92eh9cFvDd+8bzT+DyDd8PLrl",
    "P5emXmzt6vetfz9SsUEjbeJorE2qu9BInhD9CSW8Ok6Iq+LIUx0QcFgiI2kcpUadMstpyJYccK6",
    "vTpJxGjURBJy8MmypJwS/Axakus2UY9PlNATQcgNJGSdhB1OBlMLVbmoBUBHWob17mgwQQ2cWbp",
    "nuWGJRzah0C7QhuCFusj2wJDDLTMYaWbzlMdTIAyTjgjotTbiOgAEgywgd0kxL9b1qBTRRiNiDJ",
    "NiMgI9CYbpjqlgKJOpvHDPhPESMUIb8e85QTnbdvmaE9PhsBrAoK2NRWQYSKZMNX8Bx30tC3IPg",
    "cf9u2gWlsAz60j/zGDA1CVceu35AgUGcCWqNw0DUj7MGVrmiXzMMNieEzUA4r8aQgrsxczRwcEe",
    "YIdlKiCQepkV+8oNsLwVmqzcddl5qKSsXFGtl4ES7W1R1DHwlRbh4oW4VxXwnZksgkj4KlWnxhS",
    "D8u0luO0ZuGOxAC79K6uBisYEp/DWlKErJSuUQGQ9p1H2Fg+R1KrjYxbmLz+5ub853lYVxhQfUK",
    "hrAsowjRgzNLwVmsLmXbcIxCtMql5ZeAsQxahPN23wj+QaogxqWkiRy44RiuBsR4gl1gJuxqLpg",
    "7muFyEo4RGELoGwzj0sGwQWxIT7VrbA6y7ETNjHzRVLClh1WLVYRtqu4QaJ7ArhkIeiI6ScZD3+",
    "Cy8AJhtRAkmBk3sX2rcwd3LqHDz7IZ3NM/OfcE8m8gVn7/N6Fkp0ePNPIv7nm3U79vAXyuT+Tsj",
    "d76wz2pBzuHW8L7438vX/75+8/bDn7/f/vuvD++X2f9d43jz/0K+vjxptNPCGc3lq8M+nLFrtUT",
    "/pRn9a/la0927L57dfnhz2Iue+EO/u36nmQz8jJ8F9jYK9k7eX3UdH7MszU9Fu2F+MHFrYrNx7f",
    "TfmbH39IJ4nM3fZ9c/95eT/3WjyOPqAvk1/DUu5O3X7391Yzn5bP+nC+y/VuD7WjrX94jrFrBH1",
    "2/tac5CLPU9KoVRknNQ6yX1+bX5flw574Tl/i92/pT79rx/yfw6aTnvhOWW9e+4c/x7w9fNA6+A",
    "X/uO/Vj2fPWt8R+9452DruTre9N/dVoR42HJqTf/jEfYftnXHyBPPwFlirQP",
    ""
  };

  static char newstr [1261] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c23_sliding_controller2(SimStruct *S)
{
  const char* newstr = sf_c23_sliding_controller2_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(2492201493U));
  ssSetChecksum1(S,(2946340087U));
  ssSetChecksum2(S,(892768965U));
  ssSetChecksum3(S,(3267729885U));
}

static void mdlRTW_c23_sliding_controller2(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c23_sliding_controller2(SimStruct *S)
{
  SFc23_sliding_controller2InstanceStruct *chartInstance;
  chartInstance = (SFc23_sliding_controller2InstanceStruct *)utMalloc(sizeof
    (SFc23_sliding_controller2InstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc23_sliding_controller2InstanceStruct));
  chartInstance = new (chartInstance) SFc23_sliding_controller2InstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c23_sliding_controller2;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c23_sliding_controller2;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c23_sliding_controller2;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c23_sliding_controller2;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c23_sliding_controller2;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c23_sliding_controller2;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c23_sliding_controller2;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c23_sliding_controller2;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c23_sliding_controller2;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c23_sliding_controller2;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c23_sliding_controller2;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c23_sliding_controller2;
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
    chartInstance->c23_JITStateAnimation,
    chartInstance->c23_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c23_sliding_controller2(chartInstance);
}

void c23_sliding_controller2_method_dispatcher(SimStruct *S, int_T method, void *
  data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c23_sliding_controller2(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c23_sliding_controller2(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c23_sliding_controller2(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c23_sliding_controller2_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
