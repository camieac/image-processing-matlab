% greyscale images

disp('Demo to show pixel values and coordinates for different image formats')

disp('hover your mouse on the image to see pixel coords and values')
disp('press a key to continue')
im1=imread('images/cameraman.tif');
figure,imshow(im1),impixelinfo %pixval on
im1(30,51)
im1(51,30)
pause

% color image
disp('hover your mouse on the image to pixel location 100,200 and check the RGB value')
disp('press a key to continue')
im2=imread('images/Baboon.tif');
figure,imshow(im2),impixelinfo %pixval on

% RGB values at a given location 
disp('Color indices ')
squeeze(im2(100,200,1:3))'
disp('RGB mapped colors ')
impixel(im2,100,200)

pause

% indexed color images
disp('hover your mouse on the image to see pixel coords and values')
disp('press a key to continue')
figure,imshow('images/emu.tif'),impixelinfo %pixval on
im3=imread('images/emu.tif');
figure,imshow(im3),impixelinfo%pixval on
pause
[im3,im3map]=imread('images/emu.tif');
figure,imshow(im3,im3map),impixelinfo %pixval on

% information about image 
imfinfo('images/emu.tif')
pause
imfinfo('images/Baboon.tif')