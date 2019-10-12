function[A,E] = func_qIID_rpca_v3d(I,sI,k)
%% RGB + smooth x 5 trial

%% RGB
x = I(:,:,1);   x = x(:);
y = I(:,:,2);   y = y(:);
z = I(:,:,3);   z = z(:);
w = zeros(size(x));
qI = quaternion(w,x,y,z);

%% Smooth
x = sI(:,:,1);   x = x(:);
y = sI(:,:,2);   y = y(:);
z = sI(:,:,3);   z = z(:);
w = zeros(size(x));
qsI = quaternion(w,x,y,z);
%% RPCA
q = quaternion(w,w,w,w);
q(:,1) = qI;
q(:,2) = qsI;
q(:,3) = qsI;
q(:,4) = qsI;
q(:,5) = qsI;
q(:,6) = qsI;

[A,E] = inexact_alm_qrpca(q, k/sqrt(length(q)), 1e-7, 1000);

