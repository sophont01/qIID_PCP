function[iA1, iE1, iA2, iE2, iA3, iE3, iA4, iE4, iA5, iE5] = func_qIID_rpca_v1b(I,k1,k2,k3,k4,k5)
[m,n,~] = size(I);
w = zeros(m*n,1);
x = I(:,:,1); x = x(:);
y = I(:,:,2); y = y(:);
z = I(:,:,3); z = z(:);
qI = quaternion( w, x, y, z );

[A1,E1]       = inexact_alm_qrpca(qI, k1/sqrt(m*n), 1e-7, 1000); 
[A2,E2]       = inexact_alm_qrpca(A1, k2/sqrt(m*n), 1e-7, 1000); 
[A3,E3]       = inexact_alm_qrpca(A2, k3/sqrt(m*n), 1e-7, 1000); 
[A4,E4]       = inexact_alm_qrpca(A3, k4/sqrt(m*n), 1e-7, 1000); 
[A5,E5]       = inexact_alm_qrpca(A4, k5/sqrt(m*n), 1e-7, 1000); 

A1x = reshape(A1.x, [m,n]);     A1y = reshape(A1.y, [m,n]);     A1z = reshape(A1.z, [m,n]);
E1x = reshape(E1.x, [m,n]);     E1y = reshape(E1.y, [m,n]);     E1z = reshape(E1.z, [m,n]);
A2x = reshape(A2.x, [m,n]);     A2y = reshape(A2.y, [m,n]);     A2z = reshape(A2.z, [m,n]);
E2x = reshape(E2.x, [m,n]);     E2y = reshape(E2.y, [m,n]);     E2z = reshape(E2.z, [m,n]);
A3x = reshape(A3.x, [m,n]);     A3y = reshape(A3.y, [m,n]);     A3z = reshape(A3.z, [m,n]);
E3x = reshape(E3.x, [m,n]);     E3y = reshape(E3.y, [m,n]);     E3z = reshape(E3.z, [m,n]);
A4x = reshape(A4.x, [m,n]);     A4y = reshape(A4.y, [m,n]);     A4z = reshape(A4.z, [m,n]);
E4x = reshape(E4.x, [m,n]);     E4y = reshape(E4.y, [m,n]);     E4z = reshape(E4.z, [m,n]);
A5x = reshape(A5.x, [m,n]);     A5y = reshape(A5.y, [m,n]);     A5z = reshape(A5.z, [m,n]);
E5x = reshape(E5.x, [m,n]);     E5y = reshape(E5.y, [m,n]);     E5z = reshape(E5.z, [m,n]);

iA1   = cat(3,A1x,A1y,A1z);
iE1   = cat(3,E1x,E1y,E1z);
iA2   = cat(3,A2x,A2y,A2z);
iE2   = cat(3,E2x,E2y,E2z);
iA3   = cat(3,A3x,A3y,A3z);
iE3   = cat(3,E3x,E3y,E3z);
iA4   = cat(3,A4x,A4y,A4z);
iE4   = cat(3,E4x,E4y,E4z);
iA5   = cat(3,A5x,A5y,A5z);
iE5   = cat(3,E5x,E5y,E5z);

