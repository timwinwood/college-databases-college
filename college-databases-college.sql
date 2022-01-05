/*
* college-databases-college.sql
* 
* Created By: Tim Winwood
* Student ID: x20213638
* Date: 27 Feb 2021
* 
* Module: Introduction to Databases
* Project: CA1 - College Office Database System
* Course: HDip Science in Computing Information (Software Development)
* College: National College of Ireland
* School: School of Computing
* Lecturer: Tania Malik
* 
*/

-- Task Two - Create & Populate the Database --
-----------------------------------------------

-- Task Two - Question 1 - Create the DB and All Tables --
----------------------------------------------------------------
-- Note: Foreign Key Constraint Statements on line 531


-- Create and use the DB'CollegeOffice' --

-- Drop the DB 'CollegeOffice' if it exists 
DROP DATABASE IF EXISTS CollegeOffice;

-- Create the DB 'CollegeOffice'
CREATE DATABASE CollegeOffice;

-- Use the DB 'CollegeOffice' for the proceeding SQL statements
USE CollegeOffice;

/* Create the Table 'College'
* Additional comments provided for this 'CREATE TABLE' statement to demonstrate understanding
*
* CREATE TABLE <table_name>(); - Creates the table
* int(11) - Integer Data Type of Length 11. A whole number.
* varchar(50) - Variable Chatacter Data Type of Length 50. An alphanumeric string.
* NOT_NULL - Column Constraint. The columns' values cannot contain Null (empty) values.
* AUTO_INCREMENT - Column Constrain. A unique number is auto-generated when a new row is inserted. 
* PRIMARY KEY - Column Constrain. The columns' values must uniquely identify each row.
*
* @column ID - Primary Key. Uniquely identifies records in the College Table. , 
* @column DeanID - Foreign Key. References Staff(ID). To indicate which Staff Member is the Dean.  
* @column Name - College Name., 
* @column Address - College Address. , 
* @column Phone - College Phone. Note: For Phone column,
 varchar() used rather than int().
* I will not do any math on the Phone number,
 and the Phone number may contain special characters for country/area code.
*/
CREATE TABLE College (
ID int(11) NOT NULL AUTO_INCREMENT,
DeanID int(11) NOT NULL,
Name varchar(50) NOT NULL,
Address varchar(255) NOT NULL,
Phone varchar(10) NOT NULL,
PRIMARY KEY (ID)
);

-- Create the Table 'Course'
CREATE TABLE Course (
ID int(11) NOT NULL AUTO_INCREMENT,
DepartmentID int(11) NOT NULL,
Name varchar(50) NOT NULL,
Level int(2) NOT NULL,
Delivery varchar(50) NOT NULL,
PRIMARY KEY (ID)
);

-- Create the Table 'Course_Exam'
CREATE TABLE Course_Exam (
CourseID int(11) NOT NULL,
ExamID int(11) NOT NULL,
PRIMARY KEY (CourseID,ExamID)
);

-- Create the Table 'Course_Semester'
CREATE TABLE Course_Semester (
CourseID int(11) NOT NULL,
SemesterID int(11) NOT NULL,
PRIMARY KEY (CourseID,SemesterID)
);

-- Create the Table 'Course_Student'
CREATE TABLE Course_Student (
CourseID int(11) NOT NULL,
StudentID int(11) NOT NULL,
`Year` int(1) NOT NULL,
Active int(1) NOT NULL,
PRIMARY KEY (CourseID,StudentID)
);

-- Create the Table 'Department'
CREATE TABLE Department (
ID int(11) NOT NULL AUTO_INCREMENT,
CollegeID int(11) NOT NULL,
Name varchar(50) NOT NULL,
PRIMARY KEY (ID)
);

-- Create the Table 'Exam'
CREATE TABLE Exam (
ID int(11) NOT NULL AUTO_INCREMENT,
Name varchar(50) NOT NULL,
PRIMARY KEY (ID)
);
 
-- Create the Table 'Exam_Student'
CREATE TABLE Exam_Student (
ExamID int(11) NOT NULL,
StudentID int(11) NOT NULL,
Grade int(11) NOT NULL,
PRIMARY KEY (ExamID,StudentID)
);

-- Create the Table 'FeeSchedule'
CREATE TABLE FeeSchedule (
ID int(11) NOT NULL AUTO_INCREMENT,
CourseID int(11) NOT NULL,
`Date` date NOT NULL,
Amount double NOT NULL,
PRIMARY KEY (ID)
);

-- Create the Table 'Holiday'
CREATE TABLE Holiday (
StaffID int(11) NOT NULL,
`Date` date NOT NULL,
Days double NOT NULL
);

-- Create the Table 'Opening'
CREATE TABLE Opening (
ID int(11) NOT NULL AUTO_INCREMENT,
CollegeID int(11) NOT NULL,
Weekday int(11) NOT NULL,
OpenTime time NOT NULL,
CloseTime time NOT NULL,
PRIMARY KEY (ID)
);

-- Create the Table 'Payment'
CREATE TABLE Payment (
ID int(11) NOT NULL AUTO_INCREMENT,
FeeScheduleID int(11) NOT NULL,
StudentID int(11) NOT NULL,
`Date` date NOT NULL,
PRIMARY KEY (ID)
);

-- Create the Table 'Semester'
CREATE TABLE Semester (
ID int(11) NOT NULL AUTO_INCREMENT,
CollegeID int(11) NOT NULL,
StartDate date NOT NULL,
EndDate date NOT NULL,
PRIMARY KEY (ID)
);

