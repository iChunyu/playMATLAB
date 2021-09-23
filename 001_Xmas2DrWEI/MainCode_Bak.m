%% 备份说明
% 主程序'StartFromHere.mlapp'是基于MATLAB R2018b创建的
% 由于MATLAB版本的更新，低版本可能不支持主程序中使用的回调函数
% 故采用兼容性代码对主程序的功能进行备份
% 希望能够将祝福送给魏老师

% 祝：魏老师
%       圣诞快乐！
%       XiaoCY, WuQQ
%       2018.12.24

%% 播放音乐
clear;clc;close all
[Y,Fs] = audioread('JingleBells.mp3');
Player = audioplayer(Y,Fs);
Player.play

% 运行以下代码以暂停音乐播放
% Player.pause    

%% 绘制圣诞树
figure
imshow('Tree2.png')  % 展示圣诞树，图片来自网络
hold on

for t = 0:0.5:5      % 人为设定 5 s 持续时间
    try
        star.delete
    catch
        % Do nothing
    end
    x = rand(30,1)*400+10;
    y = rand(30,1)*400+10;
    star = plot(x,y,'p','MarkerSize',16);     % 用五角星标记随机数据点
    star.MarkerEdgeColor = x(1:3)/420;        % 随机更换标记的RBG颜色值
    star.MarkerFaceColor = star.MarkerEdgeColor;
    pause(0.5)
end

%% 祝福
figure

% 绘制苹果外形，实际上是笛卡尔心形曲线的变形
theta = linspace(pi/2,2.5*pi,100);
rho = 1-sin(theta+pi/21);
x1 = rho.*cos(theta);
y1 = rho.*sin(theta);
for k = 1:length(x1)
    plot(x1(1:k),y1(1:k),'Color','k','LineWidth',2);
    box off
axis off
axis([-1.5,2,-2,1])
    pause(0.01)
end
hold on

% 为苹果填充颜色
fill(x1,y1,'r','EdgeColor','k','LineWidth',2);          
pause(0.1)

% 绘制苹果上部的凹痕（形式构造的二次函数）
x2 = -0.35:0.05:0.3;
y2 = 0.8*(x2-0.2).^2-0.25;
for k = 1:length(x2)
    try
        h1.detele
    catch
        % Do nothing
    end
    h1 = plot(x2(1:k),y2(1:k),'Color','k','LineWidth',3);
    pause(0.01)
end

% 绘制苹果的杆（形式的二次函数）
x3 = -0.08:0.05:0.5;
y3 = -1.5*(x3-0.7).^2+1.5*0.7^2;
for k = 1:length(x3)
    try
        h2.detele
    catch
        % Do nothing
    end
    h2 = plot(x3(1:k),y3(1:k),'Color','k','LineWidth',3);
    pause(0.01)
end

str1 = '祝魏老师';
str2 = '圣诞快乐！';
for k = 1:length(str1)
    text(1.3,1.1-0.3*k,str1(k),'FontSize',28,'Color','r')
    pause(0.2)
end
for k = 1:length(str2)
    text(1.6,0.7-0.3*k,str2(k),'FontSize',28,'Color','r')
    pause(0.2)
end