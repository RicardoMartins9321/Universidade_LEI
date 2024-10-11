[Image,ColorMap] = imread("Parede_8bit.bmp");

Im = Load8bitImage1('Parede.raw');
Im = uint8(Im);

image(Im);
colormap(ColorMap);