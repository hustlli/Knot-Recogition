[train_scale,test_scale,ps] = scaleForSVM(X_train,X_test,0,1);

tic;
[bestacc,bestc,bestg]=SVMcgForClass(Y_train,train_scale,1,4,-5,1,4,0.2,0.2,4.5);
toc;

para = [A,num2str(bestc),B,num2str(bestg)];
modelrbf = svmtrain(Y_train,train_scale,para);
[rbf_predict,accuracy]=svmpredict(Y_test,test_scale,modelrbf);

confrbf1= confusionmat(Y_test,rbf_predict);                          
confrbf2 = bsxfun(@rdivide, confrbf1, sum(confrbf1, 2));