readp = 'test\';
savep = 'testgray\';
suffix1 = '.jpg'; 
suffix2 = '.png';
for i=1:666
    readpath = strcat(readp,num2str(i),suffix1);
    image = imread(readpath);
    image = rgb2gray(image);
    savepath = strcat(savep,num2str(i),suffix2);
    imwrite(image,savepath);
end

readp = 'train\';
savep = 'traingray\';
suffix2 = '.png';
for i=1:360
    readpath = strcat(readp,num2str(i),suffix1);
    image = imread(readpath);
    image = rgb2gray(image);
    savepath = strcat(savep,num2str(i),suffix2);
    imwrite(image,savepath);
end