clc,clear,close all
%% Import data


[main.cylinder.data,main.cylinder.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Test audio recordings\cylinder.wav");
[main.background.data,main.background.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Test audio recordings\cylinder.wav");
% ...

%%

fn_main = fieldnames(main);

% Plot audio data
for i = 1:length(fn_main)

    Audio_plot(main.(fn_main{i}).data,main.(fn_main{i}).fs,fn_main(i))






% Power stectrum FFT
    
% Loglog FFT
end


