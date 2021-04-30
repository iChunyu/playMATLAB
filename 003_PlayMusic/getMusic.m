% msc = genMusic(rythm,fs,Tb) generates music in C with given rythm
%     rythm --- consists of index of tone and beat in tow columns
%     fs --- sampling frequency, default: 44100 Hz
%     Tb --- time of one beat, default: 3 s

% Superposition wave instead of joint together

% XiaoCY 2021-04-30

%%
function msc = getMusic(varargin)
    switch nargin
        case 1
            rhythm = varargin{1};
            fs = 44100;
            Tb = 3;
        case 2
            rhythm = varargin{1};
            fs = varargin{2};
            Tb = 3;
        case 3
            rhythm = varargin{1};
            fs = varargin{2};
            Tb = varargin{3};
        otherwise
            error('Invalid input')
    end
    
    tone = rhythm(:,1);
    dT = rhythm(:,2);
    Tk = cumsum([dT(1:end-1);Tb]);
    
    N = round(Tk(end)*fs);
    msc = zeros(N,1);
    msc_index = [1; round(Tk(1:end-1)*fs)];
    
    for k = 1:length(tone)
        ftone = getFreqs(tone(k));
        wv = getWave(ftone,fs,Tb);
        wvlen = length(wv);
        
        idx = msc_index(k);
        msc(idx:idx+wvlen-1) = msc(idx:idx+wvlen-1)+wv;
    end
end