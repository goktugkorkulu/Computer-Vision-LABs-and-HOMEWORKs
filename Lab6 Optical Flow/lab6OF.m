function lab6OF(ImPrev,ImCurr,k,Threshold)

%% Smooth the input images using a Box filter (+ Gaussian filter for postlab)
ImPrev = double(ImPrev);
ImCurr = double(ImCurr);

kernel = 1/9 * [1 1 1; 1 1 1; 1 1 1];
ImPrev = conv2(ImPrev, kernel, 'same');
ImCurr = conv2(ImCurr, kernel, 'same');

% ImPrev = imgaussfilt(ImPrev);
% ImCurr = imgaussfilt(ImCurr);


% figure;
% subplot(2,3,1),imshow (uint8(ImPrev)), title("Before smoothing ImPrev");
% subplot(2,3,4),imshow (uint8(ImPrev)), title("Before smoothing ImPrev");
% subplot(2,3,2),imshow (uint8(ImPrev_box)), title("After smoothing(Box) ImPrev");
% subplot(2,3,5),imshow (uint8(ImCurr_box)), title("After smoothing(Box) ImCurr");
% subplot(2,3,3),imshow (uint8(ImPrev_gaus)), title("After smoothing(Gauss) ImPrev");
% subplot(2,3,6),imshow (uint8(ImCurr_gaus)), title("After smoothing(Gauss) ImCurr");

%% Calculate spatial gradients (Ix, Iy) using Prewitt filter 
[Ix, Iy] = imgradientxy(ImPrev,'Prewitt');
Ix = -Ix;
Iy = -Iy;
%% Calculate temporal (It) gradient
It = ImPrev - ImCurr;

%%
[ydim,xdim] = size(ImCurr);
u = zeros(ydim,xdim);
v = zeros(ydim,xdim);
G = zeros(2,2);
b = zeros(2,1);
cx=k+1;
for x=k+1:k:xdim-k-1
    cy=k+1;
    for y=k+1:k:ydim-k-1
        %% Calculate the elements of G and b
        G = [sum(sum(Ix(y-k:y+k, x-k:x+k).^2)) sum(sum(Ix(y-k:y+k, x-k:x+k).*Iy(y-k:y+k, x-k:x+k)));
            sum(sum(Ix(y-k:y+k, x-k:x+k).*Iy(y-k:y+k, x-k:x+k))) sum(sum(Iy(y-k:y+k, x-k:x+k).^2))];

        b = [sum(sum(Ix(y-k:y+k, x-k:x+k).*It(y-k:y+k, x-k:x+k))); sum(sum(Iy(y-k:y+k, x-k:x+k).*It(y-k:y+k, x-k:x+k)))];

        eigenvalues = eigs(G);

        %%
        if (min(eigenvalues) < Threshold) 
            u(cy,cx)=0;
            v(cy,cx)=0;
        else
            %% Calculate (u,v)
            OF = (-1)*(G^(-1))*b;
            u(cy,cx)=OF(1); 
            v(cy,cx)=OF(2);

            %%
        end
        cy=cy+k;
    end
    cx=cx+k;
end

cla reset;
imagesc(ImPrev); hold on;
[xramp,yramp] = meshgrid(1:1:xdim,1:1:ydim); quiver(xramp,yramp,u,v,10,"r");
colormap gray;
end