/* Include files */

#include "sliding_controller2_sfun.h"
#include "c17_sliding_controller2.h"
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
static void initialize_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance);
static void initialize_params_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance);
static void enable_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance);
static void disable_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance);
static void c17_do_animation_call_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance);
static void ext_mode_exec_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance);
static const mxArray *get_sim_state_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance);
static void set_sim_state_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance, const mxArray *c17_st);
static void sf_gateway_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance);
static void mdl_start_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance);
static void mdl_terminate_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance);
static void mdl_setup_runtime_resources_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance);
static void mdl_cleanup_runtime_resources_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance);
static void initSimStructsc17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance);
static void c17_eML_blk_kernel(SFc17_sliding_controller2InstanceStruct
  *chartInstance, real_T c17_b_Tid[7], real_T c17_b_Th[7], real_T c17_b_qd[7],
  real_T c17_b_K[49], real_T c17_b_B[49]);
static void c17_emlrt_marshallIn(SFc17_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c17_b_B, const char_T *c17_identifier, real_T
  c17_y[49]);
static void c17_b_emlrt_marshallIn(SFc17_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c17_u, const emlrtMsgIdentifier *c17_parentId,
  real_T c17_y[49]);
static uint8_T c17_c_emlrt_marshallIn(SFc17_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c17_b_is_active_c17_sliding_controller2, const
  char_T *c17_identifier);
static uint8_T c17_d_emlrt_marshallIn(SFc17_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c17_u, const emlrtMsgIdentifier *c17_parentId);
static __global__ void c17_eML_blk_kernel_kernel1(const real_T c17_b_Tid[7],
  const real_T c17_b_qd[7], const real_T c17_b_Th[7], ptrdiff_t c17_jpvt_t[7],
  real_T c17_A[7], real_T c17_x[7], real_T c17_b_x[7]);
static __global__ void c17_eML_blk_kernel_kernel2(const ptrdiff_t c17_jpvt_t[7],
  int32_T c17_jpvt[7]);
static __global__ void c17_eML_blk_kernel_kernel3(int32_T c17_jpvt[7], real_T
  c17_A[7]);
static __global__ void c17_eML_blk_kernel_kernel4(real_T c17_change[49]);
static __global__ void c17_eML_blk_kernel_kernel5(const real_T c17_b_Th[7],
  real_T c17_b_B[7]);
static __global__ void c17_eML_blk_kernel_kernel6(real_T c17_b_B[7]);
static __global__ void c17_eML_blk_kernel_kernel7(const int32_T c17_jpvt[7],
  const int32_T c17_rankA, real_T c17_A[7], real_T c17_b_B[7], real_T
  c17_change[49]);
static __global__ void c17_eML_blk_kernel_kernel8(const real_T c17_change[49],
  real_T c17_Y[49]);
static __global__ void c17_eML_blk_kernel_kernel9(const real_T c17_Y[49], real_T
  c17_b_K[49], real_T c17_change[49]);
static __global__ void c17_eML_blk_kernel_kernel10(real_T c17_b_K[49]);
static __global__ void c17_eML_blk_kernel_kernel11(real_T c17_b_B[49]);
static __global__ void c17_eML_blk_kernel_kernel12(const int8_T c17_Kp0[49],
  const real_T c17_change[49], const int8_T c17_Kn0[49], const real_T c17_x[7],
  const real_T c17_b_x[7], real_T c17_b_K[49], real_T c17_b_B[49]);
static void init_dsm_address_info(SFc17_sliding_controller2InstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc17_sliding_controller2InstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance)
{
  emlrtLicenseCheckR2012b(chartInstance->c17_fEmlrtCtx, (const char_T *)
    "distrib_computing_toolbox", 2);
  sim_mode_is_external(chartInstance->S);
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c17_is_active_c17_sliding_controller2 = 0U;
  cusolverEnsureInitialization();
  cudaGetLastError();
  cudaMalloc(&chartInstance->c17_gpu_Kn0, 49UL);
  cudaMalloc(&chartInstance->c17_gpu_Kp0, 49UL);
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
  cudaMalloc(&chartInstance->c17_gpu_Th, 56UL);
  cudaMalloc(&chartInstance->c17_gpu_qd, 56UL);
  cudaMalloc(&chartInstance->c17_gpu_Tid, 56UL);
}

