clc,clear,close all
%% Import data

% [main.Background_1.data,main.Background_1.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\Background_1.wav");

[main.T_0012_s_a0_01.data,main.T_0012_s_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_0012_s_a0_01.wav");
% [main.T_0012_s_a0_02.data,main.T_0012_s_a0_02.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_0012_s_a0_02.wav");
[main.T_0012_b_a0_01.data,main.T_0012_b_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_0012_b_a0_01.wav");
[main.T_0012_s_a10_01.data,main.T_0012_s_a10_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_0012_s_a10_01.wav");
[main.T_0012_b_a10_01.data,main.T_0012_b_a10_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_0012_b_a10_01.wav");
% [main.T_0012_s_a10_02.data,main.T_0012_s_a10_02.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_0012_s_a10_02.wav");

[main.T_5512_s_a0_01.data,main.T_5512_s_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_5512_s_a0_01.wav");
[main.T_5512_b_a0_01.data,main.T_5512_b_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_5512_b_a0_01.wav");
[main.T_5512_s_a10_01.data,main.T_5512_s_a10_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_5512_s_a10_01.wav");
[main.T_5512_b_a10_01.data,main.T_5512_b_a10_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_5512_b_a10_01.wav");


[main.T_63418_s_a0_01.data,main.T_63418_s_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_63418_s_a0_01.wav");
[main.T_63418_b_a0_01.data,main.T_63418_b_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_63418_b_a0_01.wav");
[main.T_63418_s_a10_01.data,main.T_63418_s_a10_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_63418_s_a10_01.wav");
[main.T_63418_b_a10_01.data,main.T_63418_b_a10_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_63418_b_a10_01.wav");

[main.T_64421_s_a0_01.data,main.T_64421_s_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_64421_s_a0_01.wav");
[main.T_64421_b_a0_01.data,main.T_64421_b_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_64421_b_a0_01.wav");
[main.T_64421_s_a10_01.data,main.T_64421_s_a10_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_64421_s_a10_01.wav");
[main.T_64421_b_a10_01.data,main.T_64421_b_a10_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_64421_b_a10_01.wav");






                                                                                    

%% Options
% Set to 1 to activate

option.save = 0;    % Not working 

option.print = 0;

% Plot options
option.recording = 0;
option.fft = 0;
option.loglog = 0;
option.fft_tiled = 1;
option.loglog_tiled = 0;
%%



fn_main = fieldnames(main);

fs = main.(fn_main{1}).fs;

for i = 1:length(fn_main)
    results.(fn_main{i}) = Audio_vis(main.(fn_main{i}).data,main.(fn_main{i}).fs,fn_main(i),option);
    % plot recording, FFT and loglog FFT
end




%% Plot tiledlayout



Audio_vis_tiled(results,fs,option)



