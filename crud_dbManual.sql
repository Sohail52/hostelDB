-- Create Blocks table
CREATE TABLE Blocks(
    block_id varchar(15) PRIMARY KEY,
    block_name char(25),
    gender char(1),
    locate varchar(50),
    description char(50),
    status char(50)
);

-- Create Course table
CREATE TABLE Course(
    course_id varchar(15) PRIMARY KEY,
    course_name char(30) NOT NULL,
    year_no int
);

-- Create Room table
CREATE TABLE Room(
    room_no varchar(10),
    beds_no int,
    status char(50),
    block_id varchar(15),
    PRIMARY KEY(room_no, block_id),
    FOREIGN KEY(block_id) REFERENCES Blocks(block_id)
);

-- Create Student table
CREATE TABLE Student(
    reg_no varchar(20) PRIMARY KEY,
    room_no varchar(10) NOT NULL,
    block_id varchar(15) NOT NULL,
    stud_name char(40) NOT NULL,
    gender char(1) NOT NULL,
    dob date,
    blood_group char(3),
    email_id varchar(40),
    address varchar(75),
    father_name char(40),
    mother_name char(40),
    parent_email varchar(40),
    course_id varchar(15),
    FOREIGN KEY(room_no, block_id) REFERENCES Room(room_no, block_id),
    FOREIGN KEY(course_id) REFERENCES Course(course_id)
);

-- Create Student_Ph table
CREATE TABLE Student_Ph(
    ph_no varchar(10),
    reg_no varchar(20),
    PRIMARY KEY(ph_no, reg_no),
    FOREIGN KEY(reg_no) REFERENCES Student(reg_no)
);

-- Create Parent_Ph table
CREATE TABLE Parent_Ph(
    parent_ph varchar(10),
    reg_no varchar(20),
    PRIMARY KEY(parent_ph, reg_no),
    FOREIGN KEY(reg_no) REFERENCES Student(reg_no)
);

-- Create Staff table
CREATE TABLE Staff(
    staff_id varchar(20) PRIMARY KEY,
    staff_name char(40) NOT NULL,
    gender char(1) NOT NULL,
    dob date,
    email_id varchar(40),
    staff_role char(20),
    salary int
);

-- Create Staff_Ph table
CREATE TABLE Staff_Ph(
    ph_no varchar(10),
    staff_id varchar(20),
    PRIMARY KEY(ph_no, staff_id),
    FOREIGN KEY(staff_id) REFERENCES Staff(staff_id)
);

-- Create Staff_Block table
CREATE TABLE Staff_Block(
    staff_id varchar(20),
    block_id varchar(15),
    PRIMARY KEY(staff_id, block_id),
    FOREIGN KEY(staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY(block_id) REFERENCES Blocks(block_id)
);

-- Create LocalGuardian table
CREATE TABLE LocalGuardian(
    guardian_name char(30),
    reg_no varchar(20),
    gender char(1),
    relation char(20),
    email_id varchar(40),
    address varchar(75),
    PRIMARY KEY(guardian_name, reg_no),
    FOREIGN KEY(reg_no) REFERENCES Student(reg_no)
);

-- Create LocalGuardian_Ph table
CREATE TABLE LocalGuardian_Ph(
    ph_no varchar(10),
    guardian_name char(30),
    reg_no varchar(20),
    PRIMARY KEY(ph_no, guardian_name, reg_no),
    FOREIGN KEY(guardian_name, reg_no) REFERENCES LocalGuardian(guardian_name, reg_no)
);

-- Create Complaint table
CREATE TABLE Complaint(
    complaint_id varchar(15) PRIMARY KEY,
    complaint_date timestamp NOT NULL,
    resolved_date date,
    particulars char(50),
    status char(50),
    staff_id varchar(20),
    FOREIGN KEY(staff_id) REFERENCES Staff(staff_id)
);

-- Create Student_Complaint table
CREATE TABLE Student_Complaint(
    complaint_id varchar(15),
    reg_no varchar(20),
    PRIMARY KEY(complaint_id, reg_no),
    FOREIGN KEY(complaint_id) REFERENCES Complaint(complaint_id),
    FOREIGN KEY(reg_no) REFERENCES Student(reg_no)
);

-- Create Outing table
CREATE TABLE Outing(
    gatepass_id varchar(15) PRIMARY KEY,
    outing_type char(15) NOT NULL,
    purpose char(30) NOT NULL,
    Out_date_time timestamp NOT NULL,
    expectedin_date_time timestamp default CURRENT_TIMESTAMP NOT NULL,
    actualin_date_time timestamp default CURRENT_TIMESTAMP NOT NULL,
    reg_no varchar(20),
    staff_id varchar(20),
    FOREIGN KEY(reg_no) REFERENCES Student(reg_no),
    FOREIGN KEY(staff_id) REFERENCES Staff(staff_id)
);
