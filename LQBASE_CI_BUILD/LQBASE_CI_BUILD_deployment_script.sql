-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml
-- Ran at: 9/7/20 4:07 PM
-- Against: LQBASE_CI_BUILD@jdbc:oracle:thin:@152.67.2.223:1521/ltidbpdb.publicsubnet.commonvcn.oraclevcn.com
-- Liquibase version: 3.10.2
-- *********************************************************************

-- Create Database Lock Table
CREATE TABLE LQBASE_CI_BUILD.DATABASECHANGELOGLOCK (ID INTEGER NOT NULL, LOCKED NUMBER(1) NOT NULL, LOCKGRANTED TIMESTAMP, LOCKEDBY VARCHAR2(255), CONSTRAINT PK_DATABASECHANGELOGLOCK PRIMARY KEY (ID));

-- Initialize Database Lock Table
DELETE FROM LQBASE_CI_BUILD.DATABASECHANGELOGLOCK;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOGLOCK (ID, LOCKED) VALUES (1, 0);

-- Lock Database
UPDATE LQBASE_CI_BUILD.DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = 'bastionRackware (10.20.1.3)', LOCKGRANTED = TO_TIMESTAMP('2020-09-07 16:07:51.478', 'YYYY-MM-DD HH24:MI:SS.FF') WHERE ID = 1 AND LOCKED = 0;

-- Create Database Change Log Table
CREATE TABLE LQBASE_CI_BUILD.DATABASECHANGELOG (ID VARCHAR2(255) NOT NULL, AUTHOR VARCHAR2(255) NOT NULL, FILENAME VARCHAR2(255) NOT NULL, DATEEXECUTED TIMESTAMP NOT NULL, ORDEREXECUTED INTEGER NOT NULL, EXECTYPE VARCHAR2(10) NOT NULL, MD5SUM VARCHAR2(35), DESCRIPTION VARCHAR2(255), COMMENTS VARCHAR2(255), TAG VARCHAR2(255), LIQUIBASE VARCHAR2(20), CONTEXTS VARCHAR2(255), LABELS VARCHAR2(255), DEPLOYMENT_ID VARCHAR2(10));

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-1::opc (generated)
CREATE TABLE LQBASE_CI_BUILD.ORDERS (ORDER_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, CUSTOMER_ID NUMBER(6, 0) NOT NULL, STATUS VARCHAR2(20 BYTE) NOT NULL, SALESMAN_ID NUMBER(6, 0), ORDER_DATE date NOT NULL, NEW_COLUMN CHAR(2 BYTE), CONSTRAINT SYS_C008900 PRIMARY KEY (ORDER_ID)) TABLESPACE USERS;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-1', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 1, '8:7804faf3e3f39f121b389989e6b4670f', 'createTable tableName=ORDERS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-2::opc (generated)
CREATE TABLE LQBASE_CI_BUILD.ORDER_ITEMS (ORDER_ID NUMBER(12, 0) NOT NULL, ITEM_ID NUMBER(12, 0) NOT NULL, PRODUCT_ID NUMBER(12, 0) NOT NULL, QUANTITY NUMBER(8, 2) NOT NULL, UNIT_PRICE NUMBER(8, 2) NOT NULL, CONSTRAINT PK_ORDER_ITEMS PRIMARY KEY (ORDER_ID, ITEM_ID)) TABLESPACE USERS;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-2', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 2, '8:bf73a0bccacafbe988b3c010b2bac388', 'createTable tableName=ORDER_ITEMS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-3::opc (generated)
CREATE TABLE LQBASE_CI_BUILD.CONTACTS (CONTACT_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, FIRST_NAME VARCHAR2(255 BYTE) NOT NULL, LAST_NAME VARCHAR2(255 BYTE) NOT NULL, EMAIL VARCHAR2(255 BYTE) NOT NULL, PHONE VARCHAR2(20 BYTE), CUSTOMER_ID NUMBER, CONSTRAINT SYS_C008894 PRIMARY KEY (CONTACT_ID)) TABLESPACE USERS;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-3', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 3, '8:39c5261ea2959c1e0e8cb51c077b1480', 'createTable tableName=CONTACTS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-4::opc (generated)
CREATE TABLE LQBASE_CI_BUILD.CUSTOMERS (CUSTOMER_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, NAME VARCHAR2(255 BYTE) NOT NULL, ADDRESS VARCHAR2(255 BYTE), WEBSITE VARCHAR2(255 BYTE), CREDIT_LIMIT NUMBER(8, 2), CONSTRAINT SYS_C008889 PRIMARY KEY (CUSTOMER_ID)) TABLESPACE USERS;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-4', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 4, '8:f37f8082a9d7d3ebfa00866e8627c5db', 'createTable tableName=CUSTOMERS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-5::opc (generated)
CREATE TABLE LQBASE_CI_BUILD.AUDITS (AUDIT_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, TABLE_NAME VARCHAR2(255 BYTE), TRANSACTION_NAME VARCHAR2(10 BYTE), BY_USER VARCHAR2(30 BYTE), TRANSACTION_DATE date, CONSTRAINT SYS_C008914 PRIMARY KEY (AUDIT_ID)) TABLESPACE USERS;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-5', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 5, '8:23bedd6157685e38082a3c307be1bc27', 'createTable tableName=AUDITS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-6::opc (generated)
CREATE OR REPLACE FORCE VIEW "CUSTOMER_SALES" ("CUSTOMER", "SALES_AMOUNT", "YEAR") AS SELECT
    name AS customer,
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

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-6', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 6, '8:7c2fda28ee2a3a0d37eb0956f0ee4c51', 'createView viewName=CUSTOMER_SALES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-7::opc (generated)
CREATE OR REPLACE FUNCTION get_total_sales(
    in_year PLS_INTEGER
) 
RETURN NUMBER
IS
    l_total_sales NUMBER := 0;
