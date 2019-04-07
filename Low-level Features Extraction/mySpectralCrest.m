function [specCrest] = mySpectralCrest(xb)


[blockSize, numBlocks] = size(xb);


window    = myHann(blockSize);
specCrest = zeros(1,numBlocks);
upper     = ceil(blockSize / 2) ;

for i = 1 : numBlocks
    
    block = xb(:,i) .* window;
    block = fft(block);
    block = abs(block);
    
    
    specCrest(i) = max(block(1:upper)) / sum(block(1:upper));
end
end