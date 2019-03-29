function [freq_vector, time_vector, magnitude_spectrogram] = mySpecgram(x, ...  
block_size, hop_size, sampling_rate_Hz, window_type)

[time_vector, X] = generateBlocks(x, sampling_rate_Hz, block_size, hop_size);
if window_type == 'rect'
    window = ones(block_size, 1);
    
elseif window_type == 'hann'
    window = hann(block_size);
else
    warning('Wrong Type');
end

freq_vector = [];
freq = 0;
a = floor(block_size/2);
for i = 1 : a
    freq_vector = [freq_vector; freq];
    freq = freq + sampling_rate_Hz / block_size;
end

b = zeros(size(X, 1), size(X, 2));
for i = 1:size(X, 2)
    b (:, i) = X(:, i) .* window;
end
b = abs(fft(b));
magnitude_spectrogram = b(1:floor(block_size/2), :);    


figure;
surf(time_vector, freq_vector, magnitude_spectrogram, 'EdgeColor', 'none');
view(0, 90);
xlabel('Time - Seconds');
ylabel('Frequency - Hz');
axis tight
ylabel(colorbar,  'Power/frequency - dB/Hz')

if window_type == 'rect'
    title({'Spectrogram for rectangle'})
end
if window_type == 'hann'
    title({'Spectrogram for hann'})
end

