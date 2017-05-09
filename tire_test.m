m = 2.35;           % mass (kg)
L = 0.257;          % wheelbase (m)
C_alpha = 197;      % laternal stiffness
C_x = 116;          % longitude stiffness
Iz = 0.025; % rotation inertia
g = 9.81;     

b = 0.14328;        % CoG to rear axle
a = L-b;            % CoG to front axle

G_front = m*g*b/L;   % calculated load or specify front rear load directly
G_rear = m*g*a/L;
mu = 1.31;   
mu_spin = 0.5; 

Ux = 1;
K = [];
Fx = [];
Fy = [];
for Ux_cmd = 0:0.01:2
    [Fxr,Fyr] = tire_dyn(Ux, Ux_cmd, mu, mu_spin, G_rear, C_x, C_alpha, 0);
    K = [K,(Ux_cmd-Ux)/abs(Ux)];
    Fx = [Fx, Fxr];
end

for alpha = -1:0.01:1
    [Fxr,Fyr] = tire_dyn(Ux, Ux, mu, mu_spin, G_rear, C_x, C_alpha, alpha);
    Fy = [Fy, Fyr];
end

subplot(2,1,1);
plot(K,Fx);
title('Longitude Tire Force Analysis')

subplot(2,1,2);
plot(-1:0.01:1,Fy);
title('Lateral Tire Force Analysis')