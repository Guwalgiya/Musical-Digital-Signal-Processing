function [f0] = myGetF0FromAcf(acfVector, fs)

%% Computes the pitch for a block of audio from the ACF vector
% Input:
%   acfVector:  (blockSize x 1) float vector, ACF of a block
%   fs:         float, sampling rate in Hz
% Output:
%   f0:         float, fundamental frequency of the block in Hz  

% check input dimensions
[~, n] = size(acfVector);
if (n>1)
    error('illegal input acfVector');
end
[m,n] = size(fs);
if (m ~= 1 && n ~=1)
    error('illegal fs');
end



difVector = diff(acfVector);



i           = 2;
secondHighT = 0;
secondHighA = log(0);



while i < length(difVector)
    
    
    if ( (difVector(i-1) > 0) && (difVector(i) < 0) && (acfVector(i) > secondHighA) )
        
        
        
        secondHighT = i;
        secondHighA = acfVector(i);
        
        
        
        i = i + 2; %ignore the next pair
    
    else
        
        i = i + 1;
    end
end


f0 = fs / (secondHighT - 1); %T0 = (secondHighT - 1) / fs;
end
