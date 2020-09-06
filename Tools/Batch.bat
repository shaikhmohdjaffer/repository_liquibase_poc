echo off

echo == Delete objects folder and changeLog file for LQBASE schema if it already exists ==

cd C:\Users\opc\Desktop\SONY\Liquibase\LQBASE\

rmdir /Q /S objects
echo Folder deletion exit code:%ERRORLEVEL% 

del LQBASE_changeLog.xml
echo changeLog file deletion exit code:%ERRORLEVEL% 

echo == Generate a changeLog file with current state of the LQBASE schema ==

liquibase --changeLogFile=C:\Users\opc\Desktop\SONY\Liquibase\LQBASE\LQBASE_changeLog.xml generateChangeLog
echo ChangeLog generation exit code:%ERRORLEVEL% 

echo Run DropAllObjects.sql to drop all objects from the LQBASE_CI_BUILD schema
echo on
Call exit | sqlplus LQBASE_CI_BUILD/LQBaseBuild##123@ltidbpdb Tools/DropAllObjects.sql
echo off