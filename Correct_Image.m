function corrected_image = Correct_Image(image,dx,dy,scf)
    im = undrift_inv(image, dx, dy);
    corrected_image = unscale(im, scf);
end