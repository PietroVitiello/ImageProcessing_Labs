%% Part 1
[x, npx] = imRead('H:\Year3\ImageProcessing\Lab1\ImageDataFiles\Head.128');

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
[x, map] = imread('H:\Year3\ImageProcessing\Lab1\ImageDataFiles\trees.tif');
imShow(x, map)
imShow(x, map(1:128, :))

%% Part 6
clear; close all;
[x, map] = imread('H:\Year3\ImageProcessing\Lab1\ImageDataFiles\lily.tif');
imShow(x, map)
column_ramp = (0:1/255:1)';
redmap = [column_ramp, zeros(256,1), zeros(256,1)];
greenmap = [zeros(256,1), column_ramp, zeros(256,1)];
bluemap = [zeros(256,1), zeros(256,1), column_ramp];
graymap = [column_ramp, column_ramp, column_ramp];

maps_array = {redmap, greenmap, bluemap, graymap};

% for i = 1:size(maps_array, 2)
%     imShow(x(:, :, 1), maps_array{1, i})
% end

R=double(x(:,:,1)); G=double(x(:,:,2)); B=double(x(:,:,3));
scaling = R + G + B;
red_trichrom = R./scaling;
green_trichrom = G./scaling;
blue_trichrom = B./scaling;

% x(:,:,1) = red_trichrom;
% x(:,:,2) = green_trichrom;
% x(:,:,3) = blue_trichrom;

trichrom_array = {red_trichrom, green_trichrom, blue_trichrom};

%image(x);
%imagesc(x)
% colormap(gray(64)); imagesc(red_trichrom);

for i = 1:size(trichrom_array, 2)
    figure(i); colormap(gray(110)); imagesc(trichrom_array{1, i})
end

% for i = 1:3%size(trichrom_array, 2)
%     imShow(x(:, :, i), trichrom_array{1, i})
% end








