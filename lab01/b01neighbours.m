% simple averaging
x = imread('images/cameraman.tif');

m = [ 1  1  1 ; 
      1  1  1 ; 
      1  1  1 ]./9;
y=x;  
for i=1:10,
    y =imfilter(y,m);
end
 
z=x+1.5.*(x-y);

figure, 
subplot(1,3,1); 
imshow(x); title('original');
subplot(1,3,2); 
imshow(y), title('smoothed (blured)');
subplot(1,3,3); 
imshow(z), title('sharpened');
