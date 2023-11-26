% instantiate the library
disp('Loading the library...');
lib = lsl_loadlib();

% resolve a data stream...
disp('Resolving a Data stream...');
result = {};
while isempty(result)
    result = lsl_resolve_byprop(lib,'name','AudioCaptureWin'); end

% create a new data inlet
disp('Opening a data inlet...');
data_inlet = lsl_inlet(result{1});


% resolve a marker stream...
disp('Resolving a marker stream...');
result = {};
while isempty(result)
    result = lsl_resolve_byprop(lib,'name','MouseButtons'); end

% create a new marker inlet
disp('Opening a marker inlet...');
marker_inlet = lsl_inlet(result{1});

disp('Now receiving data...');
while true
    % get data from the inlet
    [pos,ts] = inlet.pull_sample();
    % and display it
    fprintf('%.2f\t',pos);
    fprintf('%.5f\n',ts);
end