-- Create the Table 'Staff'
CREATE TABLE Staff (
ID int(11) NOT NULL AUTO_INCREMENT,
DepartmentID int(11) NOT NULL,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Email varchar(50),
Address varchar(255) NOT NULL,
Phone varchar(10),
Position varchar(50) NOT NULL,
Tenure int(2) NOT NULL,
HolidayAllowance int(2) NOT NULL,
PRIMARY KEY (ID)
);

-- Create the Table 'Student'
CREATE TABLE Student (
ID int(11) NOT NULL AUTO_INCREMENT,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Email varchar(50),
Address varchar(255) NOT NULL,
Phone varchar(10),
PRIMARY KEY (ID)
);

-- Task Two - Question 2 - Populate DB with Data --
----------------------------------------------------------------

/* Insert Records into the Table 'College'
* Additional comments provided for this 'INSERT' statement to demonstrate understanding
*
* INSERT INTO <table_name>(col1, col2, ..) - Insert into the table. Comma-Seperated Column names specified in brackets.
* VALUES(col1, col2, ..) - Comma-Seperated Values specified in brackets.
*/
INSERT INTO College(ID, DeanID, Name, Address, Phone)
VALUES (1,1,"National College of Ireland","Mayor Street Lower, International Financial Services Centre, Dublin","014498500");

-- Insert Records into the Table 'Course'
INSERT INTO Course(ID, DepartmentID, Name, Level, Delivery)
VALUES (1,1,"HCert Art",6,"Online");
INSERT INTO Course(ID, DepartmentID, Name, Level, Delivery)
VALUES (2,2,"PHD Business",9,"Online");
INSERT INTO Course(ID, DepartmentID, Name, Level, Delivery)
VALUES (3,3,"MSc Computing",7,"Online");
INSERT INTO Course(ID, DepartmentID, Name, Level, Delivery)
VALUES (4,4,"HDip Education",8,"Online");
INSERT INTO Course(ID, DepartmentID, Name, Level, Delivery)
VALUES (5,5,"PHD Engineering",9,"Online");
INSERT INTO Course(ID, DepartmentID, Name, Level, Delivery)
VALUES (6,6,"MSc History",7,"Classroom");
INSERT INTO Course(ID, DepartmentID, Name, Level, Delivery)
VALUES (7,7,"HDip Languages",8,"Classroom");
INSERT INTO Course(ID, DepartmentID, Name, Level, Delivery)
VALUES (8,8,"PHD Law",9,"Classroom");
INSERT INTO Course(ID, DepartmentID, Name, Level, Delivery)
VALUES (9,9,"MSc Medicine",7,"Classroom");
INSERT INTO Course(ID, DepartmentID, Name, Level, Delivery)
VALUES (10,10,"HCert Music",6,"Classroom");

-- Insert Records into the Table 'Course_Exam'
INSERT INTO Course_Exam(CourseID, ExamID)
VALUES (1, 1);
INSERT INTO Course_Exam(CourseID, ExamID)
VALUES (2, 2);
INSERT INTO Course_Exam(CourseID, ExamID)
VALUES (3, 3);
INSERT INTO Course_Exam(CourseID, ExamID)
VALUES (4, 4);
INSERT INTO Course_Exam(CourseID, ExamID)
VALUES (5, 5);
INSERT INTO Course_Exam(CourseID, ExamID)
VALUES (6, 6);
INSERT INTO Course_Exam(CourseID, ExamID)
VALUES (7, 7);
INSERT INTO Course_Exam(CourseID, ExamID)
VALUES (8, 8);
INSERT INTO Course_Exam(CourseID, ExamID)
VALUES (9, 9);
INSERT INTO Course_Exam(CourseID, ExamID)
VALUES (10, 10);

-- Insert Records into the Table 'Course_Semester'
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (1, 1);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (1, 2);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (1, 3);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (2, 1);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (2, 2);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (2, 3);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (3, 1);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (3, 2);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (3, 3);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (4, 1);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (4, 2);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (4, 3);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (5, 1);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (5, 2);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (5, 3);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (6, 1);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (6, 2);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (6, 3);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (7, 1);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (7, 2);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (7, 3);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (8, 1);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (8, 2);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (8, 3);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (9, 1);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (9, 2);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (9, 3);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (10, 1);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (10, 2);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (10, 3);

-- Insert Records into the Table 'Course_Student'
INSERT INTO Course_Student(CourseID, StudentID, `Year`, Active)
VALUES (1, 1, 1, 1);
INSERT INTO Course_Student(CourseID, StudentID, `Year`, Active)
VALUES (2, 2, 2, 1);
INSERT INTO Course_Student(CourseID, StudentID, `Year`, Active)
VALUES (3, 3, 3, 1);
INSERT INTO Course_Student(CourseID, StudentID, `Year`, Active)
VALUES (4, 4, 1, 1);
INSERT INTO Course_Student(CourseID, StudentID, `Year`, Active)
VALUES (5, 5, 2, 1);
INSERT INTO Course_Student(CourseID, StudentID, `Year`, Active)
VALUES (6, 6, 3, 0);
INSERT INTO Course_Student(CourseID, StudentID, `Year`, Active)
VALUES (7, 7, 1, 0);
INSERT INTO Course_Student(CourseID, StudentID, `Year`, Active)
VALUES (8, 8, 2, 0);
INSERT INTO Course_Student(CourseID, StudentID, `Year`, Active)
VALUES (9, 9, 3, 0);
INSERT INTO Course_Student(CourseID, StudentID, `Year`, Active)
VALUES (10, 10, 1, 0);

