myQ = 1;
myR = 1;

l1 = 0.3240;
l2 = 0.3900;

myQ = eye(14);
myR = eye(7); % diag([0.001 0.001 0.00 0.00]);


% connection dyamics
spring = 0.01*eye(2);
dampener = 0.01*eye(2);


% model 1 gains
Km1 = 30*eye(7);
Dm1 = 30*eye(7);



% Addmittance Controller
Kd = 50*eye(7);
Bd = 50*eye(7);
Md = 10*eye(7);
invMd = inv(Md);

%Exo Gains
Kp_e = 300;
Kd_e = 300;


% SMClambda2 = [1., 0; 0 5.0];


        

rho_hip = params.all_cost_parameters(8,1).Value(1,1);
rho_knee = params.all_cost_parameters(8,1).Value(2,2);;
rho_ankle = params.all_cost_parameters(8,1).Value(2,2);
        
rho2 = [rho_hip, 0.0, 0.0, 0.0, 0.0, 0.0,0; 
         0,    rho_knee, 0.0, 0.0, 0.0, 0.0,0;
         0.0, 0.0, rho_ankle, 0.0  0.0, 0.0,0;
         0,0,0,rho_hip,0,0,0;
         0,0,0,0,rho_knee,0,0;
         0,0,0,0,0,rho_ankle,0;
         0,0,0,0,0,0,0];     

lambda_hip = params.all_cost_parameters(9,1).Value(1,1);
lambda_knee =  params.all_cost_parameters(9,1).Value(2,2)
lambda_ankle = params.all_cost_parameters(9,1).Value(2,2)


lambda2 = [lambda_hip, 0, 0, 0, 0, 0,0;
            0, lambda_knee,0, 0, 0, 0,0;
            0, 0, lambda_ankle, 0, 0, 0,0;
            0, 0, 0, lambda_hip, 0, 0,0;
            0, 0, 0, 0, lambda_knee, 0,0;
            0, 0, 0, 0, 0, lambda_ankle,0;
            0,0,0,0,0,0,0];
            
     
     
exo_sat = 150;
human_sat = 30;



Kp0_hip = params.all_cost_parameters(6,1).Value(1)
Kp0_knee = params.all_cost_parameters(6,1).Value(2)
Kp0_ankle = params.all_cost_parameters(6,1).Value(1)

Kn0_hip = params.all_cost_parameters(3,1).Value(1)
Kn0_knee = params.all_cost_parameters(3,1).Value(2)
Kn0_ankle = params.all_cost_parameters(3,1).Value(1)


Bp0_hip = params.all_cost_parameters(2,1).Value(1)
Bp0_knee = params.all_cost_parameters(2,1).Value(2)
Bp0_ankle = params.all_cost_parameters(2,1).Value(1)

Bn0_hip = params.all_cost_parameters(1,1).Value(1)
Bn0_knee = params.all_cost_parameters(1,1).Value(2)
Bn0_ankle = params.all_cost_parameters(1,1).Value(1)


beta = zeros(7,1) + params.all_cost_parameters(6,1).Value(1)

Kp0 =  [Kp0_hip Kp0_knee Kp_ankle Kp0_hip Kp0_knee Kp0_ankle 0.0]
Kn0 = [Kn0_hip Kn0_knee Kn0_ankle Kn0_hip Kn0_knee Kn0_ankle 0.0]
Bn0 = [Bn0_hip Bn0_knee Bn0_ankle Bn0_hip Bn0_knee Bn0_ankle 0.0]
Bp0 = [Bp0_hip Bp0_knee Bp0_ankle Bp0_hip Bp0_knee Bp0_ankle 0.0]

alpha = [15,15]
gamma = [15,15]