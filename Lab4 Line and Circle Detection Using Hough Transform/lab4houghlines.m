function [H,theta,rho] = lab4houghlines(img)

%convert to gray-scale
[~,~,ch] = size(img);
if (ch==3)
    img = rgb2gray(img);
end

%detect edges
edge_detector = 'LoG';
img_edges = edge(img,edge_detector);
figure;
subplot(3,2,1), imshow(img), title('original');
subplot(3,2,2), imshow(img_edges), title('edges');

%hough transform of the edge image
[H,theta,rho] = hough(img_edges);
subplot(3,1,2), imshow(imadjust(rescale(H)),'XData',theta, 'YData', rho, 'InitialMagnification','fit'), title('Hough Transform');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(gca,"turbo");

%peak Hough points. I tried and saw that there are 15 pixels that are above
%threshold so that's why I set the number of peaks to be found as 15.
peaks = houghpeaks(H,50, 'Threshold',0.5*max(H(:)));
subplot(3,1,3), imshow(H, [], 'XData', theta, 'YData', rho, 'InitialMagnification', 'fit'), title('peaks on hough transform');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(theta(peaks(:,2)), rho(peaks(:,1)), 's', 'color', 'red');

%hough lines.
lines = houghlines(img_edges, theta, rho, peaks, 'FillGap',10,'MinLength',40);

pause(1)
close all 
figure;
imshow(img), hold on;
max_len = 0;
min_len = 300;


for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

    %plot beginnings and ends of lines
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

    %determine the endpoints of the longest and shortest line segments
    len = norm(lines(k).point1 - lines(k).point2);

    if ( len > max_len)
      max_len = len;
      xy_long = xy;
    end

    if(len < min_len)
        min_len = len;
        xy_short = xy;
    end
    
end

    plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');
    plot(xy_short(:,1),xy_short(:,2),'LineWidth',2,'Color','red');
    %display('minimum length : ' + min_len + ', max length: '+ max_len);
    xlabel({['minimum length: ',num2str(min_len)],['maximum length: ',num2str(max_len)]});
    %xlabel({'maximum length',max_len});
    
end

