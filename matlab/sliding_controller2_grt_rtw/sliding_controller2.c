/*
 * sliding_controller2.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "sliding_controller2".
 *
 * Model version              : 1.153
 * Simulink Coder version : 9.5 (R2021a) 14-Nov-2020
 * C source code generated on : Sat May 29 16:18:39 2021
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Generic->Unspecified (assume 32-bit Generic)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "sliding_controller2.h"
#include "sliding_controller2_private.h"

const SL_Bus_sliding_controller2_sensor_msgs_JointState
  sliding_controller2_rtZSL_Bus_sliding_controller2_sensor_msgs_JointState = {
  {
    0U,                                /* Seq */

    {
      0.0,                             /* Sec */
      0.0                              /* Nsec */
    },                                 /* Stamp */

    {
      0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
      0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
      0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
      0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
      0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
      0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
      0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U }
    ,                                  /* FrameId */

    {
      0U,                              /* CurrentLength */
      0U                               /* ReceivedLength */
    }                                  /* FrameId_SL_Info */
  },                                   /* Header */

  {
    {
      {
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U }
      ,                                /* Data */

      {
        0U,                            /* CurrentLength */
        0U                             /* ReceivedLength */
      }                                /* Data_SL_Info */
    }, {
      {
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U }
      ,                                /* Data */

      {
        0U,                            /* CurrentLength */
        0U                             /* ReceivedLength */
      }                                /* Data_SL_Info */
    }, {
      {
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U }
      ,                                /* Data */

      {
        0U,                            /* CurrentLength */
        0U                             /* ReceivedLength */
      }                                /* Data_SL_Info */
    }, {
      {
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U }
      ,                                /* Data */

      {
        0U,                            /* CurrentLength */
        0U                             /* ReceivedLength */
      }                                /* Data_SL_Info */
    }, {
      {
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U }
      ,                                /* Data */

      {
        0U,                            /* CurrentLength */
        0U                             /* ReceivedLength */
      }                                /* Data_SL_Info */
    }, {
      {
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U }
      ,                                /* Data */

      {
        0U,                            /* CurrentLength */
        0U                             /* ReceivedLength */
      }                                /* Data_SL_Info */
    }, {
      {
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U }
      ,                                /* Data */

      {
        0U,                            /* CurrentLength */
        0U                             /* ReceivedLength */
      }                                /* Data_SL_Info */
    }, {
      {
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U }
      ,                                /* Data */

      {
        0U,                            /* CurrentLength */
        0U                             /* ReceivedLength */
      }                                /* Data_SL_Info */
    }, {
      {
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U }
      ,                                /* Data */

      {
        0U,                            /* CurrentLength */
        0U                             /* ReceivedLength */
      }                                /* Data_SL_Info */
    }, {
      {
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U }
      ,                                /* Data */

      {
        0U,                            /* CurrentLength */
        0U                             /* ReceivedLength */
      }                                /* Data_SL_Info */
    }, {
      {
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U }
      ,                                /* Data */

      {
        0U,                            /* CurrentLength */
        0U                             /* ReceivedLength */
      }                                /* Data_SL_Info */
    }, {
      {
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U }
      ,                                /* Data */

      {
        0U,                            /* CurrentLength */
        0U                             /* ReceivedLength */
      }                                /* Data_SL_Info */
    }, {
      {
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U }
      ,                                /* Data */

      {
        0U,                            /* CurrentLength */
        0U                             /* ReceivedLength */
      }                                /* Data_SL_Info */
    }, {
      {
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U }
      ,                                /* Data */

      {
        0U,                            /* CurrentLength */
        0U                             /* ReceivedLength */
      }                                /* Data_SL_Info */
    }, {
      {
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U }
      ,                                /* Data */

      {
        0U,                            /* CurrentLength */
        0U                             /* ReceivedLength */
      }                                /* Data_SL_Info */
    }, {
      {
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
        0U, 0U }
      ,                                /* Data */

      {
        0U,                            /* CurrentLength */
        0U                             /* ReceivedLength */
      }                                /* Data_SL_Info */
    } }
  ,                                    /* Name */

  {
    0U,                                /* CurrentLength */
    0U                                 /* ReceivedLength */
  },                                   /* Name_SL_Info */

  {
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }
  ,                                    /* Position */

  {
    0U,                                /* CurrentLength */
    0U                                 /* ReceivedLength */
  },                                   /* Position_SL_Info */

  {
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }
  ,                                    /* Velocity */

  {
    0U,                                /* CurrentLength */
    0U                                 /* ReceivedLength */
  },                                   /* Velocity_SL_Info */

  {
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }
  ,                                    /* Effort */

  {
    0U,                                /* CurrentLength */
    0U                                 /* ReceivedLength */
  }                                    /* Effort_SL_Info */
} ;               /* SL_Bus_sliding_controller2_sensor_msgs_JointState ground */

const SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex
  sliding_controller2_rtZSL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex
  = {
  0U,                                  /* ModelName */

  {
    0U,                                /* CurrentLength */
    0U                                 /* ReceivedLength */
  },                                   /* ModelName_SL_Info */

  {
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }
  ,                                    /* Q */

  {
    0U,                                /* CurrentLength */
    0U                                 /* ReceivedLength */
  },                                   /* Q_SL_Info */

  {
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }
  ,                                    /* Qd */

  {
    0U,                                /* CurrentLength */
    0U                                 /* ReceivedLength */
  },                                   /* Qd_SL_Info */

  {
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }
  ,                                    /* Qdd */

  {
    0U,                                /* CurrentLength */
    0U                                 /* ReceivedLength */
  }                                    /* Qdd_SL_Info */
} ;     /* SL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex ground */

const SL_Bus_sliding_controller2_ambf_walker_DesiredJoints
  sliding_controller2_rtZSL_Bus_sliding_controller2_ambf_walker_DesiredJoints =
  {
  {
    0U,                                /* Seq */

    {
      0.0,                             /* Sec */
      0.0                              /* Nsec */
    },                                 /* Stamp */

    {
      0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
      0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
      0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
      0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
      0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
      0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U,
      0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U }
    ,                                  /* FrameId */

    {
      0U,                              /* CurrentLength */
      0U                               /* ReceivedLength */
    }                                  /* FrameId_SL_Info */
  },                                   /* Header */

  {
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }
  ,                                    /* Q */

  {
    0U,                                /* CurrentLength */
    0U                                 /* ReceivedLength */
  },                                   /* Q_SL_Info */

  {
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }
  ,                                    /* Qd */

  {
    0U,                                /* CurrentLength */
    0U                                 /* ReceivedLength */
  },                                   /* Qd_SL_Info */

  {
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }
  ,                                    /* Qdd */

  {
    0U,                                /* CurrentLength */
    0U                                 /* ReceivedLength */
  },                                   /* Qdd_SL_Info */

  {
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }
  ,                                    /* Other */

  {
    0U,                                /* CurrentLength */
    0U                                 /* ReceivedLength */
  },                                   /* Other_SL_Info */

  {
    0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U }
  ,                                    /* Controller */

  {
    0U,                                /* CurrentLength */
    0U                                 /* ReceivedLength */
  }                                    /* Controller_SL_Info */
} ;            /* SL_Bus_sliding_controller2_ambf_walker_DesiredJoints ground */

/* Exported block parameters */
real_T Dm1[49] = { 30.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 30.0, 0.0, 0.0, 0.0,
  0.0, 0.0, 0.0, 0.0, 30.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 30.0, 0.0, 0.0,
  0.0, 0.0, 0.0, 0.0, 0.0, 30.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 30.0, 0.0,
  0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 30.0 } ;/* Variable: Dm1
                                         * Referenced by: '<S18>/Gain2'
                                         */

/* Block signals (default storage) */
B_sliding_controller2_T sliding_controller2_B;

/* Continuous states */
X_sliding_controller2_T sliding_controller2_X;

/* Block states (default storage) */
DW_sliding_controller2_T sliding_controller2_DW;

/* Real-time model */
static RT_MODEL_sliding_controller2_T sliding_controller2_M_;
RT_MODEL_sliding_controller2_T *const sliding_controller2_M =
  &sliding_controller2_M_;

/* Forward declaration for local functions */
static void sliding_control_SystemCore_step(boolean_T *varargout_1, uint32_T
  *varargout_2_Header_Seq, real_T *varargout_2_Header_Stamp_Sec, real_T
  *varargout_2_Header_Stamp_Nsec, uint8_T varargout_2_Header_FrameId[128],
  uint32_T *varargout_2_Header_FrameId_SL_I, uint32_T
  *varargout_2_Header_FrameId_SL_0, SL_Bus_sliding_controller2_std_msgs_String
  varargout_2_Name[16], uint32_T *varargout_2_Name_SL_Info_Curren, uint32_T
  *varargout_2_Name_SL_Info_Receiv, real_T varargout_2_Position[7], uint32_T
  *varargout_2_Position_SL_Info_Cu, uint32_T *varargout_2_Position_SL_Info_Re,
  real_T varargout_2_Velocity[7], uint32_T *varargout_2_Velocity_SL_Info_Cu,
  uint32_T *varargout_2_Velocity_SL_Info_Re, real_T varargout_2_Effort[7],
  SL_Bus_ROSVariableLengthArrayInfo *varargout_2_Effort_SL_Info);
static void sliding_contr_SystemCore_step_k(boolean_T *varargout_1, uint32_T
  *varargout_2_Header_Seq, real_T *varargout_2_Header_Stamp_Sec, real_T
  *varargout_2_Header_Stamp_Nsec, uint8_T varargout_2_Header_FrameId[128],
  uint32_T *varargout_2_Header_FrameId_SL_I, uint32_T
  *varargout_2_Header_FrameId_SL_0, SL_Bus_sliding_controller2_std_msgs_String
  varargout_2_Name[16], uint32_T *varargout_2_Name_SL_Info_Curren, uint32_T
  *varargout_2_Name_SL_Info_Receiv, real_T varargout_2_Position[7], uint32_T
  *varargout_2_Position_SL_Info_Cu, uint32_T *varargout_2_Position_SL_Info_Re,
  real_T varargout_2_Velocity[7], uint32_T *varargout_2_Velocity_SL_Info_Cu,
  uint32_T *varargout_2_Velocity_SL_Info_Re, real_T varargout_2_Effort[7],
  SL_Bus_ROSVariableLengthArrayInfo *varargout_2_Effort_SL_Info);
static real_T sliding_controller2_xnrm2(int32_T n, const real_T x[7], int32_T
  ix0);
static void sliding_controller2_qrpf(real_T A[7], int32_T ia0, int32_T m,
  int32_T n, real_T *tau, int32_T jpvt[7]);

/*
 * This function updates continuous states using the ODE3 fixed-step
 * solver algorithm
 */
static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
{
  /* Solver Matrices */
  static const real_T rt_ODE3_A[3] = {
    1.0/2.0, 3.0/4.0, 1.0
  };

  static const real_T rt_ODE3_B[3][3] = {
    { 1.0/2.0, 0.0, 0.0 },

    { 0.0, 3.0/4.0, 0.0 },

    { 2.0/9.0, 1.0/3.0, 4.0/9.0 }
  };

  time_T t = rtsiGetT(si);
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE3_IntgData *id = (ODE3_IntgData *)rtsiGetSolverData(si);
  real_T *y = id->y;
  real_T *f0 = id->f[0];
  real_T *f1 = id->f[1];
  real_T *f2 = id->f[2];
  real_T hB[3];
  int_T i;
  int_T nXc = 14;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);

  /* Save the state values at time t in y, we'll use x as ynew. */
  (void) memcpy(y, x,
                (uint_T)nXc*sizeof(real_T));

  /* Assumes that rtsiSetT and ModelOutputs are up-to-date */
  /* f0 = f(t,y) */
  rtsiSetdX(si, f0);
  sliding_controller2_derivatives();

  /* f(:,2) = feval(odefile, t + hA(1), y + f*hB(:,1), args(:)(*)); */
  hB[0] = h * rt_ODE3_B[0][0];
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[0]);
  rtsiSetdX(si, f1);
  sliding_controller2_step();
  sliding_controller2_derivatives();

  /* f(:,3) = feval(odefile, t + hA(2), y + f*hB(:,2), args(:)(*)); */
  for (i = 0; i <= 1; i++) {
    hB[i] = h * rt_ODE3_B[1][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[1]);
  rtsiSetdX(si, f2);
  sliding_controller2_step();
  sliding_controller2_derivatives();

  /* tnew = t + hA(3);
     ynew = y + f*hB(:,3); */
  for (i = 0; i <= 2; i++) {
    hB[i] = h * rt_ODE3_B[2][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2]);
  }

  rtsiSetT(si, tnew);
  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

/*
 * Output and update for atomic system:
 *    '<S14>/exo left'
 *    '<S14>/exo right'
 *    '<S14>/human left'
 *    '<S14>/human right'
 */
void sliding_controller2_exoleft(const real_T rtu_q[2], const real_T rtu_qd[2],
  B_exoleft_sliding_controller2_T *localB)
{
  real_T a;
  real_T knee_tmp;
  real_T knee_tmp_0;
  knee_tmp = sin(rtu_q[0]);
  knee_tmp_0 = cos(rtu_q[0]);
  localB->knee[0] = 0.324 * knee_tmp_0;
  localB->knee[1] = 0.324 * knee_tmp;
  a = 0.324 * rtu_qd[0];
  localB->dknee[0] = a * -knee_tmp;
  localB->dknee[1] = a * knee_tmp_0;
  knee_tmp = (rtu_qd[0] + rtu_qd[1]) * 0.39;
  knee_tmp_0 = rtu_q[0] + rtu_q[1];
  a = cos(knee_tmp_0);
  localB->ankle[0] = a * 0.39 + localB->knee[0];
  knee_tmp_0 = sin(knee_tmp_0);
  localB->ankle[1] = knee_tmp_0 * 0.39 + localB->knee[1];
  localB->danke[0] = -knee_tmp_0 * knee_tmp + localB->dknee[0];
  localB->danke[1] = a * knee_tmp + localB->dknee[1];
}

/*
 * Output and update for atomic system:
 *    '<S28>/MATLAB Function'
 *    '<S29>/MATLAB Function'
 *    '<S34>/MATLAB Function'
 *    '<S35>/MATLAB Function'
 */
void sliding_controll_MATLABFunction(const real_T rtu_q[2],
  B_MATLABFunction_sliding_cont_T *localB)
{
  localB->y[0] = -0.324 * sin(rtu_q[0]);
  localB->y[2] = 0.0;
  localB->y[1] = 0.324 * cos(rtu_q[0]);
  localB->y[3] = 0.0;
}

/*
 * Output and update for atomic system:
 *    '<S28>/MATLAB Function1'
 *    '<S29>/MATLAB Function1'
 *    '<S34>/MATLAB Function1'
 *    '<S35>/MATLAB Function1'
 */
void sliding_control_MATLABFunction1(const real_T rtu_q[2],
  B_MATLABFunction1_sliding_con_T *localB)
{
  real_T y_tmp;
  real_T y_tmp_tmp;
  y_tmp_tmp = rtu_q[0] + rtu_q[1];
  y_tmp = sin(y_tmp_tmp);
  localB->y[0] = -0.324 * sin(rtu_q[0]) - 0.39 * y_tmp;
  localB->y[2] = sin(rtu_q[0] + rtu_q[1]) * 0.39 + 0.324 * cos(rtu_q[0]);
  localB->y[1] = -0.39 * y_tmp;
  localB->y[3] = cos(y_tmp_tmp) * 0.39;
}

/*
 * System initialize for enable system:
 *    '<S10>/Enabled Subsystem'
 *    '<S11>/Enabled Subsystem'
 */