static void initialize_params_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance)
{
}

static void enable_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c17_do_animation_call_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance)
{
  sfDoAnimationWrapper(chartInstance->S, false, true);
  sfDoAnimationWrapper(chartInstance->S, false, false);
}

static void ext_mode_exec_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance)
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
    &chartInstance->c17_is_active_c17_sliding_controller2, 3, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c17_y, 2, c17_d_y);
  sf_mex_assign(&c17_st, c17_y, false);
  return c17_st;
}

static void set_sim_state_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance, const mxArray *c17_st)
{
  const mxArray *c17_u;
  c17_u = sf_mex_dup(c17_st);
  c17_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c17_u, 0)), "B",
                       *chartInstance->c17_B);
  c17_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c17_u, 1)), "K",
                       *chartInstance->c17_K);
  chartInstance->c17_is_active_c17_sliding_controller2 = c17_c_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c17_u, 2)),
     "is_active_c17_sliding_controller2");
  sf_mex_destroy(&c17_u);
  sf_mex_destroy(&c17_st);
}

static void sf_gateway_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance)
{
  real_T c17_dv3[49];
  real_T c17_dv4[49];
  real_T c17_dv[7];
  real_T c17_dv1[7];
  real_T c17_dv2[7];
  int32_T c17_i;
  int32_T c17_i1;
  int32_T c17_i2;
  int32_T c17_i3;
  int32_T c17_i4;
  chartInstance->c17_JITTransitionAnimation[0] = 0U;
  _sfTime_ = sf_get_time(chartInstance->S);
  for (c17_i = 0; c17_i < 7; c17_i++) {
    c17_dv[c17_i] = (*chartInstance->c17_Tid)[c17_i];
  }

  for (c17_i1 = 0; c17_i1 < 7; c17_i1++) {
    c17_dv1[c17_i1] = (*chartInstance->c17_Th)[c17_i1];
  }

  for (c17_i2 = 0; c17_i2 < 7; c17_i2++) {
    c17_dv2[c17_i2] = (*chartInstance->c17_qd)[c17_i2];
  }

  c17_eML_blk_kernel(chartInstance, c17_dv, c17_dv1, c17_dv2, c17_dv3, c17_dv4);
  for (c17_i3 = 0; c17_i3 < 49; c17_i3++) {
    (*chartInstance->c17_B)[c17_i3] = c17_dv4[c17_i3];
  }

  for (c17_i4 = 0; c17_i4 < 49; c17_i4++) {
    (*chartInstance->c17_K)[c17_i4] = c17_dv3[c17_i4];
  }

  c17_do_animation_call_c17_sliding_controller2(chartInstance);
}

static void mdl_start_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance)
{
}

static void mdl_terminate_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance)
{
  cudaError_t c17_errCode;
  cudaFree(*chartInstance->c17_gpu_Kn0);
  cudaFree(*chartInstance->c17_gpu_Kp0);
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
  cudaFree(*chartInstance->c17_gpu_Th);
  cudaFree(*chartInstance->c17_gpu_qd);
  cudaFree(*chartInstance->c17_gpu_Tid);
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

static void mdl_setup_runtime_resources_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance)
{
  setLegacyDebuggerFlag(chartInstance->S, false);
  setDebuggerFlag(chartInstance->S, false);
  sim_mode_is_external(chartInstance->S);
}

static void mdl_cleanup_runtime_resources_c17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance)
{
}

static void initSimStructsc17_sliding_controller2
  (SFc17_sliding_controller2InstanceStruct *chartInstance)
{
}

