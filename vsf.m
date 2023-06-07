%function [] = vsf(force,N)

fn_force = fieldnames(force);


fs = 10007; 

% Variables of data
N = length(force.mod0012b.a0(1000:end));       % Number of samples
dt = 1/fs;              % Sample time
T = length(N)/fs;    % Total time
f_max = fs/2;           % Maximum frequency
f_min = 1/T;            % Minimum frequency
t = 0:5:T;              % Time vector

fspan = linspace(f_min,f_max,fs/2);

% Fourier transform
FT = fft(force.mod0012b.a0(1000:end))'/N;

% Remove mean value
FT(1) = [];

% Extract dectable frequencies
YP = FT(1:length(force.mod0012b.a0)/2);

% Determine power
P = abs(YP).^2;

% Extract dominant frequency
domf_i = find(P == max(P));
domf = fspan(domf_i);
fprintf('The dominating frequency of the vibrations are: %.1f Hz\n',domf)


%% Vortex frequency

U = 36; % [m/s]
c = 0.20; % [m]


% Reduced frequency

k = domf * c / U;

% Strouhal number (flat plate)

St = 0.17 + 0.60 * k^0.39;

% Vortex shedding frequency
vsf1 = St * U / c


%end
