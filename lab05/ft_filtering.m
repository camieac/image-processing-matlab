clear all,
close all;

x = im2double(imread('cameraman.tif'));


M1 = [ 0 0 1 0 0; 
       0 1 1 1 0; 
       1 1 1 1 1; 
       0 1 1 1 0;
       0 0 1 0 0]./13;

M2 = ones(5)./25;
M3 = ones(7)./49;

xf = fftshift(fft2(x));
figure, fftshow(xf,'log'),title('Fourier transfrom');

y1=imfilter(x,M1);
yf1 = fftshift(fft2(y1));
figure, fftshow(yf1,'log'),title('M1 is applied');

y2=imfilter(x,M2);
yf2=fftshift(fft2(y2));
figure, fftshow(yf2,'log'),title('M2 is applied');

y3=imfilter(x,M3);
yf3=fftshift(fft2(y3));
figure, fftshow(yf3,'log'),title('M3 is applied');