close all
%SaveString = 'ZS_ZI_';
%SaveString = 'NZS_ZI_';
%SaveString = 'ZS_NZI_EQF_';
SaveString = 'ZS_NZI_NEQF_';

%States Part

% x y z
figure
stairs(StatesLogSim(:,1),StatesLogSim(:,2),'LineWidth',2);
grid on
hold on
stairs(StatesLogSim(:,1),StatesLogSim(:,3),'r--','LineWidth',2);
hold on
stairs(StatesLogSim(:,1),StatesLogSim(:,4),'g:','LineWidth',3);
xlabel('Time(s)')
ylabel('Linear Positions (m)')
legend('x','y','z')

hgexport(gcf, [SaveString 'xyz.png'], hgexport('factorystyle'), 'Format', 'png');

% phi theta psiy
figure
stairs(StatesLogSim(:,1),StatesLogSim(:,5),'LineWidth',2);
grid on
hold on
stairs(StatesLogSim(:,1),StatesLogSim(:,6),'r--','LineWidth',2);
hold on
stairs(StatesLogSim(:,1),StatesLogSim(:,7),'g:','LineWidth',3);
xlabel('Time(s)')
ylabel('Angular Positions (rad)')
legend('Roll','Pitch','Yaw')

hgexport(gcf, [SaveString 'rtp.png'], hgexport('factorystyle'), 'Format', 'png');

%u v w
figure
stairs(StatesLogSim(:,1),StatesLogSim(:,8),'LineWidth',2);
grid on
hold on
stairs(StatesLogSim(:,1),StatesLogSim(:,9),'r--','LineWidth',2);
hold on
stairs(StatesLogSim(:,1),StatesLogSim(:,10),'g:','LineWidth',3);
xlabel('Time(s)')
ylabel('Lineer Speeds (m/s)')
legend('u','v','w')

hgexport(gcf, [SaveString 'uvw.png'], hgexport('factorystyle'), 'Format', 'png');

%p q r
figure
stairs(StatesLogSim(:,1),StatesLogSim(:,11),'LineWidth',2);
grid on
hold on
stairs(StatesLogSim(:,1),StatesLogSim(:,12),'r--','LineWidth',2);
hold on
stairs(StatesLogSim(:,1),StatesLogSim(:,13),'g:','LineWidth',3);
grid on
xlabel('Time(s)')
ylabel('Angular Speeds (rad/s)')
legend('Roll','Pitch','Yaw')

hgexport(gcf, [SaveString 'pqr.png'], hgexport('factorystyle'), 'Format', 'png');

%Force Part

%x forces
figure
stairs(ForceLogSim(:,1),ForceLogSim(:,2),'LineWidth',2);
grid on
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,8),'r--','LineWidth',2);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,14),'g:','LineWidth',3);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,20),'c-.','LineWidth',2);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,26),'k.','LineWidth',2);
xlabel('Time(s)')
ylabel('X Force (N)')
legend('Ftt','-Fcc','Fg','Fwd','Fad');

hgexport(gcf, [SaveString 'XForce.png'], hgexport('factorystyle'), 'Format', 'png');

%y forces
figure
stairs(ForceLogSim(:,1),ForceLogSim(:,3),'LineWidth',2);
grid on
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,9),'r--','LineWidth',2);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,15),'g:','LineWidth',3);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,21),'c-.','LineWidth',2);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,27),'k.','LineWidth',2);
xlabel('Time(s)')
ylabel('Y Force (N)')
legend('Ftt','-Fcc','Fg','Fwd','Fad');

hgexport(gcf, [SaveString 'YForce.png'], hgexport('factorystyle'), 'Format', 'png');

%z forces
figure
stairs(ForceLogSim(:,1),ForceLogSim(:,4),'LineWidth',2);
grid on
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,10),'r--','LineWidth',2);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,16),'g:','LineWidth',3);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,22),'c-.','LineWidth',2);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,28),'k.','LineWidth',2);
xlabel('Time(s)')
ylabel('Z Force (N)')
legend('Ftt','-Fcc','Fg','Fwd','Fad');

hgexport(gcf, [SaveString 'ZForce.png'], hgexport('factorystyle'), 'Format', 'png');

%x torque
figure
stairs(ForceLogSim(:,1),ForceLogSim(:,5),'LineWidth',2);
grid on
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,11),'r--','LineWidth',2);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,17),'g:','LineWidth',3);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,23),'c-.','LineWidth',2);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,29),'k.','LineWidth',2);
xlabel('Time(s)')
ylabel('X Torque (Nm)')
legend('Ftt','-Fcc','Fg','Fwd','Fad');

hgexport(gcf, [SaveString 'XTorque.png'], hgexport('factorystyle'), 'Format', 'png');

%y torque
figure
stairs(ForceLogSim(:,1),ForceLogSim(:,6),'LineWidth',2);
grid on
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,12),'r--','LineWidth',2);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,18),'g:','LineWidth',3);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,24),'c-.','LineWidth',2);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,30),'k.','LineWidth',2);
xlabel('Time(s)')
ylabel('Y Torque (Nm)')
legend('Ftt','-Fcc','Fg','Fwd','Fad');

hgexport(gcf, [SaveString 'YTorque.png'], hgexport('factorystyle'), 'Format', 'png');

%z torque
figure
stairs(ForceLogSim(:,1),ForceLogSim(:,7),'LineWidth',2);
grid on
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,13),'r--','LineWidth',2);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,19),'g:','LineWidth',3);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,25),'c-.','LineWidth',2);
hold on
stairs(ForceLogSim(:,1),ForceLogSim(:,31),'k.','LineWidth',2);
xlabel('Time(s)')
ylabel('Z Torque (N)')
legend('Ftt','-Fcc','Fg','Fwd','Fad');

hgexport(gcf, [SaveString 'ZTorque.png'], hgexport('factorystyle'), 'Format', 'png');

% x-y plot
% figure
% stairs(StatesLogSim(:,2),-StatesLogSim(:,3),'LineWidth',2);
% grid on
% xlabel('xPos(m)')
% ylabel('yPos(m)')