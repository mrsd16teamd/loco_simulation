% ----------------------------------------
% --------Initialize Visualization--------
% ----------------------------------------
show_traj_cog = 1;
show_traj_r = 1;
show_wheels = 1;

figure(1)
P = [-0.15  -0.15  0.15  0.15  -0.15; -0.08  0.08  0.08  -0.08  -0.08; 1 1 1 1 1];
W = [-0.03  -0.03  0.03  0.03  -0.03; -0.015  0.015  0.015  -0.015  -0.015; 1 1 1 1 1];
CoG = [0;0;1]
r_axle = [-0.15;0;1]
h = animatedline(P(1,:),P(2,:));

if show_traj_cog
    traj_cog = animatedline(CoG(1,:),CoG(2,:),'Color','g');
end

if show_traj_r
    traj_r = animatedline(r_axle(1,:),r_axle(2,:),'Color','r');
end

if show_wheels
    tfr = [1 0 0.135; 0 1 -0.08; 0 0 1]*W;
    fr = animatedline(tfr(1,:),tfr(2,:))
    tfl = [1 0 0.135; 0 1 0.08; 0 0 1]*W;
    fl = animatedline(tfl(1,:),tfl(2,:))
    trr = [1 0 -0.135; 0 1 -0.08; 0 0 1]*W;
    rr = animatedline(trr(1,:),trr(2,:))
    trl = [1 0 -0.135; 0 1 0.08; 0 0 1]*W;
    rl = animatedline(trl(1,:),trl(2,:))
end

axis([-2, 2, -2, 2])
axis equal