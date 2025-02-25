function DeriveParameters()
% This function derives some parameters to be utilized model

%Declare global variables
global m l wi h roW d xG yG zG GMT GML MInv...
       Ix Iy Iz Ixy Iyz Ixz...
       LThrusterDisX LThrusterDisY LThrusterDisZ...
       RThrusterDisX RThrusterDisY RThrusterDisZ...
       DisCMLThruster DisCMRThruster...
       Xudot Yvdot Yrdot Nrdot...
       H Hinv...
   
%Thruster Parameters
DisCMLThruster = [LThrusterDisX ; LThrusterDisY ; LThrusterDisZ];
DisCMRThruster = [RThrusterDisX ; RThrusterDisY ; RThrusterDisZ];

%Draft calculation
d = m/(roW*l*wi); % in meter, the height in water

%Calculation Part

% Moment Arm Calculation For Buoyancy and Gravitational Forces
% Approximations for GMT and GML
% Assumption: Rectangular water Plane (Awp), Box Shape Assumption
IT = wi^3*l/12;
IL = l^3*wi/12;

DV = l*wi*d; % volume of ship under water
BMT = IT/DV; % in meter
BML = IL/DV; % in meter
BG = h/2-d/2; % in meter, distance between CG and BC (buoyancy center)

%Moment arms
GMT = BMT-BG;
GML = BML-BG;

%Cross product operator
Src = [0 -zG yG; zG 0 -xG; -yG xG 0];

%System transformation matrix
H = [eye(3) Src' ; zeros(3,3) eye(3)];
Hinv = [eye(3,3) Src ; zeros(3,3) eye(3)];

% Inertia Matrix
I0 = [Ix -Ixy -Ixz; -Ixy Iy -Iyz; -Ixz -Iyz Iz]; 

% Rigid body inertia matrix 
Mrb = [ m*eye(3) -m*Src;                      
        m*Src   I0 ];

%Added mass inertia matrix
Ma = -[Xudot 0 0 0 0 0;
       0 Yvdot 0 0 0 Yrdot;
       0 0 0 0 0 0;
       0 0 0 0 0 0;
       0 0 0 0 0 0;
       0 Yrdot 0 0 0 Nrdot];

M = Mrb+Ma;                               
MInv = inv(M);

end