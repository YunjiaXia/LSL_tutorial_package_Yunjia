data=load_xdf('D:\LSL\Tutorial3_script\sub-P001\ses-S001\eeg\sub-P001_ses-S001_task-Default_run-001_eeg.xdf');
%% explore timing
% the time between two markers should increase by 100 msec
expectedTiming=[1:0.1:2.3];
% the actual timing might deviate from this
actualTiming=diff(data{1}.time_stamps);
figure;
subplot(211);
scatter(expectedTiming,actualTiming, 'LineWidth',2);
hold all;
plot(expectedTiming,expectedTiming, 'LineWidth',2);
xlabel('Expected Timing [seconds]');
ylabel('Measured Timing [seconds]');
legend({'Time between two sounds', 'Optimal Timing'});
title('Timing');

subplot(212);
plot(actualTiming-expectedTiming,'-o', 'LineWidth',2);
title('Deviation from expected Timing');
xlabel('Sound order');
ylabel('Deviation from expected presentation [seconds]');
