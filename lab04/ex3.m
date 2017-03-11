im = imread('images/barbara.tif');
rows, cols = size(im);

%# Create the gaussian filter with hsize = [5 5] and sigma = 2
G = fspecial('gaussian',[5 5],2);
Ig = imfilter(im,G,'same');

sampled_orig = im(1:3:end,1:3:end);
sampled_smoothed = Ig(1:3:end,1:3:end);

% Draw Images
figure,
subplot(2,2,1);
imshow(im); title('Original image');
subplot(2,2,2);
imshow(Ig); title('Smoothed image');
subplot(2,2,3);
imshow(sampled_orig); title('Downsampled Original')
subplot(2,2,4);
imshow(sampled_smoothed); title('Downsampled Smoothed')


