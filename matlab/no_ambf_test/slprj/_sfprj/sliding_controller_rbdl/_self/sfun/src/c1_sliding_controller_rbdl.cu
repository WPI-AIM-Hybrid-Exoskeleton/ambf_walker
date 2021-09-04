/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c1_sliding_controller_rbdl.h"
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
static void initialize_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c1_do_animation_call_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c1_st);
static void sf_gateway_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c1_eML_blk_kernel(SFc1_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c1_b_q[2], real_T c1_b_qd[2], real_T c1_b_knee[2],
  real_T c1_b_dknee[2], real_T c1_b_ankle[2], real_T c1_b_danke[2]);
static void c1_emlrt_marshallIn(SFc1_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c1_b_ankle, const char_T *c1_identifier, real_T
  c1_y[2]);
static void c1_b_emlrt_marshallIn(SFc1_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId,
  real_T c1_y[2]);
static uint8_T c1_c_emlrt_marshallIn(SFc1_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c1_b_is_active_c1_sliding_controller_rbdl, const
  char_T *c1_identifier);
static uint8_T c1_d_emlrt_marshallIn(SFc1_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId);
static void init_dsm_address_info(SFc1_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc1_sliding_controller_rbdlInstanceStruct *
  chartInstance);

/* Function Definitions */
static void initialize_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c1_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c1_is_active_c1_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c1_do_animation_call_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance)
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
    &chartInstance->c1_is_active_c1_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c1_y, 4, c1_f_y);
  sf_mex_assign(&c1_st, c1_y, false);
  return c1_st;
}

static void set_sim_state_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c1_st)
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
  chartInstance->c1_is_active_c1_sliding_controller_rbdl = c1_c_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c1_u, 4)),
     "is_active_c1_sliding_controller_rbdl");
  sf_mex_destroy(&c1_u);
  sf_mex_destroy(&c1_st);
}

static void sf_gateway_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c1_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c1_eML_blk_kernel(chartInstance, *chartInstance->c1_q, *chartInstance->c1_qd, *
                    chartInstance->c1_knee, *chartInstance->c1_dknee,
                    *chartInstance->c1_ankle, *chartInstance->c1_danke);
  c1_do_animation_call_c1_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance)
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

static void mdl_setup_runtime_resources_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc1_sliding_controller_rbdl
  (SFc1_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c1_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c1_nameCaptureInfo = NULL;
  const char_T *c1_data[4] = {
    "789ce593cb4ac34014864fa51637f5b2e94b088e75e5be2a8a5884163722f1243969c6cc452653dbbaf10df4297c171fcb246d7a09868862371e08277ffecc7c"
    "677e18a85d5cd500603b795a2f00e70dc8aa396db03beb1bb05a45bf56d2f3da84facabad4df4b786f33ed6965696ca742a1a4f94a5f4bae50d9fee491c050ac",
    "c513f9991370417d2ea9b72cbaa992674bd65ca456fade09c98b7a4309268c17138a6591e591d67dc979eb157914ab9847f1bf9c37fe212fdfbf55c1cbfd409b"
    "111adf89b8e2122df76247d0e0f7e7ceb98dd239a68eaf87aea005efe3973c2ce5adfab7a7772cd49298421ba2e224065af8011a97796893349c51cc62e33194",
    "6ee08c504464581290409729ed645f2dc5967d1de0819c71aa72dcf9e6b9caee5313b6b2fefeba8febe4e5f55f78ebba8f978713de7ee60f517474dce9b65dd7"
    "bbf1edc9628eeb0a4ed51c50a2ff7aff4fb0e86ac3", "" };

  c1_nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&c1_data[0], 1632U, &c1_nameCaptureInfo);
  return c1_nameCaptureInfo;
}

static void c1_eML_blk_kernel(SFc1_sliding_controller_rbdlInstanceStruct
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

static void c1_emlrt_marshallIn(SFc1_sliding_controller_rbdlInstanceStruct
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

static void c1_b_emlrt_marshallIn(SFc1_sliding_controller_rbdlInstanceStruct
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

static uint8_T c1_c_emlrt_marshallIn(SFc1_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c1_b_is_active_c1_sliding_controller_rbdl, const
  char_T *c1_identifier)
{
  emlrtMsgIdentifier c1_thisId;
  uint8_T c1_y;
  c1_thisId.fIdentifier = const_cast<const char_T *>(c1_identifier);
  c1_thisId.fParent = NULL;
  c1_thisId.bParentIsCell = false;
  c1_y = c1_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c1_b_is_active_c1_sliding_controller_rbdl), &c1_thisId);
  sf_mex_destroy(&c1_b_is_active_c1_sliding_controller_rbdl);
  return c1_y;
}

static uint8_T c1_d_emlrt_marshallIn(SFc1_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId)
{
  uint8_T c1_b_u;
  uint8_T c1_y;
  sf_mex_import(c1_parentId, sf_mex_dup(c1_u), &c1_b_u, 1, 3, 0U, 0, 0U, 0);
  c1_y = c1_b_u;
  sf_mex_destroy(&c1_u);
  return c1_y;
}

static void init_dsm_address_info(SFc1_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc1_sliding_controller_rbdlInstanceStruct *
  chartInstance)
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
void sf_c1_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1880680695U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1680452377U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3479659674U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3127653308U);
}

