SET ECHO ON
SET VERIFY ON
SET PAGESIZE 66
SET LINESIZE 100

spool c:/cprg250s/project4output.txt

SELECT * FROM course;

SELECT * FROM tee_time;

SELECT * FROM customer;

SELECT * FROM cust_favourites;

SELECT * FROM reservation;

SELECT * FROM customer_review;

SELECT * FROM promo_codes;

spool off