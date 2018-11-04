function im2 = equalize_image(im)

% equalizes an image's histogram
%   im2 is an equalized image matrix im
%   im is a uint8 image matrix

hist = imhist(im);
maxGL = 255;    % set maximum gray level (255 for uint8 image)

num_pixels = sum(hist);
cumulative_sum = cumsum(hist);

cumulative_sum_scaled = cumulative_sum .* (double(maxGL) / double(num_pixels));
discretized = round(cumulative_sum_scaled);

im2 = im;
[numRows, numCols] = size(im);

for i = 1:numRows
    for j = 1:numCols
        % get gray level of pixel in im
        pixelValue = im(i,j);
        % get the new value that the pixel should be
        newValue = discretized(pixelValue + 1);
        % put new value in im2
        im2(i,j) = newValue;
    end
end

end