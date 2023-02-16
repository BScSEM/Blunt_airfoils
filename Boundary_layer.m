% Plots the boundary layer profile of the wind turbine

% Flow velocity
U = [38.85 38.64 37.14 35.58 34.89 35.12 34.65 33.70 31.72 29.88 28.49];

% Height [mm]
h = (0:2:20);   

figure()
set(0,'defaultTextInterpreter','latex');
plot(U,h)
xlabel('Velocity')
ylabel('Height [mm]')




