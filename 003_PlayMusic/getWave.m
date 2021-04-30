% wv = getWave(f,fs,T) calculates wave form of given frequency and duration
%     f --- frequency (Hz)
%    fs --- sampling frequency (Hz)
%     T --- duriation (s)
%    wv --- wave of the note

% ATTENTION: Timbre is tuned in this function.

% XiaoCY 2021-04-30

%%
function wv = getWave(f,fs,T)
    t = (0:1/fs:T)';
    
    % Piano, See https://dsp.stackexchange.com/questions/46598
    % Ref: answer given by Vinkelman
    wv = sin(2*pi*f*t).*exp(-0.0004*2*pi*f*t);
    wv = wv +  sin(2*2*pi*f*t).*exp(-0.0004*2*pi*f*t)/2;
    wv = wv +  sin(3*2*pi*f*t).*exp(-0.0004*2*pi*f*t)/4;
    wv = wv +  sin(4*2*pi*f*t).*exp(-0.0004*2*pi*f*t)/8;
    wv = wv +  sin(5*2*pi*f*t).*exp(-0.0004*2*pi*f*t)/16;
    wv = wv +  sin(6*2*pi*f*t).*exp(-0.0004*2*pi*f*t);
    wv = wv +  wv.^3;
    wv = wv.*(1 + 16*t.*exp(-6*t));
end