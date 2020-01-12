%% ����˵��
% ������'StartFromHere.mlapp'�ǻ���MATLAB R2018b������
% ����MATLAB�汾�ĸ��£��Ͱ汾���ܲ�֧����������ʹ�õĻص�����
% �ʲ��ü����Դ����������Ĺ��ܽ��б���
% ϣ���ܹ���ף���͸�κ��ʦ

% ף��κ��ʦ
%       ʥ�����֣�
%       Ф���� ��ٻٻ
%       2018.12.24

%% ��������
clear;clc;close all
[Y,Fs] = audioread('JingleBells.mp3');
Player = audioplayer(Y,Fs);
Player.play

% �������´�������ͣ���ֲ���
% Player.pause    

%% ����ʥ����
figure
imshow('Tree2.png')  % չʾʥ������ͼƬ��������
hold on

for t = 0:0.5:5      % ��Ϊ�趨 5 s ����ʱ��
    try
        star.delete
    catch
        % Do nothing
    end
    x = rand(30,1)*400+10;
    y = rand(30,1)*400+10;
    star = plot(x,y,'p','MarkerSize',16);     % ������Ǳ��������ݵ�
    star.MarkerEdgeColor = x(1:3)/420;        % ���������ǵ�RBG��ɫֵ
    star.MarkerFaceColor = star.MarkerEdgeColor;
    pause(0.5)
end

%% ף��
figure

% ����ƻ�����Σ�ʵ�����ǵѿ����������ߵı���
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

% Ϊƻ�������ɫ
fill(x1,y1,'r','EdgeColor','k','LineWidth',2);          
pause(0.1)

% ����ƻ���ϲ��İ��ۣ���ʽ����Ķ��κ�����
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

% ����ƻ���ĸˣ���ʽ�Ķ��κ�����
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

str1 = 'ףκ��ʦ';
str2 = 'ʥ�����֣�';
for k = 1:length(str1)
    text(1.3,1.1-0.3*k,str1(k),'FontSize',28,'Color','r')
    pause(0.2)
end
for k = 1:length(str2)
    text(1.6,0.7-0.3*k,str2(k),'FontSize',28,'Color','r')
    pause(0.2)
end