source database.sql;

-- 1. List the book isbn ordered by more than 2 customers.
SELECT oisbn FROM OrderBook GROUP BY oisbn HAVING COUNT(*) > 2;

-- 2. List the customer ids who have ordered more than total 4 copies.
SELECT ocid FROM OrderBook GROUP BY ocid HAVING SUM(qty) > 4;

-- 3. List the customer ids whose latest order was placed before 7 years.
SELECT ocid FROM OrderBook GROUP BY ocid HAVING MIN(datediff(curdate(), orderdate))/365 < 7;


-- 4. List the customer ids who have ordered book Operating Systems without using join
-- on isbn & in predicate. (Hint: use EXISTS/NOT EXISTS)
SELECT ocid FROM OrderBook WHERE EXISTS 
(
	SELECT * FROM Book WHERE title = 'Operating Systems' AND oisbn = isbn
);

-- you can do the above with this-
-- SELECT ocid FROM OrderBook WHERE oisbn IN  
-- (
-- 	SELECT isbn FROM Book WHERE title = 'Operating Systems'
-- );


-- 5. Find the names of the customers who have ordered book Operating Systems and
-- Data Structures and Algorithms without using join on customer name & in predicate.
-- (Hint: use EXISTS/NOT EXISTS)
SELECT cname FROM Customer WHERE EXISTS(
SELECT * FROM Book WHERE EXISTS(
SELECT * FROM OrderBook WHERE title = 'Operating Systems' AND oisbn = isbn and cid = ocid
) 
) AND EXISTS(
SELECT * FROM Book WHERE EXISTS(
SELECT * FROM OrderBook WHERE title = 'Data Structures and Algorithms' and oisbn = isbn and cid = ocid
) 
);

-- 6. List the customer ids who have not ordered both Operating Systems and Data
-- Structures and Algorithms.
SELECT cid FROM Customer WHERE NOT EXISTS(
SELECT * FROM Book WHERE EXISTS(
SELECT * FROM OrderBook WHERE title = 'Operating Systems' and isbn = oisbn and cid = ocid
)
) OR NOT EXISTS(
SELECT * FROM Book WHERE EXISTS(
SELECT * FROM OrderBook WHERE title = "Data Structures and Algorithms" and isbn = oisbn and cid = ocid
)
);

-- 7. List the customer ids who have either ordered Operating Systems or Data Structures
-- and Algorithms.
SELECT DISTINCT ocid from OrderBook WHERE oisbn IN (
SELECT isbn FROM Book WHERE title IN ('Operating Systems', 'Data Structures and Algorithms')
);

-- Another approach for 7-

-- SELECT cname FROM Customer as t1 WHERE EXISTS
-- (
-- 	SELECT ocid FROM OrderBook as t2 WHERE EXISTS
-- 	(
-- 		SELECT * FROM Book as t3 WHERE (t3.title = 'Operating Systems' OR t3.title = 'Data Structures and Algorithms') AND t2.oisbn = t3.isbn 
-- 	)
-- 	AND t1.cid = t2.ocid
-- );


-- 8. List the customer ids who have ordered a book Operating Systems or
-- Data Structures and Algorithms but not both.
SELECT cid FROM Customer WHERE EXISTS(
SELECT * FROM OrderBook WHERE EXISTS(
SELECT * FROM Book WHERE title = 'Operating Systems' and isbn = oisbn and cid = ocid
)
) XOR EXISTS (
SELECT * FROM OrderBook WHERE EXISTS(
SELECT * FROM Book WHERE title = 'Data Structures and Algorithms' and isbn = oisbn and cid = ocid
)
);

-- 9. List the customer names who have ordered less than total 4 copies. Write the query
-- without any join operation.
SELECT cname FROM Customer WHERE cid IN (
SELECT ocid FROM OrderBook GROUP BY ocid HAVING SUM(qty) <4
);

-- 10. Find the books with the second highest Qty_in_stock. Write the query without any
-- aggregate function, in/not in predicate, order by and limit;
SELECT * FROM Book WHERE Qty_in_stock = all(
SELECT MAX(Qty_in_stock) FROM Book WHERE Qty_in_stock < all(
SELECT Qty_in_stock FROM Book WHERE Qty_in_stock >= all (
SELECT Qty_in_stock FROM Book
)
) 
);
