
close all; clear all; clc;

im = im2double(imread('images/trui.tif'));

[rows, cols] = size(im);
im1 = im;
im2 = zeros(rows, cols);

N = 10; % number of iterations

for k = 1 : N % iterations

  for x = 2 : rows - 1;
    for y = 2 : rows - 1; % for each inner pixel
        
      for i = -1 : 1  
        for j = -1 : 1
         im2(x,y) = im2(x,y) + im1(x+i,y+j); 
        end 
      end
      
      im2(x,y) = im2(x,y)./9;
      
    end
  end

  im1 = im2;
  im2 = zeros(rows, cols);

end

figure, imshow(im1);
