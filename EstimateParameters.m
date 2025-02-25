function EstimateParameters()

%Declare global variables
global m l wi roW d...
       Ix Iy Iz Ixy Iyz Ixz...
       Xudot Yvdot Yrdot Nvdot Nrdot...
       Xuu Yvv Zww Kpp Mqq Nrr CDW
    
% Moment of Inertia Terms
% Ix = m/12*(wi^2+h^2);
% Iy = m/12*(l^2+h^2);
% Iz = m/12*(wi^2+l^2);
% Ixy = 0;
% Iyz = 0;
% Ixz = 0;

Ix = 95363507*10^-9; %kgm^2
Iy = 709916794*10^-9;
Iz = 719223485*10^-9;
Ixy = 0;
Iyz = 0;
Ixz = 24607362*10^-9;

Xudot = -0.05*m;
Yvdot = -1/2*roW*pi*d^2*l;
Nrdot = -1/24*(0.1*m*wi^2+roW*d^2*l^3);
Yrdot = 0;
Nvdot = Yrdot;

AUT = wi*d;
AUL = d*l;
AWP = l*wi;

Xuu = -1/2*roW*CDW*AUT;
Yvv = -1/2*roW*CDW*AUL;
Zww = -1/2*roW*CDW*AWP;
Kpp = -1/2*roW*CDW*((AUT+AUL)*2+AWP);
Mqq = -1/2*roW*CDW*((AUT+AUL)*2+AWP);
Nrr = -1/2*roW*CDW*((AUT+AUL)*2+AWP);

end

