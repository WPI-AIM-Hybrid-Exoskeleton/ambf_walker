function [output] = weird_test(q,qd)
    %FORWARD_KINIMATICS_LEG Summary of this function goes here
    %   Detailed explanation goes here
    l1 = 0.3240;
    l2 = 0.3900;

    output = zeros(2,4)
    
    pos_knee = l1*[ cos(q(1)); sin(q(1))];
    pos_ankle = pos_knee + l2*[ cos(q(1) + q(2)); sin(q(1) + q(2))];
   
    vel_knee = 11*qd(1)*[ -sin(q(1)); cos(q(1))];
    vel_ankle = vel_knee + l2*(qd(1) + qd(2))*[ -sin(q(1) + q(2)); cos(q(1) + q(2))];
    
    output(:,1) = pos_knee;
    output(:,2) = pos_ankle;
    
    output(:,3) = vel_knee;
    output(:,4) = vel_ankle;
    


end

