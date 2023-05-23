% Plots mean lift and mean drag
clc,clear,close all

load('mean_lift')
load('mean_drag')

fn_mean_lift = fieldnames(mean_lift);
fn_mean_drag = fieldnames(mean_drag);




%%

set(0,'defaultTextInterpreter','latex');
set(0,'defaultAxesTickLabelInterpreter','latex');  





%% Lift A=0
figure()
title('Lift $\alpha=0$')
a0 = 0;
hold on
for i = 1:numel(fn_mean_lift)

    iseven = rem(i, 2) == 0;

    if iseven == 0   % Odd --> A=0
        if a0 == 0            
            plot(i,mean_lift.(fn_mean_lift{i}),'xk',MarkerSize=10,LineWidth=1.5)
            a0 = 1;
        else
            plot(i-2,mean_lift.(fn_mean_lift{i}),'.k',MarkerSize=20)
            a0 = 0;
        end
    end
end
legend('Blunt','Standard','interpreter','latex',Location='northwest')
xlim([0 16])
grid
xticks([1 5 9 13]);
xticklabels({'0012','5512','63-318','64-421'})
ylabel('Drag [N]')
hold off

%% Lift A=10
figure()
title('Lift $\alpha=10$')
a10 = 0;
hold on
for i = 1:numel(fn_mean_lift)

    iseven = rem(i, 2) == 0;

    if iseven == 1  % Even --> A=10
        if a10 == 0
            plot(i,mean_lift.(fn_mean_lift{i}),'.',MarkerSize=20)
            a10 = 1;
        else
            plot(i-2,mean_lift.(fn_mean_lift{i}),'x',MarkerSize=20)
            a10 = 0;
        end
    end
end
legend(fn_mean_lift(1:2:end),Location="eastoutside")
xlim([0 16])
grid
hold off



%% Drag A=0
figure()
title('Drag $\alpha=0$')
a0 = 0;
hold on
for i = 1:numel(fn_mean_drag)

    iseven = rem(i, 2) == 0;

    if iseven == 0   % Odd --> A=0
        if a0 == 0            
            plot(i,mean_drag.(fn_mean_drag{i}),'.',MarkerSize=20)
            a0 = 1;
        else
            plot(i-2,mean_drag.(fn_mean_drag{i}),'x',MarkerSize=20)
            a0 = 0;
        end
    end
end
legend(fn_mean_drag(1:2:end),Location="eastoutside")
xlim([0 16])
grid
hold off

%% Drag A=10
figure()
title('Drag $\alpha=10$')
a10 = 0;
hold on
for i = 1:numel(fn_mean_drag)

    iseven = rem(i, 2) == 0;

    if iseven == 1  % Even --> A=10
        if a10 == 0
            plot(i,mean_drag.(fn_mean_drag{i}),'.',MarkerSize=20)
            a10 = 1;
        else
            plot(i-2,mean_drag.(fn_mean_drag{i}),'x',MarkerSize=20)
            a10 = 0;
        end
    end
end
legend(fn_mean_drag(1:2:end),Location="eastoutside")
xlim([0 16])
grid
hold off



