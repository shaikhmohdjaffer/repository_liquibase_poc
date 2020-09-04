echo off
echo ========================================================================================================
echo Build a HR_CI_BUILD database as a validation step and for testing in the later stages
echo ========================================================================================================

echo == Create a scripts folder ==
"C:\Program Files\Red Gate\Schema Compare for Oracle 5\sco.exe" /source REDGATE/REDGATE#123@pdborcl{HR_DEV} /scriptsfolder C:\JenkinsLocal\Database 
echo ScripFolder creation exit code:%ERRORLEVEL% 
 
echo == Create a schema snapshot that will represent the desired state ==
"C:\Program Files\Red Gate\Schema Compare for Oracle 5\sco.exe"  /i:sdwgvac /source:Database{HR_DEV} "/snp:Artifacts/ReleaseState.onp"
echo snapshot creation exit code:%ERRORLEVEL%
 
 
rem echo Run Tools/DropAllObjects.sql to drop all objects from the HR_CI_BUILD schema
rem echo on
rem Call exit | sqlplus HR_CI_BUILD/HR_CI_BUILD@pdborcl @Tools/DropAllObjects.sql
rem echo off
 
echo Build the database with the objects and generate a creation script and a report listing all objects. 
"C:\Program Files\Red Gate\Schema Compare for Oracle 5\sco.exe" /deploy /i:sdwgvac /source:Artifacts/ReleaseState.onp{HR_DEV} /target REDGATE/REDGATE#123@pdborcl{HR_CI_BUILD} /sf:Artifacts/SchemaCreationHR_CI_BUILD.sql /report:Artifacts/AllObjectsHR_CI_BUILD.html /reporttype:Simple
 
echo Build database from state:%ERRORLEVEL%
 
rem IF ERRORLEVEL is 0 then there are no changes.
IF %ERRORLEVEL% EQU 0 (
    echo == Warning - No New objects were found
GOTO DATA
)
 

rem IF ERRORLEVEL is 61 there are differences, which we expect.
IF %ERRORLEVEL% EQU 61 (
    echo == Objects were found and built.
    rem Reset the ERRORLEVEL to 0 so the build doesn't fail 
    SET ERRORLEVEL=0
)

:DATA

rem echo == Include static data, a feature of Data Compare v5
rem echo (this step is intentionally left out of this demo script)
rem  "C:\Program Files\Red Gate\Data Compare for Oracle 5\dco.exe" /deploy /source REDGATE/REDGATE#123@pdborcl{HR_DEV} /target REDGATE/REDGATE#123@pdborcl{HR_CI_BUILD} /sf:Artifacts/static_data_creation_script.sql
rem  IF %ERRORLEVEL% EQU 61 (
rem      echo ========================================================================================================
rem      echo == Static data was found and added.
rem      echo ========================================================================================================
rem       Reset the ERRORLEVEL to 0 so the build doesn't fail 
rem      SET ERRORLEVEL=0
rem  )
rem  
rem  echo Data added from state:%ERRORLEVEL%

 
:END
EXIT /B %ERRORLEVEL%

PAUSE