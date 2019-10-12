clear all; close all; clc;
I = im2double(imread('/media/saurabh/String/WORK/DATASETS/iiw-dataset/data/21571.png'));

%% RGB + Mean
[A1,E1] = func_qIID_rpca_v2f(I,1.0);
a11 = reshape(A1(:,1), size(I,1),size(I,2) );
e11 = reshape(E1(:,1), size(I,1),size(I,2) );
mean(a11(:))
mean(e11(:))
ia11 = cat(3,a11.x, a11.y, a11.z);
ie11 = cat(3,e11.x, e11.y, e11.z);

a12 = reshape(A1(:,2), size(I,1),size(I,2) );
e12 = reshape(E1(:,2), size(I,1),size(I,2) );
mean(a12(:))
mean(e12(:))
ia12 = cat(3,a12.x, a12.y, a12.z);
ie12 = cat(3,e12.x, e12.y, e12.z);

%% RGB 
[A2,E2] = func_qIID_rpca_v2f2(I,1.5);
a21 = reshape(A2(:,1), size(I,1),size(I,2) );
e21 = reshape(E2(:,1), size(I,1),size(I,2) );
mean(a21(:))
mean(e21(:))
ia21 = cat(3,a21.x, a21.y, a21.z);
ie21 = cat(3,e21.x, e21.y, e21.z);

imshow([I ia11 ie11; I ia12 ie12; I ia21 ie21])

%% Residue 
R11 = (I - ia11 -ie11);
R12 = (I - ia12 -ie12);
R21 = (I - ia21 -ie21);

norm(R11(:))
norm(R12(:))
norm(R21(:))