clc
clear


path1 = 'speech_wav';
path2 = 'music_wav';


featureMatrix1 = getMetaData(path1,1024,256);
featureMatrix2 = getMetaData(path2,1024,256);
featureMatrix  = [featureMatrix1,featureMatrix2];

n = size(featureMatrix1,2);

normFeatureMatrix  = zScoreNormalize(featureMatrix);
normFeatureMatrix1 = normFeatureMatrix(:,1:n);  %use for speech
normFeatureMatrix2 = normFeatureMatrix(:, n + 1 : end); %use for songs


%Plotting Part
figure;
scatter(normFeatureMatrix1(1,:),normFeatureMatrix1(7,:),'b','filled');
hold on 
scatter(normFeatureMatrix2(1,:),normFeatureMatrix2(7,:),'r','filled');
legend('Speech','Songs');
title('Pic 1: SC mean - SCR mean');
xlabel('SC mean value');
ylabel('SCR mean value');


figure;
scatter(normFeatureMatrix1(9,:),normFeatureMatrix1(5,:),'b','filled');
hold on 
scatter(normFeatureMatrix2(9,:),normFeatureMatrix2(5,:),'r','filled');
legend('Speech','Songs');
title('Pic 2: SF mean - ZCR mean');
xlabel('SF mean value');
ylabel('ZCR mean value');


figure;
scatter(normFeatureMatrix1(3,:),normFeatureMatrix1(4,:),'b','filled');
hold on 
scatter(normFeatureMatrix2(3,:),normFeatureMatrix2(4,:),'r','filled');
legend('Speech','Songs');
title('Pic 3: RMS mean - RMS std');
xlabel('RMS mean value');
ylabel('RMS Standard Deviation');


figure;
scatter(normFeatureMatrix1(6,:),normFeatureMatrix1(8,:),'b','filled');
hold on 
scatter(normFeatureMatrix2(6,:),normFeatureMatrix2(8,:),'r','filled');
legend('Speech','Songs');
title('Pic 4: ZCR std - SCR std');
xlabel('ZCR Standard Deviation');
ylabel('SCR Standard Deviation');


figure;
scatter(normFeatureMatrix1(2,:),normFeatureMatrix1(10,:),'b','filled');
hold on 
scatter(normFeatureMatrix2(2,:),normFeatureMatrix2(10,:),'r','filled');
legend('Speech','Songs');
title('Pic 5: SC std - SF std')
xlabel('SC Standard Deviation');
ylabel('SF Standard Deviation');


