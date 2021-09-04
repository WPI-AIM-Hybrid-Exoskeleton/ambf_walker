/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c19_sliding_controller_rbdl.h"
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
static void initialize_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c19_do_animation_call_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c19_st);
static void sf_gateway_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c19_eML_blk_kernel(SFc19_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c19_b_q[2], real_T c19_b_qd[2], real_T c19_b_knee[2],
  real_T c19_b_dknee[2], real_T c19_b_ankle[2], real_T c19_b_danke[2]);
static void c19_emlrt_marshallIn(SFc19_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c19_b_ankle, const char_T *c19_identifier,
  real_T c19_y[2]);
static void c19_b_emlrt_marshallIn(SFc19_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c19_u, const emlrtMsgIdentifier *c19_parentId,
  real_T c19_y[2]);
static uint8_T c19_c_emlrt_marshallIn
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c19_b_is_active_c19_sliding_controller_rbdl, const char_T *c19_identifier);
static uint8_T c19_d_emlrt_marshallIn
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c19_u, const emlrtMsgIdentifier *c19_parentId);
static void init_dsm_address_info(SFc19_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc19_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c19_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c19_is_active_c19_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c19_do_animation_call_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance)
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
    &chartInstance->c19_is_active_c19_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c19_y, 4, c19_f_y);
  sf_mex_assign(&c19_st, c19_y, false);
  return c19_st;
}

static void set_sim_state_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c19_st)
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
  chartInstance->c19_is_active_c19_sliding_controller_rbdl =
    c19_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c19_u, 4)),
    "is_active_c19_sliding_controller_rbdl");
  sf_mex_destroy(&c19_u);
  sf_mex_destroy(&c19_st);
}

static void sf_gateway_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c19_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c19_eML_blk_kernel(chartInstance, *chartInstance->c19_q,
                     *chartInstance->c19_qd, *chartInstance->c19_knee,
                     *chartInstance->c19_dknee, *chartInstance->c19_ankle,
                     *chartInstance->c19_danke);
  c19_do_animation_call_c19_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance)
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

static void mdl_setup_runtime_resources_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc19_sliding_controller_rbdl
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c19_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c19_nameCaptureInfo = NULL;
  const char_T *c19_data[4] = {
    "789ce593cb4ac34014864fa51637f5b2e94b088e75e5be2a8a5884163722f1243969c6cc452653dbbaf10df4297c171fcb246d7a09868862371e08277ffecc7c"
    "677e18a85d5cd500603b795a2f00e70dc8aa396db03beb1bb05a45bf56d2f3da84facabad4df4b786f33ed6965696ca742a1a4f94a5f4bae50d9fee491c050ac",
    "c513f9991370417d2ea9b72cbaa992674bd65ca456fade09c98b7a4309268c17138a6591e591d67dc979eb157914ab9847f1bf9c37fe212fdfbf55c1cbfd409b"
    "111adf89b8e2122df76247d0e0f7e7ceb98dd239a68eaf87aea005efe3973c2ce5adfab7a7772cd49298421ba2e224065af8011a97796893349c51cc62e33194",
    "6ee08c504464581290409729ed645f2dc5967d1de0819c71aa72dcf9e6b9caee5313b6b2fefeba8febe4e5f55f78ebba8f978713de7ee60f517474dce9b65dd7"
    "bbf1edc9628eeb0a4ed51c50a2ff7aff4fb0e86ac3", "" };

  c19_nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&c19_data[0], 1632U, &c19_nameCaptureInfo);
  return c19_nameCaptureInfo;
}

static void c19_eML_blk_kernel(SFc19_sliding_controller_rbdlInstanceStruct
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

static void c19_emlrt_marshallIn(SFc19_sliding_controller_rbdlInstanceStruct
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

static void c19_b_emlrt_marshallIn(SFc19_sliding_controller_rbdlInstanceStruct
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

static uint8_T c19_c_emlrt_marshallIn
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c19_b_is_active_c19_sliding_controller_rbdl, const char_T *c19_identifier)
{
  emlrtMsgIdentifier c19_thisId;
  uint8_T c19_y;
  c19_thisId.fIdentifier = const_cast<const char_T *>(c19_identifier);
  c19_thisId.fParent = NULL;
  c19_thisId.bParentIsCell = false;
  c19_y = c19_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c19_b_is_active_c19_sliding_controller_rbdl), &c19_thisId);
  sf_mex_destroy(&c19_b_is_active_c19_sliding_controller_rbdl);
  return c19_y;
}

static uint8_T c19_d_emlrt_marshallIn
  (SFc19_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c19_u, const emlrtMsgIdentifier *c19_parentId)
{
  uint8_T c19_b_u;
  uint8_T c19_y;
  sf_mex_import(c19_parentId, sf_mex_dup(c19_u), &c19_b_u, 1, 3, 0U, 0, 0U, 0);
  c19_y = c19_b_u;
  sf_mex_destroy(&c19_u);
  return c19_y;
}

static void init_dsm_address_info(SFc19_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc19_sliding_controller_rbdlInstanceStruct
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
void sf_c19_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1880680695U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1680452377U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3479659674U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3127653308U);
}

mxArray *sf_c19_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c19_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c19_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c19_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPiCOYGFgYAPSHEDMxAABrFA+I5TNCBdngYsrAHFJZUEqSLy4KNkzBUjnJeaC+Ym"
    "lFZ55aflg8y0YEOazYTGfEcl8Tqg4BHywp0y/jAO6fhYC/hOA8hPzsnNSoeEDC6eB84cS2f5IAX"
    "pk8PhDgXx/ZOelDh5/iID9YUDAHywo/mBhAHmBOu7HDEfS9EPzPQH3q6LFA4ifWRyfmFySWZYan"
    "2xoGV+ck5mSmZcen5yfV1KUn5OTWhRflJSSgxRPAKKjLpE="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c19_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sQh5nvZHhAQaTmI03z90vbC";
}

