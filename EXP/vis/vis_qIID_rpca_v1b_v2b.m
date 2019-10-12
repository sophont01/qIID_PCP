%% Color shift in E component using LAB space and weighed according to E intensity values (iterative weighing)
close all; clear all; clc;
idx_Nsplit
Rpath = '/media/saurabh/String/WORK/RESULTS/qIID/qIID_rpca/meta_qIID_rpca_v1b/results/';
Ipath = '/media/saurabh/String/WORK/DATASETS/iiw-dataset/data/';
warning off
% r1 = figure; ax1 = gca;
% r2 = figure; ax2 = gca;
for i=267:numel(Nsplit)
    %     Inum = num2str(Nsplit(x_m2(i)));
    Inum = num2str(Nsplit(i));
    I = im2double(imread(fullfile(Ipath,[Inum '.png'])));
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
    
    A = {A1 A2 A3 A4 A5};
    E = {E1 E2 E3 E4 E5};
    nA1 = normalizeImIntensity(A1);
    nA2 = normalizeImIntensity(A2);
    nA3 = normalizeImIntensity(A3);
    nA4 = normalizeImIntensity(A4);
    nA5 = normalizeImIntensity(A5);
    nE1 = normalizeImIntensity(E1);
    nE2 = normalizeImIntensity(E2);
    nE3 = normalizeImIntensity(E3);
    nE4 = normalizeImIntensity(E4);
    nE5 = normalizeImIntensity(E5);
    
    
    %% MODIFYING ALL COMPONENETS
    %     [rE1,gE1,bE1,yE1] = modifyImColor(E1);
    %     [rE2E1,gE2E1,bE2E1,yE2E1] = modifyImColor(E2E1);
    %     [rE3E2,gE3E2,bE3E2,yE3E2] = modifyImColor(E3E2);
    %     [rE4E3,gE4E3,bE4E3,yE4E3] = modifyImColor(E4E3);
    %     [rE5E4,gE5E4,bE5E4,yE5E4] = modifyImColor(E5E4);
    %
    %     rE2 = rE2E1+rE1;
    %     rE3 = rE3E2+rE2;
    %     rE4 = rE4E3+rE3;
    %     rE5 = rE5E4+rE4;
    %
    %     rE1 = normalizeAB(rE1,E1);
    %     rE2 = normalizeAB(rE2,E2);
    %     rE3 = normalizeAB(rE3,E3);
    %     rE4 = normalizeAB(rE4,E4);
    %     rE5 = normalizeAB(rE5,E5);
    
    %     iRecon = A5 + E1+E2+E3+E4+E5;
    %     rRecon = A5 + rE1+rE2+rE3+rE4+rE5;
    
    E2E1 = E{2}-E{1};
    E3E2 = E{3}-E{2};
    E4E3 = E{4}-E{3};
    E5E4 = E{5}-E{4};
    [rE1,gE1,bE1,yE1] = modifyImColor(E{1});
    [rE2E1,gE2E1,bE2E1,yE2E1] = modifyImColor(E2E1);
    [rE3E2,gE3E2,bE3E2,yE3E2] = modifyImColor(E3E2);
    [rE4E3,gE4E3,bE4E3,yE4E3] = modifyImColor(E4E3);
    [rE5E4,gE5E4,bE5E4,yE5E4] = modifyImColor(E5E4);
    rE2 = rE2E1+rE1;
    rE3 = rE3E2+rE2;
    rE4 = rE4E3+rE3;
    rE5 = rE5E4+rE4;
    rE1 = normalizeAB(rE1,E{1});
    rE2 = normalizeAB(rE2,E{2});
    rE3 = normalizeAB(rE3,E{3});
    rE4 = normalizeAB(rE4,E{4});
    rE5 = normalizeAB(rE5,E{5});
    rE = {rE1, rE2, rE3, rE4, rE5};
    
    
    iRecon  = modifyComponentsWeighted(I,A,E,rE,0);
    rRecon1 = modifyComponentsWeighted(I,A,E,rE,1);
    rRecon2 = modifyComponentsWeighted(I,A,E,rE,2);
    rRecon3 = modifyComponentsWeighted(I,A,E,rE,3);
    rRecon4 = modifyComponentsWeighted(I,A,E,rE,4);
    rRecon5 = modifyComponentsWeighted(I,A,E,rE,5);
    
    %     iRecon  = modifyComponents(A,E,rE,0);
    %     rRecon1 = modifyComponents(A,E,rE,1);
    %     rRecon2 = modifyComponents(A,E,rE,2);
    %     rRecon3 = modifyComponents(A,E,rE,3);
    %     rRecon4 = modifyComponents(A,E,rE,4);
    %     rRecon5 = modifyComponents(A,E,rE,5);
    %     imshow([I rRecon1 rRecon2; rRecon3 rRecon4 rRecon5],'Parent',ax1);
    %     imshow([nA1 nA2 nA3 nA4 nA5; nE1 nE2 nE3 nE4 nE5],'Parent',ax2)
    %     imshow([nA1 nA2 nA3 nA4 nA5; nE1 nE2 nE3 nE4 nE5; rRecon1 rRecon2 rRecon3 rRecon4 rRecon5]);
