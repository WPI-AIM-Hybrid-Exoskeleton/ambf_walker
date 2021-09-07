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
    "789cc593cb4ac34014864fa516375537fa188e2d08dd57c50b2d428b1b9138494e9a317391c9d4b66eba74e963e933b93297a697608858ac07c2c99f3f33df99"
    "1f062a979d0a00ec464f670a705183a4ea6983fd59df82d5cafb95829ed5365457d6c5fe55c47b9b6947498363930a4905ce57ba4a3049a5e94f9e1034868a3f",
    "a39b381ee3d867027bcba21b2b71be64cd456cc5ef6d1f9da03714a0fd7031215f16491e713d149cb75a9247bef279e4ffcb78e35ff2b2fd0f4b7899ef293da2"
    "dab5022699a08639a1c571b0feb9336ead708ed471d5d0e6b8e07dacc9a385bc55ffeeec9ef84a2091d4f85432e403c55d8f6a9b38d4446958a39084da2154d8",
    "9e35a23c404da28038b5895456f2d56068c8f7011e8919a72cc7bd1f9eabe83ed56127e9ad8313ba49deebe77b7393bcacfe8bb7a9fb787d3c618d17f61804cd"
    "56bbdbb06de7d635a78b396e4a3865734081feebfdbf0083b96cd1", "" };

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
    "eNrtV81u20YQpgQ5SIA28CFALwEaBAjSQwu4KAo0KNDapiREqF07pZwGuQir5UhcaLnL7A9t5x2",
    "KXPseRS95kfTcJ+gbtLMkLcsUSUV2k7pFaVDykt98O9/M7OzKaw32Pbxu4/3zHc+7gd838W57+b",
    "VRjFsLd/684z0sxj+hkbDxIVEk1l7jJUgMP4CW3BomxUBMZCWMiQkoEBSxiVSmjk2z2HImZn0rq",
    "OPTP0aMRkEkLQ930ZaEB4KfIltizSHydJkCavoAoYmUtNOoz8l07rEyx34EdKZt3CRBgwls4tzS",
    "+5YblnDonQAdCG0IeqzPfQsMMeCbk1qZTqkOzoAyTjgjolJtRHQACQbYwFES4ueBNSiqDKMRUWY",
    "XIpKC3mOzjFMKKHMyjS/GTBAjFSO8F3PfGS77dsjRn30ZAm8ICPq2q4DMEsmEqc9/0EelPUHGHL",
    "owttN6tgBeWJf8pwyOQdXGbeLLFBSZwoGonTQLSO8ky9a8SpZhhsXwlKgdivnTENZWL1aODgjmC",
    "YZoUQeDTORADxVLMby1bDYeuMpctWRsnCdbr4JlbL0UmrIwZ+tT4RPOdS1sKJM9SIFnrF1iSDMs",
    "Z63Gac3CocQAu/KuXw1WMEx8AfOlCFllutISIOs732NjuYikVhsZ+1i83b295dfLsIEwoCaEQlU",
    "XUIRpwJhl4a1nC5l2uUcgemUy96rAeYWsQnl6YkX3WKoZxqShiZxLcBmtBcZ6irnElXCkcdE0wV",
    "wuV+EooRGErsEwDvu4bBBbERPtWtsOrruUmdMuaKpYUpFVi6sO21DPFdRpAkdiJuSx6CsZB0WPz",
    "8MLgNVGlGBiuov9S532cfaqVLj9bMs7388+eIv97Myu/P3JAk+rgsdb+C7Pe6t9Ed8uzdvGv1Yr",
    "t9tesPuwNE+nZOdwm3i//OX5r9+9ef3qs4e/f/pq+PWfq+ZvLc3fyv53djc31tv/bxfju2eNdr5",
    "w0qV6ddjHC351Kvg/WuDfLMb6SfSlSJ8/jnaekGE82Pri5aOtdOxnfM86zf5ulPw9e37PdXyssq",
    "w+FR2ExcHEjYnNt2vH/9WCvzdWxONW8Ty//vj2avZ3t8v2nRX6NosxETMOpfr953Tcv7SOEIVcH",
    "x33Lq9jhoeGa6Pjzna5P1Tp6FzQ0fGchL/H/+U4rmefz/9shf8PSnl4kJ0XR8TtQjCinz8aac5C",
    "3EJGVAqjJOegRmoc8lKeLttH17Xz3rPdv8XP/+3efd7f5lzUvqRd54rnsPdld1V9654Prxu+aT/",
    "wSvjNa6zjquf2d43/zVvvfP1xMf5m/hPajxgPK35NFa/xp9Gk6u1/oE7/AggMxTg=",
    ""
  };

  static char newstr [1341] = "";
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
  ssSetChecksum0(S,(3042620282U));
  ssSetChecksum1(S,(2411386699U));
  ssSetChecksum2(S,(753018669U));
  ssSetChecksum3(S,(4282078351U));
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
