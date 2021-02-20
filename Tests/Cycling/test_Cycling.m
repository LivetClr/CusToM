%% Test case from Cycling Example
import matlab.unittest.TestSuite
import matlab.unittest.TestRunner
import matlab.unittest.plugins.CodeCoveragePlugin

suite = testsuite('SolverTestCycling.m');
runner = TestRunner.withTextOutput;
runner.addPlugin(CodeCoveragePlugin.forFolder(pwd))
testCase  = SolverTestCycling;
res = runner.run(suite);