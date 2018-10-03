X_train = X_train(1:360,:);
Y_train = Y_train(1:360,:);

train1 = X_train(1:14,:);
train2 = X_train(15:83,:);
train3 = X_train(84:112,:);
train4 = X_train(113:147,:);
train5 = X_train(148:194,:);
train6 = X_train(195:360,:);

n1=14;
n2=69;
n3=29;
n4=35;
n5=47;
n6=166;

train=[];

% mark = ones(size(train1,1),1);
% [final_features, final_mark] = SMOTE(train1,mark,4);
% train = [train;final_features(n1+1:4*n1,:)];
% Y_train = [Y_train;final_mark(n1+1:4*n1)*1];
% 
mark = ones(size(train2,1),1);
[final_features, final_mark] = SMOTE(train2,mark,4);
train = [train;final_features(n2+1:2*n2,:)];
Y_train = [Y_train;final_mark(n2+1:2*n2)*2];
% 
% mark = ones(size(train3,1),1);
% [final_features, final_mark] = SMOTE(train3,mark,4);
% train = [train;final_features(n3+1:3*n3,:)];
% Y_train = [Y_train;final_mark(n3+1:3*n3)*3];

mark = ones(size(train4,1),1);
[final_features, final_mark] = SMOTE(train4,mark,6);
train = [train;final_features(n4+1:6*n4,:)];
Y_train = [Y_train;final_mark(n4+1:6*n4)*4];

% mark = ones(size(train5,1),1);
% [final_features, final_mark] = SMOTE(train5,mark,4);
% train = [train;final_features(n5+1:3*n5,:)];
% Y_train = [Y_train;final_mark(n5+1:3*n5)*5];

% mark = ones(size(train6,1),1);
% [final_features, final_mark] = SMOTE(train6,mark,4);
% train = [train;final_features(n6+1:2*n6-66,:)];
% Y_train = [Y_train;final_mark(n6+1:2*n6-66)*4];

X_train = [X_train;train];







