% histogram-based image segmentation
close all; clear all; clc;

im=imread('rice.png');
% n=imread('coins.png');
figure,imshow(im),title('original image');
bw1 = im2bw(im,0.2);
bw2 = im2bw(im,0.6);
figure,imshow(bw1);
figure,imshow(bw2);

% automatic thresholding by Otsu method
t = graythresh(im)
figure,imshow(im2bw(im,t)),title('Otsu method');