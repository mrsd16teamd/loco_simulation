figure(1)
P = [-0.15  -0.15  0.15  0.15  -0.15; -0.08  0.08  0.08  -0.08  -0.08; 1 1 1 1 1];
h = animatedline(P(1,:),P(2,:));
axis([-3,3,-3,3])

x = [0,0,0,0,0,0]
dt = 0.01
for t = 0:dt:10 
    pos_x = x(1);
    pos_y = x(2);
    pos_phi = x(3);
    
    A = [cos(pos_phi) -sin(pos_phi) pos_x; sin(pos_phi) cos(pos_phi) pos_y; 0 0 1];
    pos = A*P;
    
    clearpoints(h);
    addpoints(h,pos(1,:),pos(2,:));
    drawnow
    
    u = [0,0];
    new_x = dynamics_finite(x, u, dt);
    x = new_x;
end