function [featureMatrix] = getMetaData(path, blockSize, hopSize)

cd(path)

files         = dir();
featureMatrix = [];

for i = 3 : length(files)
    
    [x, fs] = audioread(files(i).name);
    
    cd ..
    
    songFeatureMatrix = extractFeatures(x,blockSize, hopSize, fs);
    aggFeatureMat     = aggregateFeaturesPerFile(songFeatureMatrix);
    featureMatrix     = [featureMatrix, aggFeatureMat];
    cd(path);

end
cd ..
end