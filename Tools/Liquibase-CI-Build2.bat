echo off

echo == 
echo == 

echo == Drop all objects from the LQBASE_CI_BUILD schema for build integration ==
echo on
Call exit | sqlplus LQBASE/LQBase##123@ltidbpdb @C:\Users\opc\Desktop\SONY\Liquibase\Tools\Drop_LQBASE_CI_BUILD.sql
echo off

echo == Generate sqlscripts which are going to be executed as a part of build process ==
cd C:\Users\opc\Desktop\SONY\Liquibase\LQBASE_CI_BUILD
liquibase --changeLogFile=C:\Users\opc\Desktop\SONY\Liquibase\LQBASE\LQBASE_changeLog.xml --outputFile=LQBASE_CI_BUILD_deployment_script.sql updateSQL

