function I_new = lab2log(img)

%Grayscaling Process
[row,col,ch] = size(img);
if (ch == 3)
    img = rgb2gray(img);
end

%doubling
img = double(img);

%kernel to be convolved with the image
kernel = [0 1 0; 1 -4 1; 0 1 0];

%convolutions
k=1;
I_new = zeros(size(img));
for i = k+1 : (row-k)
    for j = k+1 : (col-k)
        %subimage
        sub_img_v = img(i-k:i+k, j-k:j+k);

        %convolution
        I_new(i,j) = sum(sum(sub_img_v .* kernel));
    end
end


%Display
figure;
subplot(1,3,1), imshow(uint8(img)), title('Original Grayscaled Image');
%subplot(1,3,2), imshow(uint8(I_new)), title("LoG applied Image");
subplot(1,3,2), imshow(I_new, []), title("LoG applied Image");
subplot(1,3,3), plot(I_new(130, 30:60));
%disp(Im2(190:200,320:330));

end