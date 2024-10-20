% Run AFTER Main1
% FFT Image selection has already been made
User_Input % select 3 points and the center
%
% Collects original Lengths/Angles for reference
FindLengths 
FindAngles
%
% Calculates Drift Vector
Qx = 0.5*(Ay^2*Bx^2 - Ax^2*By^2 - Ay^2*Cx^2 + By^2*Cx^2 + Ax^2*Cy^2 - Bx^2*Cy^2) / (Ay^2*(Cx*Cy - Bx*By) + By^2*(Ax*Ay - Cx*Cy) + Cy^2*(Bx*By - Ax*Ay));
QySq = (Ax^2 + 2*Ax*Ay*Qx + Ay^2*Qx^2 - Cx^2 - 2*Cx*Cy*Qx - Cy^2*Qx^2) / (Cy^2 - Ay^2);
if QySq<0
    error('Erorr: Invalid Points')
end
Qy = sqrt(QySq);
DxP = Qx;
DyP = Qy - 1;
%
% Current implementation does not have user input for scale factor
% Can easily add to User_Input. Already baked into Correct_Image
% Currently, ScaleFactor is used to ensure that the final image is roughly the same
% size as original image, to allow for apples-to-apples data comparison
ScaleFactor = 1.05;
% The corrected FFT isn't actually necessary, but it is calculated here
% partly for benchmarking reasons, and partly to allow its extraction for
% other use. It is not presently displayed.
Corrected_Im = Correct_Image(imageSelection_FFT,DxP,DyP,ScaleFactor);
%
%% Used to roughly measure improvement from the correction on the FFT.
% Identify the peak locations as before, and then run Main2 in order to
% calculate the length/angles
%
%% Display Corrected FFT Image
%figure, imshow(Corrected_Im)
%
%% Assisted identification of new peak locations
%Point_Finder(Corrected_Im)
%
GetImage
Corrected_Image = unscale(undrift_inv(imageSelection,DxP,DyP),ScaleFactor);
close
imshow(Corrected_Image)

[p,f,e]=fileparts(filename);
fullfilename = fullfile(p,f);
ExpFileName = char(strcat(fullfilename,'_Corrected.jpg'));

if exist(ExpFileName, 'file')
   promptMessage = sprintf('%s already exists.\nDo you want to overwrite it', ExpFileName);
   titleBarCaption = 'Overwrite?';
   buttonText = questdlg(promptMessage, titleBarCaption, 'Yes', 'No', 'Yes');
   if strcmpi(buttonText, 'Yes')
       imwrite(im2uint8(Corrected_Image),ExpFileName,'BitDepth',8);
       disp(['File saved as: ', ExpFileName]);
   end
else
       imwrite(im2uint8(Corrected_Image),ExpFileName,'BitDepth',8);
       disp(['File saved as: ', ExpFileName])   
end



