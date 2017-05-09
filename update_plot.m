% ----------------------------------------
% ----------Update Visualization----------
% ----------------------------------------
pos_x = x(1);
pos_y = x(2);
pos_phi = wrapToPi(x(3));
A = [cos(pos_phi) -sin(pos_phi) pos_x; sin(pos_phi) cos(pos_phi) pos_y; 0 0 1];
pos = A*P;
CoG_n = A*CoG;
rear_n = A*r_axle; 

if show_wheels
    clearpoints(fr);
    clearpoints(fl);
    clearpoints(rr);
    clearpoints(rl);
    cfr = A*[cos(steer) -sin(steer) 0.135; sin(steer) cos(steer) -0.08; 0 0 1]*W;
    addpoints(fr, cfr(1,:), cfr(2,:))
    cfl = A*[cos(steer) -sin(steer) 0.135; sin(steer) cos(steer) 0.08; 0 0 1]*W;
    addpoints(fl, cfl(1,:), cfl(2,:))
    crr = A*trr;
    addpoints(rr, crr(1,:), crr(2,:))
    crl = A*trl;
    addpoints(rl, crl(1,:), crl(2,:))
end

clearpoints(h);
addpoints(h,pos(1,:),pos(2,:));
if show_traj_cog
    addpoints(traj_cog,CoG_n(1,:),CoG_n(2,:));
end

if show_traj_r
    addpoints(traj_r,rear_n(1,:),rear_n(2,:));
end
drawnow