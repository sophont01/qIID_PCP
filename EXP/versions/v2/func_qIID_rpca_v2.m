function[iA1, iE1, iA2, iE2, iA3, iE3, iA4, iE4, iA5, iE5] = func_qIID_rpca_v2(I,k1,k2,k3,k4,k5)
[m,n,~] = size(I);
w = zeros(m,n);
x = I(:,:,1);% x = x(:);
y = I(:,:,2);% y = y(:);
z = I(:,:,3);% z = z(:);
qI = quaternion( w, x, y, z );

[A1,E1]       = inexact_alm_qrpca(qI, k1/sqrt(length(I)), 1e-7, 1000); 
[A2,E2]       = inexact_alm_qrpca(A1, k2/sqrt(length(I)), 1e-7, 1000); 
[A3,E3]       = inexact_alm_qrpca(A2, k3/sqrt(length(I)), 1e-7, 1000); 
[A4,E4]       = inexact_alm_qrpca(A3, k4/sqrt(length(I)), 1e-7, 1000); 
[A5,E5]       = inexact_alm_qrpca(A4, k5/sqrt(length(I)), 1e-7, 1000); 

% A1x = reshape(A1.x, [m,n]);     A1y = reshape(A1.y, [m,n]);     A1z = reshape(A1.z, [m,n]);
% E1x = reshape(E1.x, [m,n]);     E1y = reshape(E1.y, [m,n]);     E1z = reshape(E1.z, [m,n]);
% A2x = reshape(A2.x, [m,n]);     A2y = reshape(A2.y, [m,n]);     A2z = reshape(A2.z, [m,n]);
% E2x = reshape(E2.x, [m,n]);     E2y = reshape(E2.y, [m,n]);     E2z = reshape(E2.z, [m,n]);
% A3x = reshape(A3.x, [m,n]);     A3y = reshape(A3.y, [m,n]);     A3z = reshape(A3.z, [m,n]);
% E3x = reshape(E3.x, [m,n]);     E3y = reshape(E3.y, [m,n]);     E3z = reshape(E3.z, [m,n]);
% A4x = reshape(A4.x, [m,n]);     A4y = reshape(A4.y, [m,n]);     A4z = reshape(A4.z, [m,n]);
% E4x = reshape(E4.x, [m,n]);     E4y = reshape(E4.y, [m,n]);     E4z = reshape(E4.z, [m,n]);
% A5x = reshape(A5.x, [m,n]);     A5y = reshape(A5.y, [m,n]);     A5z = reshape(A5.z, [m,n]);
% E5x = reshape(E5.x, [m,n]);     E5y = reshape(E5.y, [m,n]);     E5z = reshape(E5.z, [m,n]);

iA1   = cat(3,A1.x,A1.y,A1.z);
iE1   = cat(3,E1.x,E1.y,E1.z);
iA2   = cat(3,A2.x,A2.y,A2.z);
iE2   = cat(3,E2.x,E2.y,E2.z);
iA3   = cat(3,A3.x,A3.y,A3.z);
iE3   = cat(3,E3.x,E3.y,E3.z);
iA4   = cat(3,A4.x,A4.y,A4.z);
iE4   = cat(3,E4.x,E4.y,E4.z);
iA5   = cat(3,A5.x,A5.y,A5.z);
iE5   = cat(3,E5.x,E5.y,E5.z);

