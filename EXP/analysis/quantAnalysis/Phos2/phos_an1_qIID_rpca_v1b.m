%% Processing PHOS filteringIID results
clear all; close all; clc;
saveDir = '/media/saurabh/Rythym/WORK/RESULTS/filteringIID/PHOS/';
RdataDir = '/media/saurabh/Rythym/WORK/RESULTS/filteringIID/PHOS/';
IdataDir = '/media/saurabh/Rythym/WORK/DATASETS/PHOS/Phos2_12_1MP/';
sceneDirEnum = {'Phos2_scene1','Phos2_scene2','Phos2_scene3','Phos2_scene4',...
    'Phos2_scene5','Phos2_scene6','Phos2_scene7','Phos2_scene8',...
    'Phos2_scene9','Phos2_scene10','Phos2_scene11','Phos2_scene12',...
    'Phos2_scene13','Phos2_scene14','Phos2_scene15'};
lightTypeEnum = {'nonuni' , 'uni'};
sceneSuffixEnum = {'sc1','sc2','sc3','sc4','sc5','sc6','sc7','sc8','sc9','sc10','sc11','sc12','sc13','sc14','sc15'};

Rsuffix = '-r_colorized';
Ssuffix = '-s_colorized';

for s=1:15
    sceneDir = sceneDirEnum{s};
    sceneSuffix = sceneSuffixEnum{s};
    for j=[1,2]
        lightTypeEnumIdx = j;
        lightType = lightTypeEnum{lightTypeEnumIdx};
        
        if lightTypeEnumIdx == 1
            Ipath{1} = fullfile(IdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '1' '.png']);
            Ipath{2} = fullfile(IdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '2' '.png']);
            Ipath{3} = fullfile(IdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '3' '.png']);
            Ipath{4} = fullfile(IdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '4' '.png']);
            Ipath{5} = fullfile(IdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '5' '.png']);
            Ipath{6} = fullfile(IdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '6' '.png']);
            
            Rpath{1} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '1' Rsuffix '.png']);
            Rpath{2} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '2' Rsuffix '.png']);
            Rpath{3} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '3' Rsuffix '.png']);
            Rpath{4} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '4' Rsuffix '.png']);
            Rpath{5} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '5' Rsuffix '.png']);
            Rpath{6} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '6' Rsuffix '.png']);
            
            Spath{1} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '1' Ssuffix '.png']);
            Spath{2} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '2' Ssuffix '.png']);
            Spath{3} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '3' Ssuffix '.png']);
            Spath{4} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '4' Ssuffix '.png']);
            Spath{5} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '5' Ssuffix '.png']);
            Spath{6} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '6' Ssuffix '.png']);
        else
            Ipath{1} = fullfile(IdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'plus_4' '.png']);
            Ipath{2} = fullfile(IdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'plus_3' '.png']);
            Ipath{3} = fullfile(IdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'plus_2' '.png']);
            Ipath{4} = fullfile(IdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'plus_1' '.png']);
            Ipath{5} = fullfile(IdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '0' '.png']);
            Ipath{6} = fullfile(IdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'minus_1' '.png']);
            Ipath{7} = fullfile(IdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'minus_2' '.png']);
            Ipath{8} = fullfile(IdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'minus_3' '.png']);
            Ipath{9} = fullfile(IdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'minus_4' '.png']);
            
            Rpath{1} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'plus_4' Rsuffix '.png']);
            Rpath{2} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'plus_3' Rsuffix '.png']);
            Rpath{3} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'plus_2' Rsuffix '.png']);
            Rpath{4} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'plus_1' Rsuffix '.png']);
            Rpath{5} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '0' Rsuffix '.png']);
            Rpath{6} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'minus_1' Rsuffix '.png']);
            Rpath{7} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'minus_2' Rsuffix '.png']);
            Rpath{8} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'minus_3' Rsuffix '.png']);
            Rpath{9} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'minus_4' Rsuffix '.png']);
            
            Spath{1} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'plus_4' Ssuffix '.png']);
            Spath{2} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'plus_3' Ssuffix '.png']);
            Spath{3} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'plus_2' Ssuffix '.png']);
            Spath{4} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'plus_1' Ssuffix '.png']);
            Spath{5} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' '0' Ssuffix '.png']);
            Spath{6} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'minus_1' Ssuffix '.png']);
            Spath{7} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'minus_2' Ssuffix '.png']);
            Spath{8} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'minus_3' Ssuffix '.png']);
            Spath{9} = fullfile(RdataDir, sceneDir, ['Phos2_' lightType '_' sceneSuffix '_' 'minus_4' Ssuffix '.png']);
        end
        
        for i=1:numel(Ipath)
            I{i} = im2double(imread(Ipath{i}));
            R{i} = im2double(imread(Rpath{i}));
            S{i} = im2double(imread(Spath{i}));
        end
%         %% 
%         sumR = zeros(size(R{1}));
%         for i=1:numel(R)
%             sumR = sumR + R{i};
%         end
%         meanR = sumR/numel(R);
%         
%         savePath = fullfile(saveDir, sceneDir, 'quat', mfilename);
%         if ~exist(savePath,'dir')
%             mkdir(savePath);
%         end
%         
%         savePath = fullfile(savePath, ['Phos2_' lightType '_' sceneSuffix '_meanR.png']);
%         imwrite(meanR, savePath);
        %%
        sumS = zeros(size(S{1}));
        for i=1:numel(S)
            sumS = sumS + S{i};
        end
        meanS = sumS/numel(S);
        
        savePath = fullfile(saveDir, sceneDir, 'quat', mfilename);
        if ~exist(savePath,'dir')
            mkdir(savePath);
        end
        
        savePath = fullfile(savePath, ['Phos2_' lightType '_' sceneSuffix '_meanS.png']);
        imwrite(meanS, savePath);
        
        
        fprintf('%s\n',savePath);
    end
end
