drop table reviews;
drop table rentalagreement;
drop table provides;
drop table creditcard;
drop table propertypost2;
drop table propertypost1;
drop table hosts;
drop table users;

CREATE TABLE users
(email VARCHAR(40),
phone CHAR(12),
password  VARCHAR(40),
PRIMARY KEY(email));

grant select on users to public;


CREATE TABLE hosts
(email VARCHAR(40),
businessLicense CHAR(5) NOT NULL UNIQUE,
PRIMARY KEY(email),
FOREIGN KEY(email) REFERENCES users(email) ON DELETE CASCADE);

grant select on hosts to public;


CREATE TABLE propertypost1
(dwellingType VARCHAR(40),
propertyID INT NOT NULL,
email VARCHAR(40),
dailyRate INT,
bedrooms INT,
bathrooms INT,
postalCode CHAR(7),
streetAddress VARCHAR(40),
PRIMARY KEY(propertyID));

grant select on propertypost1 to public;


CREATE TABLE propertypost2
(postalCode CHAR(7),
city VARCHAR(40),
province VARCHAR(40),
PRIMARY KEY(postalCode));

grant select on propertypost2 to public;


CREATE TABLE creditcard
(creditcardNumber CHAR(20),
expiry DATE,
cvs INT,
name VARCHAR(40),
PRIMARY KEY(creditcardNumber, expiry));

grant select on creditcard to public;

	
CREATE TABLE provides(
creditcardNumber CHAR(20),
expiry DATE,
renterEmail VARCHAR(40),
FOREIGN KEY(creditcardNumber, expiry) REFERENCES creditcard(creditcardNumber, expiry) ON DELETE CASCADE,
FOREIGN KEY(renterEmail) REFERENCES users(email) ON DELETE CASCADE);

grant select on provides to public;


CREATE TABLE rentalagreement
(agreementID INT,
propertyID INT,
fromDate DATE,
toDate DATE,
creditcardNumber CHAR(20),
expiry DATE, 
hostEmail VARCHAR(40),
userEmail VARCHAR(40),
PRIMARY KEY(agreementID),
FOREIGN KEY(propertyID) REFERENCES propertypost1(propertyID) ON DELETE SET NULL,
FOREIGN KEY(creditcardNumber, expiry) REFERENCES creditcard(creditcardNumber, expiry) ON DELETE SET NULL,
FOREIGN KEY(hostEmail) REFERENCES users(email) ON DELETE SET NULL,
FOREIGN KEY(userEmail) REFERENCES users(email) ON DELETE SET NULL);

grant select on rentalagreement to public;



CREATE TABLE reviews
(reviewID INT,
email VARCHAR(40),
propertyID INT,
comments VARCHAR(100),
stars INT,
writtenOn DATE,
PRIMARY KEY(ReviewID),
FOREIGN KEY(email) REFERENCES users(email) ON DELETE SET NULL,
FOREIGN KEY(propertyID)  REFERENCES propertypost1(propertyID) ON DELETE CASCADE,
check(stars >=0 and stars <= 5));

grant select on reviews to public;

INSERT INTO users 
VALUES ('bob@gmail.com', 6041234567, 'pass1111');
INSERT INTO users 
VALUES ('jen@gmail.com', 6041112222, 'pass2222');
INSERT INTO users 
VALUES ('lindsay@hotmail.com', 7783334444, '3333pass');
INSERT INTO users 
VALUES ('mel@yahoo.com', 4169990000, '44pass44');
INSERT INTO users 
VALUES ('dan@gmail.com', 6138889977, 'pass5555');
INSERT INTO users 
VALUES ('jack@gmail.com', 7789990090, 'pass6666');
INSERT INTO users 
VALUES ('ari@yahoo.com', 6041123333, 'pass7777');
INSERT INTO users 
VALUES ('mia@hotmail.com', 3387659989, '3333pwwd');
INSERT INTO users 
VALUES ('steph@yahoo.com', 2198887766, '44pwwd44');
INSERT INTO users 
VALUES ('jill@gmail.com', 5160090000, 'pwwd5555');

insert into hosts
values ('jack@gmail.com', 'a2223');
insert into hosts
values ('ari@yahoo.com', 'b2223');
insert into hosts
values ('mia@hotmail.com', 'c2623');
insert into hosts
values ('steph@yahoo.com', 'd2223');
insert into hosts
values ('jill@gmail.com', 'e2523');

