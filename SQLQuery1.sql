----------------------------------------------------------CREATE------------------------------------------

-------CREATE-TABLE------
create table dbo.Childs(
	childId				Varchar(20)		not null PRIMARY KEY,
	childFirstName		Varchar(20)		null,
	childLastName		Varchar(20)		null,
	childGroup			Varchar(10)		null,
	childBirthDate		Datetime		null,
	childGender			Varchar(10)		null,
	isReward			BIT				null,
	swaddleAmount		Integer			null,
	clothesAmount		Integer			null,
	wipesAmount			Integer			null,
	activeStatus		BIT				null
	)

CREATE TABLE dbo.Parents(
	parentId			Varchar(20)		not null PRIMARY KEY,
	parentFirstName		Varchar(20)		null,
	parentLastName		Varchar(20)		null,
	parentGender		Varchar(10)		null,
	phoneNumber			Varchar(20)		null,
	City				Varchar(20)		null,
	Country				Varchar(20)		null,
	Street			    Varchar(20)		null,
	zipCode			    Integer			null
	)

CREATE TABLE dbo.Workers(
	workerId			Varchar(20)		not null PRIMARY KEY,
	workerFirstName		Varchar(20)		null,
	workerLastName		Varchar(20)		null,
	workerTitle			Varchar(10)		null,		
	workerBirthDate		Datetime		null,  
	workerGender		Varchar(10)		null,
	workerGroup			Varchar(10)		null,
	phoneNumber			Varchar(20)		null,
	City				Varchar(20)		null,
	Country				Varchar(20)		null,
	Street			    Varchar(20)		null,
	zipCode			    Integer			null,
	salary				Varchar(20)		null,
	enterDate			Datetime		null,
	activeStatus		BIT				null
	)

CREATE TABLE dbo.Products(
	productId		    Varchar(20)	   	not null PRIMARY KEY,
	productName		    Varchar(20)		null,
	amount			    Float			null,
	thresholdAmount		Float			null,
	scale				Varchar(20)		null,
	expDate			    Datetime		null
	)

CREATE TABLE dbo.ShiftConstraints(
	workerId				Varchar(20)		not null,
	shiftDate				Datetime		not null,
	shiftAvailability		BIT				null,
	notes					varchar(100)    null,
	primary key (workerId,shiftDate)
	)

CREATE TABLE dbo.Allergies(
	allergyName		    Varchar(20)			not null primary key,
	allergyDescription	Varchar(200)		null
	)

CREATE TABLE dbo.ChildAllergies(
	childId			    Varchar(20)		not null,
	allergyName		    Varchar(20)		not null,
	primary key (childId,allergyName)
	)

CREATE TABLE dbo.Attendances(
	childId				Varchar(20)		not null,
	attendanceDate		datetime		not null,
	isPresent			bit				null,
	parentIdPresent		Varchar(20)		null, 
	currentArea			Varchar(20)		null,
	workerIdArea		Varchar(20)		null,
	primary key (childId,attendanceDate)
	)
	
CREATE TABLE dbo.ChildrenParents(
	childId				Varchar(20)		 not null,
	parentId			Varchar(20)		 not null,
	primary key (childId,parentId)
	)

--------CREATE-FK----------

ALTER TABLE ShiftConstraints ADD CONSTRAINT FK_Workers1 FOREIGN KEY (workerId) REFERENCES Workers (workerId)

ALTER TABLE dbo.ChildAllergies ADD CONSTRAINT FK_Childs1 FOREIGN KEY (childId) REFERENCES Childs (childId)
ALTER TABLE dbo.ChildAllergies ADD CONSTRAINT FK_Allergies1 FOREIGN KEY (allergyName) REFERENCES Allergies (allergyName)

ALTER TABLE dbo.Attendances ADD CONSTRAINT FK_Childs2 FOREIGN KEY (childId) REFERENCES Childs (childId)
ALTER TABLE dbo.Attendances	ADD CONSTRAINT FK_Parents1 FOREIGN KEY (parentIdPresent) REFERENCES Parents (parentId)

ALTER TABLE dbo.ChildrenParents ADD CONSTRAINT FK_Childs3 FOREIGN KEY (childId) REFERENCES Childs (childId)
ALTER TABLE dbo.ChildrenParents ADD CONSTRAINT FK_Parents2 FOREIGN KEY (parentId) REFERENCES Parents (parentId)

----------------------------------------------------------DROP-------------------------------------

--------DROP-FOREIGN--------

ALTER TABLE dbo.ChildAllergies DROP CONSTRAINT FK_Childs1 
ALTER TABLE dbo.ChildAllergies DROP CONSTRAINT FK_Allergies1 

ALTER TABLE dbo.Attendances DROP CONSTRAINT FK_Childs2 
ALTER TABLE dbo.Attendances	DROP CONSTRAINT FK_Parents1  

ALTER TABLE dbo.ChildrenParents DROP CONSTRAINT FK_Childs3 
ALTER TABLE dbo.ChildrenParents DROP CONSTRAINT FK_Parents2

--------DROP-TABLE--------
drop table dbo.ChildrenParents
drop table dbo.Attendances
drop table dbo.ChildAllergies
drop table dbo.Allergies
drop table dbo.ShiftConstraints
drop table dbo.Products
drop table dbo.Workers
drop table dbo.Parents
drop table dbo.Childs

----------------------------------------------------------INSERTS-------------------------------------

