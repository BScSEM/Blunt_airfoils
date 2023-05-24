function Audio_vis_tiled(data,audio,option)
% Performs Fast Fourier transform on input data, plots data with respect to
% time, plots power sptectrum in log and non-log format
% Input:
%       data: Recorded data, nx1 vector
%       fs: Sampling frequency of data, scalar
%       Name: Name of input data, 1x1 Cell array
%       option: Options to activate or deactivate features, struct
% 



% set(0,'defaultTextInterpreter','latex');


fn_data = fieldnames(data);
fn_audio = fieldnames(audio);






%% Audio data plot

if option.recording_tiled == 1
    figure()
tl_rec = tiledlayout('flow');
title(tl_rec,'Audio recording')
    for i = 1:length(fn_audio)

nexttile
plot(data.(fn_data{i}).tspan,audio.(fn_audio{i}).data(:,1));
title(fn_audio(i))
xlabel('time [s]')
ylabel('Amplitude')
% xlim([0 T])
% if save_option == 1
% print(Audio_vis_output\Name, '-depsc');
% end
    end
end


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
    tl_loglog = tiledlayout('flow');
    for i = 1:numel(fn_data)
        nexttile
        loglog(data.(fn_data{i}).fspan,data.(fn_data{i}).P)
        title(fn_data{i})
        xlabel('Frequency [Hz]')
        grid
        xlim([0 max(data.(fn_data{i}).fspan)])
%         xlim([20 20000])       % limits of human hearing


    end
end








