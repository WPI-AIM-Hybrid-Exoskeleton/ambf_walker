/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c10_sliding_controller_rbdl.h"
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
static void initialize_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c10_do_animation_call_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c10_st);
static void sf_gateway_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c10_eML_blk_kernel(SFc10_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c10_b_q[2], real_T c10_b_qd[2], real_T c10_b_knee[2],
  real_T c10_b_dknee[2], real_T c10_b_ankle[2], real_T c10_b_danke[2]);
static void c10_emlrt_marshallIn(SFc10_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c10_b_ankle, const char_T *c10_identifier,
  real_T c10_y[2]);
static void c10_b_emlrt_marshallIn(SFc10_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c10_u, const emlrtMsgIdentifier *c10_parentId,
  real_T c10_y[2]);
static uint8_T c10_c_emlrt_marshallIn
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c10_b_is_active_c10_sliding_controller_rbdl, const char_T *c10_identifier);
static uint8_T c10_d_emlrt_marshallIn
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c10_u, const emlrtMsgIdentifier *c10_parentId);
static void init_dsm_address_info(SFc10_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc10_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c10_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c10_is_active_c10_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c10_do_animation_call_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance)
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
    &chartInstance->c10_is_active_c10_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c10_y, 4, c10_f_y);
  sf_mex_assign(&c10_st, c10_y, false);
  return c10_st;
}

static void set_sim_state_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c10_st)
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
  chartInstance->c10_is_active_c10_sliding_controller_rbdl =
    c10_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c10_u, 4)),
    "is_active_c10_sliding_controller_rbdl");
  sf_mex_destroy(&c10_u);
  sf_mex_destroy(&c10_st);
}

static void sf_gateway_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c10_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c10_eML_blk_kernel(chartInstance, *chartInstance->c10_q,
                     *chartInstance->c10_qd, *chartInstance->c10_knee,
                     *chartInstance->c10_dknee, *chartInstance->c10_ankle,
                     *chartInstance->c10_danke);
  c10_do_animation_call_c10_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance)
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

static void mdl_setup_runtime_resources_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc10_sliding_controller_rbdl
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c10_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c10_nameCaptureInfo = NULL;
  const char_T *c10_data[4] = {
    "789cc593cd4ac34014856fa516375537fa188e2d08dd57c5222d428b1b9138496e9a31f32393a96dddb8ecd2c7d26772659226fd098688c57a21dc9c9ccc7c77"
    "0e0c543add0a00ec474ff715e0aa0649d5e70d0ed3be03eb95f72b053dab5da8aead8bfd4ec47b4bb5a3a4c189990b49052e56ba4a3049a5194c9f1034868a3f",
    "a39b381ee3386002fbaba2172b71b9622d446cc5ef6d1f9da03f12a0fd7039215f15491e713d149cb75a9247bef279e4ffcb78935ff2b2fd8f4b7899ef293da6"
    "dab5022699a08639a1c571b8f9b9336ead708eb9e3aa91cd71c9fbd890470b79ebfeddc53df1954022a9f1a964c8878abb1ed53671a889d2b0c62109b543a8b0",
    "3d6b4c79809a4401716a13a9ace4abc1d090ef033c1129a72cc7831f9eabe83ed5612fe9ada333ba4ddeecf3bdb94d5e56ffc5dbd67dbc3e9db2c60b7b0c8266"
    "abdd6bd8b673eb9af3e51c37259cb239a040fff5fe5f7dd56cd0", "" };

  c10_nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&c10_data[0], 1632U, &c10_nameCaptureInfo);
  return c10_nameCaptureInfo;
}

static void c10_eML_blk_kernel(SFc10_sliding_controller_rbdlInstanceStruct
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

static void c10_emlrt_marshallIn(SFc10_sliding_controller_rbdlInstanceStruct
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

static void c10_b_emlrt_marshallIn(SFc10_sliding_controller_rbdlInstanceStruct
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

static uint8_T c10_c_emlrt_marshallIn
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c10_b_is_active_c10_sliding_controller_rbdl, const char_T *c10_identifier)
{
  emlrtMsgIdentifier c10_thisId;
  uint8_T c10_y;
  c10_thisId.fIdentifier = const_cast<const char_T *>(c10_identifier);
  c10_thisId.fParent = NULL;
  c10_thisId.bParentIsCell = false;
  c10_y = c10_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c10_b_is_active_c10_sliding_controller_rbdl), &c10_thisId);
  sf_mex_destroy(&c10_b_is_active_c10_sliding_controller_rbdl);
  return c10_y;
}

static uint8_T c10_d_emlrt_marshallIn
  (SFc10_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c10_u, const emlrtMsgIdentifier *c10_parentId)
{
  uint8_T c10_b_u;
  uint8_T c10_y;
  sf_mex_import(c10_parentId, sf_mex_dup(c10_u), &c10_b_u, 1, 3, 0U, 0, 0U, 0);
  c10_y = c10_b_u;
  sf_mex_destroy(&c10_u);
  return c10_y;
}

static void init_dsm_address_info(SFc10_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc10_sliding_controller_rbdlInstanceStruct
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
void sf_c10_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1880680695U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1680452377U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3479659674U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3127653308U);
}

