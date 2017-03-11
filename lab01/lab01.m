
close all; clear all; clc;

im = im2double(imread('images/trui.tif'));

[rows, cols] = size(im);
im1 = im; %original unmodified image
im2 = zeros(rows, cols); %image to be processed

N = 50;  %number of iterations,
K = 100;   %constant

for k = 1 : N % iterations
  for x = 2 : rows - 1;
    for y = 2 : rows - 1; % for each inner pixel
      sum1 = 0; %sum of w
      sum2 = 0; %sum of w * im1(...)
      for i = -1 : 1  
        for j = -1 : 1
         w = exp(-K * abs(im1(x, y) - im1(x + i, y + j)));
         sum1 = sum1 + w * im1(x + i, y + j);
         sum2 = sum2 + w;        
        end 
      end
      im2(x,y) = sum1 / sum2;
    end
  end
  im1 = im2;
  im2 = zeros(rows, cols);
end

%figure, imshow(im);
figure, imshow(im1);
