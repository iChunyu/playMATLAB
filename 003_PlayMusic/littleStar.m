% Little star

%%
fs = 44100;
Tb = 0.3;

L = [ 1 1 0 0 6 0 5 ...
    4 4 0 0 2 0 1 ...
    0 0 4 4 3 0 2 ...
    0 0 4 4 0 3 2]';

R = [ 0 0 5 5 0 6 5 ...
    0 0 3 3 0 2 1 ...
    5 5 0 0 0 3 2 ...
    5 5 0 0 3 0 2]';

t = ones(size(L));
t([7 14 21 28]) = 2;

mscL = genMusic_C([L t],fs,Tb);
mscR = genMusic_C([R t],fs,Tb);

msc = [mscL mscR];

sound(msc,fs)

audiowrite('.\unGit\littleStar.flac',msc,fs)
