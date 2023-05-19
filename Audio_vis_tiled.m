function [results] = Audio_vis_tiled(data,fs,option)
% Performs Fast Fourier transform on input data, plots data with respect to
% time, plots power sptectrum in log and non-log format
% Input:
%       data: Recorded data, nx1 vector
%       fs: Sampling frequency of data, scalar
%       Name: Name of input data, 1x1 Cell array
%       option
% Output:
% 



% set(0,'defaultTextInterpreter','latex');


% Variables of data
% N = length(data);       % Number of samples
% dt = 1/fs;              % Sample time
% T = length(data)/fs;    % Total time
% f_max = fs/2;           % Maximum frequency
% f_min = 1/T;            % Minimum frequency
% 
% % Domain
% fspan = linspace(f_min,f_max,N/2);
% tspan = 0:dt:T-dt;


fn_data = fieldnames(data);

%% Audio data plot
% if option.recording_tiled == 1
%     for i = 1:length(data)
% figure()
% tiledlayout('flow')
% nexttile
% plot(tspan,data);
% xlabel('time [s]')
% title('Audio recording',Name)
% ylabel('Amplitude')
% xlim([0 T])
% % if save_option == 1 
% % print(Audio_vis_output\Name, '-depsc');  
% % end
%     end
% end


%% FFT plot
if option.fft_tiled == 1    
figure();
tl_fft = tiledlayout('flow');
title(tl_fft,'Power stectrum')
for i = 1:numel(fn_data)
    nexttile
stem(data.(fn_data{i}).fspan,data.(fn_data{i}).P,'.','MarkerFaceColor','blue','MarkerSize',15,LineWidth=1.5)
% title('Power Spectrum',Name)
% tex_s = ("$")
% titl = append("$",string(Name),"$")
% title(titl)
% subtitle('Power Spectrum')
title(fn_data{i})
% xlabel('Frequency [Hz]')
% ylabel('Power')
grid
xlim([0 0.15e4])
ylim([0 1e-3])
end
end



%% FFT loglog
if option.loglog_tiled == 1
figure()
loglog(fspan,P)
title(Name)
xlabel('Frequency [Hz]')
grid

end








