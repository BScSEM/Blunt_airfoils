% Determine reference velocity of wind tunnel with respect to fan speed

% Flow velocity
U = [37.79 35.12 31.20 28.20 24.67 22.06 18.46 15.60 11.39 9.01 5.70 0.00 0.00];

% Fan speed (as rotations of control knob)
fan_speed = (0:0.25:3);
fan_speed = (fan_speed/3)*100;
fan_speed = flip(fan_speed);

figure
plot(fan_speed,U)
ylabel('Velocity [m/s]')
xlabel('Fan speed')



