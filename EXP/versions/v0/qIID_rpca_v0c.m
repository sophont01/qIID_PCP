clear all; close all; clc;
addpath(genpath('./EXP'))
addpath(genpath('./tools'))
addpath(genpath('./LIBS'))
addpath(genpath('./Datasets'))
% Ipath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/Datasets/771.png';
Ipath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/Datasets/815.png';
% Ipath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/Datasets/reflection_in.jpg';
I = im2double(imread(Ipath));
[m,n,d] = size(I);
% qI = quaternion( zeros(m,n), I(:,:,1), I(:,:,2), I(:,:,3) );

mrgb = mean(I,3);
w = zeros(m,n); w = w(:);
x = exp(I(:,:,1)-mrgb);   x = x(:);
y = exp(I(:,:,2)-mrgb);   y = y(:);
z = exp(I(:,:,3)-mrgb);   z = z(:);

qI = quaternion( w, x, y, z );

k = 1.5;

[A,E] = inexact_alm_qrpca(qI, k/sqrt(m*n), 1e-7, 1000); 


AAx = reshape(A.x, [m,n]);
AAy = reshape(A.y, [m,n]);
AAz = reshape(A.z, [m,n]);
AA = cat(3,log(AAx)+mrgb,log(AAy)+mrgb,log(AAz)+mrgb);
EEx = reshape(E.x, [m,n]);
EEy = reshape(E.y, [m,n]);
EEz = reshape(E.z, [m,n]);
EE = cat(3,log(EEx)+mrgb,log(EEy)+mrgb,log(EEz)+mrgb);

imshow([I AA EE])

% NORMALIZE OR NOT ?
