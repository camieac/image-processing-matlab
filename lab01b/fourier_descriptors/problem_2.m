% File: problem_2.m
% Description: Display fourier descriptors of various images.
% Authors: Cameron a. Craig & Stuart J.Thain
% Date: 11 March 2017
clear all;
images = { ...
    {'images/electron_micrograph_of_a_human_chromosome.jpg', 128}, ...
    %{'images/electron_micrograph_of_a_rove_beetle_bw.jpg', 128}, ...
    %{'images/human.jpg', 128}, ...
};

for idx = 1:numel(images)
   
    image = char(images{idx}(1));
    num_desc = images{idx}{2}
    
    % Calculate the skeleton image of originsl
    [original, bw_image, cApprox] = fourier_descriptor(image, num_desc);
    % close all;

    % Draw the original and skeleton images   
    figure('Name', image),
    subplot(1, 2, 2);
    imshow(imcomplement(bwperim(bw_image)));
    hold on, plot(cApprox,'r');
    title(['Fourier Descriptor (n = '  num2str(num_desc)  ')']);

    subplot(1, 2, 1);
    imshow(original);
    title('Original');

    pause;
    close all;
end



