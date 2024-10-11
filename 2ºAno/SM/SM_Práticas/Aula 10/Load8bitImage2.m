function [N, M, Im] = Load8bitImage2(Filename)
    fileID = fopen(Filename, 'rb');
    N = fread(fileID, 1, 'uint16');
    M = fread(fileID, 1, 'uint16');
    Im = fread(fileID, [N M], 'uint8');
    fclose(fileID);
end