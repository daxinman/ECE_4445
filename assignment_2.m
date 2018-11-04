function thres = intermeans_19(im)
% finds a threshold to binarize an image
%   thres = intermeans_19(im) where thres is a normalized threshold value
%   between 0.0 to 1.0 and im is a uint8 image matrix.

% set initial threshold to mean of im
tPrevious = round(mean2(im));
% create histogram of im
hist = imhist(im);

while 1

    total = 0;
    % calculate mean greylevel less than or equal to the threshold
    for i = 1:(tPrevious + 1)
        total = total + (hist(i) * i);
    end
    u1 = total / sum(hist(1:(tPrevious + 1)));

    total = 0;
    % calculate mean greylevel greater than the threshold
    for j = (tPrevious + 2):256
        total = total + (hist(j) * j);
    end
    u2 = total / sum(hist((tPrevious + 2):256));

    % get current threshold
    tCurrent = round((u1 + u2) / 2);
    
    % if current threshold same as previous, return thres and break
    if tCurrent == tPrevious
        thres = tCurrent / 255;
        break
    end
    
    % set previous threshold as current (for next loop iteration)
    tPrevious = tCurrent;

end

