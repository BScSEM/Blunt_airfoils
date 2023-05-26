% Noise_analysis
% Import audio recordings, and calls Audio_vis to visualize the data

clc,clear,close all



%% Options
% Set to 1 to activate

option.save = 0;    % Not working 

option.print = 0;

% Include types of tests
option.background = 1;
option.untriped = 1;
option.tripped = 0;


% Plot options
option.recording = 0;
option.fft = 0;
option.loglog = 0;
option.recording_tiled = 0;
option.fft_tiled = 0;
option.loglog_tiled = 0;
option.SPL = 0;
option.graphmaker3000 = 1;


option.filter = 1;


%% Import data

% Reference
[reference] = audioread('Audio_recordings\Reference_sound.wav');

% Background
if option.background == 1
[main.Background_off.data,main.Background_off.fs] = audioread("Audio_recordings\Background\Background_off.wav");
[main.Background_no_rod.data,main.Background_no_rod.fs] = audioread("Audio_recordings\Background\Background_no_rod.wav");
[main.Background_rod_1.data,main.Background_rod_1.fs] = audioread("Audio_recordings\Background\Background_rod_1.wav");
[main.Background_rod_2.data,main.Background_rod_2.fs] = audioread("Audio_recordings\Background\Background_rod_2.wav");
end

% Untripped flow
if option.untriped == 1
[main.UT_0012_s_a0_01.data,main.UT_0012_s_a0_01.fs] = audioread("Audio_recordings\Untripped\UT_0012_s_a0_01.wav");
[main.UT_0012_b_a0_01.data,main.UT_0012_b_a0_01.fs] = audioread("Audio_recordings\Untripped\UT_0012_b_a0_01.wav");
[main.UT_0012_s_a10_01.data,main.UT_0012_s_a10_01.fs] = audioread("Audio_recordings\Untripped\UT_0012_s_a10_01.wav");
[main.UT_0012_b_a10_01.data,main.UT_0012_b_a10_01.fs] = audioread("Audio_recordings\Untripped\UT_0012_b_a10_01.wav");
[main.UT_0012_s_a15_01.data,main.UT_0012_s_a15_01.fs] = audioread("Audio_recordings\Untripped\UT_0012_s_a15_01.wav");
[main.UT_0012_b_a15_01.data,main.UT_0012_b_a15_01.fs] = audioread("Audio_recordings\Untripped\UT_0012_b_a15_01.wav");

[main.UT_5512_s_a0_01.data,main.UT_5512_s_a0_01.fs] = audioread("Audio_recordings\Untripped\UT_5512_s_a0_01.wav");
[main.UT_5512_b_a0_01.data,main.UT_5512_b_a0_01.fs] = audioread("Audio_recordings\Untripped\UT_5512_b_a0_01.wav");
[main.UT_5512_s_a10_01.data,main.UT_5512_s_a10_01.fs] = audioread("Audio_recordings\Untripped\UT_5512_s_a10_01.wav");
[main.UT_5512_b_a10_01.data,main.UT_5512_b_a10_01.fs] = audioread("Audio_recordings\Untripped\UT_5512_b_a10_01.wav");
[main.UT_5512_s_a15_01.data,main.UT_5512_s_a15_01.fs] = audioread("Audio_recordings\Untripped\UT_5512_s_a15_01.wav");
[main.UT_5512_b_a15_01.data,main.UT_5512_b_a15_01.fs] = audioread("Audio_recordings\Untripped\UT_5512_b_a15_01.wav");

[main.UT_63418_s_a0_01.data,main.UT_63418_s_a0_01.fs] = audioread("Audio_recordings\Untripped\UT_63418_s_a0_01.wav");
[main.UT_63418_b_a0_01.data,main.UT_63418_b_a0_01.fs] = audioread("Audio_recordings\Untripped\UT_63418_b_a0_01.wav");
[main.UT_63418_s_a10_01.data,main.UT_63418_s_a10_01.fs] = audioread("Audio_recordings\Untripped\UT_63418_s_a10_01.wav");
[main.UT_63418_b_a10_01.data,main.UT_63418_b_a10_01.fs] = audioread("Audio_recordings\Untripped\UT_63418_b_a10_01.wav");
[main.UT_63418_s_a15_01.data,main.UT_63418_s_a15_01.fs] = audioread("Audio_recordings\Untripped\UT_63418_s_a15_01.wav");
[main.UT_63418_b_a15_01.data,main.UT_63418_b_a15_01.fs] = audioread("Audio_recordings\Untripped\UT_63418_b_a15_01.wav");

