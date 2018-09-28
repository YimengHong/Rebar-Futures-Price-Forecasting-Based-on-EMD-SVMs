%% ----------------------------pre-processing-------------------------------
% Load data
load rebarfutures.mat;

figure()
plot(allmode(:,1));

% Original Futures Price Time Series
imf = allmode;
cd = size(imf,1);
Nsubp=size(imf,2);


figure()
for iter = 2:Nsubp
    it = iter-1;
    subplot(Nsubp,1,it);
    plot(1:cd,imf(:,iter));
    if iter==Nsubp
        eval(['ylabel(''R',''');']);
        set(gca,'xtick',[0:150:1451]);
    else
        eval(['ylabel(''IMF',int2str(it),''');']);
        set(gca,'xtick',[]);
    end
    xlim([0,1451]);
end


% ????(Wald–Wolfowitz runs test)
[youcheng, qujian] = ych(imf(:,2:end));

original = imf(:,1);
imf_h = imf(:,2);
imf_m = imf(:,3);
imf_l = imf(:,8)+imf(:,4)+imf(:,5)+imf(:,6)+imf(:,7);
R = imf(:,9);
xxx = 1:length(original);
figure()
plot(xxx,original,'k');
hold on 
plot(xxx,imf_h,'r-');
plot(xxx,imf_m,'b-');
plot(xxx,imf_l,'g');
plot(xxx,R,'k--')
xlim([0, 1451]);
legend('rebarfutures','imf_h','imf_m','imf_l','R');

% Combined data
imf_all = [imf_h,imf_m,imf_l,R,original];

% Period length
for i = 1:size(imf_all,2)
    zhq_max = findpeaks(imf_all(:,i));
    zhq_min = findpeaks(-imf_all(:,i));
    zhq = [zhq_min; zhq_max];
    figure
    plot(zhq,imf_all(zhq,i),'r+');
    hold on;
    plot(imf_all(:,i),'b-');
    zhouqi(i) = length(imf_all(:,i))/length(zhq)
end

% Variance contribution rate
p = original;
fangcha = sum((p - mean(p)).^2)/length(p);
for i = 1:4
    imf_fch = sum((imf_all(:,i) - mean(imf_all(:,i))).^2)/length(imf(:,i));
    imf_fangcha(i) = imf_fch/fangcha;
end
imf_fangcha