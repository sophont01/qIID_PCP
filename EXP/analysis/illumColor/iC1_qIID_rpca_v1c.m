%% visualize v1b on all EFROS IID images on NARIHIRA dataset
close all; clear all; clc;
%% PATHS
RpathBase = '/home/saurabh/WORK/CODES/quaternions/OLD/qIID/qIID_PCP/RESULTS/meta5_qIID_rpca_v1c/';
Ipath_main = '/home/saurabh/WORK/CODES/quaternions/OLD/qIID/qIID_PCP/Datasets/NARIHIRAtestsplit/';
Ipath_albedo = '/media/saurabh/String/WORK/RESULTS/EfrosIID/IIW/';
Ipath_shading = '/media/saurabh/String/WORK/RESULTS/EfrosIID/IIW/';
saveDir = fullfile('/home/saurabh/WORK/CODES/quaternions/OLD/qIID/qIID_PCP/RESULTS/',mfilename);

%% FLAGS
saveFlag = false;
showFlag = true;

%% LOCAL PARAMS
alpha  = 0.25; %0.25; %0.50;
beta   = 0.75; %1.00; %0.50;
gamma1 = 1.00; %0.75; %0.50;
gamma2 = 1.25; %0.25; %0.50;
D = dir(fullfile(Ipath_main,'*.png'));
warning off
if ~exist(saveDir,'dir')
    mkdir(saveDir);
end
for i=1:1:numel(D)
    %% READING INPUTS
    [~,Iname,Iext] = fileparts(D(i).name);
    I_c = im2double(imread(fullfile(Ipath_main,[Iname '.png'])));
    I_a = im2double(imread(fullfile(Ipath_albedo,[Iname '-r.png'])));
    I_s = im2double(imread(fullfile(Ipath_shading,[Iname '-s.png'])));
    if size(I_s,3) ~= 3
        I_s = repmat(I_s,[1 1 3]);
    end
    Rpath = RpathBase;
    A1 = im2double(imread(fullfile(Rpath,[Iname '_iA1.png'])));
    A2 = im2double(imread(fullfile(Rpath,[Iname '_iA2.png'])));
    A3 = im2double(imread(fullfile(Rpath,[Iname '_iA3.png'])));
    A4 = im2double(imread(fullfile(Rpath,[Iname '_iA4.png'])));
    A5 = im2double(imread(fullfile(Rpath,[Iname '_iA5.png'])));
    A6 = im2double(imread(fullfile(Rpath,[Iname '_iA6.png'])));
    A7 = im2double(imread(fullfile(Rpath,[Iname '_iA7.png'])));
    
    oE1 = im2double(imread(fullfile(Rpath,[Iname '_iE1.png'])));
    oE2 = im2double(imread(fullfile(Rpath,[Iname '_iE2.png'])));
    oE3 = im2double(imread(fullfile(Rpath,[Iname '_iE3.png'])));
    oE4 = im2double(imread(fullfile(Rpath,[Iname '_iE4.png'])));
    oE5 = im2double(imread(fullfile(Rpath,[Iname '_iE5.png'])));
    oE6 = im2double(imread(fullfile(Rpath,[Iname '_iE6.png'])));
    oE7 = im2double(imread(fullfile(Rpath,[Iname '_iE7.png'])));
    
    E1 = oE1;
    E2 = oE2 - oE1;
    E3 = oE3 - oE2;
    E4 = oE4 - oE3;
    E5 = oE5 - oE4;
    E6 = oE6 - oE5;
    E7 = oE7 - oE6;
    
    A1 = normalizeIm(A1);
    A2 = normalizeIm(A2);
    A3 = normalizeIm(A3);
    A4 = normalizeIm(A4);
    A5 = normalizeIm(A5);
    A6 = normalizeIm(A6);
    A7 = normalizeIm(A7);
    E1 = normalizeIm(E1);
    E2 = normalizeIm(E2);
    E3 = normalizeIm(E3);
    E4 = normalizeIm(E4);
    E5 = normalizeIm(E5);
    E6 = normalizeIm(E6);
    E7 = normalizeIm(E7);
    
    %% MERGING
    A{1} = A1; A{2} = A2; A{3} = A3; A{4} = A4; A{5} = A5; A{6} = A6; A{7} = A7;
    E{1} = E1; E{2} = E2; E{3} = E3; E{4} = E4; E{5} = E5; E{6} = E6; E{7} = E7;
    fprintf('Running GRW\n');
    [~,pMaps] = getFocusPmaps(E,5,0.5,1,0.01);
    reconAllInLight = allInLight(I_c,I_s,A,E,pMaps);
    
    
    
    %% RESULTS
    if saveFlag
        savePath = fullfile(saveDir,[Iname '.png']);
        imwrite(recon, savePath);
    end
    if showFlag
        imshow([I_c recon_2])
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

function[recon] = allInLight(I_c,I_s,A,E,pMaps)
allL = zeros(size(I_s));
allL = allL +  I_s  .* repmat([pMaps(:,:,1)],[1 1 3]);
allL = allL +  A{1} .* repmat([pMaps(:,:,2)],[1 1 3]);
allL = allL +  A{2} .* repmat([pMaps(:,:,3)],[1 1 3]);
allL = allL +  A{3} .* repmat([pMaps(:,:,4)],[1 1 3]);
allL = allL +  A{4} .* repmat([pMaps(:,:,5)],[1 1 3]);
allL = allL +  A{5} .* repmat([pMaps(:,:,6)],[1 1 3]);
allL = allL +  A{6} .* repmat([pMaps(:,:,7)],[1 1 3]);
recon = (I_c + (allL.*I_a))/2;
end