[main.UT_64421_s_a0_01.data,main.UT_64421_s_a0_01.fs] = audioread("Audio_recordings\Untripped\UT_64421_s_a0_01.wav");
[main.UT_64421_b_a0_01.data,main.UT_64421_b_a0_01.fs] = audioread("Audio_recordings\Untripped\UT_64421_b_a0_01.wav");
[main.UT_64421_s_a10_01.data,main.UT_64421_s_a10_01.fs] = audioread("Audio_recordings\Untripped\UT_64421_s_a10_01.wav");
[main.UT_64421_b_a10_01.data,main.UT_64421_b_a10_01.fs] = audioread("Audio_recordings\Untripped\UT_64421_b_a10_01.wav");
[main.UT_64421_s_a15_01.data,main.UT_64421_s_a15_01.fs] = audioread("Audio_recordings\Untripped\UT_64421_s_a15_01.wav");
[main.UT_64421_b_a15_01.data,main.UT_64421_b_a15_01.fs] = audioread("Audio_recordings\Untripped\UT_64421_b_a15_01.wav");

end


% Tripped flow
if option.tripped == 1
[main.TF_0012_s_a0_01.data,main.TF_0012_s_a0_01.fs] = audioread("Audio_recordings\Tripped\TF_0012_s_a0.wav");
[main.TF_0012_b_a0_01.data,main.TF_0012_b_a0_01.fs] = audioread("Audio_recordings\Tripped\TF_0012_b_a0.wav");
[main.TF_0012_s_a10_01.data,main.TF_0012_s_a10_01.fs] = audioread("Audio_recordings\Tripped\TF_0012_s_a10.wav");
[main.TF_0012_b_a10_01.data,main.TF_0012_b_a10_01.fs] = audioread("Audio_recordings\Tripped\TF_0012_b_a10.wav");
[main.TF_0012_s_a15_01.data,main.TF_0012_s_a15_01.fs] = audioread("Audio_recordings\Tripped\TF_0012_s_a15.wav");
[main.TF_0012_b_a15_01.data,main.TF_0012_b_a15_01.fs] = audioread("Audio_recordings\Tripped\TF_0012_b_a15.wav");

[main.TF_5512_s_a0_01.data,main.TF_5512_s_a0_01.fs] = audioread("Audio_recordings\Tripped\TF_5512_s_a0.wav");
[main.TF_5512_b_a0_01.data,main.TF_5512_b_a0_01.fs] = audioread("Audio_recordings\Tripped\TF_5512_b_a0.wav");
[main.TF_5512_s_a10_01.data,main.TF_5512_s_a10_01.fs] = audioread("Audio_recordings\Tripped\TF_5512_s_a10.wav");
[main.TF_5512_b_a10_01.data,main.TF_5512_b_a10_01.fs] = audioread("Audio_recordings\Tripped\TF_5512_b_a10.wav");
[main.TF_5512_s_a15_01.data,main.TF_5512_s_a15_01.fs] = audioread("Audio_recordings\Tripped\TF_5512_s_a15.wav");
[main.TF_5512_b_a15_01.data,main.TF_5512_b_a15_01.fs] = audioread("Audio_recordings\Tripped\TF_5512_b_a15.wav");

[main.TF_63418_s_a0_01.data,main.TF_63418_s_a0_01.fs] = audioread("Audio_recordings\Tripped\TF_63418_s_a0.wav");
[main.TF_63418_b_a0_01.data,main.TF_63418_b_a0_01.fs] = audioread("Audio_recordings\Tripped\TF_63418_b_a0.wav");
[main.TF_63418_s_a10_01.data,main.TF_63418_s_a10_01.fs] = audioread("Audio_recordings\Tripped\TF_63418_s_a10.wav");
[main.TF_63418_b_a10_01.data,main.TF_63418_b_a10_01.fs] = audioread("Audio_recordings\Tripped\TF_63418_b_a10.wav");
[main.TF_63418_s_a15_01.data,main.TF_63418_s_a15_01.fs] = audioread("Audio_recordings\Tripped\TF_63418_s_a15.wav");
[main.TF_63418_b_a15_01.data,main.TF_63418_b_a15_01.fs] = audioread("Audio_recordings\Tripped\TF_63418_b_a15.wav");

