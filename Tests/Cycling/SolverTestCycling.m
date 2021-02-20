classdef SolverTestCycling < matlab.unittest.TestCase
    methods(Test)
        function testglobal(testCase)
            
        actualpath = pwd;
        cd .. 
        cd ..
        Installation;
        cd(actualpath);
        Main;
        
        path_expectation = 'JOTH_Fin_125HzModif_Expected';
        path =  'JOTH_Fin_125HzModif';
        
        
        InverseKinematicsResults_Expected = load([path_expectation, '/InverseKinematicsResults.mat']);
        InverseKinematicsResults = load([path, '/InverseKinematicsResults.mat']);
        
        testCase.assertEqual(InverseKinematicsResults_Expected,InverseKinematicsResults)
        
        
        ExperimentalData_Expected = load([path_expectation, '/ExperimentalData.mat']);
        ExperimentalData = load([path, '/ExperimentalData.mat']);
        
        testCase.assertEqual(ExperimentalData_Expected,ExperimentalData)
        
        ExternalForcesComputationResults_Expected = load([path_expectation, '/ExternalForcesComputationResults.mat']);
        ExternalForcesComputationResults = load([path, '/ExternalForcesComputationResults.mat']);
        
        testCase.assertEqual(ExternalForcesComputationResults_Expected,ExternalForcesComputationResults)
        
        
        InverseDynamicsResults_Expected = load([path_expectation, '/InverseDynamicsResults.mat']);
        InverseDynamicsResults = load([path, '/InverseDynamicsResults.mat']);
        
        testCase.assertEqual(InverseDynamicsResults_Expected,InverseDynamicsResults)
        
        
        MuscleForcesComputationResults_Expected = load([path_expectation, '/MuscleForcesComputationResults.mat']);
        MuscleForcesComputationResults = load([path, '/MuscleForcesComputationResults.mat']);
        
        testCase.assertEqual(MuscleForcesComputationResults_Expected,MuscleForcesComputationResults)
        end
    end
end

