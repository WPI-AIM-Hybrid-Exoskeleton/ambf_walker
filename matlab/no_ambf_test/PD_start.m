
Dm_hip = 100;
Dm_knee = 100;
Dm_ankle = 3;

Km_hip = 6017.73151361233;
Km_knee = 2898.16820260871;
Km_ankle = 100;



human_sat = 20;

% model 1 gains
Dm1= [Dm_hip, 0.0, 0.0, 0.0, 0.0,0; 
         0,  Dm_knee, 0.0,  0.0, 0.0,0;
         0.0, 0.0, Dm_ankle,  0.0, 0.0,0;
         0,0,0,Dm_hip,0,0;
         0,0,0,0,Dm_knee,0;
         0,0,0,0,0,Dm_ankle];     


Km1= [Km_hip, 0.0, 0.0,  0.0, 0.0,0; 
         0,  Km_knee, 0.0,  0.0, 0.0,0;
         0.0, 0.0, Km_ankle, 0.0, 0.0,0;
         0,0,0,Km_hip,0,0;
         0,0,0,0,Km_knee,0;
         0,0,0,0,0,Km_ankle];     
