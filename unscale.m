function unscaled_image = unscale(im, scf)
    B = [scf 0 0; 0 scf 0; 0 0 1];
    tform = affinetform2d(B);
    K=imwarp(im,tform);
    unscaled_image = K;
end