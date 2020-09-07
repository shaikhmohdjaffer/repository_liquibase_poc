-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: C:/Users/opc/Desktop/SONY/Liquibase/LQBASE_PROD/dbchangelog_TEST_TO_PROD.xml
-- Ran at: 9/7/20 2:32 PM
-- Against: LQBASE_PROD@jdbc:oracle:thin:@152.67.2.223:1521/ltidbpdb.publicsubnet.commonvcn.oraclevcn.com
-- Liquibase version: 3.10.2
-- *********************************************************************

-- Lock Database
UPDATE LQBASE_PROD.DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = 'bastionRackware (10.20.1.3)', LOCKGRANTED = TO_TIMESTAMP('2020-09-07 14:32:01.239', 'YYYY-MM-DD HH24:MI:SS.FF') WHERE ID = 1 AND LOCKED = 0;

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE_PROD/dbchangelog_TEST_TO_PROD.xml::1599489108742-2::opc (generated)
ALTER TABLE LQBASE_PROD.CONTACTS ADD LINKEDIN VARCHAR2(20 BYTE);

INSERT INTO LQBASE_PROD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599489108742-2', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE_PROD/dbchangelog_TEST_TO_PROD.xml', SYSTIMESTAMP, 41, '8:ac6dcd2816257c73bfd007141480235a', 'addColumn tableName=CONTACTS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9489129437');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE_PROD/dbchangelog_TEST_TO_PROD.xml::1599489108742-1::opc (generated)
CREATE OR REPLACE FORCE VIEW CUSTOMER_SALES (CUSTOMER_NAME, SALES_AMOUNT, YEAR) AS SELECT
    name AS customer_name,
    SUM( quantity * unit_price ) sales_amount,
    EXTRACT(
        YEAR
    FROM
        order_date
    ) YEAR
FROM
    orders
INNER JOIN order_items
        USING(order_id)
INNER JOIN customers
        USING(customer_id)
WHERE
    status = 'Shipped'
GROUP BY
    name,
    EXTRACT(
        YEAR
    FROM
        order_date
    );

INSERT INTO LQBASE_PROD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599489108742-1', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE_PROD/dbchangelog_TEST_TO_PROD.xml', SYSTIMESTAMP, 42, '8:8267830f5fcaffb26687ffaacf9b31ec', 'createView viewName=CUSTOMER_SALES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9489129437');

-- Release Database Lock
UPDATE LQBASE_PROD.DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

