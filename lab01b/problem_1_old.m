close all; clear all; clc;

im = im2double(imread('images/chromosome.tif'));
[rows, cols] = size(im);

lut = [
    [0, -1], [1, -1], [1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0], [-1, 1]
];

for stage = 0 : 1;
    for x = 2 : rows - 1;
        for y = 2 : rows - 1; % for each inner pixel
            pixel = im(x, y);

            % Find numbr of non-zero neighbours
            non_ze  ro_neighbours = 0;
            for xn = -1 : 1;
                for yn = -1 : 1; % for each inner pixel
                    if(xn ~= 0 && yn ~= 0);
                        non_zero_neighbours = non_zero_neighbours + im(x + xn, y + yn);
                    end
                end
            end

            % Find number of 0 --> 1 transitions
            num_transitions = 0;
            [lastx, lasty] = lut(8);
            previous = im(x + lastx, y + lasty);
            for idx = 1 : size(lut);
                xt, yt = lut(idx);
                current = im(x + xt, y + yt);
                if(current > previous);
                    num_transitions = num_transitions + 1;
                end
                previous = im(x + xt, y + yt);
            end
            % Check stuff
            p2x, p2y = lut(2);
            p2i = im(x + p2x, y + p2y);

            p4x, p4y = lut(4);
            p4i = im(x + p4x, y + p4y);

            p6x, p6y = lut(6);
            p6i = im(x + p6x, y + p6y);

            p8x, p8y = lut(8);
            p8i = im(x + p8x, y + p8y);

            if(stage == 0)
                total_c = p2i * p4i * p6i;
                total_d = p4i * p6i * p8i;

            else
                total_c = p2i * p4i * p8i;
                total_d = p2i * p6i * p8i;
            end
        end
    end
end
             
     