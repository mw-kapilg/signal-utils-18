classdef tLoadReadings < matlab.unittest.TestCase
    % Tests for loadReadings.

    properties
        DataFile
    end

    methods (TestClassSetup)
        function locateData(testCase)
            testCase.DataFile = fullfile(fileparts(mfilename("fullpath")), ...
                "data", "Readings.csv");
        end
    end

    methods (Test)
        function addsFahrenheit(testCase)
            t = loadReadings(testCase.DataFile);
            testCase.verifyEqual(t.TempF, [32; 212; 98.6], "AbsTol", 1e-10);
        end

        function keepsOriginalColumns(testCase)
            t = loadReadings(testCase.DataFile);
            testCase.verifyEqual(t.Properties.VariableNames, {'Time', 'TempC', 'TempF'});
        end
    end
end
