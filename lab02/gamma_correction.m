x = imread('images/lena.png');
x = im2double(x); % im2double makes image range 0..1 

figure,
subplot(1,2,1); 
imshow(x); title('Original image');
subplot(1,2,2); 
imhist(x), axis tight; title('its histogram');

gamma = 0.5;
y = imadjust(x,[],[],gamma);
figure,
subplot(1,2,1); 
imshow(y); title('gamma-correction with gamma<1');
subplot(1,2,2); 
imhist(y), axis tight; 

gamma = 5;
y = imadjust(x,[],[],gamma);
figure,
subplot(1,2,1); 
imshow(y); title('gamma-correction with gamma>1');
subplot(1,2,2); 
imhist(y), axis tight;
