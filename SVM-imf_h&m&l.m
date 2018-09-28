%% -----------------------------------SVM-imf_h-----------------------------

imfmz = imf_h(1:end-1);
imfmy = imf_h(2:end);

% Training dataset and validation dataset
trainx = imfhy(2:1401);
trainy = imfhz(1:1400);
testx = imfhy(1402:end);
testy = imfhz(1401:end-1);

% Normalization
[train_x,test_x] = scaleForSVM(trainx,testx,0,1);
[train_y,test_y,ps] = scaleForSVM(trainy,testy,0,1);


% Feature selection
% c in range of 2^cmin to 2^cmax
% g in range of 2^gmin to 2^gmax
% cstep,gstep,msestep = the step length of c?g?mse
% divide the training dataset into 'v' parts

% Initialization
cmin = -8; cmax = 8;
gmin = -8; gmax = 8;
v = 4;
cstep = 0.5; 
gstep = 0.5; msestep = 0.5;

[mse,bestc,bestg] = SVMcgForRegress(train_y,train_x,cmin,cmax,gmin,gmax,v,cstep,gstep,msestep)
cmd = ['-c ',num2str(bestc),' -g ',num2str(bestg),' -s 3 -p 0.01'];

% Model fitting
model = svmtrain(train_y,train_x,cmd);
[py,mse,dec] = svmpredict(test_y,test_x,model);
imfhp = mapminmax('reverse',py,ps);
y1 = imfhp

% Calculate diviation
[nmse_svm,mape_svm,ds_svm] = wucha(imfhp,testy)

%% -----------------------------------SVM-imf_m-----------------------------

imfmz = imf_m(1:end-1);
imfmy = imf_m(2:end);

% Training dataset and validation dataset
trainx = imfmy(2:1401);
trainy = imfmz(1:1400);
testx = imfmy(1402:end);
testy = imfmz(1401:end-1);

% Normalization
[train_x,test_x] = scaleForSVM(trainx,testx,0,1);
[train_y,test_y,ps] = scaleForSVM(trainy,testy,0,1);

% Feature selection
% c in range of 2^cmin to 2^cmax
% g in range of 2^gmin to 2^gmax
% cstep,gstep,msestep = the step length of c?g?mse
% divide the training dataset into 'v' parts

% Initialization
cmin = -8; cmax = 8;
gmin = -8; gmax = 8;
v = 4;
cstep = 0.5; 
gstep = 0.5; msestep = 0.5;

[mse,bestc,bestg] = SVMcgForRegress(train_y,train_x,cmin,cmax,gmin,gmax,v,cstep,gstep,msestep)
cmd = ['-c ',num2str(bestc),' -g ',num2str(bestg),' -s 3 -p 0.01'];

% Model fitting
model = svmtrain(train_y,train_x,cmd);
[py,mse,dec] = svmpredict(test_y,test_x,model);
imfmp = mapminmax('reverse',py,ps);
y2 = imfmp

% Calculate diviation
[nmse_svm,mape_svm,ds_svm] = wucha(imfmp,testy)


%% -----------------------------------SVM-imf_l-----------------------------

imflz = imf_l(1:end-1);
imfly = imf_l(2:end);

% Training dataset and validation dataset
trainx = imfly(2:1401);
trainy = imflz(1:1400);
testx = imfly(1402:end);
testy = imflz(1401:end-1);

% Normalization
[train_x,test_x] = scaleForSVM(trainx,testx,0,1);
[train_y,test_y,ps] = scaleForSVM(trainy,testy,0,1);


% Feature selection
% c in range of 2^cmin to 2^cmax
% g in range of 2^gmin to 2^gmax
% cstep,gstep,msestep = the step length of c?g?mse
% divide the training dataset into 'v' parts

% Initialization
cmin = -8; cmax = 8;
gmin = -8; gmax = 8;
v = 4;
cstep = 0.5; 
gstep = 0.5; msestep = 0.5;

[mse,bestc,bestg] = SVMcgForRegress(train_y,train_x,cmin,cmax,gmin,gmax,v,cstep,gstep,msestep)
cmd = ['-c ',num2str(bestc),' -g ',num2str(bestg),' -s 3 -p 0.01'];

% Model fitting
model = svmtrain(train_y,train_x,cmd);
[py,mse,dec] = svmpredict(test_y,test_x,model);
imflp = mapminmax('reverse',py,ps);
y3 = imflp

% Calculate diviation
[nmse_svm,mape_svm,ds_svm] = wucha(imflp,testy)



