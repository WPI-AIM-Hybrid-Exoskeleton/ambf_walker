/* Include files */

#include "sliding_controller2_sfun.h"
#include "c1_sliding_controller2.h"
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
static void initialize_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance);
static void initialize_params_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance);
static void enable_c1_sliding_controller2(SFc1_sliding_controller2InstanceStruct
  *chartInstance);
static void disable_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance);
static void c1_do_animation_call_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance);
static void ext_mode_exec_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance);
static const mxArray *get_sim_state_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance);
static void set_sim_state_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance, const mxArray *c1_st);
static void sf_gateway_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance);
static void mdl_start_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance);
static void mdl_terminate_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance);
static void initSimStructsc1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance);
static void c1_eML_blk_kernel(SFc1_sliding_controller2InstanceStruct
  *chartInstance, real_T c1_b_q[2], real_T c1_b_qd[2], real_T c1_b_knee[2],
  real_T c1_b_dknee[2], real_T c1_b_ankle[2], real_T c1_b_danke[2]);
static void c1_emlrt_marshallIn(SFc1_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c1_b_ankle, const char_T *c1_identifier, real_T
  c1_y[2]);
static void c1_b_emlrt_marshallIn(SFc1_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId,
  real_T c1_y[2]);
static uint8_T c1_c_emlrt_marshallIn(SFc1_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c1_b_is_active_c1_sliding_controller2, const
  char_T *c1_identifier);
static uint8_T c1_d_emlrt_marshallIn(SFc1_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId);
static void init_dsm_address_info(SFc1_sliding_controller2InstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc1_sliding_controller2InstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c1_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c1_is_active_c1_sliding_controller2 = 0U;
  cudaGetLastError();
}

static void initialize_params_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance)
{
}

static void enable_c1_sliding_controller2(SFc1_sliding_controller2InstanceStruct
  *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c1_do_animation_call_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance)
{
  const mxArray *c1_b_y = NULL;
  const mxArray *c1_c_y = NULL;
  const mxArray *c1_d_y = NULL;
  const mxArray *c1_e_y = NULL;
  const mxArray *c1_f_y = NULL;
  const mxArray *c1_st;
  const mxArray *c1_y = NULL;
  c1_st = NULL;
  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_createcellmatrix(5, 1), false);
  c1_b_y = NULL;
  sf_mex_assign(&c1_b_y, sf_mex_create("y", *chartInstance->c1_ankle, 0, 0U, 1U,
    0U, 1, 2), false);
  sf_mex_setcell(c1_y, 0, c1_b_y);
  c1_c_y = NULL;
  sf_mex_assign(&c1_c_y, sf_mex_create("y", *chartInstance->c1_danke, 0, 0U, 1U,
    0U, 1, 2), false);
  sf_mex_setcell(c1_y, 1, c1_c_y);
  c1_d_y = NULL;
  sf_mex_assign(&c1_d_y, sf_mex_create("y", *chartInstance->c1_dknee, 0, 0U, 1U,
    0U, 1, 2), false);
  sf_mex_setcell(c1_y, 2, c1_d_y);
  c1_e_y = NULL;
  sf_mex_assign(&c1_e_y, sf_mex_create("y", *chartInstance->c1_knee, 0, 0U, 1U,
    0U, 1, 2), false);
  sf_mex_setcell(c1_y, 3, c1_e_y);
  c1_f_y = NULL;
  sf_mex_assign(&c1_f_y, sf_mex_create("y",
    &chartInstance->c1_is_active_c1_sliding_controller2, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c1_y, 4, c1_f_y);
  sf_mex_assign(&c1_st, c1_y, false);
  return c1_st;
}

static void set_sim_state_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance, const mxArray *c1_st)
{
  const mxArray *c1_u;
  c1_u = sf_mex_dup(c1_st);
  c1_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c1_u, 0)),
                      "ankle", *chartInstance->c1_ankle);
  c1_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c1_u, 1)),
                      "danke", *chartInstance->c1_danke);
  c1_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c1_u, 2)),
                      "dknee", *chartInstance->c1_dknee);
  c1_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c1_u, 3)), "knee",
                      *chartInstance->c1_knee);
  chartInstance->c1_is_active_c1_sliding_controller2 = c1_c_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c1_u, 4)),
     "is_active_c1_sliding_controller2");
  sf_mex_destroy(&c1_u);
  sf_mex_destroy(&c1_st);
}

static void sf_gateway_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance)
{
  chartInstance->c1_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c1_eML_blk_kernel(chartInstance, *chartInstance->c1_q, *chartInstance->c1_qd, *
                    chartInstance->c1_knee, *chartInstance->c1_dknee,
                    *chartInstance->c1_ankle, *chartInstance->c1_danke);
  c1_do_animation_call_c1_sliding_controller2(chartInstance);
}

