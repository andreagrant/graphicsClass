dat = load('CSFdata.mat');
data=dat.data;
%data{1}: 57cm, 2deg
%data{2}: 57cm, 10deg
%data{3}: 285cm, 2deg

figure; 
hold on
plot(data{1}(1,:),data{1}(2,:),'rs--','LineWidth',1.0,...
    'MarkerSize',10, 'MarkerEdgeColor','k','MarkerFaceColor',[1 0.5 0.5],'Linesmoothing','on');

hold on
plot(data{2}(1,:),data{2}(2,:),'ro-','LineWidth',1.0,...
    'MarkerSize',10,'MarkerEdgeColor','k','MarkerFaceColor',[1 0.5 0.5]);
hold on
plot(data{3}(1,:),data{3}(2,:),'bs--','LineWidth',1.0,...
    'MarkerSize',10,'MarkerEdgeColor','k','MarkerFaceColor',[0.5 0.5 1]);
     
set(gca,'FontSize',16,'FontName','Arial')
set(gca, 'XLim', [0,50],'YLim',[0,1000],'XScale','log','YScale','log');

set(gca,'YTick',[1,10,100,1000],'YMinorTick','on')
set(gca,'YTickLabel',{'1','10','100','1000'},'FontSize',16)
set(gca,'XTick',[0.1,1,10],'XMinorTick','on')
set(gca,'XTickLabel',{'0.1','1','10'},'FontSize',16)


xlabel('Spatial Frequency (c/deg)','FontWeight','bold');
ylabel({'Contrast Sensitivity'},'FontWeight','bold');

h1=plot(data{1}(1,:),data{1}(2,:),'r-','LineWidth',1.0,...
    'Visible','off');
h2=plot(data{1}(1,:),data{1}(2,:),'b-','LineWidth',1.0,...
    'Visible','off');
h3=plot(data{1}(1,:),data{1}(2,:),'ks--','LineWidth',1.0,...
    'MarkerSize',10, 'MarkerEdgeColor','k','MarkerFaceColor',[0.5 0.5 0.5],...
    'Visible','off');
h4=plot(data{1}(1,:),data{1}(2,:),'ko-','LineWidth',1.0,...
    'MarkerSize',10, 'MarkerEdgeColor','k','MarkerFaceColor',[0.5 0.5 0.5],...
    'Visible','off');
h=[h1,h2,h3,h4];

leg = legend(h,{'VD=57cm','VD=285cm','Size=2X2','Size=10X10'});
set(leg,'Box','on','Location','SouthWest','FontName','Arial','FontSize',16);



