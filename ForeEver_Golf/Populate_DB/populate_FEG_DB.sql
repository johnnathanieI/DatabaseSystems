/*DELETE VALUES*/
DELETE FROM customer_fav;
DELETE FROM promo_codes;
DELETE FROM customer_review;
DELETE FROM reservation;
DELETE FROM tee_time;
DELETE FROM credit_card;
DELETE FROM customer;
DELETE FROM course;

/*INSERT VALUES*/

/*Name, City, Prov, Country, Postal, Rating(Number), Desc, Year_Built, Length*/

INSERT INTO course
VALUES ('Casselberry Golf Club', 'Casselberry', 'FL', 'USA', 'A9A 9A9', 3.5, 'Casselberry is a thoroughly enjoyable experience for both the newcomer and the low-handicapper.', '01-NOV-1947', 5472.52);
INSERT INTO course
VALUES ('Grande Vista Golf Club', 'Orlando', 'FL', 'USA', 'T3H 8M1', 4.3, 'This 9-hole, par 32 Ron Garl design encourages learning and development for all levels of play, but also provides challenges for the most avid golfer.', '29-DEC-1997', 2308.78);
INSERT INTO course
VALUES ('North Shore Golf Club', 'Orlando', 'FL', 'USA','T3H 8M2', 4.2, 'The golf course features two distinct nines converging to form one remarkable 18-hole layout.', '16-JAN-2001', 6896.21);
INSERT INTO course
VALUES ('Shingle Creek Golf Club', 'Orlando', 'FL', 'USA', 'T6H 2J3', 4.4, 'The future of your best golf game may just be waiting on the sandy banks of the historic Shingle Creek, where stories of the past burble mysteriously beneath the silken black waters.', '04-OCT-2003', 7213.86);
INSERT INTO course
VALUES('Kissimmee Bay Country Club', 'Kissimmee', 'FL', 'USA', 'G7B 5T5', 3.9, 'This 6,846 yard, par 71 championship course is graced by the presence of century-old oaks, lofty cypress tress, a dozen intreging and challenging water hazards and the presence of sand hill cranes.', '19-FEB-1990', 6830.54);

/*First, Last, Email, Cust#, GiftCard*/
INSERT INTO customer
VALUES ('Jake', 'Lee', 'jakethewarri0r@gmail.com', 000568973, 1);
INSERT INTO customer
VALUES ('Tiffany', 'Bradley', 'tiffywiffy@gmail.com', 000923745, 2);
INSERT INTO customer
VALUES ('Holly', 'VanDoofe', 'vanh3ls!ng@gmail.com', 000256731, 2);

/*Card#, CardFirst, CardLast, Expiry, Default, Cust#*/
INSERT INTO credit_card
VALUES('###-###-9672', 'Jake', 'Lee', 0526, 1, 000568973);
INSERT INTO credit_card
VALUES('###-###-2241', 'Tiffany', 'Bradle', 0225, 1, 000923745);
INSERT INTO credit_card
VALUES('###-###-3237', 'Holly', 'VanDoofe', 0125, 1, 000256731);

/*Date, Price, Cart, Hole#, AvlblSpaces, CourseFK*/
INSERT INTO tee_time
VALUES (to_date('06-NOV-2022 12:30 A.M.', 'dd-mm-yy hh:mi A.M.'), 34.99, 'N', 18, 2, 'Casselberry Golf Club');
INSERT INTO tee_time
VALUES (to_date('06-NOV-2022 03:30 P.M.', 'dd-mm-yy hh:mi A.M.'), 34.99, 'N', 18, 0, 'Casselberry Golf Club');
INSERT INTO tee_time
VALUES (to_date('06-NOV-2022 06:30 P.M.', 'dd-mm-yy hh:mi A.M.'), 50.99, 'Y', 18, 4, 'Casselberry Golf Club');
INSERT INTO tee_time
VALUES (to_date('06-NOV-2022 02:00 P.M.', 'dd-mm-yy hh:mi A.M.'), 40.99, 'N', 18, 2, 'Grande Vista Golf Club');
INSERT INTO tee_time
VALUES (to_date('06-NOV-2022 06:40 P.M.', 'dd-mm-yy hh:mi A.M.'), 40.99, 'N', 18, 1, 'Grande Vista Golf Club');
INSERT INTO tee_time
VALUES (to_date('07-NOV-2022 02:10 P.M.', 'dd-mm-yy hh:mi A.M.'), 59.99, 'Y', 18, 4, 'Grande Vista Golf Club');
INSERT INTO tee_time
VALUES (to_date('06-NOV-2022 02:20 P.M.', 'dd-mm-yy hh:mi A.M.'), 40.99, 'N', 18, 1, 'North Shore Golf Club');
INSERT INTO tee_time
VALUES (to_date('07-NOV-2022 02:30 P.M.', 'dd-mm-yy hh:mi A.M.'), 60.99, 'Y', 18, 0, 'North Shore Golf Club');
INSERT INTO tee_time
VALUES (to_date('08-NOV-2022 02:40 P.M.', 'dd-mm-yy hh:mi A.M.'), 60.99, 'Y', 18, 2, 'North Shore Golf Club');
INSERT INTO tee_time
VALUES (to_date('06-NOV-2022 08:00 A.M.', 'dd-mm-yy hh:mi A.M.'), 35.99, 'N', 18, 2, 'Shingle Creek Golf Club');
INSERT INTO tee_time
VALUES (to_date('06-NOV-2022 12:00 P.M.', 'dd-mm-yy hh:mi A.M.'), 45.99, 'Y', 18, 0, 'Shingle Creek Golf Club');
INSERT INTO tee_time
VALUES (to_date('06-NOV-2022 04:00 P.M.', 'dd-mm-yy hh:mi A.M.'), 35.99, 'N', 18, 1, 'Shingle Creek Golf Club');
INSERT INTO tee_time
VALUES (to_date('06-NOV-2022 12:10 P.M.', 'dd-mm-yy hh:mi A.M.'), 30.99, 'N', 18, 0, 'Kissimmee Bay Country Club');
INSERT INTO tee_time
VALUES (to_date('07-NOV-2022 12:20 P.M.', 'dd-mm-yy hh:mi A.M.'), 46.99, 'Y', 18, 0, 'Kissimmee Bay Country Club');
INSERT INTO tee_time
VALUES (to_date('07-NOV-2022 04:10 P.M.', 'dd-mm-yy hh:mi A.M.'), 46.99, 'Y', 18, 2, 'Kissimmee Bay Country Club');

