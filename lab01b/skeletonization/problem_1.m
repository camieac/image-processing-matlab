% File: problem_1.m
% Description: Display skeletons of various images.
% Authors: Cameron a. Craig & Stuart J.Thain
% Date: 11 March 2017

images = { ...
    'images/human.tif', ...
    'images/mapleleaf.tif', ...
    'images/lincoln_from_penny.tif', ...
    'images/square.tif', ...
    'images/triangle.tif', ...
    'images/bone.tif', ...
    'images/noisy_stroke.tif' ...
};

for idx = 1:numel(images)
    image = char(images(idx));
    
    % Calculate the skeleton image of originsl
    [original, skeleton, iterations, time] = skeletonise(image);
    % close all;

    % Draw the original and skeleton images
    figure('Name', image)
    subplot(1, 2, 1);
    imshow(original);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(skeleton);
    title('Skeleton Image');
    

    image
    iterations
    time
    pause;
end



