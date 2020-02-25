create database db212Lab2;

create table Employees (
emp_id VARCHAR(30),
first_name VARCHAR(30) NOT NULL,
middle_name VARCHAR(30),
last_name VARCHAR(30) NOT NULL,
gender ENUM ('M', 'F') NOT NULL,
apartment_name VARCHAR(30) NOT NULL,
apartment_number INT NOT NULL,
street_name VARCHAR(30) NOT NULL,
street_no int,
city VARCHAR(30) NOT NULL,
state VARCHAR(30) NOT NULL,
zipcode INT NOT NULL,
designation VARCHAR(3) NOT NULL,
date_of_birth DATE NOT NULL, 
email_id VARCHAR(30) NOT NULL,
-- mobile_number,
salary INT NOT NULL,
joining_date DATE NOT NULL,
PRIMARY KEY (emp_id)
);

create table Mobile (
emp_id VARCHAR(30) NOT NULL,
mobile_number BIGINT NOT NULL,
FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

INSERT INTO Employees (emp_id, first_name, last_name, gender, apartment_name, apartment_number, street_name, city
, state, zipcode, designation, date_of_birth, salary, joining_date, email_id) VALUES (
'2019XYZ0030',
'Adarsh',
'Sharma',
'M',
'A',
380,
'M.G road',
'Indore',
'M.P.',
452018,
'TeamLead',
'1990-12-19',
80000,
'2005-07-01',
'sharma.adrash90@yymail.com'
);

INSERT INTO Mobile VALUES (
'2019XYZ0030',
7012500001
);
INSERT INTO Mobile VALUES(
'2019XYZ0030',
7710000030
);
INSERT INTO Mobile VALUES(
'2019XYZ0030',
8985232632
);


INSERT INTO Employees (emp_id, first_name, last_name, gender, apartment_name, apartment_number, street_no, street_name, city, state, zipcode, designation, date_of_birth, salary, joining_date, email_id ) VALUES (
'2019XYZ0031',
'Mohit',
'Malviya',
'M',
'C',
290, 
54,
'Vijaynagar',
'Indore',
'M.P.',
452011,
'Developer',
'1983-12-03',
50000,
'2005-08-10',
'mohit_malviya1203@yymail.com'
);

INSERT INTO Mobile VALUES (
'2019XYZ0031',
8982646300
);

INSERT INTO Employees (emp_id, first_name, middle_name, last_name, gender, apartment_name, apartment_number, street_name, city, state, zipcode, designation, date_of_birth, salary, joining_date, email_id) VALUES (
'2019XYZ0032',
'Amit',
'Kumar',
'Rai', 
'M', 
'A',
181,
'abhinandan nagar',
'Indore',
'M.P',
452010,
'HR',
'1990-12-15',
90000,
'2005-09-19',
'amit_rai1990@coolmail.com'
);

INSERT INTO Mobile VALUES (
'2019XYZ0032',
7012245201
);
INSERT INTO Mobile VALUES (
'2019XYZ0032',
9424075236
);

INSERT INTO Employees (emp_id, first_name, last_name, gender, apartment_name, apartment_number, street_name, city, state, zipcode, designation, date_of_birth, salary, joining_date, email_id) VALUES (
'2019XYZ0033', 
'Ayushi',
'Jain',
'F',
'E',
320,
'Friganj',
'Ujjain', 
'M.P.',
452016,
'Developer',
'1992-07-01',
30000,
'2007-02-05',
'jain_aysuhi1992@coolmail.com'
);

INSERT INTO Mobile VALUES (
'2019XYZ0033', 
7012015121
);
INSERT INTO Mobile VALUES (
'2019XYZ0033', 
8985632520
);

INSERT INTO Employees (emp_id, first_name, last_name, gender, apartment_name, apartment_number, street_no, street_name, city
, state, zipcode, designation, date_of_birth, salary, joining_date, email_id) VALUES (
'2019XYZ0034',
'Anand',
'Diwedi', 
'M', 
'A',
661,
58,
'Bhavarkuwa',
'Indore',
'M.P.',
452020,
'Tester',
'1994-10-02',
30000,
'2006-04-15',
'anand007@coolmail.com'
);

INSERT INTO Mobile VALUES (
'2019XYZ0034',
8865263452
);

INSERT INTO Employees (emp_id, first_name, last_name, gender, apartment_name, apartment_number, street_no, street_name, city, state, zipcode, designation, date_of_birth, salary, joining_date, email_id) VALUES (
'2019XYZ0035',
'Khushboo',
'Rathi',
'F', 
'C',
230,
280,
'Shastri nagar',
'Ujjain', 
'M.P.',
452023,
'Tester',
'1992-01-05',
30000,
'2008-06-20',
'k_rathi12@coolmail.com'
);

INSERT INTO Mobile VALUES (
'2019XYZ0035',
8458512332
);

ALTER TABLE Employees add Age INT;
UPDATE Employees SET Age = datediff(curdate(), date_of_birth)/365;

SELECT emp_id, CONCAT(
	COALESCE(first_name, ''), ' ',
	COALESCE(middle_name, ''), ' ',
	COALESCE(last_name, '')
) AS 'Name' FROM Employees;

SELECT first_name, last_name FROM Employees WHERE gender = 'F';

SELECT DISTINCT salary FROM Employees;

SELECT first_name, last_name FROM Employees WHERE designation = 'HR';

SELECT CONCAT(
	COALESCE(first_name, ''), ' ',
	COALESCE(middle_name, ''), ' ',
	COALESCE(last_name, '')
) as 'Name' FROM Employees WHERE year(joining_date) > 2006;

SELECT min(Age) FROM Employees;

SELECT emp_id, CONCAT(
	COALESCE(first_name, ''), ' ',
	COALESCE(middle_name, ''), ' ',
	COALESCE(last_name, '')
) AS 'Name', salary FROM Employees ORDER BY salary DESC; 

SELECT emp_id, CONCAT(
	COALESCE(first_name, ''), ' ',
	COALESCE(middle_name, ''), ' ',
	COALESCE(last_name, '')
) AS 'Name', CONCAT(
	COALESCE(apartment_name, ''), ' ',
	COALESCE(apartment_number, ''), ', ',
	COALESCE(street_no, ''), ' ',
	COALESCE(street_name,''), ', ',
	city, ', ',
	state, ', ',
	zipcode
) as 'Address' FROM Employees WHERE email_id LIKE '%@coolmail.com%';

SELECT CONCAT(
	COALESCE(first_name, ''), ' ',
	COALESCE(middle_name, ''), ' ',
	COALESCE(last_name, ''), ' '
) AS 'Name' FROM Employees WHERE date_of_birth between '1992-01-01' and '1995-01-01';

SELECT SUM(salary) FROM Employees;

SELECT COUNT(*) FROM Employees WHERE gender = 'M';

SELECT MAX(salary) FROM Employees;

SELECT COUNT(*) FROM Employees WHERE designation Like 'Developer' or designation Like 'tester';

SELECT CONCAT(
	COALESCE(first_name, ''), ' ',
	COALESCE(middle_name, ''), ' ',
	COALESCE(last_name, '') 
) AS 'Name' FROM Employees WHERE datediff(curdate(),joining_date)/365 > 12;

SELECT emp_id FROM Employees WHERE middle_name IS NULL and first_name LIKE 'a%';

SELECT last_name FROM Employees WHERE last_name NOT LIKE "c%";

SELECT CONCAT(
	COALESCE(first_name, ''), ' ',
	COALESCE(middle_name, ''), ' ',
	COALESCE(last_name, '')
) AS 'Name' FROM Employees WHERE  first_name like "___i%";

SELECT CONCAT(
	COALESCE(first_name, ''), ' ',
	COALESCE(middle_name, ''), ' ',
	COALESCE(last_name, '')
) AS 'Name' from Employees WHERE first_name like "a%" and last_name like "%a";

SELECT CONCAT(
	COALESCE(first_name, ''), ' ',
	COALESCE(middle_name, ''), ' ',
	COALESCE(last_name, '')
) AS 'Name' from Employees ORDER BY salary DESC LIMIT 3;

-- Try these
-- INSERT INTO Mobile VALUES(
-- '2019XYZ0036',
-- 7012501235
-- );

-- INSERT INTO Mobile VALUES(
-- null,
-- 7012502091
-- );

SELECT CONCAT(
	COALESCE(first_name, ''), ' ',
	COALESCE(middle_name, ''), ' ',
	COALESCE(last_name, '')
) AS 'Name' FROM Employees INNER JOIN Mobile ON Employees.emp_id 