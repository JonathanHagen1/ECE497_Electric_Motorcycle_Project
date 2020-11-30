
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


%Wheel radius we're working with is 17 inches
%Box for stuff is ~Foot tall + .25 ft area above box
%~1.5 feet wide
%Length of batterypack = L = (n +½)D
%W = [0.866(p-1)+1] D = staggered direction
%~ 243 by 261 mm = big battery pack
%Small area is 153 by 207 mm = small battery pack
%All packs are 65mm tall

%wr = wt, 1-1 GB, max wr = 5500 RPM, or 575.96 rad/s.
%Therefore, max speed is .2159*575.96 = 124.35 m/s
%So the bike will accelerate at 5.8738 m/s^2 for 21.169881 seconds
%before reaching top speed, and the rotor will accelerate at 27.20657712
%rad/s^2 for that duration.

%96 and 230, 90 and 50 between the two motors