const mxArray *sf_c17_sliding_controller2_get_eml_resolved_functions_info()
{
  const mxArray *c17_nameCaptureInfo = NULL;
  c17_nameCaptureInfo = NULL;
  sf_mex_assign(&c17_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c17_nameCaptureInfo;
}

static void c17_eML_blk_kernel(SFc17_sliding_controller2InstanceStruct
  *chartInstance, real_T c17_b_Tid[7], real_T c17_b_Th[7], real_T c17_b_qd[7],
  real_T c17_b_K[49], real_T c17_b_B[49])
{
  static int8_T c17_Kn0[49] = { 50, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0,
    50, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0,
    50, 0, 0, 0, 0, 0, 0, 0, 50 };

  static int8_T c17_Kp0[49] = { 75, 0, 0, 0, 0, 0, 0, 0, 75, 0, 0, 0, 0, 0, 0, 0,
    75, 0, 0, 0, 0, 0, 0, 0, 75, 0, 0, 0, 0, 0, 0, 0, 75, 0, 0, 0, 0, 0, 0, 0,
    75, 0, 0, 0, 0, 0, 0, 0, 75 };

  ptrdiff_t c17_jpvt_t[7];
  ptrdiff_t c17_info_t;
  real_T c17_A[7];
  real_T c17_tau;
  real_T c17_tol;
  int32_T c17_b_info_t;
  int32_T c17_rankA;
  boolean_T c17_A_dirtyOnCpu;
  boolean_T c17_A_dirtyOnGpu;
  cudaMemcpy(*chartInstance->c17_gpu_Tid, c17_b_Tid, 56UL,
             cudaMemcpyHostToDevice);
  cudaMemcpy(*chartInstance->c17_gpu_qd, c17_b_qd, 56UL, cudaMemcpyHostToDevice);
  cudaMemcpy(*chartInstance->c17_gpu_Th, c17_b_Th, 56UL, cudaMemcpyHostToDevice);
  c17_eML_blk_kernel_kernel1<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_Tid, *chartInstance->c17_gpu_qd,
     *chartInstance->c17_gpu_Th, *chartInstance->c17_gpu_jpvt_t,
     *chartInstance->c17_gpu_A, *chartInstance->c17_b_gpu_x,
     *chartInstance->c17_gpu_x);
  cudaMemcpy(c17_A, *chartInstance->c17_gpu_A, 56UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(c17_jpvt_t, *chartInstance->c17_gpu_jpvt_t, 56UL,
             cudaMemcpyDeviceToHost);
  c17_info_t = LAPACKE_dgeqp3(102, (ptrdiff_t)1, (ptrdiff_t)7, &c17_A[0],
    (ptrdiff_t)1, &c17_jpvt_t[0], &c17_tau);
  c17_A_dirtyOnGpu = false;
  c17_A_dirtyOnCpu = true;
  if ((int32_T)c17_info_t != 0) {
    c17_tau = rtNaN;
    c17_eML_blk_kernel_kernel3<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (*chartInstance->c17_gpu_jpvt, *chartInstance->c17_gpu_A);
    c17_A_dirtyOnCpu = false;
    c17_A_dirtyOnGpu = true;
  } else {
    cudaMemcpy(*chartInstance->c17_gpu_jpvt_t, c17_jpvt_t, 56UL,
               cudaMemcpyHostToDevice);
    c17_eML_blk_kernel_kernel2<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
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

  c17_eML_blk_kernel_kernel4<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_change);
  c17_eML_blk_kernel_kernel5<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
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
    c17_eML_blk_kernel_kernel6<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
      (*chartInstance->c17_b_gpu_B);
  }

  c17_eML_blk_kernel_kernel7<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_jpvt, c17_rankA, *chartInstance->c17_gpu_A,
     *chartInstance->c17_b_gpu_B, *chartInstance->c17_gpu_change);
  c17_eML_blk_kernel_kernel8<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_change, *chartInstance->c17_gpu_Y);
  c17_eML_blk_kernel_kernel9<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_Y, *chartInstance->c17_gpu_K,
     *chartInstance->c17_gpu_change);
  c17_eML_blk_kernel_kernel10<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_K);
  c17_eML_blk_kernel_kernel11<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_B);
  cudaMemcpy(*chartInstance->c17_gpu_Kp0, c17_Kp0, 49UL, cudaMemcpyHostToDevice);
  cudaMemcpy(*chartInstance->c17_gpu_Kn0, c17_Kn0, 49UL, cudaMemcpyHostToDevice);
  c17_eML_blk_kernel_kernel12<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>
    (*chartInstance->c17_gpu_Kp0, *chartInstance->c17_gpu_change,
     *chartInstance->c17_gpu_Kn0, *chartInstance->c17_b_gpu_x,
     *chartInstance->c17_gpu_x, *chartInstance->c17_gpu_K,
     *chartInstance->c17_gpu_B);
  cudaMemcpy(c17_b_K, *chartInstance->c17_gpu_K, 392UL, cudaMemcpyDeviceToHost);
  cudaMemcpy(c17_b_B, *chartInstance->c17_gpu_B, 392UL, cudaMemcpyDeviceToHost);
}

