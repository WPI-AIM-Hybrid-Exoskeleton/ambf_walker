/* Include files */

#include "sliding_controller2_sfun.h"
#include "c20_sliding_controller2.h"
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
static void initialize_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance);
static void initialize_params_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance);
static void enable_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance);
static void disable_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance);
static void c20_do_animation_call_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance);
static void ext_mode_exec_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance);
static const mxArray *get_sim_state_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance);
static void set_sim_state_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance, const mxArray *c20_st);
static void sf_gateway_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance);
static void mdl_start_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance);
static void mdl_terminate_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance);
static void initSimStructsc20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance);
static void c20_eML_blk_kernel(SFc20_sliding_controller2InstanceStruct
  *chartInstance, real_T c20_b_q[2], real_T c20_b_qd[2], real_T c20_b_knee[2],
  real_T c20_b_dknee[2], real_T c20_b_ankle[2], real_T c20_b_danke[2]);
static void c20_emlrt_marshallIn(SFc20_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c20_b_ankle, const char_T *c20_identifier,
  real_T c20_y[2]);
static void c20_b_emlrt_marshallIn(SFc20_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c20_u, const emlrtMsgIdentifier *c20_parentId,
  real_T c20_y[2]);
static uint8_T c20_c_emlrt_marshallIn(SFc20_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c20_b_is_active_c20_sliding_controller2, const
  char_T *c20_identifier);
static uint8_T c20_d_emlrt_marshallIn(SFc20_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c20_u, const emlrtMsgIdentifier *c20_parentId);
static void init_dsm_address_info(SFc20_sliding_controller2InstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc20_sliding_controller2InstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c20_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c20_is_active_c20_sliding_controller2 = 0U;
  cudaGetLastError();
}

static void initialize_params_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance)
{
}

static void enable_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c20_do_animation_call_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance)
{
  const mxArray *c20_b_y = NULL;
  const mxArray *c20_c_y = NULL;
  const mxArray *c20_d_y = NULL;
  const mxArray *c20_e_y = NULL;
  const mxArray *c20_f_y = NULL;
  const mxArray *c20_st;
  const mxArray *c20_y = NULL;
  c20_st = NULL;
  c20_y = NULL;
  sf_mex_assign(&c20_y, sf_mex_createcellmatrix(5, 1), false);
  c20_b_y = NULL;
  sf_mex_assign(&c20_b_y, sf_mex_create("y", *chartInstance->c20_ankle, 0, 0U,
    1U, 0U, 1, 2), false);
  sf_mex_setcell(c20_y, 0, c20_b_y);
  c20_c_y = NULL;
  sf_mex_assign(&c20_c_y, sf_mex_create("y", *chartInstance->c20_danke, 0, 0U,
    1U, 0U, 1, 2), false);
  sf_mex_setcell(c20_y, 1, c20_c_y);
  c20_d_y = NULL;
  sf_mex_assign(&c20_d_y, sf_mex_create("y", *chartInstance->c20_dknee, 0, 0U,
    1U, 0U, 1, 2), false);
  sf_mex_setcell(c20_y, 2, c20_d_y);
  c20_e_y = NULL;
  sf_mex_assign(&c20_e_y, sf_mex_create("y", *chartInstance->c20_knee, 0, 0U, 1U,
    0U, 1, 2), false);
  sf_mex_setcell(c20_y, 3, c20_e_y);
  c20_f_y = NULL;
  sf_mex_assign(&c20_f_y, sf_mex_create("y",
    &chartInstance->c20_is_active_c20_sliding_controller2, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c20_y, 4, c20_f_y);
  sf_mex_assign(&c20_st, c20_y, false);
  return c20_st;
}

static void set_sim_state_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance, const mxArray *c20_st)
{
  const mxArray *c20_u;
  c20_u = sf_mex_dup(c20_st);
  c20_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c20_u, 0)),
                       "ankle", *chartInstance->c20_ankle);
  c20_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c20_u, 1)),
                       "danke", *chartInstance->c20_danke);
  c20_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c20_u, 2)),
                       "dknee", *chartInstance->c20_dknee);
  c20_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c20_u, 3)),
                       "knee", *chartInstance->c20_knee);
  chartInstance->c20_is_active_c20_sliding_controller2 = c20_c_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c20_u, 4)),
     "is_active_c20_sliding_controller2");
  sf_mex_destroy(&c20_u);
  sf_mex_destroy(&c20_st);
}

static void sf_gateway_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance)
{
  chartInstance->c20_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c20_eML_blk_kernel(chartInstance, *chartInstance->c20_q,
                     *chartInstance->c20_qd, *chartInstance->c20_knee,
                     *chartInstance->c20_dknee, *chartInstance->c20_ankle,
                     *chartInstance->c20_danke);
  c20_do_animation_call_c20_sliding_controller2(chartInstance);
}

