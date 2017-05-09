function [ x_new ] = dynamics_finite( x, u, dt )
%DYNAMICS_FINITE Summary of this function goes here
%   Detailed explanation goes here
k1 = dynamics(x, u);
x_new = x + dt*k1;

end

