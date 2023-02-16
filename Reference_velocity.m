
U = [37.79 35.12 31.20 28.20 24.67 22.06 18.46 15.60 11.39 9.01 5.70 0.00 0.00];

fan_speed = (0:0.25:3);

fan_speed = flip(fan_speed);
fan_speed = (fan_speed/3)*100

figure
plot(fan_speed,U)
ylabel('U')
xlabel('Fan speed')



