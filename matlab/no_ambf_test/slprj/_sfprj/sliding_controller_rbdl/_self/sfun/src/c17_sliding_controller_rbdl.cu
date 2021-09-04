/* Include files */

#include "sliding_controller_rbdl_sfun.h"
#include "c17_sliding_controller_rbdl.h"
#include "MWCudaDimUtility.hpp"
#include "MWGpuFunctionImplUtility.hpp"
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

#include "MWCUSOLVERUtils.hpp"
#include "math_constants.h"

/* Forward Declarations */

/* Type Definitions */

/* Named Constants */
const int32_T CALL_EVENT = -1;

/* Variable Declarations */

/* Variable Definitions */
static real_T _sfTime_;

/* Function Declarations */
static void initialize_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initialize_params_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance);
static void enable_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance);
static void disable_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c17_do_animation_call_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance);
static void ext_mode_exec_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance);
static void set_sim_state_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c17_st);
static void sf_gateway_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_start_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_terminate_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance);
static void initSimStructsc17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance);
static void c17_eML_blk_kernel(SFc17_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c17_b_Kp0[7], real_T c17_b_Kn0[7], real_T c17_b_Bp0[7],
  real_T c17_b_Bn0[7], real_T c17_b_beta[2], real_T c17_b_alpha[2], real_T
  c17_b_Tid[7], real_T c17_b_Th[7], real_T c17_b_qd[7], real_T c17_b_K[49],
  real_T c17_b_B[49]);
static void c17_emlrt_marshallIn(SFc17_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c17_b_B, const char_T *c17_identifier, real_T
  c17_y[49]);
static void c17_b_emlrt_marshallIn(SFc17_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c17_u, const emlrtMsgIdentifier *c17_parentId,
  real_T c17_y[49]);
static uint8_T c17_c_emlrt_marshallIn
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c17_b_is_active_c17_sliding_controller_rbdl, const char_T *c17_identifier);
static uint8_T c17_d_emlrt_marshallIn
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c17_u, const emlrtMsgIdentifier *c17_parentId);
static __global__ void c17_eML_blk_kernel_kernel1(real_T c17_b_Kp0[49]);
static __global__ void c17_eML_blk_kernel_kernel2(const real_T c17_b_Kp0[7],
  real_T c17_c_Kp0[49]);
static __global__ void c17_eML_blk_kernel_kernel3(real_T c17_b_Kn0[49]);
static __global__ void c17_eML_blk_kernel_kernel4(const real_T c17_b_Kn0[7],
  real_T c17_c_Kn0[49]);
static __global__ void c17_eML_blk_kernel_kernel5(real_T c17_b_Bp0[49]);
static __global__ void c17_eML_blk_kernel_kernel6(const real_T c17_b_Bp0[7],
  real_T c17_c_Bp0[49]);
static __global__ void c17_eML_blk_kernel_kernel7(real_T c17_b_Bn0[49]);
static __global__ void c17_eML_blk_kernel_kernel8(const real_T c17_b_Tid[7],
  const real_T c17_b_qd[7], const real_T c17_b_Th[7], const real_T c17_b_Bn0[7],
  ptrdiff_t c17_jpvt_t[7], real_T c17_A[7], real_T c17_x[7], real_T c17_b_x[7],
  real_T c17_c_Bn0[49]);
static __global__ void c17_eML_blk_kernel_kernel9(const ptrdiff_t c17_jpvt_t[7],
  int32_T c17_jpvt[7]);
static __global__ void c17_eML_blk_kernel_kernel10(int32_T c17_jpvt[7], real_T
  c17_A[7]);
static __global__ void c17_eML_blk_kernel_kernel11(real_T c17_change[49]);
static __global__ void c17_eML_blk_kernel_kernel12(const real_T c17_b_Th[7],
  real_T c17_b_B[7]);
static __global__ void c17_eML_blk_kernel_kernel13(real_T c17_b_B[7]);
static __global__ void c17_eML_blk_kernel_kernel14(const int32_T c17_jpvt[7],
  const int32_T c17_rankA, real_T c17_A[7], real_T c17_b_B[7], real_T
  c17_change[49]);
static __global__ void c17_eML_blk_kernel_kernel15(const real_T c17_change[49],
  real_T c17_Y[49]);
static __global__ void c17_eML_blk_kernel_kernel16(const real_T c17_Y[49],
  real_T c17_b_K[49], real_T c17_change[49]);
static __global__ void c17_eML_blk_kernel_kernel17(real_T c17_b_K[49]);
static __global__ void c17_eML_blk_kernel_kernel18(real_T c17_b_B[49]);
static __global__ void c17_eML_blk_kernel_kernel19(const real_T c17_b_Bn0[49],
  const real_T c17_b_alpha[2], const real_T c17_b_Bp0[49], const real_T
  c17_b_Kp0[49], const real_T c17_change[49], const real_T c17_b_beta[2], const
  real_T c17_b_Kn0[49], const real_T c17_x[7], const real_T c17_b_x[7], real_T
  c17_b_K[49], real_T c17_b_B[49]);
