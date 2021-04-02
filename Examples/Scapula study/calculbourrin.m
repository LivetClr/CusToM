%% Lancement calcul bourrin
clear all; close all;

load('AnalysisParameters.mat');
load('BiomechanicalModel.mat');

Joints_of_interest = {'RScapuloThoracic_J4';'RScapuloThoracic_J5';'RScapuloThoracic_J6';'RScapula'};
[~,idx] = intersect({BiomechanicalModel.OsteoArticularModel.name},Joints_of_interest);
idx = sort(idx);
std_entree = [0.5,1,1.5,2,2.5,3,3.5]*1e-2;
%std_entree = [1,1.5]*1e-2;
total_tests = 200;

violet = [169 90 161]/255;
orange = [245 121 58]/255;
bleufonce = [15 32 128]/255;
bleuclair = [133 192 249]/255;

% parfor pp=1:length(std_entree)
%      InverseKinematics(AnalysisParameters,BiomechanicalModel,std_entree(pp),200);
% end


load('Propulsion_FRM_CS/ExperimentalData');

time = ExperimentalData.Time;

for pp=1:length(std_entree)
    filename = ['Propulsion_FRM_CS_', num2str(std_entree(pp))];
    addpath(genpath(filename));
    
    
    
    test_nb=0;
    load( ['Propulsion_FRM_CS/InverseKinematicsResults_' num2str(test_nb) '.mat' ]);
    for k=1:4
        qref(k,:) = 180/pi*InverseKinematicsResults.JointCoordinates(idx(k),:);
    end
    
    for test_nb = 1:total_tests
        load([filename '/InverseKinematicsResults_' num2str(test_nb) '.mat' ]);
        for k=1:4
            qcoord(k,test_nb,:) = 180/pi*InverseKinematicsResults.JointCoordinates(idx(k),:);
            qecart(k,pp,test_nb,:) = (qref(k,:) - 180/pi*InverseKinematicsResults.JointCoordinates(idx(k),:));
            stdbruit(k,pp,test_nb) = std(InverseKinematicsResults.Bruit.depfixe(:));
        end
    end
    
    for k=1:4
        stdcoord(k,pp,:) = reshape(std(qecart(k,pp,:,:)),1,length(time)) ;
        stdcoordtest(k,pp,:) = reshape(mean(qecart(k,pp,:,:),4),1,test_nb) ;
    end
    
    
    for k=1:4
        sigma_observe(k,pp) = mean(stdcoord(k,pp,:) );
    end
    
    precision(:,pp) = 1.96 * sigma_observe(:,pp)/sqrt(total_tests);
    
    
end

for pp =1:length(std_entree)
    figure()
    for k=1:4
        subplot(2,2,k);
        temp = reshape(stdcoord(k,pp,:),1,length(time));
        plot(qref(k,:),temp,'o')
        xlabel("Angle (degree)")
        ylabel("\sigma_{angle} (degree)")
        temp = BiomechanicalModel.OsteoArticularModel(idx(k)).comment;
        title(temp(9:end));
    end
    sgtitle(['\sigma_{settings} :' , num2str(std_entree(pp))])
end





noms=[];
symboles={'o','d','p','s'};
traits={'--','-','-.',':'};
colors  = [violet;bleufonce;bleuclair;orange];
figure()
hold on
for k=1:4
e = errorbar(std_entree*100,sigma_observe(k,:),0.5*precision(k,:),symboles{k},'MarkerEdgeColor','k','MarkerFaceColor',colors(k,:),'LineWidth',5,'MarkerSize',30);
e.Color = colors(k,:);
    temp = BiomechanicalModel.OsteoArticularModel(idx(k)).comment;
    [p1,S] = polyfit(std_entree*100,sigma_observe(k,:),1);
    R1 = 1 - (S.normr/norm(sigma_observe(k,:)- mean(sigma_observe(k,:))))^2;
    noms = [noms, { temp(9:end) }];
end

for k=1:4
[p1,S] = polyfit(std_entree*100,sigma_observe(k,:),1);
R1 = 1 - (S.normr/norm(sigma_observe(k,:)- mean(sigma_observe(k,:))))^2;
plot(std_entree*100,polyval(p1,std_entree*100),traits{k},'Color',colors(k,:),'LineWidth',5);
% if k==1
%        text(0.0235483870967742*100, 7.76641547856702 , ['y = ' ,num2str(p1(1),3) ,'x ' ,num2str(p1(2),3) ,', R^2 =', num2str(R1,3)],'FontSize',20)
% elseif k==2
%    text(0.027741935483871*100, 4.31867331379312 , ['y = ' ,num2str(p1(1),3) ,'x ' ,num2str(p1(2),3) ,', R^2 =', num2str(R1,3)],'FontSize',20)
% elseif k==3
%    text(0.013508064516129*100 , 7.51198685424884 , ['y = ' ,num2str(p1(1),3) ,'x ' ,num2str(p1(2),3) ,', R^2 =', num2str(R1,3)],'FontSize',20)
% else
%        text(0.0225201612903226*100 , 5.60166452071261, ['y = ' ,num2str(p1(1),3) ,'x ' ,num2str(p1(2),3) ,', R^2 =', num2str(R1,3)],'FontSize',20)
% end
    noms = [noms, {  ['\sigma_{angle} = ' ,num2str(p1(1),3) ,'\sigma_{settings} ' ,num2str(p1(2),3) ,', R^2 =', num2str(R1,3)]}];
end
xlabel("\sigma_{settings} (cm)")
ylabel("\sigma_{angle} (degree)")
[leg,objh]=legend(noms,'Location','NorthWest','Fontsize',40);
xlim([min(std_entree*100) max(std_entree*100)]);
ylim([-inf  inf]);
leg.ItemTokenSize = [30,100];
ax=gca;
ax.FontSize=60;
ax.FontName='Utopia';
grid on
ax.GridAlpha = 0.5;

%// set font size as desired
[leg,objh]=legend(noms,'Location','NorthWest','Fontsize',37);
objhl = findobj(objh, 'type', 'line'); %// objects of legend of type line
set(objhl, 'Markersize', 30); %// set marker size as desired

% figure(); hold on 
% for k=1:4
%     temp =reshape(stdbruit(k,:,:),1,200*7);
%     
%     scatter(reshape(stdbruit(k,:,:),1,200*7),reshape(stdcoordtest(k,:,:),1,200*7))
%     
% end
% 
% 
% figure(); hold on 
% for k=1:4
%     temp =reshape(stdbruit(k,:,:),1,200*7);
%     temp2 =reshape(stdcoordtest(k,:,:),1,200*7);
%     h = chi2gof(temp2,'Alpha', 0.05)
%     hist(temp2);
% end

