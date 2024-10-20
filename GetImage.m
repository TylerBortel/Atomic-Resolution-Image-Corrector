ext='*.jpg' ; 
folder='C:\Users\tbortel\Desktop';
[filename, path] = uigetfile(fullfile(folder,ext)) ;
imageSelection = imread(fullfile(path, filename));
[rows, columns, numberOfColorChannels] = size(imageSelection);
image_Size = columns;