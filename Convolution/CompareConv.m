% Compare convolution methods
function [m,mabs,stdev,time] = CompareConv(x, h)
    
    
    time = [0; 0; 0];
    
    
    tic
    y1      = conv(x, h);
    time(1) = toc;
    
    
    tic
    y2      = myTimeConv(x, h);
    time(2) = toc;
    
    
    tic
    y3 = myFreqConv(x,h);
    time(3) = toc;
    
    
    m = [0;0];
    m(1) = mean(y1 - y2);
    m(2) = mean(y1 - y3);
    
    
    mabs = [0;0];
    mabs(1) = mean(abs(y1 - y2));
    mabs(2) = mean(abs(y1 - y3));
    
    
    stdev = [0;0];
    stdev(1) = std(y1 - y2);
    stdev(2) = std(y1 - y3);
    
    
    