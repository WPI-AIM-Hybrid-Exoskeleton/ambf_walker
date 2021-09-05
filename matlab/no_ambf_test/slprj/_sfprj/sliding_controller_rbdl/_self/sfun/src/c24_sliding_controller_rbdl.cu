/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c24_sliding_controller_rbdl.h"
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
static void initialize_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c24_do_animation_call_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c24_st);
static void sf_gateway_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c24_eML_blk_kernel(SFc24_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c24_b_u[7], real_T c24_b_y[7]);
static void c24_emlrt_marshallIn(SFc24_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c24_b_y, const char_T *c24_identifier, real_T
  c24_c_y[7]);
static void c24_b_emlrt_marshallIn(SFc24_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c24_b_u, const emlrtMsgIdentifier *c24_parentId,
  real_T c24_b_y[7]);
static uint8_T c24_c_emlrt_marshallIn
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c24_b_is_active_c24_sliding_controller_rbdl, const char_T *c24_identifier);
static uint8_T c24_d_emlrt_marshallIn
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c24_b_u, const emlrtMsgIdentifier *c24_parentId);
static void init_dsm_address_info(SFc24_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc24_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c24_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c24_is_active_c24_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c24_do_animation_call_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  const mxArray *c24_b_y = NULL;
  const mxArray *c24_c_y = NULL;
  const mxArray *c24_d_y = NULL;
  const mxArray *c24_st;
  c24_st = NULL;
  c24_b_y = NULL;
  sf_mex_assign(&c24_b_y, sf_mex_createcellmatrix(2, 1), false);
  c24_c_y = NULL;
  sf_mex_assign(&c24_c_y, sf_mex_create("y", *chartInstance->c24_y, 0, 0U, 1U,
    0U, 2, 1, 7), false);
  sf_mex_setcell(c24_b_y, 0, c24_c_y);
  c24_d_y = NULL;
  sf_mex_assign(&c24_d_y, sf_mex_create("y",
    &chartInstance->c24_is_active_c24_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c24_b_y, 1, c24_d_y);
  sf_mex_assign(&c24_st, c24_b_y, false);
  return c24_st;
}

static void set_sim_state_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c24_st)
{
  const mxArray *c24_b_u;
  c24_b_u = sf_mex_dup(c24_st);
  c24_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c24_b_u, 0)),
                       "y", *chartInstance->c24_y);
  chartInstance->c24_is_active_c24_sliding_controller_rbdl =
    c24_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c24_b_u, 1)),
    "is_active_c24_sliding_controller_rbdl");
  sf_mex_destroy(&c24_b_u);
  sf_mex_destroy(&c24_st);
}

static void sf_gateway_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c24_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c24_eML_blk_kernel(chartInstance, *chartInstance->c24_u, *chartInstance->c24_y);
  c24_do_animation_call_c24_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c24_errCode;
  c24_errCode = cudaGetLastError();
  if (c24_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c24_errCode, (char_T *)cudaGetErrorName
                       (c24_errCode), (char_T *)cudaGetErrorString(c24_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c24_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc24_sliding_controller_rbdl
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c24_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c24_nameCaptureInfo = NULL;
  c24_nameCaptureInfo = NULL;
  sf_mex_assign(&c24_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c24_nameCaptureInfo;
}

static void c24_eML_blk_kernel(SFc24_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c24_b_u[7], real_T c24_b_y[7])
{
  c24_b_y[0] = c24_b_u[3];
  c24_b_y[1] = c24_b_u[6];
  c24_b_y[2] = c24_b_u[0];
  c24_b_y[3] = c24_b_u[1];
  c24_b_y[4] = c24_b_u[4];
  c24_b_y[5] = c24_b_u[5];
  c24_b_y[6] = c24_b_u[2];
}

static void c24_emlrt_marshallIn(SFc24_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c24_b_y, const char_T *c24_identifier, real_T
  c24_c_y[7])
{
  emlrtMsgIdentifier c24_thisId;
  c24_thisId.fIdentifier = const_cast<const char_T *>(c24_identifier);
  c24_thisId.fParent = NULL;
  c24_thisId.bParentIsCell = false;
  c24_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c24_b_y), &c24_thisId,
    c24_c_y);
  sf_mex_destroy(&c24_b_y);
}

static void c24_b_emlrt_marshallIn(SFc24_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c24_b_u, const emlrtMsgIdentifier *c24_parentId,
  real_T c24_b_y[7])
{
  real_T c24_dv[7];
  int32_T c24_i;
  sf_mex_import(c24_parentId, sf_mex_dup(c24_b_u), c24_dv, 1, 0, 0U, 1, 0U, 2, 1,
                7);
  for (c24_i = 0; c24_i < 7; c24_i++) {
    c24_b_y[c24_i] = c24_dv[c24_i];
  }

  sf_mex_destroy(&c24_b_u);
}

static uint8_T c24_c_emlrt_marshallIn
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c24_b_is_active_c24_sliding_controller_rbdl, const char_T *c24_identifier)
{
  emlrtMsgIdentifier c24_thisId;
  uint8_T c24_b_y;
  c24_thisId.fIdentifier = const_cast<const char_T *>(c24_identifier);
  c24_thisId.fParent = NULL;
  c24_thisId.bParentIsCell = false;
  c24_b_y = c24_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c24_b_is_active_c24_sliding_controller_rbdl), &c24_thisId);
  sf_mex_destroy(&c24_b_is_active_c24_sliding_controller_rbdl);
  return c24_b_y;
}

