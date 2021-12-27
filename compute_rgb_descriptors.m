close all; clear all;

DATASET_FOLDER = 'training-images';
OUT_FOLDER = './descriptors';
OUT_SUBFOLDER='sky_rgb';
allfiles=dir(fullfile([DATASET_FOLDER,'/*.jpg']));

if ~exist(OUT_SUBFOLDER, 'file')
    mkdir([OUT_FOLDER, '/', OUT_SUBFOLDER]);
end

for filenum=1:length(allfiles)
    fname=allfiles(filenum).name;
    imgfname_full=([DATASET_FOLDER,'/', fname]);
    img=double(imread(imgfname_full)) ./255;
    fout=[OUT_FOLDER,'/',OUT_SUBFOLDER,'/',fname(1:end-4),'.mat'];
    D=calculate_avg_rgb(img); % average RGB value of the sky
    save(fout,'D');
end