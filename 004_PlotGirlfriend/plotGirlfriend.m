% Plot grilfriend

% XiaoCY 2020-01-08

%%
figure
hold on
axis off equal

theta = linspace(0,2*pi,500);
x = 146/2*cos(theta);
y = 183/2*sin(theta);
face = patch(x,y,[234 167 102]/255);

hl1 = [
    -77 -34
    -5 76
    -61 26
    -38 68
    2 92];
hl2 = [-77 -34
    -76 12
    -60 67
    -24 94
    2 92];
[x,y] = getArea(hl1,hl2);
patch(x,y,[42 42 42]/255)

hr1 = [
    -8 81
    13 42
    66 20
    76 -19
    90 -4];
hr2 = [
    -8 95
    42 92
    78 41
    90 -4];
[x,y] = getArea(hr1,hr2);
patch(x,y,[42 42 42]/255)

plot([-50 -22],[23 25],'LineWidth',10,'Color',[42 42 42]/255)
plot([13 48],[25 22],'LineWidth',10,'Color',[42 42 42]/255)

x = cos(theta)*28;
y = sin(theta)*20;
plot(x-42,y,'LineWidth',3,'Color',[244 244 244]/255)
plot(x+30,y,'LineWidth',3,'Color',[244 244 244]/255)
plot([-14 2],[0 -1],'LineWidth',3,'Color',[244 244 244]/255)
plot([57 72],[-3 -12],'LineWidth',3,'Color',[244 244 244]/255)

e1 = [
    -48 7
    -35 13
    -27 13
    -23 8];
e2 = [
    -48 7
    -38 6
    -28 6
    -23 8];
[x,y] = getArea(e1,e2);
patch(x,y,[1 1 1])

e1 = [
    14 9
    21 13
    33 13
    44 8];
e2 = [
    14 9
    20 5
    32 6
    44 8];
[x,y] = getArea(e1,e2);
patch(x,y,[1 1 1])

x = cos(theta)*5;
y = sin(theta)*3;
patch(x-31,y+10,[0 0 0])
patch(x+29,y+9,[0 0 0])

x = cos(theta)*3.5;
y = sin(theta)*1.5;
patch(x-17,y-23,[0 0 0])
patch(x,y-24,[0 0 0])

m1 = [
   -32 -43
   -24 -39
   -15 -38
   -9 -41
   -1 -40
   7 -41
   21 -45];
m2 = [
    -32 -43
    -22 -50
    -10 -54
    5 -50
    12 -48
    21 -45];
[x,y] = getArea(m1,m2);
patch(x,y,[227 170 170]/255)

xy = [
    -28 -44
    -17 -44
    -10 -46
    0 -45
    17 -45];
plot(xy(:,1),xy(:,2),'LineWidth',2,'Color',[0 0 0])