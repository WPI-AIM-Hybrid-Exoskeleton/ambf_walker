/* Include files */

#include "sliding_controller2_sfun.h"
#include "c10_sliding_controller2.h"
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
static void initialize_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance);
static void initialize_params_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance);
static void enable_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance);
static void disable_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance);
static void c10_do_animation_call_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance);
static void ext_mode_exec_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance);
static const mxArray *get_sim_state_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance);
static void set_sim_state_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance, const mxArray *c10_st);
static void sf_gateway_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance);
static void mdl_start_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance);
static void mdl_terminate_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance);
static void initSimStructsc10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance);
static void c10_eML_blk_kernel(SFc10_sliding_controller2InstanceStruct
  *chartInstance, real_T c10_b_q[2], real_T c10_b_qd[2], real_T c10_b_knee[2],
  real_T c10_b_dknee[2], real_T c10_b_ankle[2], real_T c10_b_danke[2]);
static void c10_emlrt_marshallIn(SFc10_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c10_b_ankle, const char_T *c10_identifier,
  real_T c10_y[2]);
static void c10_b_emlrt_marshallIn(SFc10_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c10_u, const emlrtMsgIdentifier *c10_parentId,
  real_T c10_y[2]);
static uint8_T c10_c_emlrt_marshallIn(SFc10_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c10_b_is_active_c10_sliding_controller2, const
  char_T *c10_identifier);
static uint8_T c10_d_emlrt_marshallIn(SFc10_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c10_u, const emlrtMsgIdentifier *c10_parentId);
static void init_dsm_address_info(SFc10_sliding_controller2InstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc10_sliding_controller2InstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c10_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c10_is_active_c10_sliding_controller2 = 0U;
  cudaGetLastError();
}

static void initialize_params_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance)
{
}

static void enable_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c10_do_animation_call_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance)
{
  const mxArray *c10_b_y = NULL;
  const mxArray *c10_c_y = NULL;
  const mxArray *c10_d_y = NULL;
  const mxArray *c10_e_y = NULL;
  const mxArray *c10_f_y = NULL;
  const mxArray *c10_st;
  const mxArray *c10_y = NULL;
  c10_st = NULL;
  c10_y = NULL;
  sf_mex_assign(&c10_y, sf_mex_createcellmatrix(5, 1), false);
  c10_b_y = NULL;
  sf_mex_assign(&c10_b_y, sf_mex_create("y", *chartInstance->c10_ankle, 0, 0U,
    1U, 0U, 1, 2), false);
  sf_mex_setcell(c10_y, 0, c10_b_y);
  c10_c_y = NULL;
  sf_mex_assign(&c10_c_y, sf_mex_create("y", *chartInstance->c10_danke, 0, 0U,
    1U, 0U, 1, 2), false);
  sf_mex_setcell(c10_y, 1, c10_c_y);
  c10_d_y = NULL;
  sf_mex_assign(&c10_d_y, sf_mex_create("y", *chartInstance->c10_dknee, 0, 0U,
    1U, 0U, 1, 2), false);
  sf_mex_setcell(c10_y, 2, c10_d_y);
  c10_e_y = NULL;
  sf_mex_assign(&c10_e_y, sf_mex_create("y", *chartInstance->c10_knee, 0, 0U, 1U,
    0U, 1, 2), false);
  sf_mex_setcell(c10_y, 3, c10_e_y);
  c10_f_y = NULL;
  sf_mex_assign(&c10_f_y, sf_mex_create("y",
    &chartInstance->c10_is_active_c10_sliding_controller2, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c10_y, 4, c10_f_y);
  sf_mex_assign(&c10_st, c10_y, false);
  return c10_st;
}

static void set_sim_state_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance, const mxArray *c10_st)
{
  const mxArray *c10_u;
  c10_u = sf_mex_dup(c10_st);
  c10_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c10_u, 0)),
                       "ankle", *chartInstance->c10_ankle);
  c10_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c10_u, 1)),
                       "danke", *chartInstance->c10_danke);
  c10_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c10_u, 2)),
                       "dknee", *chartInstance->c10_dknee);
  c10_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c10_u, 3)),
                       "knee", *chartInstance->c10_knee);
  chartInstance->c10_is_active_c10_sliding_controller2 = c10_c_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c10_u, 4)),
     "is_active_c10_sliding_controller2");
  sf_mex_destroy(&c10_u);
  sf_mex_destroy(&c10_st);
}

static void sf_gateway_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance)
{
  chartInstance->c10_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c10_eML_blk_kernel(chartInstance, *chartInstance->c10_q,
                     *chartInstance->c10_qd, *chartInstance->c10_knee,
                     *chartInstance->c10_dknee, *chartInstance->c10_ankle,
                     *chartInstance->c10_danke);
  c10_do_animation_call_c10_sliding_controller2(chartInstance);
}

