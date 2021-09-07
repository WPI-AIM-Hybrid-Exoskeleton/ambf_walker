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
    "789cc593cd4ac34014856fa516375537fa188e2d08dd5745118bd0e246244e929b66ccfcc8646a5b372ebbf4b1f475dcb8706592364d1b0c118bf542b8393999"
    "f9ee1c18a89c5f5600603b7a3e9e01ce6a90547dda6077d63760b9f27ea5a0a7b509d5a575b1ff1ef15e66da51d2e0c84c85a402e72b5d2598a4d2f4c60f081a",
    "43c51fd14d1c8f71ec3181dd45d18995385db0e622b6e2f7b68f4ed01d08d07e984dc8174592475c7705e7ad96e491af7c1ef9ff52dee897bc74fffd125eea7b"
    "4a0fa976ad804926a8614e6871ecaf7eee945b2b9c63eab86a6073cc786f2bf268216fd9bf39b925be124824353e950c795f71d7a3da260e35511ad63024a176",
    "0815b6670d290f509328204e6d2295957c35181af27d800762c629cb71e787e72aba4f75d84a7a6bef88ae9337f97c6dae9397d67ff1d6751f2f0ec7acf1c4ee"
    "83a0d96a771ab6ed5cbbe6389be3aa8453360714e8bfdeff0b89616e21", "" };

  c20_nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&c20_data[0], 1632U, &c20_nameCaptureInfo);
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
    "eNrtV81u20YQpgQ5SIA28CFALgGa5JIeGsBIEaBFgdY2JSFC7dop5STIxVgvR+JCy11mf2g771D",
    "k2vcoesmLpOc+Qd4gmSVpWaZIKrKb1ClKg5KX/Obb+WZmZ1dea7Dt4XUd799veN4V/L6Kd9vLr5",
    "Vi3Jq58+cd714x/g2NhI13iSKx9hovQWL4FbTk1jApBmIkK2FMjECBoIhNpDJ1bJrFljMx6VtBH",
    "Z9+GjEaBZG0PNxEWxLuCH6MbIk1u8jTZQqo6QOEJlLSjqM+J+Opx8oc+hHQibZxkwQNJrCJc0tv",
    "W25YwqF3BHQgtCHosT71LTDEgG+OamU6pTo4Aco44YyISrUR0QEkGGADe0mInzvWoKgyjEZEmU2",
    "ISAp6i00yTimgzMk0vjhgghipGOG9mPvOcN63XY7+bMsQeENA0LdNBWSSSCZMff6DPirtCXLAoQ",
    "sHdlzPFsAL65L/hMEhqNq4jXyZgiJj2BG1k2YB6R1l2ZpWyTzMsBieELVBMX8awtrqxcrRAcE8w",
    "RAt6mCQiRzooWIphreWzcYDV5mLloyN82TrRbCMrZdCUxambH0qfMK5roUNZbIFKfCMtUsMaYbl",
    "rNU4rVk4lBhgV971q8EKhokvYL4UIatMV1oCZH3nF2wsZ5HUaiNjH4u3u7U1/3oeNhAG1IhQqOo",
    "CijANGLMsvPVsIdMu9whEr0zmXhU4r5BFKE+PrOgeSjXBmDQ0kVMJLqO1wFiPMZe4EvY0LpommM",
    "vlIhwlNILQNRjGYRuXDWIrYqJda9vAdZcyc9wFTRVLKrJqcdVhG+q5gjpOYE9MhDwUfSXjoOjxe",
    "XgBsNqIEkyMN7F/qeM+zl6VCrefrXmn+9kXH7CfndiVv7+e4WlV8Hgz3+V5r7XP4tuledv412rl",
    "duszdl+W5umU7BxuFe+Xfzz/8+c3r1/dv/f3N6+GP7xbNH9rbv5W9r+zu7qy3P5/vRjfOmm004W",
    "TztWrwz6a8atTwX9zhn+1GOvH0UORPn8UbTwmw3iw9u3L79fSAz/je9Zp9nel5O/J89uu42OVZf",
    "Wp6CAsDiZuTGy+XTv+72b8vbIgHteK5/n19qeL2d9aL9t3FuhbLcZETDiU6vff03H33DpCFHJ5d",
    "Nw+v44JHhoujY4b6+X+UKWjc0ZHx3MS/hn/5+O4nH0+/7MF/t8p5eFOdl7cJ24Xgn36YG1fcxbi",
    "FrJPpTBKcg7qQUXfP28fXdbO+8R2n4uf/9t9/Lx/yLmofU67zgXPYZ/K7qL6lj0fXjZ8037glfC",
    "rl1jHRc/tHxv/l7fc+fqrYvzj9Ce0HzEeVvyaKl7jT6NR1dv/QJ2+B7Wew1c=",
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
  ssSetChecksum0(S,(3042620282U));
  ssSetChecksum1(S,(2411386699U));
  ssSetChecksum2(S,(753018669U));
  ssSetChecksum3(S,(4282078351U));
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