[main.TF_64421_s_a0_01.data,main.TF_64421_s_a0_01.fs] = audioread("Audio_recordings\Tripped\TF_64421_s_a0.wav");
[main.TF_64421_b_a0_01.data,main.TF_64421_b_a0_01.fs] = audioread("Audio_recordings\Tripped\TF_64421_b_a0.wav");
[main.TF_64421_s_a10_01.data,main.TF_64421_s_a10_01.fs] = audioread("Audio_recordings\Tripped\TF_64421_s_a10.wav");
[main.TF_64421_b_a10_01.data,main.TF_64421_b_a10_01.fs] = audioread("Audio_recordings\Tripped\TF_64421_b_a10.wav");

[main.TF_64421_s_a15_01.data,main.TF_64421_s_a15_01.fs] = audioread("Audio_recordings\Tripped\TF_64421_s_a15.wav");
[main.TF_64421_b_a15_01.data,main.TF_64421_b_a15_01.fs] = audioread("Audio_recordings\Tripped\TF_64421_b_a15.wav");
end


%% Set data scale

T = 10; % Set new length of recording to by analyzed [s]

fn_main = fieldnames(main);
[corrected_audio] = correct_data(main,T);
fn_audio_cor = fieldnames(corrected_audio);
for i = 1:numel(fn_audio_cor)
    main.(fn_main{i}).data = corrected_audio.(fn_audio_cor{i}).data;
end

%% FFT 

fn_main = fieldnames(main);

fs = main.(fn_main{1}).fs;

for i = 1:length(fn_main)
    results.(fn_main{i}) = Audio_vis(main.(fn_main{i}).data,main.(fn_main{i}).fs,fn_main(i),option);
    % plot recording, FFT and loglog FFT
end

% Plot results tiled
Audio_vis_tiled(results,main,option)


%% Audio recording vs Filtered recording

if option.filter == 1
N = fs * 10;    % Samples
f1 = 30;        % Lower cutoff frequency (in Hz)
f2 = 70;        % Upper cutoff frequency (in Hz)
f3 = 260;       % Lower cutoff frequency (in Hz)
f4 = 310;       % Upper cutoff frequency (in Hz)
f5 = 560;       % Lower cutoff frequency (in Hz)
f6 = 610;       % Upper cutoff frequency (in Hz)

for i = 1:length(fn_main)
    y = bandstop(corrected_audio.(fn_main{i}).data,[f1 f2],fs);
    y = bandstop(y,[f3 f4],fs);
    corrected_audio.(fn_main{i}).filter = bandstop(y,[f5 f6],fs);
end

if option.recording_tiled == 1
    figure()
    t2_rec = tiledlayout('flow');
    title(t2_rec,'Audio recording vs Filtered audio recording')
    for i = 1:length(fn_main)
        nexttile
        hold on
        plot(results.(fn_main{i}).tspan,corrected_audio.(fn_main{i}).data)
        plot(results.(fn_main{i}).tspan,corrected_audio.(fn_main{i}).filter)
        title(fn_audio_cor(i))
        xlabel('time [s]')
        ylabel('Amplitude')
        hold off
    end
end

%% Power vs Filtered Power

for i = 1:length(fn_main)
    FT = fft(corrected_audio.(fn_main{i}).filter)'/N;

        % Remove mean value
    FT(1) = [];

        % Extract detectable frequencies
    YP = FT(1:floor(N/2));

        % Determine power
    results.(fn_main{i}).filtered_P = abs(YP).^2;
end

if option.fft_tiled == 1
    figure()
    t3_rec = tiledlayout('flow');
    title(t3_rec,'Filtered Power Spectrum')
    for i = 1:length(fn_main)
        nexttile
        plot(results.(fn_main{i}).fspan, results.(fn_main{i}).filtered_P)
        title(fn_audio_cor(i))
        xlabel('Frequency [Hz]')
        xlim([0 2500])
        
    end
end

end

%% loglog vs Filtered loglog

if option.loglog_tiled == 1
    figure()
    t4_rec = tiledlayout('flow');
    title(t4_rec,'Logarithmic FFT')
    for i = 1:length(fn_main)
        nexttile
        loglog(results.(fn_main{i}).fspan, results.(fn_main{i}).filtered_P)
        title(fn_audio_cor(i))
        xlabel('Frequency [Hz]')
        
    end
