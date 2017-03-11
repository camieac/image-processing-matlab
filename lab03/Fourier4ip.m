clear all; close all; clc;

[x,y]=meshgrid(-128:127,-128:127);
z = sqrt(x.^2+y.^2);

c = (z<15);
cf = fftshift(fft2(c));
figure,
subplot(1,2,1),imshow(c); title('a disk')
subplot(1,2,2),fftshow(cf,'log'),title('its Fourier transfrom')

b = 1./(1+(z./15).^2);
bf = fftshift(fft2(b));
figure,
subplot(1,2,1),imshow(b);
subplot(1,2,2),fftshow(bf,'log'),title('Fourier transfrom')

im=im2double(imread('images/cameraman.tif'));
size(im)
imf = fftshift(fft2(im));
mag = abs(imf); phase = angle(imf);
figure, imshow([im,0.1*(1+log(mag)),phase]),
title('an image (left), its Fourier transform magnitude (middle), its Fourier transform phase (right)');

% 
figure,
subplot(1,2,1),imshow(im),title('an image');
subplot(1,2,2),fftshow(imf,'log'),title('its Fourier transfrom');
% to be decomposed into low-freq, middle-freq and high-freq parts
%
lf = (z<15);
figure,
subplot(1,2,1),fftshow(imf.*lf,'log'),
subplot(1,2,2),fftshow(ifft2(imf.*lf),'abs')
title('low frequencies');
%
mf = (z>15)&(z<50);
figure,
subplot(1,2,1),fftshow(imf.*mf,'log'),
subplot(1,2,2),fftshow(ifft2(imf.*mf),'abs'),
title('middle-range frequencies');
%
hf = (z>50);
figure,
subplot(1,2,1),fftshow(imf.*hf,'log'),
subplot(1,2,2),fftshow(ifft2(imf.*hf),'abs'),
title('high frequencies');

% Gaussian low-pass filtering
g = fspecial('gaussian',256,20); % volume under Gaussian = 1
maxGaussian = max(g(:)) % therefore the max value of Gaussian is small
g1 = mat2gray(g);
max(g1(:)) % now the max value = 1 
figure,
subplot(1,2,1),fftshow(imf.*g1,'log'),
subplot(1,2,2),fftshow(ifft2(imf.*g1),'abs'),
title('Gaussian smoothing');

% Boosting high frequences
im=im2double(imread('images/lena.png'));
size(im)
g2 = mat2gray(fspecial('gaussian',512,5)); 
imf = fftshift(fft2(im));
figure,
subplot(1,2,1),imshow(im),title('original image');
subplot(1,2,2),fftshow(ifft2(imf.*g2+imf.*(1-g2)*1.5),'abs'),
title('boosting high frequences');

