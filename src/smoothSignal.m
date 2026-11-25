function y = smoothSignal(x, cutoff)
%SMOOTHSIGNAL Low-pass filter a signal without phase delay.
%   Y = SMOOTHSIGNAL(X, CUTOFF) filters X with a 20th-order lowpass FIR
%   filter and zero-phase filtering. CUTOFF is the normalized cutoff
%   frequency (0 < CUTOFF < 1).

arguments
    x (:,1) double
    cutoff (1,1) double {mustBePositive, mustBeLessThan(cutoff, 1)} = 0.2
end

d = designfilt("lowpassfir", FilterOrder=20, CutoffFrequency=cutoff);
y = filtfilt(d, x);
end
