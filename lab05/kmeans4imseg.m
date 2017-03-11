% k-means clustering for image segmentation
close all; clear all; clc;

number_clusters = 10;

im = im2double(imread('cameraman.tif'));

% 
[idx centroids] = kmeans(double(im(:)), number_clusters);
imseg = zeros(size(im,1),size(im,2));
for i = 1:max(idx)
    imseg(idx == i) = i;
end

% Display image using full range of colours gaussian
imagesc(imseg)