readp = 'testgray\';
savep = 'finaltest\';
suffix = '.png';

w=fspecial('laplacian',1);  

for i=1:666
    readpath = strcat(readp,num2str(i),suffix);
    image = imread(readpath);
    image = im2double(image);
    g1=imfilter(image,w,'replicate');  
    recons=image-g1;  
    savepath = strcat(savep,num2str(i),suffix);
    imwrite(im2uint8(recons),savepath);
end

readp = 'traingray\';
savep = 'finaltrain\';
suffix = '.png';
for i=1:360
    readpath = strcat(readp,num2str(i),suffix);
    image = imread(readpath);
    image = im2double(image);
    g1=imfilter(image,w,'replicate');  
    recons=image-g1;  
    savepath = strcat(savep,num2str(i),suffix);
    imwrite(im2uint8(recons),savepath);
end