static void mdl_start_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance)
{
}

static void mdl_terminate_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance)
{
  cudaError_t c10_errCode;
  c10_errCode = cudaGetLastError();
  if (c10_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c10_errCode, (char_T *)cudaGetErrorName
                       (c10_errCode), (char_T *)cudaGetErrorString(c10_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c10_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance)
{
}

static void initSimStructsc10_sliding_controller2
  (SFc10_sliding_controller2InstanceStruct *chartInstance)
{
}

const mxArray *sf_c10_sliding_controller2_get_eml_resolved_functions_info()
{
  const mxArray *c10_nameCaptureInfo = NULL;
  const char_T *c10_data[4] = {
    "789cc553cb4ac34014bd915adc545df90b2e04c7baeabe2a88580a0d6e44e224b969c6cc432653dbbaf10fec57f80ffe8e7b3fc2246dfa088688c57a20dc399c"
    "cc3df71e18b02eaf2d00d84d3efb05a055870c8d6981fd59dd82551475aba4e6d886dacabd54ef267e9319f7943438325322a9c0f94d5f0926a934f6f8114163",
    "acf813fa9912308e3613d85b269d94898b25694e52293db743f4a2de40800ee3c5847c996479a4b82fd9b756914711c53c8affe57ea35ffae5fd0f2afc723d50"
    "7a48b5ef444c32410df36287637ffdbd73df7ae91c53c5570397e3c2ef7d4d3fbbd46f55bf3dbf23a11248243521950c795f713fa0da251e35491ace3026b1f6",
    "08156ee00c298f509324204e5df27d66c722ed5b95dbde0ff7287b3f0dd8c9eadbeb11dda4dfc7e1a7b549bf1cffe5b7a9f777753266cd67f61045a7ad76a7e9"
    "bade8d6fce1673742b7caae68012fed7fdbf00b09967db", "" };

  c10_nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&c10_data[0], 1616U, &c10_nameCaptureInfo);
  return c10_nameCaptureInfo;
}

static void c10_eML_blk_kernel(SFc10_sliding_controller2InstanceStruct
  *chartInstance, real_T c10_b_q[2], real_T c10_b_qd[2], real_T c10_b_knee[2],
  real_T c10_b_dknee[2], real_T c10_b_ankle[2], real_T c10_b_danke[2])
{
  real_T c10_a;
  real_T c10_b_a;
  c10_b_knee[0] = -0.324 * muDoubleScalarSin(c10_b_q[0]);
  c10_b_knee[1] = -0.324 * muDoubleScalarCos(c10_b_q[0]);
  c10_a = -0.324 * c10_b_qd[0];
  c10_b_dknee[0] = c10_a * muDoubleScalarCos(c10_b_q[0]);
  c10_b_dknee[1] = c10_a * -muDoubleScalarSin(c10_b_q[0]);
  c10_b_a = -0.39 * (c10_b_qd[0] + c10_b_qd[1]);
  c10_b_ankle[0] = c10_b_knee[0] + -0.39 * muDoubleScalarSin(c10_b_q[0] +
    c10_b_q[1]);
  c10_b_ankle[1] = c10_b_knee[1] + -0.39 * muDoubleScalarCos(c10_b_q[0] +
    c10_b_q[1]);
  c10_b_danke[0] = c10_b_dknee[0] + c10_b_a * muDoubleScalarCos(c10_b_q[0] +
    c10_b_q[1]);
  c10_b_danke[1] = c10_b_dknee[1] + c10_b_a * -muDoubleScalarSin(c10_b_q[0] +
    c10_b_q[1]);
}

static void c10_emlrt_marshallIn(SFc10_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c10_b_ankle, const char_T *c10_identifier,
  real_T c10_y[2])
{
  emlrtMsgIdentifier c10_thisId;
  c10_thisId.fIdentifier = const_cast<const char_T *>(c10_identifier);
  c10_thisId.fParent = NULL;
  c10_thisId.bParentIsCell = false;
  c10_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c10_b_ankle), &c10_thisId,
    c10_y);
  sf_mex_destroy(&c10_b_ankle);
}

static void c10_b_emlrt_marshallIn(SFc10_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c10_u, const emlrtMsgIdentifier *c10_parentId,
  real_T c10_y[2])
{
  real_T c10_dv[2];
  int32_T c10_i;
  sf_mex_import(c10_parentId, sf_mex_dup(c10_u), c10_dv, 1, 0, 0U, 1, 0U, 1, 2);
  for (c10_i = 0; c10_i < 2; c10_i++) {
    c10_y[c10_i] = c10_dv[c10_i];
  }

  sf_mex_destroy(&c10_u);
}

