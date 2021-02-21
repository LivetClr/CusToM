classdef SolverTestCycling < matlab.unittest.TestCase
    methods(Test)
        function KinematicTest(testCase)
            
            actualpath = pwd;
            cd ..
            cd ..
            Installation;
            cd(actualpath);
            
            load('AnalysisParameters.mat');
            
            InverseKinematics(AnalysisParameters);
            
            path_expectation = 'JOTH_Fin_125HzModif_Expected';
            path =  'JOTH_Fin_125HzModif';
            
            
            InverseKinematicsResults_Expected = load([path_expectation, '/InverseKinematicsResults.mat']);
            InverseKinematicsResults = load([path, '/InverseKinematicsResults.mat']);
            
            testCase.assertEqual(InverseKinematicsResults,InverseKinematicsResults_Expected,'AbsTol',1e-6);
            
        end
        
        function ExperimentalDataTest(testCase)
            
            actualpath = pwd;
            cd ..
            cd ..
            Installation;
            cd(actualpath);
            
            load('AnalysisParameters.mat');
            load('ModelParameters.mat');
            
            InverseKinematics(AnalysisParameters);
            ExternalForcesComputation(AnalysisParameters, ModelParameters);

            path_expectation = 'JOTH_Fin_125HzModif_Expected';
            path =  'JOTH_Fin_125HzModif';
            
            
            InverseKinematicsResults_Expected = load([path_expectation, '/InverseKinematicsResults.mat']);
            InverseKinematicsResults = load([path, '/InverseKinematicsResults.mat']);
            
            testCase.assertEqual(InverseKinematicsResults,InverseKinematicsResults_Expected,'AbsTol',1e-6);
            
               
            ExperimentalData_Expected = load([path_expectation, '/ExperimentalData.mat']);
            ExperimentalData = load([path, '/ExperimentalData.mat']);
            
            testCase.assertEqual(ExperimentalData,ExperimentalData_Expected,'AbsTol',1e-6);
            
            ExternalForcesComputationResults_Expected = load([path_expectation, '/ExternalForcesComputationResults.mat']);
            ExternalForcesComputationResults = load([path, '/ExternalForcesComputationResults.mat']);
            
            testCase.assertEqual(ExternalForcesComputationResults,ExternalForcesComputationResults_Expected,'AbsTol',1e-6);
          

            
        end
        
        
        function InverseDynamicsTest(testCase)
            
            actualpath = pwd;
            cd ..
            cd ..
            Installation;
            cd(actualpath);
            
            load('AnalysisParameters.mat');
            load('ModelParameters.mat');
            
            InverseKinematics(AnalysisParameters);
            ExternalForcesComputation(AnalysisParameters, ModelParameters);

            path_expectation = 'JOTH_Fin_125HzModif_Expected';
            path =  'JOTH_Fin_125HzModif';
            
            
            InverseKinematicsResults_Expected = load([path_expectation, '/InverseKinematicsResults.mat']);
            InverseKinematicsResults = load([path, '/InverseKinematicsResults.mat']);
            
            testCase.assertEqual(InverseKinematicsResults,InverseKinematicsResults_Expected,'AbsTol',1e-6);
            
               
            ExperimentalData_Expected = load([path_expectation, '/ExperimentalData.mat']);
            ExperimentalData = load([path, '/ExperimentalData.mat']);
            
            testCase.assertEqual(ExperimentalData,ExperimentalData_Expected,'RelTol',1e-6);

             ExternalForcesComputationResults_Expected = load([path_expectation, '/ExternalForcesComputationResults.mat']);
            ExternalForcesComputationResults = load([path, '/ExternalForcesComputationResults.mat']);
            
            testCase.assertEqual(ExternalForcesComputationResults,ExternalForcesComputationResults_Expected,'AbsTol',1e-6);
          
            
             InverseDynamicsResults_Expected = load([path_expectation, '/InverseDynamicsResults.mat']);
            InverseDynamicsResults = load([path, '/InverseDynamicsResults.mat']);
            
            testCase.assertEqual(InverseDynamicsResults,InverseDynamicsResults_Expected,'AbsTol',1e-6);

        end
        
                
        function MuscleForcesTest(testCase)
            
            actualpath = pwd;
            cd ..
            cd ..
            Installation;
            cd(actualpath);
            
            load('AnalysisParameters.mat');
            load('ModelParameters.mat');
            
            InverseKinematics(AnalysisParameters);
            ExternalForcesComputation(AnalysisParameters, ModelParameters);

            path_expectation = 'JOTH_Fin_125HzModif_Expected';
            path =  'JOTH_Fin_125HzModif';
            
            
            InverseKinematicsResults_Expected = load([path_expectation, '/InverseKinematicsResults.mat']);
            InverseKinematicsResults = load([path, '/InverseKinematicsResults.mat']);
            
            testCase.assertEqual(InverseKinematicsResults,InverseKinematicsResults_Expected,'AbsTol',1e-6);
            
               
            ExperimentalData_Expected = load([path_expectation, '/ExperimentalData.mat']);
            ExperimentalData = load([path, '/ExperimentalData.mat']);
            
            testCase.assertEqual(ExperimentalData,ExperimentalData_Expected,'AbsTol',1e-6);

             ExternalForcesComputationResults_Expected = load([path_expectation, '/ExternalForcesComputationResults.mat']);
            ExternalForcesComputationResults = load([path, '/ExternalForcesComputationResults.mat']);
            
            testCase.assertEqual(ExternalForcesComputationResults,ExternalForcesComputationResults_Expected,'AbsTol',1e-6);
          
            
             InverseDynamicsResults_Expected = load([path_expectation, '/InverseDynamicsResults.mat']);
            InverseDynamicsResults = load([path, '/InverseDynamicsResults.mat']);
            
            testCase.assertEqual(InverseDynamicsResults,InverseDynamicsResults_Expected,'AbsTol',1e-6);

            MuscleForcesComputationResults_Expected = load([path_expectation, '/MuscleForcesComputationResults.mat']);
            MuscleForcesComputationResults = load([path, '/MuscleForcesComputationResults.mat']);
            
            testCase.assertEqual(MuscleForcesComputationResults,MuscleForcesComputationResults_Expected,'AbsTol',1e-6);
            
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
            
            testCase.assertEqual(InverseKinematicsResults,InverseKinematicsResults_Expected,'AbsTol',1e-6);
            
            ExperimentalData_Expected = load([path_expectation, '/ExperimentalData.mat']);
            ExperimentalData = load([path, '/ExperimentalData.mat']);
            
            testCase.assertEqual(ExperimentalData,ExperimentalData_Expected,'AbsTol',1e-6);
            
            ExternalForcesComputationResults_Expected = load([path_expectation, '/ExternalForcesComputationResults.mat']);
            ExternalForcesComputationResults = load([path, '/ExternalForcesComputationResults.mat']);
            
            testCase.assertEqual(ExternalForcesComputationResults,ExternalForcesComputationResults_Expected,'AbsTol',1e-6);
            
            
            InverseDynamicsResults_Expected = load([path_expectation, '/InverseDynamicsResults.mat']);
            InverseDynamicsResults = load([path, '/InverseDynamicsResults.mat']);
            
            testCase.assertEqual(InverseDynamicsResults,InverseDynamicsResults_Expected,'AbsTol',1e-6);
            
            
            MuscleForcesComputationResults_Expected = load([path_expectation, '/MuscleForcesComputationResults.mat']);
            MuscleForcesComputationResults = load([path, '/MuscleForcesComputationResults.mat']);
            
            testCase.assertEqual(MuscleForcesComputationResults,MuscleForcesComputationResults_Expected,'AbsTol',1e-6);
        end
    end
end

