clear all; close all; clc;
addpath(genpath('./tools'))
addpath(genpath('./evaluate'))
addpath(genpath('./LIBS'))
addpath(genpath('./EXP'))
Ipath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/Datasets/771.png';
% Ipath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/Datasets/815.png';
% Ipath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/Datasets/9831.png';
I = im2double(imread(Ipath));

k1 = 1.6;
k2 = 1.4; 
k3 = 1.2;
[iA, iE, iAA, iAE, iEA, iEE] = func_qIID_rpca_v1(I,k1,k2,k3);
imshow([iA iE; iAA iAE; iEA iEE])