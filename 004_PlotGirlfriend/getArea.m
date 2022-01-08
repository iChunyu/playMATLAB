% get area date for patch ploting

% XiaoCY 2022-01-08

%%
function [x,y] = getArea(data1,data2)
    N = 33;
    x1 = linspace(data1(1,1),data1(end,1),N);
    p1 = pchip(data1(:,1),data1(:,2));
    y1 = ppval(p1,x1);
    
    x2 = linspace(data2(1,1),data2(end,1),N);
    p2 = pchip(data2(:,1),data2(:,2));
    y2 = ppval(p2,x2);
    
    x = [x1 x2(end:-1:1)];
    y = [y1 y2(end:-1:1)];  
end