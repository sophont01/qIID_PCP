close all; clear all; clc;
Rpath = '/home/saurabh/WORK/CODES/quaternions/OLD/qIID/qIID_PCP/RESULTS/meta2_qIID_rpca_v1b/';
Ipath_c = '/media/saurabh/String/WORK/DATASETS/ARAP/ARAP/iidBenchmarking/images/';
Ipath_a = '/media/saurabh/String/WORK/DATASETS/ARAP/ARAP/iidBenchmarking/albedo/';
Ipath_s = '/media/saurabh/String/WORK/DATASETS/ARAP/ARAP/iidBenchmarking/shading/';
saveDir = fullfile('/home/saurabh/WORK/CODES/quaternions/OLD/qIID/qIID_PCP/RESULTS/',mfilename);
if ~exist(saveDir,'dir')
    mkdir(saveDir);
end
warning off

saveFlag = false;
showFlag = true;
% r1 = figure; ax1 = gca;
% r2 = figure; ax2 = gca;
D = dir(fullfile(Ipath_s,'*shading.*'));

for i=1:numel(D)
    if i==13 %bad example (?)
        continue;
    end
    Iname = D(i).name;
    [~,Iname,Iext] = fileparts(Iname);
    F = strsplit(Iname,'_shading');
    Iname_base = F{1};
    
    I_s = im2double(imread(fullfile(Ipath_s,[Iname_base '_shading' Iext])));
    I_a = im2double(imread(fullfile(Ipath_a,[Iname_base '_albedo' Iext])));
    I_c = im2double(imread(fullfile(Ipath_c,[Iname_base Iext])));
    A1 = im2double(imread(fullfile(Rpath,[Iname_base '_shading' '_iA1.png'])));
    A2 = im2double(imread(fullfile(Rpath,[Iname_base '_shading' '_iA2.png'])));
    A3 = im2double(imread(fullfile(Rpath,[Iname_base '_shading' '_iA3.png'])));
    A4 = im2double(imread(fullfile(Rpath,[Iname_base '_shading' '_iA4.png'])));
    A5 = im2double(imread(fullfile(Rpath,[Iname_base '_shading' '_iA5.png'])));
    
    E1 = im2double(imread(fullfile(Rpath,[Iname_base '_shading' '_iE1.png'])));
    E2 = im2double(imread(fullfile(Rpath,[Iname_base '_shading' '_iE2.png'])));
    E3 = im2double(imread(fullfile(Rpath,[Iname_base '_shading' '_iE3.png'])));
    E4 = im2double(imread(fullfile(Rpath,[Iname_base '_shading' '_iE4.png'])));
    E5 = im2double(imread(fullfile(Rpath,[Iname_base '_shading' '_iE5.png'])));
    
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
    
    A{1} = A1; A{2} = A2; A{3} = A3; A{4} = A4; A{5} = A5;
    E{1} = E2; E{2} = E3; E{3} = E4;
    fprintf('Running GRW\n');
    [~,pMaps_1] = getFocusPmaps(E,5,0.1,1,0.01);
    allL = zeros(size(I_s));
    
    allL = allL +  A{2} .* repmat([pMaps_1(:,:,1)],[1 1 3]);
    allL = allL +  A{3} .* repmat([pMaps_1(:,:,2)],[1 1 3]);
    allL = allL +  A{4} .* repmat([pMaps_1(:,:,3)],[1 1 3]);
    recon_0 = allL.*I_a;
    %%
    %     recon_1a = recon_0 + 0.10*E1;
    %     recon_1b = recon_0 + 0.15*E1;
    %     recon_1c = recon_0 + 0.20*E1;
    %     recon_1d = recon_0 + 0.25*E1;
    %     recon_1e = recon_0 + 0.30*E1;
    %     recon_1f = recon_0 + 0.35*E1;
    %     recon_1g = recon_0 + 0.40*E1;
    %     recon_1h = recon_0 + 0.45*E1;
    %     recon_1i = recon_0 + 0.50*E1;
    
    %     recon_2 = recon_0 + 0.25*E1;
    
    
    %     recon_1a = recon_0 + 0.10*E1;
    %     recon_1b = recon_0 + 0.30*E1;
    %     recon_1c = recon_0 + 0.50*E1;
    %     recon_1d = recon_0 + 0.70*E1;
    %
    %     recon_2a = recon_0 + 0.10*E5;
    %     recon_2b = recon_0 + 0.30*E5;
    %     recon_2c = recon_0 + 0.50*E5;
    %     recon_2d = recon_0 + 0.70*E5;
    
    %%
    %     recon_1a = 0.90*recon_0 + 0.10*E1;
    %     recon_1b = 0.70*recon_0 + 0.30*E1;
    %     recon_1c = 0.50*recon_0 + 0.50*E1;
    %     recon_1d = 0.30*recon_0 + 0.70*E1;
    %
    %     recon_2a = 0.90*recon_0 + 0.10*E5;
    %     recon_2b = 0.70*recon_0 + 0.30*E5;
    %     recon_2c = 0.50*recon_0 + 0.50*E5;
    %     recon_2d = 0.30*recon_0 + 0.70*E5;
    %
    %
    %     recon_3a = 0.90*recon_0 + 0.10*E1 + 0.10*E5;
    %     recon_3b = 0.70*recon_0 + 0.30*E1 + 0.30*E5;
    %     recon_3c = 0.50*recon_0 + 0.50*E1 + 0.50*E5;
    %     recon_3d = 0.30*recon_0 + 0.70*E1 + 0.70*E5;
    % %
    % %     recon_3a = (0.90*recon_0 + 0.10*E1 + 0.10*E5)/(0.90 + 0.10 + 0.10);
    % %     recon_3b = (0.70*recon_0 + 0.30*E1 + 0.30*E5)/(0.70 + 0.30 + 0.30);
    % %     recon_3c = (0.50*recon_0 + 0.50*E1 + 0.50*E5)/(0.50 + 0.50 + 0.50);
    % %     recon_3d = (0.30*recon_0 + 0.70*E1 + 0.70*E5)/(0.30 + 0.70 + 0.70);
    %
    %     recon_4a = 0.90*recon_0 + 0.10*E1 + 0.70*E5;
    %     recon_4b = 0.70*recon_0 + 0.30*E1 + 0.50*E5;
    %     recon_4c = 0.50*recon_0 + 0.50*E1 + 0.30*E5;
    %     recon_4d = 0.30*recon_0 + 0.70*E1 + 0.10*E5;
    
    %%
    %     recon_3b = 0.70*recon_0 + 0.30*E1 + 0.30*E5;
    %     recon_3c = 0.50*recon_0 + 0.50*E1 + 0.50*E5;
    %     recon_4b = 0.70*recon_0 + 0.30*E1 + 0.50*E5;
    %     recon_4c = 0.50*recon_0 + 0.50*E1 + 0.30*E5;
    %
    %     alpha = 0.75;
    %     recon_3b1 = alpha*recon_0 + (1-alpha)*(0.30*E1 + 0.30*E5)/(0.30 + 0.30);
    %     recon_3c1 = alpha*recon_0 + (1-alpha)*(0.50*E1 + 0.50*E5)/(0.50 + 0.50);
    %     recon_4b1 = alpha*recon_0 + (1-alpha)*(0.30*E1 + 0.50*E5)/(0.30 + 0.50);
    %     recon_4c1 = alpha*recon_0 + (1-alpha)*(0.50*E1 + 0.30*E5)/(0.50 + 0.30);
    %
    %
    %     alpha = 0.50;
    %     recon_3b2 = alpha*recon_0 + (1-alpha)*(0.30*E1 + 0.30*E5)/(0.30 + 0.30);
    %     recon_3c2 = alpha*recon_0 + (1-alpha)*(0.50*E1 + 0.50*E5)/(0.50 + 0.50);
    %     recon_4b2 = alpha*recon_0 + (1-alpha)*(0.30*E1 + 0.50*E5)/(0.30 + 0.50);
    %     recon_4c2 = alpha*recon_0 + (1-alpha)*(0.50*E1 + 0.30*E5)/(0.50 + 0.30);
    
    %%
    %     %     recon_3b = 0.70*recon_0 + 0.30*E1 + 0.30*E5;
    %     recon_3c = 0.50*recon_0 + 0.50*E1 + 0.50*E5;
    %     recon_4b = 0.70*recon_0 + 0.30*E1 + 0.50*E5;
    %     %     recon_4c = 0.50*recon_0 + 0.50*E1 + 0.30*E5;
    %
    %
    %     alpha = 0.85;
    %     %     recon_3b1 = alpha*recon_0 + (1-alpha)*(0.30*E1 + 0.30*E5)/(0.30 + 0.30);
    %     recon_3c0 = recon_0 + (1-alpha)*(0.50*E1 + 0.50*E5)/(0.50 + 0.50);
    %     recon_4b0 = recon_0 + (1-alpha)*(0.30*E1 + 0.50*E5)/(0.30 + 0.50);
    %     %     recon_4c1 = alpha*recon_0 + (1-alpha)*(0.50*E1 + 0.30*E5)/(0.50 + 0.30);
    %
    %     alpha = 0.75;
    %     %     recon_3b1 = alpha*recon_0 + (1-alpha)*(0.30*E1 + 0.30*E5)/(0.30 + 0.30);
    %     recon_3c1 = alpha*recon_0 + (1-alpha)*(0.50*E1 + 0.50*E5)/(0.50 + 0.50);
    %     recon_4b1 = alpha*recon_0 + (1-alpha)*(0.30*E1 + 0.50*E5)/(0.30 + 0.50);
    %     %     recon_4c1 = alpha*recon_0 + (1-alpha)*(0.50*E1 + 0.30*E5)/(0.50 + 0.30);
    %
    %
    %     alpha = 0.50;
    %     %     recon_3b2 = alpha*recon_0 + (1-alpha)*(0.30*E1 + 0.30*E5)/(0.30 + 0.30);
    %     recon_3c2 = alpha*recon_0 + (1-alpha)*(0.50*E1 + 0.50*E5)/(0.50 + 0.50);
    %     recon_4b2 = alpha*recon_0 + (1-alpha)*(0.30*E1 + 0.50*E5)/(0.30 + 0.50);
    %     %     recon_4c2 = alpha*recon_0 + (1-alpha)*(0.50*E1 + 0.30*E5)/(0.50 + 0.30);
    %%
    alpha  = 1;
    beta   = 0.25;
    gamma1 = 0.50;
    gamma2 = 0.50;
    recon = alpha*recon_0 + beta*(gamma1*E1 + gamma2*E5)/(gamma1 + gamma2);
    %     recon_4b0 = alpha*recon_0 + beta*(0.30*E1 + 0.50*E5)/(0.30 + 0.50);
    %%
    if saveFlag
        savePath = fullfile(saveDir,[Iname_base '.png']);
        imwrite([I_c recon_1d], savePath);
        %         imwrite([I_c recon_1a recon_1b recon_1c recon_1d; recon_1e recon_1f recon_1g recon_1h recon_1i], savePath);
    end
    
    if showFlag
        %         imshow([I_c recon_1a recon_1b recon_1c recon_1d; I_c recon_2a recon_2b recon_2c recon_2d; I_c recon_3a recon_3b recon_3c recon_3d; I_c recon_4a recon_4b recon_4c recon_4d ])
        %         imshow([I_c recon_3b recon_3c; I_c recon_3b1 recon_3c1; I_c recon_4b recon_4c; I_c recon_4b1 recon_4c1])
        %         imshow([I_c recon_3b recon_3c recon_4b recon_4c; I_c recon_3b1 recon_3c1 recon_4b1 recon_4c1; I_c recon_3b2 recon_3c2 recon_4b2 recon_4c2]);
        %         imshow([recon_3c recon_4b recon_3c1; recon_4b1 recon_3c0 recon_4b0]);
        %         imshow([I_c recon_3c0 recon_4b0])
        imshow([I_c recon])
        set(gcf,'WindowState','fullscreen')
        set(gca,'Position',[0 0 1 1])
        %         imshow([I_c recon_1a recon_1b recon_1c recon_1d; recon_1e recon_1f recon_1g recon_1h recon_1i]);
        %         imshow([I_c I_a I_s recon_0 recon_2; A1 A2 A3 A4 A5; E1 E2-E1 E3-E2 E4-E3 E5-E4])
    end
    
    
    %     imshow([I_c recon_0 + 0.1*E1; recon_0 + 0.25*E1 recon_0 + 0.5*E1])
    %     imshow([I_c recon_2])
    %     imshow([I_c recon_0; recon_1 recon_2])
    %     imshow([I_c I_a I_s allL reconI; E1 E2-E1 E3-E2 E4-E3 E5-E4; repmat([pMaps(:,:,1) pMaps(:,:,2) pMaps(:,:,3) pMaps(:,:,4) pMaps(:,:,5)],[1 1 3]); A1 A2 A3 A4 A5] ,'Parent',ax1);
    
    %    pause
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