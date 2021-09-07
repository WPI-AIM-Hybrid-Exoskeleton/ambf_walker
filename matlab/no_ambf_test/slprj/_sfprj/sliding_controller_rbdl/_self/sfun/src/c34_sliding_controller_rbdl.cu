/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c34_sliding_controller_rbdl.h"
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
static void initialize_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c34_do_animation_call_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c34_st);
static void sf_gateway_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c34_eML_blk_kernel(SFc34_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c34_b_u[7], real_T c34_b_y[6]);
static void c34_emlrt_marshallIn(SFc34_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c34_b_y, const char_T *c34_identifier, real_T
  c34_c_y[6]);
static void c34_b_emlrt_marshallIn(SFc34_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c34_b_u, const emlrtMsgIdentifier *c34_parentId,
  real_T c34_b_y[6]);
static uint8_T c34_c_emlrt_marshallIn
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c34_b_is_active_c34_sliding_controller_rbdl, const char_T *c34_identifier);
static uint8_T c34_d_emlrt_marshallIn
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c34_b_u, const emlrtMsgIdentifier *c34_parentId);
static void init_dsm_address_info(SFc34_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc34_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c34_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c34_is_active_c34_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c34_do_animation_call_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  const mxArray *c34_b_y = NULL;
  const mxArray *c34_c_y = NULL;
  const mxArray *c34_d_y = NULL;
  const mxArray *c34_st;
  c34_st = NULL;
  c34_b_y = NULL;
  sf_mex_assign(&c34_b_y, sf_mex_createcellmatrix(2, 1), false);
  c34_c_y = NULL;
  sf_mex_assign(&c34_c_y, sf_mex_create("y", *chartInstance->c34_y, 0, 0U, 1U,
    0U, 1, 6), false);
  sf_mex_setcell(c34_b_y, 0, c34_c_y);
  c34_d_y = NULL;
  sf_mex_assign(&c34_d_y, sf_mex_create("y",
    &chartInstance->c34_is_active_c34_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c34_b_y, 1, c34_d_y);
  sf_mex_assign(&c34_st, c34_b_y, false);
  return c34_st;
}

static void set_sim_state_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c34_st)
{
  const mxArray *c34_b_u;
  c34_b_u = sf_mex_dup(c34_st);
  c34_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c34_b_u, 0)),
                       "y", *chartInstance->c34_y);
  chartInstance->c34_is_active_c34_sliding_controller_rbdl =
    c34_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c34_b_u, 1)),
    "is_active_c34_sliding_controller_rbdl");
  sf_mex_destroy(&c34_b_u);
  sf_mex_destroy(&c34_st);
}

static void sf_gateway_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c34_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c34_eML_blk_kernel(chartInstance, *chartInstance->c34_u, *chartInstance->c34_y);
  c34_do_animation_call_c34_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c34_errCode;
  c34_errCode = cudaGetLastError();
  if (c34_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c34_errCode, (char_T *)cudaGetErrorName
                       (c34_errCode), (char_T *)cudaGetErrorString(c34_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c34_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc34_sliding_controller_rbdl
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c34_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c34_nameCaptureInfo = NULL;
  c34_nameCaptureInfo = NULL;
  sf_mex_assign(&c34_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c34_nameCaptureInfo;
}

static void c34_eML_blk_kernel(SFc34_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c34_b_u[7], real_T c34_b_y[6])
{
  c34_b_y[0] = c34_b_u[1];
  c34_b_y[1] = c34_b_u[2];
  c34_b_y[2] = c34_b_u[3];
  c34_b_y[3] = c34_b_u[0];
  c34_b_y[4] = c34_b_u[4];
  c34_b_y[5] = c34_b_u[5];
}

static void c34_emlrt_marshallIn(SFc34_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c34_b_y, const char_T *c34_identifier, real_T
  c34_c_y[6])
{
  emlrtMsgIdentifier c34_thisId;
  c34_thisId.fIdentifier = const_cast<const char_T *>(c34_identifier);
  c34_thisId.fParent = NULL;
  c34_thisId.bParentIsCell = false;
  c34_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c34_b_y), &c34_thisId,
    c34_c_y);
  sf_mex_destroy(&c34_b_y);
}

static void c34_b_emlrt_marshallIn(SFc34_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c34_b_u, const emlrtMsgIdentifier *c34_parentId,
  real_T c34_b_y[6])
{
  real_T c34_dv[6];
  int32_T c34_i;
  sf_mex_import(c34_parentId, sf_mex_dup(c34_b_u), c34_dv, 1, 0, 0U, 1, 0U, 1, 6);
  for (c34_i = 0; c34_i < 6; c34_i++) {
    c34_b_y[c34_i] = c34_dv[c34_i];
  }

  sf_mex_destroy(&c34_b_u);
}

static uint8_T c34_c_emlrt_marshallIn
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c34_b_is_active_c34_sliding_controller_rbdl, const char_T *c34_identifier)
{
  emlrtMsgIdentifier c34_thisId;
  uint8_T c34_b_y;
  c34_thisId.fIdentifier = const_cast<const char_T *>(c34_identifier);
  c34_thisId.fParent = NULL;
  c34_thisId.bParentIsCell = false;
  c34_b_y = c34_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c34_b_is_active_c34_sliding_controller_rbdl), &c34_thisId);
  sf_mex_destroy(&c34_b_is_active_c34_sliding_controller_rbdl);
  return c34_b_y;
}