BEGIN
    -- get total sales
    SELECT SUM(unit_price * quantity)
    INTO l_total_sales
    FROM order_items
    INNER JOIN orders USING (order_id)
    WHERE status = 'Shipped'
    GROUP BY EXTRACT(YEAR FROM order_date)
    HAVING EXTRACT(YEAR FROM order_date) = in_year;

    -- return the total sales
    RETURN l_total_sales;
END;
/

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-7', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 7, '8:111187860cd0877161da3e0172eb3748', 'createFunction functionName=GET_TOTAL_SALES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-8::opc (generated)
CREATE OR REPLACE PROCEDURE print_contact(in_customer_id NUMBER)
IS r_contact contacts%ROWTYPE;

BEGIN

  SELECT *
  INTO r_contact
  FROM contacts
  WHERE customer_id = in_customer_id;
  
  dbms_output.put_line( r_contact.first_name || ' ' ||
  r_contact.last_name || '<' || r_contact.email ||'>' );

EXCEPTION
   WHEN OTHERS THEN
      dbms_output.put_line( SQLERRM );
END;
/

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-8', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 8, '8:e8090ac3dfd0c8f5e874a4609733a5f3', 'createProcedure procedureName=PRINT_CONTACT', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-9::opc (generated)
CREATE OR REPLACE TRIGGER customers_audit_trg
    AFTER 
    UPDATE OR DELETE 
    ON customers
    FOR EACH ROW    
DECLARE
   l_transaction VARCHAR2(10);
BEGIN
   -- determine the transaction type
   l_transaction := CASE  
         WHEN UPDATING THEN 'UPDATE'
         WHEN DELETING THEN 'DELETE'
   END;

   -- insert a row into the audit table   
   INSERT INTO audits (table_name, transaction_name, by_user, transaction_date)
   VALUES('CUSTOMERS', l_transaction, USER, SYSDATE);
