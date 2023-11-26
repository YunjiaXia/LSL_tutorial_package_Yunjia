% instantiate the library
disp('Loading the library...');
lib = lsl_loadlib();

% resolve a stream...
disp('Resolving a Markers stream...');
result = {};
while isempty(result)
    result = lsl_resolve_byprop(lib,'name','MousePosition'); end

% create a new inlet
disp('Opening an inlet...');
inlet = lsl_inlet(result{1});

disp('Now receiving data...');
while true
    % get data from the inlet
    [pos,ts] = inlet.pull_sample();
    % and display it
    fprintf('%.2f\t',pos);
    fprintf('%.5f\n',ts);
end