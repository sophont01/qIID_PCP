I = im2double(imread('/media/saurabh/String/WORK/DATASETS/iiw-dataset/data/21571.png'));
[A1,E1] = func_qIID_rpca_v2c(I,1.5);
a1 = reshape(A1(:,1), size(I,1),size(I,2) );
e1 = reshape(E1(:,1), size(I,1),size(I,2) );
mean(a1(:))
mean(e1(:))
ia1=cat(3,a1.x, a1.y, a1.z);
ie1=cat(3,e1.x, e1.y, e1.z);

a1x = reshape(A1(:,2), size(I,1),size(I,2) );
e1x = reshape(E1(:,2), size(I,1),size(I,2) );
mean(a1x(:))
mean(e1x(:))
ia1x=cat(3,a1x.x, a1x.y, a1x.z);
ie1x=cat(3,e1x.x, e1x.y, e1x.z);

a1y = reshape(A1(:,3), size(I,1),size(I,2) );
e1y = reshape(E1(:,3), size(I,1),size(I,2) );
mean(a1y(:))
mean(e1y(:))
ia1y=cat(3,a1y.x, a1y.y, a1y.z);
ie1y=cat(3,e1y.x, e1y.y, e1y.z);



imshow([I ia1 ie1; I ia1x ie1x; I ia1y ie1y])