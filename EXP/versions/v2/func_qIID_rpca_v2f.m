function[A1,E1] = func_qIID_rpca_v2f(I,k)
%% RGB + MEAN trial

%% RGB
x = I(:,:,1);   x = x(:);
y = I(:,:,2);   y = y(:);
z = I(:,:,3);   z = z(:);
w = zeros(size(x));
qI = quaternion(w,x,y,z);
%% Mean
h = fspecial('average',[7 7]);
x = imfilter(I(:,:,1),h,'replicate');   x = x(:);
y = imfilter(I(:,:,2),h,'replicate');   y = y(:);
z = imfilter(I(:,:,3),h,'replicate');   z = z(:);
qmeanI = quaternion(w,x,y,z);
%% RPCA
q = quaternion(w,w,w,w);
q(:,1) = qI;
q(:,2) = qmeanI;
[A1,E1] = inexact_alm_qrpca(q, k/sqrt(length(q)), 1e-7, 1000);

