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
    "789cc553cb4ac34014bd95b6e8a2eacaad7fe08082b8562a58a8545af085a493e4a6193b0f9da4a65df909fe8a1bc1bff067fc00f368da26182216eb8170e770"
    "32f7dc7b60a072d6ae00c066f86d3c031cd521462329b03dad6b90455eaf14d41435a866ee457a2df47b99724b491fc77e42241538bb692bc124957e6ff280a0",
    "d153fc09ed587118c71e13d85d24e71113a70bd28c4452743e71d11a764702b4ebcd27e48b24ce2342bf60df6a491e79e4f3c8ff97fa8d7fe997f6df29f14b75"
    "47e9806adb1832c904f599e5191c07cbef9dfad60be748145b8d4c8e73bff725fd7a857e59fdb679475c259048eabb5432e403c56d876a9358d40fd330028f78",
    "da2254988e11503e444dc2803835c9f799ed89a86f596e5b3fdca3e8fd34603daee4f3b5bf4abf8fb7fbdd55faa5f82fbf55bd3fab134c9a97fb37faa2ed1c1e"
    "5cf1c7eb564b1ecfe7e894f894cd0105fcaffb7f01900e67d7", "" };

  c19_nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&c19_data[0], 1616U, &c19_nameCaptureInfo);
  return c19_nameCaptureInfo;
}

static void c19_eML_blk_kernel(SFc19_sliding_controller2InstanceStruct
  *chartInstance, real_T c19_b_q[2], real_T c19_b_qd[2], real_T c19_b_knee[2],
  real_T c19_b_dknee[2], real_T c19_b_ankle[2], real_T c19_b_danke[2])
{
  real_T c19_a;
  real_T c19_b_a;
  c19_b_knee[0] = 0.324 * muDoubleScalarCos(c19_b_q[0]);
  c19_b_knee[1] = 0.324 * muDoubleScalarSin(c19_b_q[0]);
  c19_a = 0.324 * c19_b_qd[0];
  c19_b_dknee[0] = c19_a * -muDoubleScalarSin(c19_b_q[0]);
  c19_b_dknee[1] = c19_a * muDoubleScalarCos(c19_b_q[0]);
  c19_b_a = 0.39 * (c19_b_qd[0] + c19_b_qd[1]);
  c19_b_ankle[0] = c19_b_knee[0] + 0.39 * muDoubleScalarCos(c19_b_q[0] +
    c19_b_q[1]);
  c19_b_ankle[1] = c19_b_knee[1] + 0.39 * muDoubleScalarSin(c19_b_q[0] +
    c19_b_q[1]);
  c19_b_danke[0] = c19_b_dknee[0] + c19_b_a * -muDoubleScalarSin(c19_b_q[0] +
    c19_b_q[1]);
  c19_b_danke[1] = c19_b_dknee[1] + c19_b_a * muDoubleScalarCos(c19_b_q[0] +
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
    "eNrtV81u20YQpgQ5SIDW8CFALwHyc2mObosCTQ+pbUpCCNi1U8ppUKAw1suRuNByl9kf2u475N5",
    "DX6HPkmN66jP02GNnSVqWKZKK7CZ1i9Kg5CW/+Xa+mdnZldcJ9jy81vH++a7n3cLv23h3veJaK8",
    "edubt43vM+Lcev0UjY5IAokmiv9RIkge9AS24NkyIQY1kLY2IMCgRFbCqVaWLTLLGcienQCur49",
    "Pcxo3EYS8ujHbQl0b7gZ8iWWnOAPH2mgJohQGRiJe0kHnIymXmszIkfA51qm7RJ0GBCmzq39J7l",
    "hqUcBqdAA6ENQY/1hW+hIQZ8c9oo0ynV4TlQJilnRNSqjYkOIcUAGzhMI/zctwZFVWE0JsrsQEw",
    "y0LtsmnNKAVVOpvHFMRPESMUIHyTcd4aLvh1w9GdPRsBbAoK+7Sgg01QyYZrzHw5R6UCQYw59OL",
    "aTZrYQXlmX/BcMTkA1xm3sywwUmcC+aJw0D8jgNM/WrEoWYYYl8IKobYr50xA1Vi9Wjg4J5glGa",
    "NEEg1xkoEeKZRjeRjabBK4yly0ZmxTJ1stgOdsgg7YszNiGVPiEc90IG8l0FzLgOWufGNIOK1jr",
    "cVqzaCQxwK68m1eDFQwTX8J8KSJWm66sAsj7zrfYWC4jqdVGJj4Wb393d/H1IiwQBtSYUKjrAoo",
    "wDRizPLzNbBHTLvcIRK9M7l4duKiQZShPj63on0g1xZi0NJELCS6jjcBETzCXuBIONS6aNpjL5T",
    "IcJTSGyDUYxmEPlw1ia2KiXWvbxnWXMXPWB00VS2uyanHVYRsauII6S+FQTIU8EUMlk7Ds8UV4A",
    "bDaiBJMTHawf6mzIc5elwq3n216F/vZR++wn53bVb8fz/F0ani8ue/qvHe6l/Hdyrxd/Ot0Crut",
    "ObuPK/P0KnYOt4H3r8H64zev35L+7788/fpH789l83cW5u/k/zu722ur7f/r5fjeeaOdLZxsoV4",
    "d9tmcX70a/k/m+DfKsX4efymyH57F28/JKAk2v/jpyWZ27Od8L3vt/q5V/D1//sB1fKyyvD4VDa",
    "LyYOLGxBbbteP/as7fW0vicad8Xlx/fHM9+3tbVfveEn0b5ZiIKYdK/f5zOh5dWUeEQm6OjgdX1",
    "zHFQ8ON0XF3q9of6nT0LunoeU7C3+P/YhxXsy/mf7nE/4eVPDzMz4tHxO1CcEQ/e3KkOYtwCzmi",
    "UhglOQf1eU3fv2ofXdXO+8B2/xY//7d7/3l/l3NR94p2vWuewz6U3XX1rXo+vGn4tv3Aq+A3brC",
    "O657b3zf+N2+18/X9cvx09hPajxmPan5Nla/xp9G47u1/oE7/Auy4woQ=",
    ""
  };

  static char newstr [1333] = "";
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
  ssSetChecksum0(S,(672025005U));
  ssSetChecksum1(S,(1641516495U));
  ssSetChecksum2(S,(1050467908U));
  ssSetChecksum3(S,(4160773434U));
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
