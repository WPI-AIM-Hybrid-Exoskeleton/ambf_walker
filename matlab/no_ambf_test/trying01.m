
params = load('/home/nathanielgoldfarb/pendulm_model/double_pend/testing_system/modifed_model/tests/all_cost/parameters.mat')



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

rho_hip =  500; %params.all_cost_parameters(8,1).Value(1,1);
rho_knee = 450; % params.all_cost_parameters(8,1).Value(2,2);
rho_ankle = 200; %params.all_cost_parameters(8,1).Value(2,2);
        
rho2 = [rho_hip, 0.0, 0.0, 0.0, 0.0, 0.0; 
         0,    rho_knee, 0.0, 0, 0.0, 0.0;
         0.0, 0.0, rho_ankle  0.0, 0.0,0;
         0,0,0,rho_hip,0,0;
         0,0,0,0,rho_knee,0;
         0,0,0,0,0,rho_ankle];     

lambda_hip = 1.1277; %params.all_cost_parameters(9,1).Value(1,1);
lambda_knee = 1.2389; %params.all_cost_parameters(9,1).Value(2,2);
lambda_ankle = 1.2; %params.all_cost_parameters(9,1).Value(2,2);


lambda_hip = .01277; %params.all_cost_parameters(9,1).Value(1,1);
lambda_knee = .02389; %params.all_cost_parameters(9,1).Value(2,2);
lambda_ankle = 0.02; %params.all_cost_parameters(9,1).Value(2,2);


lambda2 = [lambda_hip, 0, 0, 0, 0, 0;
            0, lambda_knee,0, 0, 0, 0;
            0, 0, lambda_ankle, 0, 0, 0;
            0, 0, 0, lambda_hip,0, 0;
            0, 0, 0, 0, lambda_knee, 0;
            0, 0, 0, 0, 0, lambda_ankle];
            
     
     
exo_sat = 30;
interaction_sat = 6;
human_sat = 20;

spring = [0.30, 0; 0, 0.30];
dampener = [0.30, 0; 0, 0.30];

Kp0_hip =  5.0;
Kp0_knee = .500; % params.all_cost_parameters(6,1).Value(2);
Kp0_ankle =  5.5; % params.all_cost_parameters(6,1).Value(2);

Kn0_hip =  5.0; % params.all_cost_parameters(3,1).Value(1);
Kn0_knee =   .508; % params.all_cost_parameters(3,1).Value(2);
Kn0_ankle = 5.508 % 508.8125; % params.all_cost_parameters(3,1).Value(2);

Bp0_hip =  5.0; % 0.9*params.all_cost_parameters(2,1).Value(1);
Bp0_knee = .508; %$ params.all_cost_parameters(2,1).Value(2);
Bp0_ankle = 5.508; % params.all_cost_parameters(2,1).Value(2);

Bn0_hip = 5.0; %params.all_cost_parameters(1,1).Value(1);
Bn0_knee = .508; % params.all_cost_parameters(1,1).Value(2);
Bn0_ankle = 5.508; % 508.8125; %params.all_cost_parameters(1,1).Value(2);


beta = zeros(6,1) + params.all_cost_parameters(6,1).Value(1);

Kp0 = [Kp0_hip Kp0_knee Kp0_ankle Kp0_hip Kp0_knee Kp0_ankle ];
Kn0 = [Kn0_hip Kn0_knee Kn0_ankle Kn0_hip Kn0_knee Kn0_ankle ];
Bn0 = [Bn0_hip Bn0_knee Bn0_ankle Bn0_hip Bn0_knee Bn0_ankle ];
Bp0 = [Bp0_hip Bp0_knee Bp0_ankle Bp0_hip Bp0_knee Bp0_ankle ];

alpha = 2*params.all_cost_parameters(5,1).Value;
gamma = 2*params.all_cost_parameters(7,1).Value;

% spring = [10, 0; 0, 10];
% dampener = [10, 0; 0, 10];
