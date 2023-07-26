CREATE DATABASE hostelDB;
USE hostelDB;

-- creation of MESS table 

CREATE TABLE mess(
	mess_no INT PRIMARY KEY, 
    mess_name VARCHAR(50) NOT NULL, 
    fee INT NOT NULL, 
    breakfast VARCHAR(10) NOT NULL, 
    lunch VARCHAR(10) NOT NULL, 
    dinner VARCHAR(10) NOT NULL 
); 

-- creation of HOSTEL table 

CREATE TABLE hostel(
	hostel_ID INT PRIMARY KEY, 
    hostel_name VARCHAR(50) NOT NULL, 
    floors INT NOT NULL, 
    no_of_rooms INT NOT NULL, 
    mess_no INT,
    
    FOREIGN KEY (mess_no) REFERENCES mess(mess_no)
); 

-- creation of ROOM table 

CREATE TABLE room(
	room_no INT PRIMARY KEY, 
    occupancy INT NOT NULL, 
    availability VARCHAR(10) NOT NULL, 
	hostel_id INT, 
    
    FOREIGN KEY (hostel_ID) REFERENCES hostel(hostel_ID)
);

-- creation of ADMINS table 

CREATE TABLE admins(
	faculty_ID INT PRIMARY KEY, 
    faculty_name VARCHAR(50) NOT NULL, 
	contact INT NOT NULL, 
    hostel_ID INT, 
	
    FOREIGN KEY (hostel_ID) REFERENCES hostel(hostel_ID)
);

-- creation of ENQUIRY table 

CREATE TABLE enquiry(
	complaint_no INT PRIMARY KEY, 
    lodged_date DATE NOT NULL,
    complaint_status VARCHAR(50) NOT NULL, 
    hostel_ID INT, 
    faculty_ID INT, 
    
    FOREIGN KEY (hostel_ID) REFERENCES hostel(hostel_ID), 
    FOREIGN KEY (faculty_ID) REFERENCES admins(faculty_ID)
);

-- creation of STUDENT table 

 CREATE TABLE student(
	student_ID INT PRIMARY KEY, 
    student_name VARCHAR(50) NOT NULL, 
    contact VARCHAR(50) NOT NULL, 
    address VARCHAR(100) NOT NULL, 
    email VARCHAR(50) NOT NULL, 
	year_of_study INT NOT NULL, 
    hostel_ID INT, 
    room_no INT, 
    
    FOREIGN KEY (hostel_ID) REFERENCES hostel(hostel_ID), 
    FOREIGN KEY (room_no) REFERENCES room(room_no)
 );  
 
 -- creation of PAYMENT table 
 
 CREATE TABLE payments(
	transaction_ID INT PRIMARY KEY, 
    mode_of_payment VARCHAR(20), 
    hostel_ID INT, 
    student_ID INT, 
    
    FOREIGN KEY (hostel_ID) REFERENCES hostel(hostel_ID), 
    FOREIGN KEY (student_ID) REFERENCES student(student_ID)
 );
  
  -- creation of VISITORS table  
  
  CREATE TABLE visitors(
	visitor_ID INT PRIMARY KEY, 
    visitor_name VARCHAR(50) NOT NULL, 
    time_in VARCHAR(10) NOT NULL, 
    time_out VARCHAR(10) NOT NULL, 
    student_ID INT, 
    
	FOREIGN KEY (student_ID) REFERENCES student(student_ID)
  );  
  
  -- creation of STUDENT LOG table 
  
  CREATE TABLE student_log(
	purpose VARCHAR(100) NOT NULL, 
    place VARCHAR(50) NOT NULL, 
    departure_date DATE NOT NULL, 
    arrival_date DATE NOT NULL, 
    student_ID INT PRIMARY KEY, 
    
    FOREIGN KEY (student_ID) REFERENCES student(student_ID)
  );
  
  