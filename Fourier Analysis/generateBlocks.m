function [t, X] = generateBlocks(x, sample_rate_Hz, block_size, hop_size)
a = length(x) - block_size; 
b = mod(a, hop_size); 
indexBlock = (a - b) / hop_size + 2;
x = [x;zeros(hop_size - b , 1)];
X = zeros(block_size,indexBlock);
for i = 1 : indexBlock
    c = (i - 1) * hop_size;
    X(:,i) = x(c + 1 : c + block_size);
end

t = zeros(indexBlock,1);
time = 0;
for i = 1 : indexBlock
    time = time + hop_size / sample_rate_Hz;
    t(i) = time;
end
end
    
    