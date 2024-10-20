% Manually collects the 3 peak locations and the origin
% Applies sub pixel peak finding routine to all 4
% Calculates positions of refined peaks relative to the refined origin
prompt = {'Point 1:','Point 2:','Point 3:','Origin'};
dlgtitle = '3 Points on the elipse';
dims = [1 35];
definput = {'0,0','0,0','0,0', [num2str(FFT_Size/2+1) ',' num2str(FFT_Size/2+1)]};
Three_Points = inputdlg(prompt,dlgtitle,dims,definput);
a = str2num(Three_Points{1});
b = str2num(Three_Points{2});
c = str2num(Three_Points{3});
o = str2num(Three_Points{4});
A = mew_sub_pixel_find_CoM7(imageSelection_FFT, a(1), a(2),3);
B = mew_sub_pixel_find_CoM7(imageSelection_FFT, b(1), b(2),3);
C = mew_sub_pixel_find_CoM7(imageSelection_FFT, c(1), c(2),3);
O = mew_sub_pixel_find_CoM7(imageSelection_FFT, o(1), o(2),3);
Ax = A(1) - O(1);
Ay = O(2) - A(2);
Bx = B(1) - O(1);
By = O(2) - B(2);
Cx = C(1) - O(1);
Cy = O(2) - C(2);