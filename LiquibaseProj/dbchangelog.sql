--liquibase formatted sql

--changeset Jaffer:1
CREATE TABLE "DEPARTMENT"  
(  	"id" number(*,0),
	"name" VARCHAR2(50 BYTE),
	"active" NUMBER(1,0) DEFAULT 1
);

--changeset Shaikh:1
create table test1 (
    id int primary key,
    name varchar(255)
);

--rollback drop table test1;
--changeset Shaikh:2
insert into test1 (id, name) values (1, 'name1');
insert into test1 (id, name) values (2, 'name2');

--changeset Shaikh:3 dbms:oracle
create sequence seq_test;