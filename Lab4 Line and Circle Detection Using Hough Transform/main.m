%% Hough Lines
clear; close all; clc;
tic
img = imread('Lab4 - Images/floor.jpg');
[H,theta,who] = lab4houghlines(img);
toc
%% Hough Circles
clear; close all; clc;
tic
img = imread('circlesBrightDark.png');
[centersBright, radiiBright, centersDark, radiiDark] = lab4houghcircles(img);
toc