function [normFeatureMatrix] = zscoreNormalize(featureMatrix)

[featureNum, songNum] = size(featureMatrix);


normFeatureMatrix = zeros(featureNum, songNum);
for i = 1 : featureNum
    
    
    miu = mean(featureMatrix(i,:));
    sd  = std(featureMatrix(i,:));
    
    
    normFeatureMatrix(i,:) = (featureMatrix(i,:) - miu) / sd;

end
end
