% File: fourier_descriptor.m
% Description: Calculate Fourier Descriptor of a given image.
% Authors: Cameron a. Craig & Stuart J.Thain
% Date: 11 March 2017

function [original, b_w_image, cApprox] = fourier_decriptor(filename, num_desc);
    close all;

    % Read image
    original = im2double(imread(filename));

    % Invert Image
    inverted_image = 1 - original;

    % Blur the image
    h = fspecial('gaussian',25,15);
    inverted_image = imfilter(inverted_image, h, 'replicate');
    b_w_image = im2bw(inverted_image, 1.7*graythresh(inverted_image));


    % Find a starting point on the boundary
    [rows cols] = find(b_w_image~=0);

    % Find the boundary of the object
    contour = bwtraceboundary(b_w_image, [rows(1), cols(1)], 'N');

    % Subsample the boundary points so we have exactly num_desc, and put them into a
    % complex number format (x + jy)
    sampleFactor = length(contour)/num_desc;
    dist = 1;
    for i=1:num_desc
        c(i) = contour(round(dist),2) + j*contour(round(dist),1);
        dist = dist + sampleFactor;
    end

    % Calculate the fourier transform of the complex descriptors
    C = fft(c);

    % Chop out some of the smaller coefficients (less than umax)
    % umax = 32;
    umax = 8; 
    Capprox = C;
    for u=1:num_desc
        if u > umax & u < 128-umax
            Capprox(u) = 0;
        end
    end

    % Take inverse fft
    cApprox = ifft(Capprox);
end

