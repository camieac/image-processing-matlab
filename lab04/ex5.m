% Start with original image
im = read_image('images/cameraman.tif');

% Get blurring kernels
mb = fspecial('motion',200,45);
gb = fspecial('gaussian',[5 5],2);

% Apply blurring kernels to image
im_mb = imfilter(im,mb,'circular');%Circular convolution to prevent boundary propogation?
im_gb = imfilter(im,gb,'circular');%Circular convolution to prevent boundary propogation?

% Apply white (gaussian) noise to blurred image
signal_noise_ratio = 50; %bigger = more signal less noise
im_mb = awgn(im_mb,signal_noise_ratio,'measured');
im_gb = awgn(im_gb,signal_noise_ratio,'measured');

% Fourier transform of blurred image
im_mb_ft = fft2(im_mb);
im_gb_ft = fft2(im_gb);

%PSF-->OTF of blurring kernel
h_mb_ft = psf2otf(mb, size(im));
h_gb_ft = psf2otf(gb, size(im));

%Repair images with weiner filter
k = 0.000003;
g_mb_ft = wiener_approx(h_mb_ft, im_mb_ft, k);
g_gb_ft = wiener_approx(h_gb_ft, im_gb_ft, k);

%Inverse FT of filtered image
g_mb = ifft2(g_mb_ft);
g_gb = ifft2(g_gb_ft);

% Draw Images
figure,
subplot(2,3,1);
imshow(im); title('Original image');
subplot(2,3,2);
imshow(im_mb); title('Motion Blur');
subplot(2,3,3);
imshow(im_gb); title('Gaussian Blur');

subplot(2,3,5);
imshow(g_mb); title('Weinered Motion Blur');
subplot(2,3,6);
imshow(g_gb); title('Weinered Gaussian Blur');

%weiner_restoration('images/cameraman.tif', 0.000003);