mxArray *sf_c10_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c10_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c10_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c10_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPiCOYGFgYAPSHEDMxAABrFA+I5TNCBdngYsrAHFJZUEqSLy4KNkzBUjnJeaC+Ym"
    "lFZ55aflg8y0YEOazYTGfEcl8Tqg4BHywp0y/jAO6fhYC/hOA8hPzsnNSoeEDC6eB84cS2f5IAX"
    "pk8PhDgXx/ZOelDh5/iID9YUDAHywo/mBhAHmBOu7HDEfS9EPzPQH3q6LFA4ifWRyfmFySWZYan"
    "2xoEF+ck5mSmZcen5yfV1KUn5OTWhRflJSSgxRPAKFfLog="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c10_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sQh5nvZHhAQaTmI03z90vbC";
}

static void sf_opaque_initialize_c10_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c10_sliding_controller_rbdl
    ((SFc10_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c10_sliding_controller_rbdl
    ((SFc10_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c10_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c10_sliding_controller_rbdl
    ((SFc10_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c10_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c10_sliding_controller_rbdl
    ((SFc10_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c10_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c10_sliding_controller_rbdl
    ((SFc10_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c10_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c10_sliding_controller_rbdl
    ((SFc10_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c10_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c10_sliding_controller_rbdl
    ((SFc10_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c10_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc10_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c10_sliding_controller_rbdl
      ((SFc10_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc10_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc10_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c10_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c10_sliding_controller_rbdl
    ((SFc10_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c10_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c10_sliding_controller_rbdl
    ((SFc10_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc10_sliding_controller_rbdl
    ((SFc10_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c10_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c10_sliding_controller_rbdl
      ((SFc10_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc10_sliding_controller_rbdl
      ((SFc10_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c10_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [19] = {
    "eNrtV81u20YQpgQ5SIA28CFALwESFAiSQwu4KAq0KNDYpiREqF07pZwGuQir5UhcaLnL7A9t5x2",
    "KXPseRS59kfbcJ+gbtLMkLcsUSUV2k7pFaVDykt98O9/M7OzKaw32Pbxu4/3THc+7gd838W57+b",
    "VRjFsLd/684z0sxj+ikbDxIVEk1l7jJUgM34OW3BomxUBMZCWMiQkoEBSxiVSmjk2z2HImZn0rq",
    "OPTP0SMRkEkLQ930ZaEB4KfIltizSHydJkCavoAoYmUtNOoz8l07rEyx34EdKZt3CRBgwls4tzS",
    "+5YblnDonQAdCG0IeqzPfQsMMeCbk1qZTqkOzoAyTjgjolJtRHQACQbYwFES4ueBNSiqDKMRUWY",
    "XIpKC3mOzjFMKKHMyjS/GTBAjFSO8F3PfGS77dsjRn30ZAm8ICPq2q4DMEsmEqc9/0EelPUHGHL",
    "owttN6tgBeWpf8ZwyOQdXGbeLLFBSZwoGonTQLSO8ky9a8SpZhhsXwjKgdivnTENZWL1aODgjmC",
    "YZoUQeDTORADxVLMby1bDYeuMpctWRsnCdbr4JlbL0UmrIwZ+tT4RPOdS1sKJM9SIFnrF1iSDMs",
    "Z63Gac3CocQAu/KuXw1WMEx8AfOlCFllutISIOs732FjuYikVhsZ+1i83b295dfLsIEwoCaEQlU",
    "XUIRpwJhl4a1nC5l2uUcgemUy96rAeYWsQnl6YkX3WKoZxqShiZxLcBmtBcZ6irnElXCkcdE0wV",
    "wuV+EooRGErsEwDvu4bBBbERPtWtsOrruUmdMuaKpYUpFVi6sO21DPFdRpAkdiJuSx6CsZB0WPz",
    "8MLgNVGlGBiuov9S532cfaqVLj9bMs7388+eIv97Myu/P1ogadVweMtfJfnvdW+iG+X5m3jX6uV",
    "220v2H1YmqdTsnO4Tbxf/fzizbe//vL604e/f/J6+PWfq+ZvLc3fyv53djc31tv/bxfju2eNdr5",
    "w0qV6ddgnC351Kvg/WuDfLMb6afSFSF88iXaekmE82Pr81Vdb6djP+J53mv3dKPl79vy+6/hYZV",
    "l9KjoIi4OJGxObb9eO/8sFf2+siMet4nl+/fH4avZ3t8v2nRX6NosxETMOpfr953R8fGkdIQq5P",
    "jruX17HDA8N10bHne1yf6jS0bmgo+M5CX+P/8txXM8+n//5Cv8flPLwIDsvjojbhWBEP9saac5C",
    "3EJGVAqjJOegRmoc8lKeLttH17Xz3rPdv8XP/+3efd7f5lzUvqRd54rnsPdld1V9654Prxu+aT/",
    "wSvjNa6zjquf2d43/zVvvfH2vGH8z/wntR4yHFb+mitf402hS9fY/UKd/AcKpxS8=",
    ""
  };

  static char newstr [1341] = "";
  newstr[0] = '\0';
  for (i = 0; i < 19; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c10_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c10_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(3042620282U));
  ssSetChecksum1(S,(2411386699U));
  ssSetChecksum2(S,(753018669U));
  ssSetChecksum3(S,(4282078351U));
}

static void mdlRTW_c10_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c10_sliding_controller_rbdl(SimStruct *S)
{
  SFc10_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc10_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc10_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc10_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc10_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c10_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c10_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c10_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c10_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c10_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c10_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c10_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c10_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c10_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c10_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c10_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c10_sliding_controller_rbdl;
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

  mdl_setup_runtime_resources_c10_sliding_controller_rbdl(chartInstance);
}

void c10_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c10_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c10_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c10_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c10_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
