/*
 * sliding_controller2.cpp
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "sliding_controller2".
 *
 * Model version              : 1.160
 * Simulink Coder version : 9.5 (R2021a) 14-Nov-2020
 * C++ source code generated on : Sat May 29 21:39:34 2021
 *
 * Target selection: ert.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Generic->Unspecified (assume 32-bit Generic)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "sliding_controller2.h"
#include "sliding_controller2_private.h"
#include "sliding_controller2_dt.h"

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
  {
    0U, 0U, 0U }
  ,                                    /* ModelName */

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
                                         * Referenced by: '<S20>/human derative gain'
                                         */

/* Block signals (default storage) */
B_sliding_controller2_T sliding_controller2_B;

/* Continuous states */
X_sliding_controller2_T sliding_controller2_X;

/* Block states (default storage) */
DW_sliding_controller2_T sliding_controller2_DW;

/* Real-time model */
RT_MODEL_sliding_controller2_T sliding_controller2_M_ =
  RT_MODEL_sliding_controller2_T();
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
  ODE3_IntgData *id = static_cast<ODE3_IntgData *>(rtsiGetSolverData(si));
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
                static_cast<uint_T>(nXc)*sizeof(real_T));

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
 *    '<S16>/exo left'
 *    '<S16>/exo right'
 *    '<S16>/human left'
 *    '<S16>/human right'
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
 *    '<S30>/MATLAB Function'
 *    '<S31>/MATLAB Function'
 *    '<S36>/MATLAB Function'
 *    '<S37>/MATLAB Function'
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
 *    '<S30>/MATLAB Function1'
 *    '<S31>/MATLAB Function1'
 *    '<S36>/MATLAB Function1'
 *    '<S37>/MATLAB Function1'
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
 *    '<S12>/Enabled Subsystem'
 *    '<S13>/Enabled Subsystem'
 */
void sliding_c_EnabledSubsystem_Init(B_EnabledSubsystem_sliding_co_T *localB,
  P_EnabledSubsystem_sliding_co_T *localP)
{
  /* SystemInitialize for Outport: '<S47>/Out1' incorporates:
   *  Inport: '<S47>/In1'
   */
  localB->In1 = localP->Out1_Y0;
}

/*
 * Output and update for enable system:
 *    '<S12>/Enabled Subsystem'
 *    '<S13>/Enabled Subsystem'
 */
