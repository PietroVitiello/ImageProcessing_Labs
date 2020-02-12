function peas = getRegionPatch(x, all_regions, keep_index)
    n_peas = length(keep_index);
    
    for i = 1:n_peas
        regions(i,:) = all_regions(keep_index(i), :);
%         if (diff_H == 0)
%             diff_H = 1;
%         end
%         if (diff_W == 0)
%             diff_W = 1;
%         end
    end
    
    %regions = int8(regions);
    
    max_W = max(regions(:,6));
    max_H = max(regions(:,7));
    
    peas = zeros(max_H, max_W, 3, n_peas);
    
    disp("peas array")
    disp(size(peas))
    
    [m,n,o,p] = size(peas);
    Plotcols = 10; % This is kind of set arbitrarily
    Plotrows = ceil(p/Plotcols); % Relative to # of peas
    
    for i = 1:n_peas
        diff_H = floor((max_H - regions(i,7))/2);
        diff_W = floor((max_W - regions(i,6))/2);
        
        range_H = (diff_H + 1) : (diff_H + regions(i,7))
        range_W = (diff_W + 1) : (diff_W + regions(i,6))
        
%         disp("image width")
%         disp(regions(i,6))
%         disp("range width")
%         disp(length(range_W))
%         disp("image height")
%         disp(regions(i,7))
%         disp("range height")
%         disp(length(range_H))
        
        where_H = (floor(regions(i,5)) + 1) : (floor(regions(i,5)) + regions(i,7))
        where_W = (floor(regions(i,4)) + 1) : (floor(regions(i,4)) + regions(i,6))
        
        peas(range_H,range_W,:,i) = x(where_H,where_W,:);
        
        subplot(Plotrows,Plotcols,i);
        imagesc(x(where_H,where_W,:));
        axis off;
    end
    
    imshow(x(int8(where_H),int8(where_W),:))
    