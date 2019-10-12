%%% Visualize v1b on all InverseLightTransport rendered images from Aakash
close all; clear all; clc;
RpathBase = '/home/saurabh/WORK/CODES/quaternions/OLD/qIID/qIID_PCP/RESULTS/meta4_qIID_rpca_v1b/';
Ipath_base = '/media/saurabh/Rythym/WORK/DATASETS/InverseLightTransport/';
Ipath_clean = '/media/saurabh/Rythym/WORK/DATASETS/InverseLightTransport/8/';
warning off
r1 = figure; ax1 = gca;
% r2 = figure; ax2 = gca;
D = dir(fullfile(Ipath_clean,'*.png'));

 for i=1:numel(D)
    Iname = D(i).name;
    [~,Iname,Iext] = fileparts(Iname);
    I_c = im2double(imread(fullfile(Ipath_clean,[Iname '.png'])));
    I_1 = im2double(imread(fullfile(Ipath_base, '1', [Iname '.png'])));
    I_2 = im2double(imread(fullfile(Ipath_base, '2', [Iname '.png'])));
    I_3 = im2double(imread(fullfile(Ipath_base, '3', [Iname '.png'])));
    I_4 = im2double(imread(fullfile(Ipath_base, '4', [Iname '.png'])));
    I_5 = im2double(imread(fullfile(Ipath_base, '5', [Iname '.png'])));
    I_6 = im2double(imread(fullfile(Ipath_base, '6', [Iname '.png'])));
    I_7 = im2double(imread(fullfile(Ipath_base, '7', [Iname '.png'])));
    I_8 = im2double(imread(fullfile(Ipath_base, '8', [Iname '.png'])));

    Rpath = RpathBase; %fullfile(RpathBase,Iname);
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
    
%     A{1} = A1; A{2} = A2; A{3} = A3; A{4} = A4; A{5} = A5;
%     E{1} = E1; E{2} = E2; E{3} = E3; E{4} = E4; E{5} = E5;
%     [~,pMaps] = getFocusPmaps(E,5,0.1,1,0.01);
%     allL = zeros(size(I_s));
%     allL = allL +  A{1} .* repmat([pMaps(:,:,1)],[1 1 3]);
%     allL = allL +  A{2} .* repmat([pMaps(:,:,2)],[1 1 3]);
%     allL = allL +  A{3} .* repmat([pMaps(:,:,3)],[1 1 3]);
%     allL = allL +  A{4} .* repmat([pMaps(:,:,4)],[1 1 3]);
%     allL = allL +  A{5} .* repmat([pMaps(:,:,5)],[1 1 3]);
%     
%     reconI = allL.*I_a;
% %     imshow([I_c reconI])
%     imshow([I_c I_a I_s allL reconI; E1 E2-E1 E3-E2 E4-E3 E5-E4; repmat([pMaps(:,:,1) pMaps(:,:,2) pMaps(:,:,3) pMaps(:,:,4) pMaps(:,:,5)],[1 1 3]); A1 A2 A3 A4 A5] ,'Parent',ax1);
    
    gI_12 = normalizeIm(I_2 - I_1);
    gI_23 = normalizeIm(I_3 - I_2);
    gI_34 = normalizeIm(I_4 - I_3);
    gI_45 = normalizeIm(I_5 - I_4);
    gI_56 = normalizeIm(I_6 - I_5);
    
    imshow([gI_12 gI_23 gI_34 gI_45 gI_56; A1 A2 A3 A4 A5; E1 E2-E1 E3-E2 E4-E3 E5-E4],'Parent',ax1);
%     imshow([I_1 I_2 I_3 I_4 I_5; A1 A2 A3 A4 A5; E1 E2-E1 E3-E2 E4-E3 E5-E4],'Parent',ax1);
%     imshow(I,'Parent',ax2); truesize(r2);
    pause

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