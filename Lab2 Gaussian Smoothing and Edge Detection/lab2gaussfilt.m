function I_new = lab2gaussfilt(img)

%Grayscaling Process
[row,col,ch] = size(img);
if(ch == 3)
    img = rgb2gray(img);
end

%Doubling Process
img = double(img);

%kernel to be convolved with the image.
kernel = [1 4 7 4 1; 4 16 26 16 4; 7 26 41 26 7; 4 16 26 16 4; 1 4 7 4 1];
kernel = double(kernel);
kernel = kernel / 273;

I_new = zeros(size(img)); %create pure black new image with the size of input image.

%Convolution
k = 2;
for i = k+1 : (row -k)
    for j = 3 : (col -k)
        %subimage creation
        sub_img = img(i-k:i+k,j-k:j+k);
        
        %convolution
        % M.*W where M is the subimage and W is the kernel
        I_new(i,j) = sum(sum(sub_img.*kernel));
    end
end

%Display
figure;
subplot(2,2,1), imshow(uint8(img)), title('Original Grayscale Image');
subplot(2,2,3), imhist(uint8(img)), title('Histogram of Original Grayscaled Image');
subplot(2,2,2), imshow(uint8(I_new)), title('Gaussian Smoothed Version');
subplot(2,2,4), imhist(uint8(I_new)), title('Histogram of Smoothed Image');

end