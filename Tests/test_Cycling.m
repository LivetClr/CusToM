%% Test case from Cycling Example

testCase = matlab.unittest.TestCase.forInteractiveUse;

Main;

path_expectation = 'JOTH_Fin_125HzModif_Expected';
path =  'JOTH_Fin_125HzModif';


InverseKinematicsResults_Expected = load([path_expectation, '/InverseKinematicsResults.mat']);
InverseKinematicsResults = load([path_expectation, '/InverseKinematicsResults.mat']);

assertEqual(testCase,InverseKinematicsResults_Expected,InverseKinematicsResults)


ExperimentalData_Expected = load([path_expectation, '/ExperimentalData.mat']);
ExperimentalData = load([path_expectation, '/ExperimentalData.mat']);

assertEqual(testCase,ExperimentalData_Expected,ExperimentalData)

ExternalForcesComputationResults_Expected = load([path_expectation, '/ExternalForcesComputationResults.mat']);
ExternalForcesComputationResults = load([path_expectation, '/ExternalForcesComputationResults.mat']);

assertEqual(testCase,ExternalForcesComputationResults_Expected,ExternalForcesComputationResults)


InverseDynamicsResults_Expected = load([path_expectation, '/InverseDynamicsResults.mat']);
InverseDynamicsResults = load([path_expectation, '/InverseDynamicsResults.mat']);

assertEqual(testCase,InverseDynamicsResults_Expected,InverseDynamicsResults)


MuscleForcesComputationResults_Expected = load([path_expectation, '/MuscleForcesComputationResults.mat']);
MuscleForcesComputationResults = load([path_expectation, '/MuscleForcesComputationResults.mat']);

assertEqual(testCase,MuscleForcesComputationResults,MuscleForcesComputationResults)

