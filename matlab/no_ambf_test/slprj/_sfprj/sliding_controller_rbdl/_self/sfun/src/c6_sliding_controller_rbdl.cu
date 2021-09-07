/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c6_sliding_controller_rbdl.h"
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
static void initialize_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c6_do_animation_call_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c6_st);
static void sf_gateway_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c6_eML_blk_kernel(SFc6_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c6_b_u[7], real_T c6_b_y[6]);
static void c6_emlrt_marshallIn(SFc6_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c6_b_y, const char_T *c6_identifier, real_T
  c6_c_y[6]);
static void c6_b_emlrt_marshallIn(SFc6_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c6_b_u, const emlrtMsgIdentifier *c6_parentId,
  real_T c6_b_y[6]);
static uint8_T c6_c_emlrt_marshallIn(SFc6_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c6_b_is_active_c6_sliding_controller_rbdl, const
  char_T *c6_identifier);
static uint8_T c6_d_emlrt_marshallIn(SFc6_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c6_b_u, const emlrtMsgIdentifier *c6_parentId);
static void init_dsm_address_info(SFc6_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc6_sliding_controller_rbdlInstanceStruct *
  chartInstance);

/* Function Definitions */
static void initialize_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c6_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c6_is_active_c6_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c6_do_animation_call_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  const mxArray *c6_b_y = NULL;
  const mxArray *c6_c_y = NULL;
  const mxArray *c6_d_y = NULL;
  const mxArray *c6_st;
  c6_st = NULL;
  c6_b_y = NULL;
  sf_mex_assign(&c6_b_y, sf_mex_createcellmatrix(2, 1), false);
  c6_c_y = NULL;
  sf_mex_assign(&c6_c_y, sf_mex_create("y", *chartInstance->c6_y, 0, 0U, 1U, 0U,
    1, 6), false);
  sf_mex_setcell(c6_b_y, 0, c6_c_y);
  c6_d_y = NULL;
  sf_mex_assign(&c6_d_y, sf_mex_create("y",
    &chartInstance->c6_is_active_c6_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c6_b_y, 1, c6_d_y);
  sf_mex_assign(&c6_st, c6_b_y, false);
  return c6_st;
}

static void set_sim_state_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c6_st)
{
  const mxArray *c6_b_u;
  c6_b_u = sf_mex_dup(c6_st);
  c6_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c6_b_u, 0)), "y",
                      *chartInstance->c6_y);
  chartInstance->c6_is_active_c6_sliding_controller_rbdl = c6_c_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c6_b_u, 1)),
     "is_active_c6_sliding_controller_rbdl");
  sf_mex_destroy(&c6_b_u);
  sf_mex_destroy(&c6_st);
}

