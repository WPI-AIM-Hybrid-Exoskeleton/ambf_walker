myQ = 1;
myR = 1;

l1 = 0.3240;
l2 = 0.3900;

myQ = eye(14);
myR = eye(7); % diag([0.001 0.001 0.00 0.00]);


% connection dyamics
spring = 100*eye(2);
dampener = 100*eye(2);


% model 1 gains
Km1 = 30*eye(7);
Dm1 = 30*eye(7);



% Addmittance Controller
Kd = 50*eye(7);
Bd = 50*eye(7);
Md = 20*eye(7);
invMd = inv(Md);

%Exo Gains
Kp_e = 300;
Kd_e = 300;


% SMClambda2 = [1., 0; 0 5.0];


rho2 = eye(7);

lambda2 = eye(7);
rho2 = eye(7);

lambda2 = eye(7);
rho2 = 200*eye(7);
sat = 10;

Kem = 50*eye(7);
Ked = 50*eye(7);
exo_sat = 50

Kp0 = 50


Kp0 = 50*eye(7);
Kn0 = 50*eye(7);
Bp0 = 50;
Bn0 = 50;
beta_p = 3;
beta_n = 3;
alpha_p = 3;
alpha_n = 3;