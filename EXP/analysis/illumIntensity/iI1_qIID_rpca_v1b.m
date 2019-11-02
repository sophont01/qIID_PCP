clear all; close all; clc;
Rpath = '/media/saurabh/String/WORK/RESULTS/qIID/qIID_rpca/meta_qIID_rpca_v1b/';
Ipath = '/media/saurabh/String/WORK/DATASETS/iiw-dataset/data/';
warning off
idx_Nsplit

for i=1:numel(Nsplit)
    Inum = num2str(Nsplit(i));
    I = im2double(imread(fullfile(Ipath,[Inum '.png'])));
    %     Ihsv = rgb2hsv(I);
    %     av = mean(reshape(Ihsv(:,:,3),1,[]));
    A1 = im2double(imread(fullfile(Rpath,[Inum '_iA1.png'])));
    A2 = im2double(imread(fullfile(Rpath,[Inum '_iA2.png'])));
    A3 = im2double(imread(fullfile(Rpath,[Inum '_iA3.png'])));
    A4 = im2double(imread(fullfile(Rpath,[Inum '_iA4.png'])));
    A5 = im2double(imread(fullfile(Rpath,[Inum '_iA5.png'])));
    
    E1 = im2double(imread(fullfile(Rpath,[Inum '_iE1.png'])));
    E2 = im2double(imread(fullfile(Rpath,[Inum '_iE2.png'])));
    E3 = im2double(imread(fullfile(Rpath,[Inum '_iE3.png'])));
    E4 = im2double(imread(fullfile(Rpath,[Inum '_iE4.png'])));
    E5 = im2double(imread(fullfile(Rpath,[Inum '_iE5.png'])));
    
%     A1 = normalizeIm(A1);
%     A2 = normalizeIm(A2);
%     A3 = normalizeIm(A3);
%     A4 = normalizeIm(A4);
%     A5 = normalizeIm(A5);
    E1 = normalizeIm(E1);
    E2 = normalizeIm(E2);
    E3 = normalizeIm(E3);
    E4 = normalizeIm(E4);
    E5 = normalizeIm(E5);
    %     E1 = normalizeAvg(E1,av);
    %     E2 = normalizeAvg(E2,av);
    %     E3 = normalizeAvg(E3,av);
    %     E4 = normalizeAvg(E4,av);
    %     E5 = normalizeAvg(E5,av);
    
    E21 = E2-E1;
    E32 = E3-E2;
    E43 = E4-E3;
    E54 = E5-E4;
    
    %     imshow([A1 A2 A3 A4 A5; E1 E2 E3 E4 E5]);
    
%     w = computeW(I,1.5);
    [~,w] = getWeights({E1,E2,E3,E4,E5});
    %     imshow([I A1; E1 w.*E1]);
%     wE1 = w.*E1/5;
%     wE2 = w.*E2/5;
%     wE3 = w.*E3/5;
%     wE4 = w.*E4/5;
%     wE5 = w.*E5/5;
    
    wE1 = w(:,:,1).*E1/5;
    wE2 = w(:,:,2).*E2/5;
    wE3 = w(:,:,3).*E3/5;
    wE4 = w(:,:,4).*E4/5;
    wE5 = w(:,:,5).*E5/5;
%     imshow([A1 A2 A3 A4 A5; E1 E2 E3 E4 E5; wE1 wE2 wE3 wE4 wE5]);
    nE = wE1 + wE2 + wE3 + wE4 + wE5;
    imshow([I nE nE+A5]);
%     imshow([I normalizeIm(nE) normalizeIm(nE+A5)])
    
    %     nE = E1 + E21 + E32 + E43 + E54;
    %     nE = normalizeIm(nE);
    %     imshow([I nE normalizeIm(E5)]);
    %
    %     w = linspace(0.1,5,5);
    %     nI = w(1)*E1 + w(2)*E2 + w(3)*E3 + w(4)*E4 + w(5)*E5 + A5;
    
    %     w = linspace(0.1,5,5);
    %     nI = w(1)*E1 + w(2)*E21 + w(3)*E32+ w(4)*E43 + w(5)*E54 + A5;
    %
    %     imshow([I nI]);
    
    pause;
end

function[w] = computeW(I,t)
Im = (I(:,:,1) + I(:,:,2) + I(:,:,3))/3 ;
w = exp(-t*Im);
w = repmat(w,[1 1 3]);
end



function[imN] = normalizeIm(im)
imN = rgb2hsv(im);
mx = double(max(max(im(:,:,3))));
mn = double(min(min(im(:,:,3))));
imN(:,:,3) = (imN(:,:,3) - mn)./(mx - mn);
imN = hsv2rgb(imN);
end

function[imN] = normalizeAvg(im,av)
imN = rgb2hsv(im);
imN(:,:,3) = av;
imN = hsv2rgb(imN);
end