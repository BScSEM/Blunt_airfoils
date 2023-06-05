function [] = GraphMaker3000(results,corrected_audio,fn_main,option)

if option.gm3k == 1

set(0,'defaultTextInterpreter','latex');

graph = ["STE \ $\alpha = 0$", "BTE \ $\alpha = 0$", "STE \ $\alpha = 10$", "BTE \ $\alpha = 10$", "STE \ $\alpha = 15$", "BTE \ $\alpha = 15$"];

%% Audio plots
figure()
graphmaker3000.N0012 = tiledlayout(3,2);
title(graphmaker3000.N0012,'NACA 0012 - Audio','Interpreter','latex')
for i = 5:10
    nexttile
    hold on
    plot(results.Background_off.tspan,corrected_audio.(fn_main{i}).data)
    plot(results.Background_off.tspan,corrected_audio.(fn_main {i}).filter)
    xlabel('$Time \ [s]$')
    title(graph(i-4))
    grid minor
    hold off
end
print('audio_0012','-depsc')

figure()
graphmaker3000.N5512 = tiledlayout(3,2);
title(graphmaker3000.N5512,'NACA 5512 - Audio','Interpreter','latex')
for i = 11:16
    nexttile
    hold on
    plot(results.Background_off.tspan,corrected_audio.(fn_main{i}).data)
    plot(results.Background_off.tspan,corrected_audio.(fn_main {i}).filter)
    xlabel('$Time \ [s]$')
    title(graph(i-10))
    grid minor
    hold off
end
print('audio_5512','-depsc')

figure()
graphmaker3000.N63418 = tiledlayout(3,2);
title(graphmaker3000.N63418,'NACA 63-418 - Audio','Interpreter','latex')
for i = 17:22
    nexttile
    hold on
    plot(results.Background_off.tspan,corrected_audio.(fn_main{i}).data)
    plot(results.Background_off.tspan,corrected_audio.(fn_main {i}).filter)
    xlabel('$Time \ [s]$')
    title(graph(i-16))
    grid minor
    hold off
end
print('audio_63418','-depsc')

figure()
graphmaker3000.N64421 = tiledlayout(3,2);
title(graphmaker3000.N64421,'NACA 64-421 - Audio','Interpreter','latex')
for i = 23:28
    nexttile
    hold on
    plot(results.Background_off.tspan,corrected_audio.(fn_main{i}).data)
    plot(results.Background_off.tspan,corrected_audio.(fn_main {i}).filter)
    xlabel('$Time \ [s]$')
    title(graph(i-22))
    grid minor
    hold off
end
print('audio_64421','-depsc')