void sliding_c_EnabledSubsystem_Init(B_EnabledSubsystem_sliding_co_T *localB,
  P_EnabledSubsystem_sliding_co_T *localP)
{
  /* SystemInitialize for Outport: '<S45>/Out1' incorporates:
   *  Inport: '<S45>/In1'
   */
  localB->In1 = localP->Out1_Y0;
}

/*
 * Output and update for enable system:
 *    '<S10>/Enabled Subsystem'
 *    '<S11>/Enabled Subsystem'
 */
void sliding_contro_EnabledSubsystem(boolean_T rtu_Enable, const
  SL_Bus_sliding_controller2_sensor_msgs_JointState *rtu_In1,
  B_EnabledSubsystem_sliding_co_T *localB)
{
  /* Outputs for Enabled SubSystem: '<S10>/Enabled Subsystem' incorporates:
   *  EnablePort: '<S45>/Enable'
   */
  if (rtu_Enable) {
    /* Inport: '<S45>/In1' */
    localB->In1 = *rtu_In1;
  }

  /* End of Outputs for SubSystem: '<S10>/Enabled Subsystem' */
}

static void sliding_control_SystemCore_step(boolean_T *varargout_1, uint32_T
  *varargout_2_Header_Seq, real_T *varargout_2_Header_Stamp_Sec, real_T
  *varargout_2_Header_Stamp_Nsec, uint8_T varargout_2_Header_FrameId[128],
  uint32_T *varargout_2_Header_FrameId_SL_I, uint32_T
  *varargout_2_Header_FrameId_SL_0, SL_Bus_sliding_controller2_std_msgs_String
  varargout_2_Name[16], uint32_T *varargout_2_Name_SL_Info_Curren, uint32_T
  *varargout_2_Name_SL_Info_Receiv, real_T varargout_2_Position[7], uint32_T
  *varargout_2_Position_SL_Info_Cu, uint32_T *varargout_2_Position_SL_Info_Re,
  real_T varargout_2_Velocity[7], uint32_T *varargout_2_Velocity_SL_Info_Cu,
  uint32_T *varargout_2_Velocity_SL_Info_Re, real_T varargout_2_Effort[7],
  SL_Bus_ROSVariableLengthArrayInfo *varargout_2_Effort_SL_Info)
{
  int32_T i;
  *varargout_1 = Sub_sliding_controller2_1262.getLatestMessage
    (&sliding_controller2_B.b_varargout_2_c);
  *varargout_2_Header_Seq = sliding_controller2_B.b_varargout_2_c.Header.Seq;
  *varargout_2_Header_Stamp_Sec =
    sliding_controller2_B.b_varargout_2_c.Header.Stamp.Sec;
  *varargout_2_Header_Stamp_Nsec =
    sliding_controller2_B.b_varargout_2_c.Header.Stamp.Nsec;
  memcpy(&varargout_2_Header_FrameId[0],
         &sliding_controller2_B.b_varargout_2_c.Header.FrameId[0], sizeof
         (uint8_T) << 7U);
  *varargout_2_Header_FrameId_SL_I =
    sliding_controller2_B.b_varargout_2_c.Header.FrameId_SL_Info.CurrentLength;
  *varargout_2_Header_FrameId_SL_0 =
    sliding_controller2_B.b_varargout_2_c.Header.FrameId_SL_Info.ReceivedLength;
  memcpy(&varargout_2_Name[0], &sliding_controller2_B.b_varargout_2_c.Name[0],
         sizeof(SL_Bus_sliding_controller2_std_msgs_String) << 4U);
  *varargout_2_Name_SL_Info_Curren =
    sliding_controller2_B.b_varargout_2_c.Name_SL_Info.CurrentLength;
  *varargout_2_Name_SL_Info_Receiv =
    sliding_controller2_B.b_varargout_2_c.Name_SL_Info.ReceivedLength;
  *varargout_2_Position_SL_Info_Cu =
    sliding_controller2_B.b_varargout_2_c.Position_SL_Info.CurrentLength;
  *varargout_2_Position_SL_Info_Re =
    sliding_controller2_B.b_varargout_2_c.Position_SL_Info.ReceivedLength;
  *varargout_2_Velocity_SL_Info_Cu =
    sliding_controller2_B.b_varargout_2_c.Velocity_SL_Info.CurrentLength;
  *varargout_2_Velocity_SL_Info_Re =
    sliding_controller2_B.b_varargout_2_c.Velocity_SL_Info.ReceivedLength;
  for (i = 0; i < 7; i++) {
    varargout_2_Position[i] = sliding_controller2_B.b_varargout_2_c.Position[i];
    varargout_2_Velocity[i] = sliding_controller2_B.b_varargout_2_c.Velocity[i];
    varargout_2_Effort[i] = sliding_controller2_B.b_varargout_2_c.Effort[i];
  }

  *varargout_2_Effort_SL_Info =
    sliding_controller2_B.b_varargout_2_c.Effort_SL_Info;
}

static void sliding_contr_SystemCore_step_k(boolean_T *varargout_1, uint32_T
  *varargout_2_Header_Seq, real_T *varargout_2_Header_Stamp_Sec, real_T
  *varargout_2_Header_Stamp_Nsec, uint8_T varargout_2_Header_FrameId[128],
  uint32_T *varargout_2_Header_FrameId_SL_I, uint32_T
  *varargout_2_Header_FrameId_SL_0, SL_Bus_sliding_controller2_std_msgs_String
  varargout_2_Name[16], uint32_T *varargout_2_Name_SL_Info_Curren, uint32_T
  *varargout_2_Name_SL_Info_Receiv, real_T varargout_2_Position[7], uint32_T
  *varargout_2_Position_SL_Info_Cu, uint32_T *varargout_2_Position_SL_Info_Re,
  real_T varargout_2_Velocity[7], uint32_T *varargout_2_Velocity_SL_Info_Cu,
  uint32_T *varargout_2_Velocity_SL_Info_Re, real_T varargout_2_Effort[7],
  SL_Bus_ROSVariableLengthArrayInfo *varargout_2_Effort_SL_Info)
{
  int32_T i;
  *varargout_1 = Sub_sliding_controller2_1277.getLatestMessage
    (&sliding_controller2_B.b_varargout_2);
  *varargout_2_Header_Seq = sliding_controller2_B.b_varargout_2.Header.Seq;
  *varargout_2_Header_Stamp_Sec =
    sliding_controller2_B.b_varargout_2.Header.Stamp.Sec;
  *varargout_2_Header_Stamp_Nsec =
    sliding_controller2_B.b_varargout_2.Header.Stamp.Nsec;
  memcpy(&varargout_2_Header_FrameId[0],
         &sliding_controller2_B.b_varargout_2.Header.FrameId[0], sizeof(uint8_T)
         << 7U);
  *varargout_2_Header_FrameId_SL_I =
    sliding_controller2_B.b_varargout_2.Header.FrameId_SL_Info.CurrentLength;
  *varargout_2_Header_FrameId_SL_0 =
    sliding_controller2_B.b_varargout_2.Header.FrameId_SL_Info.ReceivedLength;
  memcpy(&varargout_2_Name[0], &sliding_controller2_B.b_varargout_2.Name[0],
         sizeof(SL_Bus_sliding_controller2_std_msgs_String) << 4U);
  *varargout_2_Name_SL_Info_Curren =
    sliding_controller2_B.b_varargout_2.Name_SL_Info.CurrentLength;
  *varargout_2_Name_SL_Info_Receiv =
    sliding_controller2_B.b_varargout_2.Name_SL_Info.ReceivedLength;
  *varargout_2_Position_SL_Info_Cu =
    sliding_controller2_B.b_varargout_2.Position_SL_Info.CurrentLength;
  *varargout_2_Position_SL_Info_Re =
    sliding_controller2_B.b_varargout_2.Position_SL_Info.ReceivedLength;
  *varargout_2_Velocity_SL_Info_Cu =
    sliding_controller2_B.b_varargout_2.Velocity_SL_Info.CurrentLength;
  *varargout_2_Velocity_SL_Info_Re =
    sliding_controller2_B.b_varargout_2.Velocity_SL_Info.ReceivedLength;
  for (i = 0; i < 7; i++) {
    varargout_2_Position[i] = sliding_controller2_B.b_varargout_2.Position[i];
    varargout_2_Velocity[i] = sliding_controller2_B.b_varargout_2.Velocity[i];
    varargout_2_Effort[i] = sliding_controller2_B.b_varargout_2.Effort[i];
  }

  *varargout_2_Effort_SL_Info =
    sliding_controller2_B.b_varargout_2.Effort_SL_Info;
}

/* Function for MATLAB Function: '<S17>/MATLAB Function' */
static real_T sliding_controller2_xnrm2(int32_T n, const real_T x[7], int32_T
  ix0)
{
  real_T y;
  int32_T k;
  int32_T kend;
  y = 0.0;
  if (n >= 1) {
    if (n == 1) {
      y = fabs(x[ix0 - 1]);
    } else {
      sliding_controller2_B.scale = 3.3121686421112381E-170;
      kend = (ix0 + n) - 1;
      for (k = ix0; k <= kend; k++) {
        sliding_controller2_B.absxk = fabs(x[k - 1]);
        if (sliding_controller2_B.absxk > sliding_controller2_B.scale) {
          sliding_controller2_B.t = sliding_controller2_B.scale /
            sliding_controller2_B.absxk;
          y = y * sliding_controller2_B.t * sliding_controller2_B.t + 1.0;
          sliding_controller2_B.scale = sliding_controller2_B.absxk;
        } else {
          sliding_controller2_B.t = sliding_controller2_B.absxk /
            sliding_controller2_B.scale;
          y += sliding_controller2_B.t * sliding_controller2_B.t;
        }
      }

      y = sliding_controller2_B.scale * sqrt(y);
    }
  }

  return y;
}

real_T rt_hypotd_snf(real_T u0, real_T u1)
{
  real_T a;
  real_T y;
  a = fabs(u0);
  y = fabs(u1);
  if (a < y) {
    a /= y;
    y *= sqrt(a * a + 1.0);
  } else if (a > y) {
    y /= a;
    y = sqrt(y * y + 1.0) * a;
  } else if (!rtIsNaN(y)) {
    y = a * 1.4142135623730951;
  }

  return y;
}

