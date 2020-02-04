%% Set up of image
clear all;
X = imread('croppedpeasondesk.jpg');
G = rgb2gray(X);
G = double(G);
R = double(X(:,:, 1));
Gr = double(X(:,:, 2));
B = double(X(:,:, 2));
Tot = R + Gr + B;

%% Show X
disp(size(X));
imshow(X)

%% Just show
figure()
imshow(G);
figure()
imagesc(G), colormap(gray(256))

%% Histogram
g = G(:);
figure()
hist(g)
figure()
hist(g, 100)
figure()
subplot(2, 1, 1)
histogram(G, 100); %It is like considering one vector with all the points
subplot(2, 1, 2)
hist(G)

%% Thresholding
Threshold = 130;
ggbin = G>Threshold;
imshow(ggbin)

%% green two thresholds
green_Threshold = 150;
green_gbin = double(X(:,:, 2))<200;
green_gbin = green_gbin .* double(X(:, :, 2));
green_gbin = green_gbin>green_Threshold;
imshow(green_gbin);

%% green subtracting red and blue
figure()
norm_gbin = Tot/3 < (Gr - 5);
imshow(norm_gbin);

%% Labelling
[labelled_peas, n_peas] = bwlabel(norm_gbin);

dim = regionprops(norm_gbin, 'Area', 'Centroid', 'BoundingBox');
areas = cat(1, dim.Area);
centers = cat(1, dim.Centroid);
boxes = cat(1, dim.BoundingBox);

%% Getting rid of small areas
ii = 1;
for i= 1:length(areas)
    if areas(i) > 90
        index(ii) = i;
        ii = ii + 1;
    end
end

%% Plot Boxes
figure()
imshow(norm_gbin),  hold on;

for i = index
    plot(centers(i, 1), centers(i, 2),'rx');
    
    h = rectangle('Position',[boxes(i, 1) boxes(i, 2) boxes(i, 3) boxes(i, 4)]);
    set(h, 'EdgeColor', [0 1 0]);
%     h = text(x, y, 'P');
%     set(h,'Color','g'); 
end




