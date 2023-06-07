function [SPL] = Audio_SPL_cont(audio,reference)
% Convertes signal to SPL dB

% Known value
Reference_scaling_value = 87; % [SPL dB]

% Reference point air [muPa]
p_0 = 20;

% Scaling coeffcient
gamma = (exp((Reference_scaling_value*log(10))/20)*p_0)/rms(reference(:,1));


% Sound pressure level   
SPL = 20*log10((audio)*gamma/p_0);
                   

