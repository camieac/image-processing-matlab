close all; clear all; clc;

im = im2double(imread('images/mapleleaf.tif'));
im_out = im;

figure, imshow(im_out);
hold on;

[rows, cols] = size(im);
     flags = zeros(rows, cols);
     
intermediate = zeros(rows, cols);
border = zeros(rows, cols);
sum_p = 0;
p = zeros(8);
t = zeros(8);
c = 0;
d = 0;
num_iterations = 0;

% Limit iteration count to avoid infinite loop
max_iterations = 500;
while 1;
    %Update the intermediate buffer with the latest changes to im_out
    intermediate = im_out;
    
    % We only need to apply this algorithm to the border points (a black
    % pixel with al least on white neighbour pixel)
    border = bwperim(intermediate);
    
    
    % Two passes of the below algorithm are applied, each with different c
    % and d values.
    for stage = 0 : 1;
        for x = 2 : rows - 1;
            for y = 2 : cols - 1; % for each inner pixel
                % Optimisation step: Only check border pixels
                if(border(x, y) == 1);
                    % Calculate neighbours
                    p = [
                        intermediate(x, y-1),...
                        intermediate(x+1, y-1),...
                        intermediate(x+1, y),...
                        intermediate(x+1, y+1),...
                        intermediate(x, y+1),...
                        intermediate(x-1, y+1),...
                        intermediate(x-1, y),...
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
                        abs(p(2) - p(1)) ...
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
                        im_out(x, y) = 0;

                    end
                end

            end
        end
    end  

    % Update the image displayed in the figure (live update)
    imshow(im_out);
    drawnow;
    
    % Ensures max iteration count it not exceeded
	num_iterations = num_iterations + 1;
    if(num_iterations >= max_iterations)
        break;
    end
    
    % Exit when skeltonising is complete
    if(im_out == intermediate)
        break;
    end
end

num_iterations
        