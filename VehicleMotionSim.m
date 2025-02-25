function [StatesLog,StatesInELog,ForceLog] = VehicleMotionSim(MotionConfig)

%Modify global variables
global MInv

%Extract parameters
EnableCCForces =  MotionConfig.EnableCCForces;
EnableRestoringForces = MotionConfig.EnableRestoringForces;
EnableDampingForces = MotionConfig.EnableDampingForces;
EnableAirDragForces =  MotionConfig.EnableAirDragForces;
EnableThrusterForces = MotionConfig.EnableThrusterForces;
SimTime = MotionConfig.SimTime;
SimTimeLimit = MotionConfig.SimTimeLimit;
TsPlant = MotionConfig.TsPlant;
PrevStates = MotionConfig.PrevStates;
PrevStatesInE = MotionConfig.PrevStatesInE;
WindVelocity = MotionConfig.WindVelocity;


SimIdxLimit = uint32(round(SimTimeLimit/TsPlant)+1);
SimIdx = uint32(round(SimTime/TsPlant)+1);

%Initialize Logs
LogSize = SimIdxLimit;
StatesLog = zeros(LogSize,13);
StatesInELog = zeros(LogSize,13);
ForceLog = zeros(LogSize,31);

LThrusterForceXCustom = MotionConfig.LThrusterForceXCustom;
RThrusterForceXCustom = MotionConfig.RThrusterForceXCustom;

%Start motion
while (SimIdx<=SimIdxLimit)
    
  LThrusterForceX = LThrusterForceXCustom(SimIdx);
  RThrusterForceX = RThrusterForceXCustom(SimIdx);
  
  StatesLog(SimIdx,:) = [SimTime PrevStates'];
  StatesInELog(SimIdx,:) = [SimTime PrevStatesInE'];
  
  States = PrevStates;
  
  ...fixed coordinates and surge,sway,heave,roll,pitch,yaw speeds in Body coor.
% StatesInE = [States(1:6); B2E(States)*States(7:end)]; %Columns: X,Y,Z,
% ...theta,phi,psi and its derivatives in Earth fixed coordinates.
% StatesInB = [zeros(6,1); States(7:end)];  %Columns: first 6 columns
% ...are NOTHING(only zeros),surge,sway,heave,roll,pitch,yaw speeds in Body Coord.

  %Generate Thruster Forces
  Ftt = ThrusterForces(EnableThrusterForces,LThrusterForceX,RThrusterForceX);
  
  % Generate Velocity Transformation Matrix
  Jn = B2E(States);
  
  %Generate Coriolis and Centripetal Forces Matrix
  Fcc = CCForces(EnableCCForces,States);
  
  %Generate Restoring Forces
  Fg = RestoringForces(EnableRestoringForces,States);
  
  %Generate Damping Forces
  Fwd = DampingForces(EnableDampingForces,States);
  
  %Generate Air Drag Forces
  Fad = AirDragForces(EnableAirDragForces,States,WindVelocity);
  
  %Generate vi update
  vi = States(7:end)+TsPlant*MInv*(Ftt+Fwd+Fad+Fg-Fcc);
  
  %Generate nu update
  nu = States(1:6)+TsPlant*(Jn*vi);
  
  % Update States
  States = [nu ; vi];
  StatesInE = [nu; Jn*vi];
  
  ForceLog(SimIdx,:) = [SimTime Ftt' -Fcc' Fg' Fwd' Fad'];
    
  SimIdx = SimIdx+1;
  SimTime = SimTime + TsPlant;
  PrevStates = States;
  PrevStatesInE = StatesInE;
  
end


end

