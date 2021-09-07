/* Include files */

#include "PD_rbdl_sfun.h"
#include "c1_PD_rbdl.h"
#include "c6_PD_rbdl.h"
#include "c23_PD_rbdl.h"
#include "c25_PD_rbdl.h"

/* Forward Declarations */
/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */

/* Function Definitions */
void PD_rbdl_initializer()
{
}

void PD_rbdl_terminator()
{
}

/* SFunction Glue Code */
unsigned int sf_PD_rbdl_method_dispatcher(SimStruct *simstructPtr, unsigned int
  chartFileNumber, const char* specsCksum, int_T method, void *data)
{
  if (chartFileNumber==1) {
    c1_PD_rbdl_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==6) {
    c6_PD_rbdl_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==23) {
    c23_PD_rbdl_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==25) {
    c25_PD_rbdl_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  return 0;
}

unsigned int sf_PD_rbdl_process_check_sum_call( int nlhs, mxArray * plhs[], int
  nrhs, const mxArray * prhs[] )
{

#ifdef MATLAB_MEX_FILE

  char commandName[20];
  if (nrhs<1 || !mxIsChar(prhs[0]) )
    return 0;

  /* Possible call to get the checksum */
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"sf_get_check_sum"))
    return 0;
  plhs[0] = mxCreateDoubleMatrix( 1,4,mxREAL);
  if (nrhs>1 && mxIsChar(prhs[1])) {
    mxGetString(prhs[1], commandName,sizeof(commandName)/sizeof(char));
    commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
    if (!strcmp(commandName,"machine")) {
      ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1065046552U);
      ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(2458683333U);
      ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(758661324U);
      ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3631586332U);
    } else if (nrhs==3 && !strcmp(commandName,"chart")) {
      unsigned int chartFileNumber;
      chartFileNumber = (unsigned int)mxGetScalar(prhs[2]);
      switch (chartFileNumber) {
       case 1:
        {
          extern void sf_c1_PD_rbdl_get_check_sum(mxArray *plhs[]);
          sf_c1_PD_rbdl_get_check_sum(plhs);
          break;
        }

       case 6:
        {
          extern void sf_c6_PD_rbdl_get_check_sum(mxArray *plhs[]);
          sf_c6_PD_rbdl_get_check_sum(plhs);
          break;
        }

       case 23:
        {
          extern void sf_c23_PD_rbdl_get_check_sum(mxArray *plhs[]);
          sf_c23_PD_rbdl_get_check_sum(plhs);
          break;
        }

       case 25:
        {
          extern void sf_c25_PD_rbdl_get_check_sum(mxArray *plhs[]);
          sf_c25_PD_rbdl_get_check_sum(plhs);
          break;
        }

       default:
        ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(0.0);
        ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(0.0);
        ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(0.0);
        ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(0.0);
      }
    } else if (!strcmp(commandName,"target")) {
      ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(554012934U);
      ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1499081315U);
      ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2859522221U);
      ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2889637065U);
    } else {
      return 0;
    }
  } else {
    ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(2225275096U);
    ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(563966450U);
    ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(212543899U);
    ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2482328062U);
  }

  return 1;

#else

  return 0;

#endif

}

