function Audio_vis(data,fs,Name,save_option)
% Performs Fourier transform on input data, plots data with respect to
% time, plots power sptectrum in log and non-log format
% Input:
%       data: Recorded data, nx1 vector
%       fs: Sampling frequency of data, scalar
%       Name: Name of input data, 1x1 Cell array
%



% Variables of data
N = length(data);       % Number of samples
dt = 1/fs;              % Sample time
T = length(data)/fs;    % Total time
f_max = fs/2;           % Maximum frequency
f_min = 1/T;            % Minimum frequency

% Domain
fspan = linspace(f_min,f_max,N/2);
tspan = 0:dt:T-dt;

% Audio data plot
figure()
set(0,'defaultTextInterpreter','latex');
plot(tspan,data);
xlabel('time [s]')
title('Audio recording',Name)
ylabel('Amplitude')
xlim([0 T])
if save_option == 1 
% print(Audio_vis_output\Name, '-depsc');  
end


% Fourier transform
FT = fft(data)'/N;

% Remove mean value
FT(1) = [];

% Extract dectable frequencies
YP = FT(1:floor(N/2));



% Determine power
P = abs(YP).^2;

% FT plot
figure()
stem(fspan,P,'.','MarkerFaceColor','blue','MarkerSize',15)
title('Power Spectrum',Name)
xlabel('Frequency [Hz]')
ylabel('Power')
grid

% Extract dominant frequency
domf_i = find(P == max(P));
domf = fspan(domf_i);
fprintf('The dominating frequency of the %s are %.1f Hz\n',string(Name),domf)


%% FT loglog
figure()
loglog(fspan,P)
title(Name)
xlabel('Frequency [Hz]')
grid









