close all
clear
clc

str = 'ÐÂÄê¿ìÀÖ£¡';
h = iPeppa();
for i = 0:5
    h = iNewYear(h,i);
    try
        text(80,80-25*i,str(i),'FontSize',28,'Color','r')
    catch
        % Do Nothing
    end
    pause(0.5)
end