clear all; close all; clc;
I = im2double(imread('/media/saurabh/String/WORK/DATASETS/iiw-dataset/data/21571.png'));
sI = im2double(imread('/media/saurabh/String/WORK/RESULTS/BiIID/paperResults/smooth/21571-smooth.png'));

%% RGB + BilateralFilter + Smooth
[A,E] = func_qIID_rpca_v3d(I,sI,1.0);
a11 = reshape(A(:,1), size(I,1),size(I,2) );
e11 = reshape(E(:,1), size(I,1),size(I,2) );
mean(a11(:))
mean(e11(:))
ia11 = cat(3,a11.x, a11.y, a11.z);
ie11 = cat(3,e11.x, e11.y, e11.z);

imshow([I ia11 ie11])

%% Residue 
R11 = (I - ia11 - ie11);
norm(R11(:))

imwrite(ia11,'rgb_smooth_2x_A.png');
system('python /home/saurabh/WORK/CODES/qIID/qIID_PCP/evaluate/whdr.py --linear rgb_smooth_2x_A.png /media/saurabh/String/WORK/DATASETS/iiw-dataset/data/21571.json')