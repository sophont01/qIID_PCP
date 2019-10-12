clear all; close all; clc;
warning off
%% PATHS
addpath(genpath('./tools'))
addpath(genpath('./evaluate'))
addpath(genpath('./LIBS'))
addpath(genpath('./EXP'))
addpath(genpath('./ROUGH'))
Rdir = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/RESULTS';
Ddir = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/Datasets/NARIHIRAtestsplit';
sIdir = '/media/saurabh/String/WORK/RESULTS/BiIID/paperResults/smooth/';
whdrPath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/evaluate/whdr.py';
jsonDir = '/media/saurabh/String/WORK/DATASETS/iiw-dataset/data/';

%% FLAGS
f_debugInfo = true;
f_saveRes   = true;
f_visualize = false;
f_computeWhdr = true;

%% PARAMS

%% VARIABLES
D = dir(fullfile(Ddir,'*.png'));
whdr = {};

%% SCRIPTS
idx_Nsplit;

%% MAIN
fprintf('=======================\n');
for d=1:numel(Nsplit)
    %     Iname = D(d).name;
    %     [~,Inum,Iext] = fileparts(Iname);
    Inum = num2str(Nsplit(d));
    Iname = strcat(Inum,'.png');
    Ipath = fullfile(Ddir, Iname);
    I = im2double(imread(Ipath));
    sIpath = fullfile(sIdir, [Inum '-smooth.png']);
    sI = im2double(imread(sIpath));
    
    k = 1.0;    %1.6;    %1.0
    [A1,E1] = func_qIID_rpca_v2f3(I,sI,k);
    a1 = reshape(A1(:,1), size(I,1),size(I,2) );
    e1 = reshape(E1(:,1), size(I,1),size(I,2) );
    %     mean(a1(:))
    %     mean(e1(:))
    ia1 = cat(3,a1.x, a1.y, a1.z);
    ie1 = cat(3,e1.x, e1.y, e1.z);
    
    if f_saveRes
        resPath = fullfile(Rdir, mfilename);
        if ~exist(resPath, 'dir')
            mkdir(resPath);
        end
        save(fullfile(resPath,[Inum '.mat']), 'A1', 'E1');
        imwrite(ia1, fullfile(resPath, [Inum '_ia1.png']));
        imwrite(ie1, fullfile(resPath, [Inum '_ie1.png']));
    end
    
    if f_computeWhdr
        jsonPath = fullfile(jsonDir, [Inum '.json']);
        resPath = fullfile(resPath, [Inum '_ia1.png']);
        whdr{d,1} = str2num(Inum);
        whdr{d,2} = computeWHDR(resPath, jsonPath) ;
    end
    
    if(f_debugInfo)    
        uprintf(sprintf('=== Processing %d/%d %s.png whdr=%0.4f ===\n',d, numel(D), Inum, whdr{d,2}));    
    end
    
    if f_visualize
        imshow([I sI ia1 ie1])
        pause;
    end
end