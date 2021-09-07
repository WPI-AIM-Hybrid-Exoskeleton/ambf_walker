/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c33_sliding_controller_rbdl.h"
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
static void initialize_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c33_do_animation_call_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c33_st);
static void sf_gateway_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c33_eML_blk_kernel(SFc33_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c33_b_u[7], real_T c33_b_y[6]);
static void c33_emlrt_marshallIn(SFc33_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c33_b_y, const char_T *c33_identifier, real_T
  c33_c_y[6]);
static void c33_b_emlrt_marshallIn(SFc33_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c33_b_u, const emlrtMsgIdentifier *c33_parentId,
  real_T c33_b_y[6]);
static uint8_T c33_c_emlrt_marshallIn
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c33_b_is_active_c33_sliding_controller_rbdl, const char_T *c33_identifier);
static uint8_T c33_d_emlrt_marshallIn
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c33_b_u, const emlrtMsgIdentifier *c33_parentId);
static void init_dsm_address_info(SFc33_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc33_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c33_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c33_is_active_c33_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c33_do_animation_call_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  const mxArray *c33_b_y = NULL;
  const mxArray *c33_c_y = NULL;
  const mxArray *c33_d_y = NULL;
  const mxArray *c33_st;
  c33_st = NULL;
  c33_b_y = NULL;
  sf_mex_assign(&c33_b_y, sf_mex_createcellmatrix(2, 1), false);
  c33_c_y = NULL;
  sf_mex_assign(&c33_c_y, sf_mex_create("y", *chartInstance->c33_y, 0, 0U, 1U,
    0U, 1, 6), false);
  sf_mex_setcell(c33_b_y, 0, c33_c_y);
  c33_d_y = NULL;
  sf_mex_assign(&c33_d_y, sf_mex_create("y",
    &chartInstance->c33_is_active_c33_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c33_b_y, 1, c33_d_y);
  sf_mex_assign(&c33_st, c33_b_y, false);
  return c33_st;
}

static void set_sim_state_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c33_st)
{
  const mxArray *c33_b_u;
  c33_b_u = sf_mex_dup(c33_st);
  c33_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c33_b_u, 0)),
                       "y", *chartInstance->c33_y);
  chartInstance->c33_is_active_c33_sliding_controller_rbdl =
    c33_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c33_b_u, 1)),
    "is_active_c33_sliding_controller_rbdl");
  sf_mex_destroy(&c33_b_u);
  sf_mex_destroy(&c33_st);
}

static void sf_gateway_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c33_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c33_eML_blk_kernel(chartInstance, *chartInstance->c33_u, *chartInstance->c33_y);
  c33_do_animation_call_c33_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c33_errCode;
  c33_errCode = cudaGetLastError();
  if (c33_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c33_errCode, (char_T *)cudaGetErrorName
                       (c33_errCode), (char_T *)cudaGetErrorString(c33_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c33_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc33_sliding_controller_rbdl
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c33_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c33_nameCaptureInfo = NULL;
  c33_nameCaptureInfo = NULL;
  sf_mex_assign(&c33_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c33_nameCaptureInfo;
}

static void c33_eML_blk_kernel(SFc33_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c33_b_u[7], real_T c33_b_y[6])
{
  c33_b_y[0] = c33_b_u[2];
  c33_b_y[1] = c33_b_u[3];
  c33_b_y[2] = c33_b_u[6];
  c33_b_y[3] = c33_b_u[0];
  c33_b_y[4] = c33_b_u[4];
  c33_b_y[5] = c33_b_u[5];
}

static void c33_emlrt_marshallIn(SFc33_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c33_b_y, const char_T *c33_identifier, real_T
  c33_c_y[6])
{
  emlrtMsgIdentifier c33_thisId;
  c33_thisId.fIdentifier = const_cast<const char_T *>(c33_identifier);
  c33_thisId.fParent = NULL;
  c33_thisId.bParentIsCell = false;
  c33_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c33_b_y), &c33_thisId,
    c33_c_y);
  sf_mex_destroy(&c33_b_y);
}

static void c33_b_emlrt_marshallIn(SFc33_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c33_b_u, const emlrtMsgIdentifier *c33_parentId,
  real_T c33_b_y[6])
{
  real_T c33_dv[6];
  int32_T c33_i;
  sf_mex_import(c33_parentId, sf_mex_dup(c33_b_u), c33_dv, 1, 0, 0U, 1, 0U, 1, 6);
  for (c33_i = 0; c33_i < 6; c33_i++) {
    c33_b_y[c33_i] = c33_dv[c33_i];
  }

  sf_mex_destroy(&c33_b_u);
}

static uint8_T c33_c_emlrt_marshallIn
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c33_b_is_active_c33_sliding_controller_rbdl, const char_T *c33_identifier)
{
  emlrtMsgIdentifier c33_thisId;
  uint8_T c33_b_y;
  c33_thisId.fIdentifier = const_cast<const char_T *>(c33_identifier);
  c33_thisId.fParent = NULL;
  c33_thisId.bParentIsCell = false;
  c33_b_y = c33_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c33_b_is_active_c33_sliding_controller_rbdl), &c33_thisId);
  sf_mex_destroy(&c33_b_is_active_c33_sliding_controller_rbdl);
  return c33_b_y;
}

static uint8_T c33_d_emlrt_marshallIn
  (SFc33_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c33_b_u, const emlrtMsgIdentifier *c33_parentId)
{
  uint8_T c33_b_y;
  uint8_T c33_c_u;
  sf_mex_import(c33_parentId, sf_mex_dup(c33_b_u), &c33_c_u, 1, 3, 0U, 0, 0U, 0);
  c33_b_y = c33_c_u;
  sf_mex_destroy(&c33_b_u);
  return c33_b_y;
}

