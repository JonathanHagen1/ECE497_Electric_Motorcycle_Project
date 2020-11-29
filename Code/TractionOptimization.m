close all;
clear all;
clc;

mut = .9; %Coefficient for dry concrete
massbw = 50:.01:260; %Assuming half bike mass plus 75% of rider mass
masstot = (massbw-60)*2+80;
max_force_onewheel = mut*massbw*9.81; %Assuming the motor is only on the back wheel
%MaxForce = ?t*m*ag - ?t is the traction coefficient
max_accel_onewheel = max_force_onewheel./masstot; %a = F/m
plot(masstot,max_accel_onewheel);
xlabel('Total Mass (kg)');
ylabel('Maximum Acceleration (m/s^2)')
title('Max Accel vs Mass for one driving wheel')
max_force_both = mut*masstot*9.81; %Same as one wheel but for the total mass
max_accel_both = max_force_both./masstot;
figure
plot(masstot,max_accel_both);
xlabel('Total Mass (kg)');
ylabel('Maximum Acceleration (m/s^2)')
title('Max Accel vs Mass for two driving wheels')
treadWidth = 140;
aspectRatio = .7;
RimRad = 17;
rw = (140*.7*2/1000 + 17*.0254)/2; %tread plus rim radius, in meters
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

