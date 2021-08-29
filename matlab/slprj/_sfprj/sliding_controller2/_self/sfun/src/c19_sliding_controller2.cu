/* Include files */

#include "sliding_controller2_sfun.h"
#include "c19_sliding_controller2.h"
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
static void initialize_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance);
static void initialize_params_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance);
static void enable_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance);
static void disable_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance);
static void c19_do_animation_call_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance);
static void ext_mode_exec_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance);
static const mxArray *get_sim_state_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance);
static void set_sim_state_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance, const mxArray *c19_st);
static void sf_gateway_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance);
static void mdl_start_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance);
static void mdl_terminate_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance);
static void initSimStructsc19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance);
static void c19_eML_blk_kernel(SFc19_sliding_controller2InstanceStruct
  *chartInstance, real_T c19_b_q[2], real_T c19_b_qd[2], real_T c19_b_knee[2],
  real_T c19_b_dknee[2], real_T c19_b_ankle[2], real_T c19_b_danke[2]);
static void c19_emlrt_marshallIn(SFc19_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c19_b_ankle, const char_T *c19_identifier,
  real_T c19_y[2]);
static void c19_b_emlrt_marshallIn(SFc19_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c19_u, const emlrtMsgIdentifier *c19_parentId,
  real_T c19_y[2]);
static uint8_T c19_c_emlrt_marshallIn(SFc19_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c19_b_is_active_c19_sliding_controller2, const
  char_T *c19_identifier);
static uint8_T c19_d_emlrt_marshallIn(SFc19_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c19_u, const emlrtMsgIdentifier *c19_parentId);
static void init_dsm_address_info(SFc19_sliding_controller2InstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc19_sliding_controller2InstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c19_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c19_is_active_c19_sliding_controller2 = 0U;
  cudaGetLastError();
}

static void initialize_params_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance)
{
}

static void enable_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c19_do_animation_call_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance)
{
  const mxArray *c19_b_y = NULL;
  const mxArray *c19_c_y = NULL;
  const mxArray *c19_d_y = NULL;
  const mxArray *c19_e_y = NULL;
  const mxArray *c19_f_y = NULL;
  const mxArray *c19_st;
  const mxArray *c19_y = NULL;
  c19_st = NULL;
  c19_y = NULL;
  sf_mex_assign(&c19_y, sf_mex_createcellmatrix(5, 1), false);
  c19_b_y = NULL;
  sf_mex_assign(&c19_b_y, sf_mex_create("y", *chartInstance->c19_ankle, 0, 0U,
    1U, 0U, 1, 2), false);
  sf_mex_setcell(c19_y, 0, c19_b_y);
  c19_c_y = NULL;
  sf_mex_assign(&c19_c_y, sf_mex_create("y", *chartInstance->c19_danke, 0, 0U,
    1U, 0U, 1, 2), false);
  sf_mex_setcell(c19_y, 1, c19_c_y);
  c19_d_y = NULL;
  sf_mex_assign(&c19_d_y, sf_mex_create("y", *chartInstance->c19_dknee, 0, 0U,
    1U, 0U, 1, 2), false);
  sf_mex_setcell(c19_y, 2, c19_d_y);
  c19_e_y = NULL;
  sf_mex_assign(&c19_e_y, sf_mex_create("y", *chartInstance->c19_knee, 0, 0U, 1U,
    0U, 1, 2), false);
  sf_mex_setcell(c19_y, 3, c19_e_y);
  c19_f_y = NULL;
  sf_mex_assign(&c19_f_y, sf_mex_create("y",
    &chartInstance->c19_is_active_c19_sliding_controller2, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c19_y, 4, c19_f_y);
  sf_mex_assign(&c19_st, c19_y, false);
  return c19_st;
}

static void set_sim_state_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance, const mxArray *c19_st)
{
  const mxArray *c19_u;
  c19_u = sf_mex_dup(c19_st);
  c19_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c19_u, 0)),
                       "ankle", *chartInstance->c19_ankle);
  c19_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c19_u, 1)),
                       "danke", *chartInstance->c19_danke);
  c19_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c19_u, 2)),
                       "dknee", *chartInstance->c19_dknee);
  c19_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c19_u, 3)),
                       "knee", *chartInstance->c19_knee);
  chartInstance->c19_is_active_c19_sliding_controller2 = c19_c_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c19_u, 4)),
     "is_active_c19_sliding_controller2");
  sf_mex_destroy(&c19_u);
  sf_mex_destroy(&c19_st);
}

static void sf_gateway_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance)
{
  chartInstance->c19_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c19_eML_blk_kernel(chartInstance, *chartInstance->c19_q,
                     *chartInstance->c19_qd, *chartInstance->c19_knee,
                     *chartInstance->c19_dknee, *chartInstance->c19_ankle,
                     *chartInstance->c19_danke);
  c19_do_animation_call_c19_sliding_controller2(chartInstance);
}

