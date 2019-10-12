clear all; close all; clc;
Rpath = '/media/saurabh/String/WORK/RESULTS/qIID/qIID_rpca/meta_qIID_rpca_v1b/';
Ipath = '/media/saurabh/String/WORK/DATASETS/iiw-dataset/data/';
warning off
idx_Nsplit

for i=500:numel(Nsplit)
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
    
    rI = E1 + E2 + E3 + E4 + E5 + A5;
    %     A1 = normalizeIm(A1);
    %     A2 = normalizeIm(A2);
    %     A3 = normalizeIm(A3);
    %     A4 = normalizeIm(A4);
    %     A5 = normalizeIm(A5);
    %     E1 = normalizeIm(E1);
    %     E2 = normalizeIm(E2);
    %     E3 = normalizeIm(E3);
    %     E4 = normalizeIm(E4);
    %     E5 = normalizeIm(E5);
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
    
    
    %% Using Grady's Fusion weights
    %     [~,w] = getWeights_2({E1,E2,E3,E4,E5},2,0.5);
    %     wE1 = w(:,:,1).*E1;
    %     wE2 = w(:,:,2).*E2;
    %     wE3 = w(:,:,3).*E3;
    %     wE4 = w(:,:,4).*E4;
    %     wE5 = w(:,:,5).*E5;
    %     %     nE = wE1 + wE2 + wE3 + wE4 + wE5;
    %     %     imshow([I nE nE+A5]);
    %     fwE1 = imgaussfilt3(wE1);
    %     fwE2 = imgaussfilt3(wE2);
    %     fwE3 = imgaussfilt3(wE3);
    %     fwE4 = imgaussfilt3(wE4);
    %     fwE5 = imgaussfilt3(wE5);
    %     fA5 = imgaussfilt3(A5);
    %     nE = wE1 + wE2 + wE3 + wE4 + wE5 + A5;
    %     fnE = fwE1 + fwE2 + fwE3 + fwE4 + fwE5 + fA5;
    %     imshow([I nE fnE]);
    %% Same as above + tinkering with specular and shadow components
    %     wA5 = w(:,:,5).*A5;
    %     wE5 = 1.4*w(:,:,5).*E5;
    %     wE4 = 1*w(:,:,4).*E4;
    %     wE3 = 1*w(:,:,3).*E3;
    %     wE2 = 1*w(:,:,2).*E2;
    %     wE1 = 0.6*w(:,:,1).*E1;
    %     fwE1 = imgaussfilt3(wE1);
    %     fwE2 = imgaussfilt3(wE2);
    %     fwE3 = imgaussfilt3(wE3);
    %     fwE4 = imgaussfilt3(wE4);
    %     fwE5 = imgaussfilt3(wE5);
    %     fwA5 = imgaussfilt3(wA5);
    % %     nE = wE1 + wE2 + wE3 + wE4 + wE5 + wA5;
    %     fnE = fwE1 + fwE2 + fwE3 + fwE4 + fwE5 + fwA5;
    %
    %     imshow([I fnE]);
    %% SIMPLE E5 INCREASE
    %     wA5 = A5;
    %     wE1 = E1;
    %     wE2 = E2;
    %     wE3 = E3;
    %     wE4 = E4;
    %     wE5 = 5*E5;
    %     wI = wE1 +wE2 +wE3 +wE4 +wE5 + wA5;
    %     imshow([I wI])
    %% ALL lit (extra highlighted colors)
    %         w = 2.5*[0.5 0.75 1 1.25 1.5];
    %         wA5  = A5;
    %         wE54 = w(5)*E54;
    %         wE43 = w(4)*E43;
    %         wE32 = w(3)*E32;
    %         wE21 = w(2)*E21;
    %         wE1  = w(1)*E1;
    %
    %         wI = wA5 + (wE54 + E4) + (wE43 + E3) + (wE32 + E2) + (wE21 + E1) + wE1;
    %         imshow([I wI])
    %% ALL lit (extra highlighted colors)-2
    w = 3*[0.5 0.75 1 1.25 1.5];
    wA5  = A5;
    wE54 = w(5)*E54;
    wE43 = w(4)*E43;
    wE32 = w(3)*E32;
    wE21 = w(2)*E21;
    wE1  = w(1)*E1;
    wE54 = imgaussfilt3(wE54);
    wE43 = imgaussfilt3(wE43);
    wE32 = imgaussfilt3(wE32);
    wE21 = imgaussfilt3(wE21);
    wE1 = imgaussfilt3(wE1);
    
    wI = wA5 + (wE54 + E4) + (wE43 + E3) + (wE32 + E2) + (wE21 + E1) + wE1;
    imshow([I wI])
    %% ALL Lit color corrected (muted colors)
    %     w = 2.5*[0.5 0.75 1 1.25 1.5];
    %     wA5  = A5;
    %     wE54 = repmat(w(5)*rgb2gray(E54),[1 1 3]);
    %     wE43 = repmat(w(4)*rgb2gray(E43),[1 1 3]);
    %     wE32 = repmat(w(3)*rgb2gray(E32),[1 1 3]);
    %     wE21 = repmat(w(2)*rgb2gray(E21),[1 1 3]);
    %     wE1  = repmat(w(1)*rgb2gray(E1),[1 1 3]);
    %
    %     wI = wA5 + (wE54 + E4) + (wE43 + E3) + (wE32 + E2) + (wE21 + E1) + wE1;
    %     imshow([I wI])
    %% ALL lit color corrected  (patchy or blurred)
    %     w = 3 *[0.5 0.75 1 1.25 1.5];
    %     wA5  = A5;
    %     hE54 = rgb2lab(E54);    hE54(:,:,1) = w(5)*hE54(:,:,1);     wE54 = lab2rgb(hE54);
    %     hE43 = rgb2lab(E43);    hE43(:,:,1) = w(4)*hE43(:,:,1);     wE43 = lab2rgb(hE43);
    %     hE32 = rgb2lab(E32);    hE32(:,:,1) = w(3)*hE32(:,:,1);     wE32 = lab2rgb(hE32);
    %     hE21 = rgb2lab(E21);    hE21(:,:,1) = w(2)*hE21(:,:,1);     wE21 = lab2rgb(hE21);
    %     hE1  = rgb2lab(E1);     hE1(:,:,1)  = w(1)*hE1(:,:,1);      wE1  = lab2rgb(hE1);
    % %     wE54 = imgaussfilt3(wE54,1);
    % %     wE43 = imgaussfilt3(wE43,1);
    % %     wE32 = imgaussfilt3(wE32,1);
    % %     wE21 = imgaussfilt3(wE21,1);
    % %     wE1 = imgaussfilt3(wE1,1);
    %
    %     wI = wA5 + (wE54 + E4) + (wE43 + E3) + (wE32 + E2) + (wE21 + E1) + wE1;
    %     imshow([I wI])
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