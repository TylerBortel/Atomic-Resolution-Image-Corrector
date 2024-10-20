ext='*.jpg' ; 
folder='C:\Users\tbortel\Desktop';
[filenameFFT, path] = uigetfile(fullfile(folder,ext)) ;
imageSelection_FFT = imread(fullfile(path, filenameFFT));
[rows, columns, numberOfColorChannels] = size(imageSelection_FFT);
FFT_Size = columns;