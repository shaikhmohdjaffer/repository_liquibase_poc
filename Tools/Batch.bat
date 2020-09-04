echo off

echo == Delete objects folder and changeLog file for LQBASE schema if it already exists ==

cd C:\Users\opc\Desktop\SONY\Liquibase\LQBASE

rmdir /Q /S objects
del LQBASE_changeLog.xml

IF %ERRORLEVEL% NEQ 0 (
echo objects folder and changeLog file does not exists
)


echo == Generate a changeLog file with current state of the LQBASE schema ==

liquibase --changeLogFile=LQBASE_changeLog.xml generateChangeLog



PAUSE