static void init_dsm_address_info(SFc17_sliding_controller_rbdlInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc17_sliding_controller_rbdlInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c17_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c17_is_active_c17_sliding_controller_rbdl = 0U;
  cusolverEnsureInitialization();
  cudaGetLastError();
  cudaMalloc(&chartInstance->c17_gpu_beta, 16UL);
  cudaMalloc(&chartInstance->c17_gpu_alpha, 16UL);
  cudaMalloc(&chartInstance->c17_gpu_B, 392UL);
  cudaMalloc(&chartInstance->c17_gpu_K, 392UL);
  cudaMalloc(&chartInstance->c17_gpu_Y, 392UL);
  cudaMalloc(&chartInstance->c17_gpu_info_t, 4UL);
  cudaMalloc(&chartInstance->c17_gpu_tau, 8UL);
  cudaMalloc(&chartInstance->c17_b_gpu_B, 56UL);
  cudaMalloc(&chartInstance->c17_gpu_change, 392UL);
  cudaMalloc(&chartInstance->c17_gpu_jpvt, 28UL);
  cudaMalloc(&chartInstance->c17_gpu_x, 56UL);
  cudaMalloc(&chartInstance->c17_b_gpu_x, 56UL);
  cudaMalloc(&chartInstance->c17_gpu_A, 56UL);
  cudaMalloc(&chartInstance->c17_gpu_jpvt_t, 56UL);
  cudaMalloc(&chartInstance->c17_gpu_Bn0, 56UL);
  cudaMalloc(&chartInstance->c17_gpu_Th, 56UL);
  cudaMalloc(&chartInstance->c17_gpu_qd, 56UL);
  cudaMalloc(&chartInstance->c17_gpu_Tid, 56UL);
  cudaMalloc(&chartInstance->c17_b_gpu_Bn0, 392UL);
  cudaMalloc(&chartInstance->c17_gpu_Bp0, 56UL);
  cudaMalloc(&chartInstance->c17_b_gpu_Bp0, 392UL);
  cudaMalloc(&chartInstance->c17_gpu_Kn0, 56UL);
  cudaMalloc(&chartInstance->c17_b_gpu_Kn0, 392UL);
  cudaMalloc(&chartInstance->c17_gpu_Kp0, 56UL);
  cudaMalloc(&chartInstance->c17_b_gpu_Kp0, 392UL);
}

static void initialize_params_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void enable_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c17_do_animation_call_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  const mxArray *c17_b_y = NULL;
  const mxArray *c17_c_y = NULL;
  const mxArray *c17_d_y = NULL;
  const mxArray *c17_st;
  const mxArray *c17_y = NULL;
  c17_st = NULL;
  c17_y = NULL;
  sf_mex_assign(&c17_y, sf_mex_createcellmatrix(3, 1), false);
  c17_b_y = NULL;
  sf_mex_assign(&c17_b_y, sf_mex_create("y", *chartInstance->c17_B, 0, 0U, 1U,
    0U, 2, 7, 7), false);
  sf_mex_setcell(c17_y, 0, c17_b_y);
  c17_c_y = NULL;
  sf_mex_assign(&c17_c_y, sf_mex_create("y", *chartInstance->c17_K, 0, 0U, 1U,
    0U, 2, 7, 7), false);
  sf_mex_setcell(c17_y, 1, c17_c_y);
  c17_d_y = NULL;
  sf_mex_assign(&c17_d_y, sf_mex_create("y",
    &chartInstance->c17_is_active_c17_sliding_controller_rbdl, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c17_y, 2, c17_d_y);
  sf_mex_assign(&c17_st, c17_y, false);
  return c17_st;
}

static void set_sim_state_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c17_st)
{
  const mxArray *c17_u;
  c17_u = sf_mex_dup(c17_st);
  c17_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c17_u, 0)), "B",
                       *chartInstance->c17_B);
  c17_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c17_u, 1)), "K",
                       *chartInstance->c17_K);
  chartInstance->c17_is_active_c17_sliding_controller_rbdl =
    c17_c_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c17_u, 2)),
    "is_active_c17_sliding_controller_rbdl");
  sf_mex_destroy(&c17_u);
  sf_mex_destroy(&c17_st);
}

static void sf_gateway_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  real_T c17_dv10[49];
  real_T c17_dv9[49];
  real_T c17_dv[7];
  real_T c17_dv1[7];
  real_T c17_dv2[7];
  real_T c17_dv3[7];
  real_T c17_dv6[7];
  real_T c17_dv7[7];
  real_T c17_dv8[7];
  real_T c17_dv4[2];
  real_T c17_dv5[2];
  int32_T c17_i;
  int32_T c17_i1;
  int32_T c17_i10;
  int32_T c17_i2;
  int32_T c17_i3;
  int32_T c17_i4;
  int32_T c17_i5;
  int32_T c17_i6;
  int32_T c17_i7;
  int32_T c17_i8;
  int32_T c17_i9;
  chartInstance->c17_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  for (c17_i = 0; c17_i < 7; c17_i++) {
    c17_dv[c17_i] = (*chartInstance->c17_Kp0)[c17_i];
  }

  for (c17_i1 = 0; c17_i1 < 7; c17_i1++) {
    c17_dv1[c17_i1] = (*chartInstance->c17_Kn0)[c17_i1];
  }

  for (c17_i2 = 0; c17_i2 < 7; c17_i2++) {
    c17_dv2[c17_i2] = (*chartInstance->c17_Bp0)[c17_i2];
  }

  for (c17_i3 = 0; c17_i3 < 7; c17_i3++) {
    c17_dv3[c17_i3] = (*chartInstance->c17_Bn0)[c17_i3];
  }

  for (c17_i4 = 0; c17_i4 < 2; c17_i4++) {
    c17_dv4[c17_i4] = (*chartInstance->c17_beta)[c17_i4];
  }

  for (c17_i5 = 0; c17_i5 < 2; c17_i5++) {
    c17_dv5[c17_i5] = (*chartInstance->c17_alpha)[c17_i5];
  }

  for (c17_i6 = 0; c17_i6 < 7; c17_i6++) {
    c17_dv6[c17_i6] = (*chartInstance->c17_Tid)[c17_i6];
  }

  for (c17_i7 = 0; c17_i7 < 7; c17_i7++) {
    c17_dv7[c17_i7] = (*chartInstance->c17_Th)[c17_i7];
  }

  for (c17_i8 = 0; c17_i8 < 7; c17_i8++) {
    c17_dv8[c17_i8] = (*chartInstance->c17_qd)[c17_i8];
  }

  c17_eML_blk_kernel(chartInstance, c17_dv, c17_dv1, c17_dv2, c17_dv3, c17_dv4,
                     c17_dv5, c17_dv6, c17_dv7, c17_dv8, c17_dv9, c17_dv10);
  for (c17_i9 = 0; c17_i9 < 49; c17_i9++) {
    (*chartInstance->c17_B)[c17_i9] = c17_dv10[c17_i9];
  }

  for (c17_i10 = 0; c17_i10 < 49; c17_i10++) {
    (*chartInstance->c17_K)[c17_i10] = c17_dv9[c17_i10];
  }

  c17_do_animation_call_c17_sliding_controller_rbdl(chartInstance);
}

