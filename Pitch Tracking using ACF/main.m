%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time = 0;
x1   = [];
while(time < 1)
    signal = sin(2 * pi * 441 * time);
    x1     = [x1; signal];
    time   = time + 1 /44100;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x2   = [];
time = 0;
while(time < 1)
    signal = sin(2 * pi * 882 * time);
    x2     = [x2; signal];
    time   = time + 1 / 44100;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = [x1; x2];
[mySinf0, timeInSec] = myPitchTrackAcf(x, 1024, 512, 44100);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
plot(mySinf0, '*');  %f0 plot
xlabel('block index');
ylabel('f0 - Hz');
title('f0 plot');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n        = ceil(length(x) / 512);
sinf0    = [(zeros(floor(n / 2), 1) + 441);zeros(ceil(n / 2), 1) + 882];
absError = abs(sinf0 - mySinf0);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[pitchMidi] = myFreq2MidiPitch(mySinf0);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Training Set 01 - D
Read_01    = textread('01-D_AMairena.f0.Corrected.txt');
train_01   = Read_01(:, 3);
[x_01, fs] = audioread('01-D_AMairena.wav');
[f0_01, ~] = myPitchTrackAcf(x_01, 1024, 512, fs);
Cent01     = myEvaluation(f0_01, train_01);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Training Set 24 - M1
Read_24    = textread('24-M1_AMairena-Martinete.f0.Corrected.txt');
train_24   = Read_24(:, 3);
[x_24, fs] = audioread('24-M1_AMairena-Martinete.wav');
[f0_24, ~] = myPitchTrackAcf(x_24, 1024, 512, fs);
Cent24     = myEvaluation(f0_24, train_24);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Training Set 63 - M2
Read_63    = textread('63-M2_AMairena.f0.Corrected.txt');
train_63   = Read_63(:, 3);
[x_63, fs] = audioread('63-M2_AMairena.wav');
[f0_63, ~] = myPitchTrackAcf(x_63, 1024, 512, fs);
Cent63     = myEvaluation(f0_63, train_63);
