% function remove_background

% Not working

clc,clear,close all

[background.data,background.fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\Background_1.wav");


[data,fs] = audioread("C:\Dokumenter_ny\Bachelor project\Lydmålinger\T_63418_s_a0_01.wav");


% Variables of data
N = length(data);       % Number of samples
dt = 1/fs;              % Sample time
T = length(data)/fs;    % Total time
f_max = fs/2;           % Maximum frequency
f_min = 1/T;            % Minimum frequency

% Domain
fspan = linspace(f_min,f_max,N/2);
tspan = 0:dt:T-dt;




%% Fourier transform
background_FT = fft(background.data)'/N;
% Remove mean value
background_FT(1) = [];
% Extract dectable frequencies
background_YP = background_FT(1:floor(N/2));
% Determine power
background_P = abs(background_YP).^2;


FT = fft(data)'/N;
% Remove mean value
FT(1) = [];
% Extract dectable frequencies
YP = FT(1:floor(N/2));
% Determine power
P = abs(YP).^2;

%% Figures

figure()
stem(fspan,P,'.','MarkerFaceColor','blue','MarkerSize',15,LineWidth=1.5)
xlim([0 0.15e4])
ylim([0 max(background_P)])
grid

figure()
stem(fspan,background_P,'.','MarkerFaceColor','blue','MarkerSize',15,LineWidth=1.5)
xlim([0 0.15e4])
title("background")
grid



% remove background

%%%%%% Group data together by value 
rew_P = P-background_P;
figure()
stem(fspan,rew_P,'.','MarkerFaceColor','blue','MarkerSize',15,LineWidth=1.5)


%%





