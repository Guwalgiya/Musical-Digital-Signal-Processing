function [aggregatedFeatureVec] = aggregateFeaturesPerFile(featureValues)

aggregatedFeatureVec = [];
for i = 1 : 5
    
    feature = featureValues(i,:);
    
    aggregatedFeatureVec = [aggregatedFeatureVec; mean(feature); std(feature)];
end