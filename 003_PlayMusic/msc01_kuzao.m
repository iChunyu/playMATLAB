% `Beautiful partner' (maybe it's the name in English)
% (Mei Li Da Dang)

% Sheet music from `https://www.bilibili.com/video/BV1y4411o7EN'

% XiaoCY, updated on 2021-04-30

%%
clear;clc

fs = 44100;             % Sampling frequency (Hz)
Tb = 3;                 % Duration time of eath tone

%%
main = [
    6	0.5
    13	0.5
    6	0.5
    13	0.5
    6	0.5
    120	1.5
    
    6	0.5
    11	0.5
    6	0.5
    11	0.5
    12	0.5
    7	1.5
    
    6	0.5
    11	0.5
    6	0.5
    7	0.5
    11	0.5
    12	0.5
    7	0.5
    11	0.5
    12	0.5
    13	1.5
    15	0.25
    14	0.25
    13	1.5
    
    13	0.5
    16	0.5
    13	0.5
    16	0.5
    13	0.5
    14	1.5
    
    16	0.5
    15	0.5
    12	0.5
    15	0.5
    12	0.5
    13	1.5
    
    15	0.5
    14	0.5
    11	0.5
    14	0.5
    11	0.5
    
    12	0.5
    6	0.5
    12	0.5
    6	0.5
    
    7	0.5
    3	1
    11	0.25
    7	0.25
    6	1.5
    ];

minor = [
    0	0.5
    -16	2
    -17	2
    -14	2
    -13	2
    -14	2
    -15	2
    1	2
    -13	2
    -14	2
    -12	2
    -15	2
    1	2
    -14	2
    -12	2
    -17	2
    -16	1.5
    ];

%%
main_msc = getMusic(main,fs,Tb);
minor_msc = getMusic(minor,fs,Tb);

% sound([main_msc minor_msc], fs)

sound(main_msc,fs)
sound(minor_msc,fs)