function [] = weiner_restoration(filename, k)
% Plot different plots according to slider location.
im = read_image('images/cameraman.tif');

% Get blurring kernels
mb = fspecial('motion',200,45);


% Apply blurring kernels to image
im_mb = imfilter(im,mb,'circular');%Circular convolution to prevent boundary propogation?


% Apply white (gaussian) noise to blurred image
signal_noise_ratio = 50; %bigger = more signal less noise
im_mb = awgn(im_mb,signal_noise_ratio,'measured');


% Fourier transform of blurred image
im_mb_ft = fft2(im_mb);


%PSF-->OTF of blurring kernel
h_mb_ft  = psf2otf(mb,size(im));


%Repair images with weiner filter
k = 0.000003;
g_mb_ft = wiener_approx(h_mb_ft, im_mb_ft, k);


%Inverse FT of filtered image
g_mb = ifft2(g_mb_ft);


% Draw Images
figure,
subplot(2,3,1);
imshow(im); title('Original image');
subplot(2,3,2);
imshow(im_mb); title('Motion Blur');

subplot(2,3,5);
imshow(g_mb); title('Weinered Motion Blur');
      
S.sl = uicontrol('style','slide',...
                 'unit','pix',...
                 'position',[20 10 260 30],...
                 'min',1,'max',10,'val',1,...
                 'sliderstep',[1/20 1/20],...
                 'callback',{@sl_call,S});  
function [] = sl_call(varargin)
% Callback for the slider.
[h,S] = varargin{[1,3]};  % calling handle and data structure.
set(S.LN,'ydata',S.x.^get(h,'value'))