static void mdl_start_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance)
{
}

static void mdl_terminate_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance)
{
  cudaError_t c1_errCode;
  c1_errCode = cudaGetLastError();
  if (c1_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c1_errCode, (char_T *)cudaGetErrorName
                       (c1_errCode), (char_T *)cudaGetErrorString(c1_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c1_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance)
{
}

static void initSimStructsc1_sliding_controller2
  (SFc1_sliding_controller2InstanceStruct *chartInstance)
{
}

const mxArray *sf_c1_sliding_controller2_get_eml_resolved_functions_info()
{
  const mxArray *c1_nameCaptureInfo = NULL;
  const char_T *c1_data[4] = {
    "789cc5534d4bc340109d4a2d5eaa9e04c1ab170fae5ec4b3c5428596da0f3c88c649b26996ee876c52db7af1ee41ff8e7fcaff6092364d130c118bf541987dbc"
    "ecbc99070ba546b30400dbc1f7f602705e8108d55981dd79dd8034b27a29a7c6d88472ea5ea8bf067eef736e29e9d3893f2312055ddcb4956012a5df9b3e52d0",
    "d453fc89da91e2304e7b4cd0ee3269854cd497a40509a5f05c73a935ec8e0468d74b26e4cb24ca23c443cebee5823cb2c8e691fd2ff69bfcd22feebf57e017eb"
    "8ed263d4b631649209f499e5199c0e56df3bf6ade4ce31536c3532394dfc3e56f4ebe5faa5f5dbcb3be22a418944df45c9281f286e3ba84d62a11fa4618c3de2",
    "698ba0301d638c7c48350902e26892ef333b1661dfa2dc767eb847defba9c256543fdbfbb84ebffba383c375fac5f82fbf75bdbf9bf6059e9c3d5fb14e47d79b"
    "d7fd6ea37fdaaa2573b40b7c8ae6801cfed7fdbf0052dd6684", "" };

  c1_nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&c1_data[0], 1616U, &c1_nameCaptureInfo);
  return c1_nameCaptureInfo;
}

static void c1_eML_blk_kernel(SFc1_sliding_controller2InstanceStruct
  *chartInstance, real_T c1_b_q[2], real_T c1_b_qd[2], real_T c1_b_knee[2],
  real_T c1_b_dknee[2], real_T c1_b_ankle[2], real_T c1_b_danke[2])
{
  real_T c1_a;
  real_T c1_b_a;
  c1_b_knee[0] = -0.324 * muDoubleScalarCos(c1_b_q[0]);
  c1_b_knee[1] = -0.324 * muDoubleScalarSin(c1_b_q[0]);
  c1_a = -0.324 * c1_b_qd[0];
  c1_b_dknee[0] = c1_a * -muDoubleScalarSin(c1_b_q[0]);
  c1_b_dknee[1] = c1_a * muDoubleScalarCos(c1_b_q[0]);
  c1_b_a = -0.39 * (c1_b_qd[0] + c1_b_qd[1]);
  c1_b_ankle[0] = c1_b_knee[0] - -0.39 * muDoubleScalarSin(c1_b_q[0] + c1_b_q[1]);
  c1_b_ankle[1] = c1_b_knee[1] - -0.39 * muDoubleScalarCos(c1_b_q[0] + c1_b_q[1]);
  c1_b_danke[0] = c1_b_dknee[0] + c1_b_a * -muDoubleScalarSin(c1_b_q[0] +
    c1_b_q[1]);
  c1_b_danke[1] = c1_b_dknee[1] + c1_b_a * muDoubleScalarCos(c1_b_q[0] + c1_b_q
    [1]);
}

static void c1_emlrt_marshallIn(SFc1_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c1_b_ankle, const char_T *c1_identifier, real_T
  c1_y[2])
{
  emlrtMsgIdentifier c1_thisId;
  c1_thisId.fIdentifier = const_cast<const char_T *>(c1_identifier);
  c1_thisId.fParent = NULL;
  c1_thisId.bParentIsCell = false;
  c1_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c1_b_ankle), &c1_thisId, c1_y);
  sf_mex_destroy(&c1_b_ankle);
}

static void c1_b_emlrt_marshallIn(SFc1_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId,
  real_T c1_y[2])
{
  real_T c1_dv[2];
  int32_T c1_i;
  sf_mex_import(c1_parentId, sf_mex_dup(c1_u), c1_dv, 1, 0, 0U, 1, 0U, 1, 2);
  for (c1_i = 0; c1_i < 2; c1_i++) {
    c1_y[c1_i] = c1_dv[c1_i];
  }

  sf_mex_destroy(&c1_u);
}

