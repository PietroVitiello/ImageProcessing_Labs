function imShow(x, map)
    figure()
    image(x);  %Displays the image
    colormap(map);  %Reads it as greyscale
    colorbar  %Adds a colorbar
end