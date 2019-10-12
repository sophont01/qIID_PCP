clear all; close all; clc;
I = im2double(imread('/media/saurabh/String/WORK/DATASETS/iiw-dataset/data/21571.png'));
efI = im2double(imread('/media/saurabh/String/WORK/RESULTS/EfrosIID/IIW/21571-r.png'));

%% RGB + EfrosPrior
[A1,E1] = func_qIID_rpca_v2f5(I,efI,1.0);
a1 = reshape(A1(:,1), size(I,1),size(I,2) );
e1 = reshape(E1(:,1), size(I,1),size(I,2) );
mean(a1(:))
mean(e1(:))
ia1 = cat(3,a1.x, a1.y, a1.z);
ie1 = cat(3,e1.x, e1.y, e1.z);

a2 = reshape(A1(:,2), size(I,1),size(I,2) );
e2 = reshape(E1(:,2), size(I,1),size(I,2) );
mean(a2(:))
mean(e2(:))
ia2 = cat(3,a2.x, a2.y, a2.z);
ie2 = cat(3,e2.x, e2.y, e2.z);

%% Residue 
imshow([I ia1 ie1; efI ia2 ie2])

R1 = (I - ia1 -ie1);
R2 = (I - ia2 -ie2);

norm(R1(:))
norm(R2(:))

