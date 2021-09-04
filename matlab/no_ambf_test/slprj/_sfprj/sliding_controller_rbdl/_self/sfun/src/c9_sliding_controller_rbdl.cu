/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c9_sliding_controller_rbdl.h"
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
static void initialize_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c9_do_animation_call_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c9_st);
static void sf_gateway_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c9_eML_blk_kernel(SFc9_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c9_b_q[2], real_T c9_b_y[4]);
static void c9_emlrt_marshallIn(SFc9_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c9_b_y, const char_T *c9_identifier, real_T
  c9_c_y[4]);
static void c9_b_emlrt_marshallIn(SFc9_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c9_u, const emlrtMsgIdentifier *c9_parentId,
  real_T c9_b_y[4]);
static uint8_T c9_c_emlrt_marshallIn(SFc9_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c9_b_is_active_c9_sliding_controller_rbdl, const
  char_T *c9_identifier);
static uint8_T c9_d_emlrt_marshallIn(SFc9_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c9_u, const emlrtMsgIdentifier *c9_parentId);
static void init_dsm_address_info(SFc9_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc9_sliding_controller_rbdlInstanceStruct *
  chartInstance);

/* Function Definitions */
static void initialize_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c9_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c9_is_active_c9_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c9_do_animation_call_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  const mxArray *c9_b_y = NULL;
  const mxArray *c9_c_y = NULL;
  const mxArray *c9_d_y = NULL;
  const mxArray *c9_st;
  c9_st = NULL;
  c9_b_y = NULL;
  sf_mex_assign(&c9_b_y, sf_mex_createcellmatrix(2, 1), false);
  c9_c_y = NULL;
  sf_mex_assign(&c9_c_y, sf_mex_create("y", *chartInstance->c9_y, 0, 0U, 1U, 0U,
    2, 2, 2), false);
  sf_mex_setcell(c9_b_y, 0, c9_c_y);
  c9_d_y = NULL;
  sf_mex_assign(&c9_d_y, sf_mex_create("y",
    &chartInstance->c9_is_active_c9_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c9_b_y, 1, c9_d_y);
  sf_mex_assign(&c9_st, c9_b_y, false);
  return c9_st;
}

static void set_sim_state_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c9_st)
{
  const mxArray *c9_u;
  c9_u = sf_mex_dup(c9_st);
  c9_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c9_u, 0)), "y",
                      *chartInstance->c9_y);
  chartInstance->c9_is_active_c9_sliding_controller_rbdl = c9_c_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c9_u, 1)),
     "is_active_c9_sliding_controller_rbdl");
  sf_mex_destroy(&c9_u);
  sf_mex_destroy(&c9_st);
}

