clear all
close all

% Read image
original_image = imread('../images/chromosome_2.jpg');
figure, imshow(original_image);

% Invert the image
inverted_image = 1 - im2double(original_image);
blurring_kernel = fspecial('gaussian',25,15);
blurred_image = imfilter(inverted_image,blurring_kernel,'replicate');
figure, imshow(blurred_image);

% Convert to binary image
binary_image = im2bw(blurred_image,1.7*graythresh(blurred_image));
figure, imshow(binary_image);

% Generate skeleton
skeleton_image = bwmorph(binary_image,'skel',Inf);
figure, imshow(skeleton_image);

% Generate spur
s1 = bwmorph(skeleton_image,'spur',25);
figure, imshow(s1); 