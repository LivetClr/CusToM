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
            
            testCase.assertEqual(InverseKinematicsResults,InverseKinematicsResults_Expected,'RelTol',1e-3,'AbsTol',1e-3);
            
               
            ExperimentalData_Expected = load([path_expectation, '/ExperimentalData.mat']);
            ExperimentalData = load([path, '/ExperimentalData.mat']);
            
            testCase.assertEqual(ExperimentalData,ExperimentalData_Expected,'RelTol',1e-3,'AbsTol',1e-3);

             ExternalForcesComputationResults_Expected = load([path_expectation, '/ExternalForcesComputationResults.mat']);
            ExternalForcesComputationResults = load([path, '/ExternalForcesComputationResults.mat']);
            
            testCase.assertEqual(ExternalForcesComputationResults,ExternalForcesComputationResults_Expected,'RelTol',1e-3,'AbsTol',1e-3);
          
            
             InverseDynamicsResults_Expected = load([path_expectation, '/InverseDynamicsResults.mat']);
            InverseDynamicsResults = load([path, '/InverseDynamicsResults.mat']);
            
            testCase.assertEqual(InverseDynamicsResults,InverseDynamicsResults_Expected,'RelTol',1e-3,'AbsTol',1e-3);

            MuscleForcesComputationResults_Expected = load([path_expectation, '/MuscleForcesComputationResults.mat']);
            MuscleForcesComputationResults = load([path, '/MuscleForcesComputationResults.mat']);
            
            
            testCase.assertEqual(MuscleForcesComputationResults.MuscleActivations,MuscleForcesComputationResults_Expected.MuscleActivations,'RelTol',1e-2,'AbsTol',1e-2);
            testCase.assertEqual(MuscleForcesComputationResults.MuscleForces,MuscleForcesComputationResults_Expected.MuscleForces,'RelTol',0.1,'AbsTol',2);
            testCase.assertEqual(MuscleForcesComputationResults.MuscleLengths,MuscleForcesComputationResults_Expected.MuscleLengths,'RelTol',0.1,'AbsTol',1e-2);
            testCase.assertEqual(MuscleForcesComputationResults.MuscleLeverArm,MuscleForcesComputationResults_Expected.MuscleLeverArm,'RelTol',0.1,'AbsTol',1e-2);
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
            
            testCase.assertEqual(InverseKinematicsResults,InverseKinematicsResults_Expected,'RelTol',1e-3,'AbsTol',1e-3);
            
            ExperimentalData_Expected = load([path_expectation, '/ExperimentalData.mat']);
            ExperimentalData = load([path, '/ExperimentalData.mat']);
            
            testCase.assertEqual(ExperimentalData,ExperimentalData_Expected,'RelTol',1e-3,'AbsTol',1e-3);
            
            ExternalForcesComputationResults_Expected = load([path_expectation, '/ExternalForcesComputationResults.mat']);
            ExternalForcesComputationResults = load([path, '/ExternalForcesComputationResults.mat']);
            
            testCase.assertEqual(ExternalForcesComputationResults,ExternalForcesComputationResults_Expected,'RelTol',1e-3,'AbsTol',1e-3);
            
            
            InverseDynamicsResults_Expected = load([path_expectation, '/InverseDynamicsResults.mat']);
            InverseDynamicsResults = load([path, '/InverseDynamicsResults.mat']);
            
            testCase.assertEqual(InverseDynamicsResults,InverseDynamicsResults_Expected,'RelTol',1e-3,'AbsTol',1e-3);
            
            
            MuscleForcesComputationResults_Expected = load([path_expectation, '/MuscleForcesComputationResults.mat']);
            MuscleForcesComputationResults = load([path, '/MuscleForcesComputationResults.mat']);
            
            testCase.assertEqual(MuscleForcesComputationResults.MuscleActivations,MuscleForcesComputationResults_Expected.MuscleActivations,'RelTol',1e-2,'AbsTol',1e-2);
            testCase.assertEqual(MuscleForcesComputationResults.MuscleForces,MuscleForcesComputationResults_Expected.MuscleForces,'RelTol',0.1,'AbsTol',2);
            testCase.assertEqual(MuscleForcesComputationResults.MuscleLengths,MuscleForcesComputationResults_Expected.MuscleLengths,'RelTol',0.1,'AbsTol',1e-2);
            testCase.assertEqual(MuscleForcesComputationResults.MuscleLeverArm,MuscleForcesComputationResults_Expected.MuscleLeverArm,'RelTol',0.1,'AbsTol',1e-2);
        end
    end
end

