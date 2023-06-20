%% Step 1: load the faces.mat matrix and 
% display the faces for visualization purposes
clear all; close all; clc;

face = load('Lab9 - Images/faces.mat').faces;
plot_face = reshape(face(:, 1:40), [56,46,1,40]);
montage(plot_face);
face = double(face);
test_face = [];
train_face = [];
k=1;

for i= 1:400

    if mod(i,10)==0
        test_face = [test_face, face(:,i)];
    else
        train_face = [train_face, face(:,i)];
    end

end

plot_face = reshape(uint8(train_face), [56,46,1,360]);
montage(plot_face);

%% Step 2: mean face of all
mean_face = mean(test_face,2);
figure;
imshow(uint8(reshape(mean_face,56, 46)));

%% Step 3: Subtract mean from the dataset train_face and Compute A = S2*S2'
Horse = train_face - mean_face;
A = Horse*Horse';

%% Step 4: compute  and plot eigenvectors.
[V,D] = eigs(A, 400);

plot(diag(D), 'LineWidth',1.5);

%% Step 5: 
%I selected k=50 so that;
V = V(:,1:50);

figure 
for i=1:12
    subplot(2,6,i);
    imshow(reshape(V(:,i),56,46),[]);
    colormap(gray);
end



%% Step 6: Face detection
test1 = test_face(:,23); %any number between 1-40


a_weights = (test1-mean_face)'*V;
test1_recovered = (mean_face + V*a_weights');


err = immse(test1_recovered, test1);
Threshold = 250; %sth more than 197
if err < Threshold
    disp('It is a face')
end

figure;
subplot(1,2,1),imshow(uint8(reshape(test1_recovered, [56, 46])));
subplot(1,2,2),imshow(uint8(reshape(test1, [56, 46])));

%% Step 7: Face Recognition
test2 = test_face(:,23);
test2_weights = (test2 - mean_face)'*V;
test2_recovered = (mean_face + V*test2_weights');
err=[];

weights = (train_face - mean_face)'*V;


for i = 1:length(weights)
    err(i) = norm(test2_weights - weights(i,:));
end
err_min = min(err);
ind = find(err_min == err);

figure;
subplot(1,2,2), imshow(uint8(reshape(train_face(:,ind), 56, 46)));
subplot(1,2,1), imshow(uint8(reshape(test2, 56, 46)));







