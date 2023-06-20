function I_new = lab2prewitt(img, th)

%Grayscaling Process
[row,col,ch] = size(img);
if(ch == 3)
    img = rgb2gray(img);
end

%doubling
img = double(img);

%kernel to be convolved with the image
x_filter = [-1 0 1; -1 0 1; -1 0 1];
x_filter = double(x_filter);

y_filter = [-1 -1 -1; 0 0 0; 1 1 1];
y_filter = double(y_filter);

% convolutions
k = 1;
% horizontal gradient
I_new_h = zeros(size(img));
for i = k+1 : (row-k)
    for j = k+1 : (col-k)
        %subimage creation
        sub_img_h = img(i-k:i+k , j-k:j+k);

        %convolution
        I_new_h(i,j) = sum(sum(sub_img_h .* x_filter));
    end
end

% vertical gradient
I_new_v = zeros(size(img));
for i = k+1 : (row-k)
    for j = k+1 : (col-k)
        %subimage creation
        sub_img_v = img(i-k:i+k , j-k:j+k);

        %convolution
        I_new_v(i,j) = sum(sum(sub_img_v .* y_filter)); 
    end
end

%GRADIENT
%creation of gradient image
I_new_grad = sqrt(I_new_v.^2 + I_new_h.^2);

%applying treshold to the gradient image
%Binarized Image
I_new = zeros(size(img));
for p = 1 : row
    for q = 1 : col
        if (I_new_grad(p,q) < th)
            I_new(p,q) = 0;
        else
            I_new(p,q) = 255;
        end
    end
end


%Displays
figure;
subplot(3,1,1), imshow(uint8(img)), title('Original Grayscaled Image');
subplot(3,2,3), imshow(uint8(I_new_h)), title('X Filtered Image with Prewitt');
subplot(3,2,4), imshow(uint8(I_new_v)), title('Y Filtered Image with Prewitt');
subplot(3,2,5), imshow(uint8(I_new_grad)), title('Prewitt Gradient Image');
subplot(3,2,6), imshow(uint8(I_new)), title("Binarized Image with Prewitt");

end
