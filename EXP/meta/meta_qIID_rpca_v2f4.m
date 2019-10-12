clear all; close all; clc;
I = im2double(imread('/media/saurabh/String/WORK/DATASETS/iiw-dataset/data/21571.png'));
sI = im2double(imread('/media/saurabh/String/WORK/RESULTS/BiIID/paperResults/smooth/21571-smooth.png'));

%% Smooth
[A4,E4] = func_qIID_rpca_v2f4(sI,1.5);
a41 = reshape(A4(:,1), size(I,1),size(I,2) );
e41 = reshape(E4(:,1), size(I,1),size(I,2) );
mean(a41(:))
mean(e41(:))
ia41 = cat(3,a41.x, a41.y, a41.z);
ie41 = cat(3,e41.x, e41.y, e41.z);

%% Residue 
imshow([I sI ia41 ie41])

R41 = (I - ia41 -ie41);
norm(R41(:))

