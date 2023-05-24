% Plots the boundary layer profile of the wind turbine
clc,clear,close all

% 1 denotes the pitot tubes closes to the inflow, 2 denotes the one farther
% away from the inflow, a are for large increments, b are for small
% increments 

% Dynamic pressure data
Pressure.P_1_a = [81 81 92 90 88 90 83 95 91 84 96 84 90 94 76 54];
Pressure.P_1_b = [93 92 85 78 75 76 74 70 62 55 50];
Pressure.P_2_a = [86 86 87 87 87 87 87 86 85 87 85 86 84 83.5 76 48];
Pressure.P_2_b = [84 82.5 82 80.5 79 76 72.5 70 65 60 54];


g = 9.81;           % Gravitational acceleration [m/s^2]
P_am = 1013.2*100;  % Ambient pressure [Pa]
R = 278;             % Gas constant [J/(kg*K)]
T_am = (19+273.15);  % Ambient temperature [K]

% Flow velocity
Velocity.U_1_a = sqrt((2*Pressure.P_1_a*g)/(P_am/(R*T_am)));
Velocity.U_1_b = sqrt((2*Pressure.P_1_b*g)/(P_am/(R*T_am)));
Velocity.U_2_a = sqrt((2*Pressure.P_2_a*g)/(P_am/(R*T_am)));
Velocity.U_2_b = sqrt((2*Pressure.P_2_b*g)/(P_am/(R*T_am)));


% Height above bottom surface of working section [mm]
h_a = flip(0:10:150);
h_b = flip(0:2:20);   


U_fn = fieldnames(Velocity);
set(0,'defaultTextInterpreter','latex');
for i = 1:2:length(U_fn)

figure()
plot(Velocity.(U_fn{i}),h_a,'.--k',LineWidth=1,MarkerSize=20)
title('Boundary layer flow velocity')
xlabel('Velocity [m/s]')
ylabel('Height [mm]')
xlim([25 40])
grid

  
figure()
plot(Velocity.(U_fn{i+1}),h_b,'.--k',LineWidth=1,MarkerSize=20)
title('Boundary layer flow velocity')
xlabel('Velocity [m/s]')
ylabel('Height [mm]')
xlim([25 40])
grid

end


