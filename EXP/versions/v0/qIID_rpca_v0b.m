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
% w = zeros(m*n,1);
r = repmat([1:size(I,1)]', [1 size(I,2)]);
c = repmat([1:size(I,2)], [size(I,1) 1]);
w = r+c;
w = w(:);
x = I(:,:,1); x = x(:);
y = I(:,:,2); y = y(:);
z = I(:,:,3); z = z(:);
qI = quaternion( w, x, y, z );

k = 1.3;

[A,E] = inexact_alm_qrpca(qI, k/sqrt(m*n), 1e-7, 1000); 


AAx = reshape(A.x, [m,n]);
AAy = reshape(A.y, [m,n]);
AAz = reshape(A.z, [m,n]);
AA = cat(3,AAx,AAy,AAz);
EEx = reshape(E.x, [m,n]);
EEy = reshape(E.y, [m,n]);
EEz = reshape(E.z, [m,n]);
EE = cat(3,EEx,EEy,EEz);

imshow([I AA EE])

% NORMALIZE OR NOT ?
