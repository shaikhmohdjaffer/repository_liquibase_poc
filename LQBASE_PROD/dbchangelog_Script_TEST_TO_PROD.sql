-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: C:/Users/opc/Desktop/SONY/Liquibase/LQBASE_PROD/dbchangelog_TEST_TO_PROD.xml
-- Ran at: 9/11/20 8:38 AM
-- Against: LQBASE_PROD@jdbc:oracle:thin:@152.67.2.223:1521/ltidbpdb.publicsubnet.commonvcn.oraclevcn.com
-- Liquibase version: 3.10.2
-- *********************************************************************

-- Lock Database
UPDATE LQBASE_PROD.DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = 'bastionRackware (10.20.1.3)', LOCKGRANTED = TO_TIMESTAMP('2020-09-11 08:38:25.32', 'YYYY-MM-DD HH24:MI:SS.FF') WHERE ID = 1 AND LOCKED = 0;

-- Release Database Lock
UPDATE LQBASE_PROD.DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

