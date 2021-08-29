% x2 = [1 2];
% y2 = [4 4];
% p = scatter(x2,y2, '*', 'LineWidth',15);
% xlim([0 5])
% ylim([0 5])
% xlabel('Iteration')
% ylabel('Approximation for \pi')
% 
% p.XDataSource = 'x2';
% p.YDataSource = 'y2';
% 
% denom = 1;
% k = -1;
% for t = 3:100
%     denom = denom + 2;
%     x2 = randi(5)
%     y2 =  randi(5)
%     refreshdata
%     drawnow
%     k = -k;
% end
joint_angles = readmatrix("joint_angle.csv")

l1 = -0.3240;
l2 = -0.3900;

x = [0 0 0 ];
y = [0 l1 l1+l2 ];
p = scatter(x,y, '*', 'LineWidth',1);
xlim([-.8 .8])
ylim([-0.8, 0.4])
xlabel('Iteration')
ylabel('Approximation for \pi')

p.XDataSource = 'x';
p.YDataSource = 'y';

denom = 1;
k = -1;
for t = 1:length(joint_angles)
    joint_angles(t,[1,2])
    [left_knee, left_ankle] = forward_kinimatics_leg(joint_angles(t,[1,2]));
    [right_knee, right_ankle] = forward_kinimatics_leg(joint_angles(t,[4,5]));
    
    x = [ 0 right_knee(1) right_ankle(1) 0 left_knee(1) left_ankle(1) ];
    y = [ 0 right_knee(2) right_ankle(2) 0 left_knee(2) left_ankle(2) ];
    
    refreshdata
    drawnow
   pause(0.001)
end