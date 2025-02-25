function Fad = AirDragForces(Enable,States,WindVelocity)
% This function calculates the air drag forces

%Declare global variables
global CDA l wi h d
            
if (Enable)
    
z = States(3); %Position in z
u = States(7); %Surge Lin. Vel.
v = States(8); %Sway Lin. Vel.
w = States(9); %Heave Lin. Vel.
    
h0 = h-d+z; %Height subject to air

% Forces calculated based on relative velocities
BodyLinearVelocity = [u; v; w];
RelativeVelocity = BodyLinearVelocity-WindVelocity;

ur = RelativeVelocity(1);
vr = RelativeVelocity(2);
wr = RelativeVelocity(3);

%Area subject to air is utilized
Fax = h0*wi*2.56*ur*abs(ur)*CDA;
Fay = h0*l*2.56*vr*abs(vr)*CDA;
Faz = l*wi*2.56*wr*abs(wr)*CDA;

%It is assumed that air moments are negilicible due to symmetry
Fad = -[Fax; Fay; Faz; 0; 0; 0];

else
    
Fad = zeros(6,1);

end

end