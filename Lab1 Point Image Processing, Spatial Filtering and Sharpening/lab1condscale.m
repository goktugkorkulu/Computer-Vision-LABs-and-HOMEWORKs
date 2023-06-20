function I_new = lab1condscale(img, img_ref)

[row,col,ch] = size(img);
if(ch == 3) %if the image is rgb
    img = rgb2gray(img);
end
img = double(img);

[row2,col2,ch2] = size(img_ref);
if(ch2 == 3) %if the image is rgb
    img_ref = rgb2gray(img_ref);
end
img_ref = double(img_ref);

meanOfReference = mean2(img_ref);
stdOfReference = std2(img_ref);
meanOfImage = mean2(img);
stdofImage = std2(img);

a = meanOfReference * (stdofImage/stdOfReference) - meanOfImage;
b = stdOfReference / stdofImage;

I_new = b * (img + a);

%Displays
figure;

subplot(1,3,1), imshow(uint8(img)), title('Original Image'), xlabel({['Mean: ', num2str(meanOfImage)], ['Std: ', num2str(stdofImage)]});
subplot(1,3,2), imshow(uint8(img_ref)), title('Reference Image'), xlabel({['Mean: ', num2str(meanOfReference)], ['Std: ', num2str(stdOfReference)]});
subplot(1,3,3), imshow(uint8(I_new)), title('Output image'), xlabel({['Mean: ', num2str(mean2(I_new))], ['Std: ', num2str(std2(I_new))]});

end