clear all; close all;

A=im2double(imread('images/enamel.tif'));
figure(1),imshow(A);                                %Read in image and display
pause(2); 
bw=~im2bw(A,0.35); bw = imfill(bw,'holes');         %Threshold and fill in holes
figure(2),imshow(bw);                               %Display resulting binary image
pause(2); 

[L,num_0]=bwlabel(bw);                              %Label and count number of objects
                                                    %in binary image
se=strel('disk',2);                                 %Define structuring element, radius=2
count =0;                                           %Set number of erosions = 0      
num=num_0;                                          %initialise number of objects in image

while num>0                                         %Begin iterative erosion 
count=count+1
    bw=imerode(bw,se);                              %Erode
    [L,num]=bwlabel(bw);                            %Count and label objects
    P(count)=num_0-num;                             %Build discrete distribution
    figure(2); imshow(bw); drawnow;                 %Display eroded binary image
    pause(0.2);  
end

figure,subplot(1,2,1),plot(0:count,[0 P],'ro');     %Plot Cumulative distribution
axis square;axis([0 count 0 max(P)]);               %Force square axis
xlabel('Size'); ylabel('Particles removed')         %Label axes 
subplot(1,2,2),plot(diff([0 P]),'k*'); axis square; %Plot estimated size density function