/* Function for MATLAB Function: '<S17>/MATLAB Function' */
static void sliding_controller2_qrpf(real_T A[7], int32_T ia0, int32_T m,
  int32_T n, real_T *tau, int32_T jpvt[7])
{
  int32_T b_k;
  int32_T c_ix;
  int32_T e;
  int32_T exitg1;
  int32_T i;
  int32_T ia;
  int32_T ii_tmp;
  int32_T iy;
  boolean_T exitg2;
  if (m < n) {
    sliding_controller2_B.minmn = m;
  } else {
    sliding_controller2_B.minmn = n;
  }

  for (i = 0; i < 7; i++) {
    sliding_controller2_B.work[i] = 0.0;
    sliding_controller2_B.vn1[i] = 0.0;
    sliding_controller2_B.vn2[i] = 0.0;
  }

  for (i = 0; i < n; i++) {
    sliding_controller2_B.vn1[i] = sliding_controller2_xnrm2(m, A, ia0 + i);
    sliding_controller2_B.vn2[i] = sliding_controller2_B.vn1[i];
  }

  for (i = 0; i < sliding_controller2_B.minmn; i++) {
    ii_tmp = ia0 + i;
    sliding_controller2_B.ii = (ii_tmp + i) - 1;
    sliding_controller2_B.nmi = n - i;
    sliding_controller2_B.mmi = (m - i) - 1;
    if (sliding_controller2_B.nmi < 1) {
      sliding_controller2_B.pvt = -1;
    } else {
      sliding_controller2_B.pvt = 0;
      if (sliding_controller2_B.nmi > 1) {
        sliding_controller2_B.ix = i;
        sliding_controller2_B.smax = fabs(sliding_controller2_B.vn1[i]);
        for (iy = 2; iy <= sliding_controller2_B.nmi; iy++) {
          sliding_controller2_B.ix++;
          sliding_controller2_B.beta1 = fabs
            (sliding_controller2_B.vn1[sliding_controller2_B.ix]);
          if (sliding_controller2_B.beta1 > sliding_controller2_B.smax) {
            sliding_controller2_B.pvt = iy - 1;
            sliding_controller2_B.smax = sliding_controller2_B.beta1;
          }
        }
      }
    }

    sliding_controller2_B.pvt += i;
    if (sliding_controller2_B.pvt + 1 != i + 1) {
      sliding_controller2_B.ix = (ia0 + sliding_controller2_B.pvt) - 1;
      iy = ii_tmp - 1;
      for (b_k = 0; b_k < m; b_k++) {
        sliding_controller2_B.smax = A[sliding_controller2_B.ix];
        A[sliding_controller2_B.ix] = A[iy];
        A[iy] = sliding_controller2_B.smax;
        sliding_controller2_B.ix++;
        iy++;
      }

      sliding_controller2_B.ix = jpvt[sliding_controller2_B.pvt];
      jpvt[sliding_controller2_B.pvt] = jpvt[i];
      jpvt[i] = sliding_controller2_B.ix;
      sliding_controller2_B.vn1[sliding_controller2_B.pvt] =
        sliding_controller2_B.vn1[i];
      sliding_controller2_B.vn2[sliding_controller2_B.pvt] =
        sliding_controller2_B.vn2[i];
    }

    if (i + 1 < m) {
      sliding_controller2_B.smax = A[sliding_controller2_B.ii];
      *tau = 0.0;
      if (sliding_controller2_B.mmi + 1 > 0) {
        sliding_controller2_B.beta1 = sliding_controller2_xnrm2
          (sliding_controller2_B.mmi, A, sliding_controller2_B.ii + 2);
        if (sliding_controller2_B.beta1 != 0.0) {
          sliding_controller2_B.beta1 = rt_hypotd_snf(A[sliding_controller2_B.ii],
            sliding_controller2_B.beta1);
          if (A[sliding_controller2_B.ii] >= 0.0) {
            sliding_controller2_B.beta1 = -sliding_controller2_B.beta1;
          }

          if (fabs(sliding_controller2_B.beta1) < 1.0020841800044864E-292) {
            sliding_controller2_B.pvt = -1;
            sliding_controller2_B.ix = (sliding_controller2_B.ii +
              sliding_controller2_B.mmi) + 1;
            do {
              sliding_controller2_B.pvt++;
              for (iy = sliding_controller2_B.ii + 1; iy <
                   sliding_controller2_B.ix; iy++) {
                A[iy] *= 9.9792015476736E+291;
              }

              sliding_controller2_B.beta1 *= 9.9792015476736E+291;
              sliding_controller2_B.smax *= 9.9792015476736E+291;
            } while (!(fabs(sliding_controller2_B.beta1) >=
                       1.0020841800044864E-292));

            sliding_controller2_B.beta1 = rt_hypotd_snf
              (sliding_controller2_B.smax, sliding_controller2_xnrm2
               (sliding_controller2_B.mmi, A, sliding_controller2_B.ii + 2));
            if (sliding_controller2_B.smax >= 0.0) {
              sliding_controller2_B.beta1 = -sliding_controller2_B.beta1;
            }

            *tau = (sliding_controller2_B.beta1 - sliding_controller2_B.smax) /
              sliding_controller2_B.beta1;
            sliding_controller2_B.smax = 1.0 / (sliding_controller2_B.smax -
              sliding_controller2_B.beta1);
            for (iy = sliding_controller2_B.ii + 1; iy <
                 sliding_controller2_B.ix; iy++) {
              A[iy] *= sliding_controller2_B.smax;
            }

            sliding_controller2_B.ix = 0;
            while (sliding_controller2_B.ix <= sliding_controller2_B.pvt) {
              sliding_controller2_B.beta1 *= 1.0020841800044864E-292;
              sliding_controller2_B.ix++;
            }

            sliding_controller2_B.smax = sliding_controller2_B.beta1;
          } else {
            *tau = (sliding_controller2_B.beta1 - A[sliding_controller2_B.ii]) /
              sliding_controller2_B.beta1;
            sliding_controller2_B.smax = 1.0 / (A[sliding_controller2_B.ii] -
              sliding_controller2_B.beta1);
            sliding_controller2_B.pvt = (sliding_controller2_B.ii +
              sliding_controller2_B.mmi) + 1;
            sliding_controller2_B.ix = sliding_controller2_B.ii + 1;
            while (sliding_controller2_B.ix + 1 <= sliding_controller2_B.pvt) {
              A[sliding_controller2_B.ix] *= sliding_controller2_B.smax;
              sliding_controller2_B.ix++;
            }

            sliding_controller2_B.smax = sliding_controller2_B.beta1;
          }
        }
      }

      A[sliding_controller2_B.ii] = sliding_controller2_B.smax;
    } else {
      *tau = 0.0;
    }

    if (i + 1 < n) {
      sliding_controller2_B.smax = A[sliding_controller2_B.ii];
      A[sliding_controller2_B.ii] = 1.0;
      if (*tau != 0.0) {
        sliding_controller2_B.pvt = sliding_controller2_B.mmi + 1;
        sliding_controller2_B.ix = sliding_controller2_B.ii +
          sliding_controller2_B.mmi;
        while ((sliding_controller2_B.pvt > 0) && (A[sliding_controller2_B.ix] ==
                0.0)) {
          sliding_controller2_B.pvt--;
          sliding_controller2_B.ix--;
        }

        sliding_controller2_B.nmi--;
        exitg2 = false;
        while ((!exitg2) && (sliding_controller2_B.nmi > 0)) {
          sliding_controller2_B.ix = (sliding_controller2_B.ii +
            sliding_controller2_B.nmi) + 1;
          iy = sliding_controller2_B.ix;
          do {
            exitg1 = 0;
            if (iy <= (sliding_controller2_B.ix + sliding_controller2_B.pvt) - 1)
            {
              if (A[iy - 1] != 0.0) {
                exitg1 = 1;
              } else {
                iy++;
              }
            } else {
              sliding_controller2_B.nmi--;
              exitg1 = 2;
            }
          } while (exitg1 == 0);

          if (exitg1 == 1) {
            exitg2 = true;
          }
        }
      } else {
        sliding_controller2_B.pvt = 0;
        sliding_controller2_B.nmi = 0;
      }

      if (sliding_controller2_B.pvt > 0) {
        if (sliding_controller2_B.nmi != 0) {
          sliding_controller2_B.ix = 0;
          while (sliding_controller2_B.ix <= sliding_controller2_B.nmi - 1) {
            sliding_controller2_B.work[sliding_controller2_B.ix] = 0.0;
            sliding_controller2_B.ix++;
          }

          sliding_controller2_B.ix = 0;
          iy = (sliding_controller2_B.ii + sliding_controller2_B.nmi) + 1;
          for (b_k = sliding_controller2_B.ii + 2; b_k <= iy; b_k++) {
            c_ix = sliding_controller2_B.ii;
            sliding_controller2_B.beta1 = 0.0;
            e = (b_k + sliding_controller2_B.pvt) - 1;
            for (ia = b_k; ia <= e; ia++) {
              sliding_controller2_B.beta1 += A[ia - 1] * A[c_ix];
              c_ix++;
            }

            sliding_controller2_B.work[sliding_controller2_B.ix] +=
              sliding_controller2_B.beta1;
            sliding_controller2_B.ix++;
          }
        }

        if (!(-*tau == 0.0)) {
          sliding_controller2_B.ix = sliding_controller2_B.ii + 1;
          iy = 0;
          for (b_k = 0; b_k < sliding_controller2_B.nmi; b_k++) {
            if (sliding_controller2_B.work[iy] != 0.0) {
              sliding_controller2_B.beta1 = sliding_controller2_B.work[iy] *
                -*tau;
              c_ix = sliding_controller2_B.ii;
              e = sliding_controller2_B.pvt + sliding_controller2_B.ix;
              for (ia = sliding_controller2_B.ix; ia < e; ia++) {
                A[ia] += A[c_ix] * sliding_controller2_B.beta1;
                c_ix++;
              }
            }

            iy++;
            sliding_controller2_B.ix++;
          }
        }
      }

      A[sliding_controller2_B.ii] = sliding_controller2_B.smax;
    }

    sliding_controller2_B.ii = i + 1;
    while (sliding_controller2_B.ii + 1 <= n) {
      sliding_controller2_B.pvt = ii_tmp + sliding_controller2_B.ii;
      if (sliding_controller2_B.vn1[sliding_controller2_B.ii] != 0.0) {
        sliding_controller2_B.smax = fabs(A[sliding_controller2_B.pvt - 1]) /
          sliding_controller2_B.vn1[sliding_controller2_B.ii];
        sliding_controller2_B.smax = 1.0 - sliding_controller2_B.smax *
          sliding_controller2_B.smax;
        if (sliding_controller2_B.smax < 0.0) {
          sliding_controller2_B.smax = 0.0;
        }

        sliding_controller2_B.beta1 =
          sliding_controller2_B.vn1[sliding_controller2_B.ii] /
          sliding_controller2_B.vn2[sliding_controller2_B.ii];
        sliding_controller2_B.beta1 = sliding_controller2_B.beta1 *
          sliding_controller2_B.beta1 * sliding_controller2_B.smax;
        if (sliding_controller2_B.beta1 <= 1.4901161193847656E-8) {
          if (i + 1 < m) {
            sliding_controller2_B.vn1[sliding_controller2_B.ii] =
              sliding_controller2_xnrm2(sliding_controller2_B.mmi, A,
              sliding_controller2_B.pvt + 1);
            sliding_controller2_B.vn2[sliding_controller2_B.ii] =
              sliding_controller2_B.vn1[sliding_controller2_B.ii];
          } else {
            sliding_controller2_B.vn1[sliding_controller2_B.ii] = 0.0;
            sliding_controller2_B.vn2[sliding_controller2_B.ii] = 0.0;
          }
        } else {
          sliding_controller2_B.vn1[sliding_controller2_B.ii] *= sqrt
            (sliding_controller2_B.smax);
        }
      }

      sliding_controller2_B.ii++;
    }
  }
}

