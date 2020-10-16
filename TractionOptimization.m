close all;
clear all;
clc;

% mut = .9; %Coefficient for dry concrete
% massbw = 20:.01:260; %Assuming half bike mass (250-400 lbs)
% masstot = (massbw-60)*2+80;
% time = 0:.01:240;
% %and 75% rider mass(80 kg) is on back wheel
% accelg = 9.81;
% %Fm needs to be less than or equal to the tractive force
% %Ideally, Fm = mut*mass*accel
% Cd = 1.8; %Average for motorcycles + rider
% Af = .8*1.2; %in meters
% rho = 1.225; %Density at sea level, in kg/m^3
% Cr = .01; %Rolling resistance on concrete
% %masstot*accel + 1/2*rho*Cd*Af*vel + Cr*masstot*accelg + (Fc = 0) =
% %mut*massbw*accelg
% 
% %tmp = mut*massbw*accelg-Cr*masstot*accelg;
% %coeffs = 1/2*rho*Cd*Af;
% %syms vel(masstot) tmp coeffs masstot
% %eqn = masstot*diff(vel,masstot)+coeffs*vel == tmp;
% %cond = vel(0) == 0;
% %vel = dsolve(eqn,cond);
% %Given results from the above equation:
% tmp = mut*massbw*accelg-Cr*masstot*accelg;
% coeffs = 1/2*rho*Cd*Af;
% max_vel = (tmp - tmp*exp(-(coeffs.*time)/masstot))/coeffs;
% %plot(masstot,velocity);
% %plot3(time,masstot,max_vel);
% %xlabel('Time');
% %ylabel('Total Mass');
% %zlabel('Max Velocity');
% accel = diff(max_vel);
% accel(24001) = accel(24000); %Padding to allow plotting; last value is invalid.
% plot3(time,masstot,accel);
% zlabel('Max Acceleration (m/s^2)');
% ylabel ('Total Mass (kg)');
% xlabel('Time (seconds)');
%accel = (
%v = 

%Max accel = F/mtot

mut = .9; %Coefficient for dry concrete
massbw = 50:.01:260; %Assuming half bike mass plus 75% of rider mass
masstot = (massbw-60)*2+80;
max_force_onewheel = mut*massbw*9.81;
max_accel_onewheel = max_force_onewheel./masstot;
plot(masstot,max_accel_onewheel);
xlabel('Total Mass (kg)');
ylabel('Maximum Acceleration (m/s^2)')
title('Max Accel vs Mass for one driving wheel')
max_force_both = mut*masstot*9.81;
max_accel_both = max_force_both./masstot;
figure
plot(masstot,max_accel_both);
xlabel('Total Mass (kg)');
ylabel('Maximum Acceleration (m/s^2)')
title('Max Accel vs Mass for two driving wheels')
rw = .2159; %Average motercycle tire rad is 8.5 inches, this is in meters
Tm_one = max_force_onewheel*rw;
Tm_both = max_force_both*rw;
figure
plot(masstot,Tm_one);
xlabel('Total Mass (kg)');
ylabel('Maximum Torque (Nm)')
title('Torque needed for max accel for one driving wheel')
figure
plot(masstot,Tm_both);
xlabel('Total Mass (kg)');
ylabel('Maximum Torque (Nm)')
title('Combined torque needed for max accel for two driving wheels')
% We are able to accelerate so fast that the rolling resistance
% becomes negligable in face of the drag force. Fc = 0 as we are
% not going up or down a hill.   

