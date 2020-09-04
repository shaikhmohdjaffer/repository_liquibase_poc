echo off

echo == Create a Creating a scripts folder ==
"C:\Program Files\Red Gate\Schema Compare for Oracle 5\sco.exe" /source REDGATE/REDGATE#123@pdborcl{HR_TEST} /scriptsfolder C:\JenkinsLocal\Database 
echo ScripFolder creation exit code:%ERRORLEVEL% 
 
echo == Create a schema snapshot that will represent the desired state ==
"C:\Program Files\Red Gate\Schema Compare for Oracle 5\sco.exe"  /i:sdwgvac /source:Database{HR_TEST} "/snp:C:\JenkinsLocal\Artifacts\ReleaseStateTest.onp"
echo snapshot creation exit code:%ERRORLEVEL%

 
echo Generate a creation script and a report listing all objects. 
"C:\Program Files\Red Gate\Schema Compare for Oracle 5\sco.exe" /i:sdwgvac /source:Artifacts/ReleaseStateTest.onp{HR_TEST} /target REDGATE/REDGATE#123@pdborcl{HR_PROD} /sf:C:\JenkinsLocal\Artifacts\SchemaCreationTestProd.sql /report:C:\JenkinsLocal\Artifacts\AllObjectsTestProd.html /reporttype:Simple
 
echo Build database from state:%ERRORLEVEL%
 
rem IF ERRORLEVEL is 0 then there are no changes.
IF %ERRORLEVEL% EQU 0 (
    echo == No new objects were found.
GOTO END
)
 

rem IF ERRORLEVEL is 61 there are differences, which we expect.
IF %ERRORLEVEL% EQU 61 (
    echo == New bjects were found. Please review SchemaCreation.sql script and AllObjects.html before deploying to Next environment.
    rem Reset the ERRORLEVEL to 0 so the build doesn't fail 
    SET ERRORLEVEL=0
)
 
:END
EXIT /B %ERRORLEVEL%