/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c18_sliding_controller_rbdl.h"
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
static void initialize_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c18_do_animation_call_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c18_st);
static void sf_gateway_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c18_eML_blk_kernel(SFc18_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c18_b_u[6], real_T c18_b_y[7]);
static void c18_emlrt_marshallIn(SFc18_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c18_b_y, const char_T *c18_identifier, real_T
  c18_c_y[7]);
static void c18_b_emlrt_marshallIn(SFc18_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c18_b_u, const emlrtMsgIdentifier *c18_parentId,
  real_T c18_b_y[7]);
static uint8_T c18_c_emlrt_marshallIn
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c18_b_is_active_c18_sliding_controller_rbdl, const char_T *c18_identifier);
static uint8_T c18_d_emlrt_marshallIn
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c18_b_u, const emlrtMsgIdentifier *c18_parentId);
static void init_dsm_address_info(SFc18_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc18_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c18_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c18_is_active_c18_sliding_controller_rbdl = 0U;
  cudaGetLastError();
}

static void initialize_params_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c18_do_animation_call_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  const mxArray *c18_b_y = NULL;
  const mxArray *c18_c_y = NULL;
  const mxArray *c18_d_y = NULL;
  const mxArray *c18_st;
  c18_st = NULL;
  c18_b_y = NULL;
  sf_mex_assign(&c18_b_y, sf_mex_createcellmatrix(2, 1), false);
  c18_c_y = NULL;
  sf_mex_assign(&c18_c_y, sf_mex_create("y", *chartInstance->c18_y, 0, 0U, 1U,
    0U, 2, 1, 7), false);
  sf_mex_setcell(c18_b_y, 0, c18_c_y);
  c18_d_y = NULL;
  sf_mex_assign(&c18_d_y, sf_mex_create("y",
    &chartInstance->c18_is_active_c18_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c18_b_y, 1, c18_d_y);
  sf_mex_assign(&c18_st, c18_b_y, false);
  return c18_st;
}

static void set_sim_state_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c18_st)
{
  const mxArray *c18_b_u;
  c18_b_u = sf_mex_dup(c18_st);
  c18_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c18_b_u, 0)),
                       "y", *chartInstance->c18_y);
  chartInstance->c18_is_active_c18_sliding_controller_rbdl =
    c18_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c18_b_u, 1)),
    "is_active_c18_sliding_controller_rbdl");
  sf_mex_destroy(&c18_b_u);
  sf_mex_destroy(&c18_st);
}

static void sf_gateway_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  chartInstance->c18_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  c18_eML_blk_kernel(chartInstance, *chartInstance->c18_u, *chartInstance->c18_y);
  c18_do_animation_call_c18_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c18_errCode;
  c18_errCode = cudaGetLastError();
  if (c18_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c18_errCode, (char_T *)cudaGetErrorName
                       (c18_errCode), (char_T *)cudaGetErrorString(c18_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c18_fEmlrtCtx);
  }
}

static void mdl_setup_runtime_resources_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc18_sliding_controller_rbdl
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c18_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c18_nameCaptureInfo = NULL;
  c18_nameCaptureInfo = NULL;
  sf_mex_assign(&c18_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c18_nameCaptureInfo;
}

static void c18_eML_blk_kernel(SFc18_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c18_b_u[6], real_T c18_b_y[7])
{
  c18_b_y[0] = c18_b_u[3];
  c18_b_y[1] = 0.0;
  c18_b_y[2] = c18_b_u[0];
  c18_b_y[3] = c18_b_u[1];
  c18_b_y[4] = c18_b_u[4];
  c18_b_y[5] = c18_b_u[5];
  c18_b_y[6] = c18_b_u[2];
}

static void c18_emlrt_marshallIn(SFc18_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c18_b_y, const char_T *c18_identifier, real_T
  c18_c_y[7])
{
  emlrtMsgIdentifier c18_thisId;
  c18_thisId.fIdentifier = const_cast<const char_T *>(c18_identifier);
  c18_thisId.fParent = NULL;
  c18_thisId.bParentIsCell = false;
  c18_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c18_b_y), &c18_thisId,
    c18_c_y);
  sf_mex_destroy(&c18_b_y);
}