static void mdl_start_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void mdl_terminate_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  cudaError_t c17_errCode;
  cudaFree(*chartInstance->c17_gpu_beta);
  cudaFree(*chartInstance->c17_gpu_alpha);
  cudaFree(*chartInstance->c17_gpu_B);
  cudaFree(*chartInstance->c17_gpu_K);
  cudaFree(*chartInstance->c17_gpu_Y);
  cudaFree(chartInstance->c17_gpu_info_t);
  cudaFree(chartInstance->c17_gpu_tau);
  cudaFree(*chartInstance->c17_b_gpu_B);
  cudaFree(*chartInstance->c17_gpu_change);
  cudaFree(*chartInstance->c17_gpu_jpvt);
  cudaFree(*chartInstance->c17_gpu_x);
  cudaFree(*chartInstance->c17_b_gpu_x);
  cudaFree(*chartInstance->c17_gpu_A);
  cudaFree(*chartInstance->c17_gpu_jpvt_t);
  cudaFree(*chartInstance->c17_gpu_Bn0);
  cudaFree(*chartInstance->c17_gpu_Th);
  cudaFree(*chartInstance->c17_gpu_qd);
  cudaFree(*chartInstance->c17_gpu_Tid);
  cudaFree(*chartInstance->c17_b_gpu_Bn0);
  cudaFree(*chartInstance->c17_gpu_Bp0);
  cudaFree(*chartInstance->c17_b_gpu_Bp0);
  cudaFree(*chartInstance->c17_gpu_Kn0);
  cudaFree(*chartInstance->c17_b_gpu_Kn0);
  cudaFree(*chartInstance->c17_gpu_Kp0);
  cudaFree(*chartInstance->c17_b_gpu_Kp0);
  c17_errCode = cudaGetLastError();
  if (c17_errCode != cudaSuccess) {
    emlrtThinCUDAError((uint32_T)c17_errCode, (char_T *)cudaGetErrorName
                       (c17_errCode), (char_T *)cudaGetErrorString(c17_errCode),
                       (char_T *)"SimGPUErrorChecks",
                       chartInstance->c17_fEmlrtCtx);
  }

  cusolverDestroyWorkspace();
  cusolverEnsureDestruction();
}

static void mdl_setup_runtime_resources_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

static void initSimStructsc17_sliding_controller_rbdl
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance)
{
}

