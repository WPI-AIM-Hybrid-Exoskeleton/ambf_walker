myQ = 1;
myR = 1;

mh = [2, 1]; 

me = [ 1, 1] + mh;

% other model params
l = [ 1.0, 1.5]

myQ = eye(14);
myR = eye(7); % diag([0.001 0.001 0.00 0.00]);


% connection dyamics
spring = eye(14);
dampener = eye(7);


% model 1 gains
Km1 = eye(7);
Dm1 = eye(7);



% Addmittance Controller
Kd = eye(7);
Bd = eye(7);
Md =eye(7);

%Exo Gains
Kp_e = 300;
Kd_e = 300;


% SMClambda2 = [1., 0; 0 5.0];


rho2 = eye(7);

lambda2 = eye(7);
rho2 = eye(7);

lambda2 = eye(7);
rho2 = eye(7);
sat = 10;

Kem = eye(7);
Ked = eye(7);
exo_sat = 50

Kp0 = 50


Kp0 = 50*eye(2);
Kn0 = 50*eye(2);
Bp0 = 50;
Bn0 = 50;
beta_p = 3;
beta_n = 3;
alpha_p = 3;
alpha_n = 3;