% List the map from tone index to its frequency
% Show the relationship between tone index and key number of a piano

% XiaoCY 2021-04-30

%%
% tone index (sort by frequency)
tone = [ -21 -210 -22 -220 -23 -24 -240 -25 -250 -26 -260 -27 ...
    -11 -110 -12 -120 -13 -14 -140 -15 -150 -16 -160 -17 ...
    1   10  2   20  3   4   40  5   50  6   60  7 ...
    11  110 12  120 13  14  140 15  150 16  160 17 ...
    21  210 22  220 23  24  240 25  250 26  260 27 ]';

[ftone,fid] = getFreqs(tone);

clc
fprintf('%6s%6s%13s\n','Tone','Key','Frequency')
for k = 1:length(tone)
    fprintf('%6d%6d%10.2f Hz\n',tone(k),fid(k),ftone(k))
end