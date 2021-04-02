% Comparaison des trajs
close all;clear all;


CSexpe = load('/home/clivet/Documents/Thèse/Developpement_CusToM/CusToM/Examples/Scapula study/Propulsion_FRM_CS/ExperimentalData.mat');
CSexpe= CSexpe.ExperimentalData;
CSq = load('/home/clivet/Documents/Thèse/Developpement_CusToM/CusToM/Examples/Scapula study/Propulsion_FRM_CS/InverseKinematicsResults_0.mat');
CSq = CSq.InverseKinematicsResults;

CLexpe = load('/home/clivet/Documents/Thèse/Developpement_CusToM/CusToM/Examples/Scapula study/Propulsion_FRM_CL/ExperimentalData.mat');
CLexpe= CLexpe.ExperimentalData;
CLq = load('/home/clivet/Documents/Thèse/Developpement_CusToM/CusToM/Examples/Scapula study/Propulsion_FRM_CL/InverseKinematicsResults_0.mat');
CLq = CLq.InverseKinematicsResults;

TRexpe = load('/home/clivet/Documents/Thèse/Developpement_CusToM/CusToM/Examples/Scapula study/Propulsion_FRM_TR/ExperimentalData.mat');
TRexpe= TRexpe.ExperimentalData;
TRq = load('/home/clivet/Documents/Thèse/Developpement_CusToM/CusToM/Examples/Scapula study/Propulsion_FRM_TR/InverseKinematicsResults_0.mat');
TRq = TRq.InverseKinematicsResults;

load('AnalysisParameters.mat');
load('BiomechanicalModel.mat');

Joints_of_interest = {'RScapuloThoracic_J4';'RScapuloThoracic_J5';'RScapuloThoracic_J6';'RScapula'};
[~,idx] = intersect({BiomechanicalModel.OsteoArticularModel.name},Joints_of_interest);

noms=[];


figure()

