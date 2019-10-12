function[A1,E1] = func_qIID_rpca_v2f4(sI,k)
%% Smooth trial

%% RGB
% x = I(:,:,1);   x = x(:);
% y = I(:,:,2);   y = y(:);
% z = I(:,:,3);   z = z(:);
% w = zeros(size(x));
% qI = quaternion(w,x,y,z);
%% Smooth
x = sI(:,:,1);   x = x(:);
y = sI(:,:,2);   y = y(:);
z = sI(:,:,3);   z = z(:);
w = zeros(size(x));
qsI = quaternion(w,x,y,z);
%% RPCA
q = quaternion(w,w,w,w);
q(:,1) = qsI;
[A1,E1] = inexact_alm_qrpca(q, k/sqrt(length(q)), 1e-7, 1000);

