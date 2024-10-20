function sub_pixel_peak = mew_sub_pixel_find_CoM7(im, xi, yi, range)   
    delta_denom = 0;
    for i = -1*range:range
        for j = -1*range:range
            delta_denom = delta_denom + impixel(im, xi + i, yi + j);
        end
    end
    delta_x_num = 0;
    for i = -1*range:range
        for j = -1*range:range
            delta_x_num = delta_x_num + i*impixel(im, xi + i, yi + j);
        end
    end
    delta_y_num = 0;
    for i = -1*range:range
        for j = -1*range:range
            delta_y_num = delta_y_num + j*impixel(im, xi + i, yi + j);
        end
    end
    delta_x_hat = delta_x_num / delta_denom;
    delta_y_hat = delta_y_num / delta_denom;
    sub_pixel_peak = [xi - delta_x_hat, yi - delta_y_hat];

           
       





end