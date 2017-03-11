% opening and closing

clear all;close all;

c = imread('images/circles.png');
x = rand(size(c));
d1 = find(x<0.05);
d2 = find(x>0.95);
c(d1) = 0;
c(d2) = 1;
figure,imshow(c),title('original');

se1 = ones(3,3);
cf1 = imclose(imopen(c,se1),se1);
figure,imshow(cf1),title('filtered with ones(3,3) se');

se2 = [0 1 0 ; 1 1 1 ; 0 1 0];
cf2 = imclose(imopen(c,se2),se2);
figure,imshow(cf2),title('filtered with cross se');
