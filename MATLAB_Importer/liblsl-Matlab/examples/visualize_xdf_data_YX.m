data=load_xdf('D:\LSL\Tutorial3_script\sub-P001\ses-S001\eeg\sub-P001_ses-S001_task-Default_run-001_eeg.xdf');
figure;
plot(data{2}.time_stamps, data{2}.time_series)
hold all
plot(data{1}.time_stamps, zeros(size(data{1}.time_stamps)),'o', 'LineWidth',2)