static uint8_T c1_c_emlrt_marshallIn(SFc1_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c1_b_is_active_c1_sliding_controller2, const
  char_T *c1_identifier)
{
  emlrtMsgIdentifier c1_thisId;
  uint8_T c1_y;
  c1_thisId.fIdentifier = const_cast<const char_T *>(c1_identifier);
  c1_thisId.fParent = NULL;
  c1_thisId.bParentIsCell = false;
  c1_y = c1_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c1_b_is_active_c1_sliding_controller2), &c1_thisId);
  sf_mex_destroy(&c1_b_is_active_c1_sliding_controller2);
  return c1_y;
}

static uint8_T c1_d_emlrt_marshallIn(SFc1_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId)
{
  uint8_T c1_b_u;
  uint8_T c1_y;
  sf_mex_import(c1_parentId, sf_mex_dup(c1_u), &c1_b_u, 1, 3, 0U, 0, 0U, 0);
  c1_y = c1_b_u;
  sf_mex_destroy(&c1_u);
  return c1_y;
}

static void init_dsm_address_info(SFc1_sliding_controller2InstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc1_sliding_controller2InstanceStruct
  *chartInstance)
{
  chartInstance->c1_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c1_q = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c1_knee = (real_T (*)[2])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
  chartInstance->c1_dknee = (real_T (*)[2])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 2);
  chartInstance->c1_qd = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 1);
  chartInstance->c1_ankle = (real_T (*)[2])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 3);
  chartInstance->c1_danke = (real_T (*)[2])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 4);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c1_sliding_controller2_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1880680695U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1680452377U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3479659674U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3127653308U);
}

mxArray *sf_c1_sliding_controller2_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c1_sliding_controller2_jit_fallback_info(void)
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

mxArray *sf_c1_sliding_controller2_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c1_sliding_controller2(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPiAOYGFgYAPSHEDMxAABrFA+I5TNCBdngYsrAHFJZUEqSLy4KNkzBUjnJeaC+Ym"
    "lFZ55aflg8y0YEOazYTGfEcl8Tqg4BHywp0y/jAO6fhYC/hOA8hPzsnNSoeEDC6eB84cS2f5IAX"
    "pk8PhDgXx/ZOelDh5/iID9YUDAHywo/mBhAHmBOu7HDEfS9EPzPQH3K6DFA4ifWRyfmFySWZYan"
    "2wYX5yTmZKZlx6fnJ9XUpSfk5NaZATzHwD+USxt"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c1_sliding_controller2_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sQh5nvZHhAQaTmI03z90vbC";
}