const mxArray *sf_c17_sliding_controller_rbdl_get_eml_resolved_functions_info()
{
  const mxArray *c17_nameCaptureInfo = NULL;
  c17_nameCaptureInfo = NULL;
  sf_mex_assign(&c17_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c17_nameCaptureInfo;
}

static void c17_eML_blk_kernel(SFc17_sliding_controller_rbdlInstanceStruct
  *chartInstance, real_T c17_b_Kp0[7], real_T c17_b_Kn0[7], real_T c17_b_Bp0[7],
  real_T c17_b_Bn0[7], real_T c17_b_beta[2], real_T c17_b_alpha[2], real_T
  c17_b_Tid[7], real_T c17_b_Th[7], real_T c17_b_qd[7], real_T c17_b_K[49],
  real_T c17_b_B[49])
{
  ptrdiff_t c17_jpvt_t[7];
  ptrdiff_t c17_info_t;
  real_T c17_A[7];
  real_T c17_tau;
  real_T c17_tol;
  int32_T c17_b_info_t;
  int32_T c17_rankA;
  boolean_T c17_A_dirtyOnCpu;
  boolean_T c17_A_dirtyOnGpu;
  c17_eML_blk_kernel_kernel1<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>
    (*chartInstance->c17_b_gpu_Kp0);
  cudaMemcpy(*chartInstance->c17_gpu_Kp0, c17_b_Kp0, 56UL,
             cudaMemcpyHostToDevice);
  c17_eML_blk_kernel_kernel2<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_Kp0, *chartInstance->c17_b_gpu_Kp0);
  c17_eML_blk_kernel_kernel3<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>
    (*chartInstance->c17_b_gpu_Kn0);
  cudaMemcpy(*chartInstance->c17_gpu_Kn0, c17_b_Kn0, 56UL,
             cudaMemcpyHostToDevice);
  c17_eML_blk_kernel_kernel4<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_Kn0, *chartInstance->c17_b_gpu_Kn0);
  c17_eML_blk_kernel_kernel5<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>
    (*chartInstance->c17_b_gpu_Bp0);
  cudaMemcpy(*chartInstance->c17_gpu_Bp0, c17_b_Bp0, 56UL,
             cudaMemcpyHostToDevice);
  c17_eML_blk_kernel_kernel6<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_Bp0, *chartInstance->c17_b_gpu_Bp0);
  c17_eML_blk_kernel_kernel7<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>
    (*chartInstance->c17_b_gpu_Bn0);
  cudaMemcpy(*chartInstance->c17_gpu_Tid, c17_b_Tid, 56UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(*chartInstance->c17_gpu_qd, c17_b_qd, 56UL, cudaMemcpyHostToDevice);
  cudaMemcpy(*chartInstance->c17_gpu_Th, c17_b_Th, 56UL, cudaMemcpyHostToDevice);
  cudaMemcpy(*chartInstance->c17_gpu_Bn0, c17_b_Bn0, 56UL,
             cudaMemcpyHostToDevice);
  c17_eML_blk_kernel_kernel8<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_Tid, *chartInstance->c17_gpu_qd,
     *chartInstance->c17_gpu_Th, *chartInstance->c17_gpu_Bn0,
     *chartInstance->c17_gpu_jpvt_t, *chartInstance->c17_gpu_A,
     *chartInstance->c17_b_gpu_x, *chartInstance->c17_gpu_x,
     *chartInstance->c17_b_gpu_Bn0);
  cudaMemcpy(c17_A, *chartInstance->c17_gpu_A, 56UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(c17_jpvt_t, *chartInstance->c17_gpu_jpvt_t, 56UL,
             cudaMemcpyDeviceToHost);
  c17_info_t = LAPACKE_dgeqp3(102, (ptrdiff_t)1, (ptrdiff_t)7, &c17_A[0],
    (ptrdiff_t)1, &c17_jpvt_t[0], &c17_tau);
  c17_A_dirtyOnGpu = false;
  c17_A_dirtyOnCpu = true;
  if ((int32_T)c17_info_t != 0) {
    c17_tau = rtNaN;
    c17_eML_blk_kernel_kernel10<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (*chartInstance->c17_gpu_jpvt, *chartInstance->c17_gpu_A);
    c17_A_dirtyOnCpu = false;
    c17_A_dirtyOnGpu = true;
  } else {
    cudaMemcpy(*chartInstance->c17_gpu_jpvt_t, c17_jpvt_t, 56UL,
               cudaMemcpyHostToDevice);
    c17_eML_blk_kernel_kernel9<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (*chartInstance->c17_gpu_jpvt_t, *chartInstance->c17_gpu_jpvt);
  }

  c17_rankA = 0;
  if (c17_A_dirtyOnGpu) {
    cudaMemcpy(c17_A, *chartInstance->c17_gpu_A, 56UL, cudaMemcpyDeviceToHost);
  }

  c17_tol = 1.5543122344752192E-14 * muDoubleScalarAbs(c17_A[0]);
  if (!(muDoubleScalarAbs(c17_A[0]) <= c17_tol)) {
    c17_rankA = 1;
  }

  c17_eML_blk_kernel_kernel11<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_change);
  c17_eML_blk_kernel_kernel12<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_Th, *chartInstance->c17_b_gpu_B);
  c17_b_info_t = 0;
  if (c17_A_dirtyOnCpu) {
    cudaMemcpy(*chartInstance->c17_gpu_A, c17_A, 56UL, cudaMemcpyHostToDevice);
  }

  cudaMemcpy(chartInstance->c17_gpu_tau, &c17_tau, 8UL, cudaMemcpyHostToDevice);
  cusolverDnDormqr_bufferSize(getCuSolverGlobalHandle(), CUBLAS_SIDE_LEFT,
    CUBLAS_OP_T, 1, 7, 1, (double *)&(*chartInstance->c17_gpu_A)[0], 1, (double *)
    chartInstance->c17_gpu_tau, (double *)&(*chartInstance->c17_b_gpu_B)[0], 1,
    getCuSolverWorkspaceReq());
  setCuSolverWorkspaceTypeSize(8);
  cusolverInitWorkspace();
  cudaMemcpy(chartInstance->c17_gpu_info_t, &c17_b_info_t, 4UL,
             cudaMemcpyHostToDevice);
  cusolverDnDormqr(getCuSolverGlobalHandle(), CUBLAS_SIDE_LEFT, CUBLAS_OP_T, 1,
                   7, 1, (double *)&(*chartInstance->c17_gpu_A)[0], 1, (double *)
                   chartInstance->c17_gpu_tau, (double *)
                   &(*chartInstance->c17_b_gpu_B)[0], 1, (real_T *)
                   getCuSolverWorkspaceBuff(), *getCuSolverWorkspaceReq(),
                   chartInstance->c17_gpu_info_t);
  cudaMemcpy(&c17_b_info_t, chartInstance->c17_gpu_info_t, 4UL,
             cudaMemcpyDeviceToHost);
  if (c17_b_info_t < 0) {
    c17_eML_blk_kernel_kernel13<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (*chartInstance->c17_b_gpu_B);
  }

  c17_eML_blk_kernel_kernel14<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_jpvt, c17_rankA, *chartInstance->c17_gpu_A,
     *chartInstance->c17_b_gpu_B, *chartInstance->c17_gpu_change);
  c17_eML_blk_kernel_kernel15<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_change, *chartInstance->c17_gpu_Y);
  c17_eML_blk_kernel_kernel16<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_Y, *chartInstance->c17_gpu_K,
     *chartInstance->c17_gpu_change);
  c17_eML_blk_kernel_kernel17<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_K);
  c17_eML_blk_kernel_kernel18<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_B);
  cudaMemcpy(*chartInstance->c17_gpu_alpha, c17_b_alpha, 16UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(*chartInstance->c17_gpu_beta, c17_b_beta, 16UL,
             cudaMemcpyHostToDevice);
  c17_eML_blk_kernel_kernel19<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c17_b_gpu_Bn0, *chartInstance->c17_gpu_alpha,
     *chartInstance->c17_b_gpu_Bp0, *chartInstance->c17_b_gpu_Kp0,
     *chartInstance->c17_gpu_change, *chartInstance->c17_gpu_beta,
     *chartInstance->c17_b_gpu_Kn0, *chartInstance->c17_b_gpu_x,
     *chartInstance->c17_gpu_x, *chartInstance->c17_gpu_K,
     *chartInstance->c17_gpu_B);
  cudaMemcpy(c17_b_K, *chartInstance->c17_gpu_K, 392UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(c17_b_B, *chartInstance->c17_gpu_B, 392UL, cudaMemcpyDeviceToHost);
}

