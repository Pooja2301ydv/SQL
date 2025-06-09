CREATE DATABASE pooja;
create database temp;
create database if not exists temp;

drop database pooja;
drop database if exists pooja;
drop database temp;

create database college;

use college;
#creating table
create table student (
 id INT primary KEY,
 NAME varchar(50),
 Age int not null
);

insert into student values(1, 'Pooja', 21);
insert into student values(2, 'BP', 21);

SELECT * FROM student;

show databases;
show tables;

drop table student;

create database GOOGLE;
use GOOGLE;
create table EMPLOYEE (id INT primary KEY, NAME varchar(50), SALARY int);
insert into EMPLOYEE values (1,'POOJA',500000);
INSERT INTO EMPLOYEE values(2,'BP',50000000);
SELECT * FROM EMPLOYEE;
