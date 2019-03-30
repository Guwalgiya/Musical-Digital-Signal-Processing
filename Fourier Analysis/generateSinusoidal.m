function [t,x] = generateSinusoidal(amplitude,...
sampling_rate_Hz,frequency_Hz,length_secs, phase_radians)


interval = 1 / sampling_rate_Hz;
time     = 0;
rad      = 2 * pi * frequency_Hz;
x        = [];
t        = [];


while(time < length_secs)
    signal = amplitude * sin(rad * time + phase_radians);
    

    x    = [x; signal];
    t    = [t; time];
    time = time + interval;
end
end