/* Model step function */
void sliding_controller2_step(void)
{
  /* local block i/o variables */
  boolean_T rtb_SourceBlock_o1;
  boolean_T rtb_SourceBlock_o1_h;
  uint8_T b_varargout_2;
  boolean_T isCreated;
  static const uint8_T b[10] = { 76U, 101U, 102U, 116U, 69U, 120U, 111U, 72U,
    105U, 112U };

  static const uint8_T c[11] = { 76U, 101U, 102U, 116U, 69U, 120U, 111U, 75U,
    110U, 101U, 101U };

  static const uint8_T d[12] = { 76U, 101U, 102U, 116U, 69U, 120U, 111U, 65U,
    110U, 107U, 108U, 101U };

  static const uint8_T e[11] = { 82U, 105U, 103U, 104U, 116U, 69U, 120U, 111U,
    72U, 105U, 112U };

  static const uint8_T f[12] = { 82U, 105U, 103U, 104U, 116U, 69U, 120U, 111U,
    75U, 110U, 101U, 101U };

  static const uint8_T g[13] = { 82U, 105U, 103U, 104U, 116U, 69U, 120U, 111U,
    65U, 110U, 107U, 108U, 101U };

  static const uint8_T h[8] = { 67U, 114U, 117U, 116U, 99U, 104U, 101U, 115U };

  static const char_T tmp[16] = { '/', 'I', 'n', 'v', 'e', 'r', 's', 'e', 'D',
    'y', 'n', 'a', 'm', 'i', 'c', 's' };

  static const uint8_T b_0[12] = { 76U, 101U, 102U, 116U, 72U, 117U, 109U, 97U,
    110U, 72U, 105U, 112U };

  static const uint8_T c_0[13] = { 76U, 101U, 102U, 116U, 72U, 117U, 109U, 97U,
    110U, 75U, 110U, 101U, 101U };

  static const uint8_T d_0[14] = { 76U, 101U, 102U, 116U, 72U, 117U, 109U, 97U,
    110U, 65U, 110U, 107U, 108U, 101U };

  static const uint8_T e_0[13] = { 82U, 105U, 103U, 104U, 116U, 72U, 117U, 109U,
    97U, 110U, 72U, 105U, 112U };

  static const uint8_T f_0[14] = { 82U, 105U, 103U, 104U, 116U, 72U, 117U, 109U,
    97U, 110U, 75U, 110U, 101U, 101U };

  static const uint8_T g_0[15] = { 82U, 105U, 103U, 104U, 116U, 72U, 117U, 109U,
    97U, 110U, 65U, 110U, 107U, 108U, 101U };

  static const int8_T Kn0[49] = { 50, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0,
    0, 50, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0,
    50, 0, 0, 0, 0, 0, 0, 0, 50 };

  static const int8_T Kp0[49] = { 75, 0, 0, 0, 0, 0, 0, 0, 75, 0, 0, 0, 0, 0, 0,
    0, 75, 0, 0, 0, 0, 0, 0, 0, 75, 0, 0, 0, 0, 0, 0, 0, 75, 0, 0, 0, 0, 0, 0, 0,
    75, 0, 0, 0, 0, 0, 0, 0, 75 };

  if (rtmIsMajorTimeStep(sliding_controller2_M)) {
    /* set solver stop time */
    if (!(sliding_controller2_M->Timing.clockTick0+1)) {
      rtsiSetSolverStopTime(&sliding_controller2_M->solverInfo,
                            ((sliding_controller2_M->Timing.clockTickH0 + 1) *
        sliding_controller2_M->Timing.stepSize0 * 4294967296.0));
    } else {
      rtsiSetSolverStopTime(&sliding_controller2_M->solverInfo,
                            ((sliding_controller2_M->Timing.clockTick0 + 1) *
        sliding_controller2_M->Timing.stepSize0 +
        sliding_controller2_M->Timing.clockTickH0 *
        sliding_controller2_M->Timing.stepSize0 * 4294967296.0));
    }
  }                                    /* end MajorTimeStep */

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(sliding_controller2_M)) {
    sliding_controller2_M->Timing.t[0] = rtsiGetT
      (&sliding_controller2_M->solverInfo);
  }

  if (rtmIsMajorTimeStep(sliding_controller2_M)) {
    /* MATLAB Function: '<Root>/exo msg' incorporates:
     *  Constant: '<S1>/Constant'
     */
    sliding_controller2_B.msg = sliding_controller2_P.Constant_Value;
    sliding_controller2_B.msg.Name_SL_Info.CurrentLength = 7U;
    sliding_controller2_B.msg.Effort_SL_Info.CurrentLength = 7U;
    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 10;
         sliding_controller2_B.k++) {
      sliding_controller2_B.msg.Name[0].Data[sliding_controller2_B.k] =
        b[sliding_controller2_B.k];
    }

    sliding_controller2_B.msg.Name[0].Data_SL_Info.CurrentLength = 10U;
    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 11;
         sliding_controller2_B.k++) {
      sliding_controller2_B.msg.Name[1].Data[sliding_controller2_B.k] =
        c[sliding_controller2_B.k];
    }

    sliding_controller2_B.msg.Name[1].Data_SL_Info.CurrentLength = 11U;
    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 12;
         sliding_controller2_B.k++) {
      sliding_controller2_B.msg.Name[2].Data[sliding_controller2_B.k] =
        d[sliding_controller2_B.k];
    }

    sliding_controller2_B.msg.Name[2].Data_SL_Info.CurrentLength = 12U;
    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 11;
         sliding_controller2_B.k++) {
      sliding_controller2_B.msg.Name[3].Data[sliding_controller2_B.k] =
        e[sliding_controller2_B.k];
    }

    sliding_controller2_B.msg.Name[3].Data_SL_Info.CurrentLength = 11U;
    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 12;
         sliding_controller2_B.k++) {
      sliding_controller2_B.msg.Name[4].Data[sliding_controller2_B.k] =
        f[sliding_controller2_B.k];
    }

    sliding_controller2_B.msg.Name[4].Data_SL_Info.CurrentLength = 12U;
    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 13;
         sliding_controller2_B.k++) {
      sliding_controller2_B.msg.Name[5].Data[sliding_controller2_B.k] =
        g[sliding_controller2_B.k];
    }

    sliding_controller2_B.msg.Name[5].Data_SL_Info.CurrentLength = 13U;
    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 8;
         sliding_controller2_B.k++) {
      sliding_controller2_B.msg.Name[6].Data[sliding_controller2_B.k] =
        h[sliding_controller2_B.k];
    }

    sliding_controller2_B.msg.Name[6].Data_SL_Info.CurrentLength = 8U;

    /* End of MATLAB Function: '<Root>/exo msg' */

    /* Outputs for Atomic SubSystem: '<Root>/Subscribe' */
    /* MATLABSystem: '<S9>/SourceBlock' */
    sliding_controller2_B.SourceBlock_o1 =
      Sub_sliding_controller2_35.getLatestMessage
      (&sliding_controller2_B.b_varargout_2_k);

    /* Outputs for Enabled SubSystem: '<S9>/Enabled Subsystem' incorporates:
     *  EnablePort: '<S44>/Enable'
     */
    if (sliding_controller2_B.SourceBlock_o1) {
      /* Inport: '<S44>/In1' incorporates:
       *  MATLABSystem: '<S9>/SourceBlock'
       */
      sliding_controller2_B.In1_a = sliding_controller2_B.b_varargout_2_k;
    }

    /* End of Outputs for SubSystem: '<S9>/Enabled Subsystem' */
    /* End of Outputs for SubSystem: '<Root>/Subscribe' */

    /* MATLAB Function: '<Root>/human msg' incorporates:
     *  Constant: '<S2>/Constant'
     */
    sliding_controller2_B.msg_m = sliding_controller2_P.Constant_Value_d;
    sliding_controller2_B.msg_m.Name_SL_Info.CurrentLength = 6U;
    sliding_controller2_B.msg_m.Effort_SL_Info.CurrentLength = 6U;
    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 12;
         sliding_controller2_B.k++) {
      sliding_controller2_B.msg_m.Name[0].Data[sliding_controller2_B.k] =
        b_0[sliding_controller2_B.k];
    }

    sliding_controller2_B.msg_m.Name[0].Data_SL_Info.CurrentLength = 12U;
    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 13;
         sliding_controller2_B.k++) {
      sliding_controller2_B.msg_m.Name[1].Data[sliding_controller2_B.k] =
        c_0[sliding_controller2_B.k];
    }

    sliding_controller2_B.msg_m.Name[1].Data_SL_Info.CurrentLength = 13U;
    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 14;
         sliding_controller2_B.k++) {
      sliding_controller2_B.msg_m.Name[2].Data[sliding_controller2_B.k] =
        d_0[sliding_controller2_B.k];
    }

    sliding_controller2_B.msg_m.Name[2].Data_SL_Info.CurrentLength = 14U;
    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 13;
         sliding_controller2_B.k++) {
      sliding_controller2_B.msg_m.Name[3].Data[sliding_controller2_B.k] =
        e_0[sliding_controller2_B.k];
    }

    sliding_controller2_B.msg_m.Name[3].Data_SL_Info.CurrentLength = 13U;
    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 14;
         sliding_controller2_B.k++) {
      sliding_controller2_B.msg_m.Name[4].Data[sliding_controller2_B.k] =
        f_0[sliding_controller2_B.k];
    }

    sliding_controller2_B.msg_m.Name[4].Data_SL_Info.CurrentLength = 14U;
    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 15;
         sliding_controller2_B.k++) {
      sliding_controller2_B.msg_m.Name[5].Data[sliding_controller2_B.k] =
        g_0[sliding_controller2_B.k];
    }

    sliding_controller2_B.msg_m.Name[5].Data_SL_Info.CurrentLength = 15U;

    /* End of MATLAB Function: '<Root>/human msg' */

    /* Outputs for Atomic SubSystem: '<Root>/Subscribe1' */
    /* MATLABSystem: '<S10>/SourceBlock' */
    sliding_control_SystemCore_step(&rtb_SourceBlock_o1_h,
      &sliding_controller2_B.SourceBlock_o2_k.Header.Seq,
      &sliding_controller2_B.SourceBlock_o2_k.Header.Stamp.Sec,
      &sliding_controller2_B.SourceBlock_o2_k.Header.Stamp.Nsec,
      sliding_controller2_B.SourceBlock_o2_k.Header.FrameId,
      &sliding_controller2_B.SourceBlock_o2_k.Header.FrameId_SL_Info.CurrentLength,
      &sliding_controller2_B.SourceBlock_o2_k.Header.FrameId_SL_Info.ReceivedLength,
      sliding_controller2_B.SourceBlock_o2_k.Name,
      &sliding_controller2_B.SourceBlock_o2_k.Name_SL_Info.CurrentLength,
      &sliding_controller2_B.SourceBlock_o2_k.Name_SL_Info.ReceivedLength,
      sliding_controller2_B.SourceBlock_o2_k.Position,
      &sliding_controller2_B.SourceBlock_o2_k.Position_SL_Info.CurrentLength,
      &sliding_controller2_B.SourceBlock_o2_k.Position_SL_Info.ReceivedLength,
      sliding_controller2_B.SourceBlock_o2_k.Velocity,
      &sliding_controller2_B.SourceBlock_o2_k.Velocity_SL_Info.CurrentLength,
      &sliding_controller2_B.SourceBlock_o2_k.Velocity_SL_Info.ReceivedLength,
      sliding_controller2_B.SourceBlock_o2_k.Effort,
      &sliding_controller2_B.SourceBlock_o2_k.Effort_SL_Info);

    /* Outputs for Enabled SubSystem: '<S10>/Enabled Subsystem' */
    sliding_contro_EnabledSubsystem(rtb_SourceBlock_o1_h,
      &sliding_controller2_B.SourceBlock_o2_k,
      &sliding_controller2_B.EnabledSubsystem_l);

    /* End of Outputs for SubSystem: '<S10>/Enabled Subsystem' */
    /* End of Outputs for SubSystem: '<Root>/Subscribe1' */

    /* Outputs for Enabled SubSystem: '<Root>/Enabled Subsystem1' incorporates:
     *  EnablePort: '<S6>/Enable'
     */
    if (sliding_controller2_B.SourceBlock_o1) {
      /* Inport: '<S6>/In1' */
      sliding_controller2_B.In1_j = sliding_controller2_B.EnabledSubsystem_l.In1;
    }

    /* End of Outputs for SubSystem: '<Root>/Enabled Subsystem1' */

    /* Outputs for Atomic SubSystem: '<Root>/Subscribe2' */
    /* MATLABSystem: '<S11>/SourceBlock' */
    sliding_contr_SystemCore_step_k(&rtb_SourceBlock_o1,
      &sliding_controller2_B.SourceBlock_o2.Header.Seq,
      &sliding_controller2_B.SourceBlock_o2.Header.Stamp.Sec,
      &sliding_controller2_B.SourceBlock_o2.Header.Stamp.Nsec,
      sliding_controller2_B.SourceBlock_o2.Header.FrameId,
      &sliding_controller2_B.SourceBlock_o2.Header.FrameId_SL_Info.CurrentLength,
      &sliding_controller2_B.SourceBlock_o2.Header.FrameId_SL_Info.ReceivedLength,
      sliding_controller2_B.SourceBlock_o2.Name,
      &sliding_controller2_B.SourceBlock_o2.Name_SL_Info.CurrentLength,
      &sliding_controller2_B.SourceBlock_o2.Name_SL_Info.ReceivedLength,
      sliding_controller2_B.SourceBlock_o2.Position,
      &sliding_controller2_B.SourceBlock_o2.Position_SL_Info.CurrentLength,
      &sliding_controller2_B.SourceBlock_o2.Position_SL_Info.ReceivedLength,
      sliding_controller2_B.SourceBlock_o2.Velocity,
      &sliding_controller2_B.SourceBlock_o2.Velocity_SL_Info.CurrentLength,
      &sliding_controller2_B.SourceBlock_o2.Velocity_SL_Info.ReceivedLength,
      sliding_controller2_B.SourceBlock_o2.Effort,
      &sliding_controller2_B.SourceBlock_o2.Effort_SL_Info);

    /* Outputs for Enabled SubSystem: '<S11>/Enabled Subsystem' */
    sliding_contro_EnabledSubsystem(rtb_SourceBlock_o1,
      &sliding_controller2_B.SourceBlock_o2,
      &sliding_controller2_B.EnabledSubsystem_i);

    /* End of Outputs for SubSystem: '<S11>/Enabled Subsystem' */
    /* End of Outputs for SubSystem: '<Root>/Subscribe2' */

    /* Outputs for Enabled SubSystem: '<Root>/Enabled Subsystem2' incorporates:
     *  EnablePort: '<S7>/Enable'
     */
    if (sliding_controller2_B.SourceBlock_o1) {
      /* Inport: '<S7>/In1' */
      sliding_controller2_B.In1 = sliding_controller2_B.EnabledSubsystem_i.In1;
    }

    /* End of Outputs for SubSystem: '<Root>/Enabled Subsystem2' */

    /* MATLAB Function: '<Root>/MATLAB Function - String Array Assign' incorporates:
     *  Constant: '<S3>/Constant'
     */
    sliding_controller2_B.msg_o = sliding_controller2_P.Constant_Value_e;
    sliding_controller2_B.msg_o.ModelName_SL_Info.CurrentLength = 3U;
    sliding_controller2_B.msg_o.ModelName = 111U;
    sliding_controller2_B.msg_o.Q_SL_Info.CurrentLength = 7U;
    sliding_controller2_B.msg_o.Qd_SL_Info.CurrentLength = 7U;
    sliding_controller2_B.msg_o.Qdd_SL_Info.CurrentLength = 7U;

    /* Outputs for Enabled SubSystem: '<Root>/Controller' incorporates:
     *  EnablePort: '<S4>/Enable'
     */
    if (rtmIsMajorTimeStep(sliding_controller2_M)) {
      sliding_controller2_DW.Controller_MODE =
        sliding_controller2_B.SourceBlock_o1;
    }

    /* End of Outputs for SubSystem: '<Root>/Controller' */
  }

  /* Outputs for Enabled SubSystem: '<Root>/Controller' incorporates:
   *  EnablePort: '<S4>/Enable'
   */
  if (sliding_controller2_DW.Controller_MODE) {
    if (rtmIsMajorTimeStep(sliding_controller2_M)) {
      /* MATLAB Function: '<S34>/MATLAB Function' */
      sliding_controll_MATLABFunction(&sliding_controller2_B.In1_j.Position[3],
        &sliding_controller2_B.sf_MATLABFunction_p);

      /* MATLAB Function: '<S14>/exo right' */
      sliding_controller2_exoleft(&sliding_controller2_B.In1_j.Position[3],
        &sliding_controller2_B.In1_j.Velocity[3],
        &sliding_controller2_B.sf_exoright);

      /* MATLAB Function: '<S14>/human right' */
      sliding_controller2_exoleft(&sliding_controller2_B.In1.Position[3],
        &sliding_controller2_B.In1.Velocity[3],
        &sliding_controller2_B.sf_humanright);

      /* Sum: '<S27>/Subtract' */
      sliding_controller2_B.rtb_Add_m_idx_1 =
        sliding_controller2_B.sf_exoright.knee[0] -
        sliding_controller2_B.sf_humanright.knee[0];
      sliding_controller2_B.unnamed_idx_1 =
        sliding_controller2_B.sf_exoright.knee[1] -
        sliding_controller2_B.sf_humanright.knee[1];

      /* Sum: '<S27>/Subtract1' */
      sliding_controller2_B.wj = sliding_controller2_B.sf_exoright.dknee[0] -
        sliding_controller2_B.sf_humanright.dknee[0];
      sliding_controller2_B.unnamed_idx_1_p =
        sliding_controller2_B.sf_exoright.dknee[1] -
        sliding_controller2_B.sf_humanright.dknee[1];

      /* Sum: '<S27>/Subtract2' incorporates:
       *  Gain: '<S27>/Gain3'
       *  Gain: '<S27>/Gain4'
       */
      sliding_controller2_B.rtb_Subtract2_idx_0 = (sliding_controller2_P.spring
        [0] * sliding_controller2_B.rtb_Add_m_idx_1 +
        sliding_controller2_P.spring[2] * sliding_controller2_B.unnamed_idx_1) +
        (sliding_controller2_P.dampener[0] * sliding_controller2_B.wj +
         sliding_controller2_P.dampener[2] *
         sliding_controller2_B.unnamed_idx_1_p);
      sliding_controller2_B.rtb_Subtract2_idx_1 = (sliding_controller2_P.spring
        [1] * sliding_controller2_B.rtb_Add_m_idx_1 +
        sliding_controller2_P.spring[3] * sliding_controller2_B.unnamed_idx_1) +
        (sliding_controller2_P.dampener[1] * sliding_controller2_B.wj +
         sliding_controller2_P.dampener[3] *
         sliding_controller2_B.unnamed_idx_1_p);

      /* MATLAB Function: '<S34>/MATLAB Function1' */
      sliding_control_MATLABFunction1(&sliding_controller2_B.In1_j.Position[3],
        &sliding_controller2_B.sf_MATLABFunction1_j);

      /* Sum: '<S26>/Subtract' */
      sliding_controller2_B.rtb_Add_m_idx_1 =
        sliding_controller2_B.sf_exoright.ankle[0] -
        sliding_controller2_B.sf_humanright.ankle[0];
      sliding_controller2_B.unnamed_idx_1 =
        sliding_controller2_B.sf_exoright.ankle[1] -
        sliding_controller2_B.sf_humanright.ankle[1];

      /* Sum: '<S26>/Subtract1' */
      sliding_controller2_B.wj = sliding_controller2_B.sf_exoright.danke[0] -
        sliding_controller2_B.sf_humanright.danke[0];
      sliding_controller2_B.unnamed_idx_1_p =
        sliding_controller2_B.sf_exoright.danke[1] -
        sliding_controller2_B.sf_humanright.danke[1];

      /* Sum: '<S26>/Subtract2' incorporates:
       *  Gain: '<S26>/Gain3'
       *  Gain: '<S26>/Gain4'
       */
      sliding_controller2_B.rtb_Subtract2_l_idx_0 =
        (sliding_controller2_P.spring[0] * sliding_controller2_B.rtb_Add_m_idx_1
         + sliding_controller2_P.spring[2] * sliding_controller2_B.unnamed_idx_1)
        + (sliding_controller2_P.dampener[0] * sliding_controller2_B.wj +
           sliding_controller2_P.dampener[2] *
           sliding_controller2_B.unnamed_idx_1_p);
      sliding_controller2_B.rtb_Subtract2_l_idx_1 =
        (sliding_controller2_P.spring[1] * sliding_controller2_B.rtb_Add_m_idx_1
         + sliding_controller2_P.spring[3] * sliding_controller2_B.unnamed_idx_1)
        + (sliding_controller2_P.dampener[1] * sliding_controller2_B.wj +
           sliding_controller2_P.dampener[3] *
           sliding_controller2_B.unnamed_idx_1_p);

      /* Sum: '<S34>/Add' incorporates:
       *  Math: '<S34>/Transpose1'
       *  Math: '<S34>/Transpose2'
       *  Product: '<S34>/Product1'
       *  Product: '<S34>/Product2'
       */
      sliding_controller2_B.Add[0] =
        (sliding_controller2_B.sf_MATLABFunction_p.y[0] *
         sliding_controller2_B.rtb_Subtract2_idx_0 +
         sliding_controller2_B.sf_MATLABFunction_p.y[1] *
         sliding_controller2_B.rtb_Subtract2_idx_1) +
        (sliding_controller2_B.sf_MATLABFunction1_j.y[0] *
         sliding_controller2_B.rtb_Subtract2_l_idx_0 +
         sliding_controller2_B.sf_MATLABFunction1_j.y[1] *
         sliding_controller2_B.rtb_Subtract2_l_idx_1);
      sliding_controller2_B.Add[1] =
        (sliding_controller2_B.sf_MATLABFunction_p.y[2] *
         sliding_controller2_B.rtb_Subtract2_idx_0 +
         sliding_controller2_B.sf_MATLABFunction_p.y[3] *
         sliding_controller2_B.rtb_Subtract2_idx_1) +
        (sliding_controller2_B.sf_MATLABFunction1_j.y[2] *
         sliding_controller2_B.rtb_Subtract2_l_idx_0 +
         sliding_controller2_B.sf_MATLABFunction1_j.y[3] *
         sliding_controller2_B.rtb_Subtract2_l_idx_1);

      /* MATLAB Function: '<S35>/MATLAB Function' */
      sliding_controll_MATLABFunction(&sliding_controller2_B.In1_j.Position[0],
        &sliding_controller2_B.sf_MATLABFunction_a);

      /* MATLAB Function: '<S14>/exo left' */
      sliding_controller2_exoleft(&sliding_controller2_B.In1_j.Position[0],
        &sliding_controller2_B.In1_j.Velocity[0],
        &sliding_controller2_B.sf_exoleft);

      /* MATLAB Function: '<S14>/human left' */
      sliding_controller2_exoleft(&sliding_controller2_B.In1.Position[0],
        &sliding_controller2_B.In1.Velocity[0],
        &sliding_controller2_B.sf_humanleft);

      /* Sum: '<S25>/Subtract' */
      sliding_controller2_B.rtb_Add_m_idx_1 =
        sliding_controller2_B.sf_exoleft.knee[0] -
        sliding_controller2_B.sf_humanleft.knee[0];
      sliding_controller2_B.unnamed_idx_1 =
        sliding_controller2_B.sf_exoleft.knee[1] -
        sliding_controller2_B.sf_humanleft.knee[1];

      /* Sum: '<S25>/Subtract1' */
      sliding_controller2_B.wj = sliding_controller2_B.sf_exoleft.dknee[0] -
        sliding_controller2_B.sf_humanleft.dknee[0];
      sliding_controller2_B.unnamed_idx_1_p =
        sliding_controller2_B.sf_exoleft.dknee[1] -
        sliding_controller2_B.sf_humanleft.dknee[1];

      /* Sum: '<S25>/Subtract2' incorporates:
       *  Gain: '<S25>/Gain3'
       *  Gain: '<S25>/Gain4'
       */
      sliding_controller2_B.rtb_Product2_i_idx_0 =
        (sliding_controller2_P.spring[0] * sliding_controller2_B.rtb_Add_m_idx_1
         + sliding_controller2_P.spring[2] * sliding_controller2_B.unnamed_idx_1)
        + (sliding_controller2_P.dampener[0] * sliding_controller2_B.wj +
           sliding_controller2_P.dampener[2] *
           sliding_controller2_B.unnamed_idx_1_p);
      sliding_controller2_B.rtb_Product2_i_idx_1 =
        (sliding_controller2_P.spring[1] * sliding_controller2_B.rtb_Add_m_idx_1
         + sliding_controller2_P.spring[3] * sliding_controller2_B.unnamed_idx_1)
        + (sliding_controller2_P.dampener[1] * sliding_controller2_B.wj +
           sliding_controller2_P.dampener[3] *
           sliding_controller2_B.unnamed_idx_1_p);

      /* MATLAB Function: '<S35>/MATLAB Function1' */
      sliding_control_MATLABFunction1(&sliding_controller2_B.In1_j.Position[0],
        &sliding_controller2_B.sf_MATLABFunction1_je);

      /* Sum: '<S24>/Subtract' */
      sliding_controller2_B.rtb_Add_m_idx_1 =
        sliding_controller2_B.sf_exoleft.ankle[0] -
        sliding_controller2_B.sf_humanleft.ankle[0];
      sliding_controller2_B.unnamed_idx_1 =
        sliding_controller2_B.sf_exoleft.ankle[1] -
        sliding_controller2_B.sf_humanleft.ankle[1];

      /* Sum: '<S24>/Subtract1' */
      sliding_controller2_B.wj = sliding_controller2_B.sf_exoleft.danke[0] -
        sliding_controller2_B.sf_humanleft.danke[0];
      sliding_controller2_B.unnamed_idx_1_p =
        sliding_controller2_B.sf_exoleft.danke[1] -
        sliding_controller2_B.sf_humanleft.danke[1];

      /* Sum: '<S24>/Subtract2' incorporates:
       *  Gain: '<S24>/Gain3'
       *  Gain: '<S24>/Gain4'
       */
      sliding_controller2_B.rtb_Add_m_idx_0 = (sliding_controller2_P.spring[0] *
        sliding_controller2_B.rtb_Add_m_idx_1 + sliding_controller2_P.spring[2] *
        sliding_controller2_B.unnamed_idx_1) + (sliding_controller2_P.dampener[0]
        * sliding_controller2_B.wj + sliding_controller2_P.dampener[2] *
        sliding_controller2_B.unnamed_idx_1_p);
      sliding_controller2_B.rtb_Add_m_idx_1 = (sliding_controller2_P.spring[1] *
        sliding_controller2_B.rtb_Add_m_idx_1 + sliding_controller2_P.spring[3] *
        sliding_controller2_B.unnamed_idx_1) + (sliding_controller2_P.dampener[1]
        * sliding_controller2_B.wj + sliding_controller2_P.dampener[3] *
        sliding_controller2_B.unnamed_idx_1_p);

      /* Sum: '<S17>/Sum' incorporates:
       *  Constant: '<S35>/Constant'
       */
      sliding_controller2_B.Sum[2] = sliding_controller2_B.In1_a.Other[2] -
        sliding_controller2_P.Constant_Value_p;

      /* Sum: '<S35>/Add' incorporates:
       *  Math: '<S35>/Transpose1'
       *  Math: '<S35>/Transpose2'
       *  Product: '<S35>/Product1'
       *  Product: '<S35>/Product2'
       */
      sliding_controller2_B.Add_c[0] =
        (sliding_controller2_B.sf_MATLABFunction_a.y[0] *
         sliding_controller2_B.rtb_Product2_i_idx_0 +
         sliding_controller2_B.sf_MATLABFunction_a.y[1] *
         sliding_controller2_B.rtb_Product2_i_idx_1) +
        (sliding_controller2_B.sf_MATLABFunction1_je.y[0] *
         sliding_controller2_B.rtb_Add_m_idx_0 +
         sliding_controller2_B.sf_MATLABFunction1_je.y[1] *
         sliding_controller2_B.rtb_Add_m_idx_1);

      /* Sum: '<S17>/Sum' */
      sliding_controller2_B.Sum[0] = sliding_controller2_B.In1_a.Other[0] -
        sliding_controller2_B.Add_c[0];
      sliding_controller2_B.Sum[3] = sliding_controller2_B.In1_a.Other[3] -
        sliding_controller2_B.Add[0];

      /* Sum: '<S35>/Add' incorporates:
       *  Math: '<S35>/Transpose1'
       *  Math: '<S35>/Transpose2'
       *  Product: '<S35>/Product1'
       *  Product: '<S35>/Product2'
       */
      sliding_controller2_B.Add_c[1] =
        (sliding_controller2_B.sf_MATLABFunction_a.y[2] *
         sliding_controller2_B.rtb_Product2_i_idx_0 +
         sliding_controller2_B.sf_MATLABFunction_a.y[3] *
         sliding_controller2_B.rtb_Product2_i_idx_1) +
        (sliding_controller2_B.sf_MATLABFunction1_je.y[2] *
         sliding_controller2_B.rtb_Add_m_idx_0 +
         sliding_controller2_B.sf_MATLABFunction1_je.y[3] *
         sliding_controller2_B.rtb_Add_m_idx_1);

      /* Sum: '<S17>/Sum' incorporates:
       *  Constant: '<S16>/Constant'
       *  Constant: '<S34>/Constant'
       */
      sliding_controller2_B.Sum[1] = sliding_controller2_B.In1_a.Other[1] -
        sliding_controller2_B.Add_c[1];
      sliding_controller2_B.Sum[4] = sliding_controller2_B.In1_a.Other[4] -
        sliding_controller2_B.Add[1];
      sliding_controller2_B.Sum[5] = sliding_controller2_B.In1_a.Other[5] -
        sliding_controller2_P.Constant_Value_o;
      sliding_controller2_B.Sum[6] = sliding_controller2_B.In1_a.Other[6] -
        sliding_controller2_P.Constant_Value_l;

      /* MATLAB Function: '<S17>/MATLAB Function' */
      for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
           sliding_controller2_B.k++) {
        sliding_controller2_B.unnamed_idx_1 =
          sliding_controller2_B.Sum[sliding_controller2_B.k];
        sliding_controller2_B.wj =
          sliding_controller2_B.In1_a.Qd[sliding_controller2_B.k];
        sliding_controller2_B.jpvt[sliding_controller2_B.k] =
          sliding_controller2_B.k + 1;
        sliding_controller2_B.A[sliding_controller2_B.k] =
          sliding_controller2_B.In1_a.Other[sliding_controller2_B.k];
        if (sliding_controller2_B.unnamed_idx_1 < 0.0) {
          sliding_controller2_B.Add1_i[sliding_controller2_B.k] = -1.0;
        } else if (sliding_controller2_B.unnamed_idx_1 > 0.0) {
          sliding_controller2_B.Add1_i[sliding_controller2_B.k] = 1.0;
        } else if (sliding_controller2_B.unnamed_idx_1 == 0.0) {
          sliding_controller2_B.Add1_i[sliding_controller2_B.k] = 0.0;
        } else {
          sliding_controller2_B.Add1_i[sliding_controller2_B.k] = (rtNaN);
        }

        if (sliding_controller2_B.wj < 0.0) {
          sliding_controller2_B.b_x[sliding_controller2_B.k] = -1.0;
        } else if (sliding_controller2_B.wj > 0.0) {
          sliding_controller2_B.b_x[sliding_controller2_B.k] = 1.0;
        } else if (sliding_controller2_B.wj == 0.0) {
          sliding_controller2_B.b_x[sliding_controller2_B.k] = 0.0;
        } else {
          sliding_controller2_B.b_x[sliding_controller2_B.k] = (rtNaN);
        }
      }

      sliding_controller2_B.unnamed_idx_1 = 0.0;
      sliding_controller2_qrpf(sliding_controller2_B.A, 1, 1, 7,
        &sliding_controller2_B.unnamed_idx_1, sliding_controller2_B.jpvt);
      sliding_controller2_B.rankA = 0;
      sliding_controller2_B.wj = fabs(sliding_controller2_B.A[0]);
      if (!(sliding_controller2_B.wj <= 1.5543122344752192E-14 *
            sliding_controller2_B.wj)) {
        sliding_controller2_B.rankA = 1;
      }

      for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 49;
           sliding_controller2_B.k++) {
        sliding_controller2_B.change[sliding_controller2_B.k] = 0.0;
      }

      for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
           sliding_controller2_B.k++) {
        sliding_controller2_B.B_c[sliding_controller2_B.k] =
          sliding_controller2_B.Sum[sliding_controller2_B.k];
        if (sliding_controller2_B.unnamed_idx_1 != 0.0) {
          sliding_controller2_B.wj = sliding_controller2_B.unnamed_idx_1 *
            sliding_controller2_B.B_c[sliding_controller2_B.k];
          if (sliding_controller2_B.wj != 0.0) {
            sliding_controller2_B.B_c[sliding_controller2_B.k] -=
              sliding_controller2_B.wj;
          }
        }

        if (0 <= sliding_controller2_B.rankA - 1) {
          sliding_controller2_B.change[(sliding_controller2_B.jpvt[0] + 7 *
            sliding_controller2_B.k) - 1] =
            sliding_controller2_B.B_c[sliding_controller2_B.k];
        }

        sliding_controller2_B.j = sliding_controller2_B.rankA;
        while (sliding_controller2_B.j > 0) {
          sliding_controller2_B.j = (7 * sliding_controller2_B.k +
            sliding_controller2_B.jpvt[0]) - 1;
          sliding_controller2_B.change[sliding_controller2_B.j] /=
            sliding_controller2_B.A[0];
          sliding_controller2_B.j = 0;
        }
      }

      for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
           sliding_controller2_B.k++) {
        for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 7;
             sliding_controller2_B.rankA++) {
          sliding_controller2_B.Y[sliding_controller2_B.rankA + 7 *
            sliding_controller2_B.k] = sliding_controller2_B.change[7 *
            sliding_controller2_B.rankA + sliding_controller2_B.k];
        }
      }

      for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 49;
           sliding_controller2_B.k++) {
        sliding_controller2_B.change[sliding_controller2_B.k] = fabs
          (sliding_controller2_B.Y[sliding_controller2_B.k]);
        sliding_controller2_B.K[sliding_controller2_B.k] = 0.0;
      }

      for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
           sliding_controller2_B.k++) {
        sliding_controller2_B.K[sliding_controller2_B.k + 7 *
          sliding_controller2_B.k] = 1.0;
      }

      for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 49;
           sliding_controller2_B.rankA++) {
        sliding_controller2_B.B[sliding_controller2_B.rankA] = 0.0;
      }

      for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
           sliding_controller2_B.k++) {
        sliding_controller2_B.unnamed_idx_1 =
          sliding_controller2_B.change[sliding_controller2_B.k];
        sliding_controller2_B.rankA = sliding_controller2_B.k + 7 *
          sliding_controller2_B.k;
        sliding_controller2_B.B[sliding_controller2_B.rankA] = 1.0;
        if (sliding_controller2_B.Add1_i[sliding_controller2_B.k] ==
            sliding_controller2_B.b_x[sliding_controller2_B.k]) {
          sliding_controller2_B.K[sliding_controller2_B.rankA] = (real_T)
            Kp0[sliding_controller2_B.rankA] + 3.0 *
            sliding_controller2_B.unnamed_idx_1;
          sliding_controller2_B.B[sliding_controller2_B.rankA] = (real_T)
            Kn0[sliding_controller2_B.rankA] + 0.5 *
            sliding_controller2_B.unnamed_idx_1;
        } else {
          sliding_controller2_B.wj = Kn0[sliding_controller2_B.rankA];
          sliding_controller2_B.K[sliding_controller2_B.rankA] =
            sliding_controller2_B.wj - 3.0 * sliding_controller2_B.unnamed_idx_1;
          sliding_controller2_B.B[sliding_controller2_B.rankA] =
            sliding_controller2_B.wj - 0.5 * sliding_controller2_B.unnamed_idx_1;
        }
      }

      /* End of MATLAB Function: '<S17>/MATLAB Function' */
    }

    for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 7;
         sliding_controller2_B.rankA++) {
      /* Integrator: '<S17>/Integrator' */
      sliding_controller2_B.qd_add[sliding_controller2_B.rankA] =
        sliding_controller2_X.Integrator_CSTATE[sliding_controller2_B.rankA];

      /* Product: '<S17>/Product' incorporates:
       *  Integrator: '<S17>/Integrator1'
       */
      sliding_controller2_B.A[sliding_controller2_B.rankA] = 0.0;
      for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
           sliding_controller2_B.k++) {
        sliding_controller2_B.A[sliding_controller2_B.rankA] +=
          sliding_controller2_B.K[7 * sliding_controller2_B.k +
          sliding_controller2_B.rankA] *
          sliding_controller2_X.Integrator1_CSTATE[sliding_controller2_B.k];
      }

      /* End of Product: '<S17>/Product' */

      /* Product: '<S17>/Product1' */
      sliding_controller2_B.b_x[sliding_controller2_B.rankA] = 0.0;
    }

    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
         sliding_controller2_B.k++) {
      /* Product: '<S17>/Product1' */
      for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 7;
           sliding_controller2_B.rankA++) {
        sliding_controller2_B.b_x[sliding_controller2_B.k] +=
          sliding_controller2_B.B[7 * sliding_controller2_B.rankA +
          sliding_controller2_B.k] *
          sliding_controller2_B.qd_add[sliding_controller2_B.rankA];
      }

      /* Sum: '<S17>/Sum6' incorporates:
       *  Sum: '<S17>/Add1'
       */
      sliding_controller2_B.B_c[sliding_controller2_B.k] =
        sliding_controller2_B.Sum[sliding_controller2_B.k] -
        (sliding_controller2_B.A[sliding_controller2_B.k] +
         sliding_controller2_B.b_x[sliding_controller2_B.k]);

      /* Gain: '<S17>/Gain5' */
      sliding_controller2_B.qd_add_n[sliding_controller2_B.k] = 0.0;
    }

    /* BusAssignment: '<S19>/Bus Assignment' incorporates:
     *  SignalConversion generated from: '<S19>/Bus Assignment'
     */
    sliding_controller2_B.BusAssignment = sliding_controller2_B.msg_o;
    for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 7;
         sliding_controller2_B.rankA++) {
      for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
           sliding_controller2_B.k++) {
        /* Gain: '<S17>/Gain5' */
        sliding_controller2_B.qd_add_n[sliding_controller2_B.rankA] +=
          sliding_controller2_P.invMd[7 * sliding_controller2_B.k +
          sliding_controller2_B.rankA] *
          sliding_controller2_B.B_c[sliding_controller2_B.k];
      }

      /* Sum: '<S17>/Sum2' incorporates:
       *  Sum: '<S17>/Sum8'
       */
      sliding_controller2_B.Add1_i[sliding_controller2_B.rankA] =
        sliding_controller2_B.In1_j.Velocity[sliding_controller2_B.rankA] -
        (sliding_controller2_B.qd_add[sliding_controller2_B.rankA] +
         sliding_controller2_B.In1_a.Qd[sliding_controller2_B.rankA]);

      /* BusAssignment: '<S19>/Bus Assignment' */
      sliding_controller2_B.BusAssignment.Q[sliding_controller2_B.rankA] =
        sliding_controller2_B.In1_j.Position[sliding_controller2_B.rankA];
      sliding_controller2_B.BusAssignment.Qd[sliding_controller2_B.rankA] =
        sliding_controller2_B.In1_j.Velocity[sliding_controller2_B.rankA];

      /* Sum: '<S17>/Sum1' incorporates:
       *  Integrator: '<S17>/Integrator1'
       *  Sum: '<S17>/Sum7'
       */
      sliding_controller2_B.A[sliding_controller2_B.rankA] =
        sliding_controller2_B.In1_j.Position[sliding_controller2_B.rankA] -
        (sliding_controller2_B.In1_a.Q[sliding_controller2_B.rankA] +
         sliding_controller2_X.Integrator1_CSTATE[sliding_controller2_B.rankA]);
    }

    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
         sliding_controller2_B.k++) {
      /* Sum: '<S19>/Add' incorporates:
       *  Gain: '<S19>/Gain3'
       */
      sliding_controller2_B.unnamed_idx_1 = 0.0;
      for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 7;
           sliding_controller2_B.rankA++) {
        sliding_controller2_B.unnamed_idx_1 += sliding_controller2_P.lambda2[7 *
          sliding_controller2_B.rankA + sliding_controller2_B.k] *
          sliding_controller2_B.A[sliding_controller2_B.rankA];
      }

      /* Trigonometry: '<S19>/Tanh' incorporates:
       *  Gain: '<S19>/Gain18'
       *  Gain: '<S19>/Gain3'
       *  Sum: '<S19>/Add'
       */
      sliding_controller2_B.b_x[sliding_controller2_B.k] = tanh
        ((sliding_controller2_B.unnamed_idx_1 +
          sliding_controller2_B.Add1_i[sliding_controller2_B.k]) *
         sliding_controller2_P.Gain18_Gain);
    }

    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
         sliding_controller2_B.k++) {
      /* Sum: '<S19>/Add1' */
      sliding_controller2_B.unnamed_idx_1 = 0.0;

      /* Gain: '<S19>/Gain12' */
      sliding_controller2_B.A[sliding_controller2_B.k] = 0.0;
      for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 7;
           sliding_controller2_B.rankA++) {
        /* Sum: '<S19>/Add1' incorporates:
         *  Gain: '<S19>/Gain12'
         *  Gain: '<S19>/Gain4'
         */
        sliding_controller2_B.j = 7 * sliding_controller2_B.rankA +
          sliding_controller2_B.k;
        sliding_controller2_B.unnamed_idx_1 +=
          sliding_controller2_P.rho2[sliding_controller2_B.j] *
          sliding_controller2_B.b_x[sliding_controller2_B.rankA];

        /* Gain: '<S19>/Gain12' */
        sliding_controller2_B.A[sliding_controller2_B.k] +=
          sliding_controller2_P.lambda2[sliding_controller2_B.j] *
          sliding_controller2_B.Add1_i[sliding_controller2_B.rankA];
      }

      /* BusAssignment: '<S19>/Bus Assignment' incorporates:
       *  Gain: '<S19>/Gain4'
       *  Sum: '<S19>/Add1'
       */
      sliding_controller2_B.BusAssignment.Qdd[sliding_controller2_B.k] =
        (sliding_controller2_B.In1_a.Qdd[sliding_controller2_B.k] -
         sliding_controller2_B.unnamed_idx_1) -
        sliding_controller2_B.A[sliding_controller2_B.k];
    }

    /* Outputs for Atomic SubSystem: '<S19>/Call Service' */
    /* MATLABSystem: '<S41>/ServiceCaller' */
    isCreated = ServCall_sliding_controller2_1160.getIsCreated();
    if (!isCreated) {
      for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 16;
           sliding_controller2_B.k++) {
        sliding_controller2_B.b_zeroDelimServiceName[sliding_controller2_B.k] =
          tmp[sliding_controller2_B.k];
      }

      sliding_controller2_B.b_zeroDelimServiceName[16] = '\x00';
      b_varargout_2 = ServCall_sliding_controller2_1160.createServiceCaller
        (&sliding_controller2_B.b_zeroDelimServiceName[0], false, 5.0);
      if (b_varargout_2 != SLSuccess) {
      } else {
        ServCall_sliding_controller2_1160.call
          (&sliding_controller2_B.BusAssignment,
           &sliding_controller2_B.b_varargout_1);
      }
    } else {
      ServCall_sliding_controller2_1160.call
        (&sliding_controller2_B.BusAssignment,
         &sliding_controller2_B.b_varargout_1);
    }

    /* Sum: '<S4>/Sum' incorporates:
     *  Constant: '<S35>/Constant'
     *  MATLABSystem: '<S41>/ServiceCaller'
     */
    sliding_controller2_B.unnamed_idx_1 =
      sliding_controller2_B.b_varargout_1.Tau[2] -
      sliding_controller2_P.Constant_Value_p;

    /* End of Outputs for SubSystem: '<S19>/Call Service' */

    /* Saturate: '<S4>/Saturation3' */
    if (sliding_controller2_B.unnamed_idx_1 > sliding_controller2_P.exo_sat) {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[2] = sliding_controller2_P.exo_sat;
    } else if (sliding_controller2_B.unnamed_idx_1 <
               -sliding_controller2_P.exo_sat) {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[2] = -sliding_controller2_P.exo_sat;
    } else {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[2] = sliding_controller2_B.unnamed_idx_1;
    }

    /* Outputs for Atomic SubSystem: '<S19>/Call Service' */
    /* Sum: '<S4>/Sum' incorporates:
     *  MATLABSystem: '<S41>/ServiceCaller'
     */
    sliding_controller2_B.unnamed_idx_1 =
      sliding_controller2_B.b_varargout_1.Tau[0] - sliding_controller2_B.Add_c[0];

    /* End of Outputs for SubSystem: '<S19>/Call Service' */

    /* Saturate: '<S4>/Saturation3' */
    if (sliding_controller2_B.unnamed_idx_1 > sliding_controller2_P.exo_sat) {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[0] = sliding_controller2_P.exo_sat;
    } else if (sliding_controller2_B.unnamed_idx_1 <
               -sliding_controller2_P.exo_sat) {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[0] = -sliding_controller2_P.exo_sat;
    } else {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[0] = sliding_controller2_B.unnamed_idx_1;
    }

    /* Outputs for Atomic SubSystem: '<S19>/Call Service' */
    /* Sum: '<S4>/Sum' incorporates:
     *  MATLABSystem: '<S41>/ServiceCaller'
     */
    sliding_controller2_B.unnamed_idx_1 =
      sliding_controller2_B.b_varargout_1.Tau[3] - sliding_controller2_B.Add[0];

    /* End of Outputs for SubSystem: '<S19>/Call Service' */

    /* Saturate: '<S4>/Saturation3' */
    if (sliding_controller2_B.unnamed_idx_1 > sliding_controller2_P.exo_sat) {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[3] = sliding_controller2_P.exo_sat;
    } else if (sliding_controller2_B.unnamed_idx_1 <
               -sliding_controller2_P.exo_sat) {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[3] = -sliding_controller2_P.exo_sat;
    } else {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[3] = sliding_controller2_B.unnamed_idx_1;
    }

    /* Outputs for Atomic SubSystem: '<S19>/Call Service' */
    /* Sum: '<S4>/Sum' incorporates:
     *  MATLABSystem: '<S41>/ServiceCaller'
     */
    sliding_controller2_B.unnamed_idx_1 =
      sliding_controller2_B.b_varargout_1.Tau[1] - sliding_controller2_B.Add_c[1];

    /* End of Outputs for SubSystem: '<S19>/Call Service' */

    /* Saturate: '<S4>/Saturation3' */
    if (sliding_controller2_B.unnamed_idx_1 > sliding_controller2_P.exo_sat) {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[1] = sliding_controller2_P.exo_sat;
    } else if (sliding_controller2_B.unnamed_idx_1 <
               -sliding_controller2_P.exo_sat) {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[1] = -sliding_controller2_P.exo_sat;
    } else {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[1] = sliding_controller2_B.unnamed_idx_1;
    }

    /* Outputs for Atomic SubSystem: '<S19>/Call Service' */
    /* Sum: '<S4>/Sum' incorporates:
     *  MATLABSystem: '<S41>/ServiceCaller'
     */
    sliding_controller2_B.unnamed_idx_1 =
      sliding_controller2_B.b_varargout_1.Tau[4] - sliding_controller2_B.Add[1];

    /* End of Outputs for SubSystem: '<S19>/Call Service' */

    /* Saturate: '<S4>/Saturation3' */
    if (sliding_controller2_B.unnamed_idx_1 > sliding_controller2_P.exo_sat) {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[4] = sliding_controller2_P.exo_sat;
    } else if (sliding_controller2_B.unnamed_idx_1 <
               -sliding_controller2_P.exo_sat) {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[4] = -sliding_controller2_P.exo_sat;
    } else {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[4] = sliding_controller2_B.unnamed_idx_1;
    }

    /* Outputs for Atomic SubSystem: '<S19>/Call Service' */
    /* Sum: '<S4>/Sum' incorporates:
     *  Constant: '<S34>/Constant'
     *  MATLABSystem: '<S41>/ServiceCaller'
     */
    sliding_controller2_B.unnamed_idx_1 =
      sliding_controller2_B.b_varargout_1.Tau[5] -
      sliding_controller2_P.Constant_Value_o;

    /* End of Outputs for SubSystem: '<S19>/Call Service' */

    /* Saturate: '<S4>/Saturation3' */
    if (sliding_controller2_B.unnamed_idx_1 > sliding_controller2_P.exo_sat) {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[5] = sliding_controller2_P.exo_sat;
    } else if (sliding_controller2_B.unnamed_idx_1 <
               -sliding_controller2_P.exo_sat) {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[5] = -sliding_controller2_P.exo_sat;
    } else {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[5] = sliding_controller2_B.unnamed_idx_1;
    }

    /* Outputs for Atomic SubSystem: '<S19>/Call Service' */
    /* Sum: '<S4>/Sum' incorporates:
     *  Constant: '<S16>/Constant'
     *  MATLABSystem: '<S41>/ServiceCaller'
     */
    sliding_controller2_B.unnamed_idx_1 =
      sliding_controller2_B.b_varargout_1.Tau[6] -
      sliding_controller2_P.Constant_Value_l;

    /* End of Outputs for SubSystem: '<S19>/Call Service' */

    /* Saturate: '<S4>/Saturation3' */
    if (sliding_controller2_B.unnamed_idx_1 > sliding_controller2_P.exo_sat) {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[6] = sliding_controller2_P.exo_sat;
    } else if (sliding_controller2_B.unnamed_idx_1 <
               -sliding_controller2_P.exo_sat) {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[6] = -sliding_controller2_P.exo_sat;
    } else {
      /* Saturate: '<S4>/Saturation3' */
      sliding_controller2_B.Saturation3[6] = sliding_controller2_B.unnamed_idx_1;
    }

    if (rtmIsMajorTimeStep(sliding_controller2_M)) {
      for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
           sliding_controller2_B.k++) {
        /* Sum: '<S18>/Sum3' */
        sliding_controller2_B.A[sliding_controller2_B.k] =
          sliding_controller2_B.In1_a.Q[sliding_controller2_B.k] -
          sliding_controller2_B.In1.Position[sliding_controller2_B.k];

        /* Sum: '<S18>/Sum1' */
        sliding_controller2_B.b_x[sliding_controller2_B.k] =
          sliding_controller2_B.In1_a.Qd[sliding_controller2_B.k] -
          sliding_controller2_B.In1.Velocity[sliding_controller2_B.k];

        /* Gain: '<S18>/Gain1' */
        sliding_controller2_B.B_c[sliding_controller2_B.k] = 0.0;
      }

      for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
           sliding_controller2_B.k++) {
        /* Gain: '<S18>/Gain2' */
        sliding_controller2_B.dv[sliding_controller2_B.k] = 0.0;
        for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 7;
             sliding_controller2_B.rankA++) {
          /* Gain: '<S18>/Gain1' incorporates:
           *  Gain: '<S18>/Gain2'
           */
          sliding_controller2_B.j = 7 * sliding_controller2_B.rankA +
            sliding_controller2_B.k;
          sliding_controller2_B.B_c[sliding_controller2_B.k] +=
            sliding_controller2_P.Km1[sliding_controller2_B.j] *
            sliding_controller2_B.A[sliding_controller2_B.rankA];

          /* Gain: '<S18>/Gain2' */
          sliding_controller2_B.dv[sliding_controller2_B.k] +=
            Dm1[sliding_controller2_B.j] *
            sliding_controller2_B.b_x[sliding_controller2_B.rankA];
        }

        /* Sum: '<S18>/Add2' */
        sliding_controller2_B.Add1_i[sliding_controller2_B.k] =
          sliding_controller2_B.B_c[sliding_controller2_B.k] +
          sliding_controller2_B.dv[sliding_controller2_B.k];
      }

      /* MATLAB Function: '<S28>/MATLAB Function' */
      sliding_controll_MATLABFunction(&sliding_controller2_B.In1.Position[0],
        &sliding_controller2_B.sf_MATLABFunction);

      /* MATLAB Function: '<S28>/MATLAB Function1' */
      sliding_control_MATLABFunction1(&sliding_controller2_B.In1.Position[0],
        &sliding_controller2_B.sf_MATLABFunction1);

      /* MATLAB Function: '<S29>/MATLAB Function' */
      sliding_controll_MATLABFunction(&sliding_controller2_B.In1.Position[3],
        &sliding_controller2_B.sf_MATLABFunction_o);

      /* MATLAB Function: '<S29>/MATLAB Function1' */
      sliding_control_MATLABFunction1(&sliding_controller2_B.In1.Position[3],
        &sliding_controller2_B.sf_MATLABFunction1_h);

      /* Sum: '<S4>/Sum2' incorporates:
       *  Constant: '<S15>/Constant'
       *  Constant: '<S28>/Constant'
       *  Constant: '<S29>/Constant'
       *  Math: '<S28>/Transpose1'
       *  Math: '<S28>/Transpose2'
       *  Math: '<S29>/Transpose1'
       *  Math: '<S29>/Transpose2'
       *  Product: '<S28>/Product1'
       *  Product: '<S28>/Product2'
       *  Product: '<S29>/Product1'
       *  Product: '<S29>/Product2'
       *  Sum: '<S28>/Add'
       *  Sum: '<S29>/Add'
       */
      sliding_controller2_B.A[2] = sliding_controller2_P.Constant_Value_f +
        sliding_controller2_B.Add1_i[2];
      sliding_controller2_B.A[0] = ((sliding_controller2_B.sf_MATLABFunction.y[0]
        * sliding_controller2_B.rtb_Product2_i_idx_0 +
        sliding_controller2_B.sf_MATLABFunction.y[1] *
        sliding_controller2_B.rtb_Product2_i_idx_1) +
        (sliding_controller2_B.sf_MATLABFunction1.y[0] *
         sliding_controller2_B.rtb_Add_m_idx_0 +
         sliding_controller2_B.sf_MATLABFunction1.y[1] *
         sliding_controller2_B.rtb_Add_m_idx_1)) + sliding_controller2_B.Add1_i
        [0];
      sliding_controller2_B.A[3] =
        ((sliding_controller2_B.sf_MATLABFunction_o.y[0] *
          sliding_controller2_B.rtb_Subtract2_idx_0 +
          sliding_controller2_B.sf_MATLABFunction_o.y[1] *
          sliding_controller2_B.rtb_Subtract2_idx_1) +
         (sliding_controller2_B.sf_MATLABFunction1_h.y[0] *
          sliding_controller2_B.rtb_Subtract2_l_idx_0 +
          sliding_controller2_B.sf_MATLABFunction1_h.y[1] *
          sliding_controller2_B.rtb_Subtract2_l_idx_1)) +
        sliding_controller2_B.Add1_i[3];
      sliding_controller2_B.A[1] = ((sliding_controller2_B.sf_MATLABFunction.y[2]
        * sliding_controller2_B.rtb_Product2_i_idx_0 +
        sliding_controller2_B.sf_MATLABFunction.y[3] *
        sliding_controller2_B.rtb_Product2_i_idx_1) +
        (sliding_controller2_B.sf_MATLABFunction1.y[2] *
         sliding_controller2_B.rtb_Add_m_idx_0 +
         sliding_controller2_B.sf_MATLABFunction1.y[3] *
         sliding_controller2_B.rtb_Add_m_idx_1)) + sliding_controller2_B.Add1_i
        [1];
      sliding_controller2_B.A[4] =
        ((sliding_controller2_B.sf_MATLABFunction_o.y[2] *
          sliding_controller2_B.rtb_Subtract2_idx_0 +
          sliding_controller2_B.sf_MATLABFunction_o.y[3] *
          sliding_controller2_B.rtb_Subtract2_idx_1) +
         (sliding_controller2_B.sf_MATLABFunction1_h.y[2] *
          sliding_controller2_B.rtb_Subtract2_l_idx_0 +
          sliding_controller2_B.sf_MATLABFunction1_h.y[3] *
          sliding_controller2_B.rtb_Subtract2_l_idx_1)) +
        sliding_controller2_B.Add1_i[4];
      sliding_controller2_B.A[5] = sliding_controller2_P.Constant_Value_k +
        sliding_controller2_B.Add1_i[5];
      sliding_controller2_B.A[6] = sliding_controller2_P.Constant_Value_c +
        sliding_controller2_B.Add1_i[6];
      for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
           sliding_controller2_B.k++) {
        /* Saturate: '<S4>/Saturation4' */
        sliding_controller2_B.unnamed_idx_1 =
          sliding_controller2_B.A[sliding_controller2_B.k];
        if (sliding_controller2_B.unnamed_idx_1 > sliding_controller2_P.exo_sat)
        {
          /* Saturate: '<S4>/Saturation4' */
          sliding_controller2_B.Saturation4[sliding_controller2_B.k] =
            sliding_controller2_P.exo_sat;
        } else if (sliding_controller2_B.unnamed_idx_1 <
                   -sliding_controller2_P.exo_sat) {
          /* Saturate: '<S4>/Saturation4' */
          sliding_controller2_B.Saturation4[sliding_controller2_B.k] =
            -sliding_controller2_P.exo_sat;
        } else {
          /* Saturate: '<S4>/Saturation4' */
          sliding_controller2_B.Saturation4[sliding_controller2_B.k] =
            sliding_controller2_B.unnamed_idx_1;
        }

        /* End of Saturate: '<S4>/Saturation4' */
      }
    }
  }

  /* End of Outputs for SubSystem: '<Root>/Controller' */

  /* Outputs for Enabled SubSystem: '<Root>/Enabled Subsystem' incorporates:
   *  EnablePort: '<S5>/Enable'
   */
  if (rtmIsMajorTimeStep(sliding_controller2_M) && rtmIsMajorTimeStep
      (sliding_controller2_M)) {
    sliding_controller2_DW.EnabledSubsystem_MODE =
      sliding_controller2_B.SourceBlock_o1;
  }

  if (sliding_controller2_DW.EnabledSubsystem_MODE) {
    /* BusAssignment: '<S5>/Bus Assignment1' incorporates:
     *  SignalConversion generated from: '<S5>/Bus Assignment1'
     */
    sliding_controller2_B.BusAssignment1 = sliding_controller2_B.msg;
    for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 7;
         sliding_controller2_B.rankA++) {
      sliding_controller2_B.BusAssignment1.Effort[sliding_controller2_B.rankA] =
        sliding_controller2_B.Saturation3[sliding_controller2_B.rankA];
    }

    /* End of BusAssignment: '<S5>/Bus Assignment1' */

    /* Outputs for Atomic SubSystem: '<S5>/Publish1' */
    /* MATLABSystem: '<S42>/SinkBlock' */
    Pub_sliding_controller2_1242.publish(&sliding_controller2_B.BusAssignment1);

    /* End of Outputs for SubSystem: '<S5>/Publish1' */
    if (rtmIsMajorTimeStep(sliding_controller2_M)) {
      /* BusAssignment: '<S5>/Bus Assignment2' */
      for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 7;
           sliding_controller2_B.rankA++) {
        sliding_controller2_B.msg_m.Effort[sliding_controller2_B.rankA] =
          sliding_controller2_B.Saturation4[sliding_controller2_B.rankA];
      }

      /* End of BusAssignment: '<S5>/Bus Assignment2' */

      /* Outputs for Atomic SubSystem: '<S5>/Publish2' */
      /* MATLABSystem: '<S43>/SinkBlock' */
      Pub_sliding_controller2_1246.publish(&sliding_controller2_B.msg_m);

      /* End of Outputs for SubSystem: '<S5>/Publish2' */
    }
  }

  /* End of Outputs for SubSystem: '<Root>/Enabled Subsystem' */
  if (rtmIsMajorTimeStep(sliding_controller2_M)) {
    /* Matfile logging */
    rt_UpdateTXYLogVars(sliding_controller2_M->rtwLogInfo,
                        (sliding_controller2_M->Timing.t));
  }                                    /* end MajorTimeStep */

  if (rtmIsMajorTimeStep(sliding_controller2_M)) {
    /* signal main to stop simulation */
    {                                  /* Sample time: [0.0s, 0.0s] */
      if ((rtmGetTFinal(sliding_controller2_M)!=-1) &&
          !((rtmGetTFinal(sliding_controller2_M)-
             (((sliding_controller2_M->Timing.clockTick1+
                sliding_controller2_M->Timing.clockTickH1* 4294967296.0)) * 0.02))
            > (((sliding_controller2_M->Timing.clockTick1+
                 sliding_controller2_M->Timing.clockTickH1* 4294967296.0)) *
               0.02) * (DBL_EPSILON))) {
        rtmSetErrorStatus(sliding_controller2_M, "Simulation finished");
      }
    }

    rt_ertODEUpdateContinuousStates(&sliding_controller2_M->solverInfo);

    /* Update absolute time for base rate */
    /* The "clockTick0" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick0"
     * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick0 and the high bits
     * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++sliding_controller2_M->Timing.clockTick0)) {
      ++sliding_controller2_M->Timing.clockTickH0;
    }

    sliding_controller2_M->Timing.t[0] = rtsiGetSolverStopTime
      (&sliding_controller2_M->solverInfo);

    {
      /* Update absolute timer for sample time: [0.02s, 0.0s] */
      /* The "clockTick1" counts the number of times the code of this task has
       * been executed. The resolution of this integer timer is 0.02, which is the step size
       * of the task. Size of "clockTick1" ensures timer will not overflow during the
       * application lifespan selected.
       * Timer of this task consists of two 32 bit unsigned integers.
       * The two integers represent the low bits Timing.clockTick1 and the high bits
       * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
       */
      sliding_controller2_M->Timing.clockTick1++;
      if (!sliding_controller2_M->Timing.clockTick1) {
        sliding_controller2_M->Timing.clockTickH1++;
      }
    }
  }                                    /* end MajorTimeStep */
}

