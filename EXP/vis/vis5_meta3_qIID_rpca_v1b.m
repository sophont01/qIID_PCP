%% visualize v1b on all MPI-shading images from revisitedIID paper dataset
close all; clear all; clc;
%% PATHS
RpathBase = '/home/saurabh/WORK/CODES/quaternions/OLD/qIID/qIID_PCP/RESULTS/fromABACUS/meta3_qIID_rpca_v1b/';
Ipath_clean = '/media/saurabh/String/WORK/DATASETS/RevisitedIID/dataset/MPI-main-clean/';
Ipath_albedo = '/media/saurabh/String/WORK/DATASETS/RevisitedIID/dataset/MPI-main-albedo/';
Ipath_shading = '/media/saurabh/String/WORK/DATASETS/RevisitedIID/dataset/MPI-main-shading/';
saveDir = fullfile('/home/saurabh/WORK/CODES/quaternions/OLD/qIID/qIID_PCP/RESULTS/',mfilename);

%% FLAGS
saveFlag = false;
showFlag = true;

%% LOCAL PARAMS
alpha  = 1;
beta   = 0.25;
gamma1 = 0.50;
gamma2 = 0.50;
D = dir(fullfile(RpathBase,'*frame*'));
warning off
if ~exist(saveDir,'dir')
    mkdir(saveDir);
end
for i=1:50:numel(D)
    %% READING INPUTS
    Iname = D(i).name;
    I_c = im2double(imread(fullfile(Ipath_clean,[Iname '.png'])));
    I_a = im2double(imread(fullfile(Ipath_albedo,[Iname '.png'])));
    I_s = im2double(imread(fullfile(Ipath_shading,[Iname '.png'])));
    I_z = zeros(size(I_s));
    Rpath = fullfile(RpathBase,Iname);
    A1 = im2double(imread(fullfile(Rpath,[Iname '_iA1.png'])));
    A2 = im2double(imread(fullfile(Rpath,[Iname '_iA2.png'])));
    A3 = im2double(imread(fullfile(Rpath,[Iname '_iA3.png'])));
    A4 = im2double(imread(fullfile(Rpath,[Iname '_iA4.png'])));
    A5 = im2double(imread(fullfile(Rpath,[Iname '_iA5.png'])));
    
    E1 = im2double(imread(fullfile(Rpath,[Iname '_iE1.png'])));
    E2 = im2double(imread(fullfile(Rpath,[Iname '_iE2.png'])));
    E3 = im2double(imread(fullfile(Rpath,[Iname '_iE3.png'])));
    E4 = im2double(imread(fullfile(Rpath,[Iname '_iE4.png'])));
    E5 = im2double(imread(fullfile(Rpath,[Iname '_iE5.png'])));
    
    A1 = normalizeIm(A1);
    A2 = normalizeIm(A2);
    A3 = normalizeIm(A3);
    A4 = normalizeIm(A4);
    A5 = normalizeIm(A5);
    E1 = normalizeIm(E1);
    E2 = normalizeIm(E2);
    E3 = normalizeIm(E3);
    E4 = normalizeIm(E4);
    E5 = normalizeIm(E5);
    
    %% MERGING
    A{1} = A1; A{2} = A2; A{3} = A3; A{4} = A4; A{5} = A5;
    E{1} = E2; E{2} = E3; E{3} = E4;
    fprintf('Running GRW\n');
    [~,pMaps_1] = getFocusPmaps(E,5,0.1,1,0.01);
    allL = zeros(size(I_s));
    allL = allL +  A{2} .* repmat([pMaps_1(:,:,1)],[1 1 3]);
    allL = allL +  A{3} .* repmat([pMaps_1(:,:,2)],[1 1 3]);
    allL = allL +  A{4} .* repmat([pMaps_1(:,:,3)],[1 1 3]);
    %% RECONSTRUCTION
    recon_0 = allL.*I_a;
    recon = alpha*recon_0 + beta*(gamma1*E1 + gamma2*E5)/(gamma1 + gamma2);
    %% RESULTS
    if saveFlag
        savePath = fullfile(saveDir,[Iname '.png']);
        imwrite([I_c recon], savePath);
    end
    if showFlag
        imshow([I_c recon])
        set(gcf,'WindowState','fullscreen')
        set(gca,'Position',[0 0 1 1])
        pause
    end
end

function[imN] = normalizeIm(im)
imN = rgb2hsv(im);
mx = double(max(max(im(:,:,3))));
mn = double(min(min(im(:,:,3))));
imN(:,:,3) = (imN(:,:,3) - mn)./(mx - mn);
imN = hsv2rgb(imN);
end

function[imN] = rev_normalizeIm(im)
imN = rgb2hsv(im);
mx = double(max(max(1-im(:,:,3))));
mn = double(min(min(1-im(:,:,3))));
imN(:,:,3) = ((1-imN(:,:,3)) - mn)./(mx - mn);
imN = hsv2rgb(imN);
end