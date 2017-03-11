%Image Equalisation (Lab 2)

% Get Image
img = imread('images/lena.png');
img2 = img;

%Show original image and it's histogram
figure,
subplot(1,2,1); 
imshow(img); title('Original image');
subplot(1,2,2); 
imhist(img), axis tight; title('its histogram');
[counts, intensities] = imhist(img);

num_intensities = size(intensities);
[rows, cols] = size(img);
n = rows * cols;
L = max(intensities);
M = ((L - 1) / n);

sum_ni = 0;
new_ni = zeros(num_intensities);
for i = 1: num_intensities
    ni = counts(i);
    sum_ni = sum_ni + ni;
    m_sum_ni = M * sum_ni;
    round_m_sum_ni = round(m_sum_ni);
    new_ni(i) = round_m_sum_ni;
end

%Put new intensity values into an image
for x = 1 : rows;
  for y = 1 : cols; % for each inner pixel
       img2(x,y) = new_ni(img(x, y));
  end
end
       
%Show new equalised image and it's histogram
figure,
subplot(1,2,1); 
imshow(img2); title('Equalised image');
subplot(1,2,2); 
imhist(img2), axis tight; title('its histogram');



