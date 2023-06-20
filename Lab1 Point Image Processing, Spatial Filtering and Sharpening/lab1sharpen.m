function I_new = lab1sharpen(I, constant)

[row,col,ch] = size(I);

if(ch == 3) %if the image id rgb
    I = rgb2gray(I);
end

I = double(I);

I_smoothed = lab1locbox(I, 5);
I_new = I + constant*(I - I_smoothed);


%Display 
figure;
subplot(1,2,1), imshow(uint8(I)), title('Original grayscaled Image');
subplot(1,2,2), imshow(uint8(I_new)), title('Sharpened Image');
end