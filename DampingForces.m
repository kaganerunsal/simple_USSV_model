function Fwd = DampingForces(Enable,States)
% This function calculates the water damping forces

global Xu Yv Yr Nv Nr Zw Kp Mq ...
       Xuu Yvv Zww Kpp Mqq Nrr
   
if (Enable)
    
u = States(7); % Surge Lin. Vel.
v = States(8); % Sway Lin. Vel.
w = States(9); % Heave Lin. Vel.
p = States(10); % Roll Ang. Vel.
q = States(11); % Pitch Ang. Vel.
r = States(12); % Yaw Ang. Vel.

%Linear Damping Matrix
Dl = -[Xu 0 0 0 0 0;...
      0 Yv 0 0 0 Yr;...
      0 0 Zw 0 0 0;...
      0 0 0 Kp 0 0;...
      0 0 0 0 Mq 0;...
      0 Nv 0 0 0 Nr];
 
%Nonlinear damping matrix
Dn = -[ Xuu*abs(u) 0 0 0 0 0;...
        0 Yvv*abs(v) 0 0 0 0;...
        0 0 Zww*abs(w) 0 0 0;...
        0 0 0 Kpp*abs(p) 0 0;...
        0 0 0 0 Mqq*abs(q) 0;...
        0 0 0 0 0 Nrr*abs(r)];

%Total damping matrix
D =(Dl+Dn);

Fwd = -D*States(7:end);

else
    
Fwd = zeros(6,1);

end

end