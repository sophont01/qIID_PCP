function[A1,E1] = func_qIID_rpca_v2c(I,k)
% function[iA1, iE1, iA2, iE2, iA3, iE3, iA4, iE4, iA5, iE5] = func_qIID_rpca_v2b(I,k,p)
[Rx,Ry] = imgradientxy(I(:,:,1));
[Gx,Gy] = imgradientxy(I(:,:,2));
[Bx,By] = imgradientxy(I(:,:,3));

x = I(:,:,1);   x = x(:);
y = I(:,:,2);   y = y(:);
z = I(:,:,3);   z = z(:);
w = zeros(size(x));
qI = quaternion(w,x,y,z);
x = 10*abs(Rx(:));
y = 10*abs(Gx(:));
z = 10*abs(Bx(:));
qIx = quaternion(w,x,y,z);
x = 10*abs(Ry(:));
y = 10*abs(Gy(:));
z = 10*abs(By(:));
qIy = quaternion(w,x,y,z);

w = zeros(size(x));
q = quaternion(w,w,w,w);
clear Rx Ry Bx By Gx Gy w x y z

q(:,1) = qI;
q(:,2) = qIx;
q(:,3) = qIy;

[A1,E1] = inexact_alm_qrpca(q, k/sqrt(length(q)), 1e-7, 1000);

% a1 = reshape(A1(1,:), size(I,1), size(I,2));
% a2 = reshape(A1(2,:), size(I,1), size(I,2));
% a3 = reshape(A1(3,:), size(I,1), size(I,2));
% a4 = reshape(A1(4,:), size(I,1), size(I,2));
% a5 = reshape(A1(5,:), size(I,1), size(I,2));
% a6 = reshape(A1(6,:), size(I,1), size(I,2));
% a7 = reshape(A1(7,:), size(I,1), size(I,2));
% e1 = reshape(E1(1,:), size(I,1), size(I,2));
% e2 = reshape(E1(2,:), size(I,1), size(I,2));
% e3 = reshape(E1(3,:), size(I,1), size(I,2));
% e4 = reshape(E1(4,:), size(I,1), size(I,2));
% e5 = reshape(E1(5,:), size(I,1), size(I,2));
% e6 = reshape(E1(6,:), size(I,1), size(I,2));
% e7 = reshape(E1(7,:), size(I,1), size(I,2));
% 
% ia1 = cat(3,a1.x,a1.y,a1.z);
% ia2 = cat(3,a2.x,a2.y,a2.z);
% ia3 = cat(3,a3.x,a3.y,a3.z);
% ia4 = cat(3,a4.x,a4.y,a4.z);
% ia5 = cat(3,a5.x,a5.y,a5.z);
% ia6 = cat(3,a6.x,a6.y,a6.z);
% ia7 = cat(3,a7.x,a7.y,a7.z);
% 
% ie1 = cat(3,e1.x,e1.y,e1.z);
% ie2 = cat(3,e2.x,e2.y,e2.z);
% ie3 = cat(3,e3.x,e3.y,e3.z);
% ie4 = cat(3,e4.x,e4.y,e4.z);
% ie5 = cat(3,e5.x,e5.y,e5.z);
% ie6 = cat(3,e6.x,e6.y,e6.z);
% ie7 = cat(3,e7.x,e7.y,e7.z);
% 
% imshow([ia1 ia2 ia3 ia4 ia5 ia6 ia7; ie1 ie2 ie3 ie4 ie5 ie6 ie7])

%%
% mA1 = mean(A1,1);
% rA1 = reshape(mA1,size(I,1),size(I,2));
% mE1 = mean(E1,1);
% rE1 = reshape(mE1,size(I,1),size(I,2));


