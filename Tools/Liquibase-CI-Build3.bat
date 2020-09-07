echo off

echo == 
echo == 

echo == Execute the update command to create the objects using LQBASE_changeLog.xml file in LQBASE_CI_BUILD schema

cd C:\Users\opc\Desktop\SONY\Liquibase\LQBASE_CI_BUILD

liquibase --changeLogFile=C:\Users\opc\Desktop\SONY\Liquibase\LQBASE\LQBASE_changeLog.xml update