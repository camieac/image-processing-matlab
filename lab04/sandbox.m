%Smooth image using gaussian smoothing
% im_smoothed = imgaussfilt(im,2);
% sample_x = downsample(im,4);
% sample_x = resample(im, 3, 2);

% sample = [];
% x2 = 0;
% y2 = 0;
%  for x = 1 : 4 : rows - 1;
%      x2 = x2 + 1;
%      for y = 1 : 4 : rows - 1; % for each inner pixel
%          y2 = y2 + 1;
%              sample(x2, y2) = im(x, y);
%      end
%  end