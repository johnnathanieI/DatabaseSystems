SET ECHO ON

/*DROP TABLES*/
DROP TABLE customer_fav;
DROP TABLE promo_codes;
DROP TABLE customer_review;
DROP TABLE reservation;
DROP TABLE tee_time;
DROP TABLE credit_card;
DROP TABLE customer;
DROP TABLE course;

/*CREATE TABLES*/
CREATE TABLE course 
(course_name VARCHAR2(50) CONSTRAINT SYS_COURSE_PK PRIMARY KEY,
course_city VARCHAR2(25) NOT NULL,
course_prov CHAR(2) CONSTRAINT SYS_COURSE_PROV_CK CHECK (REGEXP_LIKE (course_prov, '[A-Z][A-Z]')),
course_country VARCHAR2(25) NOT NULL,
course_postal CHAR(7) CONSTRAINT SYS_COURSE_POSTAL_CK CHECK (REGEXP_LIKE (course_postal, '[A-Z][0-9][A-Z] [0-9][A-Z][0-9]')) NOT NULL,
average_rating NUMBER(2,1) CONSTRAINT SYS_COURSE_RATING_CK CHECK (average_rating BETWEEN 1 AND 5),
course_desc VARCHAR2(1500) NOT NULL,
course_year_build DATE,
course_length NUMBER(6,2));
 
 
 CREATE TABLE customer (
cust_first_name VARCHAR2(25),
cust_last_name VARCHAR2(25),
cust_email VARCHAR2(60),
cust# NUMBER,
gift_card_credit NUMBER(5,2),
CONSTRAINT SYS_CUST_PK PRIMARY KEY (cust#),
CONSTRAINT SYS_CUST_EMAIL_UK UNIQUE (cust_email),
CONSTRAINT SYS_CUST_EMAIL_CK CHECK (cust_email LIKE '%@%'),
CONSTRAINT SYS_CUST_GCC_CK CHECK (gift_card_credit >= 0)
 );
 
ALTER TABLE customer 
  MODIFY (cust_first_name NOT NULL)
  MODIFY (cust_last_name NOT NULL);

 
 
 
 CREATE TABLE credit_card (
    card_no VARCHAR2(16) CONSTRAINT SYS_CRED_PK PRIMARY KEY,
    card_firstname VARCHAR2(25) NOT NULL,
    card_lastname VARCHAR2(25) NOT NULL,
    card_expiration NUMBER(4) NOT NULL,
    default_flag NUMBER(1) NOT NULL,
    cust_no NUMBER
);

ALTER TABLE credit_card 
    ADD CONSTRAINT SYS_CRED_DF_CK CHECK(default_flag IN (0,1));


CREATE TABLE tee_time(
	tee_date DATE CONSTRAINT SYS_TEE_PK PRIMARY KEY,
  tee_price NUMBER(5,2) NOT NULL CONSTRAINT SYS_TEE_TEEPRICE_CK CHECK (tee_price >= 0),
  cart_inclusion CHAR(1) NOT NULL CONSTRAINT SYS_TEE_CART_CK CHECK (cart_inclusion IN ('Y', 'N')),
  hole_number NUMBER(2) NOT NULL CONSTRAINT SYS_TEE_HOLENO_CK CHECK (hole_number IN (9, 18)),
  available_spaces NUMBER(1) NOT NULL CONSTRAINT SYS_TEE_SPACES_CK CHECK (available_spaces BETWEEN 0 AND 4),
  course_name VARCHAR2(50),
 CONSTRAINT SYS_COURSE_TEE_FK FOREIGN KEY (course_name) REFERENCES course (course_name) ON DELETE CASCADE
);

CREATE TABLE reservation (
	reservation# NUMBER,
  total_green_fees NUMBER(8,2),
  tax_paid NUMBER(5,2),
  amt_charged NUMBER,
  number_of_players CHAR(1),
  card_no VARCHAR2(16),
  tee_date DATE,
  CONSTRAINT SYS_RESERV_PK PRIMARY KEY (reservation#),
  CONSTRAINT SYS_RESERV_PLAYERS_CK CHECK (number_of_players BETWEEN 1 AND 4),
  CONSTRAINT SYS_TEE_RESERV_FK FOREIGN KEY (tee_date) REFERENCES tee_time (tee_date),
  CONSTRAINT SYS_CRED_RESERV_FK FOREIGN KEY (card_no) REFERENCES credit_card (card_no)
);

CREATE TABLE customer_review (
	review# NUMBER CONSTRAINT SYS_CREVIEW_PK PRIMARY KEY,
  review_title VARCHAR2(100),
  review_rating CHAR(1) NOT NULL CONSTRAINT SYS_CREVIEW_RATING_CK CHECK (review_rating BETWEEN 0 AND 5),
  review_comments VARCHAR2(500) NOT NULL,
  course_name VARCHAR2(50),
  reservation# NUMBER,
  CONSTRAINT SYS_COURSE_CREVIEW_FK FOREIGN KEY (course_name) REFERENCES course (course_name)
);

CREATE TABLE promo_codes (
	promocode CHAR(18),
  is_used NUMBER(1) NOT NULL,
  date_issued DATE NOT NULL,
  value CHAR(2) NOT NULL,
  expiration_date DATE NOT NULL,
  reservation# NUMBER,
  cust# NUMBER,
  CONSTRAINT SYS_PROMO_PK PRIMARY KEY (promocode),
  CONSTRAINT SYS_PROMO_USED_CK CHECK (is_used IN (0, 1)),
  CONSTRAINT SYS_PROMO_EXPIRY_CK CHECK (expiration_date > date_issued)
);

ALTER TABLE promo_codes 
	ADD CONSTRAINT SYS_RESERV_PROMO_FK FOREIGN KEY (reservation#) REFERENCES reservation
    ADD CONSTRAINT SYS_CUST_PROMO_FK FOREIGN KEY (cust#) REFERENCES customer;



 CREATE TABLE customer_fav (
  course_name VARCHAR2(50),
  cust# NUMBER,
  CONSTRAINT SYS_COURSE_FAV_FK FOREIGN KEY (course_name) REFERENCES course(course_name),
  CONSTRAINT SYS_CUST_FAV_FK  FOREIGN KEY (cust#)REFERENCES customer(cust#),
  PRIMARY KEY (course_name, cust#)
);

ALTER TABLE customer_review
ADD CONSTRAINT SYS_RESERV_CREVIEW_FK FOREIGN KEY (reservation#) REFERENCES reservation (reservation#);



