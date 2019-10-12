clear all; close all; clc;
%% PATHS
addpath(genpath('./tools'))
addpath(genpath('./evaluate'))
addpath(genpath('./LIBS'))
addpath(genpath('./EXP'))

% Ipath = '/media/saurabh/String/WORK/RESULTS/qIID/qIID_rpca/meta1_qIID_rpca_v1a/nofilt/';
Ipath = '/media/saurabh/String/WORK/RESULTS/qIID/qIID_rpca/meta1_qIID_rpca_v1a/iAAA_2x/';
Gpath = '/media/saurabh/String/WORK/RESULTS/BiIID/paperResults/smooth/';
% Rpath = '/media/saurabh/String/WORK/RESULTS/qIID/qIID_rpca/meta1_qIID_rpca_v1a/iAAA_1x/';
Rpath = '/media/saurabh/String/WORK/RESULTS/qIID/qIID_rpca/meta1_qIID_rpca_v1a/iAAA_3x/';
idx_Nsplit;

fprintf('=======================\n');
for i=1:numel(Nsplit)
    Inum = num2str(Nsplit(i));
    uprintf(sprintf('=== Processing %d/%d %s ===\n',i, numel(Nsplit), Inum));
    Iname = fullfile(Ipath, [Inum '_iAAA.png']);
    Gname = fullfile(Gpath, [Inum '-smooth.png']);
    guidedFiltering(Iname, Gname, Rpath);
end


