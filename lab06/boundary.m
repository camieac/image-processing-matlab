% boundary detection

clear all;close all;

rice = imread('images/rice.png');
r = (rice>130);
se = ones(3,3);
re = imerode(r,se);
rb = r&~re;
figure,
subplot(1,2,1),imshow(r),title('original bw image')
subplot(1,2,2),imshow(rb),title('boundary detected')