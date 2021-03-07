% Castle in the Sky

clear;clc

fs = 44100;
Tb = 0.5;

%%
rythm = [
    6	0.5
    7	0.5
    11	1.5
    7	0.5
    11	1
    13	1
    7	3
    3	1
    6	1.5
    5	0.5
    6	1
    11	1
    5	3
    3	1
    4	1.5
    3	0.5
    4	1
    11	1
    3	3
    11	0.5
    11	0.5
    7	1.5
    40	0.5
    40	1
    7	1
    7	3
    6	0.5
    7	0.5
    11	1.5
    7	0.5
    11	1
    13	1
    7	3
    3	1
    6	1.5
    5	0.5
    6	1
    11	1
    5	3
    3	1
    4	1
    11	0.5
    7	1.5
    11	1
    12	1
    13	0.5
    11	2
    11	0.5
    7	0.5
    6	1
    7	1
    50	1
    6	3
    11	0.5
    12	0.5
    13	1.5
    12	0.5
    13	1
    15	1
    12	3
    5	0.5
    5	0.5
    11	1.5
    7	0.5
    11	1
    13	1
    13	4
    6	0.5
    7	0.5
    11	1
    7	0.5
    11	0.5
    12	1
    11	1.5
    5	0.5
    5	2
    14	1
    13	1
    12	1
    11	1
    13	3
    13	1
    16	1.5
    16	0.5
    15	1.5
    15	0.5
    13	0.5
    12	0.5
    11	2
    11	1
    12	1.5
    11	0.5
    12	1
    15	1
    13	3
    13	1
    16	1.5
    16	0.5
    15	1.5
    15	0.5
    13	0.5
    12	0.5
    11	2
    11	1
    12	1.5
    11	0.5
    12	1
    7	1
    6	3
    6	0.5
    7	0.5
    11	1.5
    7	0.5
    11	1
    13	1
    7	3
    3	1
    6	1.5
    5	0.5
    6	1
    11	1
    5	3
    3	1
    4	1
    11	0.5
    7	1.5
    11	1
    12	1
    13	0.5
    11	2.5
    11	0.5
    7	0.5
    6	1
    7	1
    50	1
    6	4
    ];

%%
msc = genMusic_C(rythm,fs,Tb);
sound(msc,fs)