
params = load('designParams/designVars01.mat')

params = params.DesignVars_1


init_order = [ 0.3234332360511999,	0.828790977819428,	0.05500414040464993,	0.34068929821734684,	0.77137944369385,	-0.036196754936280086,  0];
init_reorder = temp(init_order);

l1 = -0.3240;
l2 = -0.3900;

myQ = eye(12);
myR = eye(6); % diag([0.001 0.001 0.00 0.00]);


% Addmittance Controller

Md = 10*eye(6);
invMd = inv(Md);


% SMClambda2 = [1., 0; 0 5.0];

Dm_hip = 100;
Dm_knee = 100;
Dm_ankle = 100;

Km_hip = 100;
Km_knee = 100;
Km_ankle = 100;



% model 1 gains
Dm1= [101.7013888888889 0 0 0 0 0;
    0 101.7013888888889 0 0 0 0;
    0 0 2.969791666666666 0 0 0;
    0 0 0 90.45138888888893 0 0;
    0 0 0 0 101.7013888888889 0;
    0 0 0 0 0 2.956250000000001]

Km1= [6120.116528948097 0 0 0 0 0;
    0 2947.477314389203 0 0 0 0;
    0 0 101.7013888888889 0 0 0;
    0 0 0 6120.1165289481 0 0;0 0 0 0 2947.477314389203 0;
    0 0 0 0 0 101.7013888888889]


        
rho2 =  params(5,1).Value



lambda2 = params(8,1).Value
            
     
     
exo_sat = 30;
interaction_sat = 6;
human_sat = 0;

spring = params(6,1).Value;
dampener =params(9,1).Value;

Kp0 = params(4,1).Value;
Kn0 =  params(3,1).Value;
Bn0 = params(1,1).Value;
Bp0 =  params(2,1).Value;

alpha = params(7,1).Value;


params = load('/home/nathanielgoldfarb/pendulm_model/double_pend/testing_system/modifed_model/tests/all_cost/parameters.mat')
beta = zeros(6,1) +  0.05; %params.all_cost_parameters(6,1).Value(1);

gamma = params.all_cost_parameters(7,1).Value;
% spring = [2000, 0; 0, 2000];
% dampener = [1000, 0; 0, 1000];
