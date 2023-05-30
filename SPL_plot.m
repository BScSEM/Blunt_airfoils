function SPL_plot(results,fn_main,option)
% Both tripped and untripped must be included

if option.background == 1
    fn_main_NBG = fn_main(5:numel(fn_main));
end

fn_untripped = fn_main_NBG(1:numel(fn_main_NBG)/2);
fn_tripped = fn_main_NBG(numel(fn_main_NBG)/2+1:end);

%% 0012
figure()
set(0,'defaultTextInterpreter','latex');
hold on

for i = 1:6

    iseven = rem(i,2);
    if iseven == 0
        plot(i-1,results.(fn_untripped{i}).SPL,'xk',MarkerSize=10,LineWidth=1.5)
        plot(i-1,results.(fn_tripped{i}).SPL,'xr',MarkerSize=10,LineWidth=1.5)
    else
        plot(i,results.(fn_untripped{i}).SPL,'.k',MarkerSize=20,LineWidth=1.5)
        plot(i,results.(fn_tripped{i}).SPL,'.r',MarkerSize=20,LineWidth=1.5)
    end

    
end
title('SPL NACA 0012')
xlim([0 6])
ylim([110 115])
ylabel('dB',Rotation=360)
xlabel('AOA')
xticks([1 3 5])
xticklabels({'0°','10°','15°'})
legend('STE Untripped ','STE Tripped ','BTE Untripped ','BTE Tripped ',Location='northwest')
grid
hold off
print('SPL_0012', '-depsc');  

%% 5512

figure()
hold on

for i = 7:12
j = i-6;

    iseven = rem(i,2);
    if iseven == 0
        plot(j-1,results.(fn_untripped{i}).SPL,'xk',MarkerSize=10,LineWidth=1.5)
        plot(j-1,results.(fn_tripped{i}).SPL,'xr',MarkerSize=10,LineWidth=1.5)
    else
        plot(j,results.(fn_untripped{i}).SPL,'.k',MarkerSize=20,LineWidth=1.5)
        plot(j,results.(fn_tripped{i}).SPL,'.r',MarkerSize=20,LineWidth=1.5)
    end

end
title('SPL NACA 5512')
xlim([0 6])
ylim([110 115])
ylabel('dB',Rotation=360)
xlabel('AOA')
xticks([1 3 5])
xticklabels({'0°','10°','15°'})
legend('STE Untripped ','STE Tripped ','BTE Untripped ','BTE Tripped ',Location='northwest')
grid
hold off
print('SPL_5512', '-depsc');  

%% 63-318

figure()
hold on
for i = 13:18
j = i-12;

    iseven = rem(i,2);
    if iseven == 0
        plot(j-1,results.(fn_untripped{i}).SPL,'xk',MarkerSize=10,LineWidth=1.5)
        plot(j-1,results.(fn_tripped{i}).SPL,'xr',MarkerSize=10,LineWidth=1.5)
    else
        plot(j,results.(fn_untripped{i}).SPL,'.k',MarkerSize=20,LineWidth=1.5)
        plot(j,results.(fn_tripped{i}).SPL,'.r',MarkerSize=20,LineWidth=1.5)
    end

end
title('SPL NACA 63-318')
xlim([0 6])
ylim([110 115])
ylabel('dB',Rotation=360)
xlabel('AOA')
xticks([1 3 5])
xticklabels({'0°','10°','15°'})
legend('STE Untripped ','STE Tripped ','BTE Untripped ','BTE Tripped ',Location='northwest')
grid
hold off
print('SPL_63318', '-depsc');  

%% 64-421

figure()
hold on
for i = 19:24
j = i-18;

    iseven = rem(i,2);
    if iseven == 0
        plot(j-1,results.(fn_untripped{i}).SPL,'xk',MarkerSize=10,LineWidth=1.5)
        plot(j-1,results.(fn_tripped{i}).SPL,'xr',MarkerSize=10,LineWidth=1.5)
    else
        plot(j,results.(fn_untripped{i}).SPL,'.k',MarkerSize=20,LineWidth=1.5)
        plot(j,results.(fn_tripped{i}).SPL,'.r',MarkerSize=20,LineWidth=1.5)
    end

end
title('SPL NACA 64-421')
xlim([0 6])
ylim([110 115])
ylabel('dB',Rotation=360)
xlabel('AOA')
xticks([1 3 5])
xticklabels({'0°','10°','15°'})
legend('STE Untripped ','STE Tripped ','BTE Untripped ','BTE Tripped ',Location='northwest')
grid
hold off
print('SPL_64421', '-depsc');  






