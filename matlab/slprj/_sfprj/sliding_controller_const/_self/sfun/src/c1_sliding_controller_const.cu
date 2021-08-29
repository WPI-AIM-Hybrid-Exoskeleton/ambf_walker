/* Include files */

#include "sliding_controller_const_sfun.h"
#include "c1_sliding_controller_const.h"
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
static void initialize_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance);
static void initialize_params_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance);
static void enable_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance);
static void disable_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance);
static void c1_do_animation_call_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance);
static void ext_mode_exec_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance);
static void set_sim_state_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c1_st);
static void sf_gateway_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_start_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_terminate_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance);
static void initSimStructsc1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance);
static void c1_eML_blk_kernel(SFc1_sliding_controller_constInstanceStruct
  *chartInstance, real_T c1_b_q[2], real_T c1_b_qd[2], real_T c1_b_knee[2],
  real_T c1_b_dknee[2], real_T c1_b_ankle[2], real_T c1_b_danke[2]);
static void c1_emlrt_marshallIn(SFc1_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c1_b_ankle, const char_T *c1_identifier, real_T
  c1_y[2]);
static void c1_b_emlrt_marshallIn(SFc1_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId,
  real_T c1_y[2]);
static uint8_T c1_c_emlrt_marshallIn(SFc1_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c1_b_is_active_c1_sliding_controller_const,
  const char_T *c1_identifier);
static uint8_T c1_d_emlrt_marshallIn(SFc1_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId);
static void init_dsm_address_info(SFc1_sliding_controller_constInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc1_sliding_controller_constInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c1_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c1_is_active_c1_sliding_controller_const = 0U;
  cudaGetLastError();
}

static void initialize_params_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void enable_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c1_do_animation_call_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance)
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
    &chartInstance->c1_is_active_c1_sliding_controller_const, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c1_y, 4, c1_f_y);
  sf_mex_assign(&c1_st, c1_y, false);
  return c1_st;
}

static void set_sim_state_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance, const mxArray
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
  chartInstance->c1_is_active_c1_sliding_controller_const =
    c1_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c1_u, 4)),
    "is_active_c1_sliding_controller_const");
  sf_mex_destroy(&c1_u);
  sf_mex_destroy(&c1_st);
}

static void sf_gateway_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance)
{
  chartInstance->c1_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c1_eML_blk_kernel(chartInstance, *chartInstance->c1_q, *chartInstance->c1_qd, *
                    chartInstance->c1_knee, *chartInstance->c1_dknee,
                    *chartInstance->c1_ankle, *chartInstance->c1_danke);
  c1_do_animation_call_c1_sliding_controller_const(chartInstance);
}

static void mdl_start_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance)
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

static void mdl_setup_runtime_resources_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void initSimStructsc1_sliding_controller_const
  (SFc1_sliding_controller_constInstanceStruct *chartInstance)
{
}

const mxArray *sf_c1_sliding_controller_const_get_eml_resolved_functions_info()
{
  const mxArray *c1_nameCaptureInfo = NULL;
  const char_T *c1_data[4] = {
    "789cc553cb4ac34014bd955adc545d09825b372e1cdd886b8b850a2db50f5c88c69b64d20c9d874c52dbbaf113fc1dbfc7853bffc1246d9a26182216eb8170e7"
    "7032f7dc7b60a0d4689600603bf83e5e00ce2b10a13a2bb03baf1b9046562fe5d4189b504edd0bf5f7c0ef75ce2d257d3af16744a2a08b9bb6124ca2f47bd347",
    "0a9a7a8a3f513b521cc6698f09da5d26ad9089fa92b420a1149e6b2eb586dd9100ed7ac9847c9944798478c8d9b75c904716d93cb2ffc57e935ffac5fdf70afc"
    "62dd517a8cda36864c32813eb33c83d3c1ea7bc7be95dc39668aad4626a789dfdb8a7ebd5cbfb47e7b79475c252891e8bb2819e503c56d07b5492cf483348cb1",
    "473c6d1114a6638c910fa92641401c4df27d66c722ec5b94dbce0ff7c87b3f55d88aea677b1fd7e9777f7470b84ebf18ffe5b7aef777d3bec093b3e72bd6e9e8"
    "7af3badf6df44f5bb5648e76814fd11c90c3ffbaff177b596734", "" };

  c1_nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&c1_data[0], 1616U, &c1_nameCaptureInfo);
  return c1_nameCaptureInfo;
}

