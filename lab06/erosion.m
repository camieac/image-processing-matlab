
clear all;close all;

im = imread('images/circbw.tif');
se = ones(3,3); % try se of a bigger size
ime = imerode(im,se); % erosion

figure,
subplot(1,2,1),imshow(im),title('original');
subplot(1,2,2),imshow(ime),title('eroded');