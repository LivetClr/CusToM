function [] = Animate8(ModelParameters, AnimateParameters, varargin)
% Generation of a 3D animation with the anim8 function of the GIBBON
% TOOLBOX
%
%   INPUT
%   - ModelParameters: parameters of the musculoskeletal model,
%   automatically generated by the graphic interface 'GenerateParameters'
%   - AnimateParameters: parameters of the animation, automatically
%   generated by the graphic interface 'GenerateAnimate'
%   - varargin: number of a frame to only save a figure
%________________________________________________________
%
% Licence
% Toolbox distributed under 3-Clause BSD License
%________________________________________________________
%
% Authors : Antoine Muller, Charles Pontonnier, Pierre Puchaud and
% Georges Dumont
%________________________________________________________

filename = AnimateParameters.filename(1:end-4);

seg_anim = AnimateParameters.seg_anim;
bone_anim = AnimateParameters.bone_anim;
mass_centers_anim=AnimateParameters.mass_centers_anim;
Global_mass_center_anim=AnimateParameters.Global_mass_center_anim;
muscles_anim = AnimateParameters.muscles_anim;
mod_marker_anim = AnimateParameters.mod_marker_anim;
exp_marker_anim = AnimateParameters.exp_marker_anim;
external_force_anim = AnimateParameters.external_forces_anim;
external_force_pred = AnimateParameters.external_forces_pred;
solid_inertia_anim = 0;

% Files loading
load('BiomechanicalModel.mat'); %#ok<LOAD>
Human_model = BiomechanicalModel.OsteoArticularModel;
Markers_set = BiomechanicalModel.Markers;
Muscles = BiomechanicalModel.Muscles;
load([filename '/InverseKinematicsResults.mat']); %#ok<LOAD>
q = InverseKinematicsResults.JointCoordinates;
q6dof = InverseKinematicsResults.FreeJointCoordinates;
load([filename '/ExperimentalData.mat']); %#ok<LOAD>
real_markers = ExperimentalData.MarkerPositions;
time = ExperimentalData.Time;

% exclude non used markers
Markers_set=Markers_set(find([Markers_set.exist])); %#ok<FNDSB>

% Prelimiray computations
if seg_anim %anatomical position where other segments are attached
    [Human_model] = anat_position_solid_repere(Human_model,find(~[Human_model.mother]));
end
if bone_anim % on charge les g�om�tries osseuses.
    % scaling factors.
    %     if isfield(BiomechanicalModel.GeometricalCalibration,'k_markers')
    %         k_mk = BiomechanicalModel.GeometricalCalibration.k_markers;
    %         k_calib = BiomechanicalModel.GeometricalCalibration.k_calib(1:size(k_mk,1));
    %         k = (ModelParameters.Size/1.80)*k_mk.*k_calib;
    if isfield(BiomechanicalModel.GeometricalCalibration,'k_calib') && ~isfield(BiomechanicalModel.GeometricalCalibration,'k_markers')
        k_calib = BiomechanicalModel.GeometricalCalibration.k_calib;
        k = (ModelParameters.Size/1.80)*k_calib;
    else
        k = repmat((ModelParameters.Size/1.80),[numel(Human_model),1]);
    end
    bonespath=which('ModelGeneration.m');
    bonespath = fileparts(bonespath);
    for ii=find([Human_model.Visual])
        %TLEM or not.
        if isfield(Human_model,'Geometry') && ~isempty(Human_model(ii).Geometry)
            bonepath=fullfile(bonespath,['Geometries_' Human_model(ii).Geometry]);
        else
            bonepath=fullfile(bonespath,'Geometries');
        end
        try
            load(fullfile(bonepath, Human_model(ii).name)) %#ok<LOAD>
            nb_faces=2500;
            if length(t)>nb_faces
                bone.faces=t;
                bone.vertices=p;
                
                bone_red=reducepatch(bone,nb_faces);
                Human_model(ii).V=1.2063*k(ii)*bone_red.vertices;
                Human_model(ii).F=bone_red.faces;
            else
                Human_model(ii).V=k(ii)*p;
                Human_model(ii).F=t;
            end
        catch
            error(['3D Mesh not found of ' Human_model(ii).name]);
        end
    end
    %end
