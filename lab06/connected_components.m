% connected components

clear all; close all;

x = imread('images/nicework.tiff');
figure,imshow(x),title('original image');

se1 = ones(3,3);
xc1 = components(x,[57,97],se1);
figure,imshow(xc1);

se2 = ones(11,11);
xc2 = components(x,[57,97],se2);
figure,imshow(xc2);