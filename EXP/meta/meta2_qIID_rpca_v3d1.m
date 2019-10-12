clear all; close all; clc;
warning off
%% PATHS
addpath(genpath('./tools'))
addpath(genpath('./evaluate'))
addpath(genpath('./LIBS'))
addpath(genpath('./EXP'))
addpath(genpath('./ROUGH'))
Rdir = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/RESULTS';
Ddir = '/media/saurabh/String/WORK/RESULTS/qIID/qIID_rpca/meta2_qIID_rpca_v3d/';
sIdir = '/media/saurabh/String/WORK/RESULTS/BiIID/paperResults/smooth/';
whdrPath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/evaluate/whdr.py';
jsonDir = '/media/saurabh/String/WORK/DATASETS/iiw-dataset/data/';

%% FLAGS
f_debugInfo = true;
f_saveRes   = true;
f_visualize = true;
f_computeWhdr = true;

%% PARAMS
% k = [1.0 1.1 1.2 1.3 1.4];
k = [1 0.8];
% k = 0.8; <-- too much detail in E
% k = 1.2; <-- bad
%% VARIABLES
whdr = {};
resPath = fullfile(Rdir, mfilename);

%% SCRIPTS
idx_Nsplit;

%% MAIN
fprintf('=======================\n');
for d=1:numel(Nsplit)
    
    Inum = num2str(Nsplit(d));
    Iname = strcat(Inum,'_ia1.png');
    Ipath = fullfile(Ddir, Iname);
    I = im2double(imread(Ipath));
    sIpath = fullfile(sIdir, [Inum '-smooth.png']);
    sI = im2double(imread(sIpath));
    
    [ia1,ie1] = sep_AE( I,sI,k(2) );
      
    if f_saveRes
        if ~exist(resPath, 'dir')
            mkdir(resPath);
        end
        imwrite(ia1, fullfile(resPath, [Inum '_ia2.png']));
        imwrite(ie1, fullfile(resPath, [Inum '_ie2.png']));
    end
    
    if f_computeWhdr
        jsonPath = fullfile(jsonDir, [Inum '.json']);
        resPath1 = fullfile(resPath, [Inum '_ia2.png']);
        whdr{d,1} = str2num(Inum);
        whdr{d,2} = computeWHDR(resPath1, jsonPath) ;
    end
    
    if(f_debugInfo)
        t = cell2mat(whdr(:,2));
        t = mean(t);
        fprintf(sprintf('=== Processed %d/%d %s.png whdr=%0.4f mean=%0.4f ===\n',d, numel(Nsplit), Inum, whdr{d,2},t));
    end
    
    if f_visualize
%         ie1_n = normalizeIm(ie1); % <-- no visualization 
        imshow([I ia1 ie1])
%         pause;
    end
end

if f_saveRes
    resPath_whdr = fullfile(resPath,'whdr_2.mat');
    save(resPath_whdr,'whdr');
end

%% FUNCTIONS
function[ia,ie] = sep_AE(I,sI,k)
[A,E] = func_qIID_rpca_v3d(I,sI,k);
a = reshape(A(:,1), size(I,1),size(I,2) );
e = reshape(E(:,1), size(I,1),size(I,2) );
ia = cat(3, a.x, a.y, a.z);
ie = cat(3, e.x, e.y, e.z);
end

function[imN] = normalizeIm(im)
imN = rgb2hsv(im);
mx = double(max(max(im(:,:,3))));
mn = double(min(min(im(:,:,3))));
imN(:,:,3) = (imN(:,:,3) - mn)./(mx - mn);
imN = hsv2rgb(imN);
end
