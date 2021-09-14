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


ref = data.Nominal.desired_pos.Data;
ref_vel = data.Nominal.desired_vel.Data;

exo = data.Nominal.exo_pos.Data;
exo_vel = data.Nominal.exo_vel.Data;

human = data.Nominal.human_pos.Data;
human_vel = data.Nominal.human_vel.Data;


e_exo = ( exo - ref).^2;
exo_pos_error = sqrt(sum(e_exo) / length(e_exo) ) ;


ed_exo = ( exo_vel - ref_vel).^2;
exo_vel_error =sqrt(sum(ed_exo) / length(ed_exo) ) ;


e_human = ( human - ref).^2;
human_pos_error = sum( sqrt(sum(e_human) / length(e_human) ) );


ed_human = ( human_vel - ref_vel).^2;
human_vel_error = sum( sqrt(sum(ed_human) / length(ed_human) ) );

%+ exo_vel_error + human_pos_error + human_vel_error
vals =  sum(exo_pos_error + exo_vel_error,2) ;


end