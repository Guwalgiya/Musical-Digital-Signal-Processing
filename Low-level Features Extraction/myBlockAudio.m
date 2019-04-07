function [xb, timeInSec] = myBlockAudio(x, blockSize, hopSize, fs)

blockNumbers = ceil(length(x) / hopSize);
pad          = blockNumbers * blockSize - n;
x            = [x;zeros(pad,1)];


xb        = zeros(blockSize, blockNumbers);
timeInSec = zeros(blockNumbers, 1);
for i = 1 : blockNumbers
    
     position     = (i - 1) * hopSize;
     timeInSec(i) = (i - 1) * hopSize / fs;
     xb(:,i)      = x(position + 1 : position + blockSize);
     
end
end