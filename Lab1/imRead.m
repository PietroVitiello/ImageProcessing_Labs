function [x, npx] = imRead(directory)
    fid = fopen(directory, 'r');

    [x, npx] = fread(fid, [128,128], 'uchar');
    x = x';  %Matlab reads in arrays with a different index order [Ctd...]
         %to that of ‘C’ File was created using C, so transpose matrix

    fclose(fid);
end