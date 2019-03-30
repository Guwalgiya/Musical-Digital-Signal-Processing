[t1_2, x1_2] = generateSinusoidal(1, 44100, 400, 0.5, pi/2);
plot(t1_2(1 : length(t1_2)/100), x1_2(1 : length(x1_2)/100));
title('Sine Wave & Square Wave for 5ms');
xlabel('time - seconds')
ylabel('Amplitude')
hold on


[t2_2, x2_2] = generateSquare(1, 44100, 400, 0.5, 0);
plot(t2_2(1 : length(t2_2)/100), x2_2(1 : length(x2_2)/100));
legend('sine wave', 'square wave');



[f1, XAbs1, XPhase1, XRe1, XIm1] = computeSpectrum(x1_2, 44100);
[f2, XAbs2, XPhase2, XRe2, XIm2] = computeSpectrum(x2_2, 44100);



figure;
subplot(2, 1, 1);
plot(f1, XAbs1);
title('Sine Wave - Amplitude Spectrum');
xlabel('Frequency - Hz');
ylabel('Amplitude');
axis tight
subplot(2, 1, 2);
plot(f1, XPhase1);
title('Sine Wave - Phase Spectrum');
xlabel('Frequency - Hz');
ylabel('Phase');
axis tight;



figure;
subplot(2, 1, 1);
plot(f2, XAbs2);
title('Square Wave - Amplitude Spectrum');
xlabel('Frequency - Hz');
ylabel('Amplitude');
axis tight
subplot(2, 1, 2);
plot(f2, XPhase2);
title('Square Wave - Phase Spectrum');
xlabel('Frequency - Hz');
ylabel('Phase');
axis tight;



x2_2 = audioread('sax_example.wav');
[freq_vector1,  time_vector1,  magnitude_spectrogram1] = ...
mySpecgram(x2_2,   2048,  1024,  44100,  'rect');
[freq_vector2,  time_vector2,  magnitude_spectrogram2] = ...
mySpecgram(x2_2,   2048,  1024,  44100,  'hann');



figure
subplot(1, 2, 1);
spectrogram(x2_2, rectwin(2048), 1024, 2048, 1e3, 'yaxis');
subplot(1, 2, 2);
spectrogram(x2_2, hann(2048), 1024, 2048, 1e3, 'yaxis');



