function[A1,E1] = func_qIID_rpca_v2d(I,k)

x = I(:,:,1);   x = x(:);
y = I(:,:,2);   y = y(:);
z = I(:,:,3);   z = z(:);
w = zeros(size(x));
qI = quaternion(w,x,y,z);

hsvI = rgb2hsv(I);
x = hsvI(:,:,1); x = x(:);
y = hsvI(:,:,2); y = y(:);
z = hsvI(:,:,3); z = z(:);
qhsvI = quaternion(w,x,y,z);

% lab = rgb2lab(I);
% x = lab(:,:,1); x = x(:);
% y = lab(:,:,2); y = y(:);
% z = lab(:,:,3); z = z(:);
% qlab = quaternion(w,x,y,z);

q = quaternion(w,w,w,w);

q(:,1) = qI;
q(:,2) = qhsvI;
% q(:,3) = qlab;

[A1,E1] = inexact_alm_qrpca(q, k/sqrt(length(q)), 1e-7, 1000);