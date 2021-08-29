/* Include files */

#include "sliding_controller_const_sfun.h"
#include "c19_sliding_controller_const.h"
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
static void initialize_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance);
static void initialize_params_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance);
static void enable_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance);
static void disable_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance);
static void c19_do_animation_call_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance);
static void ext_mode_exec_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance);
static void set_sim_state_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c19_st);
static void sf_gateway_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_start_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_terminate_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance);
static void initSimStructsc19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance);
static void c19_eML_blk_kernel(SFc19_sliding_controller_constInstanceStruct
  *chartInstance, real_T c19_b_q[2], real_T c19_b_qd[2], real_T c19_b_knee[2],
  real_T c19_b_dknee[2], real_T c19_b_ankle[2], real_T c19_b_danke[2]);
static void c19_emlrt_marshallIn(SFc19_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c19_b_ankle, const char_T *c19_identifier,
  real_T c19_y[2]);
static void c19_b_emlrt_marshallIn(SFc19_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c19_u, const emlrtMsgIdentifier *c19_parentId,
  real_T c19_y[2]);
static uint8_T c19_c_emlrt_marshallIn
  (SFc19_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c19_b_is_active_c19_sliding_controller_const, const char_T *c19_identifier);
static uint8_T c19_d_emlrt_marshallIn
  (SFc19_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c19_u, const emlrtMsgIdentifier *c19_parentId);
static void init_dsm_address_info(SFc19_sliding_controller_constInstanceStruct
  *chartInstance);
static void init_simulink_io_address
  (SFc19_sliding_controller_constInstanceStruct *chartInstance);

/* Function Definitions */
static void initialize_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c19_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c19_is_active_c19_sliding_controller_const = 0U;
  cudaGetLastError();
}

static void initialize_params_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void enable_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c19_do_animation_call_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance)
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
    &chartInstance->c19_is_active_c19_sliding_controller_const, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c19_y, 4, c19_f_y);
  sf_mex_assign(&c19_st, c19_y, false);
  return c19_st;
}

static void set_sim_state_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance, const mxArray
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
  chartInstance->c19_is_active_c19_sliding_controller_const =
    c19_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c19_u, 4)),
    "is_active_c19_sliding_controller_const");
  sf_mex_destroy(&c19_u);
  sf_mex_destroy(&c19_st);
}

static void sf_gateway_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance)
{
  chartInstance->c19_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c19_eML_blk_kernel(chartInstance, *chartInstance->c19_q,
                     *chartInstance->c19_qd, *chartInstance->c19_knee,
                     *chartInstance->c19_dknee, *chartInstance->c19_ankle,
                     *chartInstance->c19_danke);
  c19_do_animation_call_c19_sliding_controller_const(chartInstance);
}

static void mdl_start_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance)
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

static void mdl_setup_runtime_resources_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void initSimStructsc19_sliding_controller_const
  (SFc19_sliding_controller_constInstanceStruct *chartInstance)
{
}

const mxArray *sf_c19_sliding_controller_const_get_eml_resolved_functions_info()
{
  const mxArray *c19_nameCaptureInfo = NULL;
  const char_T *c19_data[4] = {
    "789cc553cb4ac34014bd955adc545d09825b372e1cdd886b8b850a2db50f5c88c69b64d20c9d874c52dbbaf113fc1dbfc7853bffc1246d9a26182216eb8170e7"
    "7032f7dc7b60a0d4689600603bf83e5e00ce2b10a13a2bb03baf1b9046562fe5d4189b504edd0bf5f7c0ef75ce2d257d3af16744a2a08b9bb6124ca2f47bd347",
    "0a9a7a8a3f513b521cc6698f09da5d26ad9089fa92b420a1149e6b2eb586dd9100ed7ac9847c9944798478c8d9b75c904716d93cb2ffc57e935ffac5fdf70afc"
    "62dd517a8cda36864c32813eb33c83d3c1ea7bc7be95dc39668aad4626a789dfdb8a7ebd5cbfb47e7b79475c252891e8bb2819e503c56d07b5492cf483348cb1",
    "473c6d1114a6638c910fa92641401c4df27d66c722ec5b94dbce0ff7c87b3f55d88aea677b1fd7e9777f7470b84ebf18ffe5b7aef777d3bec093b3e72bd6e9e8"
    "7af3badf6df44f5bb5648e76814fd11c90c3ffbaff177b596734", "" };

  c19_nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&c19_data[0], 1616U, &c19_nameCaptureInfo);
  return c19_nameCaptureInfo;
}

