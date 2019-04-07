function rms = myRMS(xb)

xb                     = xb.^2;
[blockSize, numBlocks] = size(xb);


rms = zeros(1,numBlocks);
for i = 1 : numBlocks
    rms(i) = sqrt(sum(xb(:,i))/blockSize);
end
end