% wav = ADSR(A,D,S,R,wavin,t) adds ADSR window for music wave
%      A --- Attack, express as time ratio
%      D --- Decay, express as time ratio
%      S --- Sustain, express as amplitude ratio
%      R --- Release, express as time ratio

% XiaoCY 2020-01-22

%%
function wav = ADSR(A,D,S,R,wavin,t)
    
    if A+D+R > 1
        error('Error ADSR parameters!')
    end
    
    N = length(t);
    NA = round(N*A);
    ND = round(N*D);
    NR = round(N*R);
    NS = N-NA-ND-NR;
    
    ta = t(1:round(N*A));
    td = t(1:round(N*D));
    tr = t(1:round(N*R));
    
    C1 = 1/(exp(-ta(end))-1);
    C2 = -C1;
    wa = C1*exp(-ta)+C2;
    
    C1 = (1-S)/(1-exp(-td(end)));
    C2 = 1-C1;
    wd = C1*exp(-td)+C2;
    
    C1 = S/(1-exp(-ta(end)));
    C2 = S-C1;
    wr = C1*exp(-tr)+C2;
    
    wav = wavin;
    wav(1:NA) = wav(1:NA).*wa;
    wav(NA+1:NA+ND) = wav(NA+1:NA+ND).*wd;
    wav(NA+ND+1:NA+ND+NS) = S;
    wav(N-NR+1:N) = wav(N-NR+1:N).*wr;
end