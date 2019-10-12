%% run v1b on all ARAP shading images
clear all; close all; clc;
%% PATHS
addpath(genpath('./tools'))
addpath(genpath('./evaluate'))
addpath(genpath('./LIBS'))
addpath(genpath('./EXP'))
Rpath = './RESULTS/';
Dpath = '/media/saurabh/String/WORK/DATASETS/ARAP/ground_truth/';

%% FLAGS
f_debugInfo = true;
f_saveRes   = true;
f_visualize = false;


%% MAIN
D = dir(fullfile(Dpath,'*shading.*'));
fprintf('=======================\n');
for d=1:numel(D)
    Iname = D(d).name;
    [~,Inum,Iext] = fileparts(Iname);
    if f_debugInfo
        uprintf(sprintf('=== Processing %d/%d %s ===\n',d, numel(D), Inum));
    end
    
    Ipath = fullfile(Dpath, Iname);
    I = im2double(imread(Ipath));
    k1 = 1.6;   % TODO: Assign k based on image
    k2 = 1.5;
    k3 = 1.4;
    k4 = 1.3;
    k5 = 1.2;
    [iA1, iE1, iA2, iE2, iA3, iE3, iA4, iE4, iA5, iE5] = func_qIID_rpca_v1b(I,k1,k2,k3,k4,k5);
    
    if f_saveRes
        resPath = fullfile(Rpath, mfilename);
        if ~exist(resPath, 'dir')
            mkdir(resPath);
        end
        imwrite(iA1, fullfile(resPath, [Inum '_iA1.png']));
        imwrite(iE1, fullfile(resPath, [Inum '_iE1.png']));
        imwrite(iA2, fullfile(resPath, [Inum '_iA2.png']));
        imwrite(iE2, fullfile(resPath, [Inum '_iE2.png']));
        imwrite(iA3, fullfile(resPath, [Inum '_iA3.png']));
        imwrite(iE3, fullfile(resPath, [Inum '_iE3.png']));
        imwrite(iA4, fullfile(resPath, [Inum '_iA4.png']));
        imwrite(iE4, fullfile(resPath, [Inum '_iE4.png']));
        imwrite(iA5, fullfile(resPath, [Inum '_iA5.png']));
        imwrite(iE5, fullfile(resPath, [Inum '_iE5.png']));
    end
    
    if f_visualize
        imshow([iA1 iA2 iA3 iA4 iA5; iE1 iE2 iE3 iE4 iE5])
        pause;
    end
    
end