static uint8_T c10_c_emlrt_marshallIn(SFc10_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c10_b_is_active_c10_sliding_controller2, const
  char_T *c10_identifier)
{
  emlrtMsgIdentifier c10_thisId;
  uint8_T c10_y;
  c10_thisId.fIdentifier = const_cast<const char_T *>(c10_identifier);
  c10_thisId.fParent = NULL;
  c10_thisId.bParentIsCell = false;
  c10_y = c10_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c10_b_is_active_c10_sliding_controller2), &c10_thisId);
  sf_mex_destroy(&c10_b_is_active_c10_sliding_controller2);
  return c10_y;
}

static uint8_T c10_d_emlrt_marshallIn(SFc10_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c10_u, const emlrtMsgIdentifier *c10_parentId)
{
  uint8_T c10_b_u;
  uint8_T c10_y;
  sf_mex_import(c10_parentId, sf_mex_dup(c10_u), &c10_b_u, 1, 3, 0U, 0, 0U, 0);
  c10_y = c10_b_u;
  sf_mex_destroy(&c10_u);
  return c10_y;
}

static void init_dsm_address_info(SFc10_sliding_controller2InstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc10_sliding_controller2InstanceStruct
  *chartInstance)
{
  chartInstance->c10_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c10_q = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c10_knee = (real_T (*)[2])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
  chartInstance->c10_dknee = (real_T (*)[2])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 2);
  chartInstance->c10_qd = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 1);
  chartInstance->c10_ankle = (real_T (*)[2])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 3);
  chartInstance->c10_danke = (real_T (*)[2])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 4);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c10_sliding_controller2_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1880680695U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1680452377U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3479659674U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3127653308U);
}

mxArray *sf_c10_sliding_controller2_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c10_sliding_controller2_jit_fallback_info(void)
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

mxArray *sf_c10_sliding_controller2_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c10_sliding_controller2(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPiCOYGFgYAPSHEDMxAABrFA+I5TNCBdngYsrAHFJZUEqSLy4KNkzBUjnJeaC+Ym"
    "lFZ55aflg8y0YEOazYTGfEcl8Tqg4BHywp0y/jAO6fhYC/hOA8hPzsnNSoeEDC6eB84cS2f5IAX"
    "pk8PhDgXx/ZOelDh5/iID9YUDAHywo/mBhAHmBOu7HDEfS9EPzPQH3K6LFA4ifWRyfmFySWZYan"
    "2xoEF+ck5mSmZcen5yfV1KUn5OTWmSEZD4IAACGgSyv"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c10_sliding_controller2_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sQh5nvZHhAQaTmI03z90vbC";
}