static void c17_emlrt_marshallIn(SFc17_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c17_b_B, const char_T *c17_identifier, real_T
  c17_y[49])
{
  emlrtMsgIdentifier c17_thisId;
  c17_thisId.fIdentifier = const_cast<const char_T *>(c17_identifier);
  c17_thisId.fParent = NULL;
  c17_thisId.bParentIsCell = false;
  c17_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c17_b_B), &c17_thisId, c17_y);
  sf_mex_destroy(&c17_b_B);
}

static void c17_b_emlrt_marshallIn(SFc17_sliding_controller_rbdlInstanceStruct
  *chartInstance, const mxArray *c17_u, const emlrtMsgIdentifier *c17_parentId,
  real_T c17_y[49])
{
  real_T c17_dv[49];
  int32_T c17_i;
  sf_mex_import(c17_parentId, sf_mex_dup(c17_u), c17_dv, 1, 0, 0U, 1, 0U, 2, 7,
                7);
  for (c17_i = 0; c17_i < 49; c17_i++) {
    c17_y[c17_i] = c17_dv[c17_i];
  }

  sf_mex_destroy(&c17_u);
}

static uint8_T c17_c_emlrt_marshallIn
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c17_b_is_active_c17_sliding_controller_rbdl, const char_T *c17_identifier)
{
  emlrtMsgIdentifier c17_thisId;
  uint8_T c17_y;
  c17_thisId.fIdentifier = const_cast<const char_T *>(c17_identifier);
  c17_thisId.fParent = NULL;
  c17_thisId.bParentIsCell = false;
  c17_y = c17_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c17_b_is_active_c17_sliding_controller_rbdl), &c17_thisId);
  sf_mex_destroy(&c17_b_is_active_c17_sliding_controller_rbdl);
  return c17_y;
}

static uint8_T c17_d_emlrt_marshallIn
  (SFc17_sliding_controller_rbdlInstanceStruct *chartInstance, const mxArray
   *c17_u, const emlrtMsgIdentifier *c17_parentId)
{
  uint8_T c17_b_u;
  uint8_T c17_y;
  sf_mex_import(c17_parentId, sf_mex_dup(c17_u), &c17_b_u, 1, 3, 0U, 0, 0U, 0);
  c17_y = c17_b_u;
  sf_mex_destroy(&c17_u);
  return c17_y;
}

static __global__ __launch_bounds__(64, 1) void c17_eML_blk_kernel_kernel1
  (real_T c17_b_Kp0[49])
{
  uint64_T c17_threadId;
  int32_T c17_i;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_i = (int32_T)c17_threadId;
  if (c17_i < 49) {
    c17_b_Kp0[c17_i] = 0.0;
  }
}

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel2(const
  real_T c17_b_Kp0[7], real_T c17_c_Kp0[49])
{
  uint64_T c17_threadId;
  int32_T c17_j;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_j = (int32_T)c17_threadId;
  if (c17_j < 7) {
    c17_c_Kp0[c17_j + 7 * c17_j] = c17_b_Kp0[c17_j];
  }
}

static __global__ __launch_bounds__(64, 1) void c17_eML_blk_kernel_kernel3
  (real_T c17_b_Kn0[49])
{
  uint64_T c17_threadId;
  int32_T c17_i1;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_i1 = (int32_T)c17_threadId;
  if (c17_i1 < 49) {
    c17_b_Kn0[c17_i1] = 0.0;
  }
}

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel4(const
  real_T c17_b_Kn0[7], real_T c17_c_Kn0[49])
{
  uint64_T c17_threadId;
  int32_T c17_j;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_j = (int32_T)c17_threadId;
  if (c17_j < 7) {
    c17_c_Kn0[c17_j + 7 * c17_j] = c17_b_Kn0[c17_j];
  }
}

static __global__ __launch_bounds__(64, 1) void c17_eML_blk_kernel_kernel5
  (real_T c17_b_Bp0[49])
{
  uint64_T c17_threadId;
  int32_T c17_i2;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_i2 = (int32_T)c17_threadId;
  if (c17_i2 < 49) {
    c17_b_Bp0[c17_i2] = 0.0;
  }
}

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel6(const
  real_T c17_b_Bp0[7], real_T c17_c_Bp0[49])
{
  uint64_T c17_threadId;
  int32_T c17_j;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_j = (int32_T)c17_threadId;
  if (c17_j < 7) {
    c17_c_Bp0[c17_j + 7 * c17_j] = c17_b_Bp0[c17_j];
  }
}

