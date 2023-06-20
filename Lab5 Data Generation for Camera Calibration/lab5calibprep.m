img = imread("Lab5 - Images/myCalibObject.jpeg");

%convert to gray-scale
[~,~,ch] = size(img);
if (ch==3)
    img = rgb2gray(img);
end

img_edges = edge(img, "LoG");

%Hough Transform
[H,theta,rho] = hough(img_edges);
P = houghpeaks(H,50, 'Threshold',0.5*max(H(:)));
houg_lines = houghlines(img_edges, theta, rho, P, 'FillGap',20,'MinLength',60);

figure;
subplot(1,3,1), imshow(img_edges), title("original grayscaled");
subplot(1,3,2), imshow(img), title("hough lines");
hold on;

for k = 1:length(houg_lines)
    xy = [houg_lines(k).point1; houg_lines(k).point2]; %beginning and ending coordinates of lines.
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end

img_corners = corner(img, 'harris');
plot(img_corners(:,1), img_corners(:,2), 's', 'MarkerSize', 4, 'MarkerEdgeColor', 'blue', 'LineWidth', 1);



subplot(1,3,3), imshow(img), title("picked lines");
hold on;


line1 = houg_lines(4);
line2 = houg_lines(12);

% xp = 0:1:2000;
% xh = -250:1:2500;
% yp = [];yh = [];
% k=1;p=1;
% vert = [];horiz = [];
% for i=1:length(line1.theta)
% 
%     if (line1.theta(i) ~=0)
%         yp(k,:) = (line1.rho(i)-xp*cosd(line1.theta(i))) / sind(line1.theta(i));
%         vert(k) = i;
%         k=k+1;
%     else
%         yh(p,:) = line1.rho(i)/cosd(line1.theta(i))*ones(size(xh));
%         horiz(p) = i;
%         p=p+1;
%     end
% end
% %I will add if condition here after making sure the code above works well.
% plot(xp,yp,'LineWidth',2,'Color','magenta');






x1 = line1.point1:0.1:line1.point2;
y1 = (line1.rho - x1*cosd(line1.theta))/sind(line1.theta);
% 
% x2 = line2.point1:0.1:line2.point2;
% y2 = (line2.rho - x2*cosd(line2.theta))/sind(line2.theta);
% 
% plot(x2,y2,'LineWidth',2,'Color','magenta');
% 
% line3 = houg_lines(4);
% line4 = houg_lines(35);
% 
% line5 = houg_lines(4);
% line6 = houg_lines(28);
% 
% 
% y4 = (line4.rho - x*cosd(line4.theta))/sind(line4.theta);
% y6 = (line6.rho - x*cosd(line6.theta))/sind(line6.theta);
% %y7 = (line7.rho - x*cosd(line7.theta))/sind(line7.theta);





% plot(x,y4,'LineWidth',2,'Color','magenta');
% plot(x,y6,'LineWidth',2,'Color','magenta');
% 
% plot(img_corners(:,1), img_corners(:,2), 's', 'MarkerSize', 4, 'MarkerEdgeColor', 'blue', 'LineWidth', 1);


% % b = [line1.rho; line2.rho];
% % A = [cosd(line1.theta) sind(line1.theta); cosd(line2.theta) sind(line2.theta)];
% % result = A\b;
% % 
% % plot (result(1), result(2), 'x','LineWidth',20,'Color','yellow');
% % 
% 
% 
% difference = sqrt((125-126.843)^2 + (228-229.868)^2);
% xlabel(difference);