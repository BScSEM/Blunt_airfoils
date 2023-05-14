clc,clear,close all
%% Import data

[main.cylinder.data,main.cylinder.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Test audio recordings\cylinder.wav");
[main.background.data,main.background.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Test audio recordings\WT_mic_just_outside.wav");
% ...

%%

fn_main = fieldnames(main);

% Plot audio data
% Power stectrum FFT
% Loglog FFT
for i = 1:length(fn_main)

    Audio_vis(main.(fn_main{i}).data,main.(fn_main{i}).fs,fn_main(i))
   
end


