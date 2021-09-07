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
    "789cc593cd4ac34014856fa516375537fa188e2d08dd5745118bd0e246244e929b66ccfcc8646a5b372ebbf4b1f475dcb8706592364d1b0c118bf542b8393999"
    "f9ee1c18a89c5f5600603b7a3e9e01ce6a90547dda6077d63760b9f27ea5a0a7b509d5a575b1ff1ef15e66da51d2e0c84c85a402e72b5d2598a4d2f4c60f081a",
    "43c51fd14d1c8f71ec3181dd45d18995385db0e622b6e2f7b68f4ed01d08d07e984dc8174592475c7705e7ad96e491af7c1ef9ff52dee897bc74fffd125eea7b"
    "4a0fa976ad804926a8614e6871ecaf7eee945b2b9c63eab86a6073cc786f2bf268216fd9bf39b925be124824353e950c795f71d7a3da260e35511ad63024a176",
    "0815b6670d290f509328204e6d2295957c35181af27d800762c629cb71e787e72aba4f75d84a7a6bef88ae9337f97c6dae9397d67ff1d6751f2f0ec7acf1c4ee"
    "83a0d96a771ab6ed5cbbe6389be3aa8453360714e8bfdeff0b89616e21", "" };

  c19_nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&c19_data[0], 1632U, &c19_nameCaptureInfo);
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
    "eNrtV81u20YQpgQ5SIA08CFALwGa9JIeUsBtUaBBgNQ2JSFC7dgp5TTIxVgvR+JCy112f2g77xD",
    "k2vcoeumLNOc8Qd4gnSVpWaZIKrKb1C1Cg5KX/Obb+WZmZ1dea7Dt4XUD799uet4V/L6Kd9vLr5",
    "Vi3Jq58+cd724xfolGwsa7RJFYe42XIDH8DFpya5gUAzGSlTAmRqBAUMQmUpk6Ns1iy5mY9K2gj",
    "k//EjEaBZG0PNxEWxLuCH6MbIk1u8jTZQqo6QOEJlLSjqM+J+Opx8oc+hHQibZxkwQNJrCJc0tv",
    "W25YwqF3BHQgtCHosT71LTDEgG+OamU6pTo4Aco44YyISrUR0QEkGGADe0mInzvWoKgyjEZEmU2",
    "ISAp6i00yTimgzMk0vjhgghipGOG9mPvOcN63XY7+bMsQeENA0LdNBWSSSCZMff6DPirtCXLAoQ",
    "sHdlzPFsCv1iX/KYNDULVxG/kyBUXGsCNqJ80C0jvKsjWtknmYYTE8JWqDYv40hLXVi5WjA4J5g",
    "iFa1MEgEznQQ8VSDG8tm40HrjIXLRkb58nWi2AZWy+FpixM2fpU+IRzXQsbymQLUuAZa5cY0gzL",
    "WatxWrNwKDHArrzrV4MVDBNfwHwpQlaZrrQEyPrOY2wsZ5HUaiNjH4u3u7U1/3oeNhAG1IhQqOo",
    "CijANGLMsvPVsIdMu9whEr0zmXhU4r5BFKE+PrOgeSjXBmDQ0kVMJLqO1wFiPMZe4EvY0LpommM",
    "vlIhwlNILQNRjGYRuXDWIrYqJda9vAdZcyc9wFTRVLKrJqcdVhG+q5gjpOYE9MhDwUfSXjoOjxe",
    "XgBsNqIEkyMN7F/qeM+zl6VCrefrXmn+9n199jPTuzK31/N8LQqeLyZ7/K819pn8e3SvG38a7Vy",
    "u/UZu89K83RKdg63iveL35//8dNff776+u6be6+GD94tmr81N38r+9/ZXV1Zbv+/UYxvnTTa6cJ",
    "J5+rVYR/N+NWp4P98hn+1GOsn0fciff4o2nhChvFg7bsX99fSAz/je9Zp9nel5O/J89uu42OVZf",
    "Wp6CAsDiZuTGy+XTv+H2b8vbIgHteK5/n19seL2d9aL9t3FuhbLcZETDiU6vff0/HluXWEKOTy6",
    "Lh9fh0TPDRcGh0318v9oUpH54yOjuck/DP+z8dxOft8/mcL/L9TysOd7Ly4T9wuBPv0m/v7mrMQ",
    "t5B9KoVRknNQ31b0/fP20WXtvI9s91/x85Pdh8/7+5yL2ue061zwHPax7C6qb9nz4WXDN+0HXgm",
    "/eol1XPTc/qHxr73lztdfFOOH05/QfsR4WPFrqniNP41GVW//B3X6N/M9w18=",
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
  ssSetChecksum0(S,(3042620282U));
  ssSetChecksum1(S,(2411386699U));
  ssSetChecksum2(S,(753018669U));
  ssSetChecksum3(S,(4282078351U));
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