unsigned int sf_PD_rbdl_get_eml_resolved_functions_info( int nlhs, mxArray *
  plhs[], int nrhs, const mxArray * prhs[] )
{

#ifdef MATLAB_MEX_FILE

  char commandName[64];
  char instanceChksum[64];
  if (nrhs<3 || !mxIsChar(prhs[0]))
    return 0;

  /* Possible call to get the get_eml_resolved_functions_info */
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"get_eml_resolved_functions_info"))
    return 0;

  {
    unsigned int chartFileNumber;
    mxGetString(prhs[2], instanceChksum,sizeof(instanceChksum)/sizeof(char));
    instanceChksum[(sizeof(instanceChksum)/sizeof(char)-1)] = '\0';
    chartFileNumber = (unsigned int)mxGetScalar(prhs[1]);
    switch (chartFileNumber) {
     case 1:
      {
        if (strcmp(instanceChksum, "sz4RAlAineuVo8CCV5Hr2sG") == 0) {
          extern const mxArray *sf_c1_PD_rbdl_get_eml_resolved_functions_info
            (void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c1_PD_rbdl_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 6:
      {
        if (strcmp(instanceChksum, "sz4RAlAineuVo8CCV5Hr2sG") == 0) {
          extern const mxArray *sf_c6_PD_rbdl_get_eml_resolved_functions_info
            (void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c6_PD_rbdl_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 23:
      {
        if (strcmp(instanceChksum, "scYvH40EpYswOoaWKJIjtgC") == 0) {
          extern const mxArray *sf_c23_PD_rbdl_get_eml_resolved_functions_info
            (void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c23_PD_rbdl_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 25:
      {
        if (strcmp(instanceChksum, "sDt8ga6s3SmK65qEWTBZYi") == 0) {
          extern const mxArray *sf_c25_PD_rbdl_get_eml_resolved_functions_info
            (void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c25_PD_rbdl_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     default:
      plhs[0] = mxCreateDoubleMatrix(0,0,mxREAL);
    }
  }

  return 1;

#else

  return 0;

#endif

}

unsigned int sf_PD_rbdl_third_party_uses_info( int nlhs, mxArray * plhs[], int
  nrhs, const mxArray * prhs[] )
{
  char commandName[64];
  char tpChksum[64];
  if (nrhs<3 || !mxIsChar(prhs[0]))
    return 0;

  /* Possible call to get the third_party_uses_info */
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  mxGetString(prhs[2], tpChksum,sizeof(tpChksum)/sizeof(char));
  tpChksum[(sizeof(tpChksum)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"get_third_party_uses_info"))
    return 0;

  {
    unsigned int chartFileNumber;
    chartFileNumber = (unsigned int)mxGetScalar(prhs[1]);
    switch (chartFileNumber) {
     case 1:
      {
        if (strcmp(tpChksum, "sz4RAlAineuVo8CCV5Hr2sG") == 0) {
          extern mxArray *sf_c1_PD_rbdl_third_party_uses_info(void);
          plhs[0] = sf_c1_PD_rbdl_third_party_uses_info();
          break;
        }
      }

     case 6:
      {
        if (strcmp(tpChksum, "sz4RAlAineuVo8CCV5Hr2sG") == 0) {
          extern mxArray *sf_c6_PD_rbdl_third_party_uses_info(void);
          plhs[0] = sf_c6_PD_rbdl_third_party_uses_info();
          break;
        }
      }

     case 23:
      {
        if (strcmp(tpChksum, "scYvH40EpYswOoaWKJIjtgC") == 0) {
          extern mxArray *sf_c23_PD_rbdl_third_party_uses_info(void);
          plhs[0] = sf_c23_PD_rbdl_third_party_uses_info();
          break;
        }
      }

     case 25:
      {
        if (strcmp(tpChksum, "sDt8ga6s3SmK65qEWTBZYi") == 0) {
          extern mxArray *sf_c25_PD_rbdl_third_party_uses_info(void);
          plhs[0] = sf_c25_PD_rbdl_third_party_uses_info();
          break;
        }
      }

     default:
      plhs[0] = mxCreateDoubleMatrix(0,0,mxREAL);
    }
  }

  return 1;
}

unsigned int sf_PD_rbdl_jit_fallback_info( int nlhs, mxArray * plhs[], int nrhs,
  const mxArray * prhs[] )
{
  char commandName[64];
  char tpChksum[64];
  if (nrhs<3 || !mxIsChar(prhs[0]))
    return 0;

  /* Possible call to get the jit_fallback_info */
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  mxGetString(prhs[2], tpChksum,sizeof(tpChksum)/sizeof(char));
  tpChksum[(sizeof(tpChksum)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"get_jit_fallback_info"))
    return 0;

  {
    unsigned int chartFileNumber;
    chartFileNumber = (unsigned int)mxGetScalar(prhs[1]);
    switch (chartFileNumber) {
     case 1:
      {
        if (strcmp(tpChksum, "sz4RAlAineuVo8CCV5Hr2sG") == 0) {
          extern mxArray *sf_c1_PD_rbdl_jit_fallback_info(void);
          plhs[0] = sf_c1_PD_rbdl_jit_fallback_info();
          break;
        }
      }

     case 6:
      {
        if (strcmp(tpChksum, "sz4RAlAineuVo8CCV5Hr2sG") == 0) {
          extern mxArray *sf_c6_PD_rbdl_jit_fallback_info(void);
          plhs[0] = sf_c6_PD_rbdl_jit_fallback_info();
          break;
        }
      }

     case 23:
      {
        if (strcmp(tpChksum, "scYvH40EpYswOoaWKJIjtgC") == 0) {
          extern mxArray *sf_c23_PD_rbdl_jit_fallback_info(void);
          plhs[0] = sf_c23_PD_rbdl_jit_fallback_info();
          break;
        }
      }

     case 25:
      {
        if (strcmp(tpChksum, "sDt8ga6s3SmK65qEWTBZYi") == 0) {
          extern mxArray *sf_c25_PD_rbdl_jit_fallback_info(void);
          plhs[0] = sf_c25_PD_rbdl_jit_fallback_info();
          break;
        }
      }

     default:
      plhs[0] = mxCreateDoubleMatrix(0,0,mxREAL);
    }
  }

  return 1;
}

unsigned int sf_PD_rbdl_get_post_codegen_info( int nlhs, mxArray * plhs[], int
  nrhs, const mxArray * prhs[] )
{
  char commandName[64];
  char tpChksum[64];
  if (nrhs<3 || !mxIsChar(prhs[0]))
    return 0;

  /* Possible call to get_post_codegen_info */
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  mxGetString(prhs[2], tpChksum,sizeof(tpChksum)/sizeof(char));
  tpChksum[(sizeof(tpChksum)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"get_post_codegen_info"))
    return 0;

  {
    unsigned int chartFileNumber;
    chartFileNumber = (unsigned int)mxGetScalar(prhs[1]);
    switch (chartFileNumber) {
     case 1:
      {
        if (strcmp(tpChksum, "sz4RAlAineuVo8CCV5Hr2sG") == 0) {
          const char *sf_c1_PD_rbdl_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c1_PD_rbdl_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 6:
      {
        if (strcmp(tpChksum, "sz4RAlAineuVo8CCV5Hr2sG") == 0) {
          const char *sf_c6_PD_rbdl_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c6_PD_rbdl_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 23:
      {
        if (strcmp(tpChksum, "scYvH40EpYswOoaWKJIjtgC") == 0) {
          const char *sf_c23_PD_rbdl_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c23_PD_rbdl_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 25:
      {
        if (strcmp(tpChksum, "sDt8ga6s3SmK65qEWTBZYi") == 0) {
          const char *sf_c25_PD_rbdl_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c25_PD_rbdl_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     default:
      plhs[0] = mxCreateDoubleMatrix(0,0,mxREAL);
    }
  }

  return 1;
}

unsigned int sf_PD_rbdl_updateBuildInfo_args_info( int nlhs, mxArray * plhs[],
  int nrhs, const mxArray * prhs[] )
{
  char commandName[64];
  char tpChksum[64];
  if (nrhs<3 || !mxIsChar(prhs[0]))
    return 0;

  /* Possible call to get the updateBuildInfo_args_info */
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  mxGetString(prhs[2], tpChksum,sizeof(tpChksum)/sizeof(char));
  tpChksum[(sizeof(tpChksum)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"get_updateBuildInfo_args_info"))
    return 0;

  {
    unsigned int chartFileNumber;
    chartFileNumber = (unsigned int)mxGetScalar(prhs[1]);
    switch (chartFileNumber) {
     case 1:
      {
        if (strcmp(tpChksum, "sz4RAlAineuVo8CCV5Hr2sG") == 0) {
          extern mxArray *sf_c1_PD_rbdl_updateBuildInfo_args_info(void);
          plhs[0] = sf_c1_PD_rbdl_updateBuildInfo_args_info();
          break;
        }
      }

     case 6:
      {
        if (strcmp(tpChksum, "sz4RAlAineuVo8CCV5Hr2sG") == 0) {
          extern mxArray *sf_c6_PD_rbdl_updateBuildInfo_args_info(void);
          plhs[0] = sf_c6_PD_rbdl_updateBuildInfo_args_info();
          break;
        }
      }

     case 23:
      {
        if (strcmp(tpChksum, "scYvH40EpYswOoaWKJIjtgC") == 0) {
          extern mxArray *sf_c23_PD_rbdl_updateBuildInfo_args_info(void);
          plhs[0] = sf_c23_PD_rbdl_updateBuildInfo_args_info();
          break;
        }
      }

     case 25:
      {
        if (strcmp(tpChksum, "sDt8ga6s3SmK65qEWTBZYi") == 0) {
          extern mxArray *sf_c25_PD_rbdl_updateBuildInfo_args_info(void);
          plhs[0] = sf_c25_PD_rbdl_updateBuildInfo_args_info();
          break;
        }
      }

     default:
      plhs[0] = mxCreateDoubleMatrix(0,0,mxREAL);
    }
  }

  return 1;
}

void PD_rbdl_register_exported_symbols(SimStruct* S)
{
}

static mxArray* sRtwOptimizationInfoStruct= NULL;
typedef struct SfOptimizationInfoFlagsTag {
  boolean_T isRtwGen;
  boolean_T isModelRef;
  boolean_T isExternal;
} SfOptimizationInfoFlags;

static SfOptimizationInfoFlags sOptimizationInfoFlags;
void unload_PD_rbdl_optimization_info(void);
mxArray* load_PD_rbdl_optimization_info(boolean_T isRtwGen, boolean_T isModelRef,
  boolean_T isExternal)
{
  if (sOptimizationInfoFlags.isRtwGen != isRtwGen ||
      sOptimizationInfoFlags.isModelRef != isModelRef ||
      sOptimizationInfoFlags.isExternal != isExternal) {
    unload_PD_rbdl_optimization_info();
  }

  sOptimizationInfoFlags.isRtwGen = isRtwGen;
  sOptimizationInfoFlags.isModelRef = isModelRef;
  sOptimizationInfoFlags.isExternal = isExternal;
  if (sRtwOptimizationInfoStruct==NULL) {
    sRtwOptimizationInfoStruct = sf_load_rtw_optimization_info("PD_rbdl",
      "PD_rbdl");
    mexMakeArrayPersistent(sRtwOptimizationInfoStruct);
  }

  return(sRtwOptimizationInfoStruct);
}

void unload_PD_rbdl_optimization_info(void)
{
  if (sRtwOptimizationInfoStruct!=NULL) {
    mxDestroyArray(sRtwOptimizationInfoStruct);
    sRtwOptimizationInfoStruct = NULL;
  }
}