static __global__ __launch_bounds__(64, 1) void c17_eML_blk_kernel_kernel7
  (real_T c17_b_Bn0[49])
{
  uint64_T c17_threadId;
  int32_T c17_i3;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_i3 = (int32_T)c17_threadId;
  if (c17_i3 < 49) {
    c17_b_Bn0[c17_i3] = 0.0;
  }
}

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel8(const
  real_T c17_b_Tid[7], const real_T c17_b_qd[7], const real_T c17_b_Th[7], const
  real_T c17_b_Bn0[7], ptrdiff_t c17_jpvt_t[7], real_T c17_A[7], real_T c17_x[7],
  real_T c17_b_x[7], real_T c17_c_Bn0[49])
{
  uint64_T c17_threadId;
  int32_T c17_j;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_j = (int32_T)c17_threadId;
  if (c17_j < 7) {
    c17_c_Bn0[c17_j + 7 * c17_j] = c17_b_Bn0[c17_j];
    c17_b_x[c17_j] = c17_b_Th[c17_j];
    c17_b_x[c17_j] = mwGpuSign(c17_b_x[c17_j]);
    c17_x[c17_j] = c17_b_qd[c17_j];
    c17_x[c17_j] = mwGpuSign(c17_x[c17_j]);
    c17_A[c17_j] = c17_b_Tid[c17_j];
    c17_jpvt_t[c17_j] = (ptrdiff_t)0;
  }
}

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel9(const
  ptrdiff_t c17_jpvt_t[7], int32_T c17_jpvt[7])
{
  uint64_T c17_threadId;
  int32_T c17_k;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_k = (int32_T)c17_threadId;
  if (c17_k < 7) {
    c17_jpvt[c17_k] = (int32_T)c17_jpvt_t[c17_k];
  }
}

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel10
  (int32_T c17_jpvt[7], real_T c17_A[7])
{
  uint64_T c17_threadId;
  int32_T c17_j;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_j = (int32_T)c17_threadId;
  if (c17_j < 7) {
    c17_A[c17_j] = CUDART_NAN;
    c17_jpvt[c17_j] = c17_j + 1;
  }
}

static __global__ __launch_bounds__(64, 1) void c17_eML_blk_kernel_kernel11
  (real_T c17_change[49])
{
  uint64_T c17_threadId;
  int32_T c17_i4;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_i4 = (int32_T)c17_threadId;
  if (c17_i4 < 49) {
    c17_change[c17_i4] = 0.0;
  }
}

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel12(
  const real_T c17_b_Th[7], real_T c17_b_B[7])
{
  uint64_T c17_threadId;
  int32_T c17_i5;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_i5 = (int32_T)c17_threadId;
  if (c17_i5 < 7) {
    c17_b_B[c17_i5] = c17_b_Th[c17_i5];
  }
}

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel13
  (real_T c17_b_B[7])
{
  uint64_T c17_threadId;
  int32_T c17_i6;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_i6 = (int32_T)c17_threadId;
  if (c17_i6 < 7) {
    c17_b_B[c17_i6] = CUDART_NAN;
  }
}

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel14(
  const int32_T c17_jpvt[7], const int32_T c17_rankA, real_T c17_A[7], real_T
  c17_b_B[7], real_T c17_change[49])
{
  uint64_T c17_threadId;
  int32_T c17_i;
  int32_T c17_j;
  int32_T c17_k;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_k = (int32_T)c17_threadId;
  if (c17_k < 7) {
    for (c17_i = 0; c17_i < c17_rankA; c17_i++) {
      c17_change[(c17_jpvt[0] + 7 * c17_k) - 1] = c17_b_B[c17_k];
    }

    for (c17_j = 0; c17_j < c17_rankA; c17_j++) {
      c17_change[(c17_jpvt[c17_rankA - 1] + 7 * c17_k) - 1] /= c17_A[(c17_rankA
        + c17_rankA) - 2];
    }
  }
}

static __global__ __launch_bounds__(64, 1) void c17_eML_blk_kernel_kernel15(
  const real_T c17_change[49], real_T c17_Y[49])
{
  uint64_T c17_threadId;
  int32_T c17_i7;
  int32_T c17_i8;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_i8 = (int32_T)(c17_threadId % 7UL);
  c17_i7 = (int32_T)((c17_threadId - (uint64_T)c17_i8) / 7UL);
  if ((c17_i7 < 7) && (c17_i8 < 7)) {
    c17_Y[c17_i8 + 7 * c17_i7] = c17_change[c17_i7 + 7 * c17_i8];
  }
}

static __global__ __launch_bounds__(64, 1) void c17_eML_blk_kernel_kernel16(
  const real_T c17_Y[49], real_T c17_b_K[49], real_T c17_change[49])
{
  uint64_T c17_threadId;
  int32_T c17_k;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_k = (int32_T)c17_threadId;
  if (c17_k < 49) {
    c17_change[c17_k] = fabs(c17_Y[c17_k]);
    c17_b_K[c17_k] = 0.0;
  }
}

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel17
  (real_T c17_b_K[49])
{
  uint64_T c17_threadId;
  int32_T c17_k;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_k = (int32_T)c17_threadId;
  if (c17_k < 7) {
    c17_b_K[c17_k + 7 * c17_k] = 1.0;
  }
}