static void sf_opaque_initialize_c19_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c19_sliding_controller_rbdl
    ((SFc19_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c19_sliding_controller_rbdl
    ((SFc19_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c19_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c19_sliding_controller_rbdl
    ((SFc19_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c19_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c19_sliding_controller_rbdl
    ((SFc19_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c19_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c19_sliding_controller_rbdl
    ((SFc19_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c19_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c19_sliding_controller_rbdl
    ((SFc19_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c19_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c19_sliding_controller_rbdl
    ((SFc19_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c19_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc19_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c19_sliding_controller_rbdl
      ((SFc19_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc19_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc19_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c19_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c19_sliding_controller_rbdl
    ((SFc19_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c19_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c19_sliding_controller_rbdl
    ((SFc19_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc19_sliding_controller_rbdl
    ((SFc19_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c19_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c19_sliding_controller_rbdl
      ((SFc19_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc19_sliding_controller_rbdl
      ((SFc19_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c19_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [19] = {
    "eNrtV81u20YQpgQ5SIA2cAEDvQRIUCBIi15cFAWaS2ObkhABdu2Uchr0IqyWI3Gh5S67P/TPO/T",
    "eSx8kr5AnyBP02j5CZ0lalimSiuwmdYvSoOQlv/l2vpnZ2ZXXGhx4eN3H+9ctz7uD33fxbnv5tV",
    "GMWwt3/rzjPSnGv6CRsPERUSTWXuMlSAw/gJbcGibFQExkJYyJCSgQFLGJVKaOTbPYciZmfSuo4",
    "9M/RoxGQSQtD/fQloSHgp8hW2LNEfJ0mQJq+gChiZS006jPyXTusTInfgR0pm3cJEGDCWzi3NIH",
    "lhuWcOidAh0IbQh6rC99Cwwx4JvTWplOqQ4ugDJOOCOiUm1EdAAJBtjAcRLi56E1KKoMoxFRZg8",
    "ikoLeZ7OMUwooczKNL8ZMECMVI7wXc98ZLvt2xNGfAxkCbwgI+rangMwSyYSpz3/QR6U9QcYcuj",
    "C203q2AH62LvkvGZyAqo3bxJcpKDKFQ1E7aRaQ3mmWrXmVLMMMi+ElUbsU86chrK1erBwdEMwTD",
    "NGiDgaZyIEeKpZieGvZbDxwlblqydg4T7ZeBcvYeik0ZWHO1qfCJ5zrWthQJvuQAs9Yu8SQZljO",
    "Wo3TmoVDiQF25V2/GqxgmPgC5ksRssp0pSVA1ne+x8ZyFUmtNjL2sXi7+/vLr5dhA2FATQiFqi6",
    "gCNOAMcvCW88WMu1yj0D0ymTuVYHzClmF8vTEiu6JVDOMSUMTuZTgMloLjPUUc4kr4VjjommCuV",
    "yuwlFCIwhdg2EcDnDZILYiJtq1tl1cdykzZ13QVLGkIqsWVx22oZ4rqLMEjsVMyBPRVzIOih6fh",
    "xcAq40owcR0D/uXOuvj7FWpcPvZtne5n330DvvZhV35+/MFnlYFj7fwXZ73Xvsqvl2at41/rVZu",
    "t7Ng93Fpnk7JzuE28T5//SX88ey36Pfoi0+2zuHNqvlbS/O3sv+d3d2N9fb/+8X4wUWjnS+cdKl",
    "eHfb5gl+dCv5PF/g3i7F+EX0j0p+eR7svyDAebH99/nQ7HfsZ36tOs78bJX8vnj9yHR+rLKtPRQ",
    "dhcTBxY2Lz7drxf7vg750V8bhXPM+vP5/dzP7BTtm+s0LfZjEmYsahVL//nI7Prq0jRCG3R8ej6",
    "+uY4aHh1ujY2in3hyodnSs6Op6T8Pf4vxzH9ezz+V+t8P9xKQ+Ps/PiiLhdCEb0q6cjzVmIW8iI",
    "SmGU5BzUSI1DXsrTdfvounbeB7b7t/j5v937z/u7nIva17Tr3PAc9qHsbqpv3fPhbcM37QdeCb9",
    "5i3Xc9Nz+vvFvvfXO1w+L8Xfzn9B+xHhY8WuqeI0/jSZVb/8DdfoXNsbETQ==",
    ""
  };

  static char newstr [1337] = "";
  newstr[0] = '\0';
  for (i = 0; i < 19; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c19_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c19_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(1697364346U));
  ssSetChecksum1(S,(1755135983U));
  ssSetChecksum2(S,(287926502U));
  ssSetChecksum3(S,(3395648020U));
}

static void mdlRTW_c19_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c19_sliding_controller_rbdl(SimStruct *S)
{
  SFc19_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc19_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc19_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc19_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc19_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c19_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c19_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c19_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c19_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c19_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c19_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c19_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c19_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c19_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c19_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c19_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c19_sliding_controller_rbdl;
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

  mdl_setup_runtime_resources_c19_sliding_controller_rbdl(chartInstance);
}

void c19_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c19_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c19_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c19_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c19_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
