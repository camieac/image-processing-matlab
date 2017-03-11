
clear all;close all;

im = imread('images/text.tiff');
se = ones(3,3);
imd = imdilate(im,se); % dilation

figure,
subplot(1,2,1),imshow(im),title('original')
subplot(1,2,2), imshow(imd),title('dilated')