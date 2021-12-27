function generate_confmatrix(fname)
f= sprintf("./generated-images/%s", fname);

gen_img = double(imread(f)) ./ 255;
ground_img=double(imread('./test-images/groundtruth/0026_gt.pgm')) ./ 255;
[row, col, channel] = size(ground_img);

TP = 0; % detected sky and it is sky
TN = 0; % detected not sky and it is not sky
FP = 0; % detected sky and its not sky
FN = 0; % detected not sky and it is sky

for i=1:row
    for j=1:col
        if ground_img(i,j) == 1
            if ground_img(i,j) == gen_img(i,j)
                TP = TP + 1;
            else
                FN = FN + 1;
            end
        end
        
        if ground_img(i,j) == 0
            if ground_img(i,j) == gen_img(i,j)
                TN = TN + 1;
            else
                FP = FP + 1;
            end
        end
    end
end

total_pixels = row*col;

TP = (TP / total_pixels);
TN = (TN / total_pixels);
FP = (FP / total_pixels);
FN = (FN / total_pixels);

file = erase(fname, '.jpg');
file = sprintf("./generated_confusion/%s.mat", file);
fout=file;
save(fout,'TP', 'TN', 'FP', 'FN');

end

