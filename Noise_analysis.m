clc,clear,close all
%% Import data

[main.Background_1.data,main.Background_1.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\Background_1.wav");
% [main.Background_2.data,main.Background_2.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\Background_2.wav");

[main.T_0012_s_a0_01.data,main.T_0012_s_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_0012_s_a0_01.wav");
% [main.T_0012_s_a0_02.data,main.T_0012_s_a0_02.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_0012_s_a0_02.wav");
[main.T_0012_b_a0_01.data,main.T_0012_b_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_0012_b_a0_01.wav");
[main.T_0012_s_a10_01.data,main.T_0012_s_a10_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_0012_s_a10_01.wav");
[main.T_0012_b_a10_01.data,main.T_0012_b_a10_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_0012_b_a10_01.wav");
% [main.T_0012_s_a10_02.data,main.T_0012_s_a10_02.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_0012_s_a10_02.wav");

[main.T_5512_s_a0_01.data,main.T_5512_s_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_5512_s_a0_01.wav");
[main.T_5512_b_a0_01.data,main.T_5512_b_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_5512_b_a0_01.wav");
[main.T_5512_s_a10_01.data,main.T_5512_s_a10_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_5512_s_a10_01.wav");
[main.T_5512_b_a10_01.data,main.T_5512_b_a10_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_5512_b_a10_01.wav");


[main.T_63418_s_a0_01.data,main.T_63418_s_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_63418_s_a0_01.wav");
[main.T_63418_b_a0_01.data,main.T_63418_b_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_63418_b_a0_01.wav");
[main.T_63418_s_a10_01.data,main.T_63418_s_a10_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_63418_s_a10_01.wav");
[main.T_63418_b_a10_01.data,main.T_63418_b_a10_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_63418_b_a10_01.wav");

[main.T_64421_s_a0_01.data,main.T_64421_s_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_64421_s_a0_01.wav");
[main.T_64421_b_a0_01.data,main.T_64421_b_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_64421_b_a0_01.wav");
[main.T_64421_s_a10_01.data,main.T_64421_s_a10_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_64421_s_a10_01.wav");
[main.T_64421_b_a10_01.data,main.T_64421_b_a10_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Audio_recordings\T_64421_b_a10_01.wav");


% [main.w.data,main.w.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Div\Test audio recordings\WT_mic_just_outside_low_gain.wav");

%% Options
% Set to 1 to activate

option.save = 0;    % Not working 

option.print = 1;

% Plot options
option.recording = 0;
option.fft = 0;
option.loglog = 0;
option.recording_tiled = 1;
option.fft_tiled = 1;
option.loglog_tiled = 1;



%% Set data scale

fn_main = fieldnames(main);


[corrected_audio] = correct_data(main);

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