static void sf_gateway_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c6_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c6_eML_blk_kernel(chartInstance, *chartInstance->c6_u, *chartInstance->c6_y);
  c6_do_animation_call_c6_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c6_errCode;
  c6_errCode = cudaGetLastError();
  if (c6_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c6_errCode, (char_T *)cudaGetErrorName
                       (c6_errCode), (char_T *)cudaGetErrorString(c6_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c6_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc6_sliding_controller_rbdl
  (SFc6_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c6_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c6_nameCaptureInfo = NULL;
  c6_nameCaptureInfo = NULL;
  sf_mex_assign(&c6_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c6_nameCaptureInfo;
}

static void c6_eML_blk_kernel(SFc6_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c6_b_u[7], real_T c6_b_y[6])
{
  c6_b_y[0] = c6_b_u[1];
  c6_b_y[1] = c6_b_u[2];
  c6_b_y[2] = c6_b_u[3];
  c6_b_y[3] = c6_b_u[0];
  c6_b_y[4] = c6_b_u[4];
  c6_b_y[5] = c6_b_u[5];
}

static void c6_emlrt_marshallIn(SFc6_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c6_b_y, const char_T *c6_identifier, real_T
  c6_c_y[6])
{
  emlrtMsgIdentifier c6_thisId;
  c6_thisId.fIdentifier = const_cast<const char_T *>(c6_identifier);
  c6_thisId.fParent = NULL;
  c6_thisId.bParentIsCell = false;
  c6_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c6_b_y), &c6_thisId, c6_c_y);
  sf_mex_destroy(&c6_b_y);
}

static void c6_b_emlrt_marshallIn(SFc6_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c6_b_u, const emlrtMsgIdentifier *c6_parentId,
  real_T c6_b_y[6])
{
  real_T c6_dv[6];
  int32_T c6_i;
  sf_mex_import(c6_parentId, sf_mex_dup(c6_b_u), c6_dv, 1, 0, 0U, 1, 0U, 1, 6);
  for (c6_i = 0; c6_i < 6; c6_i++) {
    c6_b_y[c6_i] = c6_dv[c6_i];
  }

  sf_mex_destroy(&c6_b_u);
}

static uint8_T c6_c_emlrt_marshallIn(SFc6_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c6_b_is_active_c6_sliding_controller_rbdl, const
  char_T *c6_identifier)
{
  emlrtMsgIdentifier c6_thisId;
  uint8_T c6_b_y;
  c6_thisId.fIdentifier = const_cast<const char_T *>(c6_identifier);
  c6_thisId.fParent = NULL;
  c6_thisId.bParentIsCell = false;
  c6_b_y = c6_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c6_b_is_active_c6_sliding_controller_rbdl), &c6_thisId);
  sf_mex_destroy(&c6_b_is_active_c6_sliding_controller_rbdl);
  return c6_b_y;
}

static uint8_T c6_d_emlrt_marshallIn(SFc6_sliding_controller_rbdlInstanceStruct *
  chartInstance, const mxArray *c6_b_u, const emlrtMsgIdentifier *c6_parentId)
{
  uint8_T c6_b_y;
  uint8_T c6_c_u;
  sf_mex_import(c6_parentId, sf_mex_dup(c6_b_u), &c6_c_u, 1, 3, 0U, 0, 0U, 0);
  c6_b_y = c6_c_u;
  sf_mex_destroy(&c6_b_u);
  return c6_b_y;
}

static void init_dsm_address_info(SFc6_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc6_sliding_controller_rbdlInstanceStruct *
  chartInstance)
{
  chartInstance->c6_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c6_u = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c6_y = (real_T (*)[6])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c6_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(3910899723U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1623685603U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(38977074U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3513601893U);
}

mxArray *sf_c6_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c6_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c6_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c6_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfh"
    "UU90P4mcXxicklmWWp8clm8cU5mSmZeenxyfl5JUX5OTmpRfFFSSk5DEj+BAB4/x1/"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c6_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sbIZyOsp5zUyg8V8S5w2l4G";
}

