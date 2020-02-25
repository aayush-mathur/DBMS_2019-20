create database db212Lab3;

connect db212Lab3;

CREATE TABLE Book (
isbn VARCHAR(12),
title VARCHAR(50) NOT NULL,
author VARCHAR(50) NOT NULL,
qty_in_stock INTEGER(10) NOT NULL,
price DECIMAL(6,2) NOT NULL,
pubyear INTEGER(4),
PRIMARY KEY (isbn)
);

-- Book insert queries here

CREATE TABLE Customer (
cid VARCHAR(6),
cname VARCHAR(20) NOT NULL,
address VARCHAR(50),
age INTEGER(2),
PRIMARY KEY (cid)
);

-- Customer insert queries here

CREATE TABLE OrderBook (
oisbn VARCHAR(12),
ocid VARCHAR(6),
qty INTEGER(10) NOT NULL,
order_date DATE,
PRIMARY KEY (oisbn, order_date),
FOREIGN KEY (oisbn) REFERENCES Book(isbn),
FOREIGN KEY (ocid) REFERENCES Customer(cid)
);	

-- OrderBook insert queries here

-- try these
-- INSERT INTO OrderBook VALUES(
-- 'A1111',
-- 'c1',
-- 1,
-- '2020-01-01'
-- );

-- INSERT INTO OrderBook VALUES(
-- 'A1234',
-- 'c6',
-- 1,
-- '2020-01-02'
-- );

INSERT INTO OrderBook VALUES (
'A1236',
'c5',
6,
'2012-04-30'
);
 
-- try this
-- INSERT INTO OrderBook VALUES (
-- 'A1234',
-- 'c1',
-- 4,
-- '2013-10-01'
-- );

DELETE FROM OrderBook WHERE ocid = 'c5';

DELETE FROM Book WHERE isbn = 'A1234';

SHOW CREATE TABLE OrderBook;

ALTER TABLE OrderBook DROP FOREIGN KEY OrderBook_ibfk_1;
ALTER TABLE OrderBook DROP FOREIGN KEY OrderBook_ibfk_2;

ALTER TABLE OrderBook 
ADD CONSTRAINT OrderBook_ibfk_1
FOREIGN KEY (oisbn) REFERENCES Book(isbn)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE OrderBook
ADD CONSTRAINT OrderBook_ibfk_2
FOREIGN KEY (ocid) REFERENCES Customer(cid)
ON DELETE CASCADE
ON UPDATE CASCADE;


UPDATE Book SET isbn='A1239' WHERE isbn='A1238';