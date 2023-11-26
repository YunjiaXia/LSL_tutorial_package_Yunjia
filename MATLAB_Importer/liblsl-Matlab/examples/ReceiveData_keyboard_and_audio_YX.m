% instantiate the library
disp('Loading the library...');
lib = lsl_loadlib();

% resolve a data stream...
disp('Resolving a Data stream...');
result_1 = {};
while isempty(result_1)
    result_1 = lsl_resolve_byprop(lib,'name','MyAudioStream'); end

% create a new data inlet
disp('Opening a data inlet...');
data_inlet = lsl_inlet(result_1{1});


% resolve a marker stream...
disp('Resolving a marker stream...');
result_2 = {};
while isempty(result_2)
    result_2 = lsl_resolve_byprop(lib,'type','Markers'); end

% create a new marker inlet
disp('Opening a marker inlet...');
marker_inlet = lsl_inlet(result_2{1});

disp('Now receiving data...');
while true
    % get data from the inlet
    [pos,ts] = data_inlet.pull_sample();
    % and display it
    fprintf('%.2f\t',pos);
    fprintf('%.5f\n',ts);
    [mrks,ts] = marker_inlet.pull_sample();
    % and display it
    fprintf('got %s at time %.5f\n',mrks{1},ts);
end