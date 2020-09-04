echo off


echo Generate a Rollback script and a report listing all objects for rollbacking production in case of any issues. 
"C:\Program Files\Red Gate\Schema Compare for Oracle 5\sco.exe" /i:sdwgvac /target REDGATE/REDGATE#123@pdborcl{HR_TEST} /source REDGATE/REDGATE#123@pdborcl{HR_PROD} /sf:C:\JenkinsLocal\Artifacts\SchemaCreationProdRollback.sql /report:C:\JenkinsLocal\Artifacts\AllObjectsProdRollback.html /reporttype:Simple

rem IF ERRORLEVEL is 61 there are differences, which we expect.
IF %ERRORLEVEL% EQU 61 (
    echo == New bjects were found. Please review SchemaCreationProdRollback.sql script and AllObjectsProdRollback.html for Rollback.
    rem Reset the ERRORLEVEL to 0 so the build doesn't fail 
    SET ERRORLEVEL=0
)

rem echo == Create a Creating a scripts folder ==
rem "C:\Program Files\Red Gate\Schema Compare for Oracle 5\sco.exe" /source REDGATE/REDGATE#123@pdborcl{HR_TEST} /scriptsfolder C:\JenkinsLocal\Database 
rem echo ScripFolder creation exit code:%ERRORLEVEL% 
rem  
rem echo == Create a schema snapshot that will represent the desired state ==
rem "C:\Program Files\Red Gate\Schema Compare for Oracle 5\sco.exe"  /i:sdwgvac /source:Database{HR_TEST} "/snp:C:\JenkinsLocal\Artifacts\ReleaseStateTest.onp"
rem echo snapshot creation exit code:%ERRORLEVEL%


echo Generate a creation script and a report listing all objects for validating production. 
"C:\Program Files\Red Gate\Schema Compare for Oracle 5\sco.exe" /deploy /i:sdwgvac /source REDGATE/REDGATE#123@pdborcl{HR_TEST} /target REDGATE/REDGATE#123@pdborcl{HR_PROD} /sf:C:\JenkinsLocal\Artifacts\SchemaCreationProd.sql /report:C:\JenkinsLocal\Artifacts\AllObjectsProd.html /reporttype:Simple
 
echo Build database from state:%ERRORLEVEL%
 
rem IF ERRORLEVEL is 0 then there are no changes.
IF %ERRORLEVEL% EQU 0 (
    echo == No new objects were found.
GOTO END
)
 

rem IF ERRORLEVEL is 61 there are differences, which we expect.
IF %ERRORLEVEL% EQU 61 (
    echo == New bjects were found. Please review SchemaCreation.sql script and AllObjects.html for validation.
    rem Reset the ERRORLEVEL to 0 so the build doesn't fail 
    SET ERRORLEVEL=0
)
 
:END
EXIT /B %ERRORLEVEL%