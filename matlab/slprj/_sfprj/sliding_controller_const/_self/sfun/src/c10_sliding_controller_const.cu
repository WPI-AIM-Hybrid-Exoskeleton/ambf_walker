/* Include files */

#include "sliding_controller_const_sfun.h"
#include "c10_sliding_controller_const.h"
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
static void initialize_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance);
static void initialize_params_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance);
static void enable_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance);
static void disable_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance);
static void c10_do_animation_call_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance);
static void ext_mode_exec_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance);
static void set_sim_state_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c10_st);
static void sf_gateway_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_start_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_terminate_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance);
static void initSimStructsc10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance);
static void c10_eML_blk_kernel(SFc10_sliding_controller_constInstanceStruct
  *chartInstance, real_T c10_b_q[2], real_T c10_b_qd[2], real_T c10_b_knee[2],
  real_T c10_b_dknee[2], real_T c10_b_ankle[2], real_T c10_b_danke[2]);
static void c10_emlrt_marshallIn(SFc10_sliding_controller_constInstanceStruct
  *chartInstance, const mxArray *c10_b_ankle, const char_T *c10_identifier,
  real_T c10_y[2]);
static void c10_b_emlrt_marshallIn(SFc10_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c10_u, const emlrtMsgIdentifier *c10_parentId,
  real_T c10_y[2]);
static uint8_T c10_c_emlrt_marshallIn
  (SFc10_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c10_b_is_active_c10_sliding_controller_const, const char_T *c10_identifier);
static uint8_T c10_d_emlrt_marshallIn
  (SFc10_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c10_u, const emlrtMsgIdentifier *c10_parentId);
static void init_dsm_address_info(SFc10_sliding_controller_constInstanceStruct
  *chartInstance);
static void init_simulink_io_address
  (SFc10_sliding_controller_constInstanceStruct *chartInstance);

/* Function Definitions */
static void initialize_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c10_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c10_is_active_c10_sliding_controller_const = 0U;
  cudaGetLastError();
}

static void initialize_params_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void enable_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c10_do_animation_call_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance)
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
    &chartInstance->c10_is_active_c10_sliding_controller_const, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c10_y, 4, c10_f_y);
  sf_mex_assign(&c10_st, c10_y, false);
  return c10_st;
}

static void set_sim_state_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance, const mxArray
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
  chartInstance->c10_is_active_c10_sliding_controller_const =
    c10_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c10_u, 4)),
    "is_active_c10_sliding_controller_const");
  sf_mex_destroy(&c10_u);
  sf_mex_destroy(&c10_st);
}

static void sf_gateway_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance)
{
  chartInstance->c10_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c10_eML_blk_kernel(chartInstance, *chartInstance->c10_q,
                     *chartInstance->c10_qd, *chartInstance->c10_knee,
                     *chartInstance->c10_dknee, *chartInstance->c10_ankle,
                     *chartInstance->c10_danke);
  c10_do_animation_call_c10_sliding_controller_const(chartInstance);
}

static void mdl_start_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance)
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

static void mdl_setup_runtime_resources_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance)
{
}

static void initSimStructsc10_sliding_controller_const
  (SFc10_sliding_controller_constInstanceStruct *chartInstance)
{
}

