function houghline(image,r,theta)
%
% Alasdair McAndrew
% Introduction to Digital Image Processing with MATLAB
%
% Draws a line at perpendicular distance R from the upper left corner of the
% current figure, with perpendicular angle THETA to the left vertical axis.
% THETA is assumed to be in degrees.
%
[x,y]=size(image);
angle=pi*(181-theta)/180;
X=[1:x];
if sin(angle)==0
line([r r],[0,y],'Color','black')
else
line([0,y],[r/sin(angle),(r-y*cos(angle))/sin(angle)],'Color','black')
end;