static void sf_opaque_initialize_c6_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c6_sliding_controller_rbdl
    ((SFc6_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c6_sliding_controller_rbdl
    ((SFc6_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c6_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c6_sliding_controller_rbdl((SFc6_sliding_controller_rbdlInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c6_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c6_sliding_controller_rbdl((SFc6_sliding_controller_rbdlInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c6_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c6_sliding_controller_rbdl
    ((SFc6_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c6_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c6_sliding_controller_rbdl
    ((SFc6_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c6_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c6_sliding_controller_rbdl
    ((SFc6_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c6_sliding_controller_rbdl(void *
  chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc6_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c6_sliding_controller_rbdl
      ((SFc6_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc6_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc6_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c6_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c6_sliding_controller_rbdl
    ((SFc6_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c6_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c6_sliding_controller_rbdl
    ((SFc6_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc6_sliding_controller_rbdl
    ((SFc6_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c6_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c6_sliding_controller_rbdl
      ((SFc6_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc6_sliding_controller_rbdl
      ((SFc6_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c6_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV91qFEkU7gxZUVAZZEGQBb0I6M2CiEpu1CTzsw4km2AnUUQYaqrPTBdTXdVbPzOZfQbFt/D",
    "aR9nLvMTCgtcLe6q7ZzL2dPcYB4O7bEOnp7q/c+qc852firfW2fPwuo731g3Pu4TPy3jXvPT6IV",
    "uvzd3p+3XvbrZ+h0LCRgdEkUh7lZcgEbwALbk1TIqO6MtCGBN9UCAoYmOpTJk2zSLLmRi2raBOn",
    "34ZMhr6obQ82EFZEuwLPkFtsTUHqKfJFFDTBghMqKQdhG1OBjOLlRk3QqBDbaMqFzQY38bOLL1n",
    "uWExh9YJ0I7QhqDF+sw23xADDXNS6qbzVPtToIxizogo9DYk2ocYA2zgKA7w77416FQeRkOizA6",
    "EZAR6lw0TnVJAXifT+KHHBDFSMcJbEW84wUXbDjjasycD4BUBQdt2FJBhLJkw5fz7bfS0JUiPQx",
    "N6dlCuzYffrCP/mMEYVGnc+g05AkUGsC9KN00C0jpJ2JplySLMsAiOidqmyJ+GoDR7MXO0T5AnO",
    "ESJMhgkTnb0oWIjDG+pNht1XGYuKxkbpWTrZbBEW2sEVSzMtLWpaBDOdSnsUMa7MAKeaG0SQ6ph",
    "qdZinNYsOJQYYJfe5dVgBUPiM1hDioAV0jXKAZK+8ys2ls+R1GojowYmb3N3d/HzIqwjDKg+oVD",
    "UBRRhGjBmSXjLtQVMO+4RiFaZxLwicJohy1Ce7lvRHEs1xJhUNJEzFxyjpcBID5BLrIQjjUVTBX",
    "NcLsNRQkMIXINhHPawbBBbEBPtWts21t2ImUkTNFUsLmDVYtVhG2q5hJrEcCSGQo5FW8nIz3p8G",
    "l4AzDaiBBODHexfatLG3YuocPPsvnc2z65+wTybyuWf9+b0rBXo8eae+X2v1Kr3reGvten8nZO7",
    "lttnPSfncHW83374o3766Wd56/2DP5+M/36zyv4fa+eb/9ez9U/TRjsrnNFCvjrs8zm71gv035z",
    "TX8/Wutd5PdnX8aPfjyaDzeNN/9H4AX/4S8rPEntrOXun7++4jo9ZluSnop0gO5i4NbHpuHb6N+",
    "fsvbQkHley9+n117PV5H/cyvO4vkS+jr8mubz9+v3vbK0mn+7/aon9Gzm+N5K53iWuW0CXPu5qz",
    "gKs9C6VwijJOaiu6gU8X59fm+/nlfMuWO7fYuf/ct+e9y+ZXxct512w3Kr+nXeOf2/4qnng5fD1",
    "79iPVc9X3xp/6p3vHHQ7Wz+d/avTCBkPCk692Wc8wvaLvv4H8vQfr7i0xg==",
    ""
  };

  static char newstr [1261] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c6_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c6_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(282109580U));
  ssSetChecksum1(S,(1865282520U));
  ssSetChecksum2(S,(3979513626U));
  ssSetChecksum3(S,(1560115005U));
}

static void mdlRTW_c6_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c6_sliding_controller_rbdl(SimStruct *S)
{
  SFc6_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc6_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc6_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc6_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance) SFc6_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c6_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c6_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c6_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c6_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c6_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c6_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c6_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c6_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c6_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c6_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c6_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c6_sliding_controller_rbdl;
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
    chartInstance->c6_JITStateAnimation,
    chartInstance->c6_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c6_sliding_controller_rbdl(chartInstance);
}

void c6_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c6_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c6_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c6_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c6_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
