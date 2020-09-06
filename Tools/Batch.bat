echo off

echo == Delete objects folder and changeLog file for LQBASE schema if it already exists ==

rmdir /Q /S C:\Users\opc\Desktop\SONY\Liquibase\LQBASE\objects
del C:\Users\opc\Desktop\SONY\Liquibase\LQBASE\LQBASE_changeLog.xml

echo == Generate a changeLog file with current state of the LQBASE schema ==

liquibase --changeLogFile=C:\Users\opc\Desktop\SONY\Liquibase\LQBASE\LQBASE_changeLog.xml generateChangeLog



PAUSE