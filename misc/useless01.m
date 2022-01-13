% 花式摆烂

% XiaoCY 2022-01-13

%%
clear;clc
close all

% read figure as gray
pic1 = im2gray(imread('pendulum.png'));
pic2 = im2gray(imread('messy.png'));

% index of pixels where there are words
idx1 = ~imbinarize(pic1);
idx2 = ~imbinarize(pic2);

%% black
idxb = kron(idx1,idx2);
idxw = ~idxb;
picBlack = uint8(idxw*255);

figure('WindowStyle','normal')
imshow(picBlack)

%% colored (complete)
[w,h] = size(idxb);

picColored1 = uint8(zeros(w,h,3));
for k = 1:3
    C = randi(255,w,h);
    C(idxw) = 255;
    picColored1(:,:,k) = C;
end

figure('WindowStyle','normal')
imshow(picColored1)

%% colored (per word)
[w1,h1] = size(idx1);
picColored2 = uint8(zeros(w,h,3));
for k = 1:3
    C = randi(255,w1,h1);
    C(~idx1) = 0;
    picColored2(:,:,k) = 255-kron(uint8(C),uint8(idx2));
end
figure('WindowStyle','normal')
imshow(picColored2)

%% shine
Ts = 0.1;
nFrame = 20;
filename = 'fuckit.gif';

[w1,h1] = size(idx1);
picColored2 = uint8(zeros(w,h,3));
figure('WindowStyle','normal')
for n = 1:nFrame
    for k = 1:3
        C = randi(255,w1,h1);
        C(~idx1) = 0;
        picColored2(:,:,k) = 255-kron(uint8(C),uint8(idx2));
    end
    imshow(picColored2)
    pause(Ts)

    [imind,cm] = rgb2ind(picColored2,256);
    if n == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',Ts);
    end

end