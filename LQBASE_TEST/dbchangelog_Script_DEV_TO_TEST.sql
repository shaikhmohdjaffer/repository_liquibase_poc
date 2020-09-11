-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: C:/Users/opc/Desktop/SONY/Liquibase/LQBASE_TEST/dbchangelog_DEV_TO_TEST.xml
-- Ran at: 9/11/20 11:33 AM
-- Against: LQBASE_TEST@jdbc:oracle:thin:@152.67.2.223:1521/ltidbpdb.publicsubnet.commonvcn.oraclevcn.com
-- Liquibase version: 3.10.2
-- *********************************************************************

-- Lock Database
UPDATE LQBASE_TEST.DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = 'bastionRackware (10.20.1.3)', LOCKGRANTED = TO_TIMESTAMP('2020-09-11 11:33:02.734', 'YYYY-MM-DD HH24:MI:SS.FF') WHERE ID = 1 AND LOCKED = 0;

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE_TEST/dbchangelog_DEV_TO_TEST.xml::1599823976079-1::opc (generated)
ALTER TABLE LQBASE_TEST.CONTACTS DROP COLUMN COLUMN1;

INSERT INTO LQBASE_TEST.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599823976079-1', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE_TEST/dbchangelog_DEV_TO_TEST.xml', SYSTIMESTAMP, 48, '8:d78184716b96de29bd3bd6b781aa8d4c', 'dropColumn columnName=COLUMN1, tableName=CONTACTS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9823983815');

-- Release Database Lock
UPDATE LQBASE_TEST.DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

