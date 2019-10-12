clear all; close all; clc;
I = im2double(imread('/media/saurabh/String/WORK/DATASETS/iiw-dataset/data/21571.png'));
sI = im2double(imread('/media/saurabh/String/WORK/RESULTS/BiIID/paperResults/smooth/21571-smooth.png'));
bfI = im2double(imread('/home/saurabh/WORK/CODES/qIID/qIID_PCP/21571_filt_1x.png'));

%% RGB + BilateralFilter + Smooth
[A,E] = func_qIID_rpca_v3c(I,bfI,sI,1.0);
a11 = reshape(A(:,1), size(I,1),size(I,2) );
e11 = reshape(E(:,1), size(I,1),size(I,2) );
mean(a11(:))
mean(e11(:))
ia11 = cat(3,a11.x, a11.y, a11.z);
ie11 = cat(3,e11.x, e11.y, e11.z);

a12 = reshape(A(:,2), size(I,1),size(I,2) );
e12 = reshape(E(:,2), size(I,1),size(I,2) );
mean(a12(:))
mean(e12(:))
ia12 = cat(3,a12.x, a12.y, a12.z);
ie12 = cat(3,e12.x, e12.y, e12.z);

a13 = reshape(A(:,3), size(I,1),size(I,2) );
e13 = reshape(E(:,3), size(I,1),size(I,2) );
mean(a13(:))
mean(e13(:))
ia13 = cat(3,a13.x, a13.y, a13.z);
ie13 = cat(3,e13.x, e13.y, e13.z);

imshow([I ia11 ie11; bfI ia12 ie12; sI ia13 ie13])

%% Residue 
R11 = (I - ia11 -ie11);
R12 = (I - ia12 -ie12);
R13 = (I - ia13 -ie13);

norm(R11(:))
norm(R12(:))
norm(R13(:))

imwrite(ia11,'rgb_bf_smooth_A.png');
system('python /home/saurabh/WORK/CODES/qIID/qIID_PCP/evaluate/whdr.py --linear rgb_bf_smooth_A.png /media/saurabh/String/WORK/DATASETS/iiw-dataset/data/21571.json')