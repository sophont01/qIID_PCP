idx_Nsplit
Rpath = '/media/saurabh/String/WORK/RESULTS/qIID/qIID_rpca/meta1_qIID_rpca_v1a/nofilt';
Rpath1 = '/media/saurabh/String/WORK/RESULTS/qIID/qIID_rpca/meta1_qIID_rpca_v1a/iAAA_1x';
Rpath2 = '/media/saurabh/String/WORK/RESULTS/qIID/qIID_rpca/meta1_qIID_rpca_v1a/iAAA_2x';
Rpath3 = '/media/saurabh/String/WORK/RESULTS/qIID/qIID_rpca/meta1_qIID_rpca_v1a/iAAA_3x';
load('/media/saurabh/String/WORK/RESULTS/qIID/qIID_rpca/meta1_qIID_rpca_v1a/WHDR_qIID_rpca_v1a.mat');
for i=1:numel(Nsplit)
    iA = imread(fullfile(Rpath, [num2str(Nsplit(i)) '_iA.png'] ));
    iE = imread(fullfile(Rpath, [num2str(Nsplit(i)) '_iE.png'] ));
    iAA = imread(fullfile(Rpath, [num2str(Nsplit(i)) '_iAA.png'] ));
    iAE = imread(fullfile(Rpath, [num2str(Nsplit(i)) '_iAE.png'] ));
    iAAA = imread(fullfile(Rpath, [num2str(Nsplit(i)) '_iAAA.png'] ));
    iAAE = imread(fullfile(Rpath, [num2str(Nsplit(i)) '_iAAE.png'] ));
    
    iAAA_1x = imread(fullfile(Rpath1, [num2str(Nsplit(i)) '_iAAA.png']));
    iAAA_2x = imread(fullfile(Rpath2, [num2str(Nsplit(i)) '_iAAA.png']));
    iAAA_3x = imread(fullfile(Rpath3, [num2str(Nsplit(i)) '_iAAA.png']));
    
    imshow([iE iAE iAAE; iA iAA iAAA; iAAA_1x iAAA_2x iAAA_3x])
    title(sprintf('whdr=%0.4f %0.4f %0.4f <%0.4f %0.4f %0.4f>',whdr.iA(i), whdr.iAA(i), whdr.iAAA(i), whdr.iAAA_1x(i), whdr.iAAA_2x(i), whdr.iAAA_3x(i) ));
    pause
end