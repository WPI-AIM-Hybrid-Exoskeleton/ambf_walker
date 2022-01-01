function vals=myCustomRequirement(data)
%MYCUSTOMREQUIREMENT
%
% The myCustomRequirement function defines a custom requirement used in the
% graphical SDOTOOL environment.

% The |vals| return argument is the value returned to the SDOTOOL
% optimization solver.
%
% The |data| input is a structure with fields containing design variable
% values and logged simulation data. For example, if SDOTOOL is configured
% to optimize a design variable set |DesignVars| and the custom requirement
% configured to log a signal |Sig| the |data| structure has fields as
% follows:
%
% data.DesignVars    %Design variable values
% data.Nominal.Sig   %Logged signal when simulating model with |DesignVars|
%
% If SDOTOOL is configured to optimize with an uncertain variables set the
% |data| structure includes fields with logged signals when simulating the
% model with |DesignVars| and uncertain values
%
% data.Uncertain.Sig
%
% See the |sdoHydraulicCylinder_customObjective| function and the
% |sdoHydraulicCylinder_uidemo| for an example of a custom requirement
% function.
%

    ref = data.Nominal.q_desired.Data;
    vel = data.Nominal.qd_desired.Data;
    exo = data.Nominal.q_exo.Data;
    exo_vel = data.Nominal.qd_exo.Data;
    human = data.Nominal.q_human.Data;
    human_vel = data.Nominal.qd_human.Data;
    % human = reshape(human',2,1,[]); % reshape magic
    norm = sqrt(1/length(ref));

    e_exo_pos = ( exo - ref).^2 ;
    e_exo_vel = ( vel - exo_vel).^2;

    e_human_pos =  (human - ref).^2 ;
    e_human_vel = ( vel - human_vel).^2;

    human_error = norm*( sqrt(sum(sum(e_human_pos,3))) + sqrt(sum(sum(e_human_vel,3)))   ) ;
    exo_error = norm*( sqrt(sum(sum(e_exo_pos,3))) + sqrt(sum(sum(e_exo_vel,3)))   ) ;


    vals = human_error + exo_error;

end