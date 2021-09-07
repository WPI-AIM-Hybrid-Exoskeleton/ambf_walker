/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c20_sliding_controller_rbdl.h"
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
static void initialize_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c20_do_animation_call_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c20_st);
static void sf_gateway_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c20_eML_blk_kernel(SFc20_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c20_b_q[2], real_T c20_b_qd[2], real_T c20_b_knee[2],
  real_T c20_b_dknee[2], real_T c20_b_ankle[2], real_T c20_b_danke[2]);
static void c20_emlrt_marshallIn(SFc20_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c20_b_ankle, const char_T *c20_identifier,
  real_T c20_y[2]);
static void c20_b_emlrt_marshallIn(SFc20_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c20_u, const emlrtMsgIdentifier *c20_parentId,
  real_T c20_y[2]);
static uint8_T c20_c_emlrt_marshallIn
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c20_b_is_active_c20_sliding_controller_rbdl, const char_T *c20_identifier);
static uint8_T c20_d_emlrt_marshallIn
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c20_u, const emlrtMsgIdentifier *c20_parentId);
static void init_dsm_address_info(SFc20_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc20_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c20_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c20_is_active_c20_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c20_do_animation_call_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance)
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
    &chartInstance->c20_is_active_c20_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c20_y, 4, c20_f_y);
  sf_mex_assign(&c20_st, c20_y, false);
  return c20_st;
}

static void set_sim_state_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c20_st)
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
  chartInstance->c20_is_active_c20_sliding_controller_rbdl =
    c20_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c20_u, 4)),
    "is_active_c20_sliding_controller_rbdl");
  sf_mex_destroy(&c20_u);
  sf_mex_destroy(&c20_st);
}

static void sf_gateway_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c20_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c20_eML_blk_kernel(chartInstance, *chartInstance->c20_q,
                     *chartInstance->c20_qd, *chartInstance->c20_knee,
                     *chartInstance->c20_dknee, *chartInstance->c20_ankle,
                     *chartInstance->c20_danke);
  c20_do_animation_call_c20_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance)
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

static void mdl_setup_runtime_resources_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc20_sliding_controller_rbdl
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c20_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c20_nameCaptureInfo = NULL;
  const char_T *c20_data[4] = {
    "789cc593cb4ac34014864fa516375537fa188e2d08dd57c50b2d428b1b9138494e9a317391c9d4b66eba74e963e933b93297a697608858ac07c2c99f3f33df99"
    "1f062a979d0a00ec464f670a705183a4ea6983fd59df82d5cafb95829ed5365457d6c5fe55c47b9b6947498363930a4905ce57ba4a3049a5e94f9e1034868a3f",
    "a39b381ee3d867027bcba21b2b71be64cd456cc5ef6d1f9da03714a0fd7031215f16491e713d149cb75a9247bef279e4ffcb78e35ff2b2fd0f4b7899ef293da2"
    "dab5022699a08639a1c571b0feb9336ead708ed471d5d0e6b8e07dacc9a385bc55ffeeec9ef84a2091d4f85432e403c55d8f6a9b38d4446958a39084da2154d8",
    "9e35a23c404da28038b5895456f2d56068c8f7011e8919a72cc7bd1f9eabe83ed56127e9ad8313ba49deebe77b7393bcacfe8bb7a9fb787d3c618d17f61804cd"
    "56bbdbb06de7d635a78b396e4a3865734081feebfdbf0083b96cd1", "" };

  c20_nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&c20_data[0], 1632U, &c20_nameCaptureInfo);
  return c20_nameCaptureInfo;
}

