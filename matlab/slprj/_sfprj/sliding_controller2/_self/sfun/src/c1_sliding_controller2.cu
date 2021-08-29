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
    "789cc553cb4ac34014bd915adc545df90b2e04c7baeabe2a88580a0d6e44e224b969c6cc432653dbbaf10fec57f80ffe8e7b3fc2246dfa088688c57a20dc399c"
    "cc3df71e18b02eaf2d00d84d3efb05a055870c8d6981fd59dd82551475aba4e6d886dacabd54ef267e9319f7943438325322a9c0f94d5f0926a934f6f8114163",
    "acf813fa9912308e3613d85b269d94898b25694e52293db743f4a2de40800ee3c5847c996479a4b82fd9b756914711c53c8affe57ea35ffae5fd0f2afc723d50"
    "7a48b5ef444c32410df36287637ffdbd73df7ae91c53c5570397e3c2ef7d4d3fbbd46f55bf3dbf23a11248243521950c795f713fa0da251e35491ace3026b1f6",
    "08156ee00c298f509324204e5df27d66c722ed5b95dbde0ff7287b3f0dd8c9eadbeb11dda4dfc7e1a7b549bf1cffe5b7a9f777753266cd67f61045a7ad76a7e9"
    "bade8d6fce1673742b7caae68012fed7fdbf00b09967db", "" };

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
  c1_b_knee[0] = -0.324 * muDoubleScalarSin(c1_b_q[0]);
  c1_b_knee[1] = -0.324 * muDoubleScalarCos(c1_b_q[0]);
  c1_a = -0.324 * c1_b_qd[0];
  c1_b_dknee[0] = c1_a * muDoubleScalarCos(c1_b_q[0]);
  c1_b_dknee[1] = c1_a * -muDoubleScalarSin(c1_b_q[0]);
  c1_b_a = -0.39 * (c1_b_qd[0] + c1_b_qd[1]);
  c1_b_ankle[0] = c1_b_knee[0] + -0.39 * muDoubleScalarSin(c1_b_q[0] + c1_b_q[1]);
  c1_b_ankle[1] = c1_b_knee[1] + -0.39 * muDoubleScalarCos(c1_b_q[0] + c1_b_q[1]);
  c1_b_danke[0] = c1_b_dknee[0] + c1_b_a * muDoubleScalarCos(c1_b_q[0] + c1_b_q
    [1]);
  c1_b_danke[1] = c1_b_dknee[1] + c1_b_a * -muDoubleScalarSin(c1_b_q[0] +
    c1_b_q[1]);
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
    "eNrtV91u40QUdqLsipWWqhcrcbMSFdIKLgsICW6grZNoI7XbLE4XCSFVk/FJPMp4xsyP28I+ARL",
    "SXu+77HvsM3ADEpdwwRnbTVPHdpqWXQrClZOO/Z1vznfOmTMTrzU48PDawPvFA8+7i9/v4N328u",
    "tOMW4t3PnzjvdhMf4ZjYSNh0SRWHuNlyAxfA1acmuYFAMxkZUwJiagQFDEJlKZOjbNYsuZmPWto",
    "I5PfxMxGgWRtDzcQ1sSHgp+hmyJNUPk6TIF1PQBQhMpaadRn5Pp3GNlTvwI6EzbuEmCBhPYxLml",
    "Dyw3LOHQOwU6ENoQ9Fhf+BYYYsA3p7UynVIdnANlnHBGRKXaiOgAEgywgaMkxM9Da1BUGUYjosw",
    "eRCQFvc9mGacUUOZkGl+MmSBGKkZ4L+a+M1z2bcjRnwMZAm8ICPq2p4DMEsmEqc9/0EelPUHGHL",
    "owttN6tgC+ty75zxicgKqN28SXKSgyhUNRO2kWkN5plq15lSzDDIvhGVG7FPOnIaytXqwcHRDME",
    "4zQog4GmciBHimWYnhr2Ww8cJW5asnYOE+2XgXL2HopNGVhztanwiec61rYSCb7kALPWLvEkGZY",
    "zlqN05qFI4kBduVdvxqsYJj4AuZLEbLKdKUlQNZ3nmBjuYykVhsZ+1i83f395dfLsIEwoCaEQlU",
    "XUIRpwJhl4a1nC5l2uUcgemUy96rAeYWsQnl6YkX3RKoZxqShiVxIcBmtBcZ6irnElXCkcdE0wV",
    "wuV+EooRGErsEwDge4bBBbERPtWtsurruUmbMuaKpYUpFVi6sO21DPFdRZAkdiJuSJ6CsZB0WPz",
    "8MLgNVGlGBiuof9S531cfaqVLj9bNu72M/uX2E/O7crf3+0wNOq4PEWvsvz3mtfxrdL87bxr9XK",
    "7XYW7N4tzdMp2TncJt6//Pn7o+e//jT+8XX4/LuXr/5YNX9raf5W9v9GAVpn/98oxg/PG+184aR",
    "L9eqwjxf86lTwv7fAv1mM9dPoM5F++zjafUpG8WD70x++2E7HfsY37DT7e6fk7/nzLdfxscqy+l",
    "R0EBYHEzcmNt+uHf/nC/7eXRGPe8Xz/Prtq5vZP9wp23dW6NssxkTMOJTq95/T8cG1dYQo5Pbo2",
    "Lq+jhkeGm6Njgc75f5QpaNzSUfHcxL+Hv+X47iefT7/cIX/W6U8bGXnxWPidiE4ph8fa85C3EGO",
    "qRRGSc5BfbJxxf7d1D/XtfPest2/xc//7d583q9yHmpf065zw/PX27K7qb51z4W3Dd+0D3gl/OY",
    "t1nHT8/qbxr/21jtXv1+Mv5z/dPYjxsOKX1HFa/xJNKl6+x+o078AKfnFFA==",
    ""
  };

  static char newstr [1337] = "";
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
  ssSetChecksum0(S,(636746986U));
  ssSetChecksum1(S,(1653272444U));
  ssSetChecksum2(S,(2086983803U));
  ssSetChecksum3(S,(4223507036U));
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
