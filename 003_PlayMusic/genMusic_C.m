% msc = genMusic(rythm,fs,Tb) generates music in C with given rythm
%     rythm --- consists of index of tone and beat in tow columns
%        fs --- sampling frequency, default: 44100 Hz
%        Tb --- time of one beat, default: 1 s

% XiaoCY 2020-01-17

%%
function msc = genMusic_C(varargin)
    switch nargin
        case 1
            rythm = varargin{1};
            fs = 44100;
            Tb = 1;
        case 2
            rythm = varargin{1};
            fs = varargin{2};
            Tb = 1;
        case 3
            rythm = varargin{1};
            fs = varargin{2};
            Tb = varargin{3};
        otherwise
            error('Invalid input')
    end
    
    [N,~] = size(rythm);
    msc0 = cell(1,N);
    f = 440*2.^(((1:88)-49)/12)';
    
    for k = 1:N
        tidx = rythm(k,1);  % tone index
        t = 0:1/fs:rythm(k,2)*Tb;
        
        
        if tidx == 0
            msc0{k} = t*0;
            continue
        end
        
        up = 0;
        if mod(tidx,10) == 0
            up = 1;
            tidx = fix(tidx/10);
        end
        
        n = fix(tidx/10);
        tone = abs(tidx-10*n);
        switch tone
            case 1
                fidx = 12*n+up+40;
            case 2
                fidx = 12*n+up+42;
            case 3
                fidx = 12*n+44;
            case 4
                fidx = 12*n+up+45;
            case 5
                fidx = 12*n+up+47;
            case 6
                fidx = 12*n+up+49;
            case 7
                fidx = 12*n+51;
            otherwise
                error('Invalid rythm')
        end
        
        win = 1-t/t(end);
        msc0{k} = simPiano(f(fidx),t,win);
    end
    
    msc = reshape([msc0{:}],[],1);
end

function y = simPiano(f,t,win)
    y = (sin(f*2*pi*t) + ...
        0.0600*sin(f*4*pi*t) + ...
        0.0237*sin(f*6*pi*t) + ...
        0.0163*sin(f*8*pi*t) + ...
        0.0142*sin(f*10*pi*t) + ...
        0.0025*sin(f*12*pi*t) + ...
        0.0080*sin(f*14*pi*t) + ...
        0.0028*sin(f*16*pi*t) +...
        0.0060*sin(f*18*pi*t) ).*win;
end