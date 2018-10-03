[train_scale,test_scale,ps] = scaleForSVM(X_train,X_test,0,1);
tic;
A='-c ';
B=' -g ';
aa=zeros(40,1);
for i=1:40
    aa(i)= 1.0+i*0.1;
end
bb=zeros(80,1);
for i=1:80
    bb(i) = 1.2+i*0.0025;
end
acc=zeros(3200,1);
for i=1:40
    for j=1:80
        para=[A,num2str(aa(i)),B,num2str(bb(j))];
        modelrbf=svmtrain(Y_train,train_scale,para);
        fprintf("%d",(i-1)*80+j);
        [rbf_predict,accuracy]=svmpredict(Y_test,test_scale,modelrbf);
        acc((i-1)*80+j)=accuracy(1);
        confrbf1= confusionmat(Y_test,rbf_predict);                          
        confrbf2 = bsxfun(@rdivide, confrbf1, sum(confrbf1, 2));
    end
end
[x,l] = max(acc);
acc = reshape(acc,80,40); 
toc;
% tic;
% [bestacc,bestc,bestg]=SVMcgForClass(Y_train,X_train,-2,5,-8,1,3,0.1,0.1,4.5);
% toc;
