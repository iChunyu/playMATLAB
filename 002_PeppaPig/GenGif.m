clear
clc

str = '?????';
filename = 'PeppaYear.gif';
h = iPeppa();
for i = 0:5
    h = iNewYear(h,i);
    try
        text(80,80-20*i,str(i),'FontSize',28,'Color','r')
    catch
        % Do Nothing
    end
    frame = getframe(gcf);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if i == 0
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append');
    end
    
    pause(0.4)
end