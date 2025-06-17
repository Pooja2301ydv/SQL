use college;

create table payment(
coustmer_id INT PRIMARY KEY,
coustmer varchar(50),
mode varchar(50),
city varchar(50)
);

insert into payment values(101,'Olivia Barett','Netbanking','Portland');
insert into payment values(102,'Ethan Sinclair','Credit Card','Miami');
insert into payment values(103,'Maya Hernandez','Credit Card','Seattle');
insert into payment values(104,'Liam Donovan','Netbankingg','Denver');
insert into payment values(105,'Sophia Nguyen','Credit Card','New Orleans');
insert into payment values(106,'Caleb Foster','Debit Card','Minneapolis');
insert into payment values(107,'Ava Patel','Debit Card','Phoenix');
insert into payment values(108,'Lucas Carter','Netbanking','Boston');
insert into payment values(109,'Isabella Martinez','Netbanking','Nashville');
insert into payment values(110,'Jackson Brooks','Credit Card','Boston');

select * from payment;
select mode ,count(coustmer_id) from payment group by mode;
select mode ,count(coustmer) from payment group by mode;

/*
GENERAL ORDER OF WRITING COMMANDS:
 SELECT column(s)
 FROM table_name
 WHERE condition
 GROUP BY column(s)
 HAVING condition
 ORDER BY column(s) ASC/DESC
 */
 
# TABLE RELATED QUERIES

# 1. UPDATE (TO UPDATE EXISTING ROWS)
SET SQL_SAFE_UPDATES=0;		#To off the safe mode
SET SQL_SAFE_UPDATES=1;		#To on the safe mode
UPDATE payment SET mode='Online' WHERE mode='Netbanking';

# 2. DELETE (TO DELETE EXISTING ROWS)
DELETE FROM payment WHERE city='Portland';
SELECT * FROM payment;

DELETE FROM payment;	#Deletes the whole table data

# 3. INSERT (TO INSERT DATA TO EXISTING DATA)
INSERT INTO payment VALUES (101,'Olivia Barett','Netbanking','Portland');

# 4. ALTER (TO CHANGE THE SCHEMA)
# (i) ADD column
ALTER TABLE payment ADD COLUMN age INT;
SELECT * FROM payment;

# (ii) DROP column
ALTER TABLE payment DROP age;
SELECT * FROM payment;

# (iii) RENAME column
ALTER TABLE payment RENAME TO amount;

# (iv) CHANGE column (rename)
ALTER TABLE amount CHANGE COLUMN city place varchar(50);
SELECT * FROM amount;

# (v) MODIFY column (modify datatype/constraint)
ALTER TABLE amount MODIFY coustmer_id INT NOT NULL;

# 4. TRUNCATE (TO DELETE TABLE'S DATA)
TRUNCATE TABLE amount;
SELECT * FROM amount;
