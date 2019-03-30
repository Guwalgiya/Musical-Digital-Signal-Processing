function [t, x] = generateSquare(amplitude, ...
    sampling_rate_Hz, frequency_Hz, length_secs, phase_radians)


[t, x] = generateSinusoidal(amplitude, ...
    sampling_rate_Hz, frequency_Hz, length_secs, phase_radians);


for i = 3 : 2 : 19
    [t, xtemp] = generateSinusoidal(amplitude, ...
    sampling_rate_Hz, frequency_Hz * i, length_secs, phase_radians);
    

    xtemp = xtemp / i;
    x     = x + xtemp;
end 
end