static void sf_gateway_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c9_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c9_eML_blk_kernel(chartInstance, *chartInstance->c9_q, *chartInstance->c9_y);
  c9_do_animation_call_c9_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c9_errCode;
  c9_errCode = cudaGetLastError();
  if (c9_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c9_errCode, (char_T *)cudaGetErrorName
                       (c9_errCode), (char_T *)cudaGetErrorString(c9_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c9_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc9_sliding_controller_rbdl
  (SFc9_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c9_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c9_nameCaptureInfo = NULL;
  c9_nameCaptureInfo = NULL;
  sf_mex_assign(&c9_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c9_nameCaptureInfo;
}

static void c9_eML_blk_kernel(SFc9_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c9_b_q[2], real_T c9_b_y[4])
{
  c9_b_y[0] = -0.324 * muDoubleScalarSin(c9_b_q[0]) - 0.39 * muDoubleScalarSin
    (c9_b_q[0] + c9_b_q[1]);
  c9_b_y[2] = 0.324 * muDoubleScalarCos(c9_b_q[0]) + 0.39 * muDoubleScalarSin
    (c9_b_q[0] + c9_b_q[1]);
  c9_b_y[1] = -0.39 * muDoubleScalarSin(c9_b_q[0] + c9_b_q[1]);
  c9_b_y[3] = 0.39 * muDoubleScalarCos(c9_b_q[0] + c9_b_q[1]);
}

static void c9_emlrt_marshallIn(SFc9_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c9_b_y, const char_T *c9_identifier, real_T
  c9_c_y[4])
{
  emlrtMsgIdentifier c9_thisId;
  c9_thisId.fIdentifier = const_cast<const char_T *>(c9_identifier);
  c9_thisId.fParent = NULL;
  c9_thisId.bParentIsCell = false;
  c9_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c9_b_y), &c9_thisId, c9_c_y);
  sf_mex_destroy(&c9_b_y);
}

static void c9_b_emlrt_marshallIn(SFc9_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c9_u, const emlrtMsgIdentifier *c9_parentId,
  real_T c9_b_y[4])
{
  real_T c9_dv[4];
  int32_T c9_i;
  sf_mex_import(c9_parentId, sf_mex_dup(c9_u), c9_dv, 1, 0, 0U, 1, 0U, 2, 2, 2);
  for (c9_i = 0; c9_i < 4; c9_i++) {
    c9_b_y[c9_i] = c9_dv[c9_i];
  }

  sf_mex_destroy(&c9_u);
}

static uint8_T c9_c_emlrt_marshallIn(SFc9_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c9_b_is_active_c9_sliding_controller_rbdl, const
  char_T *c9_identifier)
{
  emlrtMsgIdentifier c9_thisId;
  uint8_T c9_b_y;
  c9_thisId.fIdentifier = const_cast<const char_T *>(c9_identifier);
  c9_thisId.fParent = NULL;
  c9_thisId.bParentIsCell = false;
  c9_b_y = c9_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c9_b_is_active_c9_sliding_controller_rbdl), &c9_thisId);
  sf_mex_destroy(&c9_b_is_active_c9_sliding_controller_rbdl);
  return c9_b_y;
}

static uint8_T c9_d_emlrt_marshallIn(SFc9_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c9_u, const emlrtMsgIdentifier *c9_parentId)
{
  uint8_T c9_b_u;
  uint8_T c9_b_y;
  sf_mex_import(c9_parentId, sf_mex_dup(c9_u), &c9_b_u, 1, 3, 0U, 0, 0U, 0);
  c9_b_y = c9_b_u;
  sf_mex_destroy(&c9_u);
  return c9_b_y;
}