const mxArray *sf_c10_sliding_controller_const_get_eml_resolved_functions_info()
{
  const mxArray *c10_nameCaptureInfo = NULL;
  const char_T *c10_data[4] = {
    "789cc553cb4ac34014bd955adc545d09825b372e1cdd886b8b850a2db50f5c88c69b64d20c9d874c52dbbaf113fc0137fe853fe53f98a44dd30443c4623d10ee"
    "1c4ee69e7b0f0c941acd12006c07dffb0bc079052254670576e77503d2c8eaa59c1a6313caa97ba1fe16f8bdceb9a5a44f27fe8c48147471d3568249947e6ffa",
    "4841534ff1276a478ac338ed3141bbcba41532515f92162494c273cda5d6b03b12a05d2f99902f93288f100f39fb960bf2c8229b47f6bfd86ff24bbfb8ff5e81"
    "5fac3b4a8f51dbc6904926d0679667703a587defd8b7923bc74cb1d5c8e434f1fb58d1af97eb97d66f2fef88ab0425127d1725a37ca0b8eda03689857e908631",
    "f688a72d82c2748c31f221d5240888a349becfec58847d8b72dbf9e11e79efa70a5b51fd6cefe33afdee8f0e0ed7e917e3bffcd6f5fe6eda177872f67cc53a1d"
    "5d6f5ef7bb8dfe69ab96ccd12ef0299a0372f85ff7ff0232e066a9", "" };

  c10_nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&c10_data[0], 1616U, &c10_nameCaptureInfo);
  return c10_nameCaptureInfo;
}

static void c10_eML_blk_kernel(SFc10_sliding_controller_constInstanceStruct
  *chartInstance, real_T c10_b_q[2], real_T c10_b_qd[2], real_T c10_b_knee[2],
  real_T c10_b_dknee[2], real_T c10_b_ankle[2], real_T c10_b_danke[2])
{
  real_T c10_a;
  real_T c10_b_a;
  c10_b_knee[0] = -0.324 * muDoubleScalarCos(c10_b_q[0]);
  c10_b_knee[1] = -0.324 * muDoubleScalarSin(c10_b_q[0]);
  c10_a = -0.324 * c10_b_qd[0];
  c10_b_dknee[0] = c10_a * -muDoubleScalarSin(c10_b_q[0]);
  c10_b_dknee[1] = c10_a * muDoubleScalarCos(c10_b_q[0]);
  c10_b_a = -0.39 * (c10_b_qd[0] + c10_b_qd[1]);
  c10_b_ankle[0] = c10_b_knee[0] - -0.39 * muDoubleScalarSin(c10_b_q[0] +
    c10_b_q[1]);
  c10_b_ankle[1] = c10_b_knee[1] - -0.39 * muDoubleScalarCos(c10_b_q[0] +
    c10_b_q[1]);
  c10_b_danke[0] = c10_b_dknee[0] + c10_b_a * -muDoubleScalarSin(c10_b_q[0] +
    c10_b_q[1]);
  c10_b_danke[1] = c10_b_dknee[1] + c10_b_a * muDoubleScalarCos(c10_b_q[0] +
    c10_b_q[1]);
}

static void c10_emlrt_marshallIn(SFc10_sliding_controller_constInstanceStruct
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

static void c10_b_emlrt_marshallIn(SFc10_sliding_controller_constInstanceStruct *
  chartInstance, const mxArray *c10_u, const emlrtMsgIdentifier *c10_parentId,
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
  (SFc10_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c10_b_is_active_c10_sliding_controller_const, const char_T *c10_identifier)
{
  emlrtMsgIdentifier c10_thisId;
  uint8_T c10_y;
  c10_thisId.fIdentifier = const_cast<const char_T *>(c10_identifier);
  c10_thisId.fParent = NULL;
  c10_thisId.bParentIsCell = false;
  c10_y = c10_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c10_b_is_active_c10_sliding_controller_const), &c10_thisId);
  sf_mex_destroy(&c10_b_is_active_c10_sliding_controller_const);
  return c10_y;
}

static uint8_T c10_d_emlrt_marshallIn
  (SFc10_sliding_controller_constInstanceStruct *chartInstance, const mxArray
   *c10_u, const emlrtMsgIdentifier *c10_parentId)
{
  uint8_T c10_b_u;
  uint8_T c10_y;
  sf_mex_import(c10_parentId, sf_mex_dup(c10_u), &c10_b_u, 1, 3, 0U, 0, 0U, 0);
  c10_y = c10_b_u;
  sf_mex_destroy(&c10_u);
  return c10_y;
}

static void init_dsm_address_info(SFc10_sliding_controller_constInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address
  (SFc10_sliding_controller_constInstanceStruct *chartInstance)
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
void sf_c10_sliding_controller_const_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1880680695U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1680452377U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3479659674U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3127653308U);
}

