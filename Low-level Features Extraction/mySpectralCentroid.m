function [specCentroid] = mySpectralCentroid(xb, fs)

[blockSize, numBlocks] = size(xb);


window       = myHann(blockSize);
specCentroid = zeros(1,numBlocks);
upperBound   = ceil(blockSize / 2);
helpVec      = [1 : upperBound];


for i = 1 : numBlocks
    
    block = xb(:,i) .* window;
    block = fft(block);
    block = abs(block);
    
    %apply the function from text book
    specCentroid(i) = dot(helpVec, block(1 : upperBound))/ sum(block(1 : upperBound));    
end

specCentroid = specCentroid / blockSize * fs;
end