static void mdl_start_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance)
{
}

static void mdl_terminate_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance)
{
  cudaError_t c19_errCode;
  c19_errCode = cudaGetLastError();
  if (c19_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c19_errCode, (char_T *)cudaGetErrorName
                       (c19_errCode), (char_T *)cudaGetErrorString(c19_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c19_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance)
{
}

static void initSimStructsc19_sliding_controller2
  (SFc19_sliding_controller2InstanceStruct *chartInstance)
{
}

const mxArray *sf_c19_sliding_controller2_get_eml_resolved_functions_info()
{
  const mxArray *c19_nameCaptureInfo = NULL;
  const char_T *c19_data[4] = {
    "789cc553cb4ac34014bd915adc545df90b2e04c7baeabe2a88580a0d6e44e224b969c6cc432653dbbaf10fec57f80ffe8e7b3fc2246dfa088688c57a20dc399c"
    "cc3df71e18b02eaf2d00d84d3efb05a055870c8d6981fd59dd82551475aba4e6d886dacabd54ef267e9319f7943438325322a9c0f94d5f0926a934f6f8114163",
    "acf813fa9912308e3613d85b269d94898b25694e52293db743f4a2de40800ee3c5847c996479a4b82fd9b756914711c53c8affe57ea35ffae5fd0f2afc723d50"
    "7a48b5ef444c32410df36287637ffdbd73df7ae91c53c5570397e3c2ef7d4d3fbbd46f55bf3dbf23a11248243521950c795f713fa0da251e35491ace3026b1f6",
    "08156ee00c298f509324204e5df27d66c722ed5b95dbde0ff7287b3f0dd8c9eadbeb11dda4dfc7e1a7b549bf1cffe5b7a9f777753266cd67f61045a7ad76a7e9"
    "bade8d6fce1673742b7caae68012fed7fdbf00b09967db", "" };

  c19_nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&c19_data[0], 1616U, &c19_nameCaptureInfo);
  return c19_nameCaptureInfo;
}

static void c19_eML_blk_kernel(SFc19_sliding_controller2InstanceStruct
  *chartInstance, real_T c19_b_q[2], real_T c19_b_qd[2], real_T c19_b_knee[2],
  real_T c19_b_dknee[2], real_T c19_b_ankle[2], real_T c19_b_danke[2])
{
  real_T c19_a;
  real_T c19_b_a;
  c19_b_knee[0] = -0.324 * muDoubleScalarSin(c19_b_q[0]);
  c19_b_knee[1] = -0.324 * muDoubleScalarCos(c19_b_q[0]);
  c19_a = -0.324 * c19_b_qd[0];
  c19_b_dknee[0] = c19_a * muDoubleScalarCos(c19_b_q[0]);
  c19_b_dknee[1] = c19_a * -muDoubleScalarSin(c19_b_q[0]);
  c19_b_a = -0.39 * (c19_b_qd[0] + c19_b_qd[1]);
  c19_b_ankle[0] = c19_b_knee[0] + -0.39 * muDoubleScalarSin(c19_b_q[0] +
    c19_b_q[1]);
  c19_b_ankle[1] = c19_b_knee[1] + -0.39 * muDoubleScalarCos(c19_b_q[0] +
    c19_b_q[1]);
  c19_b_danke[0] = c19_b_dknee[0] + c19_b_a * muDoubleScalarCos(c19_b_q[0] +
    c19_b_q[1]);
  c19_b_danke[1] = c19_b_dknee[1] + c19_b_a * -muDoubleScalarSin(c19_b_q[0] +
    c19_b_q[1]);
}

static void c19_emlrt_marshallIn(SFc19_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c19_b_ankle, const char_T *c19_identifier,
  real_T c19_y[2])
{
  emlrtMsgIdentifier c19_thisId;
  c19_thisId.fIdentifier = const_cast<const char_T *>(c19_identifier);
  c19_thisId.fParent = NULL;
  c19_thisId.bParentIsCell = false;
  c19_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c19_b_ankle), &c19_thisId,
    c19_y);
  sf_mex_destroy(&c19_b_ankle);
}

static void c19_b_emlrt_marshallIn(SFc19_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c19_u, const emlrtMsgIdentifier *c19_parentId,
  real_T c19_y[2])
{
  real_T c19_dv[2];
  int32_T c19_i;
  sf_mex_import(c19_parentId, sf_mex_dup(c19_u), c19_dv, 1, 0, 0U, 1, 0U, 1, 2);
  for (c19_i = 0; c19_i < 2; c19_i++) {
    c19_y[c19_i] = c19_dv[c19_i];
  }

  sf_mex_destroy(&c19_u);
}