static void c17_emlrt_marshallIn(SFc17_sliding_controller2InstanceStruct
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

static void c17_b_emlrt_marshallIn(SFc17_sliding_controller2InstanceStruct
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

static uint8_T c17_c_emlrt_marshallIn(SFc17_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c17_b_is_active_c17_sliding_controller2, const
  char_T *c17_identifier)
{
  emlrtMsgIdentifier c17_thisId;
  uint8_T c17_y;
  c17_thisId.fIdentifier = const_cast<const char_T *>(c17_identifier);
  c17_thisId.fParent = NULL;
  c17_thisId.bParentIsCell = false;
  c17_y = c17_d_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c17_b_is_active_c17_sliding_controller2), &c17_thisId);
  sf_mex_destroy(&c17_b_is_active_c17_sliding_controller2);
  return c17_y;
}

static uint8_T c17_d_emlrt_marshallIn(SFc17_sliding_controller2InstanceStruct
  *chartInstance, const mxArray *c17_u, const emlrtMsgIdentifier *c17_parentId)
{
  uint8_T c17_b_u;
  uint8_T c17_y;
  sf_mex_import(c17_parentId, sf_mex_dup(c17_u), &c17_b_u, 1, 3, 0U, 0, 0U, 0);
  c17_y = c17_b_u;
  sf_mex_destroy(&c17_u);
  return c17_y;
}

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel1(const
  real_T c17_b_Tid[7], const real_T c17_b_qd[7], const real_T c17_b_Th[7],
  ptrdiff_t c17_jpvt_t[7], real_T c17_A[7], real_T c17_x[7], real_T c17_b_x[7])
{
  uint64_T c17_threadId;
  int32_T c17_k;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_k = (int32_T)c17_threadId;
  if (c17_k < 7) {
    c17_b_x[c17_k] = c17_b_Th[c17_k];
    c17_b_x[c17_k] = mwGpuSign(c17_b_x[c17_k]);
    c17_x[c17_k] = c17_b_qd[c17_k];
    c17_x[c17_k] = mwGpuSign(c17_x[c17_k]);
    c17_A[c17_k] = c17_b_Tid[c17_k];
    c17_jpvt_t[c17_k] = (ptrdiff_t)0;
  }
}

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel2(const
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

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel3
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

static __global__ __launch_bounds__(64, 1) void c17_eML_blk_kernel_kernel4
  (real_T c17_change[49])
{
  uint64_T c17_threadId;
  int32_T c17_i;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_i = (int32_T)c17_threadId;
  if (c17_i < 49) {
    c17_change[c17_i] = 0.0;
  }
}

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel5(const
  real_T c17_b_Th[7], real_T c17_b_B[7])
{
  uint64_T c17_threadId;
  int32_T c17_i1;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_i1 = (int32_T)c17_threadId;
  if (c17_i1 < 7) {
    c17_b_B[c17_i1] = c17_b_Th[c17_i1];
  }
}

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel6
  (real_T c17_b_B[7])
{
  uint64_T c17_threadId;
  int32_T c17_i2;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_i2 = (int32_T)c17_threadId;
  if (c17_i2 < 7) {
    c17_b_B[c17_i2] = CUDART_NAN;
  }
}

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel7(const
  int32_T c17_jpvt[7], const int32_T c17_rankA, real_T c17_A[7], real_T c17_b_B
  [7], real_T c17_change[49])
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

static __global__ __launch_bounds__(64, 1) void c17_eML_blk_kernel_kernel8(const
  real_T c17_change[49], real_T c17_Y[49])
{
  uint64_T c17_threadId;
  int32_T c17_i3;
  int32_T c17_i4;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_i4 = (int32_T)(c17_threadId % 7UL);
  c17_i3 = (int32_T)((c17_threadId - (uint64_T)c17_i4) / 7UL);
  if ((c17_i3 < 7) && (c17_i4 < 7)) {
    c17_Y[c17_i4 + 7 * c17_i3] = c17_change[c17_i3 + 7 * c17_i4];
  }
}

static __global__ __launch_bounds__(64, 1) void c17_eML_blk_kernel_kernel9(const
  real_T c17_Y[49], real_T c17_b_K[49], real_T c17_change[49])
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

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel10
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

static __global__ __launch_bounds__(64, 1) void c17_eML_blk_kernel_kernel11
  (real_T c17_b_B[49])
{
  uint64_T c17_threadId;
  int32_T c17_i5;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_i5 = (int32_T)c17_threadId;
  if (c17_i5 < 49) {
    c17_b_B[c17_i5] = 0.0;
  }
}

static __global__ __launch_bounds__(32, 1) void c17_eML_blk_kernel_kernel12(
  const int8_T c17_Kp0[49], const real_T c17_change[49], const int8_T c17_Kn0[49],
  const real_T c17_x[7], const real_T c17_b_x[7], real_T c17_b_K[49], real_T
  c17_b_B[49])
{
  uint64_T c17_threadId;
  int32_T c17_ii;
  c17_threadId = (uint64_T)mwGetGlobalThreadIndexInXDimension();
  c17_ii = (int32_T)c17_threadId;
  if (c17_ii < 7) {
    c17_b_B[c17_ii + 7 * c17_ii] = 1.0;
    if (c17_b_x[c17_ii] == c17_x[c17_ii]) {
      c17_b_K[c17_ii + 7 * c17_ii] = (real_T)c17_Kp0[c17_ii + 7 * c17_ii] + 3.0 *
        c17_change[c17_ii];
      c17_b_B[c17_ii + 7 * c17_ii] = (real_T)c17_Kn0[c17_ii + 7 * c17_ii] + 0.5 *
        c17_change[c17_ii];
    } else {
      c17_b_K[c17_ii + 7 * c17_ii] = (real_T)c17_Kn0[c17_ii + 7 * c17_ii] - 3.0 *
        c17_change[c17_ii];
      c17_b_B[c17_ii + 7 * c17_ii] = (real_T)c17_Kn0[c17_ii + 7 * c17_ii] - 0.5 *
        c17_change[c17_ii];
    }
  }
}

static void init_dsm_address_info(SFc17_sliding_controller2InstanceStruct
  *chartInstance)
{
}

static void init_simulink_io_address(SFc17_sliding_controller2InstanceStruct
  *chartInstance)
{
  chartInstance->c17_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c17_Tid = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c17_K = (real_T (*)[49])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
  chartInstance->c17_Th = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 1);
  chartInstance->c17_qd = (real_T (*)[7])ssGetInputPortSignal_wrapper
    (chartInstance->S, 2);
  chartInstance->c17_B = (real_T (*)[49])ssGetOutputPortSignal_wrapper
    (chartInstance->S, 2);
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* SFunction Glue Code */
void sf_c17_sliding_controller2_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1104077548U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(657016577U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2266812003U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(1878717813U);
}

mxArray *sf_c17_sliding_controller2_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,1);
  mxSetCell(mxcell3p, 0, mxCreateString("coder.internal.lapack.LAPACKApi"));
  return(mxcell3p);
}

