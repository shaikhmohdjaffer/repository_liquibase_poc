--liquibase formatted sql

--changeset Jaffer:1
CREATE TABLE "DEPARTMENT1"  
(  	"id" number(*,0),
	"name" VARCHAR2(50 BYTE),
	"active" NUMBER(1,0) DEFAULT 1
);