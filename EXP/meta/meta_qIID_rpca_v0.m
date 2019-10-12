clear all; close all; clc;
%% PATHS
addpath(genpath('./EXP'))
addpath(genpath('./tools'))
addpath(genpath('./LIBS'))
addpath(genpath('./evaluate'))
Rpath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/RESULTS';
Dpath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/Datasets/NARIHIRAtestsplit';

%% FLAGS
f_debugInfo = true;

D = dir(fullfile(Dpath,'*.png'));
fprintf('=======================\n');
for d=1:numel(D)
    Iname = D(d).name;
    [~,Inum,Iext] = fileparts(Iname);
    Ipath = fullfile(Dpath, Iname);
    I = im2double(imread(Ipath));
    
    if f_debugInfo
        uprintf(sprintf('=== Processing %s ===\n',Inum));
    end
    [R,S] = func_qIID_rpca_v0(I,1.4);
    resPath = fullfile(Rpath, mfilename);
    if ~exist(resPath, 'dir')
        mkdir(resPpath);
    end
    imshow([I R S]);
    imwrite(R, fullfile(resPath, [Inum '_R.png']));
    imwrite(S, fullfile(resPath, [Inum '_S.png']));
end