static void sf_opaque_initialize_c1_sliding_controller2(void *chartInstanceVar)
{
  initialize_params_c1_sliding_controller2
    ((SFc1_sliding_controller2InstanceStruct*) chartInstanceVar);
  initialize_c1_sliding_controller2((SFc1_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c1_sliding_controller2(void *chartInstanceVar)
{
  enable_c1_sliding_controller2((SFc1_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c1_sliding_controller2(void *chartInstanceVar)
{
  disable_c1_sliding_controller2((SFc1_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c1_sliding_controller2(void *chartInstanceVar)
{
  sf_gateway_c1_sliding_controller2((SFc1_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c1_sliding_controller2(SimStruct*
  S)
{
  return get_sim_state_c1_sliding_controller2
    ((SFc1_sliding_controller2InstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c1_sliding_controller2(SimStruct* S, const
  mxArray *st)
{
  set_sim_state_c1_sliding_controller2((SFc1_sliding_controller2InstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_cleanup_runtime_resources_c1_sliding_controller2(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc1_sliding_controller2InstanceStruct*) chartInstanceVar
      )->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller2_optimization_info();
    }

    mdl_cleanup_runtime_resources_c1_sliding_controller2
      ((SFc1_sliding_controller2InstanceStruct*) chartInstanceVar);
    ((SFc1_sliding_controller2InstanceStruct*) chartInstanceVar)->
      ~SFc1_sliding_controller2InstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c1_sliding_controller2(void *chartInstanceVar)
{
  mdl_start_c1_sliding_controller2((SFc1_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c1_sliding_controller2(void
  *chartInstanceVar)
{
  mdl_terminate_c1_sliding_controller2((SFc1_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc1_sliding_controller2((SFc1_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c1_sliding_controller2(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c1_sliding_controller2
      ((SFc1_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc1_sliding_controller2((SFc1_sliding_controller2InstanceStruct*)
      sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c1_sliding_controller2_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [19] = {
    "eNrtV91u40QUdqLsipWg6sVK3KygQivBDVIBIcEN29ZJtFm12yxOF4kLqun4JB5lPGPmx214h0W",
    "8wN7zANzwBEg8AVc8A+IJOGO7aerYTtOyS0G4ctKxv/PN+c45c2bitQYHHl4beP9w3/Pu4vcbeL",
    "e9/LpTjFsLd/68471fjF+gkbDxkCgSa6/xEiSGL0FLbg2TYiDGshLGxBgUCIrYRCpTx6ZZbDkT0",
    "74V1PHpryJGoyCSlod7aEvCQ8FnyJZYM0SeLlNATR8gNJGSdhL1OZnMPVbm1I+ATrWNmyRoMIFN",
    "nFv6wHLDEg69M6ADoQ1Bj/WFb4EhBnxzVivTKdXBOVDGCWdEVKqNiA4gwQAbOEpC/Dy0BkWVYTQ",
    "iyuxBRFLQ+2yacUoBZU6m8cUJE8RIxQjvxdx3hsu+DTn6cyBD4A0BQd/2FJBpIpkw9fkP+qi0J8",
    "gJhy6c2Ek9WwDfWpf85wxOQdXGbezLFBSZwKGonTQLSO8sy9a8SpZhhsXwnKhdivnTENZWL1aOD",
    "gjmCUZoUQeDTORAjxRLMby1bDYeuMpctWRsnCdbr4JlbL0UmrIwZ+tT4RPOdS1sJJN9SIFnrF1i",
    "SDMsZ63Gac3CkcQAu/KuXw1WMEx8AfOlCFllutISIOs7T7GxXEZSq42MfSze7v7+8utl2EAYUGN",
    "CoaoLKMI0YMyy8NazhUy73CMQvTKZe1XgvEJWoTw9tqJ7KtUUY9LQRC4kuIzWAmM9wVziSjjSuG",
    "iaYC6Xq3CU0AhC12AYhwNcNoitiIl2rW0X113KzKwLmiqWVGTV4qrDNtRzBTVL4EhMhTwVfSXjo",
    "OjxeXgBsNqIEkxM9rB/qVkfZ69KhdvPtr2L/ezNK+xn53bl7w8WeFoVPN7Cd3nee+3L+HZp3jb+",
    "tVq53c6C3VuleTolO4fbxPvJ7y8fPn3npz9/+fXD72c//vzNqvlbS/O3sv83CtA6+/9GMX5w3mj",
    "nCyddqleHfbzgV6eC/+0F/s1irJ9Fn4r068fR7jMyigfbn3z3+XZ64md8w06zv3dK/p4/33IdH6",
    "ssq09FB2FxMHFjYvPt2vF/tuDv3RXxuFc8z68/Ht3M/sFO2b6zQt9mMSZiyqFUv/+cjveurSNEI",
    "bdHx9b1dUzx0HBrdNzfKfeHKh2dSzo6npPw9/i/HMf17PP5hyv83yrlYSs7Lx4TtwvBMf3oWHMW",
    "4g5yTKUwSnIO6uONK/bvpv65rp33mu3+LX7+b/fq836V81D7mnadG56/XpfdTfWtey68bfimfcA",
    "r4TdvsY6bntdfNf43b71z9bvF+Iv5T2c/Yjys+BVVvMafROOqt/+BOv0LHBTDXQ==",
    ""
  };

  static char newstr [1341] = "";
  newstr[0] = '\0';
  for (i = 0; i < 19; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c1_sliding_controller2(SimStruct *S)
{
  const char* newstr = sf_c1_sliding_controller2_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(614325834U));
  ssSetChecksum1(S,(4071890510U));
  ssSetChecksum2(S,(2385365703U));
  ssSetChecksum3(S,(1589225593U));
}

static void mdlRTW_c1_sliding_controller2(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c1_sliding_controller2(SimStruct *S)
{
  SFc1_sliding_controller2InstanceStruct *chartInstance;
  chartInstance = (SFc1_sliding_controller2InstanceStruct *)utMalloc(sizeof
    (SFc1_sliding_controller2InstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc1_sliding_controller2InstanceStruct));
  chartInstance = new (chartInstance) SFc1_sliding_controller2InstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c1_sliding_controller2;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c1_sliding_controller2;
  chartInstance->chartInfo.mdlStart = sf_opaque_mdl_start_c1_sliding_controller2;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c1_sliding_controller2;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c1_sliding_controller2;
  chartInstance->chartInfo.enableChart = sf_opaque_enable_c1_sliding_controller2;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c1_sliding_controller2;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c1_sliding_controller2;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c1_sliding_controller2;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c1_sliding_controller2;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c1_sliding_controller2;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c1_sliding_controller2;
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
    chartInstance->c1_JITStateAnimation,
    chartInstance->c1_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c1_sliding_controller2(chartInstance);
}

void c1_sliding_controller2_method_dispatcher(SimStruct *S, int_T method, void
  *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c1_sliding_controller2(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c1_sliding_controller2(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c1_sliding_controller2(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c1_sliding_controller2_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
