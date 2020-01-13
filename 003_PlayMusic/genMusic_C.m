% msc = genMusic(rythm,fs,Tb) generates music in C with given rythm
%     rythm --- consists of index of tone and beat in tow columns
%        fs --- sampling frequency, default: 44100 Hz
%        Tb --- time of one beat, default: 1 s

% XiaoCY 2020-01-12

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
    
    for k = 1:N
        t = 0:1/fs:rythm(k,2)*Tb;
        win = 1-t/t(end);
        
        switch rythm(k,1)
            case 0
                msc0{k} = t*0;
                
            case {1 2 3 4 5 6 7}
                fidx = rythm(k,1);
                f = [261.6256  293.6648  329.6276  349.2282  391.9954  440.0000  493.8833];
                msc0{k} = simPiano(f(fidx),t,win);
                
            case {11 12 13 14 15 16 17}
                fidx = rythm(k,1)-10;
                f = [523.2500  587.3300  659.2600  698.4600  783.9900  880.0000  987.7700];
                msc0{k} = simPiano(f(fidx),t,win);
                
            case {21 22 23 24 25 26 27}
                fidx = rythm(k,1)-20;
                f = [1.0465    1.1747    1.3185    1.3969    1.5680    1.7600    1.9755]*1e3;
                msc0{k} = simPiano(f(fidx),t,win);
                
            case {-11 -12 -13 -14 -15 -16 -17}
                fidx = abs(rythm(k,1)+10);
                f = [130.8100  146.8300  164.8100  174.6100  196.0000  220.0000  246.9400];
                msc0{k} = simPiano(f(fidx),t,win);
                
            case {-21 -22 -23 -24 -25 -26 -27}
                fidx = abs(rythm(k,1)+20);
                f = [65.4060   73.4160   82.4070   87.3070   97.9990  110.0000  123.4700];
                msc0{k} = simPiano(f(fidx),t,win);
                
            otherwise
                msc0{k} = [];
        end
    end
    
    msc = reshape([msc0{:}],[],1);
end

function y = simPiano(f,t,win)
    y = (sin(f*2*pi*t) + ...
        0.1000*sin(f*4*pi*t) + ...
        0.0631*sin(f*6*pi*t) + ...
        0.0447*sin(f*8*pi*t) + ...
        0.0398*sin(f*10*pi*t) + ...
        0.0178*sin(f*12*pi*t) + ...
        0.0178*sin(f*16*pi*t) ).*win;
end