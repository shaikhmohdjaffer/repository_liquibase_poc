
rem First we run a previously saved script Tools/DropAllObjects.sql to drop all objects from the HR_CI_BUILD schema

echo on
Call exit | sqlplus HR_CI_BUILD/HR_CI_BUILD@pdborcl @Tools/DropAllObjects.sql
echo off

rem Build the database with the objects and generate a creation script and a report listing all objects. 
"C:\Program Files\Red Gate\Schema Compare for Oracle 5\sco.exe" /deploy /i:sdwgvac /source:REDGATE/REDGATE#123@pdborcl{HR_DEV} /target:REDGATE/REDGATE#123@pdborcl{HR_CI_BUILD}  /sf:Artifacts/CI_Build_database_creation_script.sql /report:Artifacts/CI_Build_all_objects_report.html 
 
echo Build database from state:%ERRORLEVEL%
 
rem IF ERRORLEVEL is 0 then there are no changes.
IF %ERRORLEVEL% EQU 0 (
    echo ========================================================================================================
    echo == Warning - No schema changes detected. Does the database have any new schema objects?
    echo ========================================================================================================
)
 
rem IF ERRORLEVEL is 61 there are differences, which we expect.
IF %ERRORLEVEL% EQU 61 (
    echo ========================================================================================================
    echo == Objects were found and built. Schema creation script CI_Build_database_creation_script.sql and change report CI_Build_all_objects_report.html has been are saved as artifacts.
    echo ========================================================================================================
    rem Reset the ERRORLEVEL to 0 so the build doesn't fail 
    SET ERRORLEVEL=0
)