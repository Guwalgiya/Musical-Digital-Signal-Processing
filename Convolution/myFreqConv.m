% Freqency Domain Convolution
function y = myFreqConv(x,h)
    
    
    a = length(x);
    b = length(h);
    
    
    % Length = a + b - 1
    x = [x; zeros(b - 1, 1)]; 
    h = [h; zeros(a - 1, 1)]; 
    y = ifft(fft(x).*fft(h));
end

    