end
if mod_marker_anim || exp_marker_anim || mass_centers_anim
    %     [Fs,Vs,~]=geoSphere(1,0.01);
    %     nbFs=length(Fs);nbVs=length(Vs);
    if mod_marker_anim || exp_marker_anim
        nb_set= mod_marker_anim + exp_marker_anim;
        % Creating a mesh with all the marker to do only one gpatch
        nbmk=numel(Markers_set);
        fmk=1:1:nbmk*nb_set;
        %         Fmk=zeros(nbmk*nb_set*nbFs,3);
        %         for ii=1:nbmk*nb_set
        %             Fmk((1:nbFs)+(ii-1)*nbFs,:)=Fs+nbVs*(ii-1);
        %         end
        % Color Faces and Edges of markers
        %         CE_mk = zeros(nbVs*nbmk*nb_set,3); % RGB;
        %         C_mk = zeros(nbFs*nbmk*nb_set,3); % RGB;
        %         if mod_marker_anim && ~exp_marker_anim
        %             C_mk(1:nbFs*nbmk,:)=repmat([255 102 0]/255,[nbFs*nbmk 1]);
        %             CE_mk(1:nbVs*nbmk,:)=repmat([255 102 0]/255,[nbVs*nbmk 1]);
        %         elseif ~mod_marker_anim && exp_marker_anim
        %             C_mk(1:nbFs*nbmk,:)=repmat([0 153 255]/255,[nbFs*nbmk 1]);
        %             CE_mk(1:nbVs*nbmk,:)=repmat([0 153 255]/255,[nbVs*nbmk 1]);
        %         elseif mod_marker_anim && exp_marker_anim
        %             C_mk(1:nbFs*nbmk,:)=repmat([255 102 0]/255,[nbFs*nbmk 1]);
        %             C_mk(nbFs*nbmk+1:nbFs*nbmk*nb_set,:)=repmat([0 153 255]/255,[nbFs*nbmk 1]);
        %             CE_mk(1:nbVs*nbmk,:)=repmat([255 102 0]/255,[nbVs*nbmk 1]);
        %             CE_mk(nbVs*nbmk+1:nbVs*nbmk*nb_set,:)=repmat([0 153 255]/255,[nbVs*nbmk 1]);
        %         end
        %%%%
        C_mk = zeros(nbmk*nb_set,3); % RGB;
        if mod_marker_anim && ~exp_marker_anim
            C_mk(1:nbmk,:)=repmat([255 102 0]/255,[nbmk 1]);
        elseif ~mod_marker_anim && exp_marker_anim
            C_mk(1:nbmk,:)=repmat([0 153 255]/255,[nbmk 1]);
        elseif mod_marker_anim && exp_marker_anim
            C_mk(1:nbmk,:)=repmat([255 102 0]/255,[nbmk 1]);
            C_mk(nbmk+1:nbmk*nb_set,:)=repmat([0 153 255]/255,[nbmk 1]);
        end
    end
    if mass_centers_anim
        %         num_s_mass_center=find([Human_model_bis.Visual]);%a test
        num_s_mass_center=find([Human_model.Visual]);
        nb_ms = length(num_s_mass_center);
        %         Fms=zeros(nb_ms*nbFs,3);
        %         for ii=1:nb_ms
        %             Fms((1:nbFs)+(ii-1)*nbFs,:)=Fs+nbVs*(ii-1);
        %         end
        %         C_ms(1:nbFs*nb_ms,:)=repmat([34,139,34]/255,[nb_ms*nb_Fs 1]);
        %         CE_ms(1:nbVs*nb_ms,:)=repmat([34,139,34]/255,[nbVs*nb_ms 1]);
        C_ms(1:nb_ms,:)=repmat([34,139,34]/255,[nb_ms 1]);
    end
end
if muscles_anim
    color0 = [0.9 0.9 0.9];
    color1 = [1 0 0];
    load([filename '/MuscleForcesComputationResults.mat']); %#ok<LOAD>
    Aopt = MuscleForcesComputationResults.MuscleActivations;