static __global__ __launch_bounds__(64, 1) void c17_eML_blk_kernel_kernel18
  (real_T c17_b_B[49])
{
  uint64_T c17_threadId;
  int32_T c17_i9;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_i9 = (int32_T)c17_threadId;
  if (c17_i9 < 49) {
    c17_b_B[c17_i9] = 0.0;
  }
}

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel19(
  const real_T c17_b_Bn0[49], const real_T c17_b_alpha[2], const real_T
  c17_b_Bp0[49], const real_T c17_b_Kp0[49], const real_T c17_change[49], const
  real_T c17_b_beta[2], const real_T c17_b_Kn0[49], const real_T c17_x[7], const
  real_T c17_b_x[7], real_T c17_b_K[49], real_T c17_b_B[49])
{
  uint64_T c17_threadId;
  int32_T c17_ii;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_ii = (int32_T)c17_threadId;
  if (c17_ii < 7) {
    c17_b_B[c17_ii + 7 * c17_ii] = 1.0;
    if (c17_b_x[c17_ii] == c17_x[c17_ii]) {
      c17_b_K[c17_ii + 7 * c17_ii] = c17_b_Kp0[c17_ii + 7 * c17_ii] +
        c17_b_beta[0] * c17_change[c17_ii];
      c17_b_B[c17_ii + 7 * c17_ii] = c17_b_Bp0[c17_ii + 7 * c17_ii] +
        c17_b_alpha[0] * c17_change[c17_ii];
    } else {
      c17_b_K[c17_ii + 7 * c17_ii] = c17_b_Kn0[c17_ii + 7 * c17_ii] -
        c17_b_beta[1] * c17_change[c17_ii];
      c17_b_B[c17_ii + 7 * c17_ii] = c17_b_Bn0[c17_ii + 7 * c17_ii] -
        c17_b_alpha[1] * c17_change[c17_ii];
    }
  }
}

static void init_dsm_address_info(SFc17_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc17_sliding_controller_rbdlInstanceStruct
  *chartInstance)
{
  chartInstance->c17_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c17_Kp0 = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c17_Kn0 = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 1);
  chartInstance->c17_Bp0 = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 2);
  chartInstance->c17_Bn0 = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 3);
  chartInstance->c17_beta = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 4);
  chartInstance->c17_alpha = (real_T (*)[2])ssGetInputPortSignal_wrapper
    (chartInstance->S, 5);
  chartInstance->c17_Tid = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 6);
  chartInstance->c17_K = (real_T (*)[49])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
  chartInstance->c17_Th = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 7);
  chartInstance->c17_qd = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 8);
  chartInstance->c17_B = (real_T (*)[49])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 2);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c17_sliding_controller_rbdl_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(184866213U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(3943974275U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(1621223579U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3836141733U);
}

mxArray *sf_c17_sliding_controller_rbdl_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,1);
  mxSetCell(mxcell3p, 0, mxCreateString("coder.internal.lapack.LAPACKApi"));
  return(mxcell3p);
}

mxArray *sf_c17_sliding_controller_rbdl_jit_fallback_info(void)
{
  const char *infoFields[] = { "fallbackType", "fallbackReason",
    "hiddenFallbackType", "hiddenFallbackReason", "incompatibleSymbol" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 5, infoFields);
  mxArray *fallbackType = mxCreateString("pre");
  mxArray *fallbackReason = mxCreateString("GPUAcceleration");
  mxArray *hiddenFallbackType = mxCreateString("late");
  mxArray *hiddenFallbackReason = mxCreateString("ir_function_calls");
  mxArray *incompatibleSymbol = mxCreateString("__gpu_kernel");
  mxSetField(mxInfo, 0, infoFields[0], fallbackType);
  mxSetField(mxInfo, 0, infoFields[1], fallbackReason);
  mxSetField(mxInfo, 0, infoFields[2], hiddenFallbackType);
  mxSetField(mxInfo, 0, infoFields[3], hiddenFallbackReason);
  mxSetField(mxInfo, 0, infoFields[4], incompatibleSymbol);
  return mxInfo;
}

mxArray *sf_c17_sliding_controller_rbdl_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c17_sliding_controller_rbdl(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPiA+wMTAwAakOYCYiQECWKF8RiBmhtIQcRa4uAIQl1QWpILEi4uSPVOAdF5iLpi"
    "fWFrhmZeWDzbfggFhPhsW8xmRzOeEikPAB3vK9Cs5gPQbIOlnIaBfAMhygoYLLHwGzv0iZLnfm2"
    "ruV3CgTD/E/ggC7ldFcT+En1kcn5hcklmWGp9saB5fnJOZkpmXHp+cn1dSlJ+Tk1oUX5SUkoPkT"
    "wAKJCGO"
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c17_sliding_controller_rbdl_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sZ5qVxZToNvS2ZkiuiWRnEB";
}

