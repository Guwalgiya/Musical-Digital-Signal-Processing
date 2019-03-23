function [errCentRms] = myEvaluation(estimation, annotation)

%% Evaluates the performance of a pitch tracker
% Input:
%   estimation: (numBlocks x 1) float vector, estimated pitch (Hz) per block   
%   annotation: (numBlocks x 1) float vector, annotated pitch (Hz) per block
% Output:
%   errCentRms: float, rms of the difference between estInMidi and annInMidi 
% Note: 
%   1) please exclude the blocks when ann(i) == 0

[m1,n1] = size(estimation);
if (n1>1)
    error('illegal estimation vector ');
end
[m2,n2] = size(annotation);
if (n2>1)
    error('illegal annotation vector');
end
if (m1~=m2)
   error('size of estimation and annotation do not match'); 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n   = 0;
sum = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1 :length(estimation)
    if (annotation(i) ~= 0)
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        midiE = myFreq2MidiPitch(estimation(i));
        midiA = myFreq2MidiPitch(annotation(i));
        sum   = sum + (midiE - midiA)^2;
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        n = n + 1; % so far, n data points are not zero in annotation
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
errCentRms = sqrt(sum / n) * 100;

end