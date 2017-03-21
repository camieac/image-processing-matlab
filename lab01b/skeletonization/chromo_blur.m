% File: maple.m
% Description: Fourier Descriptor Scheme
% Authors: Cameron a. Craig & Stuart J.Thain
% Date: 11 March 2017

clear all;
close all;
clc;

% Calculate the skeleton image of original
[original, skeleton, iterations, time] = skeletonise('images/electron_micrograph_of_a_human_chromosome_blur.tif');

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


