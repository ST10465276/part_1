Create database Race_Day;
use Race_Day;

Create table Users(
userID int primary key,
fullName varchar(70) not null,
emailAddress varchar(70) not null,
phoneNumber varchar(25)not null,
password varchar(100) not null,
userRole varchar(20) not null
);

Create table Organisers(
organiserID int identity(1,1) primary key,
userID int,
Foreign key (userID) REFERENCES Users(userID)
);

Create table Event(
eventID int identity(1,1) primary key,
eventName varchar(60),
description varchar(70),
date date,
location varchar(70),
distance decimal(5,2),
eventType varchar(60),
organiserID int not null,
Foreign key (organiserID) REFERENCES Organisers (organiserID)
);

Create table Categories(
categoryID char(5) primary key,
categoryName varchar(50) not null,
distance decimal(5,2),
age int,
startTime time,
eventID int,
organiserID int,
Foreign key (eventID) REFERENCES Event(eventID),
Foreign key (organiserID) REFERENCES Organisers (organiserID)
);

Create table Participants(
participantID int identity(1,1) primary key,
eventID int,
userID int
Foreign key (eventID) REFERENCES Event (eventID),
Foreign key (userID) REFERENCES Users(userID)
);

Create table Enrolments(
enrolmentID int identity(1,1) primary key,
enrolmentDate date,
eventID int,
participantID int,
Foreign key (eventID) REFERENCES Event (eventID),
Foreign key (participantID) REFERENCES Participants (participantID),
);

Create table Results(
resultID int identity(1,1) primary key,
finishTime time,
finishPosition int,
enrolmentID int,
Foreign key (enrolmentID) REFERENCES Enrolments (enrolmentID)
);

Insert into Users
(userID,fullName,emailAddress,phoneNumber,password,userRole)
Values
(111,'Tshepang Mokoena','Tshe@gmail.com','0811165432','Tshe!12','Participant'),
(112,'Prince Grootboom','groot11@gmail.com','0765498001','PrGroot#11','Participant'),
(113,'Thina Mutsila','1Thinaaa@gmail.com','0761230987','Mutsila!99','Organiser'),
(114,'Rosy Mokoena','RoseM@gmail.com','0819877743','!roseM123','Participant'),
(115,'Humphrey Mkhize','Mki77@gmail.com','0724501987','HM*77','Organiser');

Select * From Users;

Insert into Organisers
(userID)
Values
(111),
(112),
(113),
(114),
(115);

Select * From Organisers;

Insert into Event
(eventName,description,date,location,distance,eventType,organiserID)
Values
('947 Ride Joburg','A premier 97km cycling race in Joburg streets','2026-08-11','Nasrec,Johannesburg',97.00,'Cycle',1),
('Cape town Cycle Walk','A 109 km cycling event that goes aroung Cape Town','2026-04-21','Cape Town City Centre',109.00,'Cycle',2),
('Soweto Marathon', 'A annual long-distance running event throgh historic streets of Soweto','2026-09-07','Nasrec Expo Centre,Johannesburg',42.2,'Run',3),
('702 Walk the Talk','Participation event in Johannesburg to walk and celebrate city streets','2026-11-26','Doornfontein,Johannesburg',5.00,'Walk',4),
('The Color Run','A five km fun run with vibrant participants','2026-08-29','Sowto Theatre Forecourt',5.00,'Run',5);

Select * From Event;

Insert into Categories
(categoryID,categoryName,distance,age,startTime,eventID,organiserID)
Values
('C001','Full marathon',97.00,20,'06:00',1,1),
('C002','109 km Cycle',109.00,13,'07:00',2,2),
('C003','42.2 km Run',42.2,20,'07:00',3,3),
('C004','Under 20',5.00,9,'06:30',4,4),
('C005','5km Run',5.00,4,'08:00',5,5);

Select * From Categories;

Insert into Participants
(eventID,userID)
Values
(1,111),
(2,112),
(3,113),
(4,114),
(5,115);

Select * From Participants;

Insert into Enrolments
(enrolmentDate,eventID,participantID)
Values
('2026-04-21',2,2),
('2026-11-26',4,4),
('2026-09-07',3,3),
('2026-08-11',1,1),
('2026-04-21',2,2);

Select * From Enrolments;

Insert into Results
(finishTime,finishPosition,enrolmentID)
Values
('00:28:45',01,1),
('00:32:10',05,3),
('00:45:23',10,4);

Select * From Results;

