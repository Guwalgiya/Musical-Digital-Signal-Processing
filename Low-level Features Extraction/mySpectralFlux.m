function [specFlux] = mySpectralFlux(xb)

[blockSize, numBlocks] = size(xb);


window = myHann(blockSize);
for i = 1 : numBlocks
    xb(:,i) = xb(:,i) .* window;
    xb(:,i) = fft(xb(:,i));
end
xb = abs(xb);


difference = (diff([xb(:,1),xb],1,2)).^2;
specFlux   = zeros(1,numBlocks);
upper      = ceil(blockSize / 2) ;


window = myHann(blockSize);
for i = 1:numBlocks
    block = difference(:,i);
    specFlux(i) = sqrt(sum(block(1:upper))) / (blockSize / 2);
end
end