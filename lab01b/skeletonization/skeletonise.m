% File: skeletonise.m
% Description: B/W Image skeletonising algorithm
% Authors: Cameron a. Craig & Stuart J.Thain
% Date: 11 March 2017

function [original, skeleton, num_iterations, time] = skeletonise(filename);
    % Start timer
    tic;
    close all;
    clc;

    original = im2double(imread(filename));
    imshow(original);
    
    % Convert image to black and white (input validation)
    original = im2bw(original, 1.7*graythresh(original));

    [rows, cols] = size(original);
    
    % Optimisation: Define variables outwith the loops to avoid memory re-assignment
    intermediate = zeros(rows, cols);
    skeleton = original;
    border = zeros(rows, cols);
    sum_p = 0;
    p = zeros(8);
    t = 0;
    c = 0;
    d = 0;
    
    % This figure will update every loop until the skeleton is complete
    figure,
    imshow(skeleton);
    %hold on;

    % Limit iteration count to avoid infinite loop
    max_iterations = 500;
    num_iterations = 0;
    
    while 1;
        % Two passes of the below algorithm are applied, each with different c
        % and d values.
        for stage = 0 : 1;
            % Update the intermediate buffer with the latest changes to skeleton
            intermediate = skeleton;

            % We only need to apply this algorithm to the border points (a black
            % pixel with al least on white neighbour pixel)
            border = bwperim(intermediate);

            for x = 2 : rows - 1;
                for y = 2 : cols - 1; % for each inner pixel
                    % Optimisation: Only check border pixels
                    if(border(x, y) == 1);
                        % Calculate neighbours
                        p = [
                            intermediate(x,   y-1),...
                            intermediate(x+1, y-1),...
                            intermediate(x+1, y)  ,...
                            intermediate(x+1, y+1),...
                            intermediate(x,   y+1),...
                            intermediate(x-1, y+1),...
                            intermediate(x-1, y)  ,...
                            intermediate(x-1, y-1)
                        ];

                        %Num non-zero
                        sum_p = sum(p);

                        t = ( ...
                            abs(p(3) - p(2)) + ...
                            abs(p(4) - p(3)) + ...
                            abs(p(5) - p(4)) + ...
                            abs(p(6) - p(5)) + ...
                            abs(p(7) - p(6)) + ...
                            abs(p(8) - p(7)) + ...
                            abs(p(1) - p(8)) + ...
                            abs(p(2) - p(1))   ...
                        )/2;


                        if(stage == 0)
                            c = p(1) * p(3) * p(5);
                            d = p(3) * p(5) * p(7);
                        else
                            c = p(1) * p(3) * p(7);
                            d = p(1) * p(5) * p(7);
                        end

                        % Check if deletion conditions are met
                        if((2 <= sum_p) && (sum_p <= 6) && (t == 1) && (c == 0) && (d == 0));
                            % Delete pixel
                            skeleton(x, y) = 0;

                        end
                    end

                end
            end
        end  

        % Update the image displayed in the figure (live update)
        imshow(skeleton);
        drawnow;

        % Ensures max iteration count it not exceeded
        num_iterations = num_iterations + 1;
        if(num_iterations >= max_iterations)
            break;
        end

        % Exit when skeltonising is complete
        if(skeleton == intermediate)
            break;
        end
    end
    time = toc;
end

        