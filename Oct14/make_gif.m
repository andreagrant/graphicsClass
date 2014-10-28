clear; close all; clear mex; clear global

[img map] = imread('04rainbow5.gif');

for iM = 1:size(img,4)
    subplot(3,4,iM)
    imshow(img(:,:,1,iM)); 
end
colormap(map)


set(gcf,'pos',[500 300 size(img,2) size(img,1)])
fDuration = .5;
filename = 'my.gif';
for iF = 1:size(img,4)
    axes('pos',[0 0 1 1])
    imshow(img(:,:,1,iF)); colormap(map)
    t=text(10,10,num2str(iF)); set(t,'Color','b')
    drawnow
    frame = getframe(1);
    im = frame2im(frame);
    [imind cm] = rgb2ind(im,256);
    if iF == 1
        imwrite(imind,cm,filename,'gif','Loopcount',inf,'DelayTime',fDuration);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',fDuration)
    end
end
   