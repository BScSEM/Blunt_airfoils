function Audio_vis(data,fs,Name)

% Variables of data
N = length(data);       % Number of samples
dt = 1/fs;              % Sample time
T = length(data)/fs;    % Total time
f_max = fs/2;           % Maximum frequency
f_min = 1/T;            % Minimum frequency

% Domain
fspan = linspace(f_min,f_max,N/2);
tspan = 0:dt:T-dt;

figure()
set(0,'defaultTextInterpreter','latex');
plot(tspan,data);
xlabel('time [s]')
title('Audio recording',Name)
ylabel('Amplitude')
xlim([0 T])





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









