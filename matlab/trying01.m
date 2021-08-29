
params = load('/home/nathanielgoldfarb/pendulm_model/double_pend/testing_system/modifed_model/tests/all_cost/parameters.mat')

myQ = 1;
myR = 1;

l1 = -0.3240;
l2 = -0.3900;

myQ = eye(14);
myR = eye(7); % diag([0.001 0.001 0.00 0.00]);


% Addmittance Controller

Md = 10*eye(7);
invMd = inv(Md);


% SMClambda2 = [1., 0; 0 5.0];

Dm_hip = 496.569821348200;
Dm_knee = 100;
Dm_ankle = 100;

Km_hip = 6017.73151361233;
Km_knee = 2898.16820260871;
Km_ankle = 2898.16820260871;



% model 1 gains
Dm1= [Dm_hip, 0.0, 0.0, 0.0, 0.0, 0.0,0; 
         0,  Dm_knee, 0.0, 0.0, 0.0, 0.0,0;
         0.0, 0.0, Dm_ankle, 0.0  0.0, 0.0,0;
         0,0,0,Dm_hip,0,0,0;
         0,0,0,0,Dm_knee,0,0;
         0,0,0,0,0,Dm_ankle,0;
         0,0,0,0,0,0,0];     


Km1= [Km_hip, 0.0, 0.0, 0.0, 0.0, 0.0,0; 
         0,  Km_knee, 0.0, 0.0, 0.0, 0.0,0;
         0.0, 0.0, Km_ankle, 0.0  0.0, 0.0,0;
         0,0,0,Km_hip,0,0,0;
         0,0,0,0,Km_knee,0,0;
         0,0,0,0,0,Km_ankle,0;
         0,0,0,0,0,0,0];     


rho_hip = 70 % 152.6437; %params.all_cost_parameters(8,1).Value(1,1);
rho_knee = 30% 457.9312; % params.all_cost_parameters(8,1).Value(2,2);
rho_ankle =  10; %params.all_cost_parameters(8,1).Value(2,2);
        
rho2 = [rho_hip, 0.0, 0.0, 0.0, 0.0, 0.0,0; 
         0,    rho_knee, 0.0, 0.0, 0.0, 0.0,0;
         0.0, 0.0, rho_ankle, 0.0  0.0, 0.0,0;
         0,0,0,rho_hip,0,0,0;
         0,0,0,0,rho_knee,0,0;
         0,0,0,0,0,rho_ankle,0;
         0,0,0,0,0,0,0];     

lambda_hip = 1.1277; %params.all_cost_parameters(9,1).Value(1,1);
lambda_knee = 1.2389; %params.all_cost_parameters(9,1).Value(2,2);
lambda_ankle = 1.2; %params.all_cost_parameters(9,1).Value(2,2);


lambda2 = [lambda_hip, 0, 0, 0, 0, 0,0;
            0, lambda_knee,0, 0, 0, 0,0;
            0, 0, lambda_ankle, 0, 0, 0,0;
            0, 0, 0, lambda_hip, 0, 0,0;
            0, 0, 0, 0, lambda_knee, 0,0;
            0, 0, 0, 0, 0, lambda_ankle,0;
            0,0,0,0,0,0,0];
            
     
     
exo_sat = 150;
interaction_sat = 5;
human_sat = 0;

spring = [30, 0; 0, 30];
dampener = [30, 0; 0, 30];

Kp0_hip = 0.5088;
Kp0_knee = 0.5088; % params.all_cost_parameters(6,1).Value(2);
Kp0_ankle =  0.5088; % params.all_cost_parameters(6,1).Value(2);

Kn0_hip = 50 %08.8125; % params.all_cost_parameters(3,1).Value(1);
Kn0_knee =   50%08.8125; % params.all_cost_parameters(3,1).Value(2);
Kn0_ankle = 5 % 508.8125; % params.all_cost_parameters(3,1).Value(2);


Bp0_hip = 200%498.4931; % 0.9*params.all_cost_parameters(2,1).Value(1);
Bp0_knee = 50%508.8125; %$ params.all_cost_parameters(2,1).Value(2);
Bp0_ankle = 1%100; 508.8125; % params.all_cost_parameters(2,1).Value(2);

Bn0_hip =50%508.8125; %params.all_cost_parameters(1,1).Value(1);
Bn0_knee = 50%508.8125; % params.all_cost_parameters(1,1).Value(2);
Bn0_ankle = 5%50; % 508.8125; %params.all_cost_parameters(1,1).Value(2);


beta = zeros(7,1) + 0.8 % params.all_cost_parameters(6,1).Value(1);

Kp0 = [Kp0_hip Kp0_knee Kp0_ankle Kp0_hip Kp0_knee Kp0_ankle 0.0];
Kn0 = [Kn0_hip Kn0_knee Kn0_ankle Kn0_hip Kn0_knee Kn0_ankle 0.0];
Bn0 = [Bn0_hip Bn0_knee Bn0_ankle Bn0_hip Bn0_knee Bn0_ankle 0.0];
Bp0 = [Bp0_hip Bp0_knee Bp0_ankle Bp0_hip Bp0_knee Bp0_ankle 0.0];

alpha = params.all_cost_parameters(5,1).Value;
gamma = params.all_cost_parameters(7,1).Value;

% spring = [2000, 0; 0, 2000];
% dampener = [1000, 0; 0, 1000];
