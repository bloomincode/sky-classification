function D = calculate_avg_rgb(img)
    red=img(:,:,1);
    red=reshape(red,1,[]);
    average_red=mean(red);

    green=img(:,:,2);
    green=reshape(green,1,[]);
    average_green=mean(green);

    blue=img(:,:,3);
    blue=reshape(blue,1,[]);
    average_blue=mean(blue);

    D=[average_red average_green average_blue];
return;
end
