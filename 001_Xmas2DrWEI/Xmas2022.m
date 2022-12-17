% 祝魏老师圣诞快乐！

%% 基本参数
clear;clc

sceneLim = [-1 1 -1 1 0 2.1];

N = 50;

hTree = 2;
rTree = 0.7;
dr = 0.03;
[x0,y0] = meshgrid(linspace(-1,1,N));
z0 = sceneLim(end);
dz0 = z0/N;

Ts = 1/50;
Tv = 1/20;

dv = [1 0.1];
v = [0 15];
vzlim = [15 20];

rTree = linspace(0,rTree,N);
[xTree, yTree, zTree] = cylinder(rTree,N-1);

xTree = xTree + rand(N)*dr;
yTree = yTree + rand(N)*dr;
zTree = -zTree*hTree + hTree + rand(N)*dr;

% xTree = reshape(smooth(xTree),N,[]);
% yTree = reshape(smooth(yTree),N,[]);
% zTree = reshape(smooth(zTree),N,[]);

xTree(:,end) = xTree(:,1);
yTree(:,end) = yTree(:,1);
zTree(:,end) = zTree(:,1);


figure('Color','#D5CABD')

Tree = surf(xTree,yTree,zTree,'FaceColor','#00C9A7');%,'EdgeColor','none');
hold on
view(v)
% light(gca,'Position',[0 0.5 0.87])
% light(gca,'Position',[0.5 0 0.87])
axis equal off
% axis(sceneLim)


% 随机生成雪花
xSnow = [];
ySnow = [];
zSnow = [];

for k = 1:50*10
    if k > 1
        h.delete;
    end
    if rand(1) < 0.1
        seed = rand(N);
        idx = seed < 0.001;
        xs = x0(idx);
        ys = y0(idx);
        zs = zeros(size(xs))+sceneLim(6);
        xSnow = [xSnow; xs];
        ySnow = [ySnow; ys];
        zSnow = [zSnow-dz0; zs];
    else
        zSnow = zSnow-dz0;
    end
    idx = zSnow < 0;
    xSnow(idx) = [];
    ySnow(idx) = [];
    zSnow(idx) = [];
    h = plot3(xSnow,ySnow,zSnow,...
        'LineStyle','none','Marker','hexagram','MarkerSize',10,...
        'MarkerFaceColor','White','MarkerEdgeColor','White');
    axis(sceneLim)
    view(v)
    pause(Ts)
    v = v+dv;
    if v(2) >= vzlim(2) || v(2) <= vzlim(1)
        dv(2) = -dv(2);
    end
end