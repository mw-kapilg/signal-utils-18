classdef tSmoothSignal < matlab.unittest.TestCase
    % Tests for smoothSignal.

    methods (Test)
        function constantSignalUnchanged(testCase)
            y = smoothSignal(ones(100,1));
            testCase.verifyEqual(y, ones(100,1), "AbsTol", 1e-6);
        end

        function removesHighFrequency(testCase)
            n = (0:199)';
            x = sin(2*pi*0.02*n) + 0.5*sin(2*pi*0.4*n);
            y = smoothSignal(x, 0.2);
            interior = 31:170;  % skip filter edge effects
            testCase.verifyLessThan(max(abs(y(interior) - sin(2*pi*0.02*n(interior)))), 0.05);
        end
    end
end
