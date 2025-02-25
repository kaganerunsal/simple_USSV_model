function [Jn] = B2E(States)
%Tihs function produces the matrix for velocity transformation, from
...body to earth fixed frame
    
phi = States(4);  % Earth-fixed orientation, euler angle
theta = States(5); % Earth-fixed orientation, euler angle
psiy = States(6);  % Earth-fixed orientation, euler angle

% Linear velocity transformation
J1 = [cos(psiy)*cos(theta), -sin(psiy)*cos(phi)+cos(psiy)*sin(theta)*sin(phi), sin(psiy)*sin(phi)+cos(psiy)*cos(phi)*sin(theta);
sin(psiy)*cos(theta), cos(psiy)*cos(phi)+sin(phi)*sin(theta)*sin(psiy), -cos(psiy)*sin(phi)+sin(theta)*sin(psiy)*cos(phi);
-sin(theta), cos(theta)*sin(phi), cos(theta)*cos(phi) ];

% Angular velocity transformation
J2 = [1, sin(phi)*tan(theta), cos(phi)*tan(theta);
0, cos(phi), -sin(phi);
0, sin(phi)/cos(theta), cos(phi)/cos(theta)];

Jn = [J1,zeros(3,3);
      zeros(3,3), J2];
  
end