static void c1_eML_blk_kernel(SFc1_sliding_controller_constInstanceStruct
  *chartInstance, real_T c1_b_q[2], real_T c1_b_qd[2], real_T c1_b_knee[2],
  real_T c1_b_dknee[2], real_T c1_b_ankle[2], real_T c1_b_danke[2])
{
  real_T c1_a;
  real_T c1_b_a;
  c1_b_knee[0] = -0.324 * muDoubleScalarCos(c1_b_q[0]);
  c1_b_knee[1] = -0.324 * muDoubleScalarSin(c1_b_q[0]);
  c1_a = -0.324 * c1_b_qd[0];
  c1_b_dknee[0] = c1_a * -muDoubleScalarSin(c1_b_q[0]);
  c1_b_dknee[1] = c1_a * muDoubleScalarCos(c1_b_q[0]);
  c1_b_a = -0.39 * (c1_b_qd[0] + c1_b_qd[1]);
  c1_b_ankle[0] = c1_b_knee[0] - -0.39 * muDoubleScalarSin(c1_b_q[0] + c1_b_q[1]);
  c1_b_ankle[1] = c1_b_knee[1] - -0.39 * muDoubleScalarCos(c1_b_q[0] + c1_b_q[1]);
  c1_b_danke[0] = c1_b_dknee[0] + c1_b_a * -muDoubleScalarSin(c1_b_q[0] +
    c1_b_q[1]);
  c1_b_danke[1] = c1_b_dknee[1] + c1_b_a * muDoubleScalarCos(c1_b_q[0] + c1_b_q
    [1]);
}

static void c1_emlrt_marshallIn(SFc1_sliding_controller_constInstanceStruct
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

static void c1_b_emlrt_marshallIn(SFc1_sliding_controller_constInstanceStruct
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

static uint8_T c1_c_emlrt_marshallIn(SFc1_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c1_b_is_active_c1_sliding_controller_const,
  const char_T *c1_identifier)
{
  emlrtMsgIdentifier c1_thisId;
  uint8_T c1_y;
  c1_thisId.fIdentifier = const_cast<const char_T *>(c1_identifier);
  c1_thisId.fParent = NULL;
  c1_thisId.bParentIsCell = false;
  c1_y = c1_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c1_b_is_active_c1_sliding_controller_const), &c1_thisId);
  sf_mex_destroy(&c1_b_is_active_c1_sliding_controller_const);
  return c1_y;
}

static uint8_T c1_d_emlrt_marshallIn(SFc1_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId)
{
  uint8_T c1_b_u;
  uint8_T c1_y;
  sf_mex_import(c1_parentId, sf_mex_dup(c1_u), &c1_b_u, 1, 3, 0U, 0, 0U, 0);
  c1_y = c1_b_u;
  sf_mex_destroy(&c1_u);
  return c1_y;
}

static void init_dsm_address_info(SFc1_sliding_controller_constInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc1_sliding_controller_constInstanceStruct
  *chartInstance)
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
void sf_c1_sliding_controller_const_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1880680695U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1680452377U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3479659674U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3127653308U);
}

mxArray *sf_c1_sliding_controller_const_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c1_sliding_controller_const_jit_fallback_info(void)
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

mxArray *sf_c1_sliding_controller_const_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c1_sliding_controller_const(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPiCOYGFgYAPSHEDMxAABrFA+I5TNCBdngYsrAHFJZUEqSLy4KNkzBUjnJeaC+Ym"
    "lFZ55aflg8y0YEOazYTGfEcl8Tqg4BHywp0y/jAO6fhYC/hOA8hPzsnNSoeEDC6eB84cS2f5IAX"
    "pk8PhDgXx/ZOelDh5/iID9YUDAHywo/mBhAHmBOu7HDEfS9EPzPQH3q6LFA4ifWRyfmFySWZYan"
    "2wYX5yTmZKZlx6fnJ9XUpSfk5NaBGIWlyDFEwCquC7b"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c1_sliding_controller_const_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sQh5nvZHhAQaTmI03z90vbC";
}

