function [xt,yt] = iRot(x,y,theta)
    theta = theta*pi/180;
    A = [cos(theta) -sin(theta)
        sin(theta) cos(theta)];
    try
        X = [x;y];
    catch
        [row,~] = size(x);
        if row ~= 1
            x = x.';
        end
        [row,~] = size(y);
        if row ~= 1
            y = y.';
        end
        X = [x;y];
    end
    Xt = A*X;
    xt = Xt(1,:);
    yt = Xt(2,:);
end