end

%% GraphMaker3000

if option.graphmaker3000 == 1
set(0,'defaultTextInterpreter','latex');

    % Audio plots
figure()
graphmaker3000.N0012 = tiledlayout(3,2);
title(graphmaker3000.N0012,'NACA 0012')
for i = 5:10
    nexttile
    hold on
    plot(results.Background_off.tspan,corrected_audio.(fn_main{i}).data)
    plot(results.Background_off.tspan,corrected_audio.(fn_main {i}).filter)
    xlabel('$Time \ [s]$')
    legend({'Audio recording','Filtered audio recording'})
    title('$Standard \ \alpha0$')
    hold off
end

figure()
graphmaker3000.N5512 = tiledlayout(3,2);
title(graphmaker3000.N5512,'NACA 5512')
for i = 11:16
    nexttile
    hold on
    plot(results.Background_off.tspan,corrected_audio.(fn_main{i}).data)
    plot(results.Background_off.tspan,corrected_audio.(fn_main {i}).filter)
    xlabel('$Time \ [s]$')
    legend({'Audio recording','Filtered audio recording'})
   
    hold off
end

figure()
graphmaker3000.N63418 = tiledlayout(3,2);
title(graphmaker3000.N63418,'NACA 63-418')
for i = 17:22
    nexttile
    hold on
    plot(results.Background_off.tspan,corrected_audio.(fn_main{i}).data)
    plot(results.Background_off.tspan,corrected_audio.(fn_main {i}).filter)
    xlabel('$Time \ [s]$')
    legend({'Audio recording','Filtered audio recording'})
    
    hold off
end

figure()
graphmaker3000.N64421 = tiledlayout(3,2);
title(graphmaker3000.N64421,'NACA 64-421')
for i = 23:28
    nexttile
    hold on
    plot(results.Background_off.tspan,corrected_audio.(fn_main{i}).data)
    plot(results.Background_off.tspan,corrected_audio.(fn_main {i}).filter)
    xlabel('$Time \ [s]$')
    legend({'Audio recording','Filtered audio recording'})
    
    hold off
end

    % Power plots

figure()
graphmaker3000.N0012 = tiledlayout(3,2);
title(graphmaker3000.N0012,'NACA 0012')
for i = 5:10
    nexttile
    hold on
    plot(results.Background_off.fspan,results.(fn_main{i}).P)
    plot(results.Background_off.fspan,results.(fn_main{i}).filtered_P)
    xlabel('Frequency [Hz]')
    legend({'Power spectrum','Filtered power spectrum'})
    hold off
end

figure()
graphmaker3000.N5512 = tiledlayout(3,2);
title(graphmaker3000.N5512,'NACA 5512')
for i = 11:16
    nexttile
    hold on
    plot(results.Background_off.fspan,results.(fn_main{i}).P)
    plot(results.Background_off.fspan,results.(fn_main{i}).filtered_P)
    xlabel('Frequency [Hz]')
    legend({'Power spectrum','Filtered power spectrum'})
    hold off
end

figure()
graphmaker3000.N63418 = tiledlayout(3,2);
title(graphmaker3000.N63418,'NACA 63-418')
for i = 17:22
    nexttile
    hold on
    plot(results.Background_off.fspan,results.(fn_main{i}).P)
    plot(results.Background_off.fspan,results.(fn_main{i}).filtered_P)
    xlabel('Frequency [Hz]')
    legend({'Power spectrum','Filtered power spectrum'})
    hold off
end

figure()
graphmaker3000.N64421 = tiledlayout(3,2);
title(graphmaker3000.N64421,'NACA 64-421')
for i = 23:28
    nexttile
    hold on
    plot(results.Background_off.fspan,results.(fn_main{i}).P)
    plot(results.Background_off.fspan,results.(fn_main{i}).filtered_P)
    xlabel('Frequency [Hz]')
    legend({'Power spectrum','Filtered power spectrum'})
    hold off
end

end

%% SPL
% Determine soundpressure level of recordings

for i = 1:numel(fn_main)    
    results.(fn_main{i}).SPL = Audio_SPL(main.(fn_main{i}).data,reference);
end


% Plot SPL
if option.SPL == 1
    SPL_plot(results,fn_main)
end
