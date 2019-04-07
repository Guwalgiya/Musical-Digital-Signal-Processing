function w = myHann(blockSize)
    
    N = blockSize - 1;
    w = zeros(blockSize,1);
    
    
    for n = 1 : blockSize
        w(n) = 0.5*(1 - cos(2*pi*(n-1)/N));
    end
    
end