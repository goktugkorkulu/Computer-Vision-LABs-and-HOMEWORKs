function [centersBright, radiiBright, centersDark, radiiDark] = lab4houghcircles(img)
[~,~,ch] = size(img);
if (ch==3)
    img = rgb2gray(img);
end

Rmin = 20;
Rmax = 60;

[centers1, radii1] = imfindcircles(img,[Rmin Rmax]);
[centers2, radii2] = imfindcircles(img, [Rmin Rmax], 'Sensitivity', 1);

%for bright circles
[centersBright, radiiBright] = imfindcircles(img,[Rmin Rmax], 'Sensitivity', 0.9, 'ObjectPolarity', 'bright');
%for dark circles
[centersDark, radiiDark] = imfindcircles(img,[Rmin Rmax], 'Sensitivity', 0.9, 'ObjectPolarity', 'dark');

%plottings
figure 
subplot(1,3,1);
imshow(img);
viscircles(centers1, radii1,'EdgeColor','b');

subplot(1,3,2);
imshow(img);
viscircles(centers2, radii2,'EdgeColor','r');

subplot(1,3,3);
imshow(img);
viscircles(centersBright, radiiBright,'EdgeColor','b');
viscircles(centersDark, radiiDark,'LineStyle','--' , 'EdgeColor','r');
end

