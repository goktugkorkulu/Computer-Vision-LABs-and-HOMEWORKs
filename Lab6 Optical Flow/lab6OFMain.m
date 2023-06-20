%clear all; close all; clc;

%% Load the files given in SUCourse as Seq variable
% load('Lab6 - Videos/rubic.mat');
% Seq = rubic;

load('Lab6 - Videos/traffic.mat');
Seq = traffic;

% load('Lab6 - Videos/taxi.mat');
% Seq = taxi;

% load('Lab6 - Videos/sphere.mat');
% Seq = sphere;

% load('Lab6 - Videos/cars1.mat');
% Seq = cars1;

% load('Lab6 - Videos/cars2.mat');
% Seq = cars2;

[row,col,num]=size(Seq);

%% Define k and Threshold
%-----for rubic-------
% k=15;
% Threshold = 3000;

% -----for traffic------
k=10;
Threshold = 100000;

%-----for taxi------
% k=15;
% Threshold = 1000000;

%-----for sphere------
% k=10;
% Threshold = 10000;

%-----for sphere------
% k=10;
% Threshold = 100000;

%-----for sphere------
% k=10;
% Threshold = 100000;
%%
for j=2:1:num
         ImPrev = Seq(:,:,j-1);
         ImCurr = Seq(:,:,j);
         lab6OF(ImPrev,ImCurr,k,Threshold);
         pause(0.1);
end