END;
/

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-9', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 9, '8:5e7004891ff951d5be8fb79cd944b644', 'createTrigger tableName=CUSTOMERS, triggerName=CUSTOMERS_AUDIT_TRG', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-10::opc (generated)
CREATE SEQUENCE LQBASE_CI_BUILD.SEQ_TEST START WITH 1 MAXVALUE 9999999999999999999999999999;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-10', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 10, '8:499b31518691e6877a5513a15140bfe0', 'createSequence sequenceName=SEQ_TEST', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-11::opc (generated)
CREATE TABLE LQBASE_CI_BUILD.COUNTRIES (COUNTRY_ID CHAR(2 BYTE) NOT NULL, COUNTRY_NAME VARCHAR2(40 BYTE) NOT NULL, REGION_ID NUMBER, CONSTRAINT SYS_C008861 PRIMARY KEY (COUNTRY_ID)) TABLESPACE USERS;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-11', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 11, '8:f11d720ce4250a241a04de3ba7363c29', 'createTable tableName=COUNTRIES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-12::opc (generated)
CREATE TABLE LQBASE_CI_BUILD.EMPLOYEES (EMPLOYEE_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, FIRST_NAME VARCHAR2(255 BYTE) NOT NULL, LAST_NAME VARCHAR2(255 BYTE) NOT NULL, EMAIL VARCHAR2(255 BYTE) NOT NULL, PHONE VARCHAR2(50 BYTE) NOT NULL, HIRE_DATE date NOT NULL, MANAGER_ID NUMBER(12, 0), JOB_TITLE VARCHAR2(255 BYTE) NOT NULL, CONSTRAINT SYS_C008877 PRIMARY KEY (EMPLOYEE_ID)) TABLESPACE USERS;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-12', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 12, '8:f0496b1a9e2b3047f6bd41afdd5f83dc', 'createTable tableName=EMPLOYEES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-13::opc (generated)
CREATE TABLE LQBASE_CI_BUILD.INVENTORIES (PRODUCT_ID NUMBER(12, 0) NOT NULL, WAREHOUSE_ID NUMBER(12, 0) NOT NULL, QUANTITY NUMBER(8, 0) NOT NULL, CONSTRAINT PK_INVENTORIES PRIMARY KEY (PRODUCT_ID, WAREHOUSE_ID)) TABLESPACE USERS;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-13', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 13, '8:ea3746bb4b1ee5691fa7178de4ee0a9e', 'createTable tableName=INVENTORIES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-14::opc (generated)
CREATE TABLE LQBASE_CI_BUILD.LOCATIONS (LOCATION_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, ADDRESS VARCHAR2(255 BYTE) NOT NULL, POSTAL_CODE VARCHAR2(20 BYTE), CITY VARCHAR2(50 BYTE), STATE VARCHAR2(50 BYTE), COUNTRY_ID CHAR(2 BYTE), CONSTRAINT SYS_C008865 PRIMARY KEY (LOCATION_ID)) TABLESPACE USERS;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-14', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 14, '8:4f50ba411bc2d52535c8f457546561d9', 'createTable tableName=LOCATIONS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-15::opc (generated)
CREATE TABLE LQBASE_CI_BUILD.PRODUCTS (PRODUCT_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, PRODUCT_NAME VARCHAR2(255 BYTE) NOT NULL, DESCRIPTION VARCHAR2(2000 BYTE), STANDARD_COST NUMBER(9, 2), LIST_PRICE NUMBER(9, 2), CATEGORY_ID NUMBER NOT NULL, CONSTRAINT SYS_C008885 PRIMARY KEY (PRODUCT_ID)) TABLESPACE USERS;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-15', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 15, '8:599aff3acd5f0f4af6cc473e1ce77fe9', 'createTable tableName=PRODUCTS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-16::opc (generated)
CREATE TABLE LQBASE_CI_BUILD.PRODUCT_CATEGORIES (CATEGORY_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, CATEGORY_NAME VARCHAR2(255 BYTE) NOT NULL, CONSTRAINT SYS_C008881 PRIMARY KEY (CATEGORY_ID)) TABLESPACE USERS;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-16', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 16, '8:877db40bbe347eab055d7514de2cb4a6', 'createTable tableName=PRODUCT_CATEGORIES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-17::opc (generated)
CREATE TABLE LQBASE_CI_BUILD.REGIONS (REGION_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, REGION_NAME VARCHAR2(50 BYTE) NOT NULL, CONSTRAINT SYS_C008859 PRIMARY KEY (REGION_ID)) TABLESPACE USERS;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-17', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 17, '8:bfa8eb766c6f0d0a41a72fc9677caf32', 'createTable tableName=REGIONS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-18::opc (generated)
CREATE TABLE LQBASE_CI_BUILD.WAREHOUSES (WAREHOUSE_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, WAREHOUSE_NAME VARCHAR2(255 BYTE), LOCATION_ID NUMBER(12, 0), CONSTRAINT SYS_C008868 PRIMARY KEY (WAREHOUSE_ID)) TABLESPACE USERS;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-18', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 18, '8:c02e7c1531234188ea0c0688a030e5f9', 'createTable tableName=WAREHOUSES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-19::opc (generated)
ALTER TABLE LQBASE_CI_BUILD.CONTACTS ADD CONSTRAINT FK_CONTACTS_CUSTOMERS FOREIGN KEY (CUSTOMER_ID) REFERENCES LQBASE_CI_BUILD.CUSTOMERS (CUSTOMER_ID) ON DELETE CASCADE;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-19', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 19, '8:46ba5367737c46398bda63388232fc5b', 'addForeignKeyConstraint baseTableName=CONTACTS, constraintName=FK_CONTACTS_CUSTOMERS, referencedTableName=CUSTOMERS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-20::opc (generated)
ALTER TABLE LQBASE_CI_BUILD.COUNTRIES ADD CONSTRAINT FK_COUNTRIES_REGIONS FOREIGN KEY (REGION_ID) REFERENCES LQBASE_CI_BUILD.REGIONS (REGION_ID) ON DELETE CASCADE;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-20', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 20, '8:613aad5d8a6b006c128b505f8611ea6a', 'addForeignKeyConstraint baseTableName=COUNTRIES, constraintName=FK_COUNTRIES_REGIONS, referencedTableName=REGIONS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-21::opc (generated)
ALTER TABLE LQBASE_CI_BUILD.EMPLOYEES ADD CONSTRAINT FK_EMPLOYEES_MANAGER FOREIGN KEY (MANAGER_ID) REFERENCES LQBASE_CI_BUILD.EMPLOYEES (EMPLOYEE_ID) ON DELETE CASCADE;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-21', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 21, '8:c13c19882089cbf740de1cb0feb515ce', 'addForeignKeyConstraint baseTableName=EMPLOYEES, constraintName=FK_EMPLOYEES_MANAGER, referencedTableName=EMPLOYEES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-22::opc (generated)
ALTER TABLE LQBASE_CI_BUILD.INVENTORIES ADD CONSTRAINT FK_INVENTORIES_PRODUCTS FOREIGN KEY (PRODUCT_ID) REFERENCES LQBASE_CI_BUILD.PRODUCTS (PRODUCT_ID) ON DELETE CASCADE;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-22', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 22, '8:0ee488095362d51f387cb120a0dde5ce', 'addForeignKeyConstraint baseTableName=INVENTORIES, constraintName=FK_INVENTORIES_PRODUCTS, referencedTableName=PRODUCTS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-23::opc (generated)
ALTER TABLE LQBASE_CI_BUILD.INVENTORIES ADD CONSTRAINT FK_INVENTORIES_WAREHOUSES FOREIGN KEY (WAREHOUSE_ID) REFERENCES LQBASE_CI_BUILD.WAREHOUSES (WAREHOUSE_ID) ON DELETE CASCADE;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-23', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 23, '8:cdef66f6b4cd832ecad8d81bc303ce10', 'addForeignKeyConstraint baseTableName=INVENTORIES, constraintName=FK_INVENTORIES_WAREHOUSES, referencedTableName=WAREHOUSES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-24::opc (generated)
ALTER TABLE LQBASE_CI_BUILD.LOCATIONS ADD CONSTRAINT FK_LOCATIONS_COUNTRIES FOREIGN KEY (COUNTRY_ID) REFERENCES LQBASE_CI_BUILD.COUNTRIES (COUNTRY_ID) ON DELETE CASCADE;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-24', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 24, '8:77bd4a260f61a00b9362d2c42633f901', 'addForeignKeyConstraint baseTableName=LOCATIONS, constraintName=FK_LOCATIONS_COUNTRIES, referencedTableName=COUNTRIES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-25::opc (generated)
ALTER TABLE LQBASE_CI_BUILD.ORDERS ADD CONSTRAINT FK_ORDERS_CUSTOMERS FOREIGN KEY (CUSTOMER_ID) REFERENCES LQBASE_CI_BUILD.CUSTOMERS (CUSTOMER_ID) ON DELETE CASCADE;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-25', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 25, '8:77b3040953b77792ea0c7146ef0e49b3', 'addForeignKeyConstraint baseTableName=ORDERS, constraintName=FK_ORDERS_CUSTOMERS, referencedTableName=CUSTOMERS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-26::opc (generated)
ALTER TABLE LQBASE_CI_BUILD.ORDERS ADD CONSTRAINT FK_ORDERS_EMPLOYEES FOREIGN KEY (SALESMAN_ID) REFERENCES LQBASE_CI_BUILD.EMPLOYEES (EMPLOYEE_ID) ON DELETE SET NULL;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-26', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 26, '8:c205c70ee8b2b87067a5a4fac499ee61', 'addForeignKeyConstraint baseTableName=ORDERS, constraintName=FK_ORDERS_EMPLOYEES, referencedTableName=EMPLOYEES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-27::opc (generated)
ALTER TABLE LQBASE_CI_BUILD.ORDER_ITEMS ADD CONSTRAINT FK_ORDER_ITEMS_ORDERS FOREIGN KEY (ORDER_ID) REFERENCES LQBASE_CI_BUILD.ORDERS (ORDER_ID) ON DELETE CASCADE;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-27', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 27, '8:cfc2259866586e49747a775c632948ab', 'addForeignKeyConstraint baseTableName=ORDER_ITEMS, constraintName=FK_ORDER_ITEMS_ORDERS, referencedTableName=ORDERS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-28::opc (generated)
ALTER TABLE LQBASE_CI_BUILD.ORDER_ITEMS ADD CONSTRAINT FK_ORDER_ITEMS_PRODUCTS FOREIGN KEY (PRODUCT_ID) REFERENCES LQBASE_CI_BUILD.PRODUCTS (PRODUCT_ID) ON DELETE CASCADE;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-28', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 28, '8:5f7b44f4617ea7da1399a8ec1d439e84', 'addForeignKeyConstraint baseTableName=ORDER_ITEMS, constraintName=FK_ORDER_ITEMS_PRODUCTS, referencedTableName=PRODUCTS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-29::opc (generated)
ALTER TABLE LQBASE_CI_BUILD.PRODUCTS ADD CONSTRAINT FK_PRODUCTS_CATEGORIES FOREIGN KEY (CATEGORY_ID) REFERENCES LQBASE_CI_BUILD.PRODUCT_CATEGORIES (CATEGORY_ID) ON DELETE CASCADE;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-29', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 29, '8:5c1efe71fdc223112b57a8cbe9e7498a', 'addForeignKeyConstraint baseTableName=PRODUCTS, constraintName=FK_PRODUCTS_CATEGORIES, referencedTableName=PRODUCT_CATEGORIES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599494711729-30::opc (generated)
ALTER TABLE LQBASE_CI_BUILD.WAREHOUSES ADD CONSTRAINT FK_WAREHOUSES_LOCATIONS FOREIGN KEY (LOCATION_ID) REFERENCES LQBASE_CI_BUILD.LOCATIONS (LOCATION_ID) ON DELETE CASCADE;

INSERT INTO LQBASE_CI_BUILD.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599494711729-30', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 30, '8:856ed5554d45d9b498bf5722aa54f8cd', 'addForeignKeyConstraint baseTableName=WAREHOUSES, constraintName=FK_WAREHOUSES_LOCATIONS, referencedTableName=LOCATIONS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9494873828');

-- Release Database Lock
UPDATE LQBASE_CI_BUILD.DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