static void sf_opaque_initialize_c17_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  initialize_params_c17_sliding_controller_rbdl
    ((SFc17_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
  initialize_c17_sliding_controller_rbdl
    ((SFc17_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c17_sliding_controller_rbdl(void *chartInstanceVar)
{
  enable_c17_sliding_controller_rbdl
    ((SFc17_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c17_sliding_controller_rbdl(void *chartInstanceVar)
{
  disable_c17_sliding_controller_rbdl
    ((SFc17_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c17_sliding_controller_rbdl(void *chartInstanceVar)
{
  sf_gateway_c17_sliding_controller_rbdl
    ((SFc17_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c17_sliding_controller_rbdl
  (SimStruct* S)
{
  return get_sim_state_c17_sliding_controller_rbdl
    ((SFc17_sliding_controller_rbdlInstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c17_sliding_controller_rbdl(SimStruct* S,
  const mxArray *st)
{
  set_sim_state_c17_sliding_controller_rbdl
    ((SFc17_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S),
     st);
}

static void sf_opaque_cleanup_runtime_resources_c17_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc17_sliding_controller_rbdlInstanceStruct*)
                    chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller_rbdl_optimization_info();
    }

    mdl_cleanup_runtime_resources_c17_sliding_controller_rbdl
      ((SFc17_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
    ((SFc17_sliding_controller_rbdlInstanceStruct*) chartInstanceVar)->
      ~SFc17_sliding_controller_rbdlInstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c17_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_start_c17_sliding_controller_rbdl
    ((SFc17_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c17_sliding_controller_rbdl(void
  *chartInstanceVar)
{
  mdl_terminate_c17_sliding_controller_rbdl
    ((SFc17_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc17_sliding_controller_rbdl
    ((SFc17_sliding_controller_rbdlInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c17_sliding_controller_rbdl(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c17_sliding_controller_rbdl
      ((SFc17_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc17_sliding_controller_rbdl
      ((SFc17_sliding_controller_rbdlInstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c17_sliding_controller_rbdl_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [19] = {
    "eNrtV8tu20YUpRQ3iIEmENoA3RRoUCBIlm3QoF0ljl4oUTs2QtkpvBHGwytxoOEMMw/a/od200U",
    "/oP2JLvsZ/Yds8gm5Q1KyQpFUbDVpWpQATQ157plzH3Nn7LX8PQ+vW3h3PvW86/i8gXfby6+Pin",
    "Fr6c7fb3n3ivHPaCRsfEAUibXXeAkSwzPQklvDpPDFRFbCmJiAAkERm0hl6tg0iy1nYja0gjo+/",
    "TxiNAoiaXnYRVsS7gt+jmyJNQfI02cKqBkChCZS0k6jISfThWJlTnsR0Jm2cZMLGkxgEydL71lu",
    "WMJhcAbUF9oQVKwvtAWGGOiZs1o3nac6mANlnHBGRKW3EdEBJBhgA4dJiH/3rUGnyjAaEWW6EJE",
    "U9C6bZZxSQJmTafxwwgQxUjHCBzHvOcNVbQcc9ezJEHhDQFBbVwGZJZIJU5//YIieDgQ54dCHEz",
    "utZwvghXXJP2JwCqo2bpOeTEGRKeyL2kmzgAzOsmwtqmQVZlgMR0Q9oZg/DWFt9WLl6IBgnmCEF",
    "nUwyJz09UixFMNby2Zj31XmuiVj4zzZeh0sYxuk0JSFBduQih7hXNfCRjLZhRR4xtonhjTDctZq",
    "nNYsHEkMsCvv+tVgBcPEF7CeFCGrTFdaAmR95yk2ljeR1Goj4x4Wb393d/XzKswXBtSEUKjqAoo",
    "wDRizLLz1bCHTLvcIRFUmk1cFzitkHcrTEyv6p1LNMCYNTeTCBZfRWmCsp5hLXAmHGhdNE8zlch",
    "2OEhpB6BoM47CHywaxFTHRrrU9wXWXMnPeB00VSyqyanHVYRsauII6T+BQzIQ8FUMl46Do8Xl4A",
    "bDaiBJMTLvYv9T5EGevSoXbz77yLvazj99iP5vblZ/3l3haFTze0tPhd5bw2+038duledvzd/Or",
    "hudmad6tEo/DdfD+45OHv91oP/B//f0n/5tfXtJyHMp6Wit6WtlvZ5dcu9x54FYx/nzeeBcLKV2",
    "pX4f9fknXVgX/Z0v8nWKsjx++ODo7HsmnafDgeMYse/5MDLoZ35/tZr3XSnrn7++4HQCrLqtXRf",
    "2wOKi4MbH59u34v1vSe31NPLaL9/n16vFm9l/ulPO4tca+g7+6pTr+5/TfvpL+H/42/Xd2NrPP5",
    "/9xjf67pXq9m51TxsR1PxjTr78da85CbF1jKoVRknNQY3US8pKfV12vl7Xz3rPdv0Xn/3bvPu9v",
    "sx9vX9GuveH+/77sNvXvsueSDw3ftB94JXznA/Zj0/Piu8b/5V3uHPdFMX60+NetFzEeVpzii89",
    "4JJ9Uff0P1OlrU3q3Bw==",
    ""
  };

  static char newstr [1297] = "";
  newstr[0] = '\0';
  for (i = 0; i < 19; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c17_sliding_controller_rbdl(SimStruct *S)
{
  const char* newstr = sf_c17_sliding_controller_rbdl_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(2721387192U));
  ssSetChecksum1(S,(1228014088U));
  ssSetChecksum2(S,(1233953686U));
  ssSetChecksum3(S,(1676382772U));
}

static void mdlRTW_c17_sliding_controller_rbdl(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c17_sliding_controller_rbdl(SimStruct *S)
{
  SFc17_sliding_controller_rbdlInstanceStruct *chartInstance;
  chartInstance = (SFc17_sliding_controller_rbdlInstanceStruct *)utMalloc(sizeof
    (SFc17_sliding_controller_rbdlInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc17_sliding_controller_rbdlInstanceStruct));
  chartInstance = new (chartInstance)
    SFc17_sliding_controller_rbdlInstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c17_sliding_controller_rbdl;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c17_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c17_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c17_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c17_sliding_controller_rbdl;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c17_sliding_controller_rbdl;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c17_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c17_sliding_controller_rbdl;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c17_sliding_controller_rbdl;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c17_sliding_controller_rbdl;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c17_sliding_controller_rbdl;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c17_sliding_controller_rbdl;
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
    chartInstance->c17_JITStateAnimation,
    chartInstance->c17_JITTransitionAnimation);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  mdl_setup_runtime_resources_c17_sliding_controller_rbdl(chartInstance);
}

void c17_sliding_controller_rbdl_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c17_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c17_sliding_controller_rbdl(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c17_sliding_controller_rbdl(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c17_sliding_controller_rbdl_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
