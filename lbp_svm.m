 
clear all
clc
%Detect objects using Viola-Jones Algorithm

%To detect Face
FDetect = vision.CascadeObjectDetector;

%Read the input image
I = imread('G:\2.jpg');

%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);

figure,
for i = 1:size(BB,1)
a= BB(i,:);
imshow(I(a(1,1):(a(1,1)+a(1,3)),a(1,2):(a(1,2)+a(1,4))));
end
title('Face Detection');
hold off;