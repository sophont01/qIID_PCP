function[A1,E1] = func_qIID_rpca_v2f5(I,efI,k)
%% RGB + efros trial

%% RGB
x = I(:,:,1);   x = x(:);
y = I(:,:,2);   y = y(:);
z = I(:,:,3);   z = z(:);
w = zeros(size(x));
qI = quaternion(w,x,y,z);
%% EfrosPrior
x = efI(:,:,1);   x = x(:);
y = efI(:,:,2);   y = y(:);
z = efI(:,:,3);   z = z(:);
w = zeros(size(x));
qefI = quaternion(w,x,y,z);
%% RPCA
q = quaternion(w,w,w,w);
q(:,1) = qI;
q(:,2) = qefI;
[A1,E1] = inexact_alm_qrpca(q, k/sqrt(length(q)), 1e-7, 1000);

