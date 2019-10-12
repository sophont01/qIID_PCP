function[AA,EE] = func_qIID_rpca_v0(I,k)
[m,n,d] = size(I);
w = zeros(m*n,1);
x = I(:,:,1); x = x(:);
y = I(:,:,2); y = y(:);
z = I(:,:,3); z = z(:);
qI = quaternion( w, x, y, z );

[A,E] = inexact_alm_qrpca(qI, k/sqrt(m*n), 1e-7, 1000); 

AAx = reshape(A.x, [m,n]);
AAy = reshape(A.y, [m,n]);
AAz = reshape(A.z, [m,n]);
AA = cat(3,AAx,AAy,AAz);
EEx = reshape(E.x, [m,n]);
EEy = reshape(E.y, [m,n]);
EEz = reshape(E.z, [m,n]);
EE = cat(3,EEx,EEy,EEz);


