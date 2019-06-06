function [OsteoArticularModel] = MVNXModelGeneration(ModelParameters, AnalysisParameters)
% Generation of the osteo-articular model from a MVNX file
%
%   INPUT
%   - ModelParameters: parameters of the musculoskeletal model,
%   automatically generated by the graphic interface 'GenerateParameters';
%   - AnalysisParameters: parameters of the musculoskeletal analysis,
%   automatically generated by the graphic interface 'Analysis'.
%   OUTPUT
%   The osteo-articular model is automatically saved in the variable
%   'BiomechanicalModel'.
%________________________________________________________
%
% Licence
% Toolbox distributed under 3-Clause BSD License
%________________________________________________________
%
% Authors : Antoine Muller, Charles Pontonnier, Pierre Puchaud and
% Georges Dumont
%________________________________________________________

%% Mvnx loading    
tree = load_mvnx(AnalysisParameters.filename{1});

%% Model generation

standard_pose = 'npose';

% Initialization
OsteoArticularModel=[];
% Trunk
[OsteoArticularModel] = XSens_Pelvis(OsteoArticularModel, tree, ModelParameters.Mass, [], standard_pose);
[OsteoArticularModel] = XSens_L5(OsteoArticularModel, tree, ModelParameters.Mass, 'Pelvis_jL5S1', standard_pose);
[OsteoArticularModel] = XSens_L3(OsteoArticularModel, tree, ModelParameters.Mass, 'L5_jL4L3', standard_pose);
[OsteoArticularModel] = XSens_T12(OsteoArticularModel, tree, ModelParameters.Mass, 'L3_jL1T12', standard_pose);
[OsteoArticularModel] = XSens_T8(OsteoArticularModel, tree, ModelParameters.Mass, 'T12_jT9T8', standard_pose);
[OsteoArticularModel] = XSens_Neck(OsteoArticularModel, tree, ModelParameters.Mass, 'T8_jT1C7', standard_pose);
[OsteoArticularModel] = XSens_Head(OsteoArticularModel, tree, ModelParameters.Mass, 'Neck_jC1Head', standard_pose);
% Right arm
[OsteoArticularModel] = XSens_Shoulder(OsteoArticularModel, tree, 'R', ModelParameters.Mass, 'T8_jRightT4Shoulder', standard_pose);
[OsteoArticularModel] = XSens_UpperArm(OsteoArticularModel, tree, 'R', ModelParameters.Mass, 'RightShoulder_jRightShoulder', standard_pose);
[OsteoArticularModel] = XSens_ForeArm(OsteoArticularModel, tree, 'R', ModelParameters.Mass, 'RightUpperArm_jRightElbow', standard_pose);
[OsteoArticularModel] = XSens_Hand(OsteoArticularModel, tree, 'R', ModelParameters.Mass, 'RightForeArm_jRightWrist', standard_pose);
% Left arm
[OsteoArticularModel] = XSens_Shoulder(OsteoArticularModel, tree, 'L', ModelParameters.Mass, 'T8_jLeftT4Shoulder', standard_pose);
[OsteoArticularModel] = XSens_UpperArm(OsteoArticularModel, tree, 'L', ModelParameters.Mass, 'LeftShoulder_jLeftShoulder', standard_pose);
[OsteoArticularModel] = XSens_ForeArm(OsteoArticularModel, tree, 'L', ModelParameters.Mass, 'LeftUpperArm_jLeftElbow', standard_pose);
[OsteoArticularModel] = XSens_Hand(OsteoArticularModel, tree, 'L', ModelParameters.Mass, 'LeftForeArm_jLeftWrist', standard_pose);
% Right Leg
[OsteoArticularModel] = XSens_UpperLeg(OsteoArticularModel, tree, 'R', ModelParameters.Mass, 'Pelvis_jRightHip', standard_pose);
[OsteoArticularModel] = XSens_LowerLeg(OsteoArticularModel, tree, 'R', ModelParameters.Mass, 'RightUpperLeg_jRightKnee', standard_pose);
[OsteoArticularModel] = XSens_Foot(OsteoArticularModel, tree, 'R', ModelParameters.Mass, 'RightLowerLeg_jRightAnkle', standard_pose);
[OsteoArticularModel] = XSens_Toe(OsteoArticularModel, tree, 'R', ModelParameters.Mass, 'RightFoot_jRightBallFoot', standard_pose);
% Left Leg
[OsteoArticularModel] = XSens_UpperLeg(OsteoArticularModel, tree, 'L', ModelParameters.Mass, 'Pelvis_jLeftHip', standard_pose);
[OsteoArticularModel] = XSens_LowerLeg(OsteoArticularModel, tree, 'L', ModelParameters.Mass, 'LeftUpperLeg_jLeftKnee', standard_pose);
[OsteoArticularModel] = XSens_Foot(OsteoArticularModel, tree, 'L', ModelParameters.Mass, 'LeftLowerLeg_jLeftAnkle', standard_pose);
[OsteoArticularModel] = XSens_Toe(OsteoArticularModel, tree, 'L', ModelParameters.Mass, 'LeftFoot_jLeftBallFoot', standard_pose);

BiomechanicalModel.OsteoArticularModel = OsteoArticularModel;

if ~nargout
    save('BiomechanicalModel','BiomechanicalModel');
end

%% Visual pre-generation
% XSens_Visual(OsteoArticularModel, tree);


end