static uint8_T c19_c_emlrt_marshallIn(SFc19_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c19_b_is_active_c19_sliding_controller2, const
  char_T *c19_identifier)
{
  emlrtMsgIdentifier c19_thisId;
  uint8_T c19_y;
  c19_thisId.fIdentifier = const_cast<const char_T *>(c19_identifier);
  c19_thisId.fParent = NULL;
  c19_thisId.bParentIsCell = false;
  c19_y = c19_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c19_b_is_active_c19_sliding_controller2), &c19_thisId);
  sf_mex_destroy(&c19_b_is_active_c19_sliding_controller2);
  return c19_y;
}

static uint8_T c19_d_emlrt_marshallIn(SFc19_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c19_u, const emlrtMsgIdentifier *c19_parentId)
{
  uint8_T c19_b_u;
  uint8_T c19_y;
  sf_mex_import(c19_parentId, sf_mex_dup(c19_u), &c19_b_u, 1, 3, 0U, 0, 0U, 0);
  c19_y = c19_b_u;
  sf_mex_destroy(&c19_u);
  return c19_y;
}

static void init_dsm_address_info(SFc19_sliding_controller2InstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc19_sliding_controller2InstanceStruct
  *chartInstance)
{
  chartInstance->c19_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c19_q = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c19_knee = (real_T (*)[2])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
  chartInstance->c19_dknee = (real_T (*)[2])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 2);
  chartInstance->c19_qd = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 1);
  chartInstance->c19_ankle = (real_T (*)[2])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 3);
  chartInstance->c19_danke = (real_T (*)[2])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 4);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c19_sliding_controller2_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1880680695U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1680452377U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3479659674U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3127653308U);
}

mxArray *sf_c19_sliding_controller2_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c19_sliding_controller2_jit_fallback_info(void)
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

mxArray *sf_c19_sliding_controller2_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c19_sliding_controller2(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPiCOYGFgYAPSHEDMxAABrFA+I5TNCBdngYsrAHFJZUEqSLy4KNkzBUjnJeaC+Ym"
    "lFZ55aflg8y0YEOazYTGfEcl8Tqg4BHywp0y/jAO6fhYC/hOA8hPzsnNSoeEDC6eB84cS2f5IAX"
    "pk8PhDgXx/ZOelDh5/iID9YUDAHywo/mBhAHmBOu7HDEfS9EPzPQH3K6LFA4ifWRyfmFySWZYan"
    "2xoGV+ck5mSmZcen5yfV1KUn5OTWmSEZD4IAACHxSy4"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c19_sliding_controller2_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sQh5nvZHhAQaTmI03z90vbC";
}