end
if external_force_anim
    load([filename '/ExternalForcesComputationResults.mat']); %#ok<LOAD>
    if ~isfield(ExternalForcesComputationResults,'ExternalForcesExperiments')
        error('External Forces from the Experiments have not been computed on this trial')
    end
    external_forces = ExternalForcesComputationResults.ExternalForcesExperiments;
    color_vect_force = [53 210 55]/255;
end
if external_force_pred
    color_vect_force_p = 1-([53 210 55]/255);
    load([filename '/ExternalForcesComputationResults.mat']); %#ok<LOAD>
    if ~isfield(ExternalForcesComputationResults,'ExternalForcesPrediction')
        error('ExternalForcesPrediction have not been computed on this trial')
    end
    external_forces_pred = ExternalForcesComputationResults.ExternalForcesPrediction;
end
if external_force_anim || external_force_pred  %vector normalization
    lmax_vector_visual = 1; % longueur max du vecteur (en m)
    coef_f_visual=(ModelParameters.Mass*9.81)/lmax_vector_visual;
end
% figure
fig=cFigure; % from GIBBON
view(3); axis equal; axis tight; axis vis3d; grid on; box on;
camlight headlight; axis off; axis manual;
ax=gca;
ax.Clipping = 'off';
drawnow;

% Vid�o
if numel(varargin)
    if numel(varargin)>1
        f_affich = varargin{1};
    else
        f_affich = 1:varargin{1}:size(q,2);
    end
else
    f_affich = 1:size(q,2);
end


%Initialization animStruct
animStruct=struct();
animStruct.Time=ExperimentalData.Time;

animStruct.Handles=cell(1,size(q,2));
animStruct.Props=cell(1,size(q,2));
animStruct.Set=cell(1,size(q,2));


