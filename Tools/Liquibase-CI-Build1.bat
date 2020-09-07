echo off


echo == Delete objects folder and changeLog file for LQBASE schema if it already exists ==

cd C:\Users\opc\Desktop\SONY\Liquibase\LQBASE
rmdir /Q /S LQBASE/objects
echo Folder deletion exit code:%ERRORLEVEL% 

del LQBASE/LQBASE_changeLog.xml
echo changeLog file deletion exit code:%ERRORLEVEL% 

echo == Generate a changeLog file with current state of the LQBASE schema ==

liquibase --changeLogFile=LQBASE/LQBASE_changeLog.xml generateChangeLog