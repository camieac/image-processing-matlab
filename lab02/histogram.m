x = imread('pout.tif');
figure,
subplot(1,2,1); 
imshow(x); title('Original image');
subplot(1,2,2); 
imhist(x), axis tight; title('its histogram');

y = imadjust(x);
figure,
subplot(1,2,1); 
imshow(y); title('contrast improved by imajust');
subplot(1,2,2); 
imhist(y), axis tight; 

z = histeq(x);
figure,
subplot(1,2,1); 
imshow(z); title('contrast improved by histeq');
subplot(1,2,2); 
imhist(z), axis tight; 

alpha=0.5;
M = [ -alpha   alpha-1  -alpha ; 
      alpha-1  alpha+5  alpha-1 ; 
      -alpha   alpha-1  -alpha]./(alpha+1);
    
z =imfilter(x,M) ;
figure, 
subplot(1,2,1); 
imshow(z); title('unsharp masking');
subplot(1,2,2); 
imhist(z), axis tight; 