%% Animation frame by frame
for f=f_affich
    %Initialisation animStruct
    animStruct.Handles{f}=[];
    animStruct.Props{f}={};
    animStruct.Set{f}={};
    %% param�tres figure
    hold on
    
    %% direct kinematics
    qf(1,:)=q6dof(6,f);
    qf(2:size(q,1),:)=q(2:end,f);
    qf((size(q,1)+2):(size(q,1)+6),:)=q6dof(1:5,f);
    [Human_model_bis,Muscles_test, Markers_set_test]=...
        ForwardKinematicsAnimation8(Human_model,Markers_set,Muscles,qf,find(~[Human_model.mother]),...
        seg_anim,muscles_anim,mod_marker_anim,solid_inertia_anim);
    
    %% Segments
    if seg_anim
        V_seg=[];
        F_seg=[];
        for j=find([Human_model_bis.Visual])
            pts = Human_model_bis(j).pos_pts_anim';
            F_seg =[F_seg; nchoosek(1:size(pts,1),2)+length(V_seg)]; %need to be done before V_seg !
            V_seg=[V_seg; pts];
        end
        if f==f_affich(1)
            h_seg = gpatch(F_seg,V_seg,[],0.4*[1 1 1],1,4);
        end
        animStruct.Handles{f} = [animStruct.Handles{f} h_seg];
        animStruct.Props{f} = {animStruct.Props{f}{:},'Vertices'};
        animStruct.Set{f} = {animStruct.Set{f}{:},V_seg};
    end
    %% Bones
    if bone_anim % To do % to concatenate bones;
        X=[];
        Fbones=[];
        jj=find([Human_model_bis.Visual]);
        for j=1:length(jj)
            jjj=jj(j);
            cur_nb_V=length(Human_model_bis(jjj).V);
            cur_nb_F=length(Human_model_bis(jjj).F);
            tot_nb_F=length(Fbones);
            tot_nb_V=length(X);
            
            Fbones((1:cur_nb_F)+tot_nb_F,:)=Human_model_bis(jjj).F+tot_nb_V;
            
            onearray = ones([1,cur_nb_V]);
            if isempty(Human_model_bis(jjj).V)
                temp=[];
            else
                temp=(Human_model_bis(jjj).Tc_R0_Ri*...
                    [Human_model_bis(jjj).V';onearray ])';
            end
            X = [ X ;...
                temp];
        end
        if f==f_affich(1)
            hc = gpatch(Fbones,X(:,1:3),[227 218 201]/255*0.9,'none');
        end
        animStruct.Handles{f}=[animStruct.Handles{f} hc];
        animStruct.Props{f}={ animStruct.Props{f}{:}, 'Vertices'};
        animStruct.Set{f}={animStruct.Set{f}{:},X(:,1:3)};
        
    end
    
    %% Markers
    % Mod�le
    if mod_marker_anim || exp_marker_anim
        Vsmk=[];
        if mod_marker_anim %% Markers on the model
            for i_m = 1:numel(Markers_set_test)
                %cur_Vs=Vs+Markers_set_test(i_m).pos_anim';
                cur_Vs=Markers_set_test(i_m).pos_anim';
                Vsmk=[Vsmk;cur_Vs];
            end
        end
        % XP
        if exp_marker_anim %% Experimental markers
            for i_m = 1:numel(Markers_set_test)
                %cur_Vs=Vs+real_markers(i_m).position(f,:);
                cur_Vs=real_markers(i_m).position(f,:);
                Vsmk=[Vsmk;cur_Vs];
            end
        end
        if f==f_affich(1)
            m = patch('Faces',fmk,'Vertices',Vsmk,'FaceColor','none','FaceVertexCData',C_mk,'EdgeColor','none');
            m.Marker='o';
            m.MarkerFaceColor='flat';
            m.MarkerEdgeColor='k';
            m.MarkerSize=6;
            %             m = gpatch(Fmk,Vsmk,C_mk,CE_mk);%,[255 102 0]/255);
        end
        animStruct.Handles{f}=[animStruct.Handles{f} m];
        animStruct.Props{f}={ animStruct.Props{f}{:},'Vertices'};
        animStruct.Set{f}={animStruct.Set{f}{:},Vsmk};
    end
    %% Mass Centers
    if mass_centers_anim
        Vsms=[];
        for j=num_s_mass_center
            %             onearray = ones([1,length(Vs)]);
            %             X = (Human_model_bis(j).Tc_R0_Ri*...
            %                 [Vs';onearray ])';
            X = (Human_model_bis(j).Tc_R0_Ri(1:3,4))';
            Vsms=[Vsms;X];
        end
        if f==f_affich(1)
            %             hmass = gpatch(Fms,Vsms,...
            %                 C_ms,CE_ms);
            hmass = patch('Faces',1:nb_ms,'Vertices',Vsms,'FaceColor','none','FaceVertexCData',C_ms,'EdgeColor','none');
            hmass.Marker='o';
            hmass.MarkerFaceColor='flat';
            hmass.MarkerEdgeColor='k';
            hmass.MarkerSize=6;
        end
        animStruct.Handles{f}=[animStruct.Handles{f} hmass];
        animStruct.Props{f}={animStruct.Props{f}{:}, 'Vertices'};
        animStruct.Set{f}={animStruct.Set{f}{:},Vsms};
        
    end
    %% Global Mass Centers
    if Global_mass_center_anim
        CoM = CalcCoM(Human_model_bis);
        %         X = Vs*2+CoM'; %big sphere x2
        X = CoM';
        if f==f_affich(1)
            %             hGmass = gpatch(Fs,X,...
            %                 [34,139,34]/255,[34,139,34]/255);
            hGmass=patch('Faces',1,'Vertices',X,'FaceColor','none','FaceVertexCData',[34,139,34]/255,'EdgeColor','none');
            hGmass.Marker='o';
            hGmass.MarkerFaceColor='flat';
            hGmass.MarkerEdgeColor='k';
            hGmass.MarkerSize=10;
        end
        animStruct.Handles{f}=[animStruct.Handles{f} hGmass];
        animStruct.Props{f}={animStruct.Props{f}{:}, 'Vertices'};
        animStruct.Set{f}={animStruct.Set{f}{:},X};
    end
    %% Muscles
    if muscles_anim
        Fmu=[];
        CEmu=[];
        Vmu=[];
        color_mus = color0 + Aopt(:,f)*(color1 - color0);
        ind_mu=find([Muscles_test.exist]==1);
        for i_mu = 1:numel(ind_mu)
            mu=ind_mu(i_mu);
            pts_mu = Muscles_test(mu).pos_pts';
            nbpts_mu = size(pts_mu,1);
            cur_Fmu = repmat([1 2],[nbpts_mu-1 1])+(0:nbpts_mu-2)'+size(Vmu,1);
            Fmu =[Fmu; cur_Fmu];
            Vmu=[Vmu ;pts_mu];
            CEmu=[CEmu; repmat(color_mus(mu,:),[nbpts_mu 1])];
        end
        if f==f_affich(1)
            hmu=gpatch(Fmu,Vmu,[],CEmu,1,2);
        end
        animStruct.Handles{f} = [animStruct.Handles{f} hmu hmu];
        animStruct.Props{f} = {animStruct.Props{f}{:},'Vertices','FaceVertexCData'};
        animStruct.Set{f} = {animStruct.Set{f}{:},Vmu,CEmu};
        
    end
    %% Vectors of external forces issued from experimental data (Vecteurs efforts ext�rieurs issus de donn�es exp�rimentales)
    if external_force_anim
        extern_forces_f = external_forces(f).Visual;
        F_ef=[];V_ef=[];
        for i_for=1:size(extern_forces_f,2)
            X_array=[extern_forces_f(1,i_for),...
                extern_forces_f(4,i_for)/coef_f_visual];
            Y_array=[extern_forces_f(2,i_for),...
                extern_forces_f(5,i_for)/coef_f_visual];
            Z_array=[extern_forces_f(3,i_for),...
                extern_forces_f(6,i_for)/coef_f_visual];
            [F,V]=quiver3Dpatch(X_array(1),Y_array(1),Z_array(1),...
                X_array(2),Y_array(2),Z_array(2),[],[]);
            F_ef=[F_ef;F+size(V_ef,1)];V_ef=[V_ef;V];
        end
        if f==f_affich(1)
            Ext=gpatch(F_ef,V_ef,color_vect_force,color_vect_force,0.5);
        end
        animStruct.Handles{f} = [animStruct.Handles{f} Ext];
        animStruct.Props{f} = {animStruct.Props{f}{:},'Vertices'};
        animStruct.Set{f} = {animStruct.Set{f}{:},V_ef};
    end
    
    %% Vectors of external forces issued from prediction (Vecteurs efforts ext�rieurs issus de prediction)
    if external_force_pred
        extern_forces_f = external_forces_pred(f).Visual;
        F_efp=[];V_efp=[];
        for i_for=1:size(extern_forces_f,2)
            X_array=[extern_forces_f(1,i_for),...
                extern_forces_f(4,i_for)/coef_f_visual];
            Y_array=[extern_forces_f(2,i_for),...
                extern_forces_f(5,i_for)/coef_f_visual];
            Z_array=[extern_forces_f(3,i_for),...
                extern_forces_f(6,i_for)/coef_f_visual];
            [F,V]=quiver3Dpatch(X_array(1),Y_array(1),Z_array(1),...
                X_array(2),Y_array(2),Z_array(2),[],[]);
            F_efp=[F_efp;F+size(V_efp,1)];V_efp=[V_efp;V];
        end
        if f==f_affich(1)
            Extp=gpatch(F_efp,V_efp,color_vect_force_p,color_vect_force_p,0.5);
        end
        animStruct.Handles{f} = [animStruct.Handles{f} Extp];
        animStruct.Props{f} = {animStruct.Props{f}{:},'Vertices'};
        animStruct.Set{f} = {animStruct.Set{f}{:},V_efp};
        
    end
end

anim8(fig,animStruct);

% if ~numel(varargin)
%     close all
%     v=VideoWriter([filename '.avi']);
%     v.FrameRate=1/time(2);
%     open(v)
%     writeVideo(v,M);
%     close(v)
% end

end
