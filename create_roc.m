
allfiles=dir(fullfile('./generated_confusion/*.mat'));
num_files = length(allfiles);

TP_vals = zeros(num_files, 1);
FP_vals = zeros(num_files, 1);

for filenum=1:num_files
    fname = allfiles(filenum).name;
    fname=(['./generated_confusion','/', fname]);
    load(fname, 'TP', 'FP');
    TP_vals = [TP_vals; TP];
    FP_vals = [FP_vals; FP];
end

plot(FP_vals, TP_vals);
title('Receiver Operator Characteristics (ROC)')
xlabel('False Positives')
ylabel('True Positives')