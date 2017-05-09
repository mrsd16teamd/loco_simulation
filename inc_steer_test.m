init_plot;

% --------Initialize Joystick--------
x = [0;0;0;0;0;0];
dt = 0.025;
T = 5.5;
throttle = 0;
steer = 0;

traj = zeros(T/dt+1,2);
i = 1;
for t = 0:dt:T    
    update_plot
    
    % --------Use Joystick Input--------
    throttle = 3;
    steer = 0.01;
    
    % ------Calculate Car Dynamics------
    u = [throttle; steer];
    new_x = dynamics_finite(x, u, dt);
    x = new_x;
    
    traj(i,:) = double(x(1:2));
    i = i+1;
end