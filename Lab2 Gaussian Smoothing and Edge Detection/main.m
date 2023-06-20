%% Gaussian Filter
clear; close all; clc;
img = imread("Lab2 - Images/baboon.png");
lab2gaussfilt(img);

%% Prewitt Operator
clear; close all; clc;
img2 = imread('Lab2 - Images/house.png');
lab2prewitt(img2, 100);

%% Sobel Operator
clear; close all; clc;
img3 = imread("Lab2 - Images/house.png");
lab2sobel(img3, 200);

%% Laplacian of Gaussian Smoothed Image
clear; close all; clc;
img4 = imread("Lab2 - Images/Object_contours.jpg");
lab2log(img4);