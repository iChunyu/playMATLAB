function varargout = iPeppa()
    % 绘制小猪佩奇，并可以输出嘴的图形句柄
    % h = iPeppa()
    nargoutchk(0,1);
    
    %%
    figure
    axis equal
    axis([-70,110,-90,90])
    hold on
    axis off
    
    %% Hand
    x1 = [-23.69 -48 -42 -49 -42 -42];
    y1 = [-23.10 -48 -42 -42 -42 -49];
    x2 = [24.85 48 42 49 42 42];
    y2 = [-25.55 -48 -42 -42 -42 -49];
    plot(x1,y1,'Color',[255 176 227]/255,'Linewidth',5)
    plot(x2,y2,'Color',[255 176 227]/255,'Linewidth',5)
    
    %% Tail
    theta = linspace(0,2*pi,1e2);
    x = 3.5*cos(theta)-46;
    y = 3.5*sin(theta)-57;
    plot(x,y,'Color',[255 176 227]/255,'LineWidth',5)
    x2 = [-38.08 -47.35 -57];
    y2 = [-62.6 -60.23 -57];
    plot(x2,y2,'Color',[255 176 227]/255,'LineWidth',5)
    
    %% Feet
    theta = linspace(0,2*pi,1e2);
    x = 5*cos(theta);
    y = 2*sin(theta);
    
    plot([-20.1 -20.1],[-69.41 -81.55],'Color',[255 176 227]/255,'LineWidth',5)
    plot([11.5 11.5],[-69.41 -81.55],'Color',[255 176 227]/255,'LineWidth',5)
    fill(x-16,y-82,'k')
    fill(x+16,y-82,'k')
    
    %% Clothing
    x = [linspace(16.57,40),-40,linspace(-40,-16.25)];
    y = -0.03*abs(x).^2.1;
    fill(x,y,[252 66 87]/255,...
        'EdgeColor',[252 2 50]/255,'LineWidth',3)
    
    %% Head
    HeadX = [34.84, 13.06];
    HeadY = [56.80, 54.86];
    
    theta = linspace(75,180,1e2);
    x = cos(theta*pi/180)*86.899/2;
    y = sin(theta*pi/180)*68.755/2;
    [x,y] = iRot(x,y,16.993);
    tx = HeadX(end)-x(1);
    ty = HeadY(end)-y(1);
    x = x+tx;
    y = y+ty;
    HeadX = [HeadX, x];
    HeadY = [HeadY, y];
    
    theta = linspace(186,390,1e2);
    x = cos(theta*pi/180)*60.855/2;
    y = sin(theta*pi/180)*48.39/2;
    tx = HeadX(end)-x(1);
    ty = HeadY(end)-y(1);
    x = x+tx;
    y = y+ty;
    HeadX = [HeadX, x];
    HeadY = [HeadY, y];
    
    HeadX = [HeadX, 45.82];
    HeadY = [HeadY, 33.16];
    fill(HeadX,HeadY,[255 167 227]/255,...
        'EdgeColor',[250 132 192]/255,'LineWidth',3)
    
    theta = linspace(0,2*pi,1e2);
    x = cos(theta)*16.091/2;
    y = sin(theta)*18.802/2;
    [x,y] = iRot(x,y,20);
    x = x-16.305;
    y = y+17.625;
    fill(x,y,[250 132 192]/255,...
        'EdgeColor',[250 132 192]/255,'LineWidth',0.5)
    
    %% Nose
    theta = linspace(0,360,3e2);
    x1 = cos(theta*pi/180)*17.993/2;
    y1 = sin(theta*pi/180)*26.599/2;
    [x1,y1] = iRot(x1,y1,32);
    x1 = x1+38.973;
    y1 = y1+44.564;
    
    x2 = cos(theta*pi/180)*4.057/2+35.446;
    y2 = sin(theta*pi/180)*4.057/2+44.417;
    
    x3 = cos(theta*pi/180)*4.057/2+41.928;
    y3 = sin(theta*pi/180)*4.057/2+45.711;
    
    fill(x1,y1,[255 167 227]/255,...
        'EdgeColor',[250 132 192]/255,'LineWidth',3)
    fill(x2,y2,[232 89 168]/255,...
        'EdgeColor',[232 89 168]/255,'LineWidth',0.5)
    fill(x3,y3,[232 89 168]/255,...
        'EdgeColor',[232 89 168]/255,'LineWidth',0.5)
    
    %% Ear
    theta = linspace(-50,245,2e2);
    x1 = cos(theta*pi/180)*12.355/2;
    y1 = sin(theta*pi/180)*18.745/2;
    [x1,y1] = iRot(x1,y1,30);
    x1 = x1-20.734;
    y1 = y1+49.19;
    
    theta = linspace(-60,248,3e2);
    x2 = cos(theta*pi/180)*11.533/2;
    y2 = sin(theta*pi/180)*16.867/2;
    [x2,y2] = iRot(x2,y2,15.871);
    x2 = x2-4.441;
    y2 = y2+58.46;
    
    fill(x1,y1,[255 167 227]/255,...
        'EdgeColor',[250 132 192]/255,'LineWidth',3)
    fill(x2,y2,[255 167 227]/255,...
        'EdgeColor',[250 132 192]/255,'LineWidth',3)
    
    %% Eye
    theta = linspace(0,2*pi,3e2);
    x1 = cos(theta)*11.157/2-1.111;
    y1 = sin(theta)*11.157/2+39.096;
    x2 = cos(theta)*11.157/2+14.08;
    y2 = sin(theta)*11.157/2+45.218;
    fill(x1,y1,'w',...
        'EdgeColor',[250 132 192]/255,'LineWidth',3)
    fill(x2,y2,'w',...
        'EdgeColor',[250 132 192]/255,'LineWidth',3)
    
    x3 = cos(theta)*3.704/2-2.522;
    y3 = sin(theta)*3.704/2+38.611;
    x4 = cos(theta)*3.704/2+12.912;
    y4 = sin(theta)*3.704/2+44.608;
    fill(x3,y3,'k',...
        'EdgeColor','k','LineWidth',0.5)
    fill(x4,y4,'k',...
        'EdgeColor','k','LineWidth',0.5)
    
    %% Mouse
    theta = linspace(195,372,1e2);
    x = cos(theta*pi/180)*25.047/2+9.122;
    y = sin(theta*pi/180)*17.11/2+7.397;
    h = plot(x,y,'Color',[255 39 140]/255,'LineWidth',3);
    
    %%
    if nargout == 1
        varargout{1} = h;
    end
end