void sliding_contro_EnabledSubsystem(boolean_T rtu_Enable, const
  SL_Bus_sliding_controller2_sensor_msgs_JointState *rtu_In1,
  B_EnabledSubsystem_sliding_co_T *localB, DW_EnabledSubsystem_sliding_c_T
  *localDW)
{
  /* Outputs for Enabled SubSystem: '<S12>/Enabled Subsystem' incorporates:
   *  EnablePort: '<S47>/Enable'
   */
  if (rtu_Enable) {
    /* Inport: '<S47>/In1' */
    localB->In1 = *rtu_In1;
    srUpdateBC(localDW->EnabledSubsystem_SubsysRanBC);
  }

  /* End of Outputs for SubSystem: '<S12>/Enabled Subsystem' */
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

/* Function for MATLAB Function: '<S19>/MATLAB Function' */
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

/* Function for MATLAB Function: '<S19>/MATLAB Function' */
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

  /* Reset subsysRan breadcrumbs */
  srClearBC(sliding_controller2_DW.Controller_SubsysRanBC);

  /* Reset subsysRan breadcrumbs */
  srClearBC(sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_c);

  /* Reset subsysRan breadcrumbs */
  srClearBC(sliding_controller2_DW.EnabledSubsystem1_SubsysRanBC);

  /* Reset subsysRan breadcrumbs */
  srClearBC(sliding_controller2_DW.EnabledSubsystem2_SubsysRanBC);

  /* Reset subsysRan breadcrumbs */
  srClearBC(sliding_controller2_DW.EnabledSubsystem_SubsysRanBC);

  /* Reset subsysRan breadcrumbs */
  srClearBC
    (sliding_controller2_DW.EnabledSubsystem_l.EnabledSubsystem_SubsysRanBC);

  /* BusAssignment: '<Root>/Bus Assignment' incorporates:
   *  DataTypeConversion: '<Root>/Data Type Conversion'
   *  Sin: '<Root>/Sine Wave Function'
   */
  sliding_controller2_B.BusAssignment_m.Data = static_cast<real32_T>(sin
    (sliding_controller2_P.SineWaveFunction_Freq *
     sliding_controller2_M->Timing.t[0] +
     sliding_controller2_P.SineWaveFunction_Phase) *
    sliding_controller2_P.SineWaveFunction_Amp +
    sliding_controller2_P.SineWaveFunction_Bias);

  /* Outputs for Atomic SubSystem: '<Root>/Publish' */
  /* MATLABSystem: '<S10>/SinkBlock' */
  Pub_sliding_controller2_1177.publish(&sliding_controller2_B.BusAssignment_m);

  /* End of Outputs for SubSystem: '<Root>/Publish' */
  if (rtmIsMajorTimeStep(sliding_controller2_M)) {
    /* MATLAB Function: '<Root>/exo msg' incorporates:
     *  Constant: '<S2>/Constant'
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
    /* MATLABSystem: '<S11>/SourceBlock' */
    sliding_controller2_B.SourceBlock_o1_c =
      Sub_sliding_controller2_35.getLatestMessage
      (&sliding_controller2_B.b_varargout_2_k);

    /* Outputs for Enabled SubSystem: '<S11>/Enabled Subsystem' incorporates:
     *  EnablePort: '<S46>/Enable'
     */
    if (sliding_controller2_B.SourceBlock_o1_c) {
      /* Inport: '<S46>/In1' incorporates:
       *  MATLABSystem: '<S11>/SourceBlock'
       */
      sliding_controller2_B.In1_a = sliding_controller2_B.b_varargout_2_k;
      srUpdateBC(sliding_controller2_DW.EnabledSubsystem_SubsysRanBC);
    }

    /* End of Outputs for SubSystem: '<S11>/Enabled Subsystem' */
    /* End of Outputs for SubSystem: '<Root>/Subscribe' */

    /* MATLAB Function: '<Root>/human msg' incorporates:
     *  Constant: '<S3>/Constant'
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
    /* MATLABSystem: '<S12>/SourceBlock' */
    sliding_control_SystemCore_step(&sliding_controller2_B.SourceBlock_o1_h,
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

    /* Outputs for Enabled SubSystem: '<S12>/Enabled Subsystem' */
    sliding_contro_EnabledSubsystem(sliding_controller2_B.SourceBlock_o1_h,
      &sliding_controller2_B.SourceBlock_o2_k,
      &sliding_controller2_B.EnabledSubsystem_l,
      &sliding_controller2_DW.EnabledSubsystem_l);

    /* End of Outputs for SubSystem: '<S12>/Enabled Subsystem' */
    /* End of Outputs for SubSystem: '<Root>/Subscribe1' */

    /* Outputs for Enabled SubSystem: '<Root>/Enabled Subsystem1' incorporates:
     *  EnablePort: '<S7>/Enable'
     */
    if (sliding_controller2_B.SourceBlock_o1_h) {
      /* Inport: '<S7>/In1' */
      sliding_controller2_B.In1_j = sliding_controller2_B.EnabledSubsystem_l.In1;
      if (rtmIsMajorTimeStep(sliding_controller2_M)) {
        srUpdateBC(sliding_controller2_DW.EnabledSubsystem1_SubsysRanBC);
      }
    }

    /* End of Outputs for SubSystem: '<Root>/Enabled Subsystem1' */

    /* Outputs for Atomic SubSystem: '<Root>/Subscribe2' */
    /* MATLABSystem: '<S13>/SourceBlock' */
    sliding_contr_SystemCore_step_k(&sliding_controller2_B.SourceBlock_o1,
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

    /* Outputs for Enabled SubSystem: '<S13>/Enabled Subsystem' */
    sliding_contro_EnabledSubsystem(sliding_controller2_B.SourceBlock_o1,
      &sliding_controller2_B.SourceBlock_o2,
      &sliding_controller2_B.EnabledSubsystem_i,
      &sliding_controller2_DW.EnabledSubsystem_i);

    /* End of Outputs for SubSystem: '<S13>/Enabled Subsystem' */
    /* End of Outputs for SubSystem: '<Root>/Subscribe2' */

    /* Outputs for Enabled SubSystem: '<Root>/Enabled Subsystem2' incorporates:
     *  EnablePort: '<S8>/Enable'
     */
    if (sliding_controller2_B.SourceBlock_o1) {
      /* Inport: '<S8>/In1' */
      sliding_controller2_B.In1 = sliding_controller2_B.EnabledSubsystem_i.In1;
      if (rtmIsMajorTimeStep(sliding_controller2_M)) {
        srUpdateBC(sliding_controller2_DW.EnabledSubsystem2_SubsysRanBC);
      }
    }

    /* End of Outputs for SubSystem: '<Root>/Enabled Subsystem2' */

    /* MATLAB Function: '<Root>/MATLAB Function - String Array Assign' incorporates:
     *  Constant: '<S4>/Constant'
     */
    sliding_controller2_B.msg_o = sliding_controller2_P.Constant_Value_e;
    sliding_controller2_B.msg_o.ModelName_SL_Info.CurrentLength = 3U;
    sliding_controller2_B.msg_o.ModelName[0] = 101U;
    sliding_controller2_B.msg_o.ModelName[1] = 120U;
    sliding_controller2_B.msg_o.ModelName[2] = 111U;
    sliding_controller2_B.msg_o.Q_SL_Info.CurrentLength = 7U;
    sliding_controller2_B.msg_o.Qd_SL_Info.CurrentLength = 7U;
    sliding_controller2_B.msg_o.Qdd_SL_Info.CurrentLength = 7U;

    /* Outputs for Enabled SubSystem: '<Root>/Controller' incorporates:
     *  EnablePort: '<S5>/Enable'
     */
    if (rtmIsMajorTimeStep(sliding_controller2_M)) {
      sliding_controller2_DW.Controller_MODE =
        sliding_controller2_B.SourceBlock_o1_c;
    }

    /* End of Outputs for SubSystem: '<Root>/Controller' */
  }

  /* Outputs for Enabled SubSystem: '<Root>/Controller' incorporates:
   *  EnablePort: '<S5>/Enable'
   */
  if (sliding_controller2_DW.Controller_MODE) {
    if (rtmIsMajorTimeStep(sliding_controller2_M)) {
      /* MATLAB Function: '<S36>/MATLAB Function' */
      sliding_controll_MATLABFunction(&sliding_controller2_B.In1_j.Position[3],
        &sliding_controller2_B.sf_MATLABFunction_p);

      /* MATLAB Function: '<S16>/exo right' */
      sliding_controller2_exoleft(&sliding_controller2_B.In1_j.Position[3],
        &sliding_controller2_B.In1_j.Velocity[3],
        &sliding_controller2_B.sf_exoright);

      /* MATLAB Function: '<S16>/human right' */
      sliding_controller2_exoleft(&sliding_controller2_B.In1.Position[3],
        &sliding_controller2_B.In1.Velocity[3],
        &sliding_controller2_B.sf_humanright);

      /* Sum: '<S29>/Subtract' */
      sliding_controller2_B.rtb_Add_m_idx_1 =
        sliding_controller2_B.sf_exoright.knee[0] -
        sliding_controller2_B.sf_humanright.knee[0];
      sliding_controller2_B.unnamed_idx_1 =
        sliding_controller2_B.sf_exoright.knee[1] -
        sliding_controller2_B.sf_humanright.knee[1];

      /* Sum: '<S29>/Subtract1' */
      sliding_controller2_B.wj = sliding_controller2_B.sf_exoright.dknee[0] -
        sliding_controller2_B.sf_humanright.dknee[0];
      sliding_controller2_B.unnamed_idx_1_c =
        sliding_controller2_B.sf_exoright.dknee[1] -
        sliding_controller2_B.sf_humanright.dknee[1];

      /* Sum: '<S29>/Subtract2' incorporates:
       *  Gain: '<S29>/dampener right shank'
       *  Gain: '<S29>/spring right thigh'
       */
      sliding_controller2_B.rtb_Subtract2_idx_0 = (sliding_controller2_P.spring
        [0] * sliding_controller2_B.rtb_Add_m_idx_1 +
        sliding_controller2_P.spring[2] * sliding_controller2_B.unnamed_idx_1) +
        (sliding_controller2_P.dampener[0] * sliding_controller2_B.wj +
         sliding_controller2_P.dampener[2] *
         sliding_controller2_B.unnamed_idx_1_c);
      sliding_controller2_B.rtb_Subtract2_idx_1 = (sliding_controller2_P.spring
        [1] * sliding_controller2_B.rtb_Add_m_idx_1 +
        sliding_controller2_P.spring[3] * sliding_controller2_B.unnamed_idx_1) +
        (sliding_controller2_P.dampener[1] * sliding_controller2_B.wj +
         sliding_controller2_P.dampener[3] *
         sliding_controller2_B.unnamed_idx_1_c);

      /* MATLAB Function: '<S36>/MATLAB Function1' */
      sliding_control_MATLABFunction1(&sliding_controller2_B.In1_j.Position[3],
        &sliding_controller2_B.sf_MATLABFunction1_j);

      /* Sum: '<S28>/Subtract' */
      sliding_controller2_B.rtb_Add_m_idx_1 =
        sliding_controller2_B.sf_exoright.ankle[0] -
        sliding_controller2_B.sf_humanright.ankle[0];
      sliding_controller2_B.unnamed_idx_1 =
        sliding_controller2_B.sf_exoright.ankle[1] -
        sliding_controller2_B.sf_humanright.ankle[1];

      /* Sum: '<S28>/Subtract1' */
      sliding_controller2_B.wj = sliding_controller2_B.sf_exoright.danke[0] -
        sliding_controller2_B.sf_humanright.danke[0];
      sliding_controller2_B.unnamed_idx_1_c =
        sliding_controller2_B.sf_exoright.danke[1] -
        sliding_controller2_B.sf_humanright.danke[1];

      /* Sum: '<S28>/Subtract2' incorporates:
       *  Gain: '<S28>/dampener right shank'
       *  Gain: '<S28>/spring right thigh'
       */
      sliding_controller2_B.rtb_Subtract2_l_idx_0 =
        (sliding_controller2_P.spring[0] * sliding_controller2_B.rtb_Add_m_idx_1
         + sliding_controller2_P.spring[2] * sliding_controller2_B.unnamed_idx_1)
        + (sliding_controller2_P.dampener[0] * sliding_controller2_B.wj +
           sliding_controller2_P.dampener[2] *
           sliding_controller2_B.unnamed_idx_1_c);
      sliding_controller2_B.rtb_Subtract2_l_idx_1 =
        (sliding_controller2_P.spring[1] * sliding_controller2_B.rtb_Add_m_idx_1
         + sliding_controller2_P.spring[3] * sliding_controller2_B.unnamed_idx_1)
        + (sliding_controller2_P.dampener[1] * sliding_controller2_B.wj +
           sliding_controller2_P.dampener[3] *
           sliding_controller2_B.unnamed_idx_1_c);

      /* Sum: '<S36>/Add' incorporates:
       *  Math: '<S36>/Transpose1'
       *  Math: '<S36>/Transpose2'
       *  Product: '<S36>/Product1'
       *  Product: '<S36>/Product2'
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

      /* MATLAB Function: '<S37>/MATLAB Function' */
      sliding_controll_MATLABFunction(&sliding_controller2_B.In1_j.Position[0],
        &sliding_controller2_B.sf_MATLABFunction_a);

      /* MATLAB Function: '<S16>/exo left' */
      sliding_controller2_exoleft(&sliding_controller2_B.In1_j.Position[0],
        &sliding_controller2_B.In1_j.Velocity[0],
        &sliding_controller2_B.sf_exoleft);

      /* MATLAB Function: '<S16>/human left' */
      sliding_controller2_exoleft(&sliding_controller2_B.In1.Position[0],
        &sliding_controller2_B.In1.Velocity[0],
        &sliding_controller2_B.sf_humanleft);

      /* Sum: '<S27>/Subtract' */
      sliding_controller2_B.rtb_Add_m_idx_1 =
        sliding_controller2_B.sf_exoleft.knee[0] -
        sliding_controller2_B.sf_humanleft.knee[0];
      sliding_controller2_B.unnamed_idx_1 =
        sliding_controller2_B.sf_exoleft.knee[1] -
        sliding_controller2_B.sf_humanleft.knee[1];

      /* Sum: '<S27>/Subtract1' */
      sliding_controller2_B.wj = sliding_controller2_B.sf_exoleft.dknee[0] -
        sliding_controller2_B.sf_humanleft.dknee[0];
      sliding_controller2_B.unnamed_idx_1_c =
        sliding_controller2_B.sf_exoleft.dknee[1] -
        sliding_controller2_B.sf_humanleft.dknee[1];

      /* Sum: '<S27>/Subtract2' incorporates:
       *  Gain: '<S27>/dampener left thigh'
       *  Gain: '<S27>/spring left thigh'
       */
      sliding_controller2_B.rtb_Product2_i_idx_0 =
        (sliding_controller2_P.spring[0] * sliding_controller2_B.rtb_Add_m_idx_1
         + sliding_controller2_P.spring[2] * sliding_controller2_B.unnamed_idx_1)
        + (sliding_controller2_P.dampener[0] * sliding_controller2_B.wj +
           sliding_controller2_P.dampener[2] *
           sliding_controller2_B.unnamed_idx_1_c);
      sliding_controller2_B.rtb_Product2_i_idx_1 =
        (sliding_controller2_P.spring[1] * sliding_controller2_B.rtb_Add_m_idx_1
         + sliding_controller2_P.spring[3] * sliding_controller2_B.unnamed_idx_1)
        + (sliding_controller2_P.dampener[1] * sliding_controller2_B.wj +
           sliding_controller2_P.dampener[3] *
           sliding_controller2_B.unnamed_idx_1_c);

      /* MATLAB Function: '<S37>/MATLAB Function1' */
      sliding_control_MATLABFunction1(&sliding_controller2_B.In1_j.Position[0],
        &sliding_controller2_B.sf_MATLABFunction1_je);

      /* Sum: '<S26>/Subtract' */
      sliding_controller2_B.rtb_Add_m_idx_1 =
        sliding_controller2_B.sf_exoleft.ankle[0] -
        sliding_controller2_B.sf_humanleft.ankle[0];
      sliding_controller2_B.unnamed_idx_1 =
        sliding_controller2_B.sf_exoleft.ankle[1] -
        sliding_controller2_B.sf_humanleft.ankle[1];

      /* Sum: '<S26>/Subtract1' */
      sliding_controller2_B.wj = sliding_controller2_B.sf_exoleft.danke[0] -
        sliding_controller2_B.sf_humanleft.danke[0];
      sliding_controller2_B.unnamed_idx_1_c =
        sliding_controller2_B.sf_exoleft.danke[1] -
        sliding_controller2_B.sf_humanleft.danke[1];

      /* Sum: '<S26>/Subtract2' incorporates:
       *  Gain: '<S26>/dampener left shank'
       *  Gain: '<S26>/spring left shank'
       */
      sliding_controller2_B.rtb_Add_m_idx_0 = (sliding_controller2_P.spring[0] *
        sliding_controller2_B.rtb_Add_m_idx_1 + sliding_controller2_P.spring[2] *
        sliding_controller2_B.unnamed_idx_1) + (sliding_controller2_P.dampener[0]
        * sliding_controller2_B.wj + sliding_controller2_P.dampener[2] *
        sliding_controller2_B.unnamed_idx_1_c);
      sliding_controller2_B.rtb_Add_m_idx_1 = (sliding_controller2_P.spring[1] *
        sliding_controller2_B.rtb_Add_m_idx_1 + sliding_controller2_P.spring[3] *
        sliding_controller2_B.unnamed_idx_1) + (sliding_controller2_P.dampener[1]
        * sliding_controller2_B.wj + sliding_controller2_P.dampener[3] *
        sliding_controller2_B.unnamed_idx_1_c);

      /* Sum: '<S19>/Sum' incorporates:
       *  Constant: '<S37>/Constant'
       */
      sliding_controller2_B.Sum[2] = sliding_controller2_B.In1_a.Other[2] -
        sliding_controller2_P.Constant_Value_p;

      /* Sum: '<S37>/Add' incorporates:
       *  Math: '<S37>/Transpose1'
       *  Math: '<S37>/Transpose2'
       *  Product: '<S37>/Product1'
       *  Product: '<S37>/Product2'
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

      /* Sum: '<S19>/Sum' */
      sliding_controller2_B.Sum[0] = sliding_controller2_B.In1_a.Other[0] -
        sliding_controller2_B.Add_c[0];
      sliding_controller2_B.Sum[3] = sliding_controller2_B.In1_a.Other[3] -
        sliding_controller2_B.Add[0];

      /* Sum: '<S37>/Add' incorporates:
       *  Math: '<S37>/Transpose1'
       *  Math: '<S37>/Transpose2'
       *  Product: '<S37>/Product1'
       *  Product: '<S37>/Product2'
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

      /* Sum: '<S19>/Sum' incorporates:
       *  Constant: '<S18>/Constant'
       *  Constant: '<S36>/Constant'
       */
      sliding_controller2_B.Sum[1] = sliding_controller2_B.In1_a.Other[1] -
        sliding_controller2_B.Add_c[1];
      sliding_controller2_B.Sum[4] = sliding_controller2_B.In1_a.Other[4] -
        sliding_controller2_B.Add[1];
      sliding_controller2_B.Sum[5] = sliding_controller2_B.In1_a.Other[5] -
        sliding_controller2_P.Constant_Value_ou;
      sliding_controller2_B.Sum[6] = sliding_controller2_B.In1_a.Other[6] -
        sliding_controller2_P.Constant_Value_l;

      /* MATLAB Function: '<S19>/MATLAB Function' */
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
          sliding_controller2_B.K[sliding_controller2_B.rankA] =
            static_cast<real_T>(Kp0[sliding_controller2_B.rankA]) + 3.0 *
            sliding_controller2_B.unnamed_idx_1;
          sliding_controller2_B.B[sliding_controller2_B.rankA] =
            static_cast<real_T>(Kn0[sliding_controller2_B.rankA]) + 0.5 *
            sliding_controller2_B.unnamed_idx_1;
        } else {
          sliding_controller2_B.wj = Kn0[sliding_controller2_B.rankA];
          sliding_controller2_B.K[sliding_controller2_B.rankA] =
            sliding_controller2_B.wj - 3.0 * sliding_controller2_B.unnamed_idx_1;
          sliding_controller2_B.B[sliding_controller2_B.rankA] =
            sliding_controller2_B.wj - 0.5 * sliding_controller2_B.unnamed_idx_1;
        }
      }

      /* End of MATLAB Function: '<S19>/MATLAB Function' */
    }

    for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 7;
         sliding_controller2_B.rankA++) {
      /* Integrator: '<S19>/Integrator' */
      sliding_controller2_B.qd_add[sliding_controller2_B.rankA] =
        sliding_controller2_X.Integrator_CSTATE[sliding_controller2_B.rankA];

      /* Product: '<S19>/Product' incorporates:
       *  Integrator: '<S19>/Integrator1'
       */
      sliding_controller2_B.A[sliding_controller2_B.rankA] = 0.0;
      for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
           sliding_controller2_B.k++) {
        sliding_controller2_B.A[sliding_controller2_B.rankA] +=
          sliding_controller2_B.K[7 * sliding_controller2_B.k +
          sliding_controller2_B.rankA] *
          sliding_controller2_X.Integrator1_CSTATE[sliding_controller2_B.k];
      }

      /* End of Product: '<S19>/Product' */

      /* Product: '<S19>/Product1' */
      sliding_controller2_B.b_x[sliding_controller2_B.rankA] = 0.0;
    }

    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
         sliding_controller2_B.k++) {
      /* Product: '<S19>/Product1' */
      for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 7;
           sliding_controller2_B.rankA++) {
        sliding_controller2_B.b_x[sliding_controller2_B.k] +=
          sliding_controller2_B.B[7 * sliding_controller2_B.rankA +
          sliding_controller2_B.k] *
          sliding_controller2_B.qd_add[sliding_controller2_B.rankA];
      }

      /* Sum: '<S19>/Sum6' incorporates:
       *  Sum: '<S19>/Add1'
       */
      sliding_controller2_B.B_c[sliding_controller2_B.k] =
        sliding_controller2_B.Sum[sliding_controller2_B.k] -
        (sliding_controller2_B.A[sliding_controller2_B.k] +
         sliding_controller2_B.b_x[sliding_controller2_B.k]);

      /* Gain: '<S19>/addmittance gain' */
      sliding_controller2_B.qd_add_n[sliding_controller2_B.k] = 0.0;
    }

    /* BusAssignment: '<S21>/Bus Assignment' incorporates:
     *  SignalConversion generated from: '<S21>/Bus Assignment'
     */
    sliding_controller2_B.BusAssignment = sliding_controller2_B.msg_o;
    for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 7;
         sliding_controller2_B.rankA++) {
      for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
           sliding_controller2_B.k++) {
        /* Gain: '<S19>/addmittance gain' */
        sliding_controller2_B.qd_add_n[sliding_controller2_B.rankA] +=
          sliding_controller2_P.invMd[7 * sliding_controller2_B.k +
          sliding_controller2_B.rankA] *
          sliding_controller2_B.B_c[sliding_controller2_B.k];
      }

      /* Sum: '<S19>/Sum2' incorporates:
       *  Sum: '<S19>/Sum8'
       */
      sliding_controller2_B.Add1_i[sliding_controller2_B.rankA] =
        sliding_controller2_B.In1_j.Velocity[sliding_controller2_B.rankA] -
        (sliding_controller2_B.qd_add[sliding_controller2_B.rankA] +
         sliding_controller2_B.In1_a.Qd[sliding_controller2_B.rankA]);

      /* BusAssignment: '<S21>/Bus Assignment' */
      sliding_controller2_B.BusAssignment.Q[sliding_controller2_B.rankA] =
        sliding_controller2_B.In1_j.Position[sliding_controller2_B.rankA];
      sliding_controller2_B.BusAssignment.Qd[sliding_controller2_B.rankA] =
        sliding_controller2_B.In1_j.Velocity[sliding_controller2_B.rankA];

      /* Sum: '<S19>/Sum1' incorporates:
       *  Integrator: '<S19>/Integrator1'
       *  Sum: '<S19>/Sum7'
       */
      sliding_controller2_B.A[sliding_controller2_B.rankA] =
        sliding_controller2_B.In1_j.Position[sliding_controller2_B.rankA] -
        (sliding_controller2_B.In1_a.Q[sliding_controller2_B.rankA] +
         sliding_controller2_X.Integrator1_CSTATE[sliding_controller2_B.rankA]);
    }

    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
         sliding_controller2_B.k++) {
      /* Sum: '<S21>/Add' incorporates:
       *  Gain: '<S21>/lambda SMC'
       */
      sliding_controller2_B.unnamed_idx_1 = 0.0;
      for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 7;
           sliding_controller2_B.rankA++) {
        sliding_controller2_B.unnamed_idx_1 += sliding_controller2_P.lambda2[7 *
          sliding_controller2_B.rankA + sliding_controller2_B.k] *
          sliding_controller2_B.A[sliding_controller2_B.rankA];
      }

      /* Trigonometry: '<S21>/Tanh' incorporates:
       *  Gain: '<S21>/lambda SMC'
       *  Gain: '<S21>/surface width SMC'
       *  Sum: '<S21>/Add'
       */
      sliding_controller2_B.b_x[sliding_controller2_B.k] = tanh
        ((sliding_controller2_B.unnamed_idx_1 +
          sliding_controller2_B.Add1_i[sliding_controller2_B.k]) *
         sliding_controller2_P.surfacewidthSMC_Gain);
    }

    for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
         sliding_controller2_B.k++) {
      /* Sum: '<S21>/Add1' */
      sliding_controller2_B.unnamed_idx_1 = 0.0;

      /* Gain: '<S21>/Gain12' */
      sliding_controller2_B.A[sliding_controller2_B.k] = 0.0;
      for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 7;
           sliding_controller2_B.rankA++) {
        /* Sum: '<S21>/Add1' incorporates:
         *  Gain: '<S21>/Gain12'
         *  Gain: '<S21>/rho SMC'
         */
        sliding_controller2_B.j = 7 * sliding_controller2_B.rankA +
          sliding_controller2_B.k;
        sliding_controller2_B.unnamed_idx_1 +=
          sliding_controller2_P.rho2[sliding_controller2_B.j] *
          sliding_controller2_B.b_x[sliding_controller2_B.rankA];

        /* Gain: '<S21>/Gain12' */
        sliding_controller2_B.A[sliding_controller2_B.k] +=
          sliding_controller2_P.lambda2[sliding_controller2_B.j] *
          sliding_controller2_B.Add1_i[sliding_controller2_B.rankA];
      }

      /* BusAssignment: '<S21>/Bus Assignment' incorporates:
       *  Gain: '<S21>/rho SMC'
       *  Sum: '<S21>/Add1'
       */
      sliding_controller2_B.BusAssignment.Qdd[sliding_controller2_B.k] =
        (sliding_controller2_B.In1_a.Qdd[sliding_controller2_B.k] -
         sliding_controller2_B.unnamed_idx_1) -
        sliding_controller2_B.A[sliding_controller2_B.k];
    }

    /* Outputs for Atomic SubSystem: '<S21>/Call Service' */
    /* MATLABSystem: '<S43>/ServiceCaller' */
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

    /* Sum: '<S5>/Sum' incorporates:
     *  Constant: '<S37>/Constant'
     *  MATLABSystem: '<S43>/ServiceCaller'
     */
    sliding_controller2_B.unnamed_idx_1 =
      sliding_controller2_B.b_varargout_1.Tau[2] -
      sliding_controller2_P.Constant_Value_p;

    /* End of Outputs for SubSystem: '<S21>/Call Service' */

    /* Saturate: '<S5>/exo sateration' */
    if (sliding_controller2_B.unnamed_idx_1 > sliding_controller2_P.exo_sat) {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[2] = sliding_controller2_P.exo_sat;
    } else if (sliding_controller2_B.unnamed_idx_1 <
               -sliding_controller2_P.exo_sat) {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[2] = -sliding_controller2_P.exo_sat;
    } else {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[2] =
        sliding_controller2_B.unnamed_idx_1;
    }

    /* Outputs for Atomic SubSystem: '<S21>/Call Service' */
    /* Sum: '<S5>/Sum' incorporates:
     *  MATLABSystem: '<S43>/ServiceCaller'
     */
    sliding_controller2_B.unnamed_idx_1 =
      sliding_controller2_B.b_varargout_1.Tau[0] - sliding_controller2_B.Add_c[0];

    /* End of Outputs for SubSystem: '<S21>/Call Service' */

    /* Saturate: '<S5>/exo sateration' */
    if (sliding_controller2_B.unnamed_idx_1 > sliding_controller2_P.exo_sat) {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[0] = sliding_controller2_P.exo_sat;
    } else if (sliding_controller2_B.unnamed_idx_1 <
               -sliding_controller2_P.exo_sat) {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[0] = -sliding_controller2_P.exo_sat;
    } else {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[0] =
        sliding_controller2_B.unnamed_idx_1;
    }

    /* Outputs for Atomic SubSystem: '<S21>/Call Service' */
    /* Sum: '<S5>/Sum' incorporates:
     *  MATLABSystem: '<S43>/ServiceCaller'
     */
    sliding_controller2_B.unnamed_idx_1 =
      sliding_controller2_B.b_varargout_1.Tau[3] - sliding_controller2_B.Add[0];

    /* End of Outputs for SubSystem: '<S21>/Call Service' */

    /* Saturate: '<S5>/exo sateration' */
    if (sliding_controller2_B.unnamed_idx_1 > sliding_controller2_P.exo_sat) {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[3] = sliding_controller2_P.exo_sat;
    } else if (sliding_controller2_B.unnamed_idx_1 <
               -sliding_controller2_P.exo_sat) {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[3] = -sliding_controller2_P.exo_sat;
    } else {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[3] =
        sliding_controller2_B.unnamed_idx_1;
    }

    /* Outputs for Atomic SubSystem: '<S21>/Call Service' */
    /* Sum: '<S5>/Sum' incorporates:
     *  MATLABSystem: '<S43>/ServiceCaller'
     */
    sliding_controller2_B.unnamed_idx_1 =
      sliding_controller2_B.b_varargout_1.Tau[1] - sliding_controller2_B.Add_c[1];

    /* End of Outputs for SubSystem: '<S21>/Call Service' */

    /* Saturate: '<S5>/exo sateration' */
    if (sliding_controller2_B.unnamed_idx_1 > sliding_controller2_P.exo_sat) {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[1] = sliding_controller2_P.exo_sat;
    } else if (sliding_controller2_B.unnamed_idx_1 <
               -sliding_controller2_P.exo_sat) {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[1] = -sliding_controller2_P.exo_sat;
    } else {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[1] =
        sliding_controller2_B.unnamed_idx_1;
    }

    /* Outputs for Atomic SubSystem: '<S21>/Call Service' */
    /* Sum: '<S5>/Sum' incorporates:
     *  MATLABSystem: '<S43>/ServiceCaller'
     */
    sliding_controller2_B.unnamed_idx_1 =
      sliding_controller2_B.b_varargout_1.Tau[4] - sliding_controller2_B.Add[1];

    /* End of Outputs for SubSystem: '<S21>/Call Service' */

    /* Saturate: '<S5>/exo sateration' */
    if (sliding_controller2_B.unnamed_idx_1 > sliding_controller2_P.exo_sat) {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[4] = sliding_controller2_P.exo_sat;
    } else if (sliding_controller2_B.unnamed_idx_1 <
               -sliding_controller2_P.exo_sat) {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[4] = -sliding_controller2_P.exo_sat;
    } else {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[4] =
        sliding_controller2_B.unnamed_idx_1;
    }

    /* Outputs for Atomic SubSystem: '<S21>/Call Service' */
    /* Sum: '<S5>/Sum' incorporates:
     *  Constant: '<S36>/Constant'
     *  MATLABSystem: '<S43>/ServiceCaller'
     */
    sliding_controller2_B.unnamed_idx_1 =
      sliding_controller2_B.b_varargout_1.Tau[5] -
      sliding_controller2_P.Constant_Value_ou;

    /* End of Outputs for SubSystem: '<S21>/Call Service' */

    /* Saturate: '<S5>/exo sateration' */
    if (sliding_controller2_B.unnamed_idx_1 > sliding_controller2_P.exo_sat) {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[5] = sliding_controller2_P.exo_sat;
    } else if (sliding_controller2_B.unnamed_idx_1 <
               -sliding_controller2_P.exo_sat) {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[5] = -sliding_controller2_P.exo_sat;
    } else {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[5] =
        sliding_controller2_B.unnamed_idx_1;
    }

    /* Outputs for Atomic SubSystem: '<S21>/Call Service' */
    /* Sum: '<S5>/Sum' incorporates:
     *  Constant: '<S18>/Constant'
     *  MATLABSystem: '<S43>/ServiceCaller'
     */
    sliding_controller2_B.unnamed_idx_1 =
      sliding_controller2_B.b_varargout_1.Tau[6] -
      sliding_controller2_P.Constant_Value_l;

    /* End of Outputs for SubSystem: '<S21>/Call Service' */

    /* Saturate: '<S5>/exo sateration' */
    if (sliding_controller2_B.unnamed_idx_1 > sliding_controller2_P.exo_sat) {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[6] = sliding_controller2_P.exo_sat;
    } else if (sliding_controller2_B.unnamed_idx_1 <
               -sliding_controller2_P.exo_sat) {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[6] = -sliding_controller2_P.exo_sat;
    } else {
      /* Saturate: '<S5>/exo sateration' */
      sliding_controller2_B.exosateration[6] =
        sliding_controller2_B.unnamed_idx_1;
    }

    if (rtmIsMajorTimeStep(sliding_controller2_M)) {
      for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
           sliding_controller2_B.k++) {
        /* Sum: '<S20>/Sum3' */
        sliding_controller2_B.A[sliding_controller2_B.k] =
          sliding_controller2_B.In1_a.Q[sliding_controller2_B.k] -
          sliding_controller2_B.In1.Position[sliding_controller2_B.k];

        /* Sum: '<S20>/Sum1' */
        sliding_controller2_B.b_x[sliding_controller2_B.k] =
          sliding_controller2_B.In1_a.Qd[sliding_controller2_B.k] -
          sliding_controller2_B.In1.Velocity[sliding_controller2_B.k];

        /* Gain: '<S20>/human proportional gain' */
        sliding_controller2_B.B_c[sliding_controller2_B.k] = 0.0;
      }

      for (sliding_controller2_B.k = 0; sliding_controller2_B.k < 7;
           sliding_controller2_B.k++) {
        /* Gain: '<S20>/human derative gain' */
        sliding_controller2_B.dv[sliding_controller2_B.k] = 0.0;
        for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 7;
             sliding_controller2_B.rankA++) {
          /* Gain: '<S20>/human proportional gain' incorporates:
           *  Gain: '<S20>/human derative gain'
           */
          sliding_controller2_B.j = 7 * sliding_controller2_B.rankA +
            sliding_controller2_B.k;
          sliding_controller2_B.B_c[sliding_controller2_B.k] +=
            sliding_controller2_P.Km1[sliding_controller2_B.j] *
            sliding_controller2_B.A[sliding_controller2_B.rankA];

          /* Gain: '<S20>/human derative gain' */
          sliding_controller2_B.dv[sliding_controller2_B.k] +=
            Dm1[sliding_controller2_B.j] *
            sliding_controller2_B.b_x[sliding_controller2_B.rankA];
        }

        /* Sum: '<S20>/Add2' */
        sliding_controller2_B.Add1_i[sliding_controller2_B.k] =
          sliding_controller2_B.B_c[sliding_controller2_B.k] +
          sliding_controller2_B.dv[sliding_controller2_B.k];
      }

      /* MATLAB Function: '<S30>/MATLAB Function' */
      sliding_controll_MATLABFunction(&sliding_controller2_B.In1.Position[0],
        &sliding_controller2_B.sf_MATLABFunction);

      /* MATLAB Function: '<S30>/MATLAB Function1' */
      sliding_control_MATLABFunction1(&sliding_controller2_B.In1.Position[0],
        &sliding_controller2_B.sf_MATLABFunction1);

      /* MATLAB Function: '<S31>/MATLAB Function' */
      sliding_controll_MATLABFunction(&sliding_controller2_B.In1.Position[3],
        &sliding_controller2_B.sf_MATLABFunction_o);

      /* MATLAB Function: '<S31>/MATLAB Function1' */
      sliding_control_MATLABFunction1(&sliding_controller2_B.In1.Position[3],
        &sliding_controller2_B.sf_MATLABFunction1_h);

      /* Sum: '<S5>/Sum2' incorporates:
       *  Constant: '<S17>/Constant'
       *  Constant: '<S30>/Constant'
       *  Constant: '<S31>/Constant'
       *  Math: '<S30>/Transpose1'
       *  Math: '<S30>/Transpose2'
       *  Math: '<S31>/Transpose1'
       *  Math: '<S31>/Transpose2'
       *  Product: '<S30>/Product1'
       *  Product: '<S30>/Product2'
       *  Product: '<S31>/Product1'
       *  Product: '<S31>/Product2'
       *  Sum: '<S30>/Add'
       *  Sum: '<S31>/Add'
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
        /* Saturate: '<S5>/human sateration' */
        sliding_controller2_B.unnamed_idx_1 =
          sliding_controller2_B.A[sliding_controller2_B.k];
        if (sliding_controller2_B.unnamed_idx_1 >
            sliding_controller2_P.human_sat) {
          /* Saturate: '<S5>/human sateration' */
          sliding_controller2_B.humansateration[sliding_controller2_B.k] =
            sliding_controller2_P.human_sat;
        } else if (sliding_controller2_B.unnamed_idx_1 <
                   -sliding_controller2_P.human_sat) {
          /* Saturate: '<S5>/human sateration' */
          sliding_controller2_B.humansateration[sliding_controller2_B.k] =
            -sliding_controller2_P.human_sat;
        } else {
          /* Saturate: '<S5>/human sateration' */
          sliding_controller2_B.humansateration[sliding_controller2_B.k] =
            sliding_controller2_B.unnamed_idx_1;
        }

        /* End of Saturate: '<S5>/human sateration' */
      }
    }

    if (rtmIsMajorTimeStep(sliding_controller2_M)) {
      srUpdateBC(sliding_controller2_DW.Controller_SubsysRanBC);
    }
  }

  /* End of Outputs for SubSystem: '<Root>/Controller' */

  /* Outputs for Enabled SubSystem: '<Root>/Enabled Subsystem' incorporates:
   *  EnablePort: '<S6>/Enable'
   */
  if (rtmIsMajorTimeStep(sliding_controller2_M) && rtmIsMajorTimeStep
      (sliding_controller2_M)) {
    sliding_controller2_DW.EnabledSubsystem_MODE =
      sliding_controller2_B.SourceBlock_o1_c;
  }

  if (sliding_controller2_DW.EnabledSubsystem_MODE) {
    /* BusAssignment: '<S6>/Bus Assignment1' incorporates:
     *  SignalConversion generated from: '<S6>/Bus Assignment1'
     */
    sliding_controller2_B.BusAssignment1 = sliding_controller2_B.msg;
    for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 7;
         sliding_controller2_B.rankA++) {
      sliding_controller2_B.BusAssignment1.Effort[sliding_controller2_B.rankA] =
        sliding_controller2_B.exosateration[sliding_controller2_B.rankA];
    }

    /* End of BusAssignment: '<S6>/Bus Assignment1' */

    /* Outputs for Atomic SubSystem: '<S6>/Publish1' */
    /* MATLABSystem: '<S44>/SinkBlock' */
    Pub_sliding_controller2_1242.publish(&sliding_controller2_B.BusAssignment1);

    /* End of Outputs for SubSystem: '<S6>/Publish1' */
    if (rtmIsMajorTimeStep(sliding_controller2_M)) {
      /* BusAssignment: '<S6>/Bus Assignment2' */
      for (sliding_controller2_B.rankA = 0; sliding_controller2_B.rankA < 7;
           sliding_controller2_B.rankA++) {
        sliding_controller2_B.msg_m.Effort[sliding_controller2_B.rankA] =
          sliding_controller2_B.humansateration[sliding_controller2_B.rankA];
      }

      /* End of BusAssignment: '<S6>/Bus Assignment2' */

      /* Outputs for Atomic SubSystem: '<S6>/Publish2' */
      /* MATLABSystem: '<S45>/SinkBlock' */
      Pub_sliding_controller2_1246.publish(&sliding_controller2_B.msg_m);

      /* End of Outputs for SubSystem: '<S6>/Publish2' */
    }

    if (rtmIsMajorTimeStep(sliding_controller2_M)) {
      srUpdateBC(sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_c);
    }
  }

  /* End of Outputs for SubSystem: '<Root>/Enabled Subsystem' */
  if (rtmIsMajorTimeStep(sliding_controller2_M)) {
    /* External mode */
    rtExtModeUploadCheckTrigger(2);

    {                                  /* Sample time: [0.0s, 0.0s] */
      rtExtModeUpload(0, (real_T)sliding_controller2_M->Timing.t[0]);
    }

    if (rtmIsMajorTimeStep(sliding_controller2_M)) {/* Sample time: [0.02s, 0.0s] */
      rtExtModeUpload(1, (real_T)(((sliding_controller2_M->Timing.clockTick1+
        sliding_controller2_M->Timing.clockTickH1* 4294967296.0)) * 0.02));
    }
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

      if (rtmGetStopRequested(sliding_controller2_M)) {
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
      /* Derivatives for Integrator: '<S19>/Integrator1' */
      _rtXdot->Integrator1_CSTATE[i] = sliding_controller2_B.qd_add[i];

      /* Derivatives for Integrator: '<S19>/Integrator' */
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
  rtsiSetSolverData(&sliding_controller2_M->solverInfo, static_cast<void *>
                    (&sliding_controller2_M->intgData));
  rtsiSetSolverName(&sliding_controller2_M->solverInfo,"ode3");
  rtmSetTPtr(sliding_controller2_M, &sliding_controller2_M->Timing.tArray[0]);
  rtmSetTFinal(sliding_controller2_M, -1);
  sliding_controller2_M->Timing.stepSize0 = 0.02;

  /* External mode info */
  sliding_controller2_M->Sizes.checksums[0] = (1728082948U);
  sliding_controller2_M->Sizes.checksums[1] = (4041347945U);
  sliding_controller2_M->Sizes.checksums[2] = (2363488853U);
  sliding_controller2_M->Sizes.checksums[3] = (1414351142U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[43];
    sliding_controller2_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = &rtAlwaysEnabled;
    systemRan[2] = &rtAlwaysEnabled;
    systemRan[3] = &rtAlwaysEnabled;
    systemRan[4] = &rtAlwaysEnabled;
    systemRan[5] = (sysRanDType *)&sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[6] = (sysRanDType *)&sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[7] = (sysRanDType *)&sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[8] = (sysRanDType *)&sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[9] = (sysRanDType *)&sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[10] = (sysRanDType *)
      &sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[11] = (sysRanDType *)
      &sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[12] = (sysRanDType *)
      &sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[13] = (sysRanDType *)
      &sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[14] = (sysRanDType *)
      &sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[15] = (sysRanDType *)
      &sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[16] = (sysRanDType *)
      &sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[17] = (sysRanDType *)
      &sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[18] = (sysRanDType *)
      &sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[19] = (sysRanDType *)
      &sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[20] = (sysRanDType *)
      &sliding_controller2_DW.Controller_SubsysRanBC;
    systemRan[21] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_c;
    systemRan[22] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_c;
    systemRan[23] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_c;
    systemRan[24] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_c;
    systemRan[25] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_c;
    systemRan[26] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem1_SubsysRanBC;
    systemRan[27] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem2_SubsysRanBC;
    systemRan[28] = &rtAlwaysEnabled;
    systemRan[29] = &rtAlwaysEnabled;
    systemRan[30] = &rtAlwaysEnabled;
    systemRan[31] = &rtAlwaysEnabled;
    systemRan[32] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem_SubsysRanBC;
    systemRan[33] = &rtAlwaysEnabled;
    systemRan[34] = &rtAlwaysEnabled;
    systemRan[35] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem_l.EnabledSubsystem_SubsysRanBC;
    systemRan[36] = &rtAlwaysEnabled;
    systemRan[37] = &rtAlwaysEnabled;
    systemRan[38] = (sysRanDType *)
      &sliding_controller2_DW.EnabledSubsystem_i.EnabledSubsystem_SubsysRanBC;
    systemRan[39] = &rtAlwaysEnabled;
    systemRan[40] = &rtAlwaysEnabled;
    systemRan[41] = &rtAlwaysEnabled;
    systemRan[42] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(sliding_controller2_M->extModeInfo,
      &sliding_controller2_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(sliding_controller2_M->extModeInfo,
                        sliding_controller2_M->Sizes.checksums);
    rteiSetTPtr(sliding_controller2_M->extModeInfo, rtmGetTPtr
                (sliding_controller2_M));
  }

  /* block I/O */
  (void) memset((static_cast<void *>(&sliding_controller2_B)), 0,
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
      sliding_controller2_B.exosateration[i] = 0.0;
    }

    for (i = 0; i < 7; i++) {
      sliding_controller2_B.humansateration[i] = 0.0;
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
    (void) memset(static_cast<void *>(&sliding_controller2_X), 0,
                  sizeof(X_sliding_controller2_T));
  }

  /* states (dwork) */
  (void) memset(static_cast<void *>(&sliding_controller2_DW), 0,
                sizeof(DW_sliding_controller2_T));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    sliding_controller2_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 27;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.BTransTable = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.PTransTable = &rtPTransTable;
  }

  {
    int32_T i;
    char_T b_zeroDelimTopic_1[18];
    char_T b_zeroDelimTopic_0[16];
    char_T b_zeroDelimTopic[10];
    static const char_T tmp[9] = { '/', 's', 'i', 'n', '_', 'w', 'a', 'v', 'e' };

    static const char_T tmp_0[23] = { '/', 'e', 'x', 'o', 's', 'i', 'm', 'u',
      'l', 'i', 'n', 'k', '_', 's', 'e', 't', '_', 'p', 'o', 'i', 'n', 't', 's'
    };

    static const char_T tmp_1[15] = { '/', 'e', 'x', 'o', '_', 'j', 'o', 'i',
      'n', 't', 's', 't', 'a', 't', 'e' };

    static const char_T tmp_2[17] = { '/', 'h', 'u', 'm', 'a', 'n', '_', 'j',
      'o', 'i', 'n', 't', 's', 't', 'a', 't', 'e' };

    static const char_T tmp_3[24] = { '/', 'e', 'x', 'o', '_', 's', 'i', 'm',
      'u', 'l', 'i', 'n', 'k', '_', 'j', 'o', 'i', 'n', 't', 's', 't', 'a', 't',
      'e' };

    static const char_T tmp_4[26] = { '/', 'h', 'u', 'm', 'a', 'n', '_', 's',
      'i', 'm', 'u', 'l', 'i', 'n', 'k', '_', 'j', 'o', 'i', 'n', 't', 's', 't',
      'a', 't', 'e' };

    /* Start for Atomic SubSystem: '<Root>/Publish' */
    /* Start for MATLABSystem: '<S10>/SinkBlock' */
    sliding_controller2_DW.obj_m.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.objisempty_h = true;
    sliding_controller2_DW.obj_m.isInitialized = 1;
    for (i = 0; i < 9; i++) {
      b_zeroDelimTopic[i] = tmp[i];
    }

    b_zeroDelimTopic[9] = '\x00';
    Pub_sliding_controller2_1177.createPublisher(&b_zeroDelimTopic[0], 1);
    sliding_controller2_DW.obj_m.isSetupComplete = true;

    /* End of Start for MATLABSystem: '<S10>/SinkBlock' */
    /* End of Start for SubSystem: '<Root>/Publish' */

    /* Start for Atomic SubSystem: '<Root>/Subscribe' */
    /* Start for MATLABSystem: '<S11>/SourceBlock' */
    sliding_controller2_DW.obj_g.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.objisempty_o = true;
    sliding_controller2_DW.obj_g.isInitialized = 1;
    for (i = 0; i < 23; i++) {
      sliding_controller2_B.b_zeroDelimTopic_p[i] = tmp_0[i];
    }

    sliding_controller2_B.b_zeroDelimTopic_p[23] = '\x00';
    Sub_sliding_controller2_35.createSubscriber
      (&sliding_controller2_B.b_zeroDelimTopic_p[0], 1);
    sliding_controller2_DW.obj_g.isSetupComplete = true;

    /* End of Start for MATLABSystem: '<S11>/SourceBlock' */
    /* End of Start for SubSystem: '<Root>/Subscribe' */

    /* Start for Atomic SubSystem: '<Root>/Subscribe1' */
    /* Start for MATLABSystem: '<S12>/SourceBlock' */
    sliding_controller2_DW.obj_c.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.objisempty_n = true;
    sliding_controller2_DW.obj_c.isInitialized = 1;
    for (i = 0; i < 15; i++) {
      b_zeroDelimTopic_0[i] = tmp_1[i];
    }

    b_zeroDelimTopic_0[15] = '\x00';
    Sub_sliding_controller2_1262.createSubscriber(&b_zeroDelimTopic_0[0], 1);
    sliding_controller2_DW.obj_c.isSetupComplete = true;

    /* End of Start for MATLABSystem: '<S12>/SourceBlock' */
    /* End of Start for SubSystem: '<Root>/Subscribe1' */

    /* Start for Atomic SubSystem: '<Root>/Subscribe2' */
    /* Start for MATLABSystem: '<S13>/SourceBlock' */
    sliding_controller2_DW.obj_h.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.objisempty = true;
    sliding_controller2_DW.obj_h.isInitialized = 1;
    for (i = 0; i < 17; i++) {
      b_zeroDelimTopic_1[i] = tmp_2[i];
    }

    b_zeroDelimTopic_1[17] = '\x00';
    Sub_sliding_controller2_1277.createSubscriber(&b_zeroDelimTopic_1[0], 1);
    sliding_controller2_DW.obj_h.isSetupComplete = true;

    /* End of Start for MATLABSystem: '<S13>/SourceBlock' */
    /* End of Start for SubSystem: '<Root>/Subscribe2' */

    /* Start for Enabled SubSystem: '<Root>/Controller' */
    sliding_controller2_DW.Controller_MODE = false;

    /* Start for Atomic SubSystem: '<S21>/Call Service' */
    /* Start for MATLABSystem: '<S43>/ServiceCaller' */
    sliding_controller2_DW.obj.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.objisempty_a = true;
    sliding_controller2_DW.obj.isInitialized = 1;
    sliding_controller2_DW.obj.isSetupComplete = true;

    /* End of Start for SubSystem: '<S21>/Call Service' */
    /* End of Start for SubSystem: '<Root>/Controller' */

    /* Start for Enabled SubSystem: '<Root>/Enabled Subsystem' */
    sliding_controller2_DW.EnabledSubsystem_MODE = false;

    /* Start for Atomic SubSystem: '<S6>/Publish1' */
    /* Start for MATLABSystem: '<S44>/SinkBlock' */
    sliding_controller2_DW.obj_n.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.objisempty_c = true;
    sliding_controller2_DW.obj_n.isInitialized = 1;
    for (i = 0; i < 24; i++) {
      sliding_controller2_B.b_zeroDelimTopic_b[i] = tmp_3[i];
    }

    sliding_controller2_B.b_zeroDelimTopic_b[24] = '\x00';
    Pub_sliding_controller2_1242.createPublisher
      (&sliding_controller2_B.b_zeroDelimTopic_b[0], 1);
    sliding_controller2_DW.obj_n.isSetupComplete = true;

    /* End of Start for MATLABSystem: '<S44>/SinkBlock' */
    /* End of Start for SubSystem: '<S6>/Publish1' */

    /* Start for Atomic SubSystem: '<S6>/Publish2' */
    /* Start for MATLABSystem: '<S45>/SinkBlock' */
    sliding_controller2_DW.obj_mp.matlabCodegenIsDeleted = false;
    sliding_controller2_DW.objisempty_d = true;
    sliding_controller2_DW.obj_mp.isInitialized = 1;
    for (i = 0; i < 26; i++) {
      sliding_controller2_B.b_zeroDelimTopic[i] = tmp_4[i];
    }

    sliding_controller2_B.b_zeroDelimTopic[26] = '\x00';
    Pub_sliding_controller2_1246.createPublisher
      (&sliding_controller2_B.b_zeroDelimTopic[0], 1);
    sliding_controller2_DW.obj_mp.isSetupComplete = true;

    /* End of Start for MATLABSystem: '<S45>/SinkBlock' */
    /* End of Start for SubSystem: '<S6>/Publish2' */
    /* End of Start for SubSystem: '<Root>/Enabled Subsystem' */

    /* Start for MATLABSystem: '<Root>/Simulation Rate Control' */
    sliding_controller2_DW.objisempty_oz = true;

    /* set.SampleTime setter for SampleTime */
    sliding_controller2_DW.obj_k.isInitialized = 1;

    /* setupImpl Implement tasks that need to be performed only once, */
    /*  such as pre-computed constants. */
  }

  {
    int32_T i;

    /* SystemInitialize for Atomic SubSystem: '<Root>/Subscribe' */
    /* SystemInitialize for Enabled SubSystem: '<S11>/Enabled Subsystem' */
    /* SystemInitialize for Outport: '<S46>/Out1' incorporates:
     *  Inport: '<S46>/In1'
     */
    sliding_controller2_B.In1_a = sliding_controller2_P.Out1_Y0;

    /* End of SystemInitialize for SubSystem: '<S11>/Enabled Subsystem' */
    /* End of SystemInitialize for SubSystem: '<Root>/Subscribe' */

    /* SystemInitialize for Atomic SubSystem: '<Root>/Subscribe1' */
    /* SystemInitialize for Enabled SubSystem: '<S12>/Enabled Subsystem' */
    sliding_c_EnabledSubsystem_Init(&sliding_controller2_B.EnabledSubsystem_l,
      &sliding_controller2_P.EnabledSubsystem_l);

    /* End of SystemInitialize for SubSystem: '<S12>/Enabled Subsystem' */
    /* End of SystemInitialize for SubSystem: '<Root>/Subscribe1' */

    /* SystemInitialize for Enabled SubSystem: '<Root>/Enabled Subsystem1' */
    /* SystemInitialize for Outport: '<S7>/exo' incorporates:
     *  Inport: '<S7>/In1'
     */
    sliding_controller2_B.In1_j = sliding_controller2_P.exo_Y0;

    /* End of SystemInitialize for SubSystem: '<Root>/Enabled Subsystem1' */

    /* SystemInitialize for Atomic SubSystem: '<Root>/Subscribe2' */
    /* SystemInitialize for Enabled SubSystem: '<S13>/Enabled Subsystem' */
    sliding_c_EnabledSubsystem_Init(&sliding_controller2_B.EnabledSubsystem_i,
      &sliding_controller2_P.EnabledSubsystem_i);

    /* End of SystemInitialize for SubSystem: '<S13>/Enabled Subsystem' */
    /* End of SystemInitialize for SubSystem: '<Root>/Subscribe2' */

    /* SystemInitialize for Enabled SubSystem: '<Root>/Enabled Subsystem2' */
    /* SystemInitialize for Outport: '<S8>/human' incorporates:
     *  Inport: '<S8>/In1'
     */
    sliding_controller2_B.In1 = sliding_controller2_P.human_Y0;

    /* End of SystemInitialize for SubSystem: '<Root>/Enabled Subsystem2' */

    /* SystemInitialize for Enabled SubSystem: '<Root>/Controller' */
    for (i = 0; i < 7; i++) {
      /* InitializeConditions for Integrator: '<S19>/Integrator1' */
      sliding_controller2_X.Integrator1_CSTATE[i] =
        sliding_controller2_P.Integrator1_IC[i];

      /* InitializeConditions for Integrator: '<S19>/Integrator' */
      sliding_controller2_X.Integrator_CSTATE[i] =
        sliding_controller2_P.Integrator_IC;

      /* SystemInitialize for Saturate: '<S5>/exo sateration' incorporates:
       *  Outport: '<S5>/exo tau'
       */
      sliding_controller2_B.exosateration[i] = sliding_controller2_P.exotau_Y0;

      /* SystemInitialize for Saturate: '<S5>/human sateration' incorporates:
       *  Outport: '<S5>/human tau'
       */
      sliding_controller2_B.humansateration[i] =
        sliding_controller2_P.humantau_Y0;
    }

    /* End of SystemInitialize for SubSystem: '<Root>/Controller' */
    /* resetImpl Initialize discrete-state properties. */
  }
}

/* Model terminate function */
void sliding_controller2_terminate(void)
{
  /* Terminate for Atomic SubSystem: '<Root>/Publish' */
  /* Terminate for MATLABSystem: '<S10>/SinkBlock' */
  if (!sliding_controller2_DW.obj_m.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_m.matlabCodegenIsDeleted = true;
  }

  /* End of Terminate for MATLABSystem: '<S10>/SinkBlock' */
  /* End of Terminate for SubSystem: '<Root>/Publish' */

  /* Terminate for Atomic SubSystem: '<Root>/Subscribe' */
  /* Terminate for MATLABSystem: '<S11>/SourceBlock' */
  if (!sliding_controller2_DW.obj_g.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_g.matlabCodegenIsDeleted = true;
  }

  /* End of Terminate for MATLABSystem: '<S11>/SourceBlock' */
  /* End of Terminate for SubSystem: '<Root>/Subscribe' */

  /* Terminate for Atomic SubSystem: '<Root>/Subscribe1' */
  /* Terminate for MATLABSystem: '<S12>/SourceBlock' */
  if (!sliding_controller2_DW.obj_c.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_c.matlabCodegenIsDeleted = true;
  }

  /* End of Terminate for MATLABSystem: '<S12>/SourceBlock' */
  /* End of Terminate for SubSystem: '<Root>/Subscribe1' */

  /* Terminate for Atomic SubSystem: '<Root>/Subscribe2' */
  /* Terminate for MATLABSystem: '<S13>/SourceBlock' */
  if (!sliding_controller2_DW.obj_h.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_h.matlabCodegenIsDeleted = true;
  }

  /* End of Terminate for MATLABSystem: '<S13>/SourceBlock' */
  /* End of Terminate for SubSystem: '<Root>/Subscribe2' */

  /* Terminate for Enabled SubSystem: '<Root>/Controller' */
  /* Terminate for Atomic SubSystem: '<S21>/Call Service' */
  /* Terminate for MATLABSystem: '<S43>/ServiceCaller' */
  if (!sliding_controller2_DW.obj.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj.matlabCodegenIsDeleted = true;
  }

  /* End of Terminate for MATLABSystem: '<S43>/ServiceCaller' */
  /* End of Terminate for SubSystem: '<S21>/Call Service' */
  /* End of Terminate for SubSystem: '<Root>/Controller' */

  /* Terminate for Enabled SubSystem: '<Root>/Enabled Subsystem' */
  /* Terminate for Atomic SubSystem: '<S6>/Publish1' */
  /* Terminate for MATLABSystem: '<S44>/SinkBlock' */
  if (!sliding_controller2_DW.obj_n.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_n.matlabCodegenIsDeleted = true;
  }

  /* End of Terminate for MATLABSystem: '<S44>/SinkBlock' */
  /* End of Terminate for SubSystem: '<S6>/Publish1' */

  /* Terminate for Atomic SubSystem: '<S6>/Publish2' */
  /* Terminate for MATLABSystem: '<S45>/SinkBlock' */
  if (!sliding_controller2_DW.obj_mp.matlabCodegenIsDeleted) {
    sliding_controller2_DW.obj_mp.matlabCodegenIsDeleted = true;
  }

  /* End of Terminate for MATLABSystem: '<S45>/SinkBlock' */
  /* End of Terminate for SubSystem: '<S6>/Publish2' */
  /* End of Terminate for SubSystem: '<Root>/Enabled Subsystem' */
}