mxArray *sf_c10_sliding_controller_const_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c10_sliding_controller_const_jit_fallback_info(void)
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

mxArray *sf_c10_sliding_controller_const_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c10_sliding_controller_const(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPiCOYGFgYAPSHEDMxAABrFA+I5TNCBdngYsrAHFJZUEqSLy4KNkzBUjnJeaC+Ym"
    "lFZ55aflg8y0YEOazYTGfEcl8Tqg4BHywp0y/jAO6fhYC/hOA8hPzsnNSoeEDC6eB84cS2f5IAX"
    "pk8PhDgXx/ZOelDh5/iID9YUDAHywo/mBhAHmBOu7HDEfS9EPzPQH3q6HFA4ifWRyfmFySWZYan"
    "2xoEF+ck5mSmZcen5yfV1KUn5OTWgRiFpcg4gkAp34vDQ=="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c10_sliding_controller_const_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sQh5nvZHhAQaTmI03z90vbC";
}

static void sf_opaque_initialize_c10_sliding_controller_const(void
  *chartInstanceVar)
{
  initialize_params_c10_sliding_controller_const
    ((SFc10_sliding_controller_constInstanceStruct*) chartInstanceVar);
  initialize_c10_sliding_controller_const
    ((SFc10_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c10_sliding_controller_const(void *chartInstanceVar)
{
  enable_c10_sliding_controller_const
    ((SFc10_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c10_sliding_controller_const(void
  *chartInstanceVar)
{
  disable_c10_sliding_controller_const
    ((SFc10_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c10_sliding_controller_const(void
  *chartInstanceVar)
{
  sf_gateway_c10_sliding_controller_const
    ((SFc10_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c10_sliding_controller_const
  (SimStruct* S)
{
  return get_sim_state_c10_sliding_controller_const
    ((SFc10_sliding_controller_constInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c10_sliding_controller_const(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c10_sliding_controller_const
    ((SFc10_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c10_sliding_controller_const
  (void *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc10_sliding_controller_constInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_const_optimization_info();
    }

    mdl_cleanup_runtime_resources_c10_sliding_controller_const
      ((SFc10_sliding_controller_constInstanceStruct*) chartInstanceVar);
    ((SFc10_sliding_controller_constInstanceStruct*) chartInstanceVar)->
      ~SFc10_sliding_controller_constInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c10_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_start_c10_sliding_controller_const
    ((SFc10_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c10_sliding_controller_const(void
  *chartInstanceVar)
{
  mdl_terminate_c10_sliding_controller_const
    ((SFc10_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc10_sliding_controller_const
    ((SFc10_sliding_controller_constInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c10_sliding_controller_const(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c10_sliding_controller_const
      ((SFc10_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr
       (S));
    initSimStructsc10_sliding_controller_const
      ((SFc10_sliding_controller_constInstanceStruct*)sf_get_chart_instance_ptr
       (S));
  }
}

const char* sf_c10_sliding_controller_const_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [19] = {
    "eNrtV81u20YQpgQ5SIA28CFAL0EbFEXaSwEXRYH20timJESBHTulnAY91FgvR+JCy112f2ir79C",
    "ce+m9D9BLn6BAniCnPEPQJ+gsScsyRVKR3SROURq0tOQ33843Mzu78lqDXQ+vm3j/esvzruHndb",
    "zbXn6tFePW3J0/73ifFuNf0EjYeJ8oEmuv8RIkhu9AS24Nk2IgRrISxsQIFAiK2EQqU8emWWw5E",
    "5O+FdTx6e8jRqMgkpaH22hLwj3Bp8iWWLOPPF2mgJo+QGgiJe046nMynnmszLEfAZ1oGzdJ0GAC",
    "mzi39K7lhiUceidAB0Ibgh7rM98CQwz45qRWplOqg1OgjBPOiKhUGxEdQIIBNnCQhPh/zxoUVYb",
    "RiCizDRFJQe+wScYpBZQ5mcYXR0wQIxUjvBdz3xku+rbP0Z9dGQJvCAj6tq2ATBLJhKnPf9BHpT",
    "1Bjjh04ciO69kC+Mm65D9mcAyqNm4jX6agyBj2RO2kWUB6J1m2ZlWyCDMshsdEbVHMn4awtnqxc",
    "nRAME8wRIs6GGQiB3qoWIrhrWWz8cBV5rIlY+M82XoZLGPrpdCUhRlbnwqfcK5rYUOZ7EAKPGPt",
    "EkOaYTlrNU5rFg4lBtiVd/1qsIJh4guYL0XIKtOVlgBZ33mIjeU8klptZOxj8XZ3dhZfL8IGwoA",
    "aEQpVXUARpgFjloW3ni1k2uUegeiVydyrAucVsgzl6ZEV3WOpJhiThiZyJsFltBYY6zHmElfCgc",
    "ZF0wRzuVyGo4RGELoGwzjs4rJBbEVMtGttW7juUmamXdBUsaQiqxZXHbahniuoaQIHYiLksegrG",
    "QdFj8/DC4DVRpRgYryN/UtN+zh7VSrcfrbhne1n773CfnZqV/78bI6nVcHjzX2W573RPo9vl+Zt",
    "41+rldttztm9X5qnU7JzuHW8H7z47ZOHH/7x91/PPn86/f3PH5fN31qYv5V9d3bX11bb/28W49u",
    "njXa2cNKFenXY+3N+dSr4P5jjXy/G+lH0lUh/uB9tPSLDeLDx5c/fbKRHfsb3pNPs71rJ39Pnd1",
    "zHxyrL6lPRQVgcTNyY2Hy7dvxfz/l7bUk8bhTP8+vlvcvZ394s23eW6FsvxkRMOJTq9+3p+PjCO",
    "kIUcnV03Lm4jgkeGq6Mjlub5f5QpaNzTkfHcxL+Hf8X47iafT7/kyX+3y3l4W52XjwkbheCQ/rF",
    "xqHmLMQt5JBKYZTkHJT7qs35PF20j65q571hu3fFz//tXn/eX+Vc1L6gXeeS57A3ZXdZfaueD68",
    "avmk/8Er49Sus47Ln9teNf+6tdr7+qBh/O/sJ7UeMhxW/porX+NNoVPX2P1Cn/wAtacYN",
    ""
  };

  static char newstr [1345] = "";
  newstr[0] = '\0';
  for (i = 0; i < 19; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c10_sliding_controller_const(SimStruct *S)
{
  const char* newstr = sf_c10_sliding_controller_const_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(614325834U));
  ssSetChecksum1(S,(4071890510U));
  ssSetChecksum2(S,(2385365703U));
  ssSetChecksum3(S,(1589225593U));
}

static void mdlRTW_c10_sliding_controller_const(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c10_sliding_controller_const(SimStruct *S)
{
  SFc10_sliding_controller_constInstanceStruct *chartInstance;
  chartInstance = (SFc10_sliding_controller_constInstanceStruct *)utMalloc
    (sizeof(SFc10_sliding_controller_constInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc10_sliding_controller_constInstanceStruct));
  chartInstance = new (chartInstance)
    SFc10_sliding_controller_constInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c10_sliding_controller_const;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c10_sliding_controller_const;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c10_sliding_controller_const;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c10_sliding_controller_const;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c10_sliding_controller_const;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c10_sliding_controller_const;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c10_sliding_controller_const;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c10_sliding_controller_const;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c10_sliding_controller_const;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c10_sliding_controller_const;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c10_sliding_controller_const;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c10_sliding_controller_const;
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

  mdl_setup_runtime_resources_c10_sliding_controller_const(chartInstance);
}

void c10_sliding_controller_const_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c10_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c10_sliding_controller_const(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c10_sliding_controller_const(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c10_sliding_controller_const_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
