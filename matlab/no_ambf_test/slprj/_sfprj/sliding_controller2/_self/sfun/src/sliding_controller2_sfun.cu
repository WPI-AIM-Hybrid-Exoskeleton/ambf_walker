/* Include files */

#include "sliding_controller2_sfun.h"
#include "c1_sliding_controller2.h"
#include "c2_sliding_controller2.h"
#include "c6_sliding_controller2.h"
#include "c7_sliding_controller2.h"
#include "c8_sliding_controller2.h"
#include "c9_sliding_controller2.h"
#include "c10_sliding_controller2.h"
#include "c11_sliding_controller2.h"
#include "c12_sliding_controller2.h"
#include "c13_sliding_controller2.h"
#include "c14_sliding_controller2.h"
#include "c17_sliding_controller2.h"
#include "c18_sliding_controller2.h"
#include "c19_sliding_controller2.h"
#include "c20_sliding_controller2.h"
#include "c21_sliding_controller2.h"
#include "c22_sliding_controller2.h"
#include "c23_sliding_controller2.h"
#include "c24_sliding_controller2.h"
#include "c28_sliding_controller2.h"
#include "c29_sliding_controller2.h"

/* Forward Declarations */
/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */

/* Function Definitions */
void sliding_controller2_initializer()
{
}

void sliding_controller2_terminator()
{
}

