clear all; close all; clc;
addpath(genpath('./EXP'))
addpath(genpath('./tools'))
addpath(genpath('./LIBS'))
% Ipath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/Datasets/771.png';
Ipath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/Datasets/815.png';
% Ipath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/Datasets/9831.png';
% Ipath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/Datasets/reflection_in.jpg';
I = im2double(imread(Ipath));
[m,n,d] = size(I);
% qI = quaternion( zeros(m,n), I(:,:,1), I(:,:,2), I(:,:,3) );
w = zeros(m*n,1);
x = I(:,:,1); x = x(:);
y = I(:,:,2); y = y(:);
z = I(:,:,3); z = z(:);
qI = quaternion( w, x, y, z );

k = 1.4;

[A,E] = inexact_alm_qrpca(qI, k/sqrt(m*n), 1e-7, 1000); 
[AA,AE] = inexact_alm_qrpca(A, k/sqrt(m*n), 1e-7, 1000); 
[EA,EE] = inexact_alm_qrpca(E, k/sqrt(m*n), 1e-7, 1000); 

% AAx = reshape(A.x, [m,n]);
% AAy = reshape(A.y, [m,n]);
% AAz = reshape(A.z, [m,n]);
% AA = cat(3,AAx,AAy,AAz);
% EEx = reshape(E.x, [m,n]);
% EEy = reshape(E.y, [m,n]);
% EEz = reshape(E.z, [m,n]);
% EE = cat(3,EEx,EEy,EEz);

% imshow([I AA EE])

Ax = reshape(A.x, [m,n]);     Ay = reshape(A.y, [m,n]);     Az = reshape(A.z, [m,n]);
Ex = reshape(E.x, [m,n]);     Ey = reshape(E.y, [m,n]);     Ez = reshape(E.z, [m,n]);
AAx = reshape(AA.x, [m,n]);   AAy = reshape(AA.y, [m,n]);   AAz = reshape(AA.z, [m,n]);
AEx = reshape(AE.x, [m,n]);   AEy = reshape(AE.y, [m,n]);   AEz = reshape(AE.z, [m,n]);
EAx = reshape(EA.x, [m,n]);   EAy = reshape(EA.y, [m,n]);   EAz = reshape(EA.z, [m,n]);
EEx = reshape(EE.x, [m,n]);   EEy = reshape(EE.y, [m,n]);   EEz = reshape(EE.z, [m,n]);
