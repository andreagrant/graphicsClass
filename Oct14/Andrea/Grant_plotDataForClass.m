cd graphicsClass
inFile='campbellRobsonFig2data.csv';
v57_ap2x2=[0.79,96.15;
1.08,151.10;
1.77,214.10;
2.16,330.18;
3.08,523.80;
4.21,499.70;
6.14,306.22;
8.53,200.44];

v57_ap10x10=[0.20,60.04;
0.27,100.79;
0.38,120.54;
0.54,200.44;
0.77,294.90;
1.06,346.10;
1.52,509.21;
2.00,662.85;
3.06,580.97;
4.21,549.05;
6.14,320.98;
8.53,218.17];

v285_ap2x2=[0.97,93.47;
1.35,141.46;
1.93,210.10;
2.65,398.61;
3.83,467.82;
5.38,362.79;
7.69,283.99;
10.50,208.13;
15.59,119.41;
21.28,47.00;
27.45,20.14;
31.91,10.71;
35.40,6.15;
37.45,4.63;
40.77,2.58;
43.55,1.84];
%%
figure
loglog(v57_ap2x2(:,1),v57_ap2x2(:,2),'ro');
hold on
loglog(v57_ap10x10(:,1),v57_ap10x10(:,2),'gs');
loglog(v285_ap2x2(:,1),v285_ap2x2(:,2),'b^');


% 
xLimits=[0.1 100];
yLimits=[1 1000];
axisMax=[xLimits(2) yLimits(2)];
%axis([0.1 100 1 1000])
axis([xLimits yLimits])
set(gca,'XTick',[0.1,1,10,100])
set(gca,'XTickLabel',{'0.1','1','10','100'},'FontSize',14);
set(gca,'YTick',[1,10,100,1000])
set(gca,'YTickLabel',{'1','10','100','1000'});

ylabel('Contrast Sensitivity')
xlabel('Spatial Frequency (cycles/degree)')

%arrowLoc
%red circle, 57---2x2
%first point
% loc57_2x2=v57_ap2x2(1,:)./axisMax;
% annotation('textarrow',[loc57_2x2(1)*0.8 loc57_2x2(1)],[loc57_2x2(2)*0.8 loc57_2x2(2)],'String','57cm, 2x2');


% %         if iPlot==2
% %             legend('anatomy A','anatomy B','anatomy C','anatomy AB','anatomy AC','anatomy BC','anatomy ABC','anatomy A with T2','anatomy C with T2')
% %         end
title('Contrast Sensitivity vs spatial Frequency')
file_plots = 'csf';
set(gcf,'PaperOrientation','portrait')
set(gcf,'PaperUnits','inches')
set(gcf,'PaperSize',[11 11])
set(gcf,'PaperPositionMode','manual')
set(gcf,'PaperPosition',[0 0 17 11]) %SHOULD BE 2 2 10 22_??? left bottom width height???'
print('-depsc2','-cmyk','-r600','-painters',[file_plots '.eps'])
print('-dtiff','-cmyk','-r600','-painters',[file_plots '.tif'])
% print('-dsvg','-cmyk','-r600','-painters',[file_plots '.svg'])
% close gcf
% 
% 