%% Filtered Power plots overview xlim([0 800] 
   
% Harmonics
f_fan = 48.33;    
f_blade = f_fan*6;
h_fan = zeros(30,1);
h_blade = zeros(4,1);
for i = 1:30
    h_fan(i) = f_fan*i; 
end
for i = 1:4
    h_blade(i) = f_blade*i;
end
xlimit = [0 700];

figure()
graphmaker3000.N0012 = tiledlayout(3,2);
title(graphmaker3000.N0012,'NACA 0012 - Power Spectrum','Interpreter','latex')
ylimit = {[0 5E-3], [0 5E-3], [0 5E-3], [0 5E-3], [0 8E-3],[0 8E-3]};
for i = 5:10
    nexttile
    hold on
    plot(results.Background_off.fspan,results.(fn_main{i}).normalized_filter_P)
    xlabel('Frequency [Hz]')
    xlim(xlimit)
    ylim(ylimit{i-4})
    title(graph(i-4))
    xline(h_fan,'--r')
    xline(h_blade,'--g')
    hold off
end
print('norm_filtered_power_0012','-depsc')

figure()
graphmaker3000.N5512 = tiledlayout(3,2);
title(graphmaker3000.N5512,'NACA 5512 - Power Spectrum','Interpreter','latex')
ylimit = {[0 6E-3], [0 6E-3],[0 8E-3], [0 8E-3], [0 6E-3], [0 6E-3]};
for i = 11:16
    nexttile
    hold on
    plot(results.Background_off.fspan,results.(fn_main{i}).normalized_filter_P)
    xlabel('Frequency [Hz]')
    xlim(xlimit)
    ylim(ylimit{i-10})
    title(graph(i-10))
    xline(h_fan,'--r')
    xline(h_blade,'--g')
    hold off
end
print('norm__filtered_power_5512','-depsc')

figure()
graphmaker3000.N63418 = tiledlayout(3,2);
title(graphmaker3000.N63418,'NACA 63-418 - Power Spectrum','Interpreter','latex')
ylimit ={[0 4E-3], [0 4E-3],[0 8E-3], [0 8E-3], [0 6E-3], [0 6E-3]};
for i = 17:22
    nexttile
    hold on
    plot(results.Background_off.fspan,results.(fn_main{i}).normalized_filter_P)
    xlabel('Frequency [Hz]')
    xlim(xlimit)
    ylim(ylimit{i-16})
    xline(h_fan,'--r')
    xline(h_blade,'--g')
    title(graph(i-16))
    hold off
end
print('norm_filtered_power_63418','-depsc')

figure()
graphmaker3000.N64421 = tiledlayout(3,2);
title(graphmaker3000.N64421,'NACA 64-421 - Power Spectrum','Interpreter','latex')
ylimit = {[0 4E-3], [0 4E-3], [0 6E-3], [0 6E-3], [0 8E-3], [0 8E-3]};
for i = 23:28
    nexttile
    hold on
    plot(results.Background_off.fspan,results.(fn_main{i}).normalized_filter_P)
    xlabel('Frequency [Hz]')
    xlim(xlimit)
    ylim(ylimit{i-22})
    xline(h_fan,'--r')
    xline(h_blade,'--g')
    title(graph(i-22))
    hold off
end
print('norm_filtered_power_64421','-depsc')


%% Power plots comparison xlim([0 800])
xlimit = [0 700];

figure()
graphmaker3000.N0012 = tiledlayout(3,2);
title(graphmaker3000.N0012,'NACA 0012 - Power Spectrum','Interpreter','latex')
for i = 5:10
    nexttile
    hold on
    plot(results.Background_off.fspan,results.(fn_main{i}).normalized_P)
    plot(results.Background_off.fspan,results.(fn_main{2}).normalized_P)
    xlabel('Frequency [Hz]')
    xlim(xlimit)
    title(graph(i-4))
    grid minor
    hold off
end
print('comparison_norm_power_0012','-depsc')

figure()
graphmaker3000.N5512 = tiledlayout(3,2);
title(graphmaker3000.N5512,'NACA 5512 - Power Spectrum','Interpreter','latex')
for i = 11:16
    nexttile
    hold on
    plot(results.Background_off.fspan,results.(fn_main{i}).normalized_P)
    plot(results.Background_off.fspan,results.(fn_main{2}).normalized_P)
    xlabel('Frequency [Hz]')
    xlim(xlimit)
    title(graph(i-10))
    grid minor
    hold off
end
print('comparison_norm_power_5512','-depsc')

figure()
graphmaker3000.N63418 = tiledlayout(3,2);
title(graphmaker3000.N63418,'NACA 63-418 - Power Spectrum','Interpreter','latex')
for i = 17:22
    nexttile
    hold on
    plot(results.Background_off.fspan,results.(fn_main{i}).normalized_P)
    plot(results.Background_off.fspan,results.(fn_main{2}).normalized_P)
    xlabel('Frequency [Hz]')
    xlim(xlimit)
    title(graph(i-16))
    grid minor
    hold off
end
print('comparison_norm_power_63418','-depsc')

figure()
graphmaker3000.N64421 = tiledlayout(3,2);
title(graphmaker3000.N64421,'NACA 64-421 - Power Spectrum','Interpreter','latex')
for i = 23:28
    nexttile
    hold on
    plot(results.Background_off.fspan,results.(fn_main{i}).normalized_P)
    plot(results.Background_off.fspan,results.(fn_main{2}).normalized_P)
    xlabel('Frequency [Hz]')
    xlim(xlimit)
    title(graph(i-22))
    grid minor
    hold off
end
print('comparison_norm_power_64421','-depsc')

%% Normalized Power plots ZOOM (xlim [35 55])
  
figure()
graphmaker3000.N0012 = tiledlayout(3,2);
title(graphmaker3000.N0012,'NACA 0012 - Power Spectrum','Interpreter','latex')
xlimit = [35 55];

for i = 5:10
    nexttile
    hold on
    plot(results.Background_off.fspan,results.(fn_main{i}).normalized_filter_ZOOM)
    plot(results.Background_off.fspan,results.(fn_main{2}).normalized_filter_ZOOM)
    xlabel('Frequency [Hz]')
    xlim(xlimit)
    title(graph(i-4))
    grid minor
    hold off
end
print('zoom_power_0012','-depsc')

figure()
graphmaker3000.N5512 = tiledlayout(3,2);
title(graphmaker3000.N5512,'NACA 5512 - Power Spectrum','Interpreter','latex')
ylimit = {[0 0.025], [0 0.025], [0 0.08], [0 0.08], [0 0.15], [0 0.15]};
for i = 11:16
    nexttile
    hold on
    plot(results.Background_off.fspan,results.(fn_main{i}).normalized_filter_ZOOM)
    plot(results.Background_off.fspan,results.(fn_main{2}).normalized_filter_ZOOM)
    xlabel('Frequency [Hz]')
    xlim(xlimit)
    ylim(ylimit{i-10})
    title(graph(i-10))
    grid minor
    hold off
end
print('zoom_power_5512','-depsc')

figure()
graphmaker3000.N63418 = tiledlayout(3,2);
title(graphmaker3000.N63418,'NACA 63-418 - Power Spectrum','Interpreter','latex')
ylimit = {[0 0.025], [0 0.025], [0 0.04], [0 0.04], [0 0.15], [0 0.15]};
for i = 17:22
    nexttile
    hold on
    plot(results.Background_off.fspan,results.(fn_main{i}).normalized_filter_ZOOM)
    plot(results.Background_off.fspan,results.(fn_main{2}).normalized_filter_ZOOM)
    xlabel('Frequency [Hz]')
    xlim(xlimit)
    ylim(ylimit{i-16})
    title(graph(i-16))
    grid minor
    hold off
end
print('zoom_power_63418','-depsc')

figure()
graphmaker3000.N64421 = tiledlayout(3,2);
title(graphmaker3000.N64421,'NACA 64-421 - Power Spectrum','Interpreter','latex')
ylimit = {[0 0.025], [0 0.025], [0 0.08], [0 0.08], [0 0.2], [0 0.2]};
for i = 23:28
    nexttile
    hold on
    plot(results.Background_off.fspan,results.(fn_main{i}).normalized_filter_ZOOM)
    plot(results.Background_off.fspan,results.(fn_main{2}).normalized_filter_ZOOM)
    xlabel('Frequency [Hz]')
    xlim(xlimit)
    ylim(ylimit{i-22})
    title(graph(i-22))
    grid minor
    hold off
end
print('zoom_power_64421','-depsc')


end