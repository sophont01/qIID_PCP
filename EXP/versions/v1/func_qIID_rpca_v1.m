function[iA, iE, iAA, iAE, iEA, iEE] = func_qIID_rpca_v1(I,k1,k2,k3)
[m,n,~] = size(I);
w = zeros(m*n,1);
x = I(:,:,1); x = x(:);
y = I(:,:,2); y = y(:);
z = I(:,:,3); z = z(:);
qI = quaternion( w, x, y, z );

[A,E]   = inexact_alm_qrpca(qI, k1/sqrt(m*n), 1e-7, 1000); 
[AA,AE] = inexact_alm_qrpca(A,  k2/sqrt(m*n), 1e-7, 1000); 
[EA,EE] = inexact_alm_qrpca(E,  k3/sqrt(m*n), 1e-7, 1000); 

Ax = reshape(A.x, [m,n]);     Ay = reshape(A.y, [m,n]);     Az = reshape(A.z, [m,n]);
Ex = reshape(E.x, [m,n]);     Ey = reshape(E.y, [m,n]);     Ez = reshape(E.z, [m,n]);
AAx = reshape(AA.x, [m,n]);   AAy = reshape(AA.y, [m,n]);   AAz = reshape(AA.z, [m,n]);
AEx = reshape(AE.x, [m,n]);   AEy = reshape(AE.y, [m,n]);   AEz = reshape(AE.z, [m,n]);
EAx = reshape(EA.x, [m,n]);   EAy = reshape(EA.y, [m,n]);   EAz = reshape(EA.z, [m,n]);
EEx = reshape(EE.x, [m,n]);   EEy = reshape(EE.y, [m,n]);   EEz = reshape(EE.z, [m,n]);

iA = cat(3,Ax,Ay,Az);
iE = cat(3,Ex,Ey,Ez);
iAA = cat(3,AAx,AAy,AAz);
iAE = cat(3,AEx,AEy,AEz);
iEA = cat(3,EAx,EAy,EAz);
iEE = cat(3,EEx,EEy,EEz);
 

