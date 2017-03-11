% region filling

clear all;close all;

x = imread('images/nicework.tiff');
figure,imshow(x),title('original image');

se = ones(3,3);
xb = x&~imerode(x,se);
figure,imshow(xb),title('boundary');

xf = regfill(xb,[74,52],se);
figure,imshow(xf|xb);