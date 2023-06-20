img = imread("Image/object.jpeg");

%convert to gray-scale
[~,~,ch] = size(img);
if (ch==3)
    img = rgb2gray(img);
end

img_corners = corner(img, 'harris');

% figure;
% imshow(img);
% hold on;
% plot(img_corners(:,1), img_corners(:,2), 's', 'MarkerSize', 4, 'MarkerEdgeColor', 'blue', 'LineWidth', 1);

%% insert image points
%first 30 image coordinates on the right plane
Image_cord_Harris = [855; 1627; 1];
new_corner = [955 ; 1587; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1042 ; 1549; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1117 ; 1519; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1186 ; 1488; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [855 ; 1471; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [956 ; 1439; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1041 ; 1414; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1119 ; 1390; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1186 ; 1368; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [855 ; 1314; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [954 ; 1293; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1043 ; 1275; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1122 ; 1260; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1191 ; 1245; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [855 ; 1158; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [955 ; 1146; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1044 ; 1139; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1124 ; 1130; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1191 ; 1124; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [858 ; 1003; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [959 ; 1003; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1047 ; 1002; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1126 ; 1002; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1194 ; 1001; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [863 ; 848; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [964 ; 856; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1049 ; 865; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1127 ; 871; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [1197 ; 879; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];

%other 30 image points on the left plane
new_corner = [635 ; 1628; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [541 ; 1585; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [461 ; 1550; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [390 ; 1517; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [328 ; 1489; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
%-----
new_corner = [635 ; 1472; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [540 ; 1439; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [459 ; 1413; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [387 ; 1387; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [325 ; 1367; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
%-----
new_corner = [636 ; 1316; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [540 ; 1293; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [460 ; 1276; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [389 ; 1260; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [324 ; 1245; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
%-----
new_corner = [635 ; 1160; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [540 ; 1148; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [461 ; 1139; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [388 ; 1131; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [325 ; 1124; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
%-----
new_corner = [635 ; 1006; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [541 ; 1004; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [459 ; 1004; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [389 ; 1003; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [323 ; 1002; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
%-----
new_corner = [634 ; 851; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [539 ; 860; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [458 ; 867; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [386 ; 874; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];
new_corner = [319 ; 881; 1];
Image_cord_Harris = [Image_cord_Harris new_corner];

%% insert world frames
World_cord = [];
for z=1:6
    for x=1:5
        new_corner = [x*36 ; 0; z*36; 1];
        World_cord = [World_cord new_corner];
    end
end


for z=1:6
    for y=1:5
        new_corner = [0 ; y*36; z*36; 1];
        World_cord = [World_cord new_corner];
    end
end

%% creating matrix A
A = [];
for k = 1:60
    A = [A; transpose(World_cord(:,k)) 0 0 0 0 -Image_cord_Harris(1,k)*transpose(World_cord(:,k)); 0 0 0 0 transpose(World_cord(:,k)) -Image_cord_Harris(2,k)*transpose(World_cord(:,k))];
end

%% eigenvector
[v,d] = eigs(transpose(A)*A);
projection_matrix = v(:,1);

%% 
%a = estimateCameraMatrix(transpose(Image_cord_Harris(1:2,:)), transpose(World_cord(1:3,:)));
B = [projection_matrix(1,1) projection_matrix(2,1) projection_matrix(3,1); projection_matrix(5,1) projection_matrix(6,1) projection_matrix(7,1); projection_matrix(9,1) projection_matrix(10,1) projection_matrix(11,1)];
[R_inv,K_inv] = qr(B^(-1));

R = R_inv^(-1);
K = K_inv^(-1);
temp = [projection_matrix(4,1); projection_matrix(8,1);projection_matrix(12,1)];
t = (K^(-1))*temp;
