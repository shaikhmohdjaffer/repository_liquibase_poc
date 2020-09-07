-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml
-- Ran at: 9/6/20 3:08 PM
-- Against: LQBASE@jdbc:oracle:thin:@152.67.2.223:1521/ltidbpdb.publicsubnet.commonvcn.oraclevcn.com
-- Liquibase version: 3.10.2
-- *********************************************************************

-- Lock Database
UPDATE LQBASE.DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = 'bastionRackware (10.20.1.3)', LOCKGRANTED = TO_TIMESTAMP('2020-09-06 15:08:57.305', 'YYYY-MM-DD HH24:MI:SS.FF') WHERE ID = 1 AND LOCKED = 0;

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-1::opc (generated)
CREATE TABLE LQBASE.ORDERS (ORDER_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, CUSTOMER_ID NUMBER(6, 0) NOT NULL, STATUS VARCHAR2(20 BYTE) NOT NULL, SALESMAN_ID NUMBER(6, 0), ORDER_DATE date NOT NULL, NEW_COLUMN CHAR(2 BYTE), CONSTRAINT SYS_C008900 PRIMARY KEY (ORDER_ID)) TABLESPACE USERS;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-1', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 41, '8:7804faf3e3f39f121b389989e6b4670f', 'createTable tableName=ORDERS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-2::opc (generated)
CREATE TABLE LQBASE.ORDER_ITEMS (ORDER_ID NUMBER(12, 0) NOT NULL, ITEM_ID NUMBER(12, 0) NOT NULL, PRODUCT_ID NUMBER(12, 0) NOT NULL, QUANTITY NUMBER(8, 2) NOT NULL, UNIT_PRICE NUMBER(8, 2) NOT NULL, CONSTRAINT PK_ORDER_ITEMS PRIMARY KEY (ORDER_ID, ITEM_ID)) TABLESPACE USERS;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-2', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 42, '8:bf73a0bccacafbe988b3c010b2bac388', 'createTable tableName=ORDER_ITEMS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-3::opc (generated)
CREATE TABLE LQBASE.CONTACTS (CONTACT_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, FIRST_NAME VARCHAR2(255 BYTE) NOT NULL, LAST_NAME VARCHAR2(255 BYTE) NOT NULL, EMAIL VARCHAR2(255 BYTE) NOT NULL, PHONE VARCHAR2(20 BYTE), CUSTOMER_ID NUMBER, CONSTRAINT SYS_C008894 PRIMARY KEY (CONTACT_ID)) TABLESPACE USERS;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-3', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 43, '8:39c5261ea2959c1e0e8cb51c077b1480', 'createTable tableName=CONTACTS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-4::opc (generated)
CREATE TABLE LQBASE.REGIONS (REGION_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, REGION_NAME VARCHAR2(50 BYTE) NOT NULL, CONSTRAINT SYS_C008859 PRIMARY KEY (REGION_ID)) TABLESPACE USERS;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-4', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 44, '8:bfa8eb766c6f0d0a41a72fc9677caf32', 'createTable tableName=REGIONS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-5::opc (generated)
CREATE TABLE LQBASE.CUSTOMERS (CUSTOMER_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, NAME VARCHAR2(255 BYTE) NOT NULL, ADDRESS VARCHAR2(255 BYTE), WEBSITE VARCHAR2(255 BYTE), CREDIT_LIMIT NUMBER(8, 2), CONSTRAINT SYS_C008889 PRIMARY KEY (CUSTOMER_ID)) TABLESPACE USERS;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-5', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 45, '8:f37f8082a9d7d3ebfa00866e8627c5db', 'createTable tableName=CUSTOMERS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-6::opc (generated)
CREATE TABLE LQBASE.AUDITS (AUDIT_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, TABLE_NAME VARCHAR2(255 BYTE), TRANSACTION_NAME VARCHAR2(10 BYTE), BY_USER VARCHAR2(30 BYTE), TRANSACTION_DATE date, CONSTRAINT SYS_C008914 PRIMARY KEY (AUDIT_ID)) TABLESPACE USERS;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-6', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 46, '8:23bedd6157685e38082a3c307be1bc27', 'createTable tableName=AUDITS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-7::opc (generated)
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

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-7', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 47, '8:7c2fda28ee2a3a0d37eb0956f0ee4c51', 'createView viewName=CUSTOMER_SALES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-8::opc (generated)
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

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-8', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 48, '8:111187860cd0877161da3e0172eb3748', 'createFunction functionName=GET_TOTAL_SALES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-9::opc (generated)
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

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-9', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 49, '8:e8090ac3dfd0c8f5e874a4609733a5f3', 'createProcedure procedureName=PRINT_CONTACT', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-10::opc (generated)
CREATE SYNONYM LQBASE.REGIONS_SYNONYM FOR LQBASE.REGIONS;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-10', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 50, '8:7e44df38002ff2cc05cb3da516a29c4a', 'createSynonym objectName=REGIONS, synonymName=REGIONS_SYNONYM', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-11::opc (generated)
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

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-11', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 51, '8:5e7004891ff951d5be8fb79cd944b644', 'createTrigger tableName=CUSTOMERS, triggerName=CUSTOMERS_AUDIT_TRG', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-12::opc (generated)
CREATE SEQUENCE LQBASE.SEQ_TEST START WITH 1 MAXVALUE 9999999999999999999999999999;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-12', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 52, '8:499b31518691e6877a5513a15140bfe0', 'createSequence sequenceName=SEQ_TEST', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-13::opc (generated)
CREATE TABLE LQBASE.COUNTRIES (COUNTRY_ID CHAR(2 BYTE) NOT NULL, COUNTRY_NAME VARCHAR2(40 BYTE) NOT NULL, REGION_ID NUMBER, CONSTRAINT SYS_C008861 PRIMARY KEY (COUNTRY_ID)) TABLESPACE USERS;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-13', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 53, '8:f11d720ce4250a241a04de3ba7363c29', 'createTable tableName=COUNTRIES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-14::opc (generated)
CREATE TABLE LQBASE.EMPLOYEES (EMPLOYEE_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, FIRST_NAME VARCHAR2(255 BYTE) NOT NULL, LAST_NAME VARCHAR2(255 BYTE) NOT NULL, EMAIL VARCHAR2(255 BYTE) NOT NULL, PHONE VARCHAR2(50 BYTE) NOT NULL, HIRE_DATE date NOT NULL, MANAGER_ID NUMBER(12, 0), JOB_TITLE VARCHAR2(255 BYTE) NOT NULL, CONSTRAINT SYS_C008877 PRIMARY KEY (EMPLOYEE_ID)) TABLESPACE USERS;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-14', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 54, '8:f0496b1a9e2b3047f6bd41afdd5f83dc', 'createTable tableName=EMPLOYEES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-15::opc (generated)
CREATE TABLE LQBASE.INVENTORIES (PRODUCT_ID NUMBER(12, 0) NOT NULL, WAREHOUSE_ID NUMBER(12, 0) NOT NULL, QUANTITY NUMBER(8, 0) NOT NULL, CONSTRAINT PK_INVENTORIES PRIMARY KEY (PRODUCT_ID, WAREHOUSE_ID)) TABLESPACE USERS;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-15', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 55, '8:ea3746bb4b1ee5691fa7178de4ee0a9e', 'createTable tableName=INVENTORIES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-16::opc (generated)
CREATE TABLE LQBASE.LOCATIONS (LOCATION_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, ADDRESS VARCHAR2(255 BYTE) NOT NULL, POSTAL_CODE VARCHAR2(20 BYTE), CITY VARCHAR2(50 BYTE), STATE VARCHAR2(50 BYTE), COUNTRY_ID CHAR(2 BYTE), CONSTRAINT SYS_C008865 PRIMARY KEY (LOCATION_ID)) TABLESPACE USERS;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-16', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 56, '8:4f50ba411bc2d52535c8f457546561d9', 'createTable tableName=LOCATIONS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-17::opc (generated)
CREATE TABLE LQBASE.PRODUCTS (PRODUCT_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, PRODUCT_NAME VARCHAR2(255 BYTE) NOT NULL, DESCRIPTION VARCHAR2(2000 BYTE), STANDARD_COST NUMBER(9, 2), LIST_PRICE NUMBER(9, 2), CATEGORY_ID NUMBER NOT NULL, CONSTRAINT SYS_C008885 PRIMARY KEY (PRODUCT_ID)) TABLESPACE USERS;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-17', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 57, '8:599aff3acd5f0f4af6cc473e1ce77fe9', 'createTable tableName=PRODUCTS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-18::opc (generated)
CREATE TABLE LQBASE.PRODUCT_CATEGORIES (CATEGORY_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, CATEGORY_NAME VARCHAR2(255 BYTE) NOT NULL, CONSTRAINT SYS_C008881 PRIMARY KEY (CATEGORY_ID)) TABLESPACE USERS;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-18', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 58, '8:877db40bbe347eab055d7514de2cb4a6', 'createTable tableName=PRODUCT_CATEGORIES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-19::opc (generated)
CREATE TABLE LQBASE.WAREHOUSES (WAREHOUSE_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, WAREHOUSE_NAME VARCHAR2(255 BYTE), LOCATION_ID NUMBER(12, 0), CONSTRAINT SYS_C008868 PRIMARY KEY (WAREHOUSE_ID)) TABLESPACE USERS;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-19', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 59, '8:c02e7c1531234188ea0c0688a030e5f9', 'createTable tableName=WAREHOUSES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-20::opc (generated)
ALTER TABLE LQBASE.CONTACTS ADD CONSTRAINT FK_CONTACTS_CUSTOMERS FOREIGN KEY (CUSTOMER_ID) REFERENCES LQBASE.CUSTOMERS (CUSTOMER_ID) ON DELETE CASCADE;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-20', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 60, '8:46ba5367737c46398bda63388232fc5b', 'addForeignKeyConstraint baseTableName=CONTACTS, constraintName=FK_CONTACTS_CUSTOMERS, referencedTableName=CUSTOMERS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-21::opc (generated)
ALTER TABLE LQBASE.COUNTRIES ADD CONSTRAINT FK_COUNTRIES_REGIONS FOREIGN KEY (REGION_ID) REFERENCES LQBASE.REGIONS (REGION_ID) ON DELETE CASCADE;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-21', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 61, '8:613aad5d8a6b006c128b505f8611ea6a', 'addForeignKeyConstraint baseTableName=COUNTRIES, constraintName=FK_COUNTRIES_REGIONS, referencedTableName=REGIONS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-22::opc (generated)
ALTER TABLE LQBASE.EMPLOYEES ADD CONSTRAINT FK_EMPLOYEES_MANAGER FOREIGN KEY (MANAGER_ID) REFERENCES LQBASE.EMPLOYEES (EMPLOYEE_ID) ON DELETE CASCADE;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-22', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 62, '8:c13c19882089cbf740de1cb0feb515ce', 'addForeignKeyConstraint baseTableName=EMPLOYEES, constraintName=FK_EMPLOYEES_MANAGER, referencedTableName=EMPLOYEES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-23::opc (generated)
ALTER TABLE LQBASE.INVENTORIES ADD CONSTRAINT FK_INVENTORIES_PRODUCTS FOREIGN KEY (PRODUCT_ID) REFERENCES LQBASE.PRODUCTS (PRODUCT_ID) ON DELETE CASCADE;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-23', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 63, '8:0ee488095362d51f387cb120a0dde5ce', 'addForeignKeyConstraint baseTableName=INVENTORIES, constraintName=FK_INVENTORIES_PRODUCTS, referencedTableName=PRODUCTS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-24::opc (generated)
ALTER TABLE LQBASE.INVENTORIES ADD CONSTRAINT FK_INVENTORIES_WAREHOUSES FOREIGN KEY (WAREHOUSE_ID) REFERENCES LQBASE.WAREHOUSES (WAREHOUSE_ID) ON DELETE CASCADE;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-24', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 64, '8:cdef66f6b4cd832ecad8d81bc303ce10', 'addForeignKeyConstraint baseTableName=INVENTORIES, constraintName=FK_INVENTORIES_WAREHOUSES, referencedTableName=WAREHOUSES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-25::opc (generated)
ALTER TABLE LQBASE.LOCATIONS ADD CONSTRAINT FK_LOCATIONS_COUNTRIES FOREIGN KEY (COUNTRY_ID) REFERENCES LQBASE.COUNTRIES (COUNTRY_ID) ON DELETE CASCADE;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-25', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 65, '8:77bd4a260f61a00b9362d2c42633f901', 'addForeignKeyConstraint baseTableName=LOCATIONS, constraintName=FK_LOCATIONS_COUNTRIES, referencedTableName=COUNTRIES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-26::opc (generated)
ALTER TABLE LQBASE.ORDERS ADD CONSTRAINT FK_ORDERS_CUSTOMERS FOREIGN KEY (CUSTOMER_ID) REFERENCES LQBASE.CUSTOMERS (CUSTOMER_ID) ON DELETE CASCADE;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-26', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 66, '8:77b3040953b77792ea0c7146ef0e49b3', 'addForeignKeyConstraint baseTableName=ORDERS, constraintName=FK_ORDERS_CUSTOMERS, referencedTableName=CUSTOMERS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-27::opc (generated)
ALTER TABLE LQBASE.ORDERS ADD CONSTRAINT FK_ORDERS_EMPLOYEES FOREIGN KEY (SALESMAN_ID) REFERENCES LQBASE.EMPLOYEES (EMPLOYEE_ID) ON DELETE SET NULL;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-27', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 67, '8:c205c70ee8b2b87067a5a4fac499ee61', 'addForeignKeyConstraint baseTableName=ORDERS, constraintName=FK_ORDERS_EMPLOYEES, referencedTableName=EMPLOYEES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-28::opc (generated)
ALTER TABLE LQBASE.ORDER_ITEMS ADD CONSTRAINT FK_ORDER_ITEMS_ORDERS FOREIGN KEY (ORDER_ID) REFERENCES LQBASE.ORDERS (ORDER_ID) ON DELETE CASCADE;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-28', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 68, '8:cfc2259866586e49747a775c632948ab', 'addForeignKeyConstraint baseTableName=ORDER_ITEMS, constraintName=FK_ORDER_ITEMS_ORDERS, referencedTableName=ORDERS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-29::opc (generated)
ALTER TABLE LQBASE.ORDER_ITEMS ADD CONSTRAINT FK_ORDER_ITEMS_PRODUCTS FOREIGN KEY (PRODUCT_ID) REFERENCES LQBASE.PRODUCTS (PRODUCT_ID) ON DELETE CASCADE;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-29', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 69, '8:5f7b44f4617ea7da1399a8ec1d439e84', 'addForeignKeyConstraint baseTableName=ORDER_ITEMS, constraintName=FK_ORDER_ITEMS_PRODUCTS, referencedTableName=PRODUCTS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-30::opc (generated)
ALTER TABLE LQBASE.PRODUCTS ADD CONSTRAINT FK_PRODUCTS_CATEGORIES FOREIGN KEY (CATEGORY_ID) REFERENCES LQBASE.PRODUCT_CATEGORIES (CATEGORY_ID) ON DELETE CASCADE;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-30', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 70, '8:5c1efe71fdc223112b57a8cbe9e7498a', 'addForeignKeyConstraint baseTableName=PRODUCTS, constraintName=FK_PRODUCTS_CATEGORIES, referencedTableName=PRODUCT_CATEGORIES', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Changeset C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml::1599404800981-31::opc (generated)
ALTER TABLE LQBASE.WAREHOUSES ADD CONSTRAINT FK_WAREHOUSES_LOCATIONS FOREIGN KEY (LOCATION_ID) REFERENCES LQBASE.LOCATIONS (LOCATION_ID) ON DELETE CASCADE;

INSERT INTO LQBASE.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1599404800981-31', 'opc (generated)', 'C:/Users/opc/Desktop/SONY/Liquibase/LQBASE/LQBASE_changeLog.xml', SYSTIMESTAMP, 71, '8:856ed5554d45d9b498bf5722aa54f8cd', 'addForeignKeyConstraint baseTableName=WAREHOUSES, constraintName=FK_WAREHOUSES_LOCATIONS, referencedTableName=LOCATIONS', '', 'EXECUTED', NULL, NULL, '3.10.2', '9404939608');

-- Release Database Lock
UPDATE LQBASE.DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

