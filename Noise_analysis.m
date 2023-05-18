clc,clear,close all
%% Import data

% [main.Background_1.data,main.Background_1.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\Background_1.wav");
% [main.T_0012_s_a0_01.data,main.T_0012_s_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_0012_s_a0_01.wav");
% [main.T_0012_b_a0_01.data,main.T_0012_b_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_0012_b_a0_01.wav");
[main.T_63418_s_a0_01.data,main.T_63418_s_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_63418_s_a0_01.wav");
[main.T_63418_b_a0_01.data,main.T_63418_b_a0_01.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_63418_b_a0_01.wav");


%% Options
% Set to 1 to activate

option.save = 0;    % Not working 

% Plot options
option.recording = 0;
option.fft = 1;
option.loglog = 0;
%%

fn_main = fieldnames(main);
for i = 1:length(fn_main)
    Audio_vis(main.(fn_main{i}).data,main.(fn_main{i}).fs,fn_main(i),option)
    % plot recording, FFT and loglog FFT
end


