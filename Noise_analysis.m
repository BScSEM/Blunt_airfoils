% Noise_analysis
% Import audio recordings, and calls Audio_vis to visualize the data

clc,clear,close all
%% Import data


% Background
[main.Background_1.data,main.Background_1.fs] = audioread("Audio_recordings\Background_1.wav");
% [main.Background_2.data,main.Background_2.fs] = audioread("Audio_recordings\Background_2.wav");


% Untripped flow
[main.UT_0012_s_a0_01.data,main.UT_0012_s_a0_01.fs] = audioread("Audio_recordings\Untripped\UT_0012_s_a0_01.wav");
[main.UT_0012_b_a0_01.data,main.UT_0012_b_a0_01.fs] = audioread("Audio_recordings\Untripped\UT_0012_b_a0_01.wav");
[main.UT_0012_s_a10_01.data,main.UT_0012_s_a10_01.fs] = audioread("Audio_recordings\Untripped\UT_0012_s_a10_01.wav");
[main.UT_0012_b_a10_01.data,main.UT_0012_b_a10_01.fs] = audioread("Audio_recordings\Untripped\UT_0012_b_a10_01.wav");

[main.UT_5512_s_a0_01.data,main.UT_5512_s_a0_01.fs] = audioread("Audio_recordings\Untripped\UT_5512_s_a0_01.wav");
[main.UT_5512_b_a0_01.data,main.UT_5512_b_a0_01.fs] = audioread("Audio_recordings\Untripped\UT_5512_b_a0_01.wav");
[main.UT_5512_s_a10_01.data,main.UT_5512_s_a10_01.fs] = audioread("Audio_recordings\Untripped\UT_5512_s_a10_01.wav");
[main.UT_5512_b_a10_01.data,main.UT_5512_b_a10_01.fs] = audioread("Audio_recordings\Untripped\UT_5512_b_a10_01.wav");

[main.UT_63418_s_a0_01.data,main.UT_63418_s_a0_01.fs] = audioread("Audio_recordings\Untripped\UT_63418_s_a0_01.wav");
[main.UT_63418_b_a0_01.data,main.UT_63418_b_a0_01.fs] = audioread("Audio_recordings\Untripped\UT_63418_b_a0_01.wav");
[main.UT_63418_s_a10_01.data,main.UT_63418_s_a10_01.fs] = audioread("Audio_recordings\Untripped\UT_63418_s_a10_01.wav");
[main.UT_63418_b_a10_01.data,main.UT_63418_b_a10_01.fs] = audioread("Audio_recordings\Untripped\UT_63418_b_a10_01.wav");

[main.UT_64421_s_a0_01.data,main.UT_64421_s_a0_01.fs] = audioread("Audio_recordings\Untripped\UT_64421_s_a0_01.wav");
[main.UT_64421_b_a0_01.data,main.UT_64421_b_a0_01.fs] = audioread("Audio_recordings\Untripped\UT_64421_b_a0_01.wav");
[main.UT_64421_s_a10_01.data,main.UT_64421_s_a10_01.fs] = audioread("Audio_recordings\Untripped\UT_64421_s_a10_01.wav");
[main.UT_64421_b_a10_01.data,main.UT_64421_b_a10_01.fs] = audioread("Audio_recordings\Untripped\UT_64421_b_a10_01.wav");
% 

% Tripped flow
[main.TF_0012_s_a0_01.data,main.TF_0012_s_a0_01.fs] = audioread("Audio_recordings\Tripped\TF_0012_s_a0.wav");
[main.TF_0012_b_a0_01.data,main.TF_0012_b_a0_01.fs] = audioread("Audio_recordings\Tripped\TF_0012_b_a0.wav");
[main.TF_0012_s_a10_01.data,main.TF_0012_s_a10_01.fs] = audioread("Audio_recordings\Tripped\TF_0012_s_a10.wav");
[main.TF_0012_b_a10_01.data,main.TF_0012_b_a10_01.fs] = audioread("Audio_recordings\Tripped\TF_0012_b_a10.wav");

[main.TF_5512_s_a0_01.data,main.TF_5512_s_a0_01.fs] = audioread("Audio_recordings\Tripped\TF_5512_s_a0.wav");
[main.TF_5512_b_a0_01.data,main.TF_5512_b_a0_01.fs] = audioread("Audio_recordings\Tripped\TF_5512_b_a0.wav");
[main.TF_5512_s_a10_01.data,main.TF_5512_s_a10_01.fs] = audioread("Audio_recordings\Tripped\TF_5512_s_a10.wav");
[main.TF_5512_b_a10_01.data,main.TF_5512_b_a10_01.fs] = audioread("Audio_recordings\Tripped\TF_5512_b_a10.wav");

[main.TF_63418_s_a0_01.data,main.TF_63418_s_a0_01.fs] = audioread("Audio_recordings\Tripped\TF_63418_s_a0.wav");
[main.TF_63418_b_a0_01.data,main.TF_63418_b_a0_01.fs] = audioread("Audio_recordings\Tripped\TF_63418_b_a0.wav");
[main.TF_63418_s_a10_01.data,main.TF_63418_s_a10_01.fs] = audioread("Audio_recordings\Tripped\TF_63418_s_a10.wav");
[main.TF_63418_b_a10_01.data,main.TF_63418_b_a10_01.fs] = audioread("Audio_recordings\Tripped\TF_63418_b_a10.wav");

[main.TF_64421_s_a0_01.data,main.TF_64421_s_a0_01.fs] = audioread("Audio_recordings\Tripped\TF_64421_s_a0.wav");
[main.TF_64421_b_a0_01.data,main.TF_64421_b_a0_01.fs] = audioread("Audio_recordings\Tripped\TF_64421_b_a0.wav");
[main.TF_64421_s_a10_01.data,main.TF_64421_s_a10_01.fs] = audioread("Audio_recordings\Tripped\TF_64421_s_a10.wav");
[main.TF_64421_b_a10_01.data,main.TF_64421_b_a10_01.fs] = audioread("Audio_recordings\Tripped\TF_64421_b_a10.wav");




%% Options
% Set to 1 to activate

option.save = 0;    % Not working 

option.print = 0;

% Plot options
option.recording = 0;
option.fft = 1;
option.loglog = 0;
option.recording_tiled = 0;
option.fft_tiled = 0;
option.loglog_tiled = 0;



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

