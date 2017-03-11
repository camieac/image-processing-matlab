clear

BW = [1     1     1     0     0     0     0     0
      1     1     1     0     1     1     0     0
      1     1     1     0     1     1     0     0
      1     1     1     0     0     0     1     0
      1     1     1     0     0     0     1     0
      1     1     1     0     0     0     1     0
      1     1     1     0     0     1     1     0
      1     1     1     0     0     0     0     0];
      
L4 = bwlabel(BW,4)
L8 = bwlabel(BW,8)

BW = imread('circles.png');
imshow(BW);
% computing the Euler number for the binary image BW
% 8-connectivity is assumed
bweuler(BW,8)