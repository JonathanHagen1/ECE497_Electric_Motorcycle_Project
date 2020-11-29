close all;
clear all;
clc;

close all;
clear all;
clc;

Cd = .461414637; %Based off of a study for a very similar bike shape at this link: 
%https://info.simuleon.com/blog/how-to-calculate-drag-coefficient-for-motorcycle#:~:text=F%20%3D%200%2C5%20x%20%CF%81,airdensity%20in%20kg%20per%20m%C2%B3.
rho = 1.225; %Air density at sea level
Af = .8*(1.2+.4445); %Approx. size of the front of the bike, in meters, plus
%the average size of a human torso (17.5 inches) in meters.
Cr = .02; %Source: https://www.wikiwand.com/en/Motorcycle_tyre
g = 9.8;
%% Change mass when all is calculated. 
m = 182.5; %114.5 kg + 70 kg
treadWidth = 140;
aspectRatio = .7;
RimRad = 17;
rw = (treadWidth*aspectRatio*2/1000 + RimRad*.0254)/2;
max_accel = 5.4292; %m/s^2, any faster and the bike will spin out.
%Max torque (230 Nm) will be applied for the
%duration, and the steady state torque (96 Nm) will be applied after. 
timestep = .01;
time = 0:timestep:100;
T = zeros(size(time));
vel = zeros(size(time));
dist = zeros(size(time));
Fr = Cr*m*g; %Constant, no changes in incline
Ngb = 11; %https://www.motorcyclespecs.co.za/Techinicale/Gear_Ratios.html
ngb = 1;

counter = 2;
while(dist(counter - 1) <= 402.336) 
    if vel(counter - 1) >= 124.35
        T(counter) = 96; %96 and 230, 90 and 50 between the two motors
    else
        T(counter) = 230;
    end
    Fd = 1/2*rho*Cd*Af*(vel(counter-1))^2;
    vel(counter) = vel(counter - 1) + timestep*(Ngb*ngb*T(counter) - rw*(Fd+Fr))/(rw*m);
    %Not checking for max speed as the max speed of the bike is 83.65 m/s
    %due to the DC bus, the max speed reached is 66 m/s
    if (vel(counter) - vel(counter - 1))/timestep > max_accel
        vel(counter) = vel(counter - 1) + max_accel*timestep;
        T(counter) = ((vel(counter) - vel(counter - 1))*rw*m/timestep + rw*(Fd+Fr))/Ngb*ngb;
    end
    dist(counter) = dist(counter - 1) + vel(counter)*timestep;
    counter = counter + 1;
end

[val pos] = max(dist)
dist = dist(1:pos);
time = time(1:pos);
vel = vel(1:pos);
T = T(1:pos);
wr = vel/rw*60/2/pi;
power = T.*wr;
