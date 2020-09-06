
echo off
echo ========================================================================================================
echo Build a LQBASE_CI_BUILD database as a validation step and for testing in the later stages
echo ========================================================================================================

echo == Drop all objects from the LQBASE_CI_BUILD schema for build integration ==
echo on
Call exit | sqlplus LQBASE_CI_BUILD/LQBaseBuild##123@ltidbpdb /DropAllObjects.sql
echo off

echo == Generate sqlscripts which are going to be executed as a part of build process ==
cd C:\Users\opc\Desktop\SONY\Liquibase\LQBASE_CI_BUILD
liquibase --changeLogFile=C:\Users\opc\Desktop\SONY\Liquibase\LQBASE\LQBASE_changeLog.xml --outputFile=LQBASE_CI_BUILD_deployment_script.sql updateSQL

echo == Execute the update command to create the objects using LQBASE_changeLog.xml file in LQBASE_CI_BUILD schema ==

liquibase --changeLogFile=C:\Users\opc\Desktop\SONY\Liquibase\LQBASE\LQBASE_changeLog.xml update