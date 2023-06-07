% Noise_analysis
% Import audio recordings, and calls Audio_vis to visualize the data

clc,clear,close all



%% Options
% Set to 1 to activate

option.save = 0;    % Only implemented some places

option.print = 0;

% Include types of tests
option.background = 1;
option.untriped = 1;
option.tripped = 1;


% Plot options
option.recording = 0;
option.fft = 0;
option.loglog = 1;
option.recording_tiled = 0;
option.fft_tiled = 0;
option.loglog_tiled = 0;
option.SPL = 0;
option.gm3k = 0;
option.SPL = 0;
option.graphmaker3000 = 0;


option.filter = 0;


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
    results.(fn_main{i}) = Audio_vis(main.(fn_main{i}).data,main.(fn_main{i}).fs,fn_main(i),option,i,reference);
    % plot recording, FFT and loglog FFT
end

% Plot results tiled
Audio_vis_tiled(results,main,option,i)


%% Bandstop Filter
    % Removing fan frequencies
if option.filter == 1
N = fs * T;    %  # of Samples
f1 = 30;        % Lower cutoff frequency (in Hz)
f2 = 70;        % Upper cutoff frequency (in Hz)
f3 = 260;       % Lower cutoff frequency (in Hz)
f4 = 310;       % Upper cutoff frequency (in Hz)
f5 = 560;       % Lower cutoff frequency (in Hz)
f6 = 610;       % Upper cutoff frequency (in Hz)
f7 = 80;
f8 = 100;

for i = 1:length(fn_main)
    y = bandstop(corrected_audio.(fn_main{i}).data,[f1 f2],fs);
    y = bandstop(y,[f3 f4],fs);
    y = bandstop(y,[f7 f8],fs);
    corrected_audio.(fn_main{i}).filter = bandstop(y,[f5 f6],fs);
end

%% Filter for ZOOM plots
    % Removing fan frequency from zoom plots
f1 = 47;
f2 = 49;

for i = 1:length(fn_main)
    corrected_audio.(fn_main{i}).filter_ZOOM = bandstop(corrected_audio.(fn_main{i}).data,[f1 f2],fs);
end



%%
if option.recording_tiled == 1
    figure()
    t2_rec = tiledlayout('flow');
    title(t2_rec,'Audio recording vs Filtered audio recording');
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

%% FFT of Filtered data

if option.filter == 1
for i = 1:length(fn_main)
    FT = fft(corrected_audio.(fn_main{i}).filter)'/N;
    FT_ZOOM = fft(corrected_audio.(fn_main{i}).filter_ZOOM)'/N;
        
        % Remove mean value
    FT(1) = [];
    FT_ZOOM(1) = [];

        % Extract detectable frequencies
    YP = FT(1:floor(N/2));
    YP_ZOOM = FT_ZOOM(1:floor(N/2));

        % Determine power
    results.(fn_main{i}).filtered_P = abs(YP).^2;
    results.(fn_main{i}).filter_ZOOM = abs(YP_ZOOM).^2;
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

%% Normalization scheme

if option.filter == 1
 % Method
% range = max(data)-min(data);
% normalized(i) = (data(i) - min(data)/range);

% range of all data
max_d = 0;
min_d = 10;
for i = 1:length(fn_main)
    max_r = max(results.(fn_main{i}).P);
    min_r = min(results.(fn_main{i}).P);
    if max_r > max_d
        max_d = max_r;
    end
    if min_r < min_d
        min_d = min_r;
    end
end

range = max_d - min_d;

%% Norm for P
for i = 1:length(fn_main)
    for k = 1:length(results.(fn_main{i}).P)
        results.(fn_main{i}).normalized_P(k) = (results.(fn_main{i}).P(k) - min_d)/range;
    end
end
end
%% Norm for filter_ZOOM
if option.filter == 1
for i = 1:length(fn_main)
    for k = 1:length(results.(fn_main{i}).filter_ZOOM)
        results.(fn_main{i}).normalized_filter_ZOOM(k) = (results.(fn_main{i}).filter_ZOOM(k) - min_d)/range;
    end
end
end

%% GraphMaker3000
if option.gm3k == 1
    GraphMaker3000(results,corrected_audio,fn_main,option)
end

%% SPL
% Determine soundpressure level of recordings

for i = 1:numel(fn_main)    
    results.(fn_main{i}).SPL = Audio_SPL(main.(fn_main{i}).data,reference);
end


% Plot SPL
if option.SPL == 1
    SPL_plot(results,fn_main,option)
end
