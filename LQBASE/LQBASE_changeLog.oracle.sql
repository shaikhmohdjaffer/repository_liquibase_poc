--liquibase formatted sql

--changeset opc:1599549495768-1
CREATE TABLE ORDERS (ORDER_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, CUSTOMER_ID NUMBER(6, 0) NOT NULL, STATUS VARCHAR2(20 BYTE) NOT NULL, SALESMAN_ID NUMBER(6, 0), ORDER_DATE date NOT NULL, NEW_COLUMN CHAR(2 BYTE), CONSTRAINT SYS_C008900 PRIMARY KEY (ORDER_ID)) TABLESPACE USERS;

--changeset opc:1599549495768-2
CREATE TABLE ORDER_ITEMS (ORDER_ID NUMBER(12, 0) NOT NULL, ITEM_ID NUMBER(12, 0) NOT NULL, PRODUCT_ID NUMBER(12, 0) NOT NULL, QUANTITY NUMBER(8, 2) NOT NULL, UNIT_PRICE NUMBER(8, 2) NOT NULL, CONSTRAINT PK_ORDER_ITEMS PRIMARY KEY (ORDER_ID, ITEM_ID)) TABLESPACE USERS;

--changeset opc:1599549495768-3
CREATE TABLE CONTACTS (CONTACT_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, FIRST_NAME VARCHAR2(255 BYTE) NOT NULL, LAST_NAME VARCHAR2(255 BYTE) NOT NULL, EMAIL VARCHAR2(255 BYTE) NOT NULL, PHONE VARCHAR2(20 BYTE), CUSTOMER_ID NUMBER, CONSTRAINT SYS_C008894 PRIMARY KEY (CONTACT_ID)) TABLESPACE USERS;

--changeset opc:1599549495768-4
CREATE TABLE CUSTOMERS (CUSTOMER_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, NAME VARCHAR2(255 BYTE) NOT NULL, ADDRESS VARCHAR2(255 BYTE), WEBSITE VARCHAR2(255 BYTE), CREDIT_LIMIT NUMBER(8, 2), CONSTRAINT SYS_C008889 PRIMARY KEY (CUSTOMER_ID)) TABLESPACE USERS;

--changeset opc:1599549495768-5
CREATE TABLE AUDITS (AUDIT_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, TABLE_NAME VARCHAR2(255 BYTE), TRANSACTION_NAME VARCHAR2(10 BYTE), BY_USER VARCHAR2(30 BYTE), TRANSACTION_DATE date, CONSTRAINT SYS_C008914 PRIMARY KEY (AUDIT_ID)) TABLESPACE USERS;

--changeset opc:1599549495768-6
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

--changeset opc:1599549495768-7
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

--changeset opc:1599549495768-8
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

--changeset opc:1599549495768-9
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

--changeset opc:1599549495768-10
CREATE SEQUENCE SEQ_TEST START WITH 1 MAXVALUE 9999999999999999999999999999;

--changeset opc:1599549495768-11
CREATE TABLE COUNTRIES (COUNTRY_ID CHAR(2 BYTE) NOT NULL, COUNTRY_NAME VARCHAR2(40 BYTE) NOT NULL, REGION_ID NUMBER, CONSTRAINT SYS_C008861 PRIMARY KEY (COUNTRY_ID)) TABLESPACE USERS;

--changeset opc:1599549495768-12
CREATE TABLE EMPLOYEES (EMPLOYEE_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, FIRST_NAME VARCHAR2(255 BYTE) NOT NULL, LAST_NAME VARCHAR2(255 BYTE) NOT NULL, EMAIL VARCHAR2(255 BYTE) NOT NULL, PHONE VARCHAR2(50 BYTE) NOT NULL, HIRE_DATE date NOT NULL, MANAGER_ID NUMBER(12, 0), JOB_TITLE VARCHAR2(255 BYTE) NOT NULL, CONSTRAINT SYS_C008877 PRIMARY KEY (EMPLOYEE_ID)) TABLESPACE USERS;

--changeset opc:1599549495768-13
CREATE TABLE INVENTORIES (PRODUCT_ID NUMBER(12, 0) NOT NULL, WAREHOUSE_ID NUMBER(12, 0) NOT NULL, QUANTITY NUMBER(8, 0) NOT NULL, CONSTRAINT PK_INVENTORIES PRIMARY KEY (PRODUCT_ID, WAREHOUSE_ID)) TABLESPACE USERS;

--changeset opc:1599549495768-14
CREATE TABLE LOCATIONS (LOCATION_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, ADDRESS VARCHAR2(255 BYTE) NOT NULL, POSTAL_CODE VARCHAR2(20 BYTE), CITY VARCHAR2(50 BYTE), STATE VARCHAR2(50 BYTE), COUNTRY_ID CHAR(2 BYTE), CONSTRAINT SYS_C008865 PRIMARY KEY (LOCATION_ID)) TABLESPACE USERS;

