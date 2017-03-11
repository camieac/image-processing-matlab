close all
clear all

im=imread('cameraman.tif');
edges=edge(im,'canny');

figure,imshow(edges),title('Canny edge map');

ht=HoughTransform(im);

figure,imshow(mat2gray(ht)*1.5),title('Hough transform');

[r,theta]=find(ht>80)
s=size(r);
n = s(1);


im2=imadd(imdivide(im,4),192);

figure,
imshow(im2),
houghline(im,r(n),theta(n)),
houghline(im,r(n-5),theta(n-5)),
title('two strong straight lines');
