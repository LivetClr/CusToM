function [] = ExternalForcesComputation(AnalysisParameters, ModelParameters, varargin)
% Computation of the external forces
%   External forces could be extracted from experimental data or could be
%   predicted thanks to motion data
%
%   INPUT
%   - AnalysisParameters: parameters of the musculoskeletal analysis,
%   automatically generated by the graphic interface 'Analysis' 
%   - ModelParameters: parameters of the musculoskeletal model, automatically
%   generated by the graphic interface 'GenerateParameters' 
%   - varargin: if the function 'ExternalForcesComputation' is used in a
%   calibration step, the variable 'BiomechanicalModel' is defined as an
%   input
%   OUTPUT: 
%   Results are automatically saved on the folder associated to each motion
%   capture in variable 'ExternalForcesComputationResults'
%________________________________________________________
%
% Licence
% Toolbox distributed under GPL 3.0 Licence
%________________________________________________________
%
% Authors : Antoine Muller, Charles Pontonnier, Pierre Puchaud and
% Georges Dumont
%________________________________________________________

if numel(varargin)
    BiomechanicalModel = varargin{1};
else
    load('BiomechanicalModel.mat'); %#ok<LOAD>
end

for i = 1:numel(AnalysisParameters.filename)
    filename = AnalysisParameters.filename{i}(1:end-(numel(AnalysisParameters.General.Extension)-1));
    if AnalysisParameters.ID.InputData == 0
        [ExternalForcesComputationResults] = ExternalForces_Zero(filename, BiomechanicalModel);
    elseif AnalysisParameters.ID.InputData == 1
        [ExternalForcesComputationResults] = AnalysisParameters.ExternalForces.Method(filename, BiomechanicalModel, AnalysisParameters); 
    elseif AnalysisParameters.ID.InputData == 2
        if  isempty(AnalysisParameters.Prediction.ContactPoint)
            error("You need to choose contact points in External Forces Prediction options. Operation aborted.");
        end
          [ExternalForcesComputationResults] = ExternalForcesPrediction(filename, AnalysisParameters, BiomechanicalModel, ModelParameters);
    end
    save([filename '/ExternalForcesComputationResults'],'ExternalForcesComputationResults');
end

end