static void c20_eML_blk_kernel(SFc20_sliding_controller_rbdlInstanceStruct
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

static void c20_emlrt_marshallIn(SFc20_sliding_controller_rbdlInstanceStruct
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

static void c20_b_emlrt_marshallIn(SFc20_sliding_controller_rbdlInstanceStruct
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

static uint8_T c20_c_emlrt_marshallIn
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c20_b_is_active_c20_sliding_controller_rbdl, const char_T *c20_identifier)
{
  emlrtMsgIdentifier c20_thisId;
  uint8_T c20_y;
  c20_thisId.fIdentifier = const_cast<const char_T *>(c20_identifier);
  c20_thisId.fParent = NULL;
  c20_thisId.bParentIsCell = false;
  c20_y = c20_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c20_b_is_active_c20_sliding_controller_rbdl), &c20_thisId);
  sf_mex_destroy(&c20_b_is_active_c20_sliding_controller_rbdl);
  return c20_y;
}

static uint8_T c20_d_emlrt_marshallIn
  (SFc20_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c20_u, const emlrtMsgIdentifier *c20_parentId)
{
  uint8_T c20_b_u;
  uint8_T c20_y;
  sf_mex_import(c20_parentId, sf_mex_dup(c20_u), &c20_b_u, 1, 3, 0U, 0, 0U, 0);
  c20_y = c20_b_u;
  sf_mex_destroy(&c20_u);
  return c20_y;
}

static void init_dsm_address_info(SFc20_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc20_sliding_controller_rbdlInstanceStruct
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
void sf_c20_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1880680695U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1680452377U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3479659674U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3127653308U);
}

mxArray *sf_c20_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c20_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c20_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c20_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPiCOYGFgYAPSHEDMxAABrFA+I5TNCBdngYsrAHFJZUEqSLy4KNkzBUjnJeaC+Ym"
    "lFZ55aflg8y0YEOazYTGfEcl8Tqg4BHywp0y/jAO6fhYC/hOA8hPzsnNSoeEDC6eB84cS2f5IAX"
    "pk8PhDgXx/ZOelDh5/iID9YUDAHywo/mBhAHmBOu7HDEfS9EPzPQH3q6LFA4ifWRyfmFySWZYan"
    "2xkEF+ck5mSmZcen5yfV1KUn5OTWhRflJSSgxRPAKGELok="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c20_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sQh5nvZHhAQaTmI03z90vbC";
}

static void sf_opaque_initialize_c20_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c20_sliding_controller_rbdl
    ((SFc20_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c20_sliding_controller_rbdl
    ((SFc20_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c20_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c20_sliding_controller_rbdl
    ((SFc20_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c20_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c20_sliding_controller_rbdl
    ((SFc20_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c20_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c20_sliding_controller_rbdl
    ((SFc20_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c20_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c20_sliding_controller_rbdl
    ((SFc20_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c20_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c20_sliding_controller_rbdl
    ((SFc20_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c20_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc20_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c20_sliding_controller_rbdl
      ((SFc20_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc20_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc20_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c20_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c20_sliding_controller_rbdl
    ((SFc20_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c20_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c20_sliding_controller_rbdl
    ((SFc20_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc20_sliding_controller_rbdl
    ((SFc20_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c20_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c20_sliding_controller_rbdl
      ((SFc20_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc20_sliding_controller_rbdl
      ((SFc20_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c20_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [19] = {
    "eNrtV81u20YQpgQ5SIA28CFALwESFAiSQwsYLQq0KNDYpiREqF07pZwGuQir5UhcaLnL7A9t5x2",
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
    "wSvjNa6zjquf2d43/zVvvfH2vGH8z/wntR4yHFb+mitf402hS9fY/UKd/AcpexTA=",
    ""
  };

  static char newstr [1341] = "";
  newstr[0] = '\0';
  for (i = 0; i < 19; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c20_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c20_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(3042620282U));
  ssSetChecksum1(S,(2411386699U));
  ssSetChecksum2(S,(753018669U));
  ssSetChecksum3(S,(4282078351U));
}

static void mdlRTW_c20_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c20_sliding_controller_rbdl(SimStruct *S)
{
  SFc20_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc20_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc20_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc20_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc20_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c20_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c20_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c20_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c20_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c20_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c20_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c20_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c20_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c20_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c20_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c20_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c20_sliding_controller_rbdl;
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

  mdl_setup_runtime_resources_c20_sliding_controller_rbdl(chartInstance);
}

void c20_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c20_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c20_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c20_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c20_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
