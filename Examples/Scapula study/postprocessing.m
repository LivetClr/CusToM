% Post-processing, traitement des données issues de la cinématique inverse
clear all; close all;

load('AnalysisParameters.mat');
load('BiomechanicalModel.mat');



violet = [169 90 161]/255;
orange = [245 121 58]/255;
bleufonce = [15 32 128]/255;
bleuclair = [133 192 249]/255;


filename = AnalysisParameters.filename{1}(1:end-(numel(AnalysisParameters.General.Extension)-1));
filename = 'Propulsion_FRM_CS';
addpath(genpath(filename));

load('ExperimentalData');
time = ExperimentalData.Time;

total_tests=300;

Joints_of_interest = {'RScapuloThoracic_J4';'RScapuloThoracic_J5';'RScapuloThoracic_J6';'RScapula'};
[~,idx] = intersect({BiomechanicalModel.OsteoArticularModel.name},Joints_of_interest);
idx= sort(idx);
figure()
hold on;
qcoord=zeros(length(Joints_of_interest),total_tests, length(time));


test_nb=0;   
load([filename '/InverseKinematicsResults_' num2str(test_nb) '.mat' ]);
for k=1:4
    qref(k,:) = 180/pi*InverseKinematicsResults.JointCoordinates(idx(k),:);
end
filename = 'Propulsion_FRM_CS_0.015';

for test_nb = 1:total_tests
load([filename '/InverseKinematicsResults_' num2str(test_nb) '.mat' ]);
    for k=1:4
        qcoord(k,test_nb,:) = 180/pi*InverseKinematicsResults.JointCoordinates(idx(k),:);
        RMSE(k, test_nb)= sqrt(sum((qref(k,:) - 180/pi*InverseKinematicsResults.JointCoordinates(idx(k),:)).^2)/length(time));
    end
end

% for k=1:4
%     subplot(2,2,k)
%     hold on
%     Y = [ reshape(max(qcoord(k,:,:),[],2),1,length(time)) reshape(min(qcoord(k,:,:),[],2),[],length(time)) ];
%     X = [time flip(time)];
%     pgon = polyshape(X,Y);
%     h=plot(pgon,'FaceAlpha',0.5,'FaceColor',bleuclair);
%     h.LineStyle='none';
% 
% end

for k=1:4
    subplot(2,2,k)
    hold on
    Y = [ reshape(mean(qcoord(k,:,:),2)+ 0.5*std(qcoord(k,:,:),[],2),1,length(time)) flip(reshape(mean(qcoord(k,:,:),2)-0.5* std(qcoord(k,:,:),[],2),[],length(time))) ];
    X = [time flip(time)];
    pgon = polyshape(X,Y);
    h=plot(pgon,'FaceAlpha',0.5,'FaceColor',bleuclair);
    h.LineStyle='none';

end


test_nb=0;   
noms = {};
load([ 'Propulsion_FRM_CS/InverseKinematicsResults_' num2str(test_nb) '.mat' ]);
for k=1:4
    subplot(2,2,k)
    hold on
    plot(time, qref(k,:)','Color',violet,'LineWidth',4);
    temp = BiomechanicalModel.OsteoArticularModel(idx(k)).comment;
    noms = [noms, temp(9:end)];
    xlabel("Time (s)")
    ylabel("Angle (degree)")
    title(temp(9:end));
    axis([0, time(end) -inf inf])
    ax=gca;
    ax.FontSize=50;
    ax.FontName='Utopia';
    grid on
    ax.GridAlpha = 0.25;
end



RMSEmoy = mean(RMSE,2);

figure()
b =bar(categorical(noms),RMSEmoy);
b.FaceColor =violet;
b.EdgeAlpha=0;

ax=gca;
ax.FontSize=50;
ax.FontName='Utopia';
grid on
ax.GridAlpha = 0.25;
xtickangle(ax,0);

ylabel("RMSE (degree)")
title("RMSE for each angle")


for k=1:4
    sigma_observe(k) = mean(std(qcoord(k,:,:),[],2));
end
 
precision = 1.96 * sigma_observe/sqrt(300);




