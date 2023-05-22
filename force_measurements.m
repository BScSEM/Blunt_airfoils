%% Import data
clc,clear,close all

opts = spreadsheetImportOptions("NumVariables", 2);

% Specify sheet and range
opts.Sheet = "Data";
opts.DataRange = "A7:B516";

% Specify column names and types
opts.VariableNames = ["Time", "Force"];
opts.VariableTypes = ["double", "double"];

% Import the data
data = readtable("C:\Dokumenter_ny\Bachelor project\Force measurements\Lift_measurements.xlsx", opts, "UseExcel", false);


clear opts

%% Set up data

dp = 31;    % No. of datapoints
nm = 8;     % No. of measurements

data = rmmissing(data); % Remove NAN values

% Measurement index
meas_inx = (1:dp:numel(data)/2+dp);

% Force measurements [N]
force.f_5512.standard.AOA_e0 = table2array(data(meas_inx(1):meas_inx(2)-2,2));
force.f_5512.standard.AOA_e10 = table2array(data(meas_inx(2):meas_inx(3)-2,2));
force.f_5512.blunt.AOA_e10 = table2array(data(meas_inx(3):meas_inx(4)-2,2));
force.f_5512.blunt.AOA_e0 = table2array(data(meas_inx(4):meas_inx(5)-2,2));

force.f_64421.standard.AOA_e0 = table2array(data(meas_inx(5):meas_inx(6)-2,2));
force.f_64421.standard.AOA_e10 = table2array(data(meas_inx(6):meas_inx(7)-2,2));
force.f_64421.blunt.AOA_e10 = table2array(data(meas_inx(7):meas_inx(8)-2,2));
force.f_64421.blunt.AOA_e0 = table2array(data(meas_inx(8):meas_inx(9)-2,2));

force.f_0012.standard.AOA_e0 = table2array(data(meas_inx(9):meas_inx(10)-2,2));
force.f_0012.standard.AOA_e10 = table2array(data(meas_inx(10):meas_inx(11)-2,2));
force.f_0012.blunt.AOA_e10 = table2array(data(meas_inx(11):meas_inx(12)-2,2));
force.f_0012.blunt.AOA_e0 = table2array(data(meas_inx(12):meas_inx(13)-2,2));

force.f_63418.standard.AOA_e0 = table2array(data(meas_inx(13):meas_inx(14)-2,2));
force.f_63418.standard.AOA_e10 = table2array(data(meas_inx(14):meas_inx(15)-2,2));
force.f_63418.blunt.AOA_e10 = table2array(data(meas_inx(15):meas_inx(16)-2,2));
force.f_63418.blunt.AOA_e0 = table2array(data(meas_inx(16):meas_inx(17)-2,2));



% time [s]
t = (0:0.5:15);




%% Mean values
mean_force.f_0012bluntAOA_e0 = mean(force.f_0012.blunt.AOA_e0);
mean_force.f_0012bluntAOA_e10 = mean(force.f_0012.blunt.AOA_e10);
mean_force.f_0012standardAOA_e0 = mean(force.f_0012.standard.AOA_e0);
mean_force.f_0012standardAOA_e10 = mean(force.f_0012.standard.AOA_e10);

mean_force.f_5512bluntAOA_e0 = mean(force.f_5512.blunt.AOA_e0); 
mean_force.f_5512bluntAOA_e10 = mean(force.f_5512.blunt.AOA_e10);
mean_force.f_5512standardAOA_e0 = mean(force.f_5512.standard.AOA_e0);
mean_force.f_5512standardAOA_e10 = mean(force.f_5512.standard.AOA_e10);

mean_force.f_63418bluntAOA_e0 = mean(force.f_63418.blunt.AOA_e0); 
mean_force.f_63418bluntAOA_e10 = mean(force.f_63418.blunt.AOA_e10);
mean_force.f_63418standardAOA_e0 = mean(force.f_63418.standard.AOA_e0);
mean_force.f_63418standardAOA_e10 = mean(force.f_63418.standard.AOA_e10);

mean_force.f_64421bluntAOA_e0 = mean(force.f_64421.blunt.AOA_e0); 
mean_force.f_64421bluntAOA_e10 = mean(force.f_64421.blunt.AOA_e10);
mean_force.f_64421standardAOA_e0 = mean(force.f_64421.standard.AOA_e0);
mean_force.f_64421standardAOA_e10 = mean(force.f_64421.standard.AOA_e10);




%% Figure

fn_mean_force = fieldnames(mean_force);

figure()
hold on

for i = 1:numel(fn_mean_force)
    plot(mean_force.(fn_mean_force{i}),'x',MarkerSize=20)
    

end
legend(fn_mean_force)
hold off