--------Allergies--------
INSERT INTO Allergies (allergyName, allergyDescription)
VALUES 
('Peanut allergy', 'An allergy to peanuts, which can cause severe reactions including anaphylaxis'),
('Tree nut allergy', 'An allergy to tree nuts, which can cause severe reactions including anaphylaxis'),
('Fish allergy', 'An allergy to fish, which can cause reactions ranging from mild to severe'),
('Shellfish allergy', 'An allergy to shellfish, which can cause reactions ranging from mild to severe'),
('Pollen allergy', 'An allergy to pollen, which can cause symptoms such as sneezing, itchy eyes, and a runny nose');

--------Attendances--------
INSERT INTO Attendances (childId, attendanceDate, isPresent, parentIdPresent, currentArea, workerIdArea)
VALUES 
(201, '2023-01-11', 1, 301, 'חוץ', 602),
(202, '2023-01-11', 1, 302, 'חוץ', 602),
(203, '2023-01-11', 1, 303, 'חוץ', 602),
(204, '2023-01-11', 1, 304, 'פנים', 604),
(205, '2023-01-11', 1, 305, 'פנים', 604);

--------Childs--------
INSERT INTO Childs (childId, childFirstName, childLastName, childGender, childBirthDate, childGroup, isReward, swaddleAmount, clothesAmount, wipesAmount, activeStatus)
VALUES 
(201, 'John', 'Doe', 'אישה', '2020-01-01', 'בוגרים', 1, 10, 5, 10, 1),
(202, 'Jane', 'Doe', 'אישה', '2019-01-01', 'בוגרים', 0, 15, 8, 9, 1),
(203, 'Jack', 'Smith', 'אישה', '2018-01-01', 'בוגרים', 1, 12, 6, 5, 1),
(204, 'Jill', 'Smith', 'אישה', '2017-01-01', 'בוגרים', 0, 14, 7, 3, 1),
(205, 'James', 'Johnson', 'אישה', '2016-01-01', 'בוגרים', 1, 11, 4, 8, 1);

--------ChildAllergies--------
INSERT INTO ChildAllergies (childId, allergyName)
VALUES 
(201, 'Peanut allergy'),
(202, 'Peanut allergy'),
(203, 'Peanut allergy'),
(203, 'Fish allergy'),
(203, 'Shellfish allergy'),
(204, 'Fish allergy'),
(205, 'Shellfish allergy');

--------ChildrenParents--------
INSERT INTO ChildrenParents (childId, parentId)
VALUES 
(201, 301),
(202, 301),
(203, 302),
(203, 303),
(203, 304),
(204, 305),
(205, 305);

--------Parents--------
INSERT INTO Parents (parentId, parentFirstName, parentLastName, parentGender, phoneNumber, city, country, street, zipCode)
VALUES
(301, 'John', 'Doe', 'גבר', '+972526036458', 'New York', 'USA', '1st Ave', 10001),
(302, 'Jane', 'Doe', 'גבר', '0526036458', 'Los Angeles', 'USA', 'Sunset Blvd', 90001),
(303, 'Bob', 'Smith', 'גבר', '526036458', 'Chicago', 'USA', 'Michigan Ave', 60601),
(304, 'Alice', 'Smith', 'אישה', '526036458', 'Toronto', 'Canada', 'Yonge St', 70046),
(305, 'Sam', 'Johnson', 'גבר', '526036458', 'London', 'UK', 'Oxford St', 50064);

--------Products--------
INSERT INTO Products (productId, productName, amount,thresholdAmount,scale, expDate)
VALUES
(401, 'Apple', 7.0,5,'KG','2022-12-29'),
(402, 'Apple', 10.0,5,'KG','2023-01-10'),
(403, 'Apple', 20.0,5,'KG','2023-03-29'),
(404, 'Apple', 10.0,5,'KG','2022-08-29'),
(405, 'Orange', 20.5,5,'KG','2022-11-25'),
(406, 'Orange', 20.5,5,'KG','2023-11-25'),
(407, 'Juice', 30.6,4,'Liter','2023-10-31'),
(408, 'Rice', 40.0,5,'KG','2025-09-30'),
(409, 'Delicacies', 50.0,70,'Units','2023-08-31');

--------Workers--------
INSERT INTO workers (workerId, workerFirstName, workerLastName, workerTitle, workerBirthDate, workerGender,
					workerGroup, phoneNumber, City, country, street, zipCode, salary, enterDate, activeStatus)
VALUES
(601, 'John', 'Doe', 'מנהלת', '1970-01-01', 'אישה', 'אחר', '123-456-7890', 'New York', 'USA', '123 Main Street', '10001', 75000, '2022-01-01',1),
(602, 'Jane', 'Smith', 'מטפלת', '1980-02-02', 'אישה', 'בוגרים','234-567-8901', 'Chicago', 'USA', '456 Market Street', '60602', 55000, '2022-02-02',0),
(603, 'Bob', 'Johnson', 'מטפלת', '1985-03-03', 'אישה', 'תינוקיה', '345-678-9012', 'San Francisco', 'USA', '789 Mission Street', '94103', 65000, '2022-03-03',1),
(604, 'Alice', 'Williams', 'טבחית', '1990-04-04', 'אישה', 'אחר', '456-789-0123', 'Boston', 'USA', '246 Beacon Street', '02116', 60000, '2022-04-04',1),
(605, 'Mike', 'Brown', 'טבחית', '1995-05-05', 'אישה', 'אחר', '567-890-1234', 'Los Angeles', 'USA', '135 Sunset Boulevard', '90012', 70000, '2022-05-05',1);