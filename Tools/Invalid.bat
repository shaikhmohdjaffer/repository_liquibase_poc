echo SELECT 'Invalid Object', object_type, object_name FROM dba_objects WHERE status != 'VALID' AND owner = 'HR_CI_BUILD' ORDER BY object_type; > C:\JenkinsLocal\Tools\get_invalid_objects.sql

rem Execute the script on the database
echo on
Call exit | sqlplus REDGATE/REDGATE#123@pdborcl @C:\JenkinsLocal\Tools\get_invalid_objects.sql > C:\JenkinsLocal\Artifacts\invalid_objects.txt
echo off
 

rem Type the output of the invalid objects query to the console
type C:\JenkinsLocal\Artifacts\invalid_objects.txt


rem Now search for instances of "Invalid Object"
call FIND /C "Invalid Object" C:\JenkinsLocal\Artifacts\invalid_objects.txt
 
for /f %%A in ('FIND /C "Invalid Object" ^< C:\JenkinsLocal\Artifacts\invalid_objects.txt') do (
  if %%A == 0 (
    echo No Invalid Objects found
    SET ERRORLEVEL=0
  ) else (
    echo Invalid Objects found
    SET ERRORLEVEL=1
  )
)

PAUSE