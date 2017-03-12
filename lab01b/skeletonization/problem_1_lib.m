% File: problem_1.m
% Description: Uses built-in fucntion to visually verify our algorithm.
% Authors: Cameron a. Craig & Stuart J.Thain
% Date: 12 March 2017

images = { ...
    'images/human.tif', ...
    'images/mapleleaf.tif', ...
    'images/lincoln_from_penny.tif', ...
    'images/square.tif', ...
    'images/triangle.tif' ...
};

for idx = 1:numel(images)
    image = char(images(idx));
    
    % Calculate the skeleton image of originsl
    original = im2double(imread(image));
    skeleton = bwmorph(original,'skel',Inf);

    % Draw the original and skeleton images
    figure('Name', image)
    subplot(1, 2, 1);
    imshow(original);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(skeleton);
    title('Skeleton Image');
    

    image
    pause;
end



