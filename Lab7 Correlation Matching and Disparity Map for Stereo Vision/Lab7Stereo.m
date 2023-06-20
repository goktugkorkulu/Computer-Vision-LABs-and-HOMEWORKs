clear all, close all, clc;

leftImage =  imread("Lab7 - Images/left.png");
rightImage = imread("Lab7 - Images/right.png");
%leftImage =  imread("Lab7 - Images/S00L.tif");
%rightImage = imread("Lab7 - Images/S00R.tif");

[row, col, ch] = size(rightImage);

if (ch==3)
    %convert left and right images to grayscaled
    leftImage = rgb2gray(leftImage);
    rightImage = rgb2gray(rightImage);
end
%double the pixel values
leftImage = double(leftImage);
rightImage = double(rightImage);

%window size declarations. will change later on.
w=100;   
k=5;

%pad the images by the size w+k
leftImage = padarray(leftImage, [w+k w+k], 'both');
rightImage = padarray(rightImage, [w+k w+k], 'both');
figure, subplot(1,3,1), imshow(uint8(leftImage)), subplot(1,3,2), imshow(uint8(rightImage));

%show the combination of images I1 and I2 into a red-cyan anaglyph
subplot(1,3,3), imshow(stereoAnaglyph(uint8(leftImage),uint8(rightImage)));

%create empty disparity matrix.
disparity = zeros(row,col);

tic
for y = w+k+1:row+w+k
    for x = w+k+1:col+w+k

        depo = [];
        leftFrame = leftImage(y-k:y+k, x-k:x+k);
        for i = 0:1:w
            rightFrame = rightImage(y-k:y+k, x-k-i:x+k-i);

            SSD =  sum(sum( (-1) * (rightFrame - leftFrame).^2  ));
           
            depo = [depo ; i SSD];

        end
        
        ind = find(depo(:,2) == max(depo(:,2)));
        d = depo(ind(1),1);

        disparity(y-w-k,x-w-k) = d;


    end
end
toc
figure, imagesc(uint8(disparity)); colormap jet; colorbar
xlabel("w: " + w + " and k: " + k)

%%
clc; clear all;
leftImage =  imread("Lab7 - Images/S00L.tif");
rightImage = imread("Lab7 - Images/S00R.tif");
[row, col, ch] = size(rightImage);
if (ch==3)
    %convert left and right images to grayscaled
    leftImage = rgb2gray(leftImage);
    rightImage = rgb2gray(rightImage);
end


a = stereoAnaglyph(leftImage,rightImage);

disparityRange = [0 64];

disparityMap = disparity(leftImage, rightImage, 'BlockSize', 7, 'DisparityRange', disparityRange);
figure;
imshow(disparityMap, disparityRange);
colormap jet;
colorbar
xlabel("Disparity Range: " + disparityRange);




