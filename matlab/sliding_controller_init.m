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


        

rho_hip = 100.0;
rho_knee = 450.0;
rho_ankle = 100; %100.0;
        
rho2 = [rho_hip, 0.0, 0.0, 0.0, 0.0, 0.0,0; 
         0,    rho_knee, 0.0, 0.0, 0.0, 0.0,0;
         0.0, 0.0, rho_ankle, 0.0  0.0, 0.0,0;
         0,0,0,rho_hip,0,0,0;
         0,0,0,0,rho_knee,0,0;
         0,0,0,0,0,rho_ankle,0;
         0,0,0,0,0,0,0];     

lambda_hip = 1.2;
lambda_knee =  1.25;
lambda_ankle = 1.0;


lambda2 = [lambda_hip, 0, 0, 0, 0, 0,0;
            0, lambda_knee,0, 0, 0, 0,0;
            0, 0, lambda_ankle, 0, 0, 0,0;
            0, 0, 0, lambda_hip, 0, 0,0;
            0, 0, 0, 0, lambda_knee, 0,0;
            0, 0, 0, 0, 0, lambda_ankle,0;
            0,0,0,0,0,0,0];
            
     
     
exo_sat = 180;
human_sat = 30;


sat = 10;

Kem = 50*eye(7);

Ked = 50*eye(7);
beta = [1/8 1/8 1/8 1/8 1/8 1/8 1/8];

Kp0 = [500,500,500,500,500,500,500];
Kn0 = [500,500,500,500,500,500,500];
Bp0 = [500,500,500,500,500,500,500];
Bn0 = [500,500,500,500,500,500,500];
alpha = [15,15]
gamma = [15,15]