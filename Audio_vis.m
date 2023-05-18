function Audio_vis(data,fs,Name,option)
% Performs Fast Fourier transform on input data, plots data with respect to
% time, plots power sptectrum in log and non-log format
% Input:
%       data: Recorded data, nx1 vector
%       fs: Sampling frequency of data, scalar
%       Name: Name of input data, 1x1 Cell array
%       option



% set(0,'defaultTextInterpreter','latex');


% Variables of data
N = length(data);       % Number of samples
dt = 1/fs;              % Sample time
T = length(data)/fs;    % Total time
f_max = fs/2;           % Maximum frequency
f_min = 1/T;            % Minimum frequency

% Domain
fspan = linspace(f_min,f_max,N/2);
tspan = 0:dt:T-dt;

%% Audio data plot
if option.recording == 1
figure()
plot(tspan,data);
xlabel('time [s]')
title('Audio recording',Name)
ylabel('Amplitude')
xlim([0 T])
% if save_option == 1 
% print(Audio_vis_output\Name, '-depsc');  
% end
end

%% Fourier transform
FT = fft(data)'/N;

% Remove mean value
FT(1) = [];

% Extract dectable frequencies
YP = FT(1:floor(N/2));

% Determine power
P = abs(YP).^2;

%% FFT plot
if option.fft == 1
figure()
stem(fspan,P,'.','MarkerFaceColor','blue','MarkerSize',15,LineWidth=1.5)
% title('Power Spectrum',Name)
% tex_s = ("$")
% titl = append("$",string(Name),"$")
% title(titl)
% subtitle('Power Spectrum')
title(Name)
xlabel('Frequency [Hz]')
ylabel('Power')
grid
xlim([0 0.15e4])
end

% Extract dominant frequency
domf_i = find(P == max(P));
domf = fspan(domf_i);
fprintf('The dominating frequency of the %s are %.1f Hz\n',string(Name),domf)


%% FFT loglog
if option.loglog == 1
figure()
loglog(fspan,P)
title(Name)
xlabel('Frequency [Hz]')
grid

end







