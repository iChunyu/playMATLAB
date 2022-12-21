% 本脚本是给魏老师 2022 年的圣诞节礼物
%   内容：绘制 3D 圣诞树、树顶星星、装饰带和灯泡、随机生成雪花
%   注意：本脚本使用了随机数，每次运行结果都不完全一致
%   修改：基本的参数设置在第一节，屏幕分辨率不同可能需要修改字号、线宽等参数
%
% =================================================
% 最重要的：祝魏老师圣诞快乐！
% =================================================
%
% XiaoCY 2022-12-21

%% 参数设置
clear;clc

axLim = [-1 1 -1 1 0 2.5];                  % 坐标区限制
nPoint = 50;                                % 计算点数（分辨率）
nCircle = 1;                                % 动画旋转圈数
Ts = 1/50;                                  % 采样时间（帧率）
bgColor = [0.28, 0.35, 0.44];               % 背景颜色

% 祝福语
textContent = '祝魏老师圣诞快乐！';            % 内容  
textFontSize = 20;                          % 字号
textLocation = {0, 0, 2.4};                 % 位置（使用 cell 数组方便展开）
textColor = [1.0000  0.7373  0.1961];       % 颜色

% 圣诞树
treeHeight = 2;                             % 圣诞树高度
treeRadius = 0.7;                           % 树底标称半径
treeRadiusStd = 0.03;                       % 半径变动标准差
treeColor = [0, 0.79, 0.65];                % 树体颜色

% 装饰带
bandCircle = 2.5;                           % 装饰带缠多少圈
bandWidth = 5;                              % 线宽
bandColor = [                               % 两个装饰带的颜色
    0.9804  0.4980  0.4353
    0.5098  0.6902  0.8235];

% 灯泡
bulbStart = 1/5;                            % 灯泡从装饰带什么位置开始
bulbNumber = 10;                            % 灯泡数量
bulbSize = 12;                              % 灯泡大小
bulbBlink = 20;                             % 闪烁速率（数值越大速度越慢）
bulbColor = [                               % 灯光颜色（循环）
    1    , 1    , 1
    0.98 , 0.97 , 0.44
    1    , 0.83 , 0.42
    1    , 0.68 , 0.53
    1    , 0.58 , 0.71
    1    , 0.55 , 0.88
    0.74 , 0.58 , 1];

% 多角星内外角的半径和厚度
starCorner = 5;                             % 多角星外角数
starRadius = [0.15 1/2];                    % 外径，内外径之比
starThick = 0.1;                            % 多角星厚度
starHeight = 2.1;                           % 悬挂高度
starColor = spcolor('yellow');              % 颜色

% 雪花
snowShape = '*';                            % 形状
snowSize = 10;                              % 大小
snowColor = [1, 1, 1];                      % 颜色 
snowProbFrame = 0.1;                        % 每帧新出现雪花的概率
snowProbLoc = 1e-3;                         % 雪花出现在某个位置的概率
snowRate = 2;                               % 雪花下落速率（数值越大速度越慢）
snowWalk = 0.01;                            % 雪花随机游走标准差

% 视角
viewAngle = [90 15];                        % 初始视角（经度和纬度）
dvAngle = [1 0];                            % 每一帧视角变化幅度（经度和纬度）
vzLim = [10 30];                            % 视角纬度约束

% 是否生成 GIF
filename = 'MerryXmas.gif';                 % 文件名非空时生成 GIF 文件

%% 绘制圣诞树
% 生成圆锥形基本树体
rTree = linspace(0,treeRadius,nPoint);
[xTree, yTree, zTree] = cylinder(rTree,nPoint-1);

% 添加随机数产生毛刺
xTree = xTree + rand(nPoint)*treeRadiusStd;
yTree = yTree + rand(nPoint)*treeRadiusStd;
zTree = -zTree*treeHeight + treeHeight + rand(nPoint)*treeRadiusStd;

% 修复曲面使之封闭
xTree(:,end) = xTree(:,1);
yTree(:,end) = yTree(:,1);
zTree(:,end) = zTree(:,1);

figure('Color',bgColor)
Tree = surf(xTree,yTree,zTree,'FaceColor',treeColor,'EdgeColor','none',...
    'DiffuseStrength',0.6,'SpecularStrength',0.03);
light(gca,'Position',[0 0.5 0.87])
hold on
axis equal off

text(textLocation{:},textContent,'FontSize',textFontSize,'Color',textColor,...
    'HorizontalAlignment','center','Interpreter','tex')

%% 树腰装饰带和灯泡
% 构造螺旋线当作装饰带
t = linspace(0,2*pi*bandCircle,nPoint*bandCircle);
r = linspace(0,treeRadius+treeRadiusStd,nPoint*bandCircle);
x = cos(t).*r;
y = sin(t).*r;
z = linspace(treeHeight,0,nPoint*bandCircle);
Band(1) = plot3(x,y,z,'LineWidth',bandWidth,'Color',bandColor(1,:));
Band(2) = plot3(-x,y,z,'LineWidth',bandWidth,'Color',bandColor(2,:));

