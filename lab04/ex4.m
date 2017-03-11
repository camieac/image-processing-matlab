im1 = im2double(imread('images/cameraman.tif'));
im2 = im2double(imread('images/newborn.tif'));

im1_ft = fftshift(fft2(im1));
im2_ft = fftshift(fft2(im2));

mag1 = abs(im1_ft); phase1 = angle(im1_ft);
mag2 = abs(im2_ft); phase2 = angle(im2_ft);

%Swap mag and phase in freq domain
m1p2_f = mag1.*exp(1i*phase2);
m2p1_f = mag2.*exp(1i*phase1);

% Reverse FFT
m1p2_im = ifft2(m1p2_f);
m2p1_im = ifft2(m2p1_f);

% Draw Images
figure,
subplot(3,3,1);
imshow(im1); title('Image #1');
subplot(3,3,2);
imshow(mag1); title('Image #1 Mag')
subplot(3,3,3);
imshow(phase1); title('Image #1 Phase')
subplot(3,3,4);
imshow(im2); title('Image #2');
subplot(3,3,5);
imshow(mag2); title('Image #2 Mag')
subplot(3,3,6);
imshow(phase2); title('Image #2 Phase')

subplot(3,3,7);
imshow(m1p2_im); title('Image #1 Mag  #2 Phase')

subplot(3,3,9);
imshow(m2p1_im); title('Image #2 Mag #1 Phase')

