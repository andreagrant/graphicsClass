desc{2} = 'at 57 cm, 2x2\circ aperture';
data{2} = [0.79	96.15
1.08	151.1
1.77	214.1
2.16	330.18
3.08	523.8
4.21	499.7
6.14	306.22
8.53	200.44];
% spatial frequency in 1st column; sensitivity in 1nd column
desc{1} = 'at 57 cm, 10x10\circ aperture';
data{1} = [0.2	60.04
0.27	100.79
0.38	120.54
0.54	200.44
0.77	294.9
1.06	346.1
1.52	509.21
2	662.85
3.06	580.97
4.21	549.05
6.14	320.98
8.53	218.17];
desc{3} = 'at 285 cm, 2x2\circ aperture';
data{3} = [0.97	93.47
1.35	141.46
1.93	210.1
2.65	398.61
3.83	467.82
5.38	362.79
7.69	283.99
10.5	208.13
15.59	119.41
21.28	47
27.45	20.14
31.91	10.71
35.4	6.15
37.45	4.63
40.77	2.58
43.55	1.84];

figure(1); clf; 
axes('pos',[.15 .15 .78 .8])
set(gca,'YScale','log','YMinorTick','off', ...
    'YTick',10.^(-1:3),'YTickLabel',[.1 1 10 100 1000],'XColor','w')
y=ylabel('Contrast sensitivity');
axis([.1 100 .1 1000])
currPos = get(y,'Position'); set(y,'Position',[(currPos(1)+.02) currPos(2:3)]);

axes('pos',[.18 .15 .78 .8])
symbols = ['s';'^';'o'];
loglog(data{1}(:,1),data{1}(:,2),symbols(1),'Color','k')
hold on
loglog(data{2}(:,1),data{2}(:,2),symbols(2),'Color','k')
loglog(data{3}(:,1),data{3}(:,2),symbols(3),'Color','k')
hold off

set(gca,'XMinorTick','off','XTick',10.^(-1:3),'XTickLabel',[.1 1 10 100 1000])
set(gca,'YMinorTick','off','YTick',10.^(-1:3), ...
    'YTickLabel',[],'YColor','w')
%grid on
xlabel('Spatial frequency (cycles per degree)')
box off
axis([.1 100 .1 1000])
set(gcf,'Color','w','pos',[800 400 350 300],'PaperPosition',[0 0 3.5 3])

l=legend(desc);
set(l,'box','off','Position',[.35 .3 .4 .2],'FontSize',8);
legendChildren = get(l,'Children');
for iC = [3 6 9]
    currPos = get(legendChildren(iC),'Position');
    set(legendChildren(iC),'Position',[currPos(1)-.08 currPos(2:3)])
end

print(gcf,'-deps','graph1.eps')
%img = imread('graph1.eps');
%imwrite(img,'graph1c.tif','compression','lzw','resolution',600)
