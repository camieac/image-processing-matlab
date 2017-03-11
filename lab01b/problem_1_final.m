close all; clear all; clc;

im = im2double(imread('images/mapleleaf.tif'));
im_out = im;
figure, imshow(im);  
[rows, cols] = size(im);
     flags = zeros(rows, cols);
    
[rows cols] = find(im~=0);
contour = bwtraceboundary(im, [rows(1), cols(1)], 'N');
figure, imshow(contour);
contour

for iterations = 1 : 1;
    %Stage 1
    for x = 2 : rows - 1;
        for y = 2 : cols - 1; % for each inner pixel
            % Calc neighbours
            p = [im_out(x, y-1),im_out(x+1, y-1),im_out(x+1, y),im_out(x+1, y+1),im_out(x, y+1),im_out(x-1, y+1),im_out(x-1, y),im_out(x-1, y-1)];

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

                c = p(1) * p(3) * p(5);
                d = p(3) * p(5) * p(7);
            
            if((2 <= sum_p) && (sum_p <= 6) && (t == 1) && (c == 0) && (d == 0));
                %flag for deletion
                flags(x, y) = 1;
            end

        end
    end
    %Delete flagged pixels
     for x = 2 : rows - 1;
        for y = 2 : cols - 1; % for each inner pixel
            if(flags(x, y) == 1);
                im_out(x, y) = 0;
            end
        end
     end
     

     %Stage 2
     for x = 2 : rows - 1;
        for y = 2 : cols - 1; % for each inner pixel
            % Calc neighbours
            p = [im_out(x, y-1),...
                im_out(x+1, y-1),...
                im_out(x+1, y),...
                im_out(x+1, y+1),...
                im_out(x, y+1),...
                im_out(x-1, y+1),...
                im_out(x-1, y),...
                im_out(x-1, y-1)];

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

                c = p(1) * p(3) * p(7);
                d = p(1) * p(5) * p(7);

            if((2 <= sum_p) && (sum_p <= 6) && (t == 1) && (c == 0) && (d == 0));
                %flag for deletion
                flags(x, y) = 1;
            end

        end
    end
    %Delete flagged pixels
     for x = 2 : rows - 1;
        for y = 2 : cols - 1; % for each inner pixel
            if(flags(x, y) == 1);
                im_out(x, y) = 0;
            end
        end
     end
     
   
end
%print image
figure, imshow(im_out);  
             
        