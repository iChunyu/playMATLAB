% [ftone, fid] = tone2freqs(tone) calculates frequency of the given tone index
%   tone --- tone index given below
%          tone = 1~7 represents do,re,mi...xi;
%          tone = n0 ...(ends with 0) means rising tone of n;
%          tone = (+-)mn ...(double digit) means m-th higher(+) or lower(-) n;
%   ftone --- frequency of the given tone index
%         Frequencies are calculated by the following equation:
%             f(k) = 440 * 2^( (k-49)/12 ) , k = 1:88
%   fid --- frequency index (key number of a 88-key piano)

% XiaoCY 2021-04-30

%%
function varargout = tone2freqs(tone)
    
    K = length(tone);
    ftone = nan(K,1);
    fid = nan(K,1);
    f = 440*2.^(((1:88)-49)/12)';
    
    for k = 1:K
        tidx = tone(k);                 % tone index

        if tidx == 0
            ftone(k) = 0;
            continue
        end
        
        up = 0;                         % raise up half tone or not
        if mod(tidx,10) == 0
            up = 1;
            tidx = fix(tidx/10);
        end
        
        m = fix(tidx/10);
        tidx = abs(tidx-10*m);
        switch tidx
            case 1
                fidx = 12*m+up+40;
            case 2
                fidx = 12*m+up+42;
            case 3
                fidx = 12*m+44;
            case 4
                fidx = 12*m+up+45;
            case 5
                fidx = 12*m+up+47;
            case 6
                fidx = 12*m+up+49;
            case 7
                fidx = 12*m+51;
            otherwise
                error('Invalid rythm')
        end
        
        ftone(k) = f(fidx);
        fid(k) = fidx;
    end
    
    varargout{1} = ftone;
    varargout{2} = fid;
end