function [Fcc] = CCForces(Enable,States)
% This function generates coriolis and centripental forces
 
global m Ix Iy Iz Ixy Iyz Ixz Yrdot Xudot Yvdot xG yG zG

if (Enable)
    
u = States(7);      % Surge Speed in Body-fixed frame
v = States(8);      % Sway Speed in Body-fixed frame
w = States(9);      % Heave Speed in Body-fixed frame
p = States(10);     % Roll Speed in Body-fixed frame
q = States(11);     % Pitch Speed in Body-fixed frame
r = States(12);     % Yaw Speed in Body-fixed frame
 
% Rigid Body Coriolis and Centripental Forces Matrix
Crb = [0 0 0 m*(yG*q+zG*r) -m*(xG*q-w) -m*(xG*r+v);
0 0 0 -m*(yG*p+w) m*(zG*r+xG*p) -m*(yG*r-u);
0 0 0 -m*(zG*p-v) -m*(zG*q+u) m*(xG*p+yG*q);
-m*(yG*q+zG*r) m*(yG*p+w) m*(zG*p-v) 0 -Iyz*q-Ixz*p+Iz*r Iyz*r+Ixy*p-Iy*q;
m*(xG*q-w) -m*(zG*r+xG*p) m*(zG*q+u) Iyz*q+Ixz*p-Iz*r 0 -Ixz*r-Ixy*q+Ix*p;
m*(xG*r+v) m*(yG*r-u) -m*(xG*p+yG*q) -Iyz*r-Ixy*p+Iy*q Ixz*r+Ixy*q-Ix*p 0 ];

%Added Mass Coriolis and Centripetal Forces Matrix  
Ca = [0 0 0 0 0 Yvdot*v+Yrdot*r;
      0 0 0 0 0 -Xudot*u;
      0 0 0 0 0 0;
      0 0 0 0 0 0;
      0 0 0 0 0 0;
      -Yvdot*v-Yrdot*r Xudot*u 0 0 0 0];

Ct = Ca+Crb;

Fcc = Ct*States(7:end);

else
    
Fcc = zeros(6,1);

end

end