--changeset opc:1599549495768-15
CREATE TABLE PRODUCTS (PRODUCT_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, PRODUCT_NAME VARCHAR2(255 BYTE) NOT NULL, DESCRIPTION VARCHAR2(2000 BYTE), STANDARD_COST NUMBER(9, 2), LIST_PRICE NUMBER(9, 2), CATEGORY_ID NUMBER NOT NULL, CONSTRAINT SYS_C008885 PRIMARY KEY (PRODUCT_ID)) TABLESPACE USERS;

--changeset opc:1599549495768-16
CREATE TABLE PRODUCT_CATEGORIES (CATEGORY_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, CATEGORY_NAME VARCHAR2(255 BYTE) NOT NULL, CONSTRAINT SYS_C008881 PRIMARY KEY (CATEGORY_ID)) TABLESPACE USERS;

--changeset opc:1599549495768-17
CREATE TABLE REGIONS (REGION_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, REGION_NAME VARCHAR2(50 BYTE) NOT NULL, CONSTRAINT SYS_C008859 PRIMARY KEY (REGION_ID)) TABLESPACE USERS;

--changeset opc:1599549495768-18
CREATE TABLE WAREHOUSES (WAREHOUSE_ID NUMBER GENERATED BY DEFAULT AS IDENTITY NOT NULL, WAREHOUSE_NAME VARCHAR2(255 BYTE), LOCATION_ID NUMBER(12, 0), CONSTRAINT SYS_C008868 PRIMARY KEY (WAREHOUSE_ID)) TABLESPACE USERS;

--changeset opc:1599549495768-19
ALTER TABLE CONTACTS ADD CONSTRAINT FK_CONTACTS_CUSTOMERS FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS (CUSTOMER_ID) ON DELETE CASCADE;

--changeset opc:1599549495768-20
ALTER TABLE COUNTRIES ADD CONSTRAINT FK_COUNTRIES_REGIONS FOREIGN KEY (REGION_ID) REFERENCES REGIONS (REGION_ID) ON DELETE CASCADE;

--changeset opc:1599549495768-21
ALTER TABLE EMPLOYEES ADD CONSTRAINT FK_EMPLOYEES_MANAGER FOREIGN KEY (MANAGER_ID) REFERENCES EMPLOYEES (EMPLOYEE_ID) ON DELETE CASCADE;

--changeset opc:1599549495768-22
ALTER TABLE INVENTORIES ADD CONSTRAINT FK_INVENTORIES_PRODUCTS FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS (PRODUCT_ID) ON DELETE CASCADE;

--changeset opc:1599549495768-23
ALTER TABLE INVENTORIES ADD CONSTRAINT FK_INVENTORIES_WAREHOUSES FOREIGN KEY (WAREHOUSE_ID) REFERENCES WAREHOUSES (WAREHOUSE_ID) ON DELETE CASCADE;

--changeset opc:1599549495768-24
ALTER TABLE LOCATIONS ADD CONSTRAINT FK_LOCATIONS_COUNTRIES FOREIGN KEY (COUNTRY_ID) REFERENCES COUNTRIES (COUNTRY_ID) ON DELETE CASCADE;

--changeset opc:1599549495768-25
ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDERS_CUSTOMERS FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS (CUSTOMER_ID) ON DELETE CASCADE;

--changeset opc:1599549495768-26
ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDERS_EMPLOYEES FOREIGN KEY (SALESMAN_ID) REFERENCES EMPLOYEES (EMPLOYEE_ID) ON DELETE SET NULL;

--changeset opc:1599549495768-27
ALTER TABLE ORDER_ITEMS ADD CONSTRAINT FK_ORDER_ITEMS_ORDERS FOREIGN KEY (ORDER_ID) REFERENCES ORDERS (ORDER_ID) ON DELETE CASCADE;

--changeset opc:1599549495768-28
ALTER TABLE ORDER_ITEMS ADD CONSTRAINT FK_ORDER_ITEMS_PRODUCTS FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS (PRODUCT_ID) ON DELETE CASCADE;

--changeset opc:1599549495768-29
ALTER TABLE PRODUCTS ADD CONSTRAINT FK_PRODUCTS_CATEGORIES FOREIGN KEY (CATEGORY_ID) REFERENCES PRODUCT_CATEGORIES (CATEGORY_ID) ON DELETE CASCADE;

--changeset opc:1599549495768-30
ALTER TABLE WAREHOUSES ADD CONSTRAINT FK_WAREHOUSES_LOCATIONS FOREIGN KEY (LOCATION_ID) REFERENCES LOCATIONS (LOCATION_ID) ON DELETE CASCADE;

