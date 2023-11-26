%% Instantiate the library
disp('Loading the library...');
lib = lsl_loadlib();

%% Resolve a stream...
disp('Resolving an EEG stream...');
result = {};
while isempty(result)
    result = lsl_resolve_byprop(lib,'type','Audio');  % Assuming the type is EEG
end

%% Create a new inlet
disp('Opening an inlet...');
inlet = lsl_inlet(result{1});

%% Define the bandpass filter
Fs = 500;  % Example sampling rate in Hz
f_low = 1;  % Example low cutoff frequency in Hz
f_high = 100;  % Example high cutoff frequency in Hz
[b, a] = butter(4, [f_low, f_high]/(Fs/2), 'bandpass');  % 4th-order Butterworth filter

disp('Now receiving data...');
while true
    %% Get data from the inlet
    [vec, ts] = inlet.pull_sample();

    %% Apply the bandpass filter
    filtered_vec = filter(b, a, vec);

    %% Display the filtered data
    fprintf('%.2f\t', vec);
    fprintf('%.2f\t', filtered_vec);
    fprintf('%.5f\n', ts);
end
