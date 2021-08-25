function [pos_knee,pos_ankle,vel_knee,vel_ankle ] = forward_kinimatics_leg(q, qd)
%FORWARD_KINIMATICS_LEG Summary of this function goes here
%   Detailed explanation goes here
l1 = -0.3240;
l2 = -0.3900;


pos_knee = l1*[ cos(q(1)); sin(q(1))];
pos_ankle = pos_knee - l2*[ sin(q(1) + q(2)); cos(q(1) + q(2))];

vel_knee = l1*qd(1)*[ -sin(q(1)); cos(q(1))];
vel_ankle = vel_knee + l2*(qd(1) + qd(2))*[ -sin(q(1) + q(2)); cos(q(1) + q(2))];




end

