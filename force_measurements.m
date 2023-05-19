%% Import data
clc,clear,close all

opts = spreadsheetImportOptions("NumVariables", 2);

% Specify sheet and range
opts.Sheet = "Data";
opts.DataRange = "A7:B262";

% Specify column names and types
opts.VariableNames = ["Time", "Force"];
opts.VariableTypes = ["double", "double"];

% Import the data
data = readtable("C:\Dokumenter_ny\Bachelor project\Force measurements\Lift_measurements_0012_5512.xlsx", opts, "UseExcel", false);
% 0012 & 5512

clear opts

%% Set up data

dp = 31;    % No. of datapoints
nm = 8;     % No. of measurements

data = rmmissing(data); % Remove NAN values

% Measurement index
meas_inx = (1:dp:numel(data)/2+dp);

% Force measurements [N]
force.f_0012.blunt.AOA_e0 = table2array(data(meas_inx(1):meas_inx(2)-1,2));
force.f_0012.blunt.AOA_e10 = table2array(data(meas_inx(2):meas_inx(3)-1,2));
force.f_0012.standard.AOA_e0 = table2array(data(meas_inx(3):meas_inx(4)-1,2));
force.f_0012.standard.AOA_e10 = table2array(data(meas_inx(4):meas_inx(5)-1,2));
force.f_5512.blunt.AOA_e0 = table2array(data(meas_inx(5):meas_inx(6)-1,2));
force.f_5512.blunt.AOA_e10 = table2array(data(meas_inx(6):meas_inx(7)-1,2));
force.f_5512.standard.AOA_e0 = table2array(data(meas_inx(7):meas_inx(8)-1,2));
force.f_5512.standard.AOA_e10 = table2array(data(meas_inx(8):meas_inx(9)-1,2));


% time [s]
t = (0:0.5:15);




%% Mean values
mean_force.f_0012bluntAOA_e0 = mean(force.f_0012.blunt.AOA_e0(2:end));
mean_force.f_0012bluntAOA_e10 = mean(force.f_0012.blunt.AOA_e10);
mean_force.f_0012standardAOA_e0 = mean(force.f_0012.standard.AOA_e0);
mean_force.f_0012standardAOA_e10 = mean(force.f_0012.standard.AOA_e10);

mean_force.f_5512bluntAOA_e0 = mean(force.f_5512.blunt.AOA_e0);
mean_force.f_5512bluntAOA_e10 = mean(force.f_5512.blunt.AOA_e10);
mean_force.f_5512standardAOA_e0 = mean(force.f_5512.standard.AOA_e0);
mean_force.f_5512standardAOA_e10 = mean(force.f_5512.standard.AOA_e10);






%% Figure



tiledlayout('flow')












% fn_force = fieldnames(force);
% fn_0012 = fieldnames(force.f_0012);
% fn_5512 = fieldnames(force.f_5512);
% 
% 
% 
% 
% 
% tiledlayout('flow')
% 
% for ii = 1:numel(fn_force)
%     for ji = 1:numel(fn_0012)
%         for ik = 1:numel
% 
%         for jj = 1:numel(fn_5512)
% 
%             plot(t,force.(fn_force{i}).fn_0012)
% 
% 
%         end
%     end
% end
