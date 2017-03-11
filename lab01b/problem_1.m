close all; clear all; clc;

im = im2double(imread('images/mapleleaf.tif'));
im_out = im;
intermediate = im;
figure, imshow(im);  
[rows, cols] = size(im);
     flags = zeros(rows, cols);

iterations = 50;
while iterations;
    iterations
    
    intermediate = im_out;
    
    for stage = 0 : 1;
        for x = 2 : rows - 1;
            for y = 2 : cols - 1; % for each inner pixel
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


                if((2 <= sum_p) && (sum_p <= 6) && (t == 1) && (c == 0) && (d == 0));
                    %flag for deletion
                    im_out(x, y) = 0;

                end

            end
        end
    end  
	iterations = iterations - 1;
end
%print image
figure, imshow(im_out);  
             
        