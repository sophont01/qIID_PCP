%% run v1b on all FilteringIID shading images on HDR testset
clear all; close all; clc;
%% PATHS
addpath(genpath('./tools'))
addpath(genpath('./evaluate'))
addpath(genpath('./LIBS'))
addpath(genpath('./EXP'))
Rpath = './RESULTS/';
Dpath = '/media/saurabh/Rythym/WORK/RESULTS/filteringIID/testset/';
Rpath = fullfile(Rpath, mfilename);
if ~exist(Rpath, 'dir')
    mkdir(Rpath);
end
%% FLAGS
f_debugInfo = true;
f_saveRes   = true;
f_visualize = false;


%% MAIN
D = dir(fullfile(Dpath,'*-s_colorized.png'));
fprintf('=======================\n');
tic;
for d=44:numel(D) % 43 svd error
    Iname = D(d).name;
    [~,Iname,Iext] = fileparts(Iname);
    C = strsplit(Iname,'-');
    Inum = C{1};
    if f_debugInfo
        uprintf(sprintf('=== Processing %d/%d %s ===\n', d, numel(D), Iname));
    end
    
    Ipath = fullfile(Dpath, [Inum '-s_colorized.png']);
    I = im2double(imread(Ipath));
    I = repmat(I,[1 1 3]);
%     k1 = 1.7;   % TODO: Assign k based on image
%     k2 = 1.6;
%     k3 = 1.5;
%     k4 = 1.4;
%     k5 = 1.3;
%     k6 = 1.2;
%     k7 = 1.1;
    k1 = 1.6;   % TODO: Assign k based on image
    k2 = 1.5;
    k3 = 1.4;
    k4 = 1.3;
    k5 = 1.2;
    k6 = 1.1;
    k7 = 1.0;
    [iA1, iE1, iA2, iE2, iA3, iE3, iA4, iE4, iA5, iE5, iA6, iE6, iA7, iE7] = func_qIID_rpca_v1c(I,k1,k2,k3,k4,k5,k6,k7);
    
    if f_saveRes
        imwrite(iA1, fullfile(Rpath, [Inum '_iA1.png']));
        imwrite(iE1, fullfile(Rpath, [Inum '_iE1.png']));
        imwrite(iA2, fullfile(Rpath, [Inum '_iA2.png']));
        imwrite(iE2, fullfile(Rpath, [Inum '_iE2.png']));
        imwrite(iA3, fullfile(Rpath, [Inum '_iA3.png']));
        imwrite(iE3, fullfile(Rpath, [Inum '_iE3.png']));
        imwrite(iA4, fullfile(Rpath, [Inum '_iA4.png']));
        imwrite(iE4, fullfile(Rpath, [Inum '_iE4.png']));
        imwrite(iA5, fullfile(Rpath, [Inum '_iA5.png']));
        imwrite(iE5, fullfile(Rpath, [Inum '_iE5.png']));
        imwrite(iA6, fullfile(Rpath, [Inum '_iA6.png']));
        imwrite(iE6, fullfile(Rpath, [Inum '_iE6.png']));
        imwrite(iA7, fullfile(Rpath, [Inum '_iA7.png']));
        imwrite(iE7, fullfile(Rpath, [Inum '_iE7.png']));
    end
    
    if f_visualize
        iA1 = normalizeIm(iA1);
        iA2 = normalizeIm(iA2);
        iA3 = normalizeIm(iA3);
        iA4 = normalizeIm(iA4);
        iA5 = normalizeIm(iA5);
        iA6 = normalizeIm(iA6);
        iA7 = normalizeIm(iA7);
        iE1 = normalizeIm(iE1);
        iE2 = normalizeIm(iE2);
        iE3 = normalizeIm(iE3);
        iE4 = normalizeIm(iE4);
        iE5 = normalizeIm(iE5);
        iE6 = normalizeIm(iE6);
        iE7 = normalizeIm(iE7);
        imshow([iA1 iA2 iA3 iA4 iA5 iA6 iA7; iE1 iE2-iE1 iE3-iE2 iE4-iE3 iE5-iE4 iE6-iE5 iE7-iE6])
        pause;
    end  
end
t = toc;
fprintf('full time = %f \t average time = %f \n',t,t/numel(D));

%%

function[imN] = normalizeIm(im)
imN = rgb2hsv(im);
mx = double(max(max(im(:,:,3))));
mn = double(min(min(im(:,:,3))));
imN(:,:,3) = (imN(:,:,3) - mn)./(mx - mn);
imN = hsv2rgb(imN);
end