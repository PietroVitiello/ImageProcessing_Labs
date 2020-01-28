%% Part 1
[x, npx] = imRead('H:\Year3\ImageProcessing\ImageProcessing_Labs\Lab1\ImageDataFiles\Head.128');

gray_map = gray(110);  %the number inside gray() is the number
                       %of discrete colors of gray

magic_color_matrix = magic(64)/(64*64);
magicmap = [magic_color_matrix(:,1:3)];  %This is very cool because you see the pattern of how the
                                         %sum of rows is always the same

n_colors = 120;

red_matrix = [(1:n_colors)', zeros(n_colors, 1), zeros(n_colors, 1)];
red_map = red_matrix/n_colors;

green_matrix = [zeros(n_colors, 1), (1:n_colors)', zeros(n_colors, 1)];
green_map = green_matrix/n_colors;

blue_matrix = [zeros(n_colors, 1), zeros(n_colors, 1), (1:n_colors)' ];
blue_map = blue_matrix/n_colors;

maps_array = {gray_map, magicmap, red_map, green_map, blue_map};

for i = 1:size(maps_array, 2)
    imShow(x, maps_array{1, i})
end

%% Part 5
clear; close all;
[x, map] = imread('H:\Year3\ImageProcessing\ImageProcessing_Labs\Lab1\ImageDataFiles\trees.tif');
imShow(x, map)
imShow(x, map(1:128, :))

%% Part 6
clear; close all;
[x, map] = imread('H:\Year3\ImageProcessing\ImageProcessing_Labs\Lab1\ImageDataFiles\lily.tif');
imShow(x, map)
column_ramp = (0:1/255:1)';
redmap = [column_ramp, zeros(256,1), zeros(256,1)];
greenmap = [zeros(256,1), column_ramp, zeros(256,1)];
bluemap = [zeros(256,1), zeros(256,1), column_ramp];
graymap = [column_ramp, column_ramp, column_ramp];

maps_array = {redmap, greenmap, bluemap, graymap};

R=double(x(:,:,1)); G=double(x(:,:,2)); B=double(x(:,:,3));
scaling = R + G + B;
red_trichrom = R./scaling;
green_trichrom = G./scaling;
blue_trichrom = B./scaling;

trichrom_array = {red_trichrom, green_trichrom, blue_trichrom};

red_max = max(max(red_trichrom));
red_min = min(min(red_trichrom));
red_range = red_max - red_min;
red_steps = red_range/255;
norm_term = fix(red_min/red_steps)-1;

red_indices = fix(red_trichrom/red_steps)-norm_term;

for i = 1:1%size(trichrom_array, 2)
    figure(5); colormap(gray(256)); image(red_indices)
    %figure(i); colormap(gray(110)); imagesc(trichrom_array{1, i})
end

%% Part 7
clear; close all;
info = dicominfo('US-PAL-8-10x-echo.dcm');
[X, map] = dicomread('US-PAL-8-10x-echo.dcm');
% figure(1)
% montage(X, map);
% colorbar;  %The color map represents the one seen next to one of the pictures read one row at a
           %time that is why you have trhe same pattern repeating. Then
           %there are colors added later, placed between the colors and the
           %grayscale

x1 = X(:, :, 1, 1);
x9 = X(:, :, 1, 9);

% figure(2)
% image(X(:, :, 1, 1));
% colormap(map);
% colorbar;

M = immovie(X, map);
movie(M, 20, 10); %(file to display, number of times, fps)

%% Part 8
for i = 1:10
    B(:, :, 1, i) = X(:, :, 1, i) <= 100;
end

B = B + 1;
binary_map = [0 0 0; 1 1 1];

% figure(1)
% b3 = B(:, :, 1, 3);
% image(b3);
% colormap(binary_map);
% colorbar;

MB = immovie(B, binary_map);
movie(MB, 20, 10);







