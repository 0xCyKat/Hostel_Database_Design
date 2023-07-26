### STUDENT table

**Functional Dependencies:** 
- student_ID→ name, year_of_study, contact, contact, room_no, address, hostel_ID 
- room_no → hostel_ID

**Closure of student_ID:** 
- (student_ID)+ = {student_ID, name, year_of_study, contact, contact, room_no, address, hostel_ID} 

**Closure of room_no:** s
- (room_no) + = {room_no, hostel_ID} 

**Candidate Keys:** student_ID 
**Primary Key:** student_ID 
 
- The given relation is not in BCNF because the LHS of the functional dependency 
	- room_no → hostel_ID 
	- i.e., room_no, is not a super key. 
- The given relation is not in 3NF because a transitive functional dependency exists. In the functional dependency room_no → hostel_ID, both the LHS and RHS are non - prime attributes and therefore the relation is not in 3NF. 
- The given relation is in 2NF because there are no partial dependencies, i.e. the proper subset of any candidate key doesn't determine a non prime attribute. To convert the given relation to a higher normal form, we decompose it into the following relations STUDENT and ACCOMMODATION.

```SQL
 CREATE TABLE student(
	student_ID INT PRIMARY KEY, 
    student_name VARCHAR(50) NOT NULL, 
    contact VARCHAR(50) NOT NULL, 
    address VARCHAR(100) NOT NULL, 
    email VARCHAR(50) NOT NULL, 
	year_of_study INT NOT NULL, 
    room_no INT, 
    
    FOREIGN KEY (room_no) REFERENCES room(room_no)
 );  
```

```SQL
CREATE TABLE accomodation(
	room_no INT PRIMARY KEY, 
    hostel_ID INT, 
    
	FOREIGN KEY (room_no) REFERENCES room(room_no), 
    FOREIGN KEY (hostel_ID) REFERENCES hostel(hostel_ID)
  ); 
```
---
### PAYMENTS table 

**Functional Dependencies:** 
- transaction_ID → mode_of_payment, hostel_ID, student_ID 
- student_ID → hostel_ID 

**Closure of transaction_ID:** 
- (transaction_ID)+ = {transaction_ID, mode_of_payment, hostel_ID, student_ID} 

**Closure of student_ID:** 
- (student_ID)+ = {student_ID, hostel_ID} 

**Candidate Keys:** transaction_ID 
**Primary Key:** transaction_ID 

- The given relation is not in BCNF because the LHS of the functional dependency 
	- student_ID → hostel_ID 
	- i.e., student_ID, is not a super key. 
- The given relation is not in 3NF because a transitive functional dependency exists. In the functional dependency student_ID → hostel_ID, both the LHS and RHS are non - prime attributes and therefore the relation is not in 3NF. 
- The given relation is in 2NF because there are no partial dependencies, i.e. the proper subset of any candidate key doesn't determine a non prime attribute. To convert the given relation to a higher normal form, we decompose it into the following relations PAYMENT and RESIDENCE.

```SQL
CREATE TABLE payments(
	transaction_ID INT PRIMARY KEY, 
    mode_of_payment VARCHAR(20), 
    student_ID INT, 
    
    FOREIGN KEY (student_ID) REFERENCES student(student_ID)
 );```

```SQL
CREATE TABLE residence(
	student_ID INT PRIMARY KEY, 
    hostel_ID INT, 
    
    FOREIGN KEY (student_ID) REFERENCES student(student_ID), 
    FOREIGN KEY (hostel_ID) REFERENCES hostel(hostel_ID)
  );
```
