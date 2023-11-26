%%
clear all; close all
% instantiate the library

disp('Loading library...');
lib = lsl_loadlib();

disp('Creating a new marker stream info...');
info = lsl_streaminfo(lib,'MyMarkerStream','Markers',1,0,'cf_string','myuniquesourceid23443');

disp('Opening an outlet...');
outlet = lsl_outlet(info);
%load sound
load splat.mat
% Wait for user input
reply = input('Press key to start' ,'s');

% send markers into the outlet
disp('Now transmitting data...');
markers = {'T1', 'T2', 'T3','T4', 'T5', 'T6','T7', 'T8', 'T9','T10', 'T11', 'T12','T13','T14', 'T15'};


for k=1:numel(markers)
    outlet.push_sample(markers(k));   % note that the string is wrapped into a cell-array
    sound(y) % play sound
    pause(1+.100*(k-1));    
end

display('End of Experiment. Please stop recording.')