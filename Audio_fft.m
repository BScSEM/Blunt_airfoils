clc,clear,close all

% Import data
[data,fs] = audioread("C:\Dokumenter_ny\Bachelor project\Test audio recordings\cylinder.wav");


% Variables of data
N = length(data);       % Number of samples
dt = 1/fs;              % Sample time
T = length(data)/fs;    % Total time
f_max = fs/2;           % Maximum frequency
f_min = 1/T;            % Minimum frequency
t = 0:5:T;              % Time vector

% Domain
fspan = linspace(f_min,f_max,N/2);
tspan = 0:dt:T-dt;

figure()
set(0,'defaultTextInterpreter','latex');
plot(tspan,data);


% xticks(0:5:30)
% set(gca,'XTick',0:5:30,7)
% aud.MarkerIndices = 0:5:30
title('Audio recording')
ylabel('Amplitude')
% xlabel('time [s]')







% Fourier transform
FT = fft(data)'/N;

% Remove mean value
FT(1) = [];

% Extract dectable frequencies
YP = FT(1:N/2);

% Determine power
P = abs(YP).^2;

% Figure
figure()
stem(fspan,P,'.','MarkerFaceColor','blue','MarkerSize',15)
title('Power Spectrum')
xlabel('Frequency [Hz]')
ylabel('Power')
grid

% Extract dominant frequency
domf_i = find(P == max(P));
domf = fspan(domf_i);
fprintf('The dominating frequency of the vibrations are: %.1f Hz\n',domf)


figure()
loglog(fspan,P)

% print('HW4_2b_figure', '-depsc');  