static void init_dsm_address_info(SFc9_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc9_sliding_controller_rbdlInstanceStruct *
  chartInstance)
{
  chartInstance->c9_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c9_q = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c9_y = (real_T (*)[4])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c9_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(552332206U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(2608078302U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(1441289006U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(4066884445U);
}

mxArray *sf_c9_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c9_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c9_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c9_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfh"
    "UU90P4mcXxicklmWWp8cmW8cU5mSmZeenxyfl5JUX5OTmpRfFFSSk5DEj+BAB5bh2C"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c9_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sjS5Om55RaK9v6MEldWgzUF";
}

static void sf_opaque_initialize_c9_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c9_sliding_controller_rbdl
    ((SFc9_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c9_sliding_controller_rbdl
    ((SFc9_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c9_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c9_sliding_controller_rbdl((SFc9_sliding_controller_rbdlInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c9_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c9_sliding_controller_rbdl((SFc9_sliding_controller_rbdlInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c9_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c9_sliding_controller_rbdl
    ((SFc9_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c9_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c9_sliding_controller_rbdl
    ((SFc9_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c9_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c9_sliding_controller_rbdl
    ((SFc9_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c9_sliding_controller_rbdl(void *
  chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc9_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c9_sliding_controller_rbdl
      ((SFc9_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc9_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc9_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c9_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c9_sliding_controller_rbdl
    ((SFc9_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c9_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c9_sliding_controller_rbdl
    ((SFc9_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc9_sliding_controller_rbdl
    ((SFc9_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c9_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c9_sliding_controller_rbdl
      ((SFc9_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc9_sliding_controller_rbdl
      ((SFc9_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c9_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u1EgQdkZZ/rSgCCFxQSIHJPbIJQgOQMj8iBGZTYQT4DbqtGvGnWl3m/5xMrwDJ8QbcOS",
    "wT7Jn7vsCSLzAVtueyeCxPYQRESAsOZ62v6quqq9+Ot5Kt+fhdQXvzauedw6fF/BueNn1R75emb",
    "mz96ve7Xz9BoWEjXaJIpH2ai9BIngGWnJrmBRdMZClMCYGoEBQxMZSmSptmkWWMzHqWEGdPv0iZ",
    "DT0Q2l5sIWyJNgRfIzaYmt2UU+LKaCmAxCYUEk7DDucDKcWK3PUDIGOtI3qXNBgfBs7s3TPcsNi",
    "Du1joF2hDUGL9YltviEGmua40k3nqfYnQBnFnBFR6m1ItA8xBtjAfhzg3x1r0KkijIZEmS0ISQJ",
    "6m41SnVJAUSfT+OGACWKkYoS3I950gvO27XK0pycD4DUBQdu2FJBRLJkw1fz7HfS0LcgBhxYc2G",
    "G1Nh9eWUf+cwZHoCrjNmjKBBQZwo6o3DQNSPs4ZWuaJfMwwyJ4TtRjivxpCCqzFzNH+wR5gj2Uq",
    "IJB6mRX7ymWYHgrtdmo6zJzUcnYKCNbL4Kl2toJ1LEw1dahokk415WwPRlvQwI81doihtTDMq3l",
    "OK1ZsCcxwC69q6vBCobE57CmFAErpSspANK+8zc2li+R1GojoyYmb2t7e/7zPKwrDKgBoVDWBRR",
    "hGjBmaXirtQVMO+4RiFaZ1LwycJYhi1CeHljROpJqhDGpaSInLjhGK4GRHiKXWAn7GoumDua4XI",
    "SjhIYQuAbDOPSwbBBbEhPtWttjrLuEmXELNFUsLmHVYtVhG2q7hBrHsC9GQh6JjpKRn/f4LLwAm",
    "G1ECSaGW9i/1LiDu5dR4ebZHe9knv35FfNsIld8/jWjZ6VEjzfzLO57sVG/bwN/rUzm74zc5cI+",
    "qwU5h1vD+9Lh+rvP6x/G/749/9+T2+8fLLP/P43Tzf8r+frGpNFOCyeZy1eHfTJj12qJ/usz+tf",
    "ytT70N3aijY1n5On95G6vzYMXw9f7nYyfBfY2CvZO3q+7jo9Zluanot0gP5i4NbHZuHb6783Ye2",
    "5BPC7m77Pr06Pl5K9tFnlcXSC/hr/Ghbz99v3XN5eTz/Z/ucD+WwW+b6VzvU9ct4A+vd/XnAVY6",
    "X0qhVGSc1B9dRDwYn1+a76fVs47Y7mfxc7fct+f96+ZX2ct552x3LL+nXaO/2j4unngFfBrP7Af",
    "y56vvjf+o3e6c9DNfP1w+q9OM2Q8KDn15p/xCDso+/oL5On/VxmzNQ==",
    ""
  };

  static char newstr [1257] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c9_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c9_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(2501929482U));
  ssSetChecksum1(S,(2041323763U));
  ssSetChecksum2(S,(3808924622U));
  ssSetChecksum3(S,(1034168136U));
}

static void mdlRTW_c9_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c9_sliding_controller_rbdl(SimStruct *S)
{
  SFc9_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc9_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc9_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc9_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance) SFc9_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c9_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c9_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c9_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c9_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c9_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c9_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c9_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c9_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c9_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c9_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c9_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c9_sliding_controller_rbdl;
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
    chartInstance->c9_JITStateAnimation,
    chartInstance->c9_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c9_sliding_controller_rbdl(chartInstance);
}

void c9_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c9_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c9_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c9_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c9_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