static uint8_T c24_d_emlrt_marshallIn
  (SFc24_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c24_b_u, const emlrtMsgIdentifier *c24_parentId)
{
  uint8_T c24_b_y;
  uint8_T c24_c_u;
  sf_mex_import(c24_parentId, sf_mex_dup(c24_b_u), &c24_c_u, 1, 3, 0U, 0, 0U, 0);
  c24_b_y = c24_c_u;
  sf_mex_destroy(&c24_b_u);
  return c24_b_y;
}

static void init_dsm_address_info(SFc24_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc24_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
  chartInstance->c24_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c24_u = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c24_y = (real_T (*)[7])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c24_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(3007509169U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1926089682U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2239166282U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3770191902U);
}

mxArray *sf_c24_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c24_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c24_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c24_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfl"
    "UU90P4mcXxicklmWWp8clGJvHFOZkpmXnp8cn5eSVF+Tk5qUXxRUkpOUj+BAB2RB2x"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c24_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sdegTANPF1GH9p3UVy5QBRH";
}

static void sf_opaque_initialize_c24_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c24_sliding_controller_rbdl
    ((SFc24_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c24_sliding_controller_rbdl
    ((SFc24_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c24_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c24_sliding_controller_rbdl
    ((SFc24_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c24_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c24_sliding_controller_rbdl
    ((SFc24_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c24_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c24_sliding_controller_rbdl
    ((SFc24_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c24_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c24_sliding_controller_rbdl
    ((SFc24_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c24_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c24_sliding_controller_rbdl
    ((SFc24_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c24_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc24_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c24_sliding_controller_rbdl
      ((SFc24_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc24_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc24_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c24_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c24_sliding_controller_rbdl
    ((SFc24_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c24_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c24_sliding_controller_rbdl
    ((SFc24_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc24_sliding_controller_rbdl
    ((SFc24_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c24_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c24_sliding_controller_rbdl
      ((SFc24_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc24_sliding_controller_rbdl
      ((SFc24_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c24_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u1EgQdkYBLRJE0QppLwi4RHCDhV1p97KbzB8ZKSEBT8JeVqNOu2bcmna36Z9J5swR8RS",
    "8ABfehadAXOCGRLXtmcx6bA9hRMQiLDmetr+qrqqvfjreSmfXw2sN782fPe8iPn/Cu+al14VsvT",
    "Jzp+9XvVvZ+gUKCRvtE0Ui7VVegkTwGLTk1jApOqIvC2FM9EGBoIiNpTJl2jSLLGdi2LaCOn36S",
    "cho6IfS8qCOsiTYE3yM2mJr9lFPkymgpg0QmFBJOwjbnAymFitz3AiBDrWNqlzQYHwbO7P0ruWG",
    "xRxaJ0A7QhuCFutT23xDDDTMSambzlPtT4AyijkjotDbkGgfYgywgYM4wL971qBTeRgNiTJ1CMk",
    "I9A4bJjqlgLxOpvHDERPESMUIb0W84QTnbdvnaM+uDIBXBARtqysgw1gyYcr599voaUuQIw5NOL",
    "KDcm0+PLWO/EMGx6BK49ZvyBEoMoA9UbppEpDWScLWNEvmYYZFcEjUFkX+NASl2YuZo32CPEEXJ",
    "cpgkDjZ0V3FRhjeUm026rjMXFQyNkrJ1otgibbWCKpYmGprU9EgnOtSWFfGOzACnmhtEkOqYanW",
    "YpzWLOhKDLBL7/JqsIIh8RmsIUXACuka5QBJ33mIjeW/SGq1kVEDk7e5szP/eR7WEQZUn1Ao6gK",
    "KMA0YsyS85doCph33CESrTGJeETjNkEUoT/etaB5LNcSYVDSRUxcco6XASA+QS6yEA41FUwVzXC",
    "7CUUJDCFyDYRx2sWwQWxAT7VrbFtbdiJlxEzRVLC5g1WLVYRtquYQax3AghkIei7aSkZ/1+DS8A",
    "JhtRAkmBnXsX2rcxt2LqHDz7K53Os8uf8Y8m8jln7dn9KwU6PFmnvl9L9Wq963hr5XJ/J2Ru5Lb",
    "ZzUn53DreH+8+uT18zvP3q+9JP++/bBxfZn9X9XONv/XsvW1SaOdFs5oLl8ddnvGrtUC/b/M6F/",
    "P1jqAQXfr4X771wfbf8b3Dw7Hvz+qP95O+Vlgby1n7+T9TdfxMcuS/FS0E2QHE7cmNh3XTv8fM/",
    "ZeXBCPS9n79Hr393LyVzfzPK4ukF/HX+Nc3n75/jc3l5NP9/9ngf0bOb43krneI65bQI/e+62nO",
    "Quw1HtUCqMk56B66ijgOT+/NN/PKueds9z/xc4fcl+f98+ZX+ct552z3LL+nXWOf2v4qnng5fDr",
    "37Afy56vvjb+jXe2c9CNbP3X9F+dRsh4UHDqzT7jEbZf9PU7yNNPiCuz6A==",
    ""
  };

  static char newstr [1261] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c24_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c24_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(3042383101U));
  ssSetChecksum1(S,(4119015307U));
  ssSetChecksum2(S,(1566679822U));
  ssSetChecksum3(S,(505804526U));
}

static void mdlRTW_c24_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c24_sliding_controller_rbdl(SimStruct *S)
{
  SFc24_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc24_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc24_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc24_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc24_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c24_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c24_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c24_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c24_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c24_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c24_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c24_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c24_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c24_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c24_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c24_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c24_sliding_controller_rbdl;
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
    chartInstance->c24_JITStateAnimation,
    chartInstance->c24_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c24_sliding_controller_rbdl(chartInstance);
}

void c24_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c24_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c24_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c24_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c24_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