static void sf_opaque_initialize_c19_sliding_controller2(void *chartInstanceVar)
{
  initialize_params_c19_sliding_controller2
    ((SFc19_sliding_controller2InstanceStruct*) chartInstanceVar);
  initialize_c19_sliding_controller2((SFc19_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c19_sliding_controller2(void *chartInstanceVar)
{
  enable_c19_sliding_controller2((SFc19_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c19_sliding_controller2(void *chartInstanceVar)
{
  disable_c19_sliding_controller2((SFc19_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c19_sliding_controller2(void *chartInstanceVar)
{
  sf_gateway_c19_sliding_controller2((SFc19_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c19_sliding_controller2(SimStruct*
  S)
{
  return get_sim_state_c19_sliding_controller2
    ((SFc19_sliding_controller2InstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c19_sliding_controller2(SimStruct* S, const
  mxArray *st)
{
  set_sim_state_c19_sliding_controller2((SFc19_sliding_controller2InstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_cleanup_runtime_resources_c19_sliding_controller2(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc19_sliding_controller2InstanceStruct*) chartInstanceVar
      )->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller2_optimization_info();
    }

    mdl_cleanup_runtime_resources_c19_sliding_controller2
      ((SFc19_sliding_controller2InstanceStruct*) chartInstanceVar);
    ((SFc19_sliding_controller2InstanceStruct*) chartInstanceVar)->
      ~SFc19_sliding_controller2InstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c19_sliding_controller2(void *chartInstanceVar)
{
  mdl_start_c19_sliding_controller2((SFc19_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c19_sliding_controller2(void
  *chartInstanceVar)
{
  mdl_terminate_c19_sliding_controller2((SFc19_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc19_sliding_controller2((SFc19_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c19_sliding_controller2(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c19_sliding_controller2
      ((SFc19_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc19_sliding_controller2
      ((SFc19_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c19_sliding_controller2_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [19] = {
    "eNrtV81u20YQpgQ5SIAm8CFALwGaFCiSo9uiQHNpbVMSIsCunVBOg6KAsVqOxIWWu+z+0HabJyj",
    "Qe9F36XvkGXpJgR6TQ2ZJWpYpkorsJnWL0qDkJb/5dr6Z2dmV1xrsenjdwvvX2553Db+v49328m",
    "utGLfm7vx5x7tfjH9BI2HjfaJIrL3GS5AYnoCW3BomxUCMZSWMiTEoEBSxiVSmjk2z2HImpn0rq",
    "OPT30aMRkEkLQ+30ZaEe4KfIFtizT7ydJkCavoAoYmUtJOoz8lk5rEyR34EdKpt3CRBgwls4tzS",
    "u5YblnDoHQMdCG0IeqzPfAsMMeCb41qZTqkOToEyTjgjolJtRHQACQbYwEES4ueeNSiqDKMRUWY",
    "bIpKC3mHTjFMKKHMyjS9GTBAjFSO8F3PfGS76ts/Rn10ZAm8ICPq2rYBME8mEqc9/0EelPUFGHL",
    "owspN6tgB+sC75TxkcgaqN29iXKSgygT1RO2kWkN5xlq1ZlSzCDIvhKVFbFPOnIaytXqwcHRDME",
    "wzRog4GmciBHiqWYnhr2Ww8cJW5bMnYOE+2XgbL2HopNGVhxtanwiec61rYUCY7kALPWLvEkGZY",
    "zlqN05qFQ4kBduVdvxqsYJj4AuZLEbLKdKUlQNZ3vsHGch5JrTYy9rF4uzs7i68XYQNhQI0Jhao",
    "uoAjTgDHLwlvPFjLtco9A9Mpk7lWB8wpZhvL02IrukVRTjElDEzmT4DJaC4z1BHOJK+FA46Jpgr",
    "lcLsNRQiMIXYNhHHZx2SC2IibatbYtXHcpMydd0FSxpCKrFlcdtqGeK6iTBA7EVMgj0VcyDooen",
    "4cXAKuNKMHEZBv7lzrp4+xVqXD72YZ3tp998Bb72ald+fvBHE+rgseb+y7Pe6N9Ht8uzdvGv1Yr",
    "t9ucs7tZmqdTsnO4dbz/eP3XJ89f/jz66UX4/Pvffn+1bP7Wwvyt7H9nd31ttf3/VjG+c9poZws",
    "nXahXh30051engv/DOf71YqwfR1+I9LtH0dZjMowHG5//+HAjHfkZ37NOs79rJX9Pn991HR+rLK",
    "tPRQdhcTBxY2Lz7drxfznn77Ul8bhRPM+vP7++nP2dzbJ9Z4m+9WJMxJRDqX7/OR0fX1hHiEKuj",
    "o67F9cxxUPDldFxe7PcH6p0dM7p6HhOwt/j/2IcV7PP53+2xP97pTzcy86Lh8TtQnBIP314qDkL",
    "cQs5pFIYJTkH9VlF379oH13VznvPdv8WP/+3e/d5f5tzUfuCdp1LnsPel91l9a16Prxq+Kb9wCv",
    "h16+wjsue2981/oW32vn6o2L81ewntB8xHlb8mipe40+jcdXb/0CdvgGFb8Vv",
    ""
  };

  static char newstr [1337] = "";
  newstr[0] = '\0';
  for (i = 0; i < 19; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c19_sliding_controller2(SimStruct *S)
{
  const char* newstr = sf_c19_sliding_controller2_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(636746986U));
  ssSetChecksum1(S,(1653272444U));
  ssSetChecksum2(S,(2086983803U));
  ssSetChecksum3(S,(4223507036U));
}

static void mdlRTW_c19_sliding_controller2(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c19_sliding_controller2(SimStruct *S)
{
  SFc19_sliding_controller2InstanceStruct *chartInstance;
  chartInstance = (SFc19_sliding_controller2InstanceStruct *)utMalloc(sizeof
    (SFc19_sliding_controller2InstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc19_sliding_controller2InstanceStruct));
  chartInstance = new (chartInstance) SFc19_sliding_controller2InstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c19_sliding_controller2;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c19_sliding_controller2;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c19_sliding_controller2;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c19_sliding_controller2;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c19_sliding_controller2;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c19_sliding_controller2;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c19_sliding_controller2;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c19_sliding_controller2;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c19_sliding_controller2;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c19_sliding_controller2;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c19_sliding_controller2;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c19_sliding_controller2;
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
    chartInstance->c19_JITStateAnimation,
    chartInstance->c19_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c19_sliding_controller2(chartInstance);
}

void c19_sliding_controller2_method_dispatcher(SimStruct *S, int_T method, void *
  data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c19_sliding_controller2(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c19_sliding_controller2(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c19_sliding_controller2(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c19_sliding_controller2_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
