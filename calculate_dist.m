close all; clear all;

load('./descriptors/sky_rgb/1_.mat','D');
test_img=double(imread('./test-images/data/0026.jpg')) ./ 255;

[row, col, channel] = size(test_img);
new_img = ones(row, col, channel);

threshold = 0:0.02:1; % manual selection

for t=threshold
    for i=1:row
        for j=1:col
            P = [test_img(i,j,1) test_img(i,j,2) test_img(i,j,3)]; % RGB Point 

            % Calculate L2 distance
            x = D - P;
            x = x.^2;
            x = sum(x);
            dst = sqrt(x);

            % Form new image depending on threshold
            if(dst < t) 
                new_img(i,j,:) = 1;
            else
                new_img(i,j,:) = 0;
            end
        end
    end
 folder = './generated-images/';
 fname= sprintf("0026_%s.jpg", num2str(t));
 imwrite(new_img,fullfile(folder,fname));

 generate_confmatrix(fname);
 
 end