static void c19_eML_blk_kernel(SFc19_sliding_controller_constInstanceStruct
  *chartInstance, real_T c19_b_q[2], real_T c19_b_qd[2], real_T c19_b_knee[2],
  real_T c19_b_dknee[2], real_T c19_b_ankle[2], real_T c19_b_danke[2])
{
  real_T c19_a;
  real_T c19_b_a;
  c19_b_knee[0] = -0.324 * muDoubleScalarCos(c19_b_q[0]);
  c19_b_knee[1] = -0.324 * muDoubleScalarSin(c19_b_q[0]);
  c19_a = -0.324 * c19_b_qd[0];
  c19_b_dknee[0] = c19_a * -muDoubleScalarSin(c19_b_q[0]);
  c19_b_dknee[1] = c19_a * muDoubleScalarCos(c19_b_q[0]);
  c19_b_a = -0.39 * (c19_b_qd[0] + c19_b_qd[1]);
  c19_b_ankle[0] = c19_b_knee[0] - -0.39 * muDoubleScalarSin(c19_b_q[0] +
    c19_b_q[1]);
  c19_b_ankle[1] = c19_b_knee[1] - -0.39 * muDoubleScalarCos(c19_b_q[0] +
    c19_b_q[1]);
  c19_b_danke[0] = c19_b_dknee[0] + c19_b_a * -muDoubleScalarSin(c19_b_q[0] +
    c19_b_q[1]);
  c19_b_danke[1] = c19_b_dknee[1] + c19_b_a * muDoubleScalarCos(c19_b_q[0] +
    c19_b_q[1]);
}

static void c19_emlrt_marshallIn(SFc19_sliding_controller_constInstanceStruct
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

static void c19_b_emlrt_marshallIn(SFc19_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c19_u, const emlrtMsgIdentifier *c19_parentId,
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
  (SFc19_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c19_b_is_active_c19_sliding_controller_const, const char_T *c19_identifier)
{
  emlrtMsgIdentifier c19_thisId;
  uint8_T c19_y;
  c19_thisId.fIdentifier = const_cast<const char_T *>(c19_identifier);
  c19_thisId.fParent = NULL;
  c19_thisId.bParentIsCell = false;
  c19_y = c19_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c19_b_is_active_c19_sliding_controller_const), &c19_thisId);
  sf_mex_destroy(&c19_b_is_active_c19_sliding_controller_const);
  return c19_y;
}

static uint8_T c19_d_emlrt_marshallIn
  (SFc19_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c19_u, const emlrtMsgIdentifier *c19_parentId)
{
  uint8_T c19_b_u;
  uint8_T c19_y;
  sf_mex_import(c19_parentId, sf_mex_dup(c19_u), &c19_b_u, 1, 3, 0U, 0, 0U, 0);
  c19_y = c19_b_u;
  sf_mex_destroy(&c19_u);
  return c19_y;
}

static void init_dsm_address_info(SFc19_sliding_controller_constInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address
  (SFc19_sliding_controller_constInstanceStruct *chartInstance)
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
void sf_c19_sliding_controller_const_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1880680695U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1680452377U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3479659674U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3127653308U);
}

mxArray *sf_c19_sliding_controller_const_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c19_sliding_controller_const_jit_fallback_info(void)
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

mxArray *sf_c19_sliding_controller_const_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c19_sliding_controller_const(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPiCOYGFgYAPSHEDMxAABrFA+I5TNCBdngYsrAHFJZUEqSLy4KNkzBUjnJeaC+Ym"
    "lFZ55aflg8y0YEOazYTGfEcl8Tqg4BHywp0y/jAO6fhYC/hOA8hPzsnNSoeEDC6eB84cS2f5IAX"
    "pk8PhDgXx/ZOelDh5/iID9YUDAHywo/mBhAHmBOu7HDEfS9EPzPQH3q6HFA4ifWRyfmFySWZYan"
    "2xoGV+ck5mSmZcen5yfV1KUn5OTWgRiFpcg4gkAqMIvFg=="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c19_sliding_controller_const_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sQh5nvZHhAQaTmI03z90vbC";
}