for k=1:4
    subplot(2,2,k)
    hold on
    plot(180/pi*CSq.JointCoordinates(idx(k),:)','k');
%    plot(CSexpe.Time,180/pi*CSq.JointCoordinates(idx(k),:)','k');
    temp = BiomechanicalModel.OsteoArticularModel(idx(k)).comment;
    noms = [noms, temp(9:end)];
    xlabel("Time (s)")
    ylabel("Angle (degree)")
    title(temp(9:end));
    ax=gca;
    ax.FontSize=30;
    ax.FontName='Utopia';
    grid on
    ax.GridAlpha = 0.25;
end

for k=1:4
    subplot(2,2,k)
    hold on
    plot(180/pi*CLq.JointCoordinates(idx(k),:)','r');
%    plot(CLexpe.Time,180/pi*CLq.JointCoordinates(idx(k),:)','r');
    temp = BiomechanicalModel.OsteoArticularModel(idx(k)).comment;
    noms = [noms, temp(9:end)];
    xlabel("Time (s)")
    ylabel("Angle (degree)")
    title(temp(9:end));
    ax=gca;
    ax.FontSize=30;
    ax.FontName='Utopia';
    grid on
    ax.GridAlpha = 0.25;
end

for k=1:4
    subplot(2,2,k)
    hold on
    plot(180/pi*TRq.JointCoordinates(idx(k),:)','g');
%    plot(TRexpe.Time,180/pi*TRq.JointCoordinates(idx(k),:)','g');
    temp = BiomechanicalModel.OsteoArticularModel(idx(k)).comment;
    noms = [noms, temp(9:end)];
    xlabel("Time (s)")
    ylabel("Angle (degree)")
    title(temp(9:end));
    ax=gca;
    ax.FontSize=30;
    ax.FontName='Utopia';
    grid on
    ax.GridAlpha = 0.25;
    legend("CS","CL","TR")
end




%%  ------------------------- Calcul des différences de réglage ----------------------------- %%


Human_model = BiomechanicalModel.OsteoArticularModel;
Markers_set = BiomechanicalModel.Markers;

%% List of markers from the model
list_markers={};
for ii=1:numel(Markers_set)
    if Markers_set(ii).exist
        list_markers=[list_markers;Markers_set(ii).name]; %#ok<AGROW>
    end
end

%% ---------------CS EXPE  ------------

filename = "Propulsion_FRM_CS";

%% Getting real markers position from the c3d file
[real_markers, nb_frame, Firstframe, Lastframe,f_mocap] = Get_real_markers(filename,list_markers, AnalysisParameters); %#ok<ASGLU>

%% Find real_markers corresponding to scapula locator

[~, idxAA] = intersect([real_markers.name],'ScapLocAA');
[~, idxAI] = intersect([real_markers.name],'ScapLocAI');
[~, idxTS] = intersect([real_markers.name],'ScapLocTS');

%% Frame construction, using the 853 frame
numframe=853;
%TS->AA axis
x = real_markers(idxAA).position(numframe,:) - real_markers(idxTS).position(numframe,:) ;
x = x/norm(x);
temp_axis = real_markers(idxTS).position(numframe,:)- real_markers(idxAI).position(numframe,:);
% Normale au plan de la scapula
z = cross(x,temp_axis);
z =z/norm(z);
y = cross(z,x);
y=y/norm(y);

p = real_markers(idxTS).position(numframe,:)';
R = [ x'  y' z'];

TSAIAA_CS = [R'*(real_markers(idxTS).position(numframe,:)'-p)];
TSAIAA_CS = [TSAIAA_CS R'*(real_markers(idxAI).position(numframe,:)'-p)];
TSAIAA_CS = [TSAIAA_CS R'*(real_markers(idxAA).position(numframe,:)'-p)];



%% ---------------CL EXPE  ------------

filename = "Propulsion_FRM_CL";

%% Getting real markers position from the c3d file
[real_markers, nb_frame, Firstframe, Lastframe,f_mocap] = Get_real_markers(filename,list_markers, AnalysisParameters); %#ok<ASGLU>

%% Find real_markers corresponding to scapula locator

[~, idxAA] = intersect([real_markers.name],'ScapLocAA');
[~, idxAI] = intersect([real_markers.name],'ScapLocAI');
[~, idxTS] = intersect([real_markers.name],'ScapLocTS');

%% Frame construction, using the 2622 frame
numframe=2622;
%TS->AA axis
x = real_markers(idxAA).position(numframe,:) - real_markers(idxTS).position(numframe,:) ;
x = x/norm(x);
temp_axis = real_markers(idxTS).position(numframe,:)- real_markers(idxAI).position(numframe,:);
% Normale au plan de la scapula
z = cross(x,temp_axis);
z =z/norm(z);
y = cross(z,x);
y=y/norm(y);

p = real_markers(idxTS).position(numframe,:)';
R = [ x'  y' z'];

TSAIAA_CL = [R'*(real_markers(idxTS).position(numframe,:)'-p)];
TSAIAA_CL = [TSAIAA_CL R'*(real_markers(idxAI).position(numframe,:)'-p)];
TSAIAA_CL = [TSAIAA_CL R'*(real_markers(idxAA).position(numframe,:)'-p)];



%% ---------------TR EXPE  ------------

filename = 'Propulsion_FRM_TR';

%% Getting real markers position from the c3d file
[real_markers, nb_frame, Firstframe, Lastframe,f_mocap] = Get_real_markers(filename,list_markers, AnalysisParameters); %#ok<ASGLU>

%% Find real_markers corresponding to scapula locator

[~, idxAA] = intersect([real_markers.name],'ScapLocAA');
[~, idxAI] = intersect([real_markers.name],'ScapLocAI');
[~, idxTS] = intersect([real_markers.name],'ScapLocTS');

%% Frame construction, using the 2622 frame
numframe=2622;
%TS->AA axis
x = real_markers(idxAA).position(numframe,:) - real_markers(idxTS).position(numframe,:) ;
x = x/norm(x);
temp_axis = real_markers(idxTS).position(numframe,:)- real_markers(idxAI).position(numframe,:);
% Normale au plan de la scapula
z = cross(x,temp_axis);
z =z/norm(z);
y = cross(z,x);
y=y/norm(y);

p = real_markers(idxTS).position(numframe,:)';
R = [ x' y' z'];

TSAIAA_TR = [R'*(real_markers(idxTS).position(numframe,:)'-p)];
TSAIAA_TR = [TSAIAA_TR R'*(real_markers(idxAI).position(numframe,:)'-p)];
TSAIAA_TR = [TSAIAA_TR R'*(real_markers(idxAA).position(numframe,:)'-p)];

% 
% figure();
% hold on
% plot3(TSAIAA_CS(:,1),TSAIAA_CS(:,2),TSAIAA_CS(:,3),'o');
% plot3(TSAIAA_CL(:,1),TSAIAA_CL(:,2),TSAIAA_CL(:,3),'*');
% plot3(TSAIAA_TR(:,1),TSAIAA_TR(:,2),TSAIAA_TR(:,3),'d');
% legend("CS","CL","TR")
% 


figure();
hold on
plot(-TSAIAA_CS(:,2),-TSAIAA_CS(:,3),'o','MarkerSize',12,'MarkerFaceColor','k','MarkerEdgeColor','none');
plot(-TSAIAA_CL(:,2),-TSAIAA_CL(:,3),'s','MarkerSize',12,'MarkerFaceColor','r','MarkerEdgeColor','none');
plot(-TSAIAA_TR(:,2),-TSAIAA_TR(:,3),'d','MarkerSize',12,'MarkerFaceColor','g','MarkerEdgeColor','none');
legend("CS","CL","TR")
ax=gca;
ax.FontSize=30;
ax.FontName='Utopia';
grid on
ax.GridAlpha = 0.25;


incertitude_AA = norm(TSAIAA_CS(:,3) - TSAIAA_TR(:,3));
incertitude_AI = norm(TSAIAA_CS(:,2) - TSAIAA_TR(:,2));



