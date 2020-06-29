%% Optimisation des bras de levier

%load('/home/clivet/Documents/Thèse/Developpement_CusToM/thesis/Fichiers_tests/Donnees a traiter/Ana Lucia Data - Sbj 1 - Trial 1 - Forearm model/BiomechanicalModel.mat')
load('BiomechanicalModelOrigin.mat')
%load('BiomechanicalModel_ED_full.mat');
%load('BiomechanicalModel_BRD.mat')
%name_mus='Brachioradialis';
%name_mus='ExtensorDigitorum';
%name_mus='FlexorDigitorumSuperior';

temp={BiomechanicalModel.Muscles.name};
for k=1:length(temp)
    temp2=temp{k};
    temp{k}=temp2(2:end);
end
all_muscles=unique(temp);

%% Stockage dans un fichier texte


% Brachio

% involved_solids{1}=[53;53;56;56];
% involved_solids{2}=[66;66;69;69];
% num_markersprov{1}=[44;63;12;7];
% num_markersprov{2}=[44;63;12;7];




all_muscles= {'Brachioradialis'};
%all_muscles= {'ExtensorDigitorum'};
for i=1:length(all_muscles)
    
    %% Ajout des champs utiles pour l'ExtensorDigitorum
    
    load('BiomechanicalModelOrigin.mat')
    
    name_mus=all_muscles{i};
    MomentsArmRegression=MomentsArmRegression_creationRRN();
   % MomentsArmRegression=MomentsArmRegression_creation();
    
    [~,involved_solids,num_markersprov,BiomechanicalModel]=MomentArmOptimisation(name_mus,BiomechanicalModel,MomentsArmRegression);
    
    
    
    fileID = fopen('via_points.txt','a');
    
    solid_interet=involved_solids{1};
    markers_interet=num_markersprov{1};
    
    for k=1:length(solid_interet)
        temp1=solid_interet(k);
        temp2=markers_interet(k);
        nom_pt_passage=BiomechanicalModel.OsteoArticularModel(temp1).anat_position{temp2,1};
        pt_passage=BiomechanicalModel.OsteoArticularModel(temp1).anat_position{temp2,2};
        
        %  val(x,k,:)=pt_passage;
        
        nom_pt_passage=nom_pt_passage(2:end);
        fprintf(fileID,'[Signe ''%6s''], k*Mirror*[%6.4f ; %6.4f ; %6.4f] ;... \n',nom_pt_passage,pt_passage);
        pt_passage=BiomechanicalModel.OsteoArticularModel(temp1).anat_position{temp2,2} -  BiomechanicalModel.OsteoArticularModel(temp1).c ;
        fprintf(fileID,'[Signe ''%6s''], k*Mirror*[%6.4f ; %6.4f ; %6.4f] + COM ;... \n',nom_pt_passage,pt_passage);
    end
    
    fclose(fileID);
    
    
    
    
    
end

%save('BiomechanicalModel.mat','BiomechanicalModel');





