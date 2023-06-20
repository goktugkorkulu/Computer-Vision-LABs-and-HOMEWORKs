clear; close all; clc;
img_blocks = imread("Lab3 - Images/blocks.png");
img_lab = imread("Lab3 - Images/lab.png");
img_notredame = imread("Lab3 - Images/notredame.jpg");

%% Kanade-Tomasi Algorithm
Corners = lab3ktcorners(img_notredame, 1, 75000);

figure;
imshow(img_notredame);
hold on;
plot(Corners(:,2), Corners(:,1), 'r*');


% k=1;
% xlabel("Window size is " + uint8((k*2)+1));
% th=10000; 
% xlabel("Threshold value is " + th);
%% Harris Algorithm
th2=300000; 
k2=3;
Corners2 = lab3Harriscorners(img_blocks, k2, th2);

figure;
imshow(img_blocks);
hold on;
plot(Corners2(:,2), Corners2(:,1), 'r*');
xlabel( {'k: ' + string(k2), 'T: '+ string(th2)} );


%% Harris Algorithm v.2
th3=5000000000; 
k3=3;
Coreners3 = lab3Harriscorners2(img_lab, k3, th3);

figure;
imshow(img_lab);
hold on;
plot(Coreners3(:,2), Coreners3(:,1), 'r*');
xlabel( {'k: ' + string(k3), 'T: '+ string(th3)} );