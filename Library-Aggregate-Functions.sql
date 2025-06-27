Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 23
Server version: 9.3.0 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use librarydb;
Database changed
mysql> select memberid, count(*) as loan_count
    -> from loans
    -> group by memberid;
+----------+------------+
| memberid | loan_count |
+----------+------------+
|        1 |          2 |
|        2 |          2 |
+----------+------------+
2 rows in set (0.443 sec)

mysql> SELECT MemberID, COUNT(*) AS TotalLoans
    -> FROM Loans
    -> GROUP BY MemberID
    -> HAVING COUNT(*) > 1;
+----------+------------+
| MemberID | TotalLoans |
+----------+------------+
|        1 |          2 |
|        2 |          2 |
+----------+------------+
2 rows in set (0.080 sec)

mysql> -- Assuming a FineAmount column exists
Query OK, 0 rows affected (0.008 sec)

mysql> SELECT MemberID, ROUND(AVG(FineAmount), 2) AS Avg_Fine
    -> FROM Loans
    -> GROUP BY MemberID;
ERROR 1054 (42S22): Unknown column 'FineAmount' in 'field list'
mysql> SELECT COUNT(DISTINCT BookID) AS UniqueBooksLoaned
    -> FROM Loans;
+-------------------+
| UniqueBooksLoaned |
+-------------------+
|                 2 |
+-------------------+
1 row in set (0.211 sec)

mysql> SELECT MemberID, BookID, COUNT(*) AS TimesBorrowed
    -> FROM Loans
    -> GROUP BY MemberID, BookID;
+----------+--------+---------------+
| MemberID | BookID | TimesBorrowed |
+----------+--------+---------------+
|        1 |      1 |             2 |
|        2 |      2 |             2 |
+----------+--------+---------------+
2 rows in set (0.082 sec)

mysql>