static void mdl_start_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance)
{
}

static void mdl_terminate_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance)
{
  cudaError_t c20_errCode;
  c20_errCode = cudaGetLastError();
  if (c20_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c20_errCode, (char_T *)cudaGetErrorName
                       (c20_errCode), (char_T *)cudaGetErrorString(c20_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c20_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance)
{
}

static void initSimStructsc20_sliding_controller2
  (SFc20_sliding_controller2InstanceStruct *chartInstance)
{
}

const mxArray *sf_c20_sliding_controller2_get_eml_resolved_functions_info()
{
  const mxArray *c20_nameCaptureInfo = NULL;
  const char_T *c20_data[4] = {
    "789cc553cb4ac34014bd915adc545df90b2e04c7baeabe2a88580a0d6e44e224b969c6cc432653dbbaf10fec57f80ffe8e7b3fc2246dfa088688c57a20dc399c"
    "cc3df71e18b02eaf2d00d84d3efb05a055870c8d6981fd59dd82551475aba4e6d886dacabd54ef267e9319f7943438325322a9c0f94d5f0926a934f6f8114163",
    "acf813fa9912308e3613d85b269d94898b25694e52293db743f4a2de40800ee3c5847c996479a4b82fd9b756914711c53c8affe57ea35ffae5fd0f2afc723d50"
    "7a48b5ef444c32410df36287637ffdbd73df7ae91c53c5570397e3c2ef7d4d3fbbd46f55bf3dbf23a11248243521950c795f713fa0da251e35491ace3026b1f6",
    "08156ee00c298f509324204e5df27d66c722ed5b95dbde0ff7287b3f0dd8c9eadbeb11dda4dfc7e1a7b549bf1cffe5b7a9f777753266cd67f61045a7ad76a7e9"
    "bade8d6fce1673742b7caae68012fed7fdbf00b09967db", "" };

  c20_nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&c20_data[0], 1616U, &c20_nameCaptureInfo);
  return c20_nameCaptureInfo;
}

static void c20_eML_blk_kernel(SFc20_sliding_controller2InstanceStruct
  *chartInstance, real_T c20_b_q[2], real_T c20_b_qd[2], real_T c20_b_knee[2],
  real_T c20_b_dknee[2], real_T c20_b_ankle[2], real_T c20_b_danke[2])
{
  real_T c20_a;
  real_T c20_b_a;
  c20_b_knee[0] = -0.324 * muDoubleScalarSin(c20_b_q[0]);
  c20_b_knee[1] = -0.324 * muDoubleScalarCos(c20_b_q[0]);
  c20_a = -0.324 * c20_b_qd[0];
  c20_b_dknee[0] = c20_a * muDoubleScalarCos(c20_b_q[0]);
  c20_b_dknee[1] = c20_a * -muDoubleScalarSin(c20_b_q[0]);
  c20_b_a = -0.39 * (c20_b_qd[0] + c20_b_qd[1]);
  c20_b_ankle[0] = c20_b_knee[0] + -0.39 * muDoubleScalarSin(c20_b_q[0] +
    c20_b_q[1]);
  c20_b_ankle[1] = c20_b_knee[1] + -0.39 * muDoubleScalarCos(c20_b_q[0] +
    c20_b_q[1]);
  c20_b_danke[0] = c20_b_dknee[0] + c20_b_a * muDoubleScalarCos(c20_b_q[0] +
    c20_b_q[1]);
  c20_b_danke[1] = c20_b_dknee[1] + c20_b_a * -muDoubleScalarSin(c20_b_q[0] +
    c20_b_q[1]);
}

static void c20_emlrt_marshallIn(SFc20_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c20_b_ankle, const char_T *c20_identifier,
  real_T c20_y[2])
{
  emlrtMsgIdentifier c20_thisId;
  c20_thisId.fIdentifier = const_cast<const char_T *>(c20_identifier);
  c20_thisId.fParent = NULL;
  c20_thisId.bParentIsCell = false;
  c20_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c20_b_ankle), &c20_thisId,
    c20_y);
  sf_mex_destroy(&c20_b_ankle);
}

static void c20_b_emlrt_marshallIn(SFc20_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c20_u, const emlrtMsgIdentifier *c20_parentId,
  real_T c20_y[2])
{
  real_T c20_dv[2];
  int32_T c20_i;
  sf_mex_import(c20_parentId, sf_mex_dup(c20_u), c20_dv, 1, 0, 0U, 1, 0U, 1, 2);
  for (c20_i = 0; c20_i < 2; c20_i++) {
    c20_y[c20_i] = c20_dv[c20_i];
  }

  sf_mex_destroy(&c20_u);
}

