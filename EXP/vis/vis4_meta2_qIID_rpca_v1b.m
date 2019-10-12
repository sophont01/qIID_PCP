close all; clear all; clc;
Rpath = '/home/saurabh/WORK/CODES/quaternions/OLD/qIID/qIID_PCP/RESULTS/meta2_qIID_rpca_v1b/';
Ipath_c = '/media/saurabh/String/WORK/DATASETS/ARAP/ARAP/iidBenchmarking/images/';
Ipath_a = '/media/saurabh/String/WORK/DATASETS/ARAP/ARAP/iidBenchmarking/albedo/';
Ipath_s = '/media/saurabh/String/WORK/DATASETS/ARAP/ARAP/iidBenchmarking/shading/';
saveDir = '/home/saurabh/WORK/CODES/quaternions/OLD/qIID/qIID_PCP/RESULTS/vis4_meta2_qIID_rpca_v1b/';
if ~exist(saveDir,'dir')
    mkdir(saveDir);
end
warning off
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
    E4 = rev_normalizeIm(E4);
    E5 = rev_normalizeIm(E5);
    
    A{1} = A1; A{2} = A2; A{3} = A3; A{4} = A4; A{5} = A5;
%     E{1} = E1; E{2} = E2; E{3} = E3; %E{4} = E4; E{5} = E5;
    E{1} = E2; E{2} = E3; E{3} = E4; E{4} = E5;
    fprintf('Running GRW\n');
    [~,pMaps_1] = getFocusPmaps(E,5,0.1,1,0.01);
    allL = zeros(size(I_s));
%     allL = allL + E1;
%     allL = allL +  A{1} .* repmat([pMaps(:,:,1)],[1 1 3]);
    allL = allL +  A{2} .* repmat([pMaps_1(:,:,1)],[1 1 3]);
    allL = allL +  A{3} .* repmat([pMaps_1(:,:,2)],[1 1 3]);
    allL = allL +  A{4} .* repmat([pMaps_1(:,:,3)],[1 1 3]);
    allL = allL +  A{5} .* repmat([pMaps_1(:,:,4)],[1 1 3]);
    recon_0 = allL.*I_a;
    
    allL_1 = allL + E1;
    recon_1 = allL_1.*I_a;
    
%     allE{1} = E1;
%     allE{2} = E{1} + E{2} + E{3} + E{4};
%     [~,pMaps_2] = getFocusPmaps(allE,5,0.1,1,0.01);
%     allL_2 = zeros(size(I_s));
%     allL_2 = allL_2 + E1 .* repmat([pMaps_2(:,:,1)],[1 1 3]);
%     allL_2 = allL_2 + allL .* repmat([pMaps_2(:,:,2)],[1 1 3]);
%     recon_2 = allL_2.*I_a;

%     allE{1} = E1;
%     allE{2} = E2 + E3 + E4 + E5;
%     [~,pMaps_2] = getFocusPmaps(allE,5,0.1,1,0.01);
%     allL_2 = zeros(size(I_s));
% %     allL_2 = allL_2 + I_s .* repmat([pMaps_2(:,:,1)],[1 1 3]);
% %     allL_2 = allL_2 + A1 .* repmat([pMaps_2(:,:,2)],[1 1 3]);
%     allL_2 = allL_2 + A1 .* repmat([pMaps_2(:,:,1)],[1 1 3]);
%     allL_2 = allL_2 + A2 .* repmat([pMaps_2(:,:,2)],[1 1 3]);
%     recon_2 = allL_2.*I_a;
    
%     recon_2 = recon_0 + E1;
    recon_2 = recon_0 + 0.25*E1;
    
    savePath = fullfile(saveDir,[Iname_base '.png']);
    imwrite([I_c recon_2], savePath);
    
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