mxArray *sf_c1_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c1_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c1_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c1_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPiCOYGFgYAPSHEDMxAABrFA+I5TNCBdngYsrAHFJZUEqSLy4KNkzBUjnJeaC+Ym"
    "lFZ55aflg8y0YEOazYTGfEcl8Tqg4BHywp0y/jAO6fhYC/hOA8hPzsnNSoeEDC6eB84cS2f5IAX"
    "pk8PhDgXx/ZOelDh5/iID9YUDAHywo/mBhAHmBOu7HDEfS9EPzPQH3q6DFA4ifWRyfmFySWZYan"
    "2wYX5yTmZKZlx6fnJ9XUpSfk5NaFF+UlJLDgBRPAKQWLlY="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c1_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sQh5nvZHhAQaTmI03z90vbC";
}

static void sf_opaque_initialize_c1_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c1_sliding_controller_rbdl
    ((SFc1_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c1_sliding_controller_rbdl
    ((SFc1_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c1_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c1_sliding_controller_rbdl((SFc1_sliding_controller_rbdlInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c1_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c1_sliding_controller_rbdl((SFc1_sliding_controller_rbdlInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c1_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c1_sliding_controller_rbdl
    ((SFc1_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c1_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c1_sliding_controller_rbdl
    ((SFc1_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c1_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c1_sliding_controller_rbdl
    ((SFc1_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c1_sliding_controller_rbdl(void *
  chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc1_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c1_sliding_controller_rbdl
      ((SFc1_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc1_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc1_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c1_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c1_sliding_controller_rbdl
    ((SFc1_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c1_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c1_sliding_controller_rbdl
    ((SFc1_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc1_sliding_controller_rbdl
    ((SFc1_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c1_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c1_sliding_controller_rbdl
      ((SFc1_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc1_sliding_controller_rbdl
      ((SFc1_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c1_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [19] = {
    "eNrtV81u20YQpgQ5SIA2cAEDvQRoUARoi15cFAXaS2ObkhABduyUchr0IqyWI3Gh5S67P/TPO+S",
    "eSx+kr9An6BPkmjxCZ0lalimSiuwmdYvSoOQlv/l2vpnZ2ZXXGhx4eN3H+9WW593B77t4t7382i",
    "jGrYU7f97xvijGL9FI2PiIKBJrr/ESJIafQEtuDZNiICayEsbEBBQIithEKlPHpllsOROzvhXU8",
    "emfI0ajIJKWh3toS8JDwc+QLbHmCHm6TAE1fYDQREraadTnZDr3WJkTPwI60zZukqDBBDZxbukD",
    "yw1LOPROgQ6ENgQ91pe+BYYY8M1prUynVAcXQBknnBFRqTYiOoAEA2zgOAnx89AaFFWG0Ygoswc",
    "RSUHvs1nGKQWUOZnGF2MmiJGKEd6Lue8Ml3074ujPgQyBNwQEfdtTQGaJZMLU5z/oo9KeIGMOXR",
    "jbaT1bAL9al/znDE5A1cZt4ssUFJnCoaidNAtI7zTL1rxKlmGGxfCcqF2K+dMQ1lYvVo4OCOYJh",
    "mhRB4NM5EAPFUsxvLVsNh64yly1ZGycJ1uvgmVsvRSasjBn61PhE851LWwok31IgWesXWJIMyxn",
    "rcZpzcKhxAC78q5fDVYwTHwB86UIWWW60hIg6ztPsbFcRVKrjYx9LN7u/v7y62XYQBhQE0Khqgs",
    "owjRgzLLw1rOFTLvcIxC9Mpl7VeC8QlahPD2xonsi1Qxj0tBELiW4jNYCYz3FXOJKONa4aJpgLp",
    "ercJTQCELXYBiHA1w2iK2IiXatbRfXXcrMWRc0VSypyKrFVYdtqOcK6iyBYzET8kT0lYyDosfn4",
    "QXAaiNKMDHdw/6lzvo4e1Uq3H627V3uZx+9w352YVf+/nKBp1XB4y18l+e9176Kb5fmbeNfq5Xb",
    "7SzYfVyap1Oyc7hNvM9//xrePP4teh199cnWOfyxav7W0vyt7H9nd3djvf3/fjF+cNFo5wsnXap",
    "Xh32y4Fengv/TBf7NYqyfRd+J9Jcn0e4zMowH29+e/7Cdjv2M70Wn2d+Nkr8Xzx+6jo9VltWnoo",
    "OwOJi4MbH5du34v1/w986KeNwrnufX28c3s3+wU7bvrNC3WYyJmHEo1e8/p+Pza+sIUcjt0fHw+",
    "jpmeGi4NTq2dsr9oUpH54qOjuck/D3+L8dxPft8/hcr/H9UysOj7Lw4Im4XghH9ZqQ5C3EHGVEp",
    "jJKcgxqpccjLff+6fXRdO+8D2/1b/Pzf7v3n/V3ORe1r2nVueA77UHY31bfu+fC24Zv2A6+E37z",
    "FOm56bn/f+D+99c7XnxXjH+c/of2I8bDi11TxGn8aTare/gfq9C9568QS",
    ""
  };

  static char newstr [1333] = "";
  newstr[0] = '\0';
  for (i = 0; i < 19; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c1_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c1_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(1697364346U));
  ssSetChecksum1(S,(1755135983U));
  ssSetChecksum2(S,(287926502U));
  ssSetChecksum3(S,(3395648020U));
}

static void mdlRTW_c1_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c1_sliding_controller_rbdl(SimStruct *S)
{
  SFc1_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc1_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc1_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc1_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance) SFc1_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c1_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c1_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c1_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c1_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c1_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c1_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c1_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c1_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c1_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c1_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c1_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c1_sliding_controller_rbdl;
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

  mdl_setup_runtime_resources_c1_sliding_controller_rbdl(chartInstance);
}

void c1_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c1_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c1_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c1_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c1_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