static void sf_opaque_initialize_c10_sliding_controller2(void *chartInstanceVar)
{
  initialize_params_c10_sliding_controller2
    ((SFc10_sliding_controller2InstanceStruct*) chartInstanceVar);
  initialize_c10_sliding_controller2((SFc10_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c10_sliding_controller2(void *chartInstanceVar)
{
  enable_c10_sliding_controller2((SFc10_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c10_sliding_controller2(void *chartInstanceVar)
{
  disable_c10_sliding_controller2((SFc10_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c10_sliding_controller2(void *chartInstanceVar)
{
  sf_gateway_c10_sliding_controller2((SFc10_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c10_sliding_controller2(SimStruct*
  S)
{
  return get_sim_state_c10_sliding_controller2
    ((SFc10_sliding_controller2InstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c10_sliding_controller2(SimStruct* S, const
  mxArray *st)
{
  set_sim_state_c10_sliding_controller2((SFc10_sliding_controller2InstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_cleanup_runtime_resources_c10_sliding_controller2(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc10_sliding_controller2InstanceStruct*) chartInstanceVar
      )->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller2_optimization_info();
    }

    mdl_cleanup_runtime_resources_c10_sliding_controller2
      ((SFc10_sliding_controller2InstanceStruct*) chartInstanceVar);
    ((SFc10_sliding_controller2InstanceStruct*) chartInstanceVar)->
      ~SFc10_sliding_controller2InstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c10_sliding_controller2(void *chartInstanceVar)
{
  mdl_start_c10_sliding_controller2((SFc10_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c10_sliding_controller2(void
  *chartInstanceVar)
{
  mdl_terminate_c10_sliding_controller2((SFc10_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc10_sliding_controller2((SFc10_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c10_sliding_controller2(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c10_sliding_controller2
      ((SFc10_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc10_sliding_controller2
      ((SFc10_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c10_sliding_controller2_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [19] = {
    "eNrtV81u20YQpgQ5SIA28CFALwHyAxTt0W1QIL20tikJEWDXTiinQVDAWC1H4kLLXWZ/aLvNExT",
    "ovei79D3yDL20QI/NobMkLcsUSUV2krpFaVDykt98O9/M7OzKaw12Pbxu4v3zLc+7ht/X8W57+b",
    "VWjFtzd/68431SjH9CI2HjfaJIrL3GS5AYnoCW3BomxUCMZSWMiTEoEBSxiVSmjk2z2HImpn0rq",
    "OPT30aMRkEkLQ+30ZaEe4KfIFtizT7ydJkCavoAoYmUtJOoz8lk5rEyR34EdKpt3CRBgwls4tzS",
    "u5YblnDoHQMdCG0IeqzPfAsMMeCb41qZTqkOToEyTjgjolJtRHQACQbYwEES4ueeNSiqDKMRUWY",
    "bIpKC3mHTjFMKKHMyjS9GTBAjFSO8F3PfGS76ts/Rn10ZAm8ICPq2rYBME8mEqc9/0EelPUFGHL",
    "owspN6tgBeWJf8pwyOQNXGbezLFBSZwJ6onTQLSO84y9asShZhhsXwlKgtivnTENZWL1aODgjmC",
    "YZoUQeDTORADxVLMby1bDYeuMpctmRsnCdbL4NlbL0UmrIwY+tT4RPOdS1sKJMdSIFnrF1iSDMs",
    "Z63Gac3CocQAu/KuXw1WMEx8AfOlCFllutISIOs732BjOY+kVhsZ+1i83Z2dxdeLsIEwoMaEQlU",
    "XUIRpwJhl4a1nC5l2uUcgemUy96rAeYUsQ3l6bEX3SKopxqShiZxJcBmtBcZ6grnElXCgcdE0wV",
    "wul+EooRGErsEwDru4bBBbERPtWtsWrruUmZMuaKpYUpFVi6sO21DPFdRJAgdiKuSR6CsZB0WPz",
    "8MLgNVGlGBiso39S530cfaqVLj9bMM7288+eIP97NSu/P3pHE+rgseb+y7Pe6N9Ht8uzdvGv1Yr",
    "t9ucs/uwNE+nZOdw63j/9vrPj1/+/uPoh1fhy+9++fWvZfO3FuZvZf87u+trq+3/N4vx7dNGO1s",
    "46UK9OuyjOb86FfwfzfGvF2P9OPpCpM8fRVuPyTAebDz4/suNdORnfM86zf6ulfw9fX7XdXyssq",
    "w+FR2ExcHEjYnNt2vH/3DO32tL4nGjeJ5ff3x9Ofvbm2X7zhJ968WYiCmHUv3+czruX1hHiEKuj",
    "o67F9cxxUPDldFxa7PcH6p0dM7p6HhOwtvxfzGOq9nn8z9b4v+9Uh7uZefFQ+J2ITikn20cas5C",
    "3EIOqRRGSc5BfV7R9y/aR1e1896z3b/Fz//t3n3e3+Rc1L6gXeeS57D3ZXdZfaueD68avmk/8Er",
    "49Sus47Ln9neNf+Wtdr6+U4y/mv2E9iPGw4pfU8Vr/Gk0rnr7H6jTvwFAG8Vm",
    ""
  };

  static char newstr [1337] = "";
  newstr[0] = '\0';
  for (i = 0; i < 19; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c10_sliding_controller2(SimStruct *S)
{
  const char* newstr = sf_c10_sliding_controller2_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(636746986U));
  ssSetChecksum1(S,(1653272444U));
  ssSetChecksum2(S,(2086983803U));
  ssSetChecksum3(S,(4223507036U));
}

static void mdlRTW_c10_sliding_controller2(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c10_sliding_controller2(SimStruct *S)
{
  SFc10_sliding_controller2InstanceStruct *chartInstance;
  chartInstance = (SFc10_sliding_controller2InstanceStruct *)utMalloc(sizeof
    (SFc10_sliding_controller2InstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc10_sliding_controller2InstanceStruct));
  chartInstance = new (chartInstance) SFc10_sliding_controller2InstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c10_sliding_controller2;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c10_sliding_controller2;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c10_sliding_controller2;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c10_sliding_controller2;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c10_sliding_controller2;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c10_sliding_controller2;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c10_sliding_controller2;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c10_sliding_controller2;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c10_sliding_controller2;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c10_sliding_controller2;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c10_sliding_controller2;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c10_sliding_controller2;
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
    chartInstance->c10_JITStateAnimation,
    chartInstance->c10_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c10_sliding_controller2(chartInstance);
}

void c10_sliding_controller2_method_dispatcher(SimStruct *S, int_T method, void *
  data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c10_sliding_controller2(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c10_sliding_controller2(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c10_sliding_controller2(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c10_sliding_controller2_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
