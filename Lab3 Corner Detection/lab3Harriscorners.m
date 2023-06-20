function [C] = lab3Harriscorners (I, k, T)


[row,col,ch] = size(I);
if (ch == 3)
    I = rgb2gray(I);
end
I = double(I);


%Step 1: smoothen the greyscaled image with Gaussian filter.
I_smoothed = imgaussfilt(I);

%Step 2: compute image gradients
[Ix, Iy] = imgradientxy(I_smoothed);

%initialize the array which keeps the corner values inside.
C=[];


for i = (k+1):(2*k+1):(row-k)
    for j = (k+1):(2*k+1):(col-k)

        sub_img_x = Ix(i-k:i+k, j-k:j+k);
        sub_img_y = Iy(i-k:i+k, j-k:j+k);

        %Step 3: corner matrix H
        H = [sum(sum(sub_img_x.*sub_img_x)) sum(sum(sub_img_x.*sub_img_y)); sum(sum(sub_img_x.*sub_img_y)) sum(sum(sub_img_y.*sub_img_y))];

        %Step 4: compute f
        f = det(H)/trace(H);

        %if f is greater than the threshold
        if (f > T)
            C = [C; i j];
        end
    end
end

end