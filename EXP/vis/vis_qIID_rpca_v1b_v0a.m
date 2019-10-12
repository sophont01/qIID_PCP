close all; clear all; clc;
idx_Nsplit
Rpath = '/media/saurabh/String/WORK/RESULTS/qIID/qIID_rpca/meta_qIID_rpca_v1b/results/';
Ipath = '/media/saurabh/String/WORK/DATASETS/iiw-dataset/data/';
SDir = '/media/saurabh/String/WORK/RESULTS/qIID/qIID_rpca/meta_qIID_rpca_v1b/collated_Es/';
warning off
% r1 = figure; ax1 = gca;
% r2 = figure; ax2 = gca;
fprintf('\n ----------------- \n ');
for i=1:numel(Nsplit)
%     Inum = num2str(Nsplit(x_m2(i)));
    Inum = num2str(Nsplit(i));
    uprintf(sprintf('i=%s\n',Inum));
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
     
% %     imshow([A1 A2 A3 A4 A5; E1 E2 E3 E4 E5],'Parent',ax1);
%     imshow([A1 A2 A3 A4 A5; E1 E2-E1 E3-E2 E4-E3 E5-E4],'Parent',ax1);
% %     imshow([A1 A2-A1 A3-A2 A4-A3 A5-A4; E1 E2-E1 E3-E2 E4-E3 E5-E4]);
%     title(sprintf('%d-%d \t %s.png',i,numel(Nsplit),Inum));
%     imshow(I,'Parent',ax2); truesize(r2);
    I_ = padarray(I,[5,5],1,'both');
    E1_ = padarray(E1,[5,5],1,'both');
    E2E1_ = padarray(E2-E1,[5,5],1,'both');
    E3E2_ = padarray(E3-E2,[5,5],1,'both');
    E4E3_ = padarray(E4-E3,[5,5],1,'both');
    E5E4_ = padarray(E5-E4,[5,5],1,'both');
    
    SPath = fullfile(SDir,[Inum '.png']);
    imwrite([I_ E1_ E2E1_; E3E2_ E4E3_ E5E4_],SPath);
    
%     pause
end

function[imN] = normalizeIm(im)
imN = rgb2hsv(im);
mx = double(max(max(im(:,:,3))));
mn = double(min(min(im(:,:,3))));
imN(:,:,3) = (imN(:,:,3) - mn)./(mx - mn);
imN = hsv2rgb(imN);

end