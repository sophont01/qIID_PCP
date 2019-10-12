function whdr = computeWHDR(imPath,jsonPath)
evalDir = strrep(mfilename('fullpath'), mfilename, '');
whdrPath = fullfile(evalDir,'whdr.py');

cmdStr = ['python ' whdrPath ' --linear ' imPath  ' '  jsonPath];
[~,whdr] = system(cmdStr);
if strfind(whdr,'Traceback')
    whdr = NaN;
else
    whdr = str2num(whdr);
end
end