static void c18_b_emlrt_marshallIn(SFc18_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c18_b_u, const emlrtMsgIdentifier *c18_parentId,
  real_T c18_b_y[7])
{
  real_T c18_dv[7];
  int32_T c18_i;
  sf_mex_import(c18_parentId, sf_mex_dup(c18_b_u), c18_dv, 1, 0, 0U, 1, 0U, 2, 1,
                7);
  for (c18_i = 0; c18_i < 7; c18_i++) {
    c18_b_y[c18_i] = c18_dv[c18_i];
  }

  sf_mex_destroy(&c18_b_u);
}

static uint8_T c18_c_emlrt_marshallIn
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c18_b_is_active_c18_sliding_controller_rbdl, const char_T *c18_identifier)
{
  emlrtMsgIdentifier c18_thisId;
  uint8_T c18_b_y;
  c18_thisId.fIdentifier = const_cast<const char_T *>(c18_identifier);
  c18_thisId.fParent = NULL;
  c18_thisId.bParentIsCell = false;
  c18_b_y = c18_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c18_b_is_active_c18_sliding_controller_rbdl), &c18_thisId);
  sf_mex_destroy(&c18_b_is_active_c18_sliding_controller_rbdl);
  return c18_b_y;
}

static uint8_T c18_d_emlrt_marshallIn
  (SFc18_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c18_b_u, const emlrtMsgIdentifier *c18_parentId)
{
  uint8_T c18_b_y;
  uint8_T c18_c_u;
  sf_mex_import(c18_parentId, sf_mex_dup(c18_b_u), &c18_c_u, 1, 3, 0U, 0, 0U, 0);
  c18_b_y = c18_c_u;
  sf_mex_destroy(&c18_b_u);
  return c18_b_y;
}

