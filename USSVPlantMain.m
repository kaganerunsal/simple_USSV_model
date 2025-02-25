%% Initialize
clc;
clear;
close all;

%%

%Declare global variables
global m l wi h roW xG yG zG g...
       Ix Iy Iz Ixy Iyz Ixz...
       LThrusterDisX LThrusterDisY LThrusterDisZ...
       RThrusterDisX RThrusterDisY RThrusterDisZ...
       Xu Yv Yr Nv Nr Zw Kp Mq ...
       CDW CDA...
       Xuu Yvv Zww Kpp Mqq Nrr...
       Xudot Yvdot Nrdot Yrdot Nvdot...

%Known parameters parameters

%Basic dimension parameters
l = 0.87; %m ***
wi = 0.27; %m ***
h = 0.23; %m ***

%Thruster dimension parameters
LThrusterDisX = -0.431;%m ***
LThrusterDisY = -0.055;%m ***
LThrusterDisZ = 0.043;%m ***
RThrusterDisX = -0.431;%m ***
RThrusterDisY = 0.055;%m ***
RThrusterDisZ = 0.043;%m ***

%Distance between CG and CO(vector is from CO to CG)
xG = 0; %m ***
yG = 0; %m ***
zG = 0; %m ***

%Mass Inertia Parameters
m = 10; %kg

%Physical Facts
g = 9.81; %m/s^2
roW = 1.1*10^3; % in kg/m3

%Changing parameters
WindVelX = 0; %m/s
WindVelY = 0; %m/s
WindVelZ = 0; %m/s

%Optimization Parameters without estimation

%Damping parameters
Xu = -3.67165;
Yv = -2.5;
Yr = -0.0001;
Nv = Yr;
Nr = -0.18514;
Zw = -15;
Kp = -0.02807;
Mq = -2.43171;

%Drag parameters
CDW = 1.18; 
CDA = 1.17930;

%Optimization Parameters with estimation

%Remaining Inertia parameters
Ix = 0.09003;
Iy = 2.14421;
Iz = 0.72262;
Ixy = 0; %kgm^2 ***
Iyz = 0; %kgm^2 ***
Ixz = 0.02494; %kgm^2 ***

%Added mass parameters
Xudot = -1.16633;
Yvdot = -2.21611;
Nrdot = -0.04858;
Yrdot = -2.25249;
Nvdot = -2.5;

%Damping parameters
Xuu = -0.98647;
Yvv = -2.5;
Zww = -1;
Kpp = -0.04382;
Mqq = -0.76863;
Nrr = -0.42855;

% Derive constant shared parameters
EstimateParameters();
DeriveParameters();

%States = [x1 y2 z3 phi4 theta5 psiy6 u7 v8 w9 p10 q11 r12]';
% InitStates =    [0 ; 0 ; 0.05 ; 5*pi/180 ; 5*pi/180 ; 0 ; 0.5 ; 0.5 ; 0.1 ; 2*pi/180 ; 2*pi/180 ; 0];
% InitStatesInE = [0 ; 0 ; 0.05 ; 5*pi/180 ; 5*pi/180 ; 0 ; 0.5 ; 0.5 ; 0.1 ; 2*pi/180 ; 2*pi/180 ; 0];
InitStates = zeros(12,1);
InitStatesInE = zeros(12,1);

MotionConfig.EnableCCForces = true;
MotionConfig.EnableRestoringForces = true;
MotionConfig.EnableDampingForces = true;
MotionConfig.EnableAirDragForces = true;
MotionConfig.EnableThrusterForces = true;
MotionConfig.SimTime = 0;
MotionConfig.SimTimeLimit = 8;
MotionConfig.TsPlant = 0.01;
MotionConfig.PrevStates = InitStates;
MotionConfig.PrevStatesInE = InitStatesInE ;
MotionConfig.WindVelocity = [0 ; 0 ; 0];
%Lookup table parameters
MotionConfig.RThrusterForceXCustom = 2*ones(MotionConfig.SimTimeLimit/MotionConfig.TsPlant+1,1);
MotionConfig.LThrusterForceXCustom = 4*ones(MotionConfig.SimTimeLimit/MotionConfig.TsPlant+1,1);

[StatesLogSim,StatesInELogSim,ForceLogSim] = VehicleMotionSim(MotionConfig);

Plotter();