static void sf_opaque_initialize_c1_sliding_controller_const(void
  *chartInstanceVar)
{
  initialize_params_c1_sliding_controller_const
    ((SFc1_sliding_controller_constInstanceStruct*) chartInstanceVar);
  initialize_c1_sliding_controller_const
    ((SFc1_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c1_sliding_controller_const(void *chartInstanceVar)
{
  enable_c1_sliding_controller_const
    ((SFc1_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c1_sliding_controller_const(void *chartInstanceVar)
{
  disable_c1_sliding_controller_const
    ((SFc1_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c1_sliding_controller_const(void *chartInstanceVar)
{
  sf_gateway_c1_sliding_controller_const
    ((SFc1_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c1_sliding_controller_const
  (SimStruct* S)
{
  return get_sim_state_c1_sliding_controller_const
    ((SFc1_sliding_controller_constInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c1_sliding_controller_const(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c1_sliding_controller_const
    ((SFc1_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c1_sliding_controller_const(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc1_sliding_controller_constInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_const_optimization_info();
    }

    mdl_cleanup_runtime_resources_c1_sliding_controller_const
      ((SFc1_sliding_controller_constInstanceStruct*) chartInstanceVar);
    ((SFc1_sliding_controller_constInstanceStruct*) chartInstanceVar)->
      ~SFc1_sliding_controller_constInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c1_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_start_c1_sliding_controller_const
    ((SFc1_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c1_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_terminate_c1_sliding_controller_const
    ((SFc1_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc1_sliding_controller_const
    ((SFc1_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c1_sliding_controller_const(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c1_sliding_controller_const
      ((SFc1_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc1_sliding_controller_const
      ((SFc1_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c1_sliding_controller_const_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [19] = {
    "eNrtV81u20YQpgQ5SIAm8CFAL0EbFAnaSwEXRYH20timJESFHTulnAY91FgvR+JCy112f2ir75C",
    "ec8k9D5BLnqBAn6CnPkPRJ+gsScsyRVKR3aRuURq0tOQ33843Mzu78lqDXQ+vW3g/v+151/DzOt",
    "5tL7/WinFr7s6fd7yPi/EzNBI23ieKxNprvASJ4VvQklvDpBiIkayEMTECBYIiNpHK1LFpFlvOx",
    "KRvBXV8+ruI0SiIpOXhNtqScE/wKbIl1uwjT5cpoKYPEJpISTuO+pyMZx4rc+xHQCfaxk0SNJjA",
    "Js4tvWu5YQmH3gnQgdCGoMf6zLfAEAO+OamV6ZTq4BQo44QzIirVRkQHkGCADRwkIf7fswZFlWE",
    "0IspsQ0RS0DtsknFKAWVOpvHFERPESMUI78Xcd4aLvu1z9GdXhsAbAoK+bSsgk0QyYerzH/RRaU",
    "+QIw5dOLLjerYAfrQu+U8YHIOqjdvIlykoMoY9UTtpFpDeSZatWZUswgyL4QlRWxTzpyGsrV6sH",
    "B0QzBMM0aIOBpnIgR4qlmJ4a9lsPHCVuWzJ2DhPtl4Gy9h6KTRlYcbWp8InnOta2FAmO5ACz1i7",
    "xJBmWM5ajdOahUOJAXblXb8arGCY+ALmSxGyynSlJUDWdx5hYzmPpFYbGftYvN2dncXXi7CBMKB",
    "GhEJVF1CEacCYZeGtZwuZdrlHIHplMveqwHmFLEN5emRF91iqCcakoYmcSXAZrQXGeoy5xJVwoH",
    "HRNMFcLpfhKKERhK7BMA67uGwQWxET7VrbFq67lJlpFzRVLKnIqsVVh22o5wpqmsCBmAh5LPpKx",
    "kHR4/PwAmC1ESWYGG9j/1LTPs5elQq3n214Z/vZe2+wn53alT8/meNpVfB4c5/leW+0z+PbpXnb",
    "+Ndq5Xabc3Y3S/N0SnYOt473N7+/uPfog1d//vLrpz9PX77+Ydn8rYX5W9l3Z3d9bbX9/1YxvnP",
    "aaGcLJ12oV4d9OOdXp4L//Tn+9WKsH0dfiPT7h9HWYzKMBxuf//TVRnrkZ3xPO83+rpX8PX1+13",
    "V8rLKsPhUdhMXBxI2Jzbdrx//lnL/XlsTjRvE8v/54cDn7O5tl+84SfevFmIgJh1L9/nM6Prqwj",
    "hCFXB0ddy+uY4KHhiuj4/ZmuT9U6eic09HxnIS/x//FOK5mn8//dIn/90t5uJ+dFw+J24XgkH52",
    "qDkLcQc5pFIYJTkH5b5qU8rTRfvoqnbeO7b7t/j5v93bz/ubnIvaF7TrXPIc9q7sLqtv1fPhVcM",
    "37QdeCb9+hXVc9tz+tvG/eaudrz8sxl/PfkL7EeNhxa+p4jX+NBpVvf0P1OlftmXF2w==",
    ""
  };

  static char newstr [1345] = "";
  newstr[0] = '\0';
  for (i = 0; i < 19; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c1_sliding_controller_const(SimStruct *S)
{
  const char* newstr = sf_c1_sliding_controller_const_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(614325834U));
  ssSetChecksum1(S,(4071890510U));
  ssSetChecksum2(S,(2385365703U));
  ssSetChecksum3(S,(1589225593U));
}

static void mdlRTW_c1_sliding_controller_const(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c1_sliding_controller_const(SimStruct *S)
{
  SFc1_sliding_controller_constInstanceStruct *chartInstance;
  chartInstance = (SFc1_sliding_controller_constInstanceStruct *)utMalloc(sizeof
    (SFc1_sliding_controller_constInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc1_sliding_controller_constInstanceStruct));
  chartInstance = new (chartInstance)
    SFc1_sliding_controller_constInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c1_sliding_controller_const;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c1_sliding_controller_const;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c1_sliding_controller_const;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c1_sliding_controller_const;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c1_sliding_controller_const;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c1_sliding_controller_const;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c1_sliding_controller_const;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c1_sliding_controller_const;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c1_sliding_controller_const;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c1_sliding_controller_const;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c1_sliding_controller_const;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c1_sliding_controller_const;
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

  mdl_setup_runtime_resources_c1_sliding_controller_const(chartInstance);
}

void c1_sliding_controller_const_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c1_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c1_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c1_sliding_controller_const(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c1_sliding_controller_const_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