/* Derivatives for root system: '<Root>' */
void sliding_controller2_derivatives(void)
{
  XDot_sliding_controller2_T *_rtXdot;
  int32_T i;
  _rtXdot = ((XDot_sliding_controller2_T *) sliding_controller2_M->derivs);

  /* Derivatives for Enabled SubSystem: '<Root>/Controller' */
  if (sliding_controller2_DW.Controller_MODE) {
    for (i = 0; i < 7; i++) {
      /* Derivatives for Integrator: '<S17>/Integrator1' */
      _rtXdot->Integrator1_CSTATE[i] = sliding_controller2_B.qd_add[i];

      /* Derivatives for Integrator: '<S17>/Integrator' */
      _rtXdot->Integrator_CSTATE[i] = sliding_controller2_B.qd_add_n[i];
    }
  } else {
    {
      real_T *dx;
      int_T i;
      dx = &(((XDot_sliding_controller2_T *) sliding_controller2_M->derivs)
             ->Integrator1_CSTATE[0]);
      for (i=0; i < 14; i++) {
        dx[i] = 0.0;
      }
    }
  }

  /* End of Derivatives for SubSystem: '<Root>/Controller' */
}

/* Model initialize function */
void sliding_controller2_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)sliding_controller2_M, 0,
                sizeof(RT_MODEL_sliding_controller2_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&sliding_controller2_M->solverInfo,
                          &sliding_controller2_M->Timing.simTimeStep);
    rtsiSetTPtr(&sliding_controller2_M->solverInfo, &rtmGetTPtr
                (sliding_controller2_M));
    rtsiSetStepSizePtr(&sliding_controller2_M->solverInfo,
                       &sliding_controller2_M->Timing.stepSize0);
    rtsiSetdXPtr(&sliding_controller2_M->solverInfo,
                 &sliding_controller2_M->derivs);
    rtsiSetContStatesPtr(&sliding_controller2_M->solverInfo, (real_T **)
                         &sliding_controller2_M->contStates);
    rtsiSetNumContStatesPtr(&sliding_controller2_M->solverInfo,
      &sliding_controller2_M->Sizes.numContStates);
    rtsiSetNumPeriodicContStatesPtr(&sliding_controller2_M->solverInfo,
      &sliding_controller2_M->Sizes.numPeriodicContStates);
    rtsiSetPeriodicContStateIndicesPtr(&sliding_controller2_M->solverInfo,
      &sliding_controller2_M->periodicContStateIndices);
    rtsiSetPeriodicContStateRangesPtr(&sliding_controller2_M->solverInfo,
      &sliding_controller2_M->periodicContStateRanges);
    rtsiSetErrorStatusPtr(&sliding_controller2_M->solverInfo,
                          (&rtmGetErrorStatus(sliding_controller2_M)));
    rtsiSetRTModelPtr(&sliding_controller2_M->solverInfo, sliding_controller2_M);
  }

  rtsiSetSimTimeStep(&sliding_controller2_M->solverInfo, MAJOR_TIME_STEP);
  sliding_controller2_M->intgData.y = sliding_controller2_M->odeY;
  sliding_controller2_M->intgData.f[0] = sliding_controller2_M->odeF[0];
  sliding_controller2_M->intgData.f[1] = sliding_controller2_M->odeF[1];
  sliding_controller2_M->intgData.f[2] = sliding_controller2_M->odeF[2];
  sliding_controller2_M->contStates = ((X_sliding_controller2_T *)
    &sliding_controller2_X);
  rtsiSetSolverData(&sliding_controller2_M->solverInfo, (void *)
                    &sliding_controller2_M->intgData);
  rtsiSetSolverName(&sliding_controller2_M->solverInfo,"ode3");
  rtmSetTPtr(sliding_controller2_M, &sliding_controller2_M->Timing.tArray[0]);
  rtmSetTFinal(sliding_controller2_M, -1);
  sliding_controller2_M->Timing.stepSize0 = 0.02;

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    rt_DataLoggingInfo.loggingInterval = (NULL);
    sliding_controller2_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(sliding_controller2_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(sliding_controller2_M->rtwLogInfo, (NULL));
    rtliSetLogT(sliding_controller2_M->rtwLogInfo, "tout");
    rtliSetLogX(sliding_controller2_M->rtwLogInfo, "");
    rtliSetLogXFinal(sliding_controller2_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(sliding_controller2_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(sliding_controller2_M->rtwLogInfo, 4);
    rtliSetLogMaxRows(sliding_controller2_M->rtwLogInfo, 0);
    rtliSetLogDecimation(sliding_controller2_M->rtwLogInfo, 1);
    rtliSetLogY(sliding_controller2_M->rtwLogInfo, "");
    rtliSetLogYSignalInfo(sliding_controller2_M->rtwLogInfo, (NULL));
    rtliSetLogYSignalPtrs(sliding_controller2_M->rtwLogInfo, (NULL));
  }

  /* block I/O */
  (void) memset(((void *) &sliding_controller2_B), 0,
                sizeof(B_sliding_controller2_T));

  {
    int32_T i;
    for (i = 0; i < 7; i++) {
      sliding_controller2_B.Sum[i] = 0.0;
    }

    for (i = 0; i < 7; i++) {
      sliding_controller2_B.qd_add[i] = 0.0;
    }

    for (i = 0; i < 7; i++) {
      sliding_controller2_B.qd_add_n[i] = 0.0;
    }

    for (i = 0; i < 7; i++) {
      sliding_controller2_B.Saturation3[i] = 0.0;
    }

    for (i = 0; i < 7; i++) {
      sliding_controller2_B.Saturation4[i] = 0.0;
    }

    for (i = 0; i < 49; i++) {
      sliding_controller2_B.K[i] = 0.0;
    }

    for (i = 0; i < 49; i++) {
      sliding_controller2_B.B[i] = 0.0;
    }

    sliding_controller2_B.msg =
      sliding_controller2_rtZSL_Bus_sliding_controller2_sensor_msgs_JointState;
    sliding_controller2_B.In1 =
      sliding_controller2_rtZSL_Bus_sliding_controller2_sensor_msgs_JointState;
    sliding_controller2_B.In1_j =
      sliding_controller2_rtZSL_Bus_sliding_controller2_sensor_msgs_JointState;
    sliding_controller2_B.In1_a =
      sliding_controller2_rtZSL_Bus_sliding_controller2_ambf_walker_DesiredJoints;
    sliding_controller2_B.msg_o =
      sliding_controller2_rtZSL_Bus_sliding_controller2_RBDLInverseDynamicsReques_b5z6ex;
    sliding_controller2_B.Add[0] = 0.0;
    sliding_controller2_B.Add[1] = 0.0;
    sliding_controller2_B.Add_c[0] = 0.0;
    sliding_controller2_B.Add_c[1] = 0.0;
    sliding_controller2_B.EnabledSubsystem_i.In1 =
      sliding_controller2_rtZSL_Bus_sliding_controller2_sensor_msgs_JointState;
    sliding_controller2_B.EnabledSubsystem_l.In1 =
      sliding_controller2_rtZSL_Bus_sliding_controller2_sensor_msgs_JointState;
    sliding_controller2_B.sf_MATLABFunction1_je.y[0] = 0.0;
    sliding_controller2_B.sf_MATLABFunction1_je.y[1] = 0.0;
    sliding_controller2_B.sf_MATLABFunction1_je.y[2] = 0.0;
    sliding_controller2_B.sf_MATLABFunction1_je.y[3] = 0.0;
    sliding_controller2_B.sf_MATLABFunction_a.y[0] = 0.0;
    sliding_controller2_B.sf_MATLABFunction_a.y[1] = 0.0;
    sliding_controller2_B.sf_MATLABFunction_a.y[2] = 0.0;
    sliding_controller2_B.sf_MATLABFunction_a.y[3] = 0.0;
    sliding_controller2_B.sf_MATLABFunction1_j.y[0] = 0.0;
    sliding_controller2_B.sf_MATLABFunction1_j.y[1] = 0.0;
    sliding_controller2_B.sf_MATLABFunction1_j.y[2] = 0.0;
    sliding_controller2_B.sf_MATLABFunction1_j.y[3] = 0.0;
    sliding_controller2_B.sf_MATLABFunction_p.y[0] = 0.0;
    sliding_controller2_B.sf_MATLABFunction_p.y[1] = 0.0;
    sliding_controller2_B.sf_MATLABFunction_p.y[2] = 0.0;
    sliding_controller2_B.sf_MATLABFunction_p.y[3] = 0.0;
    sliding_controller2_B.sf_MATLABFunction1_h.y[0] = 0.0;
    sliding_controller2_B.sf_MATLABFunction1_h.y[1] = 0.0;
    sliding_controller2_B.sf_MATLABFunction1_h.y[2] = 0.0;
    sliding_controller2_B.sf_MATLABFunction1_h.y[3] = 0.0;
    sliding_controller2_B.sf_MATLABFunction_o.y[0] = 0.0;
    sliding_controller2_B.sf_MATLABFunction_o.y[1] = 0.0;
    sliding_controller2_B.sf_MATLABFunction_o.y[2] = 0.0;
    sliding_controller2_B.sf_MATLABFunction_o.y[3] = 0.0;
    sliding_controller2_B.sf_MATLABFunction1.y[0] = 0.0;
    sliding_controller2_B.sf_MATLABFunction1.y[1] = 0.0;
    sliding_controller2_B.sf_MATLABFunction1.y[2] = 0.0;
    sliding_controller2_B.sf_MATLABFunction1.y[3] = 0.0;
    sliding_controller2_B.sf_MATLABFunction.y[0] = 0.0;
    sliding_controller2_B.sf_MATLABFunction.y[1] = 0.0;
    sliding_controller2_B.sf_MATLABFunction.y[2] = 0.0;
    sliding_controller2_B.sf_MATLABFunction.y[3] = 0.0;
    sliding_controller2_B.sf_humanright.knee[0] = 0.0;
    sliding_controller2_B.sf_humanright.knee[1] = 0.0;
    sliding_controller2_B.sf_humanright.dknee[0] = 0.0;
    sliding_controller2_B.sf_humanright.dknee[1] = 0.0;
    sliding_controller2_B.sf_humanright.ankle[0] = 0.0;
    sliding_controller2_B.sf_humanright.ankle[1] = 0.0;
    sliding_controller2_B.sf_humanright.danke[0] = 0.0;
    sliding_controller2_B.sf_humanright.danke[1] = 0.0;
    sliding_controller2_B.sf_humanleft.knee[0] = 0.0;
    sliding_controller2_B.sf_humanleft.knee[1] = 0.0;
    sliding_controller2_B.sf_humanleft.dknee[0] = 0.0;
    sliding_controller2_B.sf_humanleft.dknee[1] = 0.0;
    sliding_controller2_B.sf_humanleft.ankle[0] = 0.0;
    sliding_controller2_B.sf_humanleft.ankle[1] = 0.0;
    sliding_controller2_B.sf_humanleft.danke[0] = 0.0;
    sliding_controller2_B.sf_humanleft.danke[1] = 0.0;
    sliding_controller2_B.sf_exoright.knee[0] = 0.0;
    sliding_controller2_B.sf_exoright.knee[1] = 0.0;
    sliding_controller2_B.sf_exoright.dknee[0] = 0.0;
    sliding_controller2_B.sf_exoright.dknee[1] = 0.0;
    sliding_controller2_B.sf_exoright.ankle[0] = 0.0;
    sliding_controller2_B.sf_exoright.ankle[1] = 0.0;
    sliding_controller2_B.sf_exoright.danke[0] = 0.0;
    sliding_controller2_B.sf_exoright.danke[1] = 0.0;
    sliding_controller2_B.sf_exoleft.knee[0] = 0.0;
    sliding_controller2_B.sf_exoleft.knee[1] = 0.0;
    sliding_controller2_B.sf_exoleft.dknee[0] = 0.0;
    sliding_controller2_B.sf_exoleft.dknee[1] = 0.0;
    sliding_controller2_B.sf_exoleft.ankle[0] = 0.0;
    sliding_controller2_B.sf_exoleft.ankle[1] = 0.0;
    sliding_controller2_B.sf_exoleft.danke[0] = 0.0;
    sliding_controller2_B.sf_exoleft.danke[1] = 0.0;
  }

  /* states (continuous) */
  {
    (void) memset((void *)&sliding_controller2_X, 0,
                  sizeof(X_sliding_controller2_T));
  }

  /* states (dwork) */
  (void) memset((void *)&sliding_controller2_DW, 0,
                sizeof(DW_sliding_controller2_T));

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(sliding_controller2_M->rtwLogInfo, 0.0,
    rtmGetTFinal(sliding_controller2_M), sliding_controller2_M->Timing.stepSize0,
    (&rtmGetErrorStatus(sliding_controller2_M)));

  {
    int32_T i;
    char_T b_zeroDelimTopic_0[24];
    char_T b_zeroDelimTopic_1[18];
    char_T b_zeroDelimTopic[16];
    static const char_T tmp[23] = { '/', 'e', 'x', 'o', 's', 'i', 'm', 'u', 'l',
      'i', 'n', 'k', '_', 's', 'e', 't', '_', 'p', 'o', 'i', 'n', 't', 's' };

    static const char_T tmp_0[15] = { '/', 'e', 'x', 'o', '_', 'j', 'o', 'i',
      'n', 't', 's', 't', 'a', 't', 'e' };

    static const char_T tmp_1[17] = { '/', 'h', 'u', 'm', 'a', 'n', '_', 'j',
      'o', 'i', 'n', 't', 's', 't', 'a', 't', 'e' };

    static const char_T tmp_2[24] = { '/', 'e', 'x', 'o', '_', 's', 'i', 'm',
      'u', 'l', 'i', 'n', 'k', '_', 'j', 'o', 'i', 'n', 't', 's', 't', 'a', 't',
      'e' };

    static const char_T tmp_3[26] = { '/', 'h', 'u', 'm', 'a', 'n', '_', 's',
      'i', 'm', 'u', 'l', 'i', 'n', 'k', '_', 'j', 'o', 'i', 'n', 't', 's', 't',
      'a', 't', 'e' };

    /* SystemInitialize for Atomic SubSystem: '<Root>/Subscribe' */
    /* SystemInitialize for Enabled SubSystem: '<S9>/Enabled Subsystem' */
    /* SystemInitialize for Outport: '<S44>/Out1' incorporates:
     *  Inport: '<S44>/In1'
     */
    sliding_controller2_B.In1_a = sliding_controller2_P.Out1_Y0;

    /* End of SystemInitialize for SubSystem: '<S9>/Enabled Subsystem' */

    /* Start for MATLABSystem: '<S9>/SourceBlock' */
    sliding_controller2_DW.obj_g.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.objisempty_o = true;
    sliding_controller2_DW.obj_g.isInitialized = 1;
    for (i = 0; i < 23; i++) {
      b_zeroDelimTopic_0[i] = tmp[i];
    }

    b_zeroDelimTopic_0[23] = '\x00';
    Sub_sliding_controller2_35.createSubscriber(&b_zeroDelimTopic_0[0], 1);
    sliding_controller2_DW.obj_g.isSetupComplete = true;

    /* End of Start for MATLABSystem: '<S9>/SourceBlock' */
    /* End of SystemInitialize for SubSystem: '<Root>/Subscribe' */

    /* SystemInitialize for Atomic SubSystem: '<Root>/Subscribe1' */
    /* SystemInitialize for Enabled SubSystem: '<S10>/Enabled Subsystem' */
    sliding_c_EnabledSubsystem_Init(&sliding_controller2_B.EnabledSubsystem_l,
      &sliding_controller2_P.EnabledSubsystem_l);

    /* End of SystemInitialize for SubSystem: '<S10>/Enabled Subsystem' */

    /* Start for MATLABSystem: '<S10>/SourceBlock' */
    sliding_controller2_DW.obj_c.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.objisempty_n = true;
    sliding_controller2_DW.obj_c.isInitialized = 1;
    for (i = 0; i < 15; i++) {
      b_zeroDelimTopic[i] = tmp_0[i];
    }

    b_zeroDelimTopic[15] = '\x00';
    Sub_sliding_controller2_1262.createSubscriber(&b_zeroDelimTopic[0], 1);
    sliding_controller2_DW.obj_c.isSetupComplete = true;

    /* End of Start for MATLABSystem: '<S10>/SourceBlock' */
    /* End of SystemInitialize for SubSystem: '<Root>/Subscribe1' */

    /* SystemInitialize for Enabled SubSystem: '<Root>/Enabled Subsystem1' */
    /* SystemInitialize for Outport: '<S6>/exo' incorporates:
     *  Inport: '<S6>/In1'
     */
    sliding_controller2_B.In1_j = sliding_controller2_P.exo_Y0;

    /* End of SystemInitialize for SubSystem: '<Root>/Enabled Subsystem1' */

    /* SystemInitialize for Atomic SubSystem: '<Root>/Subscribe2' */
    /* SystemInitialize for Enabled SubSystem: '<S11>/Enabled Subsystem' */
    sliding_c_EnabledSubsystem_Init(&sliding_controller2_B.EnabledSubsystem_i,
      &sliding_controller2_P.EnabledSubsystem_i);

    /* End of SystemInitialize for SubSystem: '<S11>/Enabled Subsystem' */

    /* Start for MATLABSystem: '<S11>/SourceBlock' */
    sliding_controller2_DW.obj_h.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.objisempty = true;
    sliding_controller2_DW.obj_h.isInitialized = 1;
    for (i = 0; i < 17; i++) {
      b_zeroDelimTopic_1[i] = tmp_1[i];
    }

    b_zeroDelimTopic_1[17] = '\x00';
    Sub_sliding_controller2_1277.createSubscriber(&b_zeroDelimTopic_1[0], 1);
    sliding_controller2_DW.obj_h.isSetupComplete = true;

    /* End of Start for MATLABSystem: '<S11>/SourceBlock' */
    /* End of SystemInitialize for SubSystem: '<Root>/Subscribe2' */

    /* SystemInitialize for Enabled SubSystem: '<Root>/Enabled Subsystem2' */
    /* SystemInitialize for Outport: '<S7>/human' incorporates:
     *  Inport: '<S7>/In1'
     */
    sliding_controller2_B.In1 = sliding_controller2_P.human_Y0;

    /* End of SystemInitialize for SubSystem: '<Root>/Enabled Subsystem2' */

    /* SystemInitialize for Enabled SubSystem: '<Root>/Controller' */
    /* SystemInitialize for Atomic SubSystem: '<S19>/Call Service' */
    /* Start for MATLABSystem: '<S41>/ServiceCaller' */
    sliding_controller2_DW.obj.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.objisempty_a = true;
    sliding_controller2_DW.obj.isInitialized = 1;
    sliding_controller2_DW.obj.isSetupComplete = true;

    /* End of SystemInitialize for SubSystem: '<S19>/Call Service' */
    for (i = 0; i < 7; i++) {
      /* InitializeConditions for Integrator: '<S17>/Integrator1' */
      sliding_controller2_X.Integrator1_CSTATE[i] =
        sliding_controller2_P.Integrator1_IC[i];

      /* InitializeConditions for Integrator: '<S17>/Integrator' */
      sliding_controller2_X.Integrator_CSTATE[i] =
        sliding_controller2_P.Integrator_IC;

      /* SystemInitialize for Saturate: '<S4>/Saturation3' incorporates:
       *  Outport: '<S4>/exo tau'
       */
      sliding_controller2_B.Saturation3[i] = sliding_controller2_P.exotau_Y0;

      /* SystemInitialize for Saturate: '<S4>/Saturation4' incorporates:
       *  Outport: '<S4>/human tau'
       */
      sliding_controller2_B.Saturation4[i] = sliding_controller2_P.humantau_Y0;
    }

    /* End of SystemInitialize for SubSystem: '<Root>/Controller' */

    /* SystemInitialize for Enabled SubSystem: '<Root>/Enabled Subsystem' */
    /* SystemInitialize for Atomic SubSystem: '<S5>/Publish1' */
    /* Start for MATLABSystem: '<S42>/SinkBlock' */
    sliding_controller2_DW.obj_n.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.objisempty_c = true;
    sliding_controller2_DW.obj_n.isInitialized = 1;
    for (i = 0; i < 24; i++) {
      sliding_controller2_B.b_zeroDelimTopic_b[i] = tmp_2[i];
    }

    sliding_controller2_B.b_zeroDelimTopic_b[24] = '\x00';
    Pub_sliding_controller2_1242.createPublisher
      (&sliding_controller2_B.b_zeroDelimTopic_b[0], 1);
    sliding_controller2_DW.obj_n.isSetupComplete = true;

    /* End of Start for MATLABSystem: '<S42>/SinkBlock' */
    /* End of SystemInitialize for SubSystem: '<S5>/Publish1' */

    /* SystemInitialize for Atomic SubSystem: '<S5>/Publish2' */
    /* Start for MATLABSystem: '<S43>/SinkBlock' */
    sliding_controller2_DW.obj_m.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.objisempty_d = true;
    sliding_controller2_DW.obj_m.isInitialized = 1;
    for (i = 0; i < 26; i++) {
      sliding_controller2_B.b_zeroDelimTopic[i] = tmp_3[i];
    }

    sliding_controller2_B.b_zeroDelimTopic[26] = '\x00';
    Pub_sliding_controller2_1246.createPublisher
      (&sliding_controller2_B.b_zeroDelimTopic[0], 1);
    sliding_controller2_DW.obj_m.isSetupComplete = true;

    /* End of Start for MATLABSystem: '<S43>/SinkBlock' */
    /* End of SystemInitialize for SubSystem: '<S5>/Publish2' */
    /* End of SystemInitialize for SubSystem: '<Root>/Enabled Subsystem' */

    /* Start for MATLABSystem: '<Root>/Simulation Rate Control' */
    sliding_controller2_DW.objisempty_oz = true;

    /* set.SampleTime setter for SampleTime */
    sliding_controller2_DW.obj_k.isInitialized = 1;

    /* setupImpl Implement tasks that need to be performed only once, */
    /*  such as pre-computed constants. */
    /* resetImpl Initialize discrete-state properties. */
  }
}

/* Model terminate function */
void sliding_controller2_terminate(void)
{
  /* Terminate for Atomic SubSystem: '<Root>/Subscribe' */
  /* Terminate for MATLABSystem: '<S9>/SourceBlock' */
  if (!sliding_controller2_DW.obj_g.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_g.matlabCodegenIsDeleted = true;
  }

  /* End of Terminate for MATLABSystem: '<S9>/SourceBlock' */
  /* End of Terminate for SubSystem: '<Root>/Subscribe' */

  /* Terminate for Atomic SubSystem: '<Root>/Subscribe1' */
  /* Terminate for MATLABSystem: '<S10>/SourceBlock' */
  if (!sliding_controller2_DW.obj_c.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_c.matlabCodegenIsDeleted = true;
  }

  /* End of Terminate for MATLABSystem: '<S10>/SourceBlock' */
  /* End of Terminate for SubSystem: '<Root>/Subscribe1' */

  /* Terminate for Atomic SubSystem: '<Root>/Subscribe2' */
  /* Terminate for MATLABSystem: '<S11>/SourceBlock' */
  if (!sliding_controller2_DW.obj_h.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_h.matlabCodegenIsDeleted = true;
  }

  /* End of Terminate for MATLABSystem: '<S11>/SourceBlock' */
  /* End of Terminate for SubSystem: '<Root>/Subscribe2' */

  /* Terminate for Enabled SubSystem: '<Root>/Controller' */
  /* Terminate for Atomic SubSystem: '<S19>/Call Service' */
  /* Terminate for MATLABSystem: '<S41>/ServiceCaller' */
  if (!sliding_controller2_DW.obj.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj.matlabCodegenIsDeleted = true;
  }

  /* End of Terminate for MATLABSystem: '<S41>/ServiceCaller' */
  /* End of Terminate for SubSystem: '<S19>/Call Service' */
  /* End of Terminate for SubSystem: '<Root>/Controller' */

  /* Terminate for Enabled SubSystem: '<Root>/Enabled Subsystem' */
  /* Terminate for Atomic SubSystem: '<S5>/Publish1' */
  /* Terminate for MATLABSystem: '<S42>/SinkBlock' */
  if (!sliding_controller2_DW.obj_n.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_n.matlabCodegenIsDeleted = true;
  }

  /* End of Terminate for MATLABSystem: '<S42>/SinkBlock' */
  /* End of Terminate for SubSystem: '<S5>/Publish1' */

  /* Terminate for Atomic SubSystem: '<S5>/Publish2' */
  /* Terminate for MATLABSystem: '<S43>/SinkBlock' */
  if (!sliding_controller2_DW.obj_m.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_m.matlabCodegenIsDeleted = true;
  }

  /* End of Terminate for MATLABSystem: '<S43>/SinkBlock' */
  /* End of Terminate for SubSystem: '<S5>/Publish2' */
  /* End of Terminate for SubSystem: '<Root>/Enabled Subsystem' */
}
