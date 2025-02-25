function Ftt = ThrusterForces(Enable,LThrusterForceX,RThrusterForceX)
%This function calculates the thruster forces

global DisCMLThruster DisCMRThruster

if (Enable)
    
LThrusterForce = [LThrusterForceX ; 0 ; 0];
RThrusterForce = [RThrusterForceX ; 0 ; 0];
    
% Generate Thuster Forces
LThrusterTorque = cross(DisCMLThruster,LThrusterForce); % Torque applied by left thruster around CM
RThrusterTorque = cross(DisCMRThruster,RThrusterForce); % Torque applied by right thruster around CM
        
LThrusterTotalForce = [LThrusterForce; LThrusterTorque]; % ThrusterForce= (Fx,Fy,Fz,Tx,Ty,Tz)'
RThrusterTotalForce = [RThrusterForce; RThrusterTorque]; % ThrusterForce= (Fx,Fy,Fz,Tx,Ty,Tz)'
  
Ftt = LThrusterTotalForce+RThrusterTotalForce;

else
    
Ftt = zeros(6,1);

end

end