static uint8_T c34_d_emlrt_marshallIn
  (SFc34_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c34_b_u, const emlrtMsgIdentifier *c34_parentId)
{
  uint8_T c34_b_y;
  uint8_T c34_c_u;
  sf_mex_import(c34_parentId, sf_mex_dup(c34_b_u), &c34_c_u, 1, 3, 0U, 0, 0U, 0);
  c34_b_y = c34_c_u;
  sf_mex_destroy(&c34_b_u);
  return c34_b_y;
}

static void init_dsm_address_info(SFc34_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc34_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
  chartInstance->c34_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c34_u = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c34_y = (real_T (*)[6])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c34_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(3910899723U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1623685603U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(38977074U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3513601893U);
}

mxArray *sf_c34_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c34_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c34_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c34_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfl"
    "UU90P4mcXxicklmWWp8cnGJvHFOZkpmXnp8cn5eSVF+Tk5qUXxRUkpOUj+BAB2aR2y"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c34_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sbIZyOsp5zUyg8V8S5w2l4G";
}

static void sf_opaque_initialize_c34_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c34_sliding_controller_rbdl
    ((SFc34_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c34_sliding_controller_rbdl
    ((SFc34_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c34_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c34_sliding_controller_rbdl
    ((SFc34_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c34_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c34_sliding_controller_rbdl
    ((SFc34_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c34_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c34_sliding_controller_rbdl
    ((SFc34_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c34_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c34_sliding_controller_rbdl
    ((SFc34_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c34_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c34_sliding_controller_rbdl
    ((SFc34_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c34_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc34_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c34_sliding_controller_rbdl
      ((SFc34_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc34_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc34_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c34_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c34_sliding_controller_rbdl
    ((SFc34_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c34_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c34_sliding_controller_rbdl
    ((SFc34_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc34_sliding_controller_rbdl
    ((SFc34_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c34_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c34_sliding_controller_rbdl
      ((SFc34_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc34_sliding_controller_rbdl
      ((SFc34_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c34_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV91qFEkU7gxRFNYwiCCIsN7IeiMsUSE3apL52R1ITLCTuCzCUFN9ZrqY6qre+pnJ7DPssm+",
    "x1/soXvoSguC14KnunslsT3ePcTCo2NDpqe7vnDrnfOen4q119j28NvDevu55l/F5Be+al16Xsv",
    "Xa3J2+X/d+ytZ/o5Cw0SFRJNJe5SVIBM9BS24Nk6Ij+rIQxkQfFAiK2FgqU6ZNs8hyJoZtK6jTp",
    "1+EjIZ+KC0PdlGWBAeCT1BbbM0h6mkyBdS0AQITKmkHYZuTwcxiZcaNEOhQ26jKBQ3Gt7EzS+9b",
    "bljMoXUKtCO0IWixPrPNN8RAw5yWuuk81f4UKKOYMyIKvQ2J9iHGABs4jgP8e2ANOpWH0ZAosws",
    "hGYHeY8NEpxSQ18k0fugxQYxUjPBWxBtOcNG2Q4727MsAeEVA0LZdBWQYSyZMOf9+Gz1tCdLj0I",
    "SeHZRr8+EP68g/YTAGVRq3fkOOQJEBHIjSTZOAtE4TtmZZsggzLIITonYo8qchKM1ezBztE+QJj",
    "lCiDAaJkx19pNgIw1uqzUYdl5nLSsZGKdl6GSzR1hpBFQszbW0qGoRzXQo7kvEejIAnWpvEkGpY",
    "qrUYpzULjiQG2KV3eTVYwZD4DNaQImCFdI1ygKTvPMPG8n8ktdrIqIHJ29zbW/y8COsIA6pPKBR",
    "1AUWYBoxZEt5ybQHTjnsEolUmMa8InGbIMpSn+1Y0x1INMSYVTeTMBcdoKTDSA+QSK+FYY9FUwR",
    "yXy3CU0BAC12AYh30sG8QWxES71raDdTdiZtIETRWLC1i1WHXYhlouoSYxHIuhkGPRVjLysx6fh",
    "hcAs40owcRgF/uXmrRx9yIq3Dz72TubZz98xDybyuWf9+b0rBXo8eae+X2v1qr3reGvten8nZO7",
    "lttnPSfncHW8//r3Vf31u/vy1j+bbx6P379cZf//aueb/xvZ+va00c4KZ7SQrw7765xd6wX6b87",
    "pr2dr3ev8PjnQ8aM/jyeDrZMt/9F4kz/8JeVnib21nL3T93dcx8csS/JT0U6QHUzcmth0XDv9W3",
    "P2Xl4Sj6vZ+/R6+3Q1+RvbeR7Xl8jX8dckl7efvv+d7dXk0/1/W2L/3Rzfd5O53iWuW0CXPnjY1",
    "ZwFWOpdKoVRknNQXdULeM7PT83388p5Fyz3tdj5Xe7z8/4x8+ui5bwLllvVv/PO8S8NXzUPvBy+",
    "/gX7ser56nPjX3vnOwf9mK2fzP7VaYSMBwWn3uwzHmH7RV+/gTz9AC7wtPk=",
    ""
  };

  static char newstr [1261] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c34_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c34_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(282109580U));
  ssSetChecksum1(S,(1865282520U));
  ssSetChecksum2(S,(3979513626U));
  ssSetChecksum3(S,(1560115005U));
}

static void mdlRTW_c34_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c34_sliding_controller_rbdl(SimStruct *S)
{
  SFc34_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc34_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc34_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc34_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc34_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c34_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c34_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c34_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c34_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c34_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c34_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c34_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c34_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c34_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c34_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c34_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c34_sliding_controller_rbdl;
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
    chartInstance->c34_JITStateAnimation,
    chartInstance->c34_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c34_sliding_controller_rbdl(chartInstance);
}

void c34_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c34_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c34_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c34_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c34_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