INSERT INTO propertypost1
VALUES ('townhouse', 00085,'mia@hotmail.com', 215, 3, 3, 'V6B3L9', '900 Seymour St');
INSERT INTO propertypost1
VALUES ('apartment', 12334,'steph@yahoo.com', 66, 1, 1, 'R1A3T7', '1061 Manitoba Ave');
INSERT INTO propertypost1
VALUES ('house', 56088,'mia@hotmail.com', 330, 4, 4, 'C1A7K4', '75 Kent St');
INSERT INTO propertypost1
VALUES ('apartment', 00087,'jack@gmail.com', 85, 1, 1, 'M5H1A1', '1 King St W');
INSERT INTO propertypost1
VALUES ('condo', 77860,'ari@yahoo.com', 116, 2, 1, 'M5J2T3', '181 Bay St');
INSERT INTO propertypost1
VALUES ('house', 70809,'jill@gmail.com', 400, 5, 4, 'V6B5Z6', '322 Davie St');
INSERT INTO propertypost1
VALUES ('house', 00987,'jill@gmail.com', 330, 3, 2, 'S4P0S3', '2125 Victoria Ave');
INSERT INTO propertypost1
VALUES ('apartment', 33451,'ari@yahoo.com', 89, 1, 1, 'V0G1Y0', '2003 2 Ave');
INSERT INTO propertypost1
VALUES ('apartment', 78000,'jill@gmail.com', 102, 3, 2, 'T5J1N7', '10111 Bellamy Hill Rd NW');

insert into propertypost2 
values ('M5H1A1', 'Toronto', 'ON');
insert into propertypost2 
values ('M5J2T3', 'Toronto', 'ON');
insert into propertypost2 
values ('V6B3L9', 'Vancouver', 'BC');
insert into propertypost2 
values ('R1A3T7', 'Selkirk', 'MB');
insert into propertypost2 
values ('V6B5Z6', 'Vancouver', 'BC');
insert into propertypost2 
values ('S4P0S3', 'Regina', 'SK');
insert into propertypost2 
values ('C1A7K4', 'Charlottetown', 'PE');
insert into propertypost2 
values ('V0G1Y0', 'Rossland', 'BC');
insert into propertypost2 
values ('T5J1N7', 'Edmonton', 'AB');


insert into creditcard 
values ('0000999988887777', '31-may-21', 111, 'Bob Smith');
insert into creditcard 
values ('0000999988889999', '20-apr-21', 555, 'Jen Doe');
insert into creditcard 
values ('1111999988887777', '10-jun-19', 190, 'Lindsey Smith');
insert into creditcard 
values ('2222999988887777', '15-dec-22', 333, 'Dan Black');
insert into creditcard 
values ('3333999988887777', '06-oct-20', 234, 'Mel Ng');
insert into creditcard 
values ('1234567789101112', '06-oct-20', 123, 'Jack Sparrow');
insert into creditcard 
values ('4444444555555666', '08-feb-22', 889, 'Ariella Ginger');
insert into creditcard 
values ('7777778888822222', '11-jul-19', 012, 'Mia Sawamura');
insert into creditcard 
values ('9999922222111111', '25-dec-18', 667, 'Stephen Waltz');
insert into creditcard 
values ('1010101010101112', '21-nov-21', 777, 'Jill Bill');



insert into rentalagreement 
values ('12345678', 00085,'10-jul-18', '15-jul-18', '0000999988887777', '31-may-21', 'mia@hotmail.com', 'bob@gmail.com');
insert into rentalagreement 
values ('23456789', 12334,'18-aug-18', '22-aug-18', '0000999988889999', '20-apr-21', 'steph@yahoo.com', 'jen@gmail.com');

insert into rentalagreement 
values ('34567890', 00085,'10-jul-18', '15-jul-18', '0000999988887777', '31-may-21', 'mia@hotmail.com', 'bob@gmail.com');
insert into rentalagreement 
values ('45678901', 00085,'10-jul-18', '15-jul-18', '0000999988887777', '31-may-21', 'mia@hotmail.com', 'bob@gmail.com');
insert into rentalagreement 
values ('56789012', 00085,'10-jul-18', '15-jul-18', '0000999988887777', '31-may-21', 'mia@hotmail.com', 'bob@gmail.com');


insert into reviews values(00001, 'bob@gmail.com', 00085, 'It was a fun stay. Will definitely rent again!',5, '02-jun-21');
insert into reviews values(00002, 'jen@gmail.com', 12334, 'Bad',1,'30-aug-18');
insert into reviews values(00003, 'lindsay@gmail.com', 00085, 'It was an okay stay',4, '03-Mar-2023');
insert into reviews values(00004, 'jill@gmail.com',00085,'Nay',3,'07-Nov-2019')

insert into provides values ('0000999988887777', '31-may-21', 'bob@gmail.com');
insert into provides values ('0000999988889999', '20-apr-21', 'jen@gmail.com');
insert into provides values ('1111999988887777', '10-jun-19', 'lindsay@hotmail.com');
insert into provides values ('2222999988887777', '15-dec-22', 'dan@gmail.com');
insert into provides values ('3333999988887777', '06-oct-20', 'mel@yahoo.com');
insert into provides values ('1234567789101112', '06-oct-20', 'jack@gmail.com');
insert into provides values ('4444444555555666', '08-feb-22', 'ari@yahoo.com');

insert into provides values ('7777778888822222', '11-jul-19', 'mia@hotmail.com');
insert into provides values ('9999922222111111', '25-dec-18', 'steph@yahoo.com');
insert into provides values ('1010101010101112', '21-nov-21', 'jill@gmail.com');