static uint8_T c20_c_emlrt_marshallIn(SFc20_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c20_b_is_active_c20_sliding_controller2, const
  char_T *c20_identifier)
{
  emlrtMsgIdentifier c20_thisId;
  uint8_T c20_y;
  c20_thisId.fIdentifier = const_cast<const char_T *>(c20_identifier);
  c20_thisId.fParent = NULL;
  c20_thisId.bParentIsCell = false;
  c20_y = c20_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c20_b_is_active_c20_sliding_controller2), &c20_thisId);
  sf_mex_destroy(&c20_b_is_active_c20_sliding_controller2);
  return c20_y;
}

static uint8_T c20_d_emlrt_marshallIn(SFc20_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c20_u, const emlrtMsgIdentifier *c20_parentId)
{
  uint8_T c20_b_u;
  uint8_T c20_y;
  sf_mex_import(c20_parentId, sf_mex_dup(c20_u), &c20_b_u, 1, 3, 0U, 0, 0U, 0);
  c20_y = c20_b_u;
  sf_mex_destroy(&c20_u);
  return c20_y;
}

static void init_dsm_address_info(SFc20_sliding_controller2InstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc20_sliding_controller2InstanceStruct
  *chartInstance)
{
  chartInstance->c20_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c20_q = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c20_knee = (real_T (*)[2])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
  chartInstance->c20_dknee = (real_T (*)[2])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 2);
  chartInstance->c20_qd = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 1);
  chartInstance->c20_ankle = (real_T (*)[2])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 3);
  chartInstance->c20_danke = (real_T (*)[2])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 4);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c20_sliding_controller2_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1880680695U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1680452377U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3479659674U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3127653308U);
}

mxArray *sf_c20_sliding_controller2_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c20_sliding_controller2_jit_fallback_info(void)
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

mxArray *sf_c20_sliding_controller2_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c20_sliding_controller2(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPiCOYGFgYAPSHEDMxAABrFA+I5TNCBdngYsrAHFJZUEqSLy4KNkzBUjnJeaC+Ym"
    "lFZ55aflg8y0YEOazYTGfEcl8Tqg4BHywp0y/jAO6fhYC/hOA8hPzsnNSoeEDC6eB84cS2f5IAX"
    "pk8PhDgXx/ZOelDh5/iID9YUDAHywo/mBhAHmBOu7HDEfS9EPzPQH3K6LFA4ifWRyfmFySWZYan"
    "2xkEF+ck5mSmZcen5yfV1KUn5OTWmSEZD4IAACGpiyw"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c20_sliding_controller2_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sQh5nvZHhAQaTmI03z90vbC";
}

