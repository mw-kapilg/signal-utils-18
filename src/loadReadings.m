function t = loadReadings(file)
%LOADREADINGS Read temperature readings and add a Fahrenheit column.
%   T = LOADREADINGS(FILE) reads a CSV file with Time and TempC columns and
%   returns a table with an added TempF column.

arguments
    file (1,1) string {mustBeFile}
end

t = readtable(file);
t.TempF = convertTemperature(t.TempC, "C", "F");
end