/* SFunction Glue Code */
unsigned int sf_sliding_controller2_method_dispatcher(SimStruct *simstructPtr,
  unsigned int chartFileNumber, const char* specsCksum, int_T method, void *data)
{
  if (chartFileNumber==1) {
    c1_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==2) {
    c2_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==6) {
    c6_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==7) {
    c7_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==8) {
    c8_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==9) {
    c9_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==10) {
    c10_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==11) {
    c11_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==12) {
    c12_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==13) {
    c13_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==14) {
    c14_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==17) {
    c17_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==18) {
    c18_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==19) {
    c19_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==20) {
    c20_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==21) {
    c21_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==22) {
    c22_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==23) {
    c23_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==24) {
    c24_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==28) {
    c28_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  if (chartFileNumber==29) {
    c29_sliding_controller2_method_dispatcher(simstructPtr, method, data);
    return 1;
  }

  return 0;
}

unsigned int sf_sliding_controller2_process_check_sum_call( int nlhs, mxArray *
  plhs[], int nrhs, const mxArray * prhs[] )
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
      ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(173214583U);
      ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1299204507U);
      ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3342616120U);
      ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(28112184U);
    } else if (nrhs==3 && !strcmp(commandName,"chart")) {
      unsigned int chartFileNumber;
      chartFileNumber = (unsigned int)mxGetScalar(prhs[2]);
      switch (chartFileNumber) {
       case 1:
        {
          extern void sf_c1_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c1_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 2:
        {
          extern void sf_c2_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c2_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 6:
        {
          extern void sf_c6_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c6_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 7:
        {
          extern void sf_c7_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c7_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 8:
        {
          extern void sf_c8_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c8_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 9:
        {
          extern void sf_c9_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c9_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 10:
        {
          extern void sf_c10_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c10_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 11:
        {
          extern void sf_c11_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c11_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 12:
        {
          extern void sf_c12_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c12_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 13:
        {
          extern void sf_c13_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c13_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 14:
        {
          extern void sf_c14_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c14_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 17:
        {
          extern void sf_c17_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c17_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 18:
        {
          extern void sf_c18_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c18_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 19:
        {
          extern void sf_c19_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c19_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 20:
        {
          extern void sf_c20_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c20_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 21:
        {
          extern void sf_c21_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c21_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 22:
        {
          extern void sf_c22_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c22_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 23:
        {
          extern void sf_c23_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c23_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 24:
        {
          extern void sf_c24_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c24_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 28:
        {
          extern void sf_c28_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c28_sliding_controller2_get_check_sum(plhs);
          break;
        }

       case 29:
        {
          extern void sf_c29_sliding_controller2_get_check_sum(mxArray *plhs[]);
          sf_c29_sliding_controller2_get_check_sum(plhs);
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
    ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(631722290U);
    ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1389502170U);
    ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(4292803144U);
    ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(807106828U);
  }

  return 1;

#else

  return 0;

#endif

}

unsigned int sf_sliding_controller2_get_eml_resolved_functions_info( int nlhs,
  mxArray * plhs[], int nrhs, const mxArray * prhs[] )
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
        if (strcmp(instanceChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          extern const mxArray
            *sf_c1_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c1_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 2:
      {
        if (strcmp(instanceChksum, "slepYeUXowTO3g5Jd5Ug84B") == 0) {
          extern const mxArray
            *sf_c2_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c2_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 6:
      {
        if (strcmp(instanceChksum, "s8raH7go15DoxtI0f9CCC6G") == 0) {
          extern const mxArray
            *sf_c6_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c6_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 7:
      {
        if (strcmp(instanceChksum, "sFqlSox9r5ekjZXT2w93GAD") == 0) {
          extern const mxArray
            *sf_c7_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c7_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 8:
      {
        if (strcmp(instanceChksum, "sYLA1HBLp0f6BprwjY7zn1D") == 0) {
          extern const mxArray
            *sf_c8_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c8_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 9:
      {
        if (strcmp(instanceChksum, "sjS5Om55RaK9v6MEldWgzUF") == 0) {
          extern const mxArray
            *sf_c9_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c9_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 10:
      {
        if (strcmp(instanceChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          extern const mxArray
            *sf_c10_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c10_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 11:
      {
        if (strcmp(instanceChksum, "sbxht3CbcYr3IsVnyczGW4F") == 0) {
          extern const mxArray
            *sf_c11_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c11_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 12:
      {
        if (strcmp(instanceChksum, "sITpOBJPN6OXIDOpjmctU7") == 0) {
          extern const mxArray
            *sf_c12_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c12_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 13:
      {
        if (strcmp(instanceChksum, "snQO6VnpiMl9TNTLTiXAGiG") == 0) {
          extern const mxArray
            *sf_c13_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c13_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 14:
      {
        if (strcmp(instanceChksum, "srLlN0UU1TI2nTLqVx7w7ZD") == 0) {
          extern const mxArray
            *sf_c14_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c14_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 17:
      {
        if (strcmp(instanceChksum, "siB67nyLXRLMbo1kYaCR9pH") == 0) {
          extern const mxArray
            *sf_c17_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c17_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 18:
      {
        if (strcmp(instanceChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern const mxArray
            *sf_c18_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c18_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 19:
      {
        if (strcmp(instanceChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          extern const mxArray
            *sf_c19_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c19_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 20:
      {
        if (strcmp(instanceChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          extern const mxArray
            *sf_c20_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c20_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 21:
      {
        if (strcmp(instanceChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern const mxArray
            *sf_c21_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c21_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 22:
      {
        if (strcmp(instanceChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern const mxArray
            *sf_c22_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c22_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 23:
      {
        if (strcmp(instanceChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern const mxArray
            *sf_c23_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c23_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 24:
      {
        if (strcmp(instanceChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern const mxArray
            *sf_c24_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c24_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 28:
      {
        if (strcmp(instanceChksum, "sFqlSox9r5ekjZXT2w93GAD") == 0) {
          extern const mxArray
            *sf_c28_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c28_sliding_controller2_get_eml_resolved_functions_info();
          plhs[0] = mxDuplicateArray(persistentMxArray);
          mxDestroyArray(persistentMxArray);
          break;
        }
      }

     case 29:
      {
        if (strcmp(instanceChksum, "sjS5Om55RaK9v6MEldWgzUF") == 0) {
          extern const mxArray
            *sf_c29_sliding_controller2_get_eml_resolved_functions_info(void);
          mxArray *persistentMxArray = (mxArray *)
            sf_c29_sliding_controller2_get_eml_resolved_functions_info();
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

unsigned int sf_sliding_controller2_third_party_uses_info( int nlhs, mxArray *
  plhs[], int nrhs, const mxArray * prhs[] )
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
        if (strcmp(tpChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          extern mxArray *sf_c1_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c1_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 2:
      {
        if (strcmp(tpChksum, "slepYeUXowTO3g5Jd5Ug84B") == 0) {
          extern mxArray *sf_c2_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c2_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 6:
      {
        if (strcmp(tpChksum, "s8raH7go15DoxtI0f9CCC6G") == 0) {
          extern mxArray *sf_c6_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c6_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 7:
      {
        if (strcmp(tpChksum, "sFqlSox9r5ekjZXT2w93GAD") == 0) {
          extern mxArray *sf_c7_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c7_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 8:
      {
        if (strcmp(tpChksum, "sYLA1HBLp0f6BprwjY7zn1D") == 0) {
          extern mxArray *sf_c8_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c8_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 9:
      {
        if (strcmp(tpChksum, "sjS5Om55RaK9v6MEldWgzUF") == 0) {
          extern mxArray *sf_c9_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c9_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 10:
      {
        if (strcmp(tpChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          extern mxArray *sf_c10_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c10_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 11:
      {
        if (strcmp(tpChksum, "sbxht3CbcYr3IsVnyczGW4F") == 0) {
          extern mxArray *sf_c11_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c11_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 12:
      {
        if (strcmp(tpChksum, "sITpOBJPN6OXIDOpjmctU7") == 0) {
          extern mxArray *sf_c12_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c12_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 13:
      {
        if (strcmp(tpChksum, "snQO6VnpiMl9TNTLTiXAGiG") == 0) {
          extern mxArray *sf_c13_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c13_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 14:
      {
        if (strcmp(tpChksum, "srLlN0UU1TI2nTLqVx7w7ZD") == 0) {
          extern mxArray *sf_c14_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c14_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 17:
      {
        if (strcmp(tpChksum, "siB67nyLXRLMbo1kYaCR9pH") == 0) {
          extern mxArray *sf_c17_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c17_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 18:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern mxArray *sf_c18_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c18_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 19:
      {
        if (strcmp(tpChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          extern mxArray *sf_c19_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c19_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 20:
      {
        if (strcmp(tpChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          extern mxArray *sf_c20_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c20_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 21:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern mxArray *sf_c21_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c21_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 22:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern mxArray *sf_c22_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c22_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 23:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern mxArray *sf_c23_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c23_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 24:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern mxArray *sf_c24_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c24_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 28:
      {
        if (strcmp(tpChksum, "sFqlSox9r5ekjZXT2w93GAD") == 0) {
          extern mxArray *sf_c28_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c28_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     case 29:
      {
        if (strcmp(tpChksum, "sjS5Om55RaK9v6MEldWgzUF") == 0) {
          extern mxArray *sf_c29_sliding_controller2_third_party_uses_info(void);
          plhs[0] = sf_c29_sliding_controller2_third_party_uses_info();
          break;
        }
      }

     default:
      plhs[0] = mxCreateDoubleMatrix(0,0,mxREAL);
    }
  }

  return 1;
}

unsigned int sf_sliding_controller2_jit_fallback_info( int nlhs, mxArray * plhs[],
  int nrhs, const mxArray * prhs[] )
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
        if (strcmp(tpChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          extern mxArray *sf_c1_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c1_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 2:
      {
        if (strcmp(tpChksum, "slepYeUXowTO3g5Jd5Ug84B") == 0) {
          extern mxArray *sf_c2_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c2_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 6:
      {
        if (strcmp(tpChksum, "s8raH7go15DoxtI0f9CCC6G") == 0) {
          extern mxArray *sf_c6_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c6_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 7:
      {
        if (strcmp(tpChksum, "sFqlSox9r5ekjZXT2w93GAD") == 0) {
          extern mxArray *sf_c7_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c7_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 8:
      {
        if (strcmp(tpChksum, "sYLA1HBLp0f6BprwjY7zn1D") == 0) {
          extern mxArray *sf_c8_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c8_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 9:
      {
        if (strcmp(tpChksum, "sjS5Om55RaK9v6MEldWgzUF") == 0) {
          extern mxArray *sf_c9_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c9_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 10:
      {
        if (strcmp(tpChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          extern mxArray *sf_c10_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c10_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 11:
      {
        if (strcmp(tpChksum, "sbxht3CbcYr3IsVnyczGW4F") == 0) {
          extern mxArray *sf_c11_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c11_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 12:
      {
        if (strcmp(tpChksum, "sITpOBJPN6OXIDOpjmctU7") == 0) {
          extern mxArray *sf_c12_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c12_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 13:
      {
        if (strcmp(tpChksum, "snQO6VnpiMl9TNTLTiXAGiG") == 0) {
          extern mxArray *sf_c13_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c13_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 14:
      {
        if (strcmp(tpChksum, "srLlN0UU1TI2nTLqVx7w7ZD") == 0) {
          extern mxArray *sf_c14_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c14_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 17:
      {
        if (strcmp(tpChksum, "siB67nyLXRLMbo1kYaCR9pH") == 0) {
          extern mxArray *sf_c17_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c17_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 18:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern mxArray *sf_c18_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c18_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 19:
      {
        if (strcmp(tpChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          extern mxArray *sf_c19_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c19_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 20:
      {
        if (strcmp(tpChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          extern mxArray *sf_c20_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c20_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 21:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern mxArray *sf_c21_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c21_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 22:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern mxArray *sf_c22_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c22_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 23:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern mxArray *sf_c23_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c23_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 24:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern mxArray *sf_c24_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c24_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 28:
      {
        if (strcmp(tpChksum, "sFqlSox9r5ekjZXT2w93GAD") == 0) {
          extern mxArray *sf_c28_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c28_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     case 29:
      {
        if (strcmp(tpChksum, "sjS5Om55RaK9v6MEldWgzUF") == 0) {
          extern mxArray *sf_c29_sliding_controller2_jit_fallback_info(void);
          plhs[0] = sf_c29_sliding_controller2_jit_fallback_info();
          break;
        }
      }

     default:
      plhs[0] = mxCreateDoubleMatrix(0,0,mxREAL);
    }
  }

  return 1;
}

unsigned int sf_sliding_controller2_get_post_codegen_info( int nlhs, mxArray *
  plhs[], int nrhs, const mxArray * prhs[] )
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
        if (strcmp(tpChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          const char *sf_c1_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c1_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 2:
      {
        if (strcmp(tpChksum, "slepYeUXowTO3g5Jd5Ug84B") == 0) {
          const char *sf_c2_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c2_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 6:
      {
        if (strcmp(tpChksum, "s8raH7go15DoxtI0f9CCC6G") == 0) {
          const char *sf_c6_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c6_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 7:
      {
        if (strcmp(tpChksum, "sFqlSox9r5ekjZXT2w93GAD") == 0) {
          const char *sf_c7_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c7_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 8:
      {
        if (strcmp(tpChksum, "sYLA1HBLp0f6BprwjY7zn1D") == 0) {
          const char *sf_c8_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c8_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 9:
      {
        if (strcmp(tpChksum, "sjS5Om55RaK9v6MEldWgzUF") == 0) {
          const char *sf_c9_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c9_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 10:
      {
        if (strcmp(tpChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          const char *sf_c10_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c10_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 11:
      {
        if (strcmp(tpChksum, "sbxht3CbcYr3IsVnyczGW4F") == 0) {
          const char *sf_c11_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c11_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 12:
      {
        if (strcmp(tpChksum, "sITpOBJPN6OXIDOpjmctU7") == 0) {
          const char *sf_c12_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c12_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 13:
      {
        if (strcmp(tpChksum, "snQO6VnpiMl9TNTLTiXAGiG") == 0) {
          const char *sf_c13_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c13_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 14:
      {
        if (strcmp(tpChksum, "srLlN0UU1TI2nTLqVx7w7ZD") == 0) {
          const char *sf_c14_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c14_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 17:
      {
        if (strcmp(tpChksum, "siB67nyLXRLMbo1kYaCR9pH") == 0) {
          const char *sf_c17_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c17_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 18:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          const char *sf_c18_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c18_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 19:
      {
        if (strcmp(tpChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          const char *sf_c19_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c19_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 20:
      {
        if (strcmp(tpChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          const char *sf_c20_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c20_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 21:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          const char *sf_c21_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c21_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 22:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          const char *sf_c22_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c22_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 23:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          const char *sf_c23_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c23_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 24:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          const char *sf_c24_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c24_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 28:
      {
        if (strcmp(tpChksum, "sFqlSox9r5ekjZXT2w93GAD") == 0) {
          const char *sf_c28_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c28_sliding_controller2_get_post_codegen_info();
          plhs[0] = sf_mex_decode(encoded_post_codegen_info);
          break;
        }
      }

     case 29:
      {
        if (strcmp(tpChksum, "sjS5Om55RaK9v6MEldWgzUF") == 0) {
          const char *sf_c29_sliding_controller2_get_post_codegen_info(void);
          const char* encoded_post_codegen_info =
            sf_c29_sliding_controller2_get_post_codegen_info();
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

unsigned int sf_sliding_controller2_updateBuildInfo_args_info( int nlhs, mxArray
  * plhs[], int nrhs, const mxArray * prhs[] )
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
        if (strcmp(tpChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          extern mxArray *sf_c1_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c1_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 2:
      {
        if (strcmp(tpChksum, "slepYeUXowTO3g5Jd5Ug84B") == 0) {
          extern mxArray *sf_c2_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c2_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 6:
      {
        if (strcmp(tpChksum, "s8raH7go15DoxtI0f9CCC6G") == 0) {
          extern mxArray *sf_c6_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c6_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 7:
      {
        if (strcmp(tpChksum, "sFqlSox9r5ekjZXT2w93GAD") == 0) {
          extern mxArray *sf_c7_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c7_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 8:
      {
        if (strcmp(tpChksum, "sYLA1HBLp0f6BprwjY7zn1D") == 0) {
          extern mxArray *sf_c8_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c8_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 9:
      {
        if (strcmp(tpChksum, "sjS5Om55RaK9v6MEldWgzUF") == 0) {
          extern mxArray *sf_c9_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c9_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 10:
      {
        if (strcmp(tpChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          extern mxArray *sf_c10_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c10_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 11:
      {
        if (strcmp(tpChksum, "sbxht3CbcYr3IsVnyczGW4F") == 0) {
          extern mxArray *sf_c11_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c11_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 12:
      {
        if (strcmp(tpChksum, "sITpOBJPN6OXIDOpjmctU7") == 0) {
          extern mxArray *sf_c12_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c12_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 13:
      {
        if (strcmp(tpChksum, "snQO6VnpiMl9TNTLTiXAGiG") == 0) {
          extern mxArray *sf_c13_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c13_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 14:
      {
        if (strcmp(tpChksum, "srLlN0UU1TI2nTLqVx7w7ZD") == 0) {
          extern mxArray *sf_c14_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c14_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 17:
      {
        if (strcmp(tpChksum, "siB67nyLXRLMbo1kYaCR9pH") == 0) {
          extern mxArray *sf_c17_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c17_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 18:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern mxArray *sf_c18_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c18_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 19:
      {
        if (strcmp(tpChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          extern mxArray *sf_c19_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c19_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 20:
      {
        if (strcmp(tpChksum, "sQh5nvZHhAQaTmI03z90vbC") == 0) {
          extern mxArray *sf_c20_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c20_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 21:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern mxArray *sf_c21_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c21_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 22:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern mxArray *sf_c22_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c22_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 23:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern mxArray *sf_c23_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c23_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 24:
      {
        if (strcmp(tpChksum, "scU9zZ5H1kMhWDkDI28BpgD") == 0) {
          extern mxArray *sf_c24_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c24_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 28:
      {
        if (strcmp(tpChksum, "sFqlSox9r5ekjZXT2w93GAD") == 0) {
          extern mxArray *sf_c28_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c28_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     case 29:
      {
        if (strcmp(tpChksum, "sjS5Om55RaK9v6MEldWgzUF") == 0) {
          extern mxArray *sf_c29_sliding_controller2_updateBuildInfo_args_info
            (void);
          plhs[0] = sf_c29_sliding_controller2_updateBuildInfo_args_info();
          break;
        }
      }

     default:
      plhs[0] = mxCreateDoubleMatrix(0,0,mxREAL);
    }
  }

  return 1;
}

void sliding_controller2_register_exported_symbols(SimStruct* S)
{
}

static mxArray* sRtwOptimizationInfoStruct= NULL;
typedef struct SfOptimizationInfoFlagsTag {
  boolean_T isRtwGen;
  boolean_T isModelRef;
  boolean_T isExternal;
} SfOptimizationInfoFlags;

static SfOptimizationInfoFlags sOptimizationInfoFlags;
void unload_sliding_controller2_optimization_info(void);
mxArray* load_sliding_controller2_optimization_info(boolean_T isRtwGen,
  boolean_T isModelRef, boolean_T isExternal)
{
  if (sOptimizationInfoFlags.isRtwGen != isRtwGen ||
      sOptimizationInfoFlags.isModelRef != isModelRef ||
      sOptimizationInfoFlags.isExternal != isExternal) {
    unload_sliding_controller2_optimization_info();
  }

  sOptimizationInfoFlags.isRtwGen = isRtwGen;
  sOptimizationInfoFlags.isModelRef = isModelRef;
  sOptimizationInfoFlags.isExternal = isExternal;
  if (sRtwOptimizationInfoStruct==NULL) {
    sRtwOptimizationInfoStruct = sf_load_rtw_optimization_info(
      "sliding_controller2", "sliding_controller2");
    mexMakeArrayPersistent(sRtwOptimizationInfoStruct);
  }

  return(sRtwOptimizationInfoStruct);
}

void unload_sliding_controller2_optimization_info(void)
{
  if (sRtwOptimizationInfoStruct!=NULL) {
    mxDestroyArray(sRtwOptimizationInfoStruct);
    sRtwOptimizationInfoStruct = NULL;
  }
}