-- Insert Records into the Table 'Department'
INSERT INTO Department(ID, CollegeID, Name)
VALUES (1, 1, "School of Arts and Humanities");
INSERT INTO Department(ID, CollegeID, Name)
VALUES (2, 1, "School of Business");
INSERT INTO Department(ID, CollegeID, Name)
VALUES (3, 1, "School of Computing");
INSERT INTO Department(ID, CollegeID, Name)
VALUES (4, 1, "School of Education");
INSERT INTO Department(ID, CollegeID, Name)
VALUES (5, 1, "School of Engineering");
INSERT INTO Department(ID, CollegeID, Name)
VALUES (6, 1, "School of History");
INSERT INTO Department(ID, CollegeID, Name)
VALUES (7, 1, "School of Languages");
INSERT INTO Department(ID, CollegeID, Name)
VALUES (8, 1, "School of Law");
INSERT INTO Department(ID, CollegeID, Name)
VALUES (9, 1, "School of Medicine");
INSERT INTO Department(ID, CollegeID, Name)
VALUES (10, 1, "School of Music");

-- Insert Records into the Table 'Exam'
INSERT INTO Exam(ID, Name)
VALUES (1, "Arts and Humanities Exam");
INSERT INTO Exam(ID, Name)
VALUES (2, "Business Exam");
INSERT INTO Exam(ID, Name)
VALUES (3, "Computing Exam");
INSERT INTO Exam(ID, Name)
VALUES (4, "Education Exam");
INSERT INTO Exam(ID, Name)
VALUES (5, "Engineering Exam");
INSERT INTO Exam(ID, Name)
VALUES (6, "History Exam");
INSERT INTO Exam(ID, Name)
VALUES (7, "Languages Exam");
INSERT INTO Exam(ID, Name)
VALUES (8, "Law Exam");
INSERT INTO Exam(ID, Name)
VALUES (9, "Medicine Exam");
INSERT INTO Exam(ID, Name)
VALUES (10, "Music Exam");

-- Insert Records into the Table 'Exam_Student'
INSERT INTO Exam_Student(ExamID, StudentID, Grade)
VALUES (1, 1, 60);
INSERT INTO Exam_Student(ExamID, StudentID, Grade)
VALUES (2, 2, 70);
INSERT INTO Exam_Student(ExamID, StudentID, Grade)
VALUES (3, 3, 80);
INSERT INTO Exam_Student(ExamID, StudentID, Grade)
VALUES (4, 4, 60);
INSERT INTO Exam_Student(ExamID, StudentID, Grade)
VALUES (5, 5, 70);
INSERT INTO Exam_Student(ExamID, StudentID, Grade)
VALUES (6, 6, 80);
INSERT INTO Exam_Student(ExamID, StudentID, Grade)
VALUES (7, 7, 60);
INSERT INTO Exam_Student(ExamID, StudentID, Grade)
VALUES (8, 8, 70);
INSERT INTO Exam_Student(ExamID, StudentID, Grade)
VALUES (9, 9, 80);
INSERT INTO Exam_Student(ExamID, StudentID, Grade)
VALUES (10, 10, 60);

