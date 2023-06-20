%% 1)Point Image Processing
% General linear transformation equation: "g(u) = b(u + a)"

clc;
clear;
close all;

image = imread('Lab1 - Images/pbear.jpg');

%% Linear scaling
lab1linscale(image);

%% Conditional scaling
ref_image = imread('Lab1 - Images/bird.png');
lab1condscale(image, ref_image);

%% Histogram Equalization
hisEq_image = histeq(image);

subplot(2,2,1), imshow(image), title('Original Image');
subplot(2,2,3), imshow(hisEq_image), title('Histogram Equalised Image');
subplot(2,2,2), imhist(image), title('Original Image Histogram');
subplot(2,2,4), imhist(hisEq_image), title('Histogram Equalised Histogram');

%% Local Mean Filter
image2 = imread("Lab1 - Images/child.png");
lab1locbox(image2, 9);

%% Sharpening
image3 = imread('Lab1 - Images/bird.png');
lab1sharpen(image3, 10);

