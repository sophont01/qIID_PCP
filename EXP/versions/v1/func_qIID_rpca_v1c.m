function[iA1, iE1, iA2, iE2, iA3, iE3, iA4, iE4, iA5, iE5, iA6, iE6, iA7, iE7] = func_qIID_rpca_v1c(I,k1,k2,k3,k4,k5,k6,k7)
[m,n,~] = size(I);
w = zeros(m*n,1);
x = I(:,:,1); x = x(:);
y = I(:,:,2); y = y(:);
z = I(:,:,3); z = z(:);
qI = quaternion( w, x, y, z );

[A1,E1] = inexact_alm_qrpca(qI, k1/sqrt(m*n), 1e-7, 1000);    fprintf('..1');
[A2,E2] = inexact_alm_qrpca(A1, k2/sqrt(m*n), 1e-7, 1000);    fprintf('..2');
[A3,E3] = inexact_alm_qrpca(A2, k3/sqrt(m*n), 1e-7, 1000);    fprintf('..3');
[A4,E4] = inexact_alm_qrpca(A3, k4/sqrt(m*n), 1e-7, 1000);    fprintf('..4');
[A5,E5] = inexact_alm_qrpca(A4, k5/sqrt(m*n), 1e-7, 1000);    fprintf('..5');
[A6,E6] = inexact_alm_qrpca(A5, k6/sqrt(m*n), 1e-7, 1000);    fprintf('..6');
[A7,E7] = inexact_alm_qrpca(A6, k7/sqrt(m*n), 1e-7, 1000);    fprintf('..7');

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
A6x = reshape(A6.x, [m,n]);     A6y = reshape(A6.y, [m,n]);     A6z = reshape(A6.z, [m,n]);
E6x = reshape(E6.x, [m,n]);     E6y = reshape(E6.y, [m,n]);     E6z = reshape(E6.z, [m,n]);
A7x = reshape(A7.x, [m,n]);     A7y = reshape(A7.y, [m,n]);     A7z = reshape(A7.z, [m,n]);
E7x = reshape(E7.x, [m,n]);     E7y = reshape(E7.y, [m,n]);     E7z = reshape(E7.z, [m,n]);

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
iA6   = cat(3,A6x,A6y,A6z);
iE6   = cat(3,E6x,E6y,E6z);
iA7   = cat(3,A7x,A7y,A7z);
iE7   = cat(3,E7x,E7y,E7z);

