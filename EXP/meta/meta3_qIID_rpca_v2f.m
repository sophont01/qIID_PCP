clear all; close all; clc;
I = im2double(imread('/media/saurabh/String/WORK/DATASETS/iiw-dataset/data/21571.png'));
sI = im2double(imread('/media/saurabh/String/WORK/RESULTS/BiIID/paperResults/smooth/21571-smooth.png'));

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

h = fspecial('average',[7 7]);
x = imfilter(I(:,:,1),h,'replicate');
y = imfilter(I(:,:,2),h,'replicate');
z = imfilter(I(:,:,3),h,'replicate');
mI = cat(3,x,y,z);

%% RGB 
[A2,E2] = func_qIID_rpca_v2f2(I,1.5);
a21 = reshape(A2(:,1), size(I,1),size(I,2) );
e21 = reshape(E2(:,1), size(I,1),size(I,2) );
mean(a21(:))
mean(e21(:))
ia21 = cat(3,a21.x, a21.y, a21.z);
ie21 = cat(3,e21.x, e21.y, e21.z);

%% RGB + Smooth
[A3,E3] = func_qIID_rpca_v2f3(I,sI,1.0);
a31 = reshape(A3(:,1), size(I,1),size(I,2) );
e31 = reshape(E3(:,1), size(I,1),size(I,2) );
mean(a31(:))
mean(e31(:))
ia31 = cat(3,a31.x, a31.y, a31.z);
ie31 = cat(3,e31.x, e31.y, e31.z);

a32 = reshape(A3(:,2), size(I,1),size(I,2) );
e32 = reshape(E3(:,2), size(I,1),size(I,2) );
mean(a32(:))
mean(e32(:))
ia32 = cat(3,a32.x, a32.y, a32.z);
ie32 = cat(3,e32.x, e32.y, e32.z);

%% Residue 

% imshow([I ia11 ie11; mI ia12 ie12; I ia21 ie21; I ia31 ie31; sI ia32 ie32])
imshow([I ia11 ie11; I ia21 ie21; I ia31 ie31])

R11 = (I - ia11 -ie11);
R12 = (I - ia12 -ie12);
R21 = (I - ia21 -ie21);
R31 = (I - ia31 -ie31);
R32 = (I - ia32 -ie32);

norm(R11(:))
norm(R12(:))
norm(R21(:))
norm(R31(:))
norm(R32(:))