%     imshow([I A1 A2 A3 A4 A5; I E1 E2 E3 E4 E5; I rE1 rE2 rE3 rE4 rE5; I rRecon1 rRecon2 rRecon3 rRecon4 rRecon5]);
    imshow([I rRecon1 rRecon2 rRecon3 rRecon4 rRecon5]);
    %     imshow([I nA1 nA2 nA3 nA4 nA5; I nE1 nE2 nE3 nE4 nE5; I rRecon1 rRecon2 rRecon3 rRecon4 rRecon5]);
    
    pause
end

function[recon] = modifyComponentsWeighted(I,A,E,rE,idx)
k = 4;
w1e = k.*(rgb2gray(E{1}));
w2e = k.*(rgb2gray(E{2}));
w3e = k.*(rgb2gray(E{3}));
w4e = k.*(rgb2gray(E{4}));
w5e = k.*(rgb2gray(E{5}));
w1a = (I - w1e.*E{1})./A{1};
w2a = (I - w2e.*E{2})./A{2};
w3a = (I - w3e.*E{3})./A{3};
w4a = (I - w4e.*E{4})./A{4};
w5a = (I - w5e.*E{5})./A{5};
switch idx
    case 1
        recon = w1e.*rE{1} + w1a.*A{1};
    case 2
        recon = w1e.*rE{1} + w1a.*(w2e.*rE{2} + w2a.*A{2});
    case 3
        recon = w1e.*rE{1} + w1a.*(w2e.*rE{2} + w2a.*(w3e.*rE{3} + w3a.*A{3}));
    case 4
        recon = w1e.*rE{1} + w1a.*(w2e.*rE{2} + w2a.*(w3e.*rE{3} + w3a.*(w4e.*rE{4} + w4a.*A{4})));
    case 5
        recon = w1e.*rE{1} + w1a.*(w2e.*rE{2} + w2a.*(w3e.*rE{3} + w3a.*(w4e.*rE{4} + w4a.*(w5e.*rE{5} + w5a.*A{5}))));
    otherwise
        recon = E{1}+E{2}+E{3}+E{4}+E{5}+A{5};
end

end


function[A] = normalizeAB(A,B)
mx = double(max(max(B(:,:,1))));
mn = double(min(min(B(:,:,1))));
A(:,:,1) = rescale(A(:,:,1),mn,mx);
% A(:,:,1) = mat2gray(A(:,:,1),[mx mn]);
% A(:,:,1) = (A(:,:,1) - mn)./(mx - mn);

mx = double(max(max(B(:,:,2))));
mn = double(min(min(B(:,:,2))));
A(:,:,2) = rescale(A(:,:,2),mn,mx);
% A(:,:,2) = mat2gray(A(:,:,2),[mx mn]);
% A(:,:,2) = (A(:,:,2) - mn)./(mx - mn);

mx = double(max(max(B(:,:,3))));
mn = double(min(min(B(:,:,3))));
A(:,:,3) = rescale(A(:,:,3),mn,mx);
% A(:,:,3) = mat2gray(A(:,:,3),[mx mn]);
% A(:,:,3) = (A(:,:,3) - mn)./(mx - mn);

end

% Normalize V
function[imN] = normalizeImIntensity(im)
imN = rgb2hsv(im);
mx = double(max(max(im(:,:,3))));
mn = double(min(min(im(:,:,3))));
imN(:,:,3) = (imN(:,:,3) - mn)./(mx - mn);
imN = hsv2rgb(imN);
end

% Normalize H
function[imN_r, imN_g, imN_b, imN_y] = modifyImColor(im)
% imN = rgb2lab(im);
% imN = lab2rgb(imN);
% imN_r = illumColorShift_LAB_masked(im,100,125,0); % <-- RED
% imN_g = illumColorShift_LAB_masked(im,100,-110,0); % <-- GREEN

imGray = rgb2gray(im);
imN_r = cat(3,imGray,zeros(size(imGray)),zeros(size(imGray)));

% imN_r = illumColorShift_LAB_masked(im,0,50,0); % <-- RED
imN_g = illumColorShift_LAB_masked(im,0,-50,0); % <-- GREEN
imN_b = illumColorShift_LAB_masked(im,0,0,-50); % <-- BLUE
imN_y = illumColorShift_LAB_masked(im,0,0,50); % <-- YELLOW
end


function[I] = illumColorShift_LAB_masked(I,Lval,Aval,Bval)
Ilab = rgb2lab(I);
Ilab(:,:,1) = Ilab(:,:,1) + Lval;
Ilab(:,:,2) = Ilab(:,:,2) + Aval;
Ilab(:,:,3) = Ilab(:,:,3) + Bval;
% Ilab = prctNorm(Ilab);
Ilab = LABNorm(Ilab);
I = lab2rgb(Ilab);
end

function[I] = LABNorm(I)
% minVal = min(I(:));
% maxVal = max(I(:));
% I = ((I-minVal)./(maxVal-minVal)).*(255-(-255)) + (-255);
Il=I(:,:,1);
Ia=I(:,:,2);
Ib=I(:,:,3);
% Clip values of saturated pixels
% Il(Il>255) = 100;   Il(Il<-255) = -100;
Il(Il>100) = 100;   Il(Il<-100) = -100;
Ia(Ia>255) = 255;   Ia(Ia<-255) = -255;
Ib(Ib>255) = 255;   Ib(Ib<-255) = -255;
end