static void init_dsm_address_info(SFc18_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc18_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
  chartInstance->c18_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c18_u = (real_T (*)[6])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c18_y = (real_T (*)[7])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c18_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(3669229500U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(490348266U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2982423110U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(1200777508U);
}

mxArray *sf_c18_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c18_sliding_controller_rbdl_jit_fallback_info(void)
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

mxArray *sf_c18_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c18_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPhDBxMDABqQ4IEwwYIXyGaFijHBxFri4AhCXVBakgsSLi5I9U4B0XmIumJ9YWuG"
    "Zl5YPNt+CAWE+GxbzGZHM54SKQ8AHe8r0iziA9Bsg6WchoF8AyKqEhQuUJt9+BQfK9EPsjyDgfl"
    "UU90P4mcXxicklmWWp8cmGFvHFOZkpmXnp8cn5eSVF+Tk5qUXxRUkpOUj+BAB2rx20"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c18_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sStKXtzIzHLETxtLQhJoVxG";
}

static void sf_opaque_initialize_c18_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c18_sliding_controller_rbdl
    ((SFc18_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c18_sliding_controller_rbdl
    ((SFc18_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c18_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c18_sliding_controller_rbdl
    ((SFc18_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c18_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c18_sliding_controller_rbdl
    ((SFc18_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c18_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c18_sliding_controller_rbdl
    ((SFc18_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c18_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c18_sliding_controller_rbdl
    ((SFc18_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c18_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c18_sliding_controller_rbdl
    ((SFc18_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c18_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc18_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c18_sliding_controller_rbdl
      ((SFc18_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc18_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc18_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c18_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c18_sliding_controller_rbdl
    ((SFc18_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c18_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c18_sliding_controller_rbdl
    ((SFc18_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc18_sliding_controller_rbdl
    ((SFc18_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c18_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c18_sliding_controller_rbdl
      ((SFc18_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc18_sliding_controller_rbdl
      ((SFc18_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c18_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [18] = {
    "eNrtV81u00oUdqOCqASoQkhsELBBsITFlVhxS/MDgZQWnPYiNtF0fBKPMp4x85MmvAEL3gUJ8R4",
    "s2bHhAXgEzthOGhzboURUcIUl1xn7O2fOOd/5mXpr7R0Pr4t4b13yvLP4PId3zUuvM9l6be5O36",
    "97t7L1WxQSNtojikTaq7wEieA5aMmtYVK0RV8WwpjogwJBERtLZcq0aRZZzsSwZQV1+vR/IaOhH",
    "0rLg22UJcGu4BPUFluzh3oaTAE1LYDAhEraQdjiZDCzWJmjegh0qG1U5YIG49vYmaV3LDcs5tAc",
    "A20LbQharI9t8w0xUDfjUjedp9qfAmUUc0ZEobch0T7EGGAD+3GAf3etQafyMBoSZbYhJCPQHTZ",
    "MdEoBeZ1M44dDJoiRihHejHjdCS7atsfRnh0ZAK8ICNq2rYAMY8mEKeffb6GnTUEOOTTg0A7Ktf",
    "nwyjryDxgcgSqNW78uR6DIAHZF6aZJQJrjhK1ZlizCDIvggKgHFPnTEJRmL2aO9gnyBF2UKINB4",
    "mRbdxUbYXhLtdmo7TJzWcnYKCVbL4Ml2pojqGJhpq1FRZ1wrkthXRl3YAQ80doghlTDUq3FOK1Z",
    "0JUYYJfe5dVgBUPiM1hdioAV0jXKAZK+8xQby/dIarWRUR2Tt9HpLH5ehLWFAdUnFIq6gCJMA8Y",
    "sCW+5toBpxz0C0SqTmFcETjNkGcrTfSsaR1INMSYVTeTYBcdoKTDSA+QSK2FfY9FUwRyXy3CU0B",
    "AC12AYhx0sG8QWxES71vYA627EzKQBmioWF7BqseqwDTVdQk1i2BdDIY9ES8nIz3p8Gl4AzDaiB",
    "BODbexfatLC3YuocPPsjnc8z87/wDybyuWft+f0rBXo8eae+X03atX71vDX2nT+zsldyO2znpNz",
    "uE2833z2Dz6//Pjl2j/vxeWvH66ssv+72snm/8VsfXXaaGeFM1rIV4d9NGfXeoH+K3P6N7O19s2",
    "TF+Z1+/WjTrM7Np1n4WN5MH6Y8rPE3lrO3un7G67jY5Yl+aloO8gOJm5NbDqunf57c/aeXRKPje",
    "x9en39dzX5y1t5HteXyG/ir0kub39+/xtbq8mn+79YYv/NHN83k7neI65bQI/evdfTnAVY6j0qh",
    "VGSc1A9dRjwnJ8/m+8nlfNOWe5PsfOv3K/n/Ufm12nLeacst6p/J53jvxu+ah54Ofzmb+zHquer",
    "X43/5J3sHHQ9W9+f/atTDxkPCk692Wc8wvaLvv4P8vQbW3O1hA==",
    ""
  };

  static char newstr [1253] = "";
  newstr[0] = '\0';
  for (i = 0; i < 18; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c18_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c18_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(1448337289U));
  ssSetChecksum1(S,(3838859999U));
  ssSetChecksum2(S,(1857238302U));
  ssSetChecksum3(S,(397799444U));
}

static void mdlRTW_c18_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c18_sliding_controller_rbdl(SimStruct *S)
{
  SFc18_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc18_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc18_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc18_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc18_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c18_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c18_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c18_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c18_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c18_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c18_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c18_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c18_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c18_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c18_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c18_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c18_sliding_controller_rbdl;
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
    chartInstance->c18_JITStateAnimation,
    chartInstance->c18_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c18_sliding_controller_rbdl(chartInstance);
}

void c18_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c18_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c18_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c18_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c18_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