static void sf_opaque_initialize_c20_sliding_controller2(void *chartInstanceVar)
{
  initialize_params_c20_sliding_controller2
    ((SFc20_sliding_controller2InstanceStruct*) chartInstanceVar);
  initialize_c20_sliding_controller2((SFc20_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c20_sliding_controller2(void *chartInstanceVar)
{
  enable_c20_sliding_controller2((SFc20_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c20_sliding_controller2(void *chartInstanceVar)
{
  disable_c20_sliding_controller2((SFc20_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c20_sliding_controller2(void *chartInstanceVar)
{
  sf_gateway_c20_sliding_controller2((SFc20_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c20_sliding_controller2(SimStruct*
  S)
{
  return get_sim_state_c20_sliding_controller2
    ((SFc20_sliding_controller2InstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c20_sliding_controller2(SimStruct* S, const
  mxArray *st)
{
  set_sim_state_c20_sliding_controller2((SFc20_sliding_controller2InstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_cleanup_runtime_resources_c20_sliding_controller2(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc20_sliding_controller2InstanceStruct*) chartInstanceVar
      )->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller2_optimization_info();
    }

    mdl_cleanup_runtime_resources_c20_sliding_controller2
      ((SFc20_sliding_controller2InstanceStruct*) chartInstanceVar);
    ((SFc20_sliding_controller2InstanceStruct*) chartInstanceVar)->
      ~SFc20_sliding_controller2InstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c20_sliding_controller2(void *chartInstanceVar)
{
  mdl_start_c20_sliding_controller2((SFc20_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c20_sliding_controller2(void
  *chartInstanceVar)
{
  mdl_terminate_c20_sliding_controller2((SFc20_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc20_sliding_controller2((SFc20_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c20_sliding_controller2(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c20_sliding_controller2
      ((SFc20_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc20_sliding_controller2
      ((SFc20_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c20_sliding_controller2_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [19] = {
    "eNrtV81u20YQpgQ5SIA28CFALwGSFAjao5EiQHtpbFMSIsCunVJOgyKAsVqOxIWWu+z+0HabJyi",
    "Qe9F36XvkGXJJgR7bQ2dJWpYpkorsJnWL0KDkJb/5dr6Z2dmV1xrsenjdxPuXW553Db+v49328m",
    "utGLfm7vx5x/usGL9EI2HjfaJIrL3GS5AYvgUtuTVMioEYy0oYE2NQIChiE6lMHZtmseVMTPtWU",
    "Menv4sYjYJIWh5uoy0J9wQ/QbbEmn3k6TIF1PQBQhMpaSdRn5PJzGNljvwI6FTbuEmCBhPYxLml",
    "dy03LOHQOwY6ENoQ9Fif+RYYYsA3x7UynVIdnAJlnHBGRKXaiOgAEgywgYMkxM89a1BUGUYjosw",
    "2RCQFvcOmGacUUOZkGl+MmCBGKkZ4L+a+M1z0bZ+jP7syBN4QEPRtWwGZJpIJU5//oI9Ke4KMOH",
    "RhZCf1bAH8YF3ynzI4AlUbt7EvU1BkAnuidtIsIL3jLFuzKlmEGRbDU6K2KOZPQ1hbvVg5OiCYJ",
    "xiiRR0MMpEDPVQsxfDWstl44Cpz2ZKxcZ5svQyWsfVSaMrCjK1PhU8417WwoUx2IAWesXaJIc2w",
    "nLUapzULhxID7Mq7fjVYwTDxBcyXImSV6UpLgKzvfION5TySWm1k7GPxdnd2Fl8vwgbCgBoTClV",
    "dQBGmAWOWhbeeLWTa5R6B6JXJ3KsC5xWyDOXpsRXdI6mmGJOGJnImwWW0FhjrCeYSV8KBxkXTBH",
    "O5XIajhEYQugbDOOziskFsRUy0a21buO5SZk66oKliSUVWLa46bEM9V1AnCRyIqZBHoq9kHBQ9P",
    "g8vAFYbUYKJyTb2L3XSx9mrUuH2sw3vbD/76C32s1O78vfnczytCh5v7rs87432eXy7NG8b/1qt",
    "3G5zzu7j0jydkp3DreP9+q8/7r948/Pop1fhi+e//vbnsvlbC/O3sv+d3fW11fb/m8X49mmjnS2",
    "cdKFeHfbxnF+dCv5P5vjXi7F+Ej0U6fePo60nZBgPNr748auNdORnfM86zf6ulfw9fX7XdXyssq",
    "w+FR2ExcHEjYnNt2vH/+Wcv9eWxONG8Ty/fn90Ofvbm2X7zhJ968WYiCmHUv3+ezo+vbCOEIVcH",
    "R13L65jioeGK6Pj1ma5P1Tp6JzT0fGchH/G/8U4rmafz/9sif/3Snm4l50XD4nbheCQPtg41JyF",
    "uIUcUimMkpyDelDR9y/aR1e1896z3X/Fzw927z7vb3Mual/QrnPJc9j7srusvlXPh1cN37QfeCX",
    "8+hXWcdlz+7vGv/JWO1/fKcZfz35C+xHjYcWvqeI1/jQaV739H9Tp30fQxWc=",
    ""
  };

  static char newstr [1337] = "";
  newstr[0] = '\0';
  for (i = 0; i < 19; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c20_sliding_controller2(SimStruct *S)
{
  const char* newstr = sf_c20_sliding_controller2_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(636746986U));
  ssSetChecksum1(S,(1653272444U));
  ssSetChecksum2(S,(2086983803U));
  ssSetChecksum3(S,(4223507036U));
}

static void mdlRTW_c20_sliding_controller2(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c20_sliding_controller2(SimStruct *S)
{
  SFc20_sliding_controller2InstanceStruct *chartInstance;
  chartInstance = (SFc20_sliding_controller2InstanceStruct *)utMalloc(sizeof
    (SFc20_sliding_controller2InstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc20_sliding_controller2InstanceStruct));
  chartInstance = new (chartInstance) SFc20_sliding_controller2InstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c20_sliding_controller2;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c20_sliding_controller2;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c20_sliding_controller2;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c20_sliding_controller2;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c20_sliding_controller2;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c20_sliding_controller2;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c20_sliding_controller2;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c20_sliding_controller2;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c20_sliding_controller2;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c20_sliding_controller2;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c20_sliding_controller2;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c20_sliding_controller2;
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
    chartInstance->c20_JITStateAnimation,
    chartInstance->c20_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c20_sliding_controller2(chartInstance);
}

void c20_sliding_controller2_method_dispatcher(SimStruct *S, int_T method, void *
  data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c20_sliding_controller2(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c20_sliding_controller2(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c20_sliding_controller2(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c20_sliding_controller2_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
