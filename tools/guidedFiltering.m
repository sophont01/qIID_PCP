function guidedFiltering(Ipath,Gpath,Rpath)
fPath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/tools/filter_reflectance.py';
cmdStr = ['python ', fPath, ' --filter_type=bilateral --sigma_spatial=22 --sigma_color=20 --filename_in=', ...
    Ipath, ' --guidance_in=', Gpath, ' --path_out=', Rpath];
[status,cmdout] = system(cmdStr);
end