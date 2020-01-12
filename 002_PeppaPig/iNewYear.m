function H = iNewYear(h,n)
    h.delete;
    switch n
        case 1
            theta = linspace(0,2*pi,1e2);
            x = cos(theta)*10+9.122;
            y = sin(theta)*2+6;
            H = plot(x,y,'Color',[255 39 140]/255,'LineWidth',3);
        case 2
            theta = linspace(0,2*pi,1e2);
            x = cos(theta)*10+9.122;
            y = sin(theta)*4+6;
            H = plot(x,y,'Color',[255 39 140]/255,'LineWidth',3);
        case 3
            theta = linspace(0,2*pi,1e2);
            x = cos(theta)*7+9.122;
            y = sin(theta)*6+6;
            H = plot(x,y,'Color',[255 39 140]/255,'LineWidth',3);
        case 4
            theta = linspace(0,2*pi,1e2);
            x = cos(theta)*10+9.122;
            y = sin(theta)*4+6;
            H = plot(x,y,'Color',[255 39 140]/255,'LineWidth',3);
        otherwise
            theta = linspace(195,372,1e2);
            x = cos(theta*pi/180)*25.047/2+9.122;
            y = sin(theta*pi/180)*17.11/2+7.397;
            H = plot(x,y,'Color',[255 39 140]/255,'LineWidth',3);
    end
end