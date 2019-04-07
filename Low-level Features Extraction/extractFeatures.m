function [featureVect] = extractFeatures(x, blockSize, hopSize, fs)

[xb, ~]          = myBlockAudio(x, blockSize, hopSize, fs);
spectralCentroid = mySpectralCentroid(xb, fs);


rms = myRMS(xb);
ZCR = myZCR(xb);


specCrest    = mySpectralCrest(xb);
spectralFlux = mySpectralFlux(xb);
featureVect  = [spectralCentroid; rms; ZCR; specCrest; spectralFlux];



end