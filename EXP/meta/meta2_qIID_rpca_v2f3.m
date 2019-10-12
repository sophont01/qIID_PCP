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
% k = [1.0 0.9 0.8 0.7 0.6];    %1.6;    %1.0
k = [1.0 1.1 1.2 1.3 1.4];

%% VARIABLES
whdr = {};
resPath = fullfile(Rdir, mfilename);

%% SCRIPTS
idx_Nsplit;

%% MAIN
fprintf('=======================\n');
for d=1:numel(Nsplit)
    
    Inum = num2str(Nsplit(d));
    Iname = strcat(Inum,'.png');
    Ipath = fullfile(Ddir, Iname);
    I = im2double(imread(Ipath));
    sIpath = fullfile(sIdir, [Inum '-smooth.png']);
    sI = im2double(imread(sIpath));
    
    [ia1,ie1] = sep_AE(I  ,sI,k(1));
    [ia2,ie2] = sep_AE(ia1,sI,k(2));
    [ia3,ie3] = sep_AE(ia2,sI,k(3));
    [ia4,ie4] = sep_AE(ia3,sI,k(4));
    [ia5,ie5] = sep_AE(ia4,sI,k(5));
    
    if f_saveRes
        if ~exist(resPath, 'dir')
            mkdir(resPath);
        end
        imwrite(ia1, fullfile(resPath, [Inum '_ia1.png']));
        imwrite(ie1, fullfile(resPath, [Inum '_ie1.png']));
        imwrite(ia2, fullfile(resPath, [Inum '_ia2.png']));
        imwrite(ie2, fullfile(resPath, [Inum '_ie2.png']));
        imwrite(ia3, fullfile(resPath, [Inum '_ia3.png']));
        imwrite(ie3, fullfile(resPath, [Inum '_ie3.png']));
        imwrite(ia4, fullfile(resPath, [Inum '_ia4.png']));
        imwrite(ie4, fullfile(resPath, [Inum '_ie4.png']));
        imwrite(ia5, fullfile(resPath, [Inum '_ia5.png']));
        imwrite(ie5, fullfile(resPath, [Inum '_ie5.png']));
    end
    
    if f_computeWhdr
        jsonPath = fullfile(jsonDir, [Inum '.json']);
        resPath1 = fullfile(resPath, [Inum '_ia1.png']);
        resPath2 = fullfile(resPath, [Inum '_ia2.png']);
        resPath3 = fullfile(resPath, [Inum '_ia3.png']);
        resPath4 = fullfile(resPath, [Inum '_ia4.png']);
        resPath5 = fullfile(resPath, [Inum '_ia5.png']);
        whdr{d,1} = str2num(Inum);
        whdr{d,2} = computeWHDR(resPath1, jsonPath) ;
        whdr{d,3} = computeWHDR(resPath2, jsonPath) ;
        whdr{d,4} = computeWHDR(resPath3, jsonPath) ;
        whdr{d,5} = computeWHDR(resPath4, jsonPath) ;
        whdr{d,6} = computeWHDR(resPath5, jsonPath) ;
    end
    
    if(f_debugInfo)
%         uprintf(sprintf('=== Processed %d/%d %s.png whdr=%0.4f %0.4f %0.4f %0.4f %0.4f===\n',d, numel(Nsplit), Inum, whdr{d,2}, whdr{d,3}, whdr{d,4}, whdr{d,5}, whdr{d,6}));
        fprintf(sprintf('=== Processed %d/%d %s.png whdr=%0.4f %0.4f %0.4f %0.4f %0.4f===\n',d, numel(Nsplit), Inum, whdr{d,2}, whdr{d,3}, whdr{d,4}, whdr{d,5}, whdr{d,6}));
    end
    
    if f_visualize
        imshow([I ia1 ia2 ia3 ia4 ia5; sI ie1 ie2 ie3 ie4 ie5])
        pause;
    end
end

if f_saveRes
    resPath_whdr = fullfile(resPath,'whdr.mat');
    save(resPath_whdr,'whdr');
end

%% FUNCTIONS
function[ia,ie] = sep_AE(I,sI,k)
[A,E] = func_qIID_rpca_v2f3(I,sI,k);
a = reshape(A(:,1), size(I,1),size(I,2) );
e = reshape(E(:,1), size(I,1),size(I,2) );
ia = cat(3,a.x, a.y, a.z);
ie = cat(3,e.x, e.y, e.z);
end