%% Import data
clc,clear,close all

opts = spreadsheetImportOptions("NumVariables", 2);

% Specify sheet and range
opts.Sheet = "Data";
opts.DataRange = "A6:B547";

% Specify column names and types
opts.VariableNames = ["Time", "Force"];
opts.VariableTypes = ["double", "double"];

% Import the data
data = readtable("C:\Dokumenter_ny\Bachelor project\Force measurements\drag_measurements.xlsx", opts, "UseExcel", false);


clear opts

%% Set up data

dp = 31;    % No. of datapoints
nm = 8;     % No. of measurements

data = rmmissing(data); % Remove NAN values

% Measurement index
meas_inx = (1:dp:numel(data)/2+dp);

% Force measurements [N]
force.drag.f_63418.blunt.AOA_e0 = table2array(data(meas_inx(1):meas_inx(2)-1,2));
force.drag.f_63418.blunt.AOA_e10 = table2array(data(meas_inx(2):meas_inx(3)-1,2));
force.drag.f_63418.standard.AOA_e10 = table2array(data(meas_inx(3):meas_inx(4)-1,2));
force.drag.f_63418.standard.AOA_e0 = table2array(data(meas_inx(4):meas_inx(5)-1,2));

force.drag.f_0012.blunt.AOA_e0 = table2array(data(meas_inx(5):meas_inx(6)-1,2));
force.drag.f_0012.blunt.AOA_e10 = table2array(data(meas_inx(6):meas_inx(7)-1,2));
force.drag.f_0012.standard.AOA_e10 = table2array(data(meas_inx(7):meas_inx(8)-1,2));
force.drag.f_0012.standard.AOA_e0 = table2array(data(meas_inx(8):meas_inx(9)-1,2));

force.drag.f_64421.blunt.AOA_e0 = table2array(data(meas_inx(9):meas_inx(10)-1,2));
force.drag.f_64421.blunt.AOA_e10 = table2array(data(meas_inx(10):meas_inx(11)-1,2));
force.drag.f_64421.standard.AOA_e10 = table2array(data(meas_inx(11):meas_inx(12)-1,2));
force.drag.f_64421.standard.AOA_e0 = table2array(data(meas_inx(12):meas_inx(13)-1,2));

force.drag.f_5512.blunt.AOA_e0 = table2array(data(meas_inx(13):meas_inx(14)-1,2));
force.drag.f_5512.blunt.AOA_e10 = table2array(data(meas_inx(14):meas_inx(15)-1,2));
force.drag.f_5512.standard.AOA_e10 = table2array(data(meas_inx(15):meas_inx(16)-1,2));
force.drag.f_5512.standard.AOA_e0 = table2array(data(meas_inx(16):meas_inx(17)-1,2));



% time [s]
t = (0:0.5:15);




%% Mean values
mean_drag.f_0012bluntAOA_e0 = mean(force.drag.f_0012.blunt.AOA_e0);
mean_drag.f_0012bluntAOA_e10 = mean(force.drag.f_0012.blunt.AOA_e10);
mean_drag.f_0012standardAOA_e0 = mean(force.drag.f_0012.standard.AOA_e0);
mean_drag.f_0012standardAOA_e10 = mean(force.drag.f_0012.standard.AOA_e10);

mean_drag.f_5512bluntAOA_e0 = mean(force.drag.f_5512.blunt.AOA_e0); 
mean_drag.f_5512bluntAOA_e10 = mean(force.drag.f_5512.blunt.AOA_e10);
mean_drag.f_5512standardAOA_e0 = mean(force.drag.f_5512.standard.AOA_e0);
mean_drag.f_5512standardAOA_e10 = mean(force.drag.f_5512.standard.AOA_e10);

mean_drag.f_63418bluntAOA_e0 = mean(force.drag.f_63418.blunt.AOA_e0); 
mean_drag.f_63418bluntAOA_e10 = mean(force.drag.f_63418.blunt.AOA_e10);
mean_drag.f_63418standardAOA_e0 = mean(force.drag.f_63418.standard.AOA_e0);
mean_drag.f_63418standardAOA_e10 = mean(force.drag.f_63418.standard.AOA_e10);

mean_drag.f_64421bluntAOA_e0 = mean(force.drag.f_64421.blunt.AOA_e0); 
mean_drag.f_64421bluntAOA_e10 = mean(force.drag.f_64421.blunt.AOA_e10);
mean_drag.f_64421standardAOA_e0 = mean(force.drag.f_64421.standard.AOA_e0);
mean_drag.f_64421standardAOA_e10 = mean(force.drag.f_64421.standard.AOA_e10);


save('mean_drag','mean_drag')

