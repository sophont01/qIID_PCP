function[A,E] = func_qIID_rpca_v3(I,sI,k)
%% RGB + smooth + mean trial

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
%% Smooth
x = sI(:,:,1);   x = x(:);
y = sI(:,:,2);   y = y(:);
z = sI(:,:,3);   z = z(:);
w = zeros(size(x));
qsI = quaternion(w,x,y,z);
%% RPCA
q = quaternion(w,w,w,w);
q(:,1) = qI;
q(:,2) = qmeanI;
q(:,3) = qsI;
[A,E] = inexact_alm_qrpca(q, k/sqrt(length(q)), 1e-7, 1000);

