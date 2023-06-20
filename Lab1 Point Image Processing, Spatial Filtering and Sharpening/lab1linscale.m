function I_new = lab1linscale(img)

[row,col,ch] = size(img);

if(ch == 3) %if the image id rgb
    img = rgb2gray(img);
end
img = double(img);

umin = min(img(:)); %converts matrix into a single row then returns the minimum pixel value. Alternatively can use min(min(img));
umax = max(img(:)); %converts matrix into a single row then returns the maximum pixel value. Alternatively can use max(max(img));

a = -umin;
Gmax = 255.0;
b = Gmax / (umax - umin);
I_new = b * (img-a);

%Display
figure;
subplot(2,2,1), imshow(uint8(img)), title('Original Image');
subplot(2,2,3), imshow(uint8(I_new)), title('Linear Scaled Image');
subplot(2,2,2), imhist(uint8(img)), title('Original Image Histogram');
subplot(2,2,4), imhist(uint8(I_new)), title('Linear Scaled Image Histogram');
end