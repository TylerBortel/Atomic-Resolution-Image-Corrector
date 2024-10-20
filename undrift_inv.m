function undrifted_image = undrift_inv(im, dx, dy)
    A = [1 -dx 0; 0 1+dy 0; 0 0 1];
    A_inv = inv(A);
    tform = affinetform2d(A_inv);
    J = imwarp(im,tform);
    undrifted_image = J;
end