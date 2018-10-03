suffix = '.png';
K = 50;  %K是聚类数量
startnumber = 1;
trainnumber = 360;
d1=3;
d2=3;
u = 5;
v = 8;
m = 39;
n = 39;
readp = 'finaltrain\';
X_train = zeros(trainnumber-startnumber+1,K);
features = zeros(1,u*v);
for i=startnumber:trainnumber
    B = num2str(i);
    readpath = strcat(readp,B,suffix);  %C是读取图像的路径
    image = imread(readpath);
    gaborArray = gaborFilterBank(u,v,m,n);  % Generates the Gabor filter bank
    [featureVector,~] = gaborFeatures(image,gaborArray,d1,d2);  
    featureVector = reshape(featureVector,length(featureVector)/(u*v),u*v);
    features = [features;featureVector];
end

features = features(2:end,:);
opts = statset('Display','final','MaxIter',1000);
[Idx,center]=kmeans(features,K,'Options',opts);

k = 0;
for i=startnumber:trainnumber
    B = num2str(i);
    readpath = strcat(readp,B,suffix);  %C是读取图像的路径
    image = imread(readpath);
    gaborArray = gaborFilterBank(u,v,m,n);  % Generates the Gabor filter bank
    [featureVector,~] = gaborFeatures(image,gaborArray,d1,d2);  
    featureVector = reshape(featureVector,length(featureVector)/(u*v),u*v);
    for j=1:size(featureVector,1)
        X_train(i-startnumber+1,Idx(k+j)) = X_train(i-startnumber+1,Idx(k+j))+1;
    end
    k = k+size(featureVector,1);
    X_train(i-startnumber+1,:) = X_train(i-startnumber+1,:)/sum(X_train(i-startnumber+1,:));
end

%%提测试集特征
readp = 'finaltest\';
X_test = zeros(666,K);
dist = zeros(K,1);
for i=1:666
    B = num2str(i);
    readpath = strcat(readp,B,suffix);
    image = imread(readpath);
    gaborArray = gaborFilterBank(u,v,m,n);  % Generates the Gabor filter bank
    [featureVector,~] = gaborFeatures(image,gaborArray,d1,d2);  
    featureVector = reshape(featureVector,length(featureVector)/(u*v),u*v);
    for j=1:size(featureVector,1)
        for k=1:K
            dist(k)= sum((featureVector(j,:)-center(k,:)).^2);
        end
        [x,l] = min(dist);
        X_test(i,l) = X_test(i,l)+1;
    end
    X_test(i,:)=X_test(i,:)/sum(X_test(i,:));
end    

load('labels.mat');
Y_train=Y_train(1:trainnumber,:);