static void init_dsm_address_info(SFc33_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc33_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
  chartInstance->c33_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c33_u = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c33_y = (real_T (*)[6])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c33_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(2339256118U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(2737773724U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(583777407U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(1172739197U);
}

mxArray *sf_c33_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c33_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c33_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c33_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfl"
    "UU90P4mcXxicklmWWp8cnGxvHFOZkpmXnp8cn5eSVF+Tk5qUXxRUkpOUj+BAB2RR2x"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c33_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "s0lpZ3UsJHBzJBVszsMYZmF";
}

static void sf_opaque_initialize_c33_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c33_sliding_controller_rbdl
    ((SFc33_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c33_sliding_controller_rbdl
    ((SFc33_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c33_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c33_sliding_controller_rbdl
    ((SFc33_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c33_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c33_sliding_controller_rbdl
    ((SFc33_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c33_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c33_sliding_controller_rbdl
    ((SFc33_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c33_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c33_sliding_controller_rbdl
    ((SFc33_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c33_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c33_sliding_controller_rbdl
    ((SFc33_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c33_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc33_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c33_sliding_controller_rbdl
      ((SFc33_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc33_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc33_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c33_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c33_sliding_controller_rbdl
    ((SFc33_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c33_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c33_sliding_controller_rbdl
    ((SFc33_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc33_sliding_controller_rbdl
    ((SFc33_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c33_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c33_sliding_controller_rbdl
      ((SFc33_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc33_sliding_controller_rbdl
      ((SFc33_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c33_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV91u00gUdqOCQFpQhZDQSiuBkBBcInrBXi0lTqKGbWiF2/JzE03HJ/Eo4xkzP2nDO+zFPgW",
    "3PA7ihjuueQTO2E4aHNuhRFSwWkuuM/Z3zpxzvvMz9da6PQ+vq3hvXfO8i/i8hHfDy64L+Xpt7s",
    "7er3t38/U/KCRsvEcUibVXewkSwzPQklvDpOiKgSyFMTEABYIiNpHKVGnTLLaciVHHCur06ecRo",
    "1EQScvDJsqScFfwCWpLrNlDPS2mgJoOQGgiJe0w6nAynFmszLEfAR1pG9e5oMEENnFm6Z7lhiUc",
    "2idAu0IbghbrU9sCQwz45qTSTeepDqZAGSecEVHqbUR0AAkG2MBBEuLfXWvQqSKMRkSZJkRkDHq",
    "HjVKdUkBRJ9P44YgJYqRihLdj7jvBRdv2ONrTkyHwmoCgbU0FZJRIJkw1/0EHPW0LcsShBUd2WK",
    "0tgNfWkX/I4BhUZdwGvhyDIkPYFZWbpgFpn6RszbJkEWZYDIdEPabIn4awMnsxc3RAkCfYR4kqG",
    "KROdvW+YmMMb6U2G3ddZi4rGRtnZOtlsFRbewx1LMy0dajwCee6ErYvkx0YA0+1togh9bBMazlO",
    "axbuSwywS+/qarCCIfE5zJciZKV0jQuAtO88xcbyNZJabWTsY/K2dnYWPy/CusKAGhAKZV1AEaY",
    "BY5aGt1pbyLTjHoFolUnNKwNnGbIM5emBFa1jqUYYk5omcuqCY7QSGOshcomVcKCxaOpgjstlOE",
    "poBKFrMIxDD8sGsSUx0a61Pca6GzMzaYGmiiUlrFqsOmxDbZdQkwQOxEjIY9FRMg7yHp+FFwCzj",
    "SjBxLCJ/UtNOrh7GRVunt33TufZb98wz6Zyxee9OT1rJXq8uWdx38uN+n0b+GttOn/n5K4U9lkv",
    "yDncBt63P7x94H/aZh//vUu6f//+cJX93zXONv+v5us/po12VjjjhXx12O05u9ZL9N+Y07+Rr/V",
    "9nrzaPNBPtptvnjQP9Rvde/kq7mT8LLG3UbB3+v6W6/iYZWl+KtoN84OJWxObjWun/885ey8uic",
    "fl/H12fX60mvz1rSKP60vkN/DXpJC337//ra3V5LP9Xyyx/06B7zvpXO8T1y2gTzc3+5qzEEu9T",
    "6UwSnIOqq+OQl7w83vz/axy3jnL/Sp2/i/343n/lvl13nLeOcut6t9Z5/jPhq+bB14Bv/ET+7Hq",
    "+epH4997ZzsH3czXf83+1fEjxsOSU2/+GY+wg7Kv/4E8/QJ4HrNn",
    ""
  };

  static char newstr [1253] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c33_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c33_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(849861154U));
  ssSetChecksum1(S,(1766385219U));
  ssSetChecksum2(S,(1629983199U));
  ssSetChecksum3(S,(924404553U));
}

static void mdlRTW_c33_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c33_sliding_controller_rbdl(SimStruct *S)
{
  SFc33_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc33_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc33_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc33_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc33_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c33_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c33_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c33_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c33_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c33_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c33_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c33_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c33_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c33_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c33_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c33_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c33_sliding_controller_rbdl;
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
    chartInstance->c33_JITStateAnimation,
    chartInstance->c33_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c33_sliding_controller_rbdl(chartInstance);
}

void c33_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c33_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c33_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c33_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c33_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
