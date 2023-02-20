% Determine reference velocity of wind tunnel with respect to fan speed
clc,clear,close

% Flow velocity
U = [37.79 35.12 31.20 28.20 24.67 22.06 18.46 15.60 11.39 9.01 5.70 0.00 0.00];

% Fan speed 
fan_speed = flip(((0:0.25:3)/3)*100);

% Plot
figure()
set(0,'defaultTextInterpreter','latex');
plot(U,fan_speed,'.-',LineWidth=2,MarkerSize=20)
title('Reference velocity')
xlabel('Velocity [m/s]')
ylabel('Fan speed \%')
legend('Messured wind velocity',Location='northwest')
grid 

print('Reference_velocity', '-depsc');  


