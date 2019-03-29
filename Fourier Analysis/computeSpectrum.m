function [f,XAbs,XPhase,XRe,XIm] = computeSpectrum(x, sample_rate_Hz) 
Y = fft(x);
n = length(x);
f = [];
ftemp = 0;
XAbs = [];
XRe = [];
XIm = [];
XPhase = unwrap(angle(Y));
XPhase = XPhase(1 : floor(n/2));
for i = 1 : floor(n/2)
    b = imag(Y(i));
    a = real(Y(i));
    XRe = [XRe; a];
    XIm = [XIm; b];
    XAbs = [XAbs; sqrt(a^2 + b^2)];
    ftemp = ftemp + sample_rate_Hz / n;
    f = [f; ftemp];
end
end
    