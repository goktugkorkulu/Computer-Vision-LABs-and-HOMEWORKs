function I_new = lab1locbox(I, W)
[row,col,ch] = size(I);

if(ch == 3) %if the image id rgb
    I = rgb2gray(I);
end

I = double(I);

I_new = zeros(size(I));

k = (W-1)/2;

for i = (k+1):(row -k -1)
    for j = (k+1):(col -k -1)

        sub_Img = I(i-k:i+k, j-k:j+k); % crops the image by window size centered at I(i,j).
        
        I_new(i,j) = sum(sum(sub_Img))  /  ((2*k+1)^2);
    end
end

figure;

subplot(1,2,1), imshow(uint8(I)), title('original grayscaled image');
subplot(1,2,2), imshow(uint8(I_new)), title('filtered image');


end