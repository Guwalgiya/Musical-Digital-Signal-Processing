%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part 1. Time Domain Convoulution
x  = ones(200,1);
h1 = linspace(0,1,26);
h2 = linspace(1,0,26);
h  = [h1, h2(2 : end)];
h  = h.';
y1 = myTimeConv(x, h);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure()
plot(y1);
title('Time Domain COnvolution Result');
xlabel('n - Time');
ylabel('x*h[n] - Convolution Value');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part 2. Frequency Domain Convolution
y2 = myFreqConv(x,h);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure()
plot(y2);
title('Frequency Domain Convolution Result');
xlabel('n - Time');
ylabel('x*h[n] - Convolution Value');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part 3. Compare with Matlab Implementation
% 1. CompareConv
% 2. 
[x3, ~] = audioread('piano.wav');
[h3, ~] = audioread('impulse-response.wav');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m, mabs, stdev, time] = CompareConv(x3, h3);



