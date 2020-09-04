
echo off
echo ========================================================================================================
echo Build a LQBASE_CI_BUILD database as a validation step and for testing in the later stages
echo ========================================================================================================

echo == Generate a changeLog file with current state of the LQBASE schema ==
cd C:\Users\opc\Desktop\SONY\Liquibase\LQBASE
liquibase --changeLogFile=LQBASE_changeLog.xml generateChangeLog
echo changeLog creation exit code:%ERRORLEVEL% 
 
echo == Generate sqlscripts which are going to be executed as a part of build process ==
cd C:\Users\opc\Desktop\SONY\Liquibase\LQBASE_CI_BUILD
liquibase --changeLogFile=C:\Users\opc\Desktop\SONY\Liquibase\LQBASE\LQBASE_changeLog.xml --outputFile=LQBASE_CI_BUILD_deployment_script.sql updateSQL
echo sqlscripts creation exit code:%ERRORLEVEL%
 
 
rem echo Run Tools/DropAllObjects.sql to drop all objects from the LQBASE_CI_BUILD schema
rem echo on
rem Call exit | sqlplus LQBASE_CI_BUILD/LQBaseBuild##123@ltidbpdb /DropAllObjects.sql
rem echo off
rem  
rem echo Build the database with the objects and generate a creation script and a report listing all objects. 
rem "C:\Program Files\Red Gate\Schema Compare for Oracle 5\sco.exe" /deploy /i:sdwgvac /source:Artifacts/ReleaseState.onp{HR_DEV} /target REDGATE/REDGATE#123@pdborcl{LQBASE_CI_BUILD} /sf:Artifacts/SchemaCreationLQBASE_CI_BUILD.sql /report:Artifacts/AllObjectsLQBASE_CI_BUILD.html /reporttype:Simple
rem  
rem echo Build database from state:%ERRORLEVEL%
 

PAUSE