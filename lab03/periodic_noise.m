clear all; close all; clc;
a = imread('cameraman.tif');

[ht,wd] = size(a);
[x,y] = meshgrid(1:ht,1:wd);

% Create a periodic noise function
p = sin(x/3+y/5)+1;
figure('Name','periodic noise'),imshow(p);

% Shift zero-frequency component to center of spectrum, display
q = fftshift(fft2(p));
figure('Name','dft(noise)'),fftshow(q,'log');

% Add the periodic noise to the image
b = (im2double(a)+p)./2;
figure('Name','corrupted image'),imshow(b);

% Display the FFT of the noisy image, display
f = fftshift(fft2(b));
figure('Name','dft'),fftshow(f,'log');

% Mask out the periodic noise frequencies
f(:,115)=0;f(:,116)=0;
f(:,142)=0;f(:,143)=0;
f(120,:)=0;f(121,:)=0;
f(137,:)=0;f(138,:)=0;

box = 40;
c = ht/2;
disp c;
for x = c - box : c + box;
  for y = ht - box : c + box; % for each inner pixel
       f(x,y) = 0;
  end
end

figure('Name','dft'),fftshow(f,'log');
figure('Name','restored image'),fftshow(ifft2(f),'abs')

