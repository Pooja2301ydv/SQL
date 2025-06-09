USE college;

CREATE TABLE dept(		#Parent Table
id INT PRIMARY KEY,
name VARCHAR(60)
);

INSERT INTO dept VALUES(100,'AI'),(103,'CS');

SELECT * FROM dept;

CREATE TABLE teacher(		#Child Table
id INT NOT NULL,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) references dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

INSERT INTO teacher
VALUES
(101,'RAM',101),
(102,'SHYAM',102);

SELECT * FROM teacher;