static void sf_opaque_initialize_c19_sliding_controller_const(void
  *chartInstanceVar)
{
  initialize_params_c19_sliding_controller_const
    ((SFc19_sliding_controller_constInstanceStruct*) chartInstanceVar);
  initialize_c19_sliding_controller_const
    ((SFc19_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c19_sliding_controller_const(void *chartInstanceVar)
{
  enable_c19_sliding_controller_const
    ((SFc19_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c19_sliding_controller_const(void
  *chartInstanceVar)
{
  disable_c19_sliding_controller_const
    ((SFc19_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c19_sliding_controller_const(void
  *chartInstanceVar)
{
  sf_gateway_c19_sliding_controller_const
    ((SFc19_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c19_sliding_controller_const
  (SimStruct* S)
{
  return get_sim_state_c19_sliding_controller_const
    ((SFc19_sliding_controller_constInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c19_sliding_controller_const(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c19_sliding_controller_const
    ((SFc19_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c19_sliding_controller_const
  (void *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc19_sliding_controller_constInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_const_optimization_info();
    }

    mdl_cleanup_runtime_resources_c19_sliding_controller_const
      ((SFc19_sliding_controller_constInstanceStruct*) chartInstanceVar);
    ((SFc19_sliding_controller_constInstanceStruct*) chartInstanceVar)->
      ~SFc19_sliding_controller_constInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c19_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_start_c19_sliding_controller_const
    ((SFc19_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c19_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_terminate_c19_sliding_controller_const
    ((SFc19_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc19_sliding_controller_const
    ((SFc19_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c19_sliding_controller_const(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c19_sliding_controller_const
      ((SFc19_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr
       (S));
    initSimStructsc19_sliding_controller_const
      ((SFc19_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr
       (S));
  }
}

const char* sf_c19_sliding_controller_const_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [19] = {
    "eNrtV81u20YQpgQ5SIA28CFAL0EbFEXaSwEHQYHm0tqmJESFHTulnAQ51FgvR+JCy112f2ir75C",
    "ce+m9D9BLn6BAn6CnPkORJ8gsScsyRVKR3aRuURq0tOQ33843Mzu78lqDXQ+vm3j/eMvzruHndb",
    "zbXn6tFePW3J0/73ifFuMXaCRsvE8UibXXeAkSw7egJbeGSTEQI1kJY2IECgRFbCKVqWPTLLaci",
    "UnfCur49NOI0SiIpOXhNtqScE/wKbIl1uwjT5cpoKYPEJpISTuO+pyMZx4rc+xHQCfaxk0SNJjA",
    "Js4tvWu5YQmH3gnQgdCGoMf6zLfAEAO+OamV6ZTq4BQo44QzIirVRkQHkGCADRwkIf7fswZFlWE",
    "0IspsQ0RS0DtsknFKAWVOpvHFERPESMUI78Xcd4aLvu1z9GdXhsAbAoK+bSsgk0QyYerzH/RRaU",
    "+QIw5dOLLjerYAvrcu+U8YHIOqjdvIlykoMoY9UTtpFpDeSZatWZUswgyL4QlRWxTzpyGsrV6sH",
    "B0QzBMM0aIOBpnIgR4qlmJ4a9lsPHCVuWzJ2DhPtl4Gy9h6KTRlYcbWp8InnOta2FAmO5ACz1i7",
    "xJBmWM5ajdOahUOJAXblXb8arGCY+ALmSxGyynSlJUDWdx5hYzmPpFYbGftYvN2dncXXi7CBMKB",
    "GhEJVF1CEacCYZeGtZwuZdrlHIHplMveqwHmFLEN5emRF91iqCcakoYmcSXAZrQXGeoy5xJVwoH",
    "HRNMFcLpfhKKERhK7BMA67uGwQWxET7VrbFq67lJlpFzRVLKnIqsVVh22o5wpqmsCBmAh5LPpKx",
    "kHR4/PwAmC1ESWYGG9j/1LTPs5elQq3n214Z/vZe2+wn53alT8/m+NpVfB4c5/leW+0z+PbpXnb",
    "+Ndq5Xabc3bvl+bplOwcbh3vb/786ZNHH/7y6rffP385/fnX75bN31qYv5V9d3bX11bb/28W49u",
    "njXa2cNKFenXYh3N+dSr4P5jjXy/G+nH0hUifP4y2HpNhPNi4/8ODjfTIz/iedZr9XSv5e/r8ju",
    "v4WGVZfSo6CIuDiRsTm2/Xjv/LOX+vLYnHjeJ5fv319eXsb2+W7TtL9K0XYyImHEr1+8/p+PjCO",
    "kIUcnV03Lm4jgkeGq6Mjlub5f5QpaNzTkfHcxL+Hv8X47iafT7/syX+3y3l4W52XjwkbheCQ3rv",
    "waHmLMQt5JBKYZTkHJT7qs35PF20j65q571ju3+Ln//bvf28v8m5qH1Bu84lz2Hvyu6y+lY9H14",
    "1fNN+4JXw61dYx2XP7W8b/4e32vn6o2L81ewntB8xHlb8mipe40+jUdXb/0CdvgZyvcYW",
    ""
  };

  static char newstr [1345] = "";
  newstr[0] = '\0';
  for (i = 0; i < 19; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c19_sliding_controller_const(SimStruct *S)
{
  const char* newstr = sf_c19_sliding_controller_const_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(614325834U));
  ssSetChecksum1(S,(4071890510U));
  ssSetChecksum2(S,(2385365703U));
  ssSetChecksum3(S,(1589225593U));
}

static void mdlRTW_c19_sliding_controller_const(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c19_sliding_controller_const(SimStruct *S)
{
  SFc19_sliding_controller_constInstanceStruct *chartInstance;
  chartInstance = (SFc19_sliding_controller_constInstanceStruct *)utMalloc
    (sizeof(SFc19_sliding_controller_constInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc19_sliding_controller_constInstanceStruct));
  chartInstance = new (chartInstance)
    SFc19_sliding_controller_constInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c19_sliding_controller_const;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c19_sliding_controller_const;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c19_sliding_controller_const;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c19_sliding_controller_const;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c19_sliding_controller_const;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c19_sliding_controller_const;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c19_sliding_controller_const;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c19_sliding_controller_const;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c19_sliding_controller_const;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c19_sliding_controller_const;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c19_sliding_controller_const;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c19_sliding_controller_const;
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

  mdl_setup_runtime_resources_c19_sliding_controller_const(chartInstance);
}

void c19_sliding_controller_const_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c19_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c19_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c19_sliding_controller_const(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c19_sliding_controller_const_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
