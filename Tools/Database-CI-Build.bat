
echo off
echo ========================================================================================================
echo Build a LQBASE_CI_BUILD database as a validation step and for testing in the later stages
echo ========================================================================================================

echo == Create a scripts folder ==
"C:\Program Files\Red Gate\Schema Compare for Oracle 5\sco.exe" /source REDGATE/REDGATE#123@pdborcl{HR_DEV} /scriptsfolder C:\JenkinsLocal\Database 
echo ScripFolder creation exit code:%ERRORLEVEL% 
 
echo == Create a schema snapshot that will represent the desired state ==
"C:\Program Files\Red Gate\Schema Compare for Oracle 5\sco.exe"  /i:sdwgvac /source:Database{HR_DEV} "/snp:Artifacts/ReleaseState.onp"
echo snapshot creation exit code:%ERRORLEVEL%
 
 
echo Run Tools/DropAllObjects.sql to drop all objects from the LQBASE_CI_BUILD schema
echo on
Call exit | sqlplus LQBASE_CI_BUILD/LQBaseBuild##123@ltidbpdb /DropAllObjects.sql
echo off
 
echo Build the database with the objects and generate a creation script and a report listing all objects. 
"C:\Program Files\Red Gate\Schema Compare for Oracle 5\sco.exe" /deploy /i:sdwgvac /source:Artifacts/ReleaseState.onp{HR_DEV} /target REDGATE/REDGATE#123@pdborcl{LQBASE_CI_BUILD} /sf:Artifacts/SchemaCreationLQBASE_CI_BUILD.sql /report:Artifacts/AllObjectsLQBASE_CI_BUILD.html /reporttype:Simple
 
echo Build database from state:%ERRORLEVEL%
 

PAUSE