/*Reserv#, TotalGreenFees, Tax, AmtCharged, #OfPlayers, Card#, TeeDate*/
INSERT INTO reservation
VALUES (525001926, 38.49, 3.50, 34.99, 4, '###-###-9672', to_date('06-NOV-2022 03:30 P.M.', 'dd-mm-yy hh:mi A.M.'));
INSERT INTO reservation
VALUES (525001827, 60.49, 5.50, 54.99, 1, '###-###-2241', to_date('07-NOV-2022 02:30 P.M.', 'dd-mm-yy hh:mi A.M.'));
INSERT INTO reservation
VALUES (525001324, 50.59, 4.60, 45.99, 2, '###-###-2241', to_date('06-NOV-2022 12:00 P.M.', 'dd-mm-yy hh:mi A.M.'));
INSERT INTO reservation
VALUES (525001689, 27.49, 2.50, 24.99, 1, '###-###-3237', to_date('06-NOV-2022 12:10 P.M.', 'dd-mm-yy hh:mi A.M.'));
INSERT INTO reservation
VALUES (525001223, 45.49, 4.50, 40.99, 4, '###-###-3237', to_date('07-NOV-2022 12:20 P.M.', 'dd-mm-yy hh:mi A.M.'));

/*Review#, Title, Rating, Comments, CourseNameFK, Reserv#FK*/
INSERT INTO customer_review
VALUES(001001, 'Golfers Dream', 4, 'Challenging course also really loved the ambience and scenery- would recommend!', 'Casselberry Golf Club', 525001926);
INSERT INTO customer_review
VALUES (001002, 'Perfectly fun with friends', 4,'Had lots of challenging holes, not too difficult either.', 'North Shore Golf Club', 525001827);
INSERT INTO customer_review
VALUES (001003, 'Puzzling course!', 5, 'Never have I ever had so much fun wondering how to tackle each hole.', 'Shingle Creek Golf Club', 525001324);

/*Promo, Used?, Date, Value, Expiry, Reserv#FK, Cust#FK*/
INSERT INTO promo_codes
VALUES ('DISCOUNTNOVEMBER22', 1, '31-OCT-22', 06, '30-NOV-22', 525001827, 000923745);
INSERT INTO promo_codes
VALUES ('DISCOUNTOCTOBERWOO', 0, '30-SEP-22', 06, '31-OCT-22', NULL, 000923745);
INSERT INTO promo_codes
VALUES ('DISCOUNTFORFREEWOW', 0, '01-NOV-22', 06, '01-JAN-23', NULL, 000568973);
INSERT INTO promo_codes
VALUES ('DISCOUNTALLYEARYAY', 1, '01-JAN-22', 06, '31-DEC-22', 525001689, 000256731);
INSERT INTO promo_codes
VALUES ('GOLFERSDISCOUNT123', 1, '01-FEB-22', 06, '01-FEB-23', 525001223, 000256731);

/*CourseFK, Cust#FK*/
INSERT INTO customer_fav
VALUES('Casselberry Golf Club', 000568973);
INSERT INTO customer_fav
VALUES ('North Shore Golf Club', 000923745);
INSERT INTO customer_fav
VALUES ('Shingle Creek Golf Club', 000923745);
INSERT INTO customer_fav
VALUES ('Kissimmee Bay Country Club', 000256731);