-- Insert Records into the Table 'FeeSchedule'
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (1, 1, "2020-08-28", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (2, 1, "2020-12-23", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (3, 1, "2021-04-24", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (4, 2, "2020-08-28", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (5, 2, "2020-12-23", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (6, 2, "2021-04-24", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (7, 3, "2020-08-28", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (8, 3, "2020-12-23", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (9, 3, "2021-04-24", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (10, 4, "2020-08-28", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (11, 4, "2020-12-23", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (12, 4, "2021-04-24", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (13, 5, "2020-08-28", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (14, 5, "2020-12-23", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (15, 5, "2021-04-24", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (16, 6, "2020-08-28", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (17, 6, "2020-12-23", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (18, 6, "2021-04-24", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (19, 7, "2020-08-28", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (20, 7, "2020-12-23", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (21, 7, "2021-04-24", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (22, 8, "2020-08-28", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (23, 8, "2020-12-23", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (24, 8, "2021-04-24", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (25, 9, "2020-08-28", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (26, 9, "2020-12-23", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (27, 9, "2021-04-24", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (28, 10, "2020-08-28", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (29, 10, "2020-12-23", 1000.00);
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (30, 10, "2021-04-24", 1000.00);

-- Insert Records into the Table 'Holiday'
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (1,"2021-06-01", 1);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (2,"2021-06-01", 1);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (2,"2021-06-02", 1);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (3,"2021-06-01", 1);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (3,"2021-06-02", 1);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (3,"2021-06-03", 1);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (4,"2021-06-01", 1);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (5,"2021-06-01", 1);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (5,"2021-06-02", 1);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (6,"2021-06-01", 1);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (6,"2021-06-02", 1);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (6,"2021-06-03", 1);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (7,"2021-06-01", 0.5);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (8,"2021-06-01", 0.5);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (8,"2021-06-02", 0.5);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (9,"2021-06-01", 0.5);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (9,"2021-06-02", 0.5);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (9,"2021-06-03", 0.5);
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (10,"2021-06-01", 0.5);

-- Insert Records into the Table 'Opening'
INSERT INTO Opening(ID, CollegeID, Weekday, OpenTime, CloseTime)
VALUES (1, 1, 1, "07:30:00", "10:30:00");
INSERT INTO Opening(ID, CollegeID, Weekday, OpenTime, CloseTime)
VALUES (2, 1, 2, "07:30:00", "10:30:00");
INSERT INTO Opening(ID, CollegeID, Weekday, OpenTime, CloseTime)
VALUES (3, 1, 3, "07:30:00", "10:30:00");
INSERT INTO Opening(ID, CollegeID, Weekday, OpenTime, CloseTime)
VALUES (4, 1, 4, "07:30:00", "10:30:00");
INSERT INTO Opening(ID, CollegeID, Weekday, OpenTime, CloseTime)
VALUES (5, 1, 5, "07:30:00", "10:30:00");
INSERT INTO Opening(ID, CollegeID, Weekday, OpenTime, CloseTime)
VALUES (6, 1, 6, "07:30:00", "10:30:00");
INSERT INTO Opening(ID, CollegeID, Weekday, OpenTime, CloseTime)
VALUES (7, 1, 7, "00:00:00", "00:00:00");

-- Insert Records into the Table 'Payment'
INSERT INTO Payment(ID, FeeScheduleID, StudentID, `Date`)
VALUES (1, 1, 1, "2020-08-28");
INSERT INTO Payment(ID, FeeScheduleID, StudentID, `Date`)
VALUES (2, 4, 2, "2020-08-28");
INSERT INTO Payment(ID, FeeScheduleID, StudentID, `Date`)
VALUES (3, 7, 3, "2020-08-28");
INSERT INTO Payment(ID, FeeScheduleID, StudentID, `Date`)
VALUES (4, 10, 4, "2020-08-28");
INSERT INTO Payment(ID, FeeScheduleID, StudentID, `Date`)
VALUES (5, 13, 5, "2020-08-28");

-- Insert Records into the Table 'Semester'
INSERT INTO Semester(ID, CollegeID, StartDate, EndDate)
VALUES (1, 1, "2020-09-28", "2020-12-18");
INSERT INTO Semester(ID, CollegeID, StartDate, EndDate)
VALUES (2, 1, "2021-01-23", "2021-04-30");
INSERT INTO Semester(ID, CollegeID, StartDate, EndDate)
VALUES (3, 1, "2021-05-24", "2021-08-14");

-- Insert Records into the Table 'Staff'
INSERT INTO Staff(ID, DepartmentID, FirstName, LastName, Email, Address, Phone, Position, Tenure, HolidayAllowance)
VALUES (1, 1, "Myrilla", "Godmer", "mgodmer0@ncirl.ie", "3573 Ridge Oak Way", "9825052510", "Dean", 3, 25);
INSERT INTO Staff(ID, DepartmentID, FirstName, LastName, Email, Address, Phone, Position, Tenure, HolidayAllowance)
VALUES (2, 2, "Wilhelm", "Feld", "wfeld1@ ncirl.ie", "47 Mosinee Trail", "5819701290", "Lecturer", 3, 25);
INSERT INTO Staff(ID, DepartmentID, FirstName, LastName, Email, Address, Phone, Position, Tenure, HolidayAllowance)
VALUES (3, 3, "Haslett", "Eshmade", "heshmade2@ ncirl.ie", "9 Union Place", "9052995189", "Lecturer", 3, 25);
INSERT INTO Staff(ID, DepartmentID, FirstName, LastName, Email, Address, Phone, Position, Tenure, HolidayAllowance)
VALUES (4, 4, "Jordain", "Irvine", "jirvine3@ ncirl.ie", "5908 Luster Junction", "8822823379", "Lecturer", 2, 25);
INSERT INTO Staff(ID, DepartmentID, FirstName, LastName, Email, Address, Phone, Position, Tenure, HolidayAllowance)
VALUES (5, 5, "Maurits", "Lanktree", "mlanktree4@ ncirl.ie", "9654 4th Place", "8172615793", "Lecturer", 2, 25);
INSERT INTO Staff(ID, DepartmentID, FirstName, LastName, Email, Address, Phone, Position, Tenure, HolidayAllowance)
VALUES (6, 6, "Celinda", "O'Neary", "coneary5@ ncirl.ie", "12 Rowland Crossing", "9338240726", "Lecturer", 2, 25);
INSERT INTO Staff(ID, DepartmentID, FirstName, LastName, Email, Address, Phone, Position, Tenure, HolidayAllowance)
VALUES (7, 7, "Saree", "Roderick", "sroderick6@ ncirl.ie", "27715 Shoshone Plaza", "2843151546", "Office Worker", 1, 25);
INSERT INTO Staff(ID, DepartmentID, FirstName, LastName, Email, Address, Phone, Position, Tenure, HolidayAllowance)
VALUES (8, 8, "Louise", "Bushill", "lbushill7@ncirl.ie", "69343 Arizona Parkway", "4295304144", "Office Worker", 1, 25);
INSERT INTO Staff(ID, DepartmentID, FirstName, LastName, Email, Address, Phone, Position, Tenure, HolidayAllowance)
VALUES (9, 9, "Rex", "Covotti", "rcovotti8@ncirl.ie", "34 Blaine Park", "9774900662", "Office Worker", 1, 25);
INSERT INTO Staff(ID, DepartmentID, FirstName, LastName, Email, Address, Phone, Position, Tenure, HolidayAllowance)
VALUES (10, 10, "Lorene", "Arkill", "larkill9@ncirl.ie", "67513 Roth Trail", "2769961902", "Office Worker", 1, 25);

-- Insert Records into the Table 'Student'
INSERT INTO Student(ID, FirstName, LastName, Email, Address, Phone)
VALUES (1, "Jefferey", "Lorimer", "jlorimer0@gmail.com", "7009 Ramsey Lane", "8274134211");
INSERT INTO Student(ID, FirstName, LastName, Email, Address, Phone)
VALUES (2, "Mace", "Tarzey", "mtarzey1@gmail.com", "8151 Amoth Point", "1631498675");
INSERT INTO Student(ID, FirstName, LastName, Email, Address, Phone)
VALUES (3, "Barnabe", "Llewelly", "bllewelly2@gmail.com", "3870 Schmedeman Circle", "9156799801");
INSERT INTO Student(ID, FirstName, LastName, Email, Address, Phone)
VALUES (4, "Herold", "Beck", "hbeck3@gmail.com", "92789 Schlimgen Avenue", "5616624942");
INSERT INTO Student(ID, FirstName, LastName, Email, Address, Phone)
VALUES (5, "Boniface", "Kemwal", "bkemwal4@gmail.com", "02 Washington Parkway", "7066538107");
INSERT INTO Student(ID, FirstName, LastName, Email, Address, Phone)
VALUES (6, "Ben", "Eller", "beller5@hotmail.com", "2 Bowman Junction", "1817406628");
INSERT INTO Student(ID, FirstName, LastName, Email, Address, Phone)
VALUES (7, "Pearline", "Elfleet", "pelfleet6@hotmail.com", "66 Paget Avenue", "7665356892");
INSERT INTO Student(ID, FirstName, LastName, Email, Address, Phone)
VALUES (8, "Emylee", "Blasl", "eblasl7@hotmail.com", "8 Grasskamp Plaza", "1219231559");
INSERT INTO Student(ID, FirstName, LastName, Email, Address, Phone)
VALUES (9, "Ilyse", "Billyard", "ibillyard8@hotmail.com", "17179 Buhler Trail", "7462276476");
INSERT INTO Student(ID, FirstName, LastName, Email, Address, Phone)
VALUES (10, "Starr", "Harmeston", "sharmeston9@hotmail.com", "3020 Lien Center", "2937797006");

/* Column 'CollegeID' in Table 'Opening' is Foreign Key to Column 'ID' in Table 'College'
* Additional comments provided for this 'ALTER TABLE' statement to demonstrate understanding
*
* ALTER TABLE <table_name> - Alter the table
* ADD_CONSTRAINT <constrain_name> - Add a Constraint to the Table
* FOREIGN KEY <fk_col_name> - The name of the Foreign Key Column
* REFERENCES <table_name(refs_col_name)> - The name of the references Table and Column
* ON DELETE CASCADE - Automatically delete the referencing rows in the child table when the referenced row is deleted in the parent table
*/
ALTER TABLE Opening
ADD CONSTRAINT FK_Opening_College_CollegeID
FOREIGN KEY (CollegeID)
REFERENCES College (ID)
ON DELETE CASCADE;

-- Column 'CollegeID' in Table 'Department' is Foreign Key to Column 'ID' in Table 'College'
ALTER TABLE Department
ADD CONSTRAINT FK_Department_College_CollegeID
FOREIGN KEY (CollegeID)
REFERENCES College (ID)
ON DELETE CASCADE;

-- Column 'CollegeID' in Table 'Semester' is Foreign Key to Column 'ID' in Table 'College'
ALTER TABLE Semester
ADD CONSTRAINT FK_Semester_College_CollegeID
FOREIGN KEY (CollegeID)
REFERENCES College (ID)
ON DELETE CASCADE;

-- Column 'DepartmentID' in Table 'Staff' is Foreign Key to Column 'ID' in Table 'Department'
ALTER TABLE Staff
ADD CONSTRAINT FK_Staff_Department_DepartmentID
FOREIGN KEY (DepartmentID)
REFERENCES Department (ID)
ON DELETE CASCADE;

-- Column 'DepartmentID' in Table 'Course' is Foreign Key to Column 'ID' in Table 'Department'
ALTER TABLE Course
ADD CONSTRAINT FK_Course_Department_DepartmentID
FOREIGN KEY (DepartmentID)
REFERENCES Department (ID)
ON DELETE CASCADE;

-- Column 'CourseID' in Table 'FeeSchedule' is Foreign Key to Column 'ID' in Table 'Course'
ALTER TABLE FeeSchedule
ADD CONSTRAINT FK_FeeSchedule_Course_CourseID
FOREIGN KEY (CourseID)
REFERENCES Course (ID)
ON DELETE CASCADE;

-- Column 'FeeScheduleID' in Table 'Payment' is Foreign Key to Column 'ID' in Table 'FeeSchedule'
ALTER TABLE Payment
ADD CONSTRAINT FK_Payment_FeeSchedule_FeeScheduleID
FOREIGN KEY (FeeScheduleID)
REFERENCES FeeSchedule (ID)
ON DELETE CASCADE;

-- Column 'StudentID' in Table 'Payment' is Foreign Key to Column 'ID' in Table 'Student'
ALTER TABLE Payment
ADD CONSTRAINT FK_Payment_Student_StudentID
FOREIGN KEY (StudentID)
REFERENCES Student (ID)
ON DELETE CASCADE;

-- Column 'SemesterID' in Table 'Course_Semester' is Foreign Key to Column 'ID' in Table 'Semester'
ALTER TABLE Course_Semester
ADD CONSTRAINT FK_Course_Semester_Semester_SemesterID
FOREIGN KEY (SemesterID)
REFERENCES Semester (ID)
ON DELETE CASCADE;

-- Column 'CourseID' in Table 'Course_Semester' is Foreign Key to Column 'ID' in Table 'Course'
ALTER TABLE Course_Semester
ADD CONSTRAINT FK_Course_Semester_Course_CourseID
FOREIGN KEY (CourseID)
REFERENCES Course (ID)
ON DELETE CASCADE;

-- Column 'CourseID' in Table 'Course_Student' is Foreign Key to Column 'ID' in Table 'Course'
ALTER TABLE Course_Student
ADD CONSTRAINT FK_Course_Student_Course_CourseID
FOREIGN KEY (CourseID)
REFERENCES Course (ID)
ON DELETE CASCADE;

-- Column 'StudentID' in Table 'Course_Student' is Foreign Key to Column 'ID' in Table 'Student'
ALTER TABLE Course_Student
ADD CONSTRAINT FK_Course_Student_Student_StudentID
FOREIGN KEY (StudentID)
REFERENCES Student (ID)
ON DELETE CASCADE;

-- Column 'CourseID' in Table 'Course_Exam' is Foreign Key to Column 'ID' in Table 'Course '
ALTER TABLE Course_Exam
ADD CONSTRAINT FK_Course_Exam_Course_CourseID
FOREIGN KEY (CourseID)
REFERENCES Course (ID)
ON DELETE CASCADE;

-- Column 'ExamID' in Table 'Course_Exam' is Foreign Key to Column 'ID' in Table 'Exam'
ALTER TABLE Course_Exam
ADD CONSTRAINT FK_Course_Exam_Exam_ExamID
FOREIGN KEY (ExamID)
REFERENCES Exam (ID)
ON DELETE CASCADE;

-- Column 'ExamID' in Table 'Exam_Student' is Foreign Key to Column 'ID' in Table 'Exam'
ALTER TABLE Exam_Student
ADD CONSTRAINT FK_Exam_Student_Exam_ExamID
FOREIGN KEY (ExamID)
REFERENCES Exam (ID)
ON DELETE CASCADE;

-- Column 'StudentID' in Table 'Exam_Student' is Foreign Key to Column 'ID' in Table 'Student'
ALTER TABLE Exam_Student
ADD CONSTRAINT FK_Exam_Student_Student_StudentID
FOREIGN KEY (StudentID)
REFERENCES Student (ID)
ON DELETE CASCADE;

-- Column 'StaffID' in Table 'Holiday' is Foreign Key to Column 'ID' in Table 'Staff'
ALTER TABLE Holiday
ADD CONSTRAINT FK_Holiday_Staff_StaffID
FOREIGN KEY (StaffID)
REFERENCES Staff (ID)
ON DELETE CASCADE;

-- Column 'DeanID' in Table 'College' is Foreign Key to Column 'ID' in Table 'Staff'
ALTER TABLE College
ADD CONSTRAINT FK_College_Staff_DeanID
FOREIGN KEY (DeanID)
REFERENCES Staff (ID)
ON DELETE CASCADE;

-- Task Three - Query the Dataset --
-----------------------------------------------

/*  Task Three - Question 1 --
* Change all students in year one of any course to year two
* ----------------------------------------------------------------
* Additional comments provided for this 'UPDATE' statement to demonstrate understanding
*
* UPDATE <table_name> - Update the table
* SET <col1 = val1, col2 = val2> - Set the values. Comma-Seperated Column names and Values.
* WHERE <col1 = val1, col2 = val2> - Only where these condition occurs. Comma-Seperated Column names and Values.
*/
UPDATE Course_Student
SET `Year` = 2
WHERE `Year` = 1;

/*  Task Three - Question 2 --
* Modify the status of any student in year 4 of all courses to indicate that they have now completed the course.
* Note: I am using Active=0 (Inactive) and Active=1(Active) as a flag to indicate if a Student is Active on a Course.
* ----------------------------------------------------------------
*/
UPDATE Course_Student
SET Active = 0
WHERE `Year` = 4;

/*  Task Three - Question 3 --
* Delete all students who have outstanding fees which have not been paid for more than 6 months.
* ----------------------------------------------------------------
*/

-- Test Query to test before deleting any records
SELECT *
FROM Student
WHERE
Student.ID NOT IN
(SELECT StudentTemp.ID
FROM (SELECT * FROM Student) AS StudentTemp
JOIN Payment ON StudentTemp.ID = Payment.StudentID
JOIN FeeSchedule ON Payment.FeeScheduleID = FeeSchedule.ID
WHERE FeeSchedule.`Date` < date_sub(now(), INTERVAL 6 MONTH));


-- Final Query to delete the records
DELETE
FROM Student
WHERE
Student.ID NOT IN
(SELECT StudentTemp.ID
FROM (SELECT * FROM Student) AS StudentTemp
JOIN Payment ON StudentTemp.ID = Payment.StudentID
JOIN FeeSchedule ON Payment.FeeScheduleID = FeeSchedule.ID
WHERE FeeSchedule.`Date` < date_sub(now(), INTERVAL 6 MONTH));

/*  Task Three - Question 4 --
* Display the first name surname and grade of all students sorting the results so the highest grades are first.
* ----------------------------------------------------------------
*/
SELECT FirstName, LastName, Grade
FROM Student
JOIN Exam_Student ON Student.ID = Exam_Student.StudentID
ORDER BY Grade DESC;

/*  Task Three - Question 5 --
* Add one new record to each table.
* ----------------------------------------------------------------
*/
-- Insert Record into the Table 'College'
INSERT INTO College(ID, DeanID, Name, Address, Phone)
VALUES (2,6,"Maynooth University","Mariavilla, Maynooth, Co. Kildare","017086000");

-- Insert Record into the Table 'Course'
INSERT INTO Course(ID, DepartmentID, Name, Level, Delivery)
VALUES (11,7,"MSc French",7,"Classroom");

-- Insert Record into the Table 'Exam'
INSERT INTO Exam(ID, Name)
VALUES (11, "French Exam");

-- Insert Record into the Table 'Course_Exam'
INSERT INTO Course_Exam(CourseID, ExamID)
VALUES (11, 11);

-- Insert Record into the Table 'Course_Semester'
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (11, 1);

-- Insert Record into the Table 'Student'
INSERT INTO Student(ID, FirstName, LastName, Email, Address, Phone)
VALUES (11, "Danny", "Way", "dannyway@gmail.com", "16 Old North Road", "8264122211");

-- Insert Record into the Table 'Course_Student'
INSERT INTO Course_Student(CourseID, StudentID, `Year`, Active)
VALUES (11, 11, 1, 1);

-- Insert Record into the Table 'Department'
INSERT INTO Department(ID, CollegeID, Name)
VALUES (11, 2, "School of French");

-- Insert Record into the Table 'Exam_Student'
INSERT INTO Exam_Student(ExamID, StudentID, Grade)
VALUES (11, 11, 60);

-- Insert Record into the Table 'FeeSchedule'
INSERT INTO FeeSchedule(ID, CourseID, `Date`, Amount)
VALUES (31, 1, "2020-08-28", 1000.00);

-- Insert Record into the Table 'Staff'
INSERT INTO Staff(ID, DepartmentID, FirstName, LastName, Email, Address, Phone, Position, Tenure, HolidayAllowance)
VALUES (11, 11, "Tony", "Hawk", "tonyhawk@ncirl.ie", "3 Green Street", "9815022210", "Lecturer", 3, 25);

-- Insert Record into the Table 'Holiday'
INSERT INTO Holiday(StaffID, `Date`, Days)
VALUES (11,"2021-06-01", 1);

-- Insert Record into the Table 'Opening'
INSERT INTO Opening(ID, CollegeID, Weekday, OpenTime, CloseTime)
VALUES (8, 2, 2, "07:30:00", "10:30:00");

-- Insert Record into the Table 'Payment'
INSERT INTO Payment(ID, FeeScheduleID, StudentID, `Date`)
VALUES (6, 31, 11, "2020-08-28");

-- Insert Record into the Table 'Semester'
INSERT INTO Semester(ID, CollegeID, StartDate, EndDate)
VALUES (4, 2, "2020-09-28", "2020-12-18");

/*  Task Three - Question 6 --
* Delete one record from all tables.
* ----------------------------------------------------------------
*/
-- Delete Record from the Table 'College'
DELETE FROM College
ORDER BY ID DESC LIMIT 1;

-- Delete Record from the Table 'Course'
DELETE FROM Course
ORDER BY ID DESC LIMIT 1;

-- Delete Record from the Table 'Exam'
DELETE FROM Exam
ORDER BY ID DESC LIMIT 1;

-- Delete Record from the Table 'Course_Exam'
DELETE FROM Course_Exam
ORDER BY CourseID DESC LIMIT 1;

-- Delete Record from the Table 'Course_Semester'
DELETE FROM Course_Semester
ORDER BY CourseID DESC LIMIT 1;

-- Delete Record from the Table 'Student'
DELETE FROM Student
ORDER BY ID DESC LIMIT 1;

-- Delete Record from the Table 'Course_Student'
DELETE FROM Course_Student
ORDER BY CourseID DESC LIMIT 1;

-- Delete Record from the Table 'Department'
DELETE FROM Department
ORDER BY ID DESC LIMIT 1;

-- Delete Record from the Table 'Exam_Student'
DELETE FROM Exam_Student
ORDER BY ExamID DESC LIMIT 1;

-- Delete Record from the Table 'FeeSchedule'
DELETE FROM FeeSchedule
ORDER BY ID DESC LIMIT 1;

-- Delete Record from the Table 'Staff'
DELETE FROM Staff
ORDER BY ID DESC LIMIT 1;

-- Delete Record from the Table 'Holiday'
DELETE FROM Holiday
ORDER BY StaffID DESC LIMIT 1;

-- Delete Record from the Table 'Opening'
DELETE FROM Opening
ORDER BY ID DESC LIMIT 1;

-- Delete Record from the Table 'Payment'
DELETE FROM Payment
ORDER BY ID DESC LIMIT 1;

-- Delete Record from the Table 'Semester'
DELETE FROM Semester
ORDER BY ID DESC LIMIT 1;

/*  Task Three - Question 7 --
* Find the total number of days off for all staff, order this by least days off.
* ----------------------------------------------------------------
*/
SELECT FirstName, LastName, SUM(Days) AS 'Days Off'
FROM Staff
JOIN Holiday ON Staff.ID = Holiday.StaffID
GROUP BY Staff.ID ORDER BY SUM(Days) ASC;

/*  Task Three - Question 8 --
* Count how many students are doing a business course.
* ----------------------------------------------------------------
*/
SELECT COUNT(Student.ID) as 'Business Student Count'
FROM Student
JOIN Course_Student ON Student.ID = Course_Student.StudentID
JOIN Course ON Course_Student.CourseID = Course.ID
WHERE Course.Name LIKE '%business%';

/*  Task Three - Question 9 --
* Change the roll of all staff who have a job title Office Worker to Administrator.
* ----------------------------------------------------------------
*/
UPDATE Staff
SET Position = "Administrator"
WHERE Position = "Office Worker";

/*  Task Three - Question 10 --
* Change all courses entitled PHD to Doctorial.
* ----------------------------------------------------------------
*/
UPDATE Course
SET Name = REPLACE(Name, 'PHD', 'Doctorial')
WHERE Name LIKE '%PHD%';

/*  Task Three  - Question 11 --
* Set the delivery method of all courses to online.
* ----------------------------------------------------------------
*/
UPDATE Course
SET Delivery = 'Online';

/*  Task Three  - Question 12 --
* Update the opening times of the college to say closed to visitors.
* Note: I am using OpenTime = "00:00:00" AND CloseTime = "00:00:00", as a flag to indicate that the college is closed to visitors.
* ----------------------------------------------------------------
*/
UPDATE Opening
SET OpenTime = "00:00:00", CloseTime = "00:00:00";

/*  Task Three  - Question 13 --
* See End of this File.
* Note: I ran this Query AFTER question 20, in order to preserve data for the other questions.
*/

/*  Task Three  - Question 14 --
* Delete all courses from the database with ab academic level of 6 or less.
* ----------------------------------------------------------------
*/
DELETE FROM Course
WHERE Level <= 6;

/*  Task Three  - Question 15 --
* Set the college phone number to be 01-7654321.
* ----------------------------------------------------------------
*/
UPDATE College
SET Phone = "01-7654321"
WHERE Name = "National College of Ireland";

/*  Task Three  - Question 16 --
* Set the dean of the college to be called Michael Dean.
* ----------------------------------------------------------------
*/
-- Create A Staff Member Called Michael Dean
INSERT INTO Staff(ID, DepartmentID, FirstName, LastName, Email, Address, Phone, Position, Tenure, HolidayAllowance)
VALUES (9, 9, "Michael", "Dean", "michaeldean@ncirl.ie", "86 Bishops Road", "8811012211", "Dean", 0, 25);

-- Set the Dean of the College to be Michael Dean
UPDATE College
SET DeanID = 9
WHERE Name = "National College of Ireland";

-- Delete the Old College Dean from the Staff Table
DELETE FROM Staff
WHERE FirstName = "Myrilla" AND LastName = "Godmer";

/*  Task Three  - Question 17 --
* Show all staff members who have been working there for longer than 4 years.
* Note: Additional command to increase the Tenure of all Staff Members by 2, as I no longer have any Staff Members with Tenure > 4
* ----------------------------------------------------------------
*/
-- Increase the Tenure of all Staff Members by 2
UPDATE Staff
SET Tenure=Tenure+2;

-- Show Staff with Tenure > 4
SELECT FirstName, LastName, Tenure
FROM Staff
WHERE Tenure > 4;

/*  Task Three  - Question 18 --
* Show all courses that the college offers which run over 3 semesters and have a minimum of 20 participants per class.
* Note: Additional command to set courses to run over 3 semesters, as I no longer have any.
* ----------------------------------------------------------------
*/
-- Insert Records into the Table 'Semester'
INSERT INTO Semester(ID, CollegeID, StartDate, EndDate)
VALUES (3, 1, "2021-05-24", "2021-08-14");

-- Insert Records into the Table 'Course_Semester'
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (2, 3);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (3, 3);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (4, 3);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (5, 3);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (6, 3);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (7, 3);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (8, 3);
INSERT INTO Course_Semester(CourseID, SemesterID)
VALUES (9, 3);


-- Show Courses which run over 3 semesters
SELECT *
FROM Course
WHERE
Course.ID IN
(SELECT CourseID
FROM Course_Semester
GROUP BY CourseID HAVING COUNT(SemesterID) = 3);

/*  Task Three  - Question 19 --
* Identify how many students have the word road in their address.
* Note: Additional command to add Students with the word road in their address, as I no longer have any.
* ----------------------------------------------------------------
*/
-- Insert Records into the Table 'Student'
INSERT INTO Student(ID, FirstName, LastName, Email, Address, Phone)
VALUES (6, "Ben", "Eller", "beller5@hotmail.com", "2 Bowman Road", "1817406628");
INSERT INTO Student(ID, FirstName, LastName, Email, Address, Phone)
VALUES (7, "Pearline", "Elfleet", "pelfleet6@hotmail.com", "66 Paget Road", "7665356892");
INSERT INTO Student(ID, FirstName, LastName, Email, Address, Phone)
VALUES (8, "Emylee", "Blasl", "eblasl7@hotmail.com", "8 Grasskamp Road", "1219231559");
INSERT INTO Student(ID, FirstName, LastName, Email, Address, Phone)
VALUES (9, "Ilyse", "Billyard", "ibillyard8@hotmail.com", "17179 Buhler Road", "7462276476");
INSERT INTO Student(ID, FirstName, LastName, Email, Address, Phone)
VALUES (10, "Starr", "Harmeston", "sharmeston9@hotmail.com", "3020 Lien Road", "2937797006");

-- Identify how many students have the word road in their address.
SELECT COUNT(ID) AS 'Students with Road' 
FROM Student
WHERE Address LIKE "%road%";

/*  Task Three  - Question 20 --
* Create a view that will show the result of a query drawing information from three tables at once.
* ----------------------------------------------------------------
*/
-- Create the View
CREATE VIEW StudentPayments
AS 
SELECT Firstname, LastName, Amount AS "Fee Amount", FeeSchedule.Date AS "Fee Due Date", Payment.Date AS "Payment Date"
FROM Student
JOIN Payment ON Student.ID = Payment.StudentID
JOIN FeeSchedule ON Payment.FeeScheduleID = FeeSchedule.ID;

-- Query the View
SELECT *
FROM StudentPayments;

/*  Task Three  - Question 13 --
* Drop all information contained in the courses relation.
* ----------------------------------------------------------------
*/
-- Show all Tables
SHOW TABLES;

-- Turn Off Foreign Key Checks
SET FOREIGN_KEY_CHECKS=0;
-- Drop the Table
DROP TABLE IF EXISTS Course;
-- Turn On Foreign Key Checks
SET FOREIGN_KEY_CHECKS=1;

-- Show all Tables
SHOW TABLES;