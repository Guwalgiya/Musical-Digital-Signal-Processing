function [zcr] = myZCR(xb)

xb                     = sign(xb);
[blockSize, numBlocks] = size(xb);
zcr                    = zeros(1,blockSize);


for i = 1 : numBlocks
    diffSeq = diff([0;xb(:,i)]);
    zcr(i) = sum(abs(diffSeq))/(2 * blockSize);
end