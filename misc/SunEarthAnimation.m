% Show Sun-Earth dynamic in ECI
% Rotate rate of Earth is NOT correct, just for show

% XiaoCY 2021-03-07

%%
clear;clc
close all


V = VideoWriter('Earth');
V.FrameRate = 60;
V.Quality = 90;
open(V)

%% Earth
Cdata = imread('World-Political-Map-HD-Wallpaper-21.jpg');
for k = 1:3
    Cdata(:,:,k) = Cdata(end:-1:1,:,k);
end

[x,y,z] = sphere(50);
earth = surf(x,y,z);
earth.FaceColor = 'texturemap';
earth.CData = Cdata;
earth.EdgeColor = 'none';
earth.FaceLighting = 'gouraud';
axis equal off
hold on
axis([-6 6 -6 6 -3 3])

t = linspace(0,2*pi,100);
xt = cos(t)*6;
yt = sin(t)*6;
fill3(xt,yt,yt*0,[.85 .33 .10],'FaceAlpha',0.1)
view(120,15)

%% Sun
inc = 0.41;
R = [ 1 0 0;
    0 cos(inc) -sin(inc);
    0 sin(inc) cos(inc)];

for day = 0:2:366
    rotate(earth,[0,0,1],10);
    
    theta = day/365*2*pi;
    r = [cos(theta); sin(theta); 0]*5;
    r = -R*r;
    
    try
        sun.delete;
        h.delete
    catch
        % do nothing
    end
    
    sun = surf(x*0.5+r(1),y*0.5+r(2),z*0.5+r(3));
    sun.FaceColor = 'y';
    sun.EdgeColor = 'none';
    
    h = light('position',r);
    
    frame = getframe(gcf);
    writeVideo(V,frame);
end

close(V)