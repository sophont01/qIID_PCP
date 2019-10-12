clear all; close all; clc;
%% PATHS
addpath(genpath('./tools'))
addpath(genpath('./evaluate'))
addpath(genpath('./LIBS'))
addpath(genpath('./EXP'))
Rpath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/RESULTS';
Dpath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/Datasets/NARIHIRAtestsplit';

%% FLAGS
f_debugInfo = true;
f_saveRes   = false;
f_visualize = true;


%% MAIN
D = dir(fullfile(Dpath,'*.png'));
fprintf('=======================\n');
for d=1:numel(D)
    Iname = D(d).name;
    [~,Inum,Iext] = fileparts(Iname);
    if f_debugInfo
        uprintf(sprintf('=== Processing %d/%d %s ===\n',d, numel(D), Inum));
    end
    
    Ipath = fullfile(Dpath, Iname);
    I = im2double(imread(Ipath));
    k1 = 1.6;
    k2 = 1.4;
    k3 = 1.2;
    [iA, iE, iAA, iAE, iEA, iEE] = func_qIID_rpca_v1(I,k1,k2,k3);
    
    if f_saveRes
        resPath = fullfile(Rpath, mfilename);
        if ~exist(resPath, 'dir')
            mkdir(resPpath);
        end
        imwrite(iA, fullfile(resPath, [Inum '_iA.png']));
        imwrite(iE, fullfile(resPath, [Inum '_iE.png']));
        imwrite(iAA, fullfile(resPath, [Inum '_iAA.png']));
        imwrite(iAE, fullfile(resPath, [Inum '_iAE.png']));
        imwrite(iEA, fullfile(resPath, [Inum '_iEA.png']));
        imwrite(iEE, fullfile(resPath, [Inum '_iEE.png']));
    end
    
    if f_visualize
        imshow([iA iE; iAA iAE; iEA iEE])
        pause;
    end
    
end