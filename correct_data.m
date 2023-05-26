function [corrected_audio] = correct_data(audio,T)
% Sets all audio recordings the same time length, and removes stereo effects
% Input:
%       audio: Recordings as .wav
%       T: New length of recordings, scalar

fn_audio = fieldnames(audio);

for i = 1:numel(fn_audio)
    
    corrected_audio.(fn_audio{i}).data = audio.(fn_audio{i}).data(1:audio.(fn_audio{i}).fs*T)';

end

