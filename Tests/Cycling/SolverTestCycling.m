classdef SolverTestCycling < matlab.unittest.TestCase
    methods(Test)
        function ResultsTestWithoutComputingHumanModel(testCase)
            
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
            
            testCase.assertEqual(InverseKinematicsResults,InverseKinematicsResults_Expected,'RelTol',1e-4,'AbsTol',1e-5);
            
               
            ExperimentalData_Expected = load([path_expectation, '/ExperimentalData.mat']);
            ExperimentalData = load([path, '/ExperimentalData.mat']);
            
            testCase.assertEqual(ExperimentalData,ExperimentalData_Expected,'RelTol',1e-4,'AbsTol',1e-5);

             ExternalForcesComputationResults_Expected = load([path_expectation, '/ExternalForcesComputationResults.mat']);
            ExternalForcesComputationResults = load([path, '/ExternalForcesComputationResults.mat']);
            
            testCase.assertEqual(ExternalForcesComputationResults,ExternalForcesComputationResults_Expected,'RelTol',1e-4,'AbsTol',1e-5);
          
            
             InverseDynamicsResults_Expected = load([path_expectation, '/InverseDynamicsResults.mat']);
            InverseDynamicsResults = load([path, '/InverseDynamicsResults.mat']);
            
            testCase.assertEqual(InverseDynamicsResults,InverseDynamicsResults_Expected,'RelTol',1e-4,'AbsTol',1e-5);

            MuscleForcesComputationResults_Expected = load([path_expectation, '/MuscleForcesComputationResults.mat']);
            MuscleForcesComputationResults = load([path, '/MuscleForcesComputationResults.mat']);
            
            testCase.assertEqual(MuscleForcesComputationResults,MuscleForcesComputationResults_Expected,'RelTol',1e-4,'AbsTol',1e-5);
            
        end
        
        
        function testglobal(testCase)
            
            
            actualpath = pwd;
            cd ..
            cd ..
            Installation;
            cd(actualpath);
            
            delete('BiomechanicalModel.mat');
            
            Main;
            
            
            path_expectation = 'JOTH_Fin_125HzModif_Expected';
            path =  'JOTH_Fin_125HzModif';
            
            
            InverseKinematicsResults_Expected = load([path_expectation, '/InverseKinematicsResults.mat']);
            InverseKinematicsResults = load([path, '/InverseKinematicsResults.mat']);
            
            testCase.assertEqual(InverseKinematicsResults,InverseKinematicsResults_Expected,'RelTol',1e-4,'AbsTol',1e-5);
            
            ExperimentalData_Expected = load([path_expectation, '/ExperimentalData.mat']);
            ExperimentalData = load([path, '/ExperimentalData.mat']);
            
            testCase.assertEqual(ExperimentalData,ExperimentalData_Expected,'RelTol',1e-4,'AbsTol',1e-5);
            
            ExternalForcesComputationResults_Expected = load([path_expectation, '/ExternalForcesComputationResults.mat']);
            ExternalForcesComputationResults = load([path, '/ExternalForcesComputationResults.mat']);
            
            testCase.assertEqual(ExternalForcesComputationResults,ExternalForcesComputationResults_Expected,'RelTol',1e-4,'AbsTol',1e-5);
            
            
            InverseDynamicsResults_Expected = load([path_expectation, '/InverseDynamicsResults.mat']);
            InverseDynamicsResults = load([path, '/InverseDynamicsResults.mat']);
            
            testCase.assertEqual(InverseDynamicsResults,InverseDynamicsResults_Expected,'RelTol',1e-4,'AbsTol',1e-5);
            
            
            MuscleForcesComputationResults_Expected = load([path_expectation, '/MuscleForcesComputationResults.mat']);
            MuscleForcesComputationResults = load([path, '/MuscleForcesComputationResults.mat']);
            
            testCase.assertEqual(MuscleForcesComputationResults,MuscleForcesComputationResults_Expected,'RelTol',1e-4,'AbsTol',1e-5);
        end
    end
end