% 随机生成螺旋线的索引，为灯泡悬挂点
idxRange = round(length(t)*[bulbStart, 1]);
idx = unique(randi(idxRange,bulbNumber,1));
bulbColorNum = size(bulbColor,1);
bulbColorIdx1 = 1;
bulbColorIdx2 = bulbColorNum - bulbColorIdx1 + 1;
Bulb(1) = plot3(x(idx),y(idx),z(idx),'LineStyle','none',...
    'marker','o','MarkerSize',bulbSize,...
    'MarkerFaceColor',bulbColor(bulbColorIdx1,:),'MarkerEdgeColor','none');
idx = unique(randi(idxRange,bulbNumber,1));
Bulb(2) = plot3(-x(idx),y(idx),z(idx),'LineStyle','none',...
    'marker','o','MarkerSize',bulbSize,...
    'MarkerFaceColor',bulbColor(bulbColorIdx2,:),'MarkerEdgeColor','none');

%% 树顶立体多角星
% 计算多角星基础形状（可以使用 `figure, plot(y0,z0), axis equal` 确认）
theta = linspace(0,2*pi,2*starCorner+1);
y0 = sin(theta)*starRadius(1);
z0 = cos(theta)*starRadius(1);
y0(2:2:end) = y0(2:2:end)*starRadius(2);
z0(2:2:end) = z0(2:2:end)*starRadius(2);

yStar = [y0; y0];
zStar = [z0; z0] + starHeight;
xStar = yStar*0 + [starThick; -starThick]/2;

Star(1) = patch(xStar(1,:),yStar(1,:),zStar(1,:),starColor,'EdgeColor','none',...
    'DiffuseStrength',0.9,'SpecularStrength',0.1);
Star(2) = patch(xStar(2,:),yStar(2,:),zStar(2,:),starColor,'EdgeColor','none',...
    'DiffuseStrength',0.9,'SpecularStrength',0.1);
Star(3) = surf(xStar,yStar,zStar,'FaceColor',starColor,'EdgeColor','none',...
    'DiffuseStrength',0.9,'SpecularStrength',0.1);
light(gca,'Position',[starThick*5 0, starHeight],'Style','Local')
light(gca,'Position',[-starThick*5 0, starHeight],'Style','Local')
light(gca,'Position',[0 starThick*5 , starHeight],'Style','Local')
light(gca,'Position',[0 -starThick*5 , starHeight],'Style','Local')


%% 雪花
% 构造雪花产生的基准点
[x0,y0] = meshgrid(linspace(axLim(1),axLim(2),nPoint),...
    linspace(axLim(3),axLim(4),nPoint));

% 每次雪花下落的距离
dz0 = axLim(end)/nPoint/snowRate;

xSnow = [];
ySnow = [];
zSnow = [];
for k = 1:ceil(360/dvAngle(1)*nCircle)
    % 删除雪花以重新绘制
    if k > 1
        Snow.delete;
    end
    
    % 利用随机数判断当前帧是否产生新的雪花
    if rand(1) < snowProbFrame              
        % 如果产生新的雪花，利用雪花出现位置的概率随机挑选出现的位置索引
        seed = rand(nPoint);
        idx = seed < snowProbLoc;

        % 生成新的雪花
        xs = x0(idx);
        ys = y0(idx);
        zs = zeros(size(xs))+axLim(6);

        % 添加到已有雪花中，竖直方向雪花下落
        xSnow = [xSnow; xs];
        ySnow = [ySnow; ys];
        zSnow = [zSnow-dz0; zs];
    else
        zSnow = zSnow-dz0;
    end  

    % 删除超过显示范围的点
    idx = zSnow < axLim(5);
    xSnow(idx) = [];
    ySnow(idx) = [];
    zSnow(idx) = [];
    
    % 水平方向添加随机游走
    xSnow = xSnow + randn(size(xSnow))*snowWalk;
    ySnow = ySnow + randn(size(ySnow))*snowWalk;

    % 重新绘制雪花
    Snow = plot3(xSnow,ySnow,zSnow,...
        'LineStyle','none','Marker',snowShape,'MarkerSize',snowSize,...
        'MarkerFaceColor',snowColor,'MarkerEdgeColor',snowColor);

    % 判断是否需要让灯泡闪烁
    if mod(k,bulbBlink) == 0
        bulbColorIdx1 = mod(bulbColorIdx1,bulbColorNum) + 1;
        bulbColorIdx2 = bulbColorNum - bulbColorIdx1 + 1;
        Bulb(1).MarkerFaceColor = bulbColor(bulbColorIdx1,:);
        Bulb(2).MarkerFaceColor = bulbColor(bulbColorIdx2,:);
    end

    % 刷新视角
    viewAngle = viewAngle+dvAngle;
    if viewAngle(2) >= vzLim(2) || viewAngle(2) <= vzLim(1)
        dvAngle(2) = -dvAngle(2);
    end
    view(viewAngle)
    axis(axLim)
    pause(Ts)

    % 文件名非空时生成 GIF
    if ~isempty(filename)
        frame = getframe(gcf);
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        if k == 1
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',Ts);
        else
            imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',Ts);
        end
    end
end