mxArray *sf_c17_sliding_controller2_jit_fallback_info(void)
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

mxArray *sf_c17_sliding_controller2_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c17_sliding_controller2(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  mxArray *mxVarInfo = sf_mex_decode(
    "eNpjYPT0ZQACPiA+wMTAwAakOYCYiQECWKF8RiBmhtIQcRa4uAIQl1QWpILEi4uSPVOAdF5iLpi"
    "fWFrhmZeWDzbfggFhPhsW8xmRzOeEikPAB3vK9Cs5gPQbIOlnIaBfAMhygoYLLHwGzv0iZLnfm2"
    "ruV3CgTD/E/ggC7ldEcT+En1kcn5hcklmWGp9saB5fnJOZkpmXHp+cn1dSlJ+Tk1pkhGQ+CAAA7"
    "zcftQ=="
    );
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c17_sliding_controller2_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static const char* sf_get_instance_specialization(void)
{
  return "sQrNOskEAq2IwyZVoPCM93G";
}

static void sf_opaque_initialize_c17_sliding_controller2(void *chartInstanceVar)
{
  initialize_params_c17_sliding_controller2
    ((SFc17_sliding_controller2InstanceStruct*) chartInstanceVar);
  initialize_c17_sliding_controller2((SFc17_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c17_sliding_controller2(void *chartInstanceVar)
{
  enable_c17_sliding_controller2((SFc17_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c17_sliding_controller2(void *chartInstanceVar)
{
  disable_c17_sliding_controller2((SFc17_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c17_sliding_controller2(void *chartInstanceVar)
{
  sf_gateway_c17_sliding_controller2((SFc17_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c17_sliding_controller2(SimStruct*
  S)
{
  return get_sim_state_c17_sliding_controller2
    ((SFc17_sliding_controller2InstanceStruct *)sf_get_chart_instance_ptr(S));/* raw sim ctx */
}

static void sf_opaque_set_sim_state_c17_sliding_controller2(SimStruct* S, const
  mxArray *st)
{
  set_sim_state_c17_sliding_controller2((SFc17_sliding_controller2InstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_cleanup_runtime_resources_c17_sliding_controller2(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc17_sliding_controller2InstanceStruct*) chartInstanceVar
      )->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_sliding_controller2_optimization_info();
    }

    mdl_cleanup_runtime_resources_c17_sliding_controller2
      ((SFc17_sliding_controller2InstanceStruct*) chartInstanceVar);
    ((SFc17_sliding_controller2InstanceStruct*) chartInstanceVar)->
      ~SFc17_sliding_controller2InstanceStruct();
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_mdl_start_c17_sliding_controller2(void *chartInstanceVar)
{
  mdl_start_c17_sliding_controller2((SFc17_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_mdl_terminate_c17_sliding_controller2(void
  *chartInstanceVar)
{
  mdl_terminate_c17_sliding_controller2((SFc17_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc17_sliding_controller2((SFc17_sliding_controller2InstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c17_sliding_controller2(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  sf_warn_if_symbolic_dimension_param_changed(S);
  if (sf_machine_global_initializer_called()) {
    initialize_params_c17_sliding_controller2
      ((SFc17_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
    initSimStructsc17_sliding_controller2
      ((SFc17_sliding_controller2InstanceStruct*)sf_get_chart_instance_ptr(S));
  }
}

const char* sf_c17_sliding_controller2_get_post_codegen_info(void)
{
  int i;
  const char* encStrCodegen [19] = {
    "eNrtV01u20YUpmQ3aIA2MJAA2RSI0027TNNFkk1ii5JSoVbslLbbZGOMh0/iQMMZZn4k6xAFuu4",
    "JuijQAxQouukdCnTTI+QIeUPSskKRVGzltygBihzO9755/zPyGr2+h9cV93PV8y7h42O8m152fZ",
    "SPG3N39n3d+yIf/4hCwsZ7RJFYe7WXIDF8B1pya5gUPTGQpTAmBqBAUMQmUpkqNs1iy5kYda2gj",
    "k9/HzEaBZG0PGyhLAl3BZ8iW2LNHvK0mQJqugChiZS0w6jLyXCmsTITPwI60jauM0GDCWzi1NJ9",
    "yw1LOHROgPaENgQ11me6BYYY8M1JpZnOUh2cAmWccEZEqbUR0QEk6GADB0mIv7vWoFFFGI2IMi2",
    "IyBj0DhulnFJAkZNpnDhmghipGOGdmPtOcFG3PY769GUIvMYhqFtLARklkglTHf+gi5Z2BDnm0I",
    "ZjO6xmC+CZdcE/ZDABVem3gS/HoMgQdkXloqlDOidptGZZsggzLIZDorYpxk9DWJm9mDk6IBgn2",
    "EeJKhikRvb0vmJjdG8lm417LjOXlYyNs2DrZbCUrTOGuijM2LpU+IRzXQnbl8kOjIGnrG1iSD0s",
    "Yy3Hac3CfYkOduldXQ1WMAx8DvOlCFlpuMYFQNp3HmFjeRlJrTYy9jF52zs7i9OLsJ4woAaEQlk",
    "XUIRpQJ+l7q1mC5l2sUcgamVS9crAWYYsQ3l6YEV7ItUIfVLTRM5McBGtBMZ6iLHESjjQWDR1MB",
    "fLZThKaAShazCMQx/LBrElPtGutW1j3Y2ZmbZBU8WSkqharDpsQx2XUNMEDsRIyInoKhkHeY/P3",
    "AuA2UaUYGLYwv6lpl1cvSwUbj+75Z3tZ5+8wn422wcLzy/neBolPN7cs7ju5ebL+LXCuk380mg0",
    "UrmtOblPC+usF+QcbgPvzb/++eMn/e+vd37/rfsz++XJsvUbC+s30ncnl6ydb/+/ko8/O220s8I",
    "ZL+Srw34zp9d6Cf/1Of6NfKwfq0e7etTZfna7N5k+PZR7fv/e1w9Tvj+b9fquFfQ9/b7pOj5mWZ",
    "qfivbC/GDixsRm27Xjvzun76Ul/ricf8+u5w9Wk/98qxjH9SXyG/jWKuTtu9P/2oX0//a16b+5t",
    "Zp8tv4PS/S/WcjXm+m55Ii4bgdH9Ks7R5qzEFvVEZXCKMk5qNsl/eWi9XpeOe8ty30oev4v9+bj",
    "/ir779oF5Zor7vdvS25V+857Dnnf8HX7gVfAb7zHdqx6PnzT+L+9853jbuTj+7O/an7EeFhyas+",
    "n8Qg+KJv9D+TpC59btxQ=",
    ""
  };

  static char newstr [1297] = "";
  newstr[0] = '\0';
  for (i = 0; i < 19; i++) {
    strcat(newstr, encStrCodegen[i]);
  }

  return newstr;
}

static void mdlSetWorkWidths_c17_sliding_controller2(SimStruct *S)
{
  const char* newstr = sf_c17_sliding_controller2_get_post_codegen_info();
  sf_set_work_widths(S, newstr);
  ssSetChecksum0(S,(3202073888U));
  ssSetChecksum1(S,(2900390800U));
  ssSetChecksum2(S,(1185921847U));
  ssSetChecksum3(S,(1504209306U));
}

static void mdlRTW_c17_sliding_controller2(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlSetupRuntimeResources_c17_sliding_controller2(SimStruct *S)
{
  SFc17_sliding_controller2InstanceStruct *chartInstance;
  chartInstance = (SFc17_sliding_controller2InstanceStruct *)utMalloc(sizeof
    (SFc17_sliding_controller2InstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc17_sliding_controller2InstanceStruct));
  chartInstance = new (chartInstance) SFc17_sliding_controller2InstanceStruct;
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c17_sliding_controller2;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c17_sliding_controller2;
  chartInstance->chartInfo.mdlStart =
    sf_opaque_mdl_start_c17_sliding_controller2;
  chartInstance->chartInfo.mdlTerminate =
    sf_opaque_mdl_terminate_c17_sliding_controller2;
  chartInstance->chartInfo.mdlCleanupRuntimeResources =
    sf_opaque_cleanup_runtime_resources_c17_sliding_controller2;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c17_sliding_controller2;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c17_sliding_controller2;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c17_sliding_controller2;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c17_sliding_controller2;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c17_sliding_controller2;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c17_sliding_controller2;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c17_sliding_controller2;
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

  mdl_setup_runtime_resources_c17_sliding_controller2(chartInstance);
}

void c17_sliding_controller2_method_dispatcher(SimStruct *S, int_T method, void *
  data)
{
  switch (method) {
   case SS_CALL_MDL_SETUP_RUNTIME_RESOURCES:
    mdlSetupRuntimeResources_c17_sliding_controller2(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c17_sliding_controller2(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c17_sliding_controller2(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c17_sliding_controller2_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
