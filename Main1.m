% Run this FIRST
%

% Select an image
GetImage_FFT
%
minpeak = 0;
if exist('imageSelection_FFT') >= 1
        minpeak = .1 * max(imageSelection_FFT(:));
else
        minpeak = 10;
end
% Assisted peak identification
Point_Finder(imageSelection_FFT,minpeak)