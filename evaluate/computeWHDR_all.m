function whdrMetric = computeWHDR_all(resDir,resType)
jsonDir = '/media/saurabh/String/WORK/DATASETS/iiw-dataset/data/';
jsonListPath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/evaluate/sorted_test_ids_NARIHIRA_jsons.txt';
whdrPath = '/home/saurabh/WORK/CODES/qIID/qIID_PCP/evaluate/whdr.py';
% if ~exist(resType, 'var') || isempty(resType)
%     resType = 'R';
% end
if nargin==1
    resType = 'R';
end


fid = fopen(jsonListPath);
tline = fgetl(fid);
whdrMetric = {}; n =1;
global reverseMSG; reverseMSG = '';
while ischar(tline)
    C = strsplit(tline,'/');
    CC = strsplit(C{end},'.');
    jsonNum = CC{1};
    uprintf(sprintf('%s',jsonNum));
    resPath = fullfile(resDir, [jsonNum '_' resType '.png']);
    
    jsonPath = fullfile(jsonDir, [jsonNum '.json']);
    cmdStr = ['python ' whdrPath ' --linear ' resPath  ' '  jsonPath];
    [~,whdr] = system(cmdStr);
    if strfind(whdr,'Traceback')
        whdr=NaN;
    else
        whdr=str2num(whdr);
    end
    whdrMetric{n,1} = str2num(jsonNum);
    whdrMetric{n,2} = whdr;
    n=n+1;
    tline = fgetl(fid);
end

fclose(fid);
end
