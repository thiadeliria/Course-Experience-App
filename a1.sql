DROP SCHEMA IF EXISTS cea CASCADE;
CREATE SCHEMA cea;
SET SEARCH_PATH TO cea;


/* ---------Delete the tables if they already exist-------- */
drop table if exists Course;
drop table if exists Topic;
drop table if exists Skill;
drop table if exists Prerequisite;
drop table if exists Exclusion;
drop table if exists Student;
drop table if exists Job;
drop table if exists Company;
drop table if exists Job_skill;
drop table if exists Edition;
drop table if exists Instructor;
drop table if exists Faculty;
drop table if exists Research;
drop table if exists Edition_to_Instructor;
drop table if exists Edition_to_Student;
drop table if exists Experience;
drop table if exists Course_skill;
drop table if exists Interest_in_course;


/* --------------------ENUM and DOMAIN--------------------- */
CREATE TYPE enum_time_of_day AS ENUM ('morning', 'day', 'evening');

CREATE TYPE enum_gender AS ENUM ('M', 'F', 'O');

CREATE DOMAIN dom_ranking AS int
    CONSTRAINT valid_ranking CHECK(VALUE BETWEEN 1 AND 5);

CREATE DOMAIN dom_course_no AS int
    CONSTRAINT valid_course_no CHECK(VALUE BETWEEN 100 and 9999);

CREATE DOMAIN dom_dept_code AS varchar
    CONSTRAINT valid_dept_code CHECK (VALUE LIKE '[[:alpha:]]' AND VALUE = UPPER(dept_code));


/* ----------------------CREATE TABLE----------------------- */
CREATE TABLE Course (
	course_no dom_course_no,
	dept_name varchar(40) NOT NULL,
	dept_code dom_dept_code,
	general_area varchar(30) NOT NULL,
	PRIMARY KEY (course_no, dept_code)
);

CREATE TABLE Topic (
	course_no dom_course_no,
	dept_code dom_dept_code,
	title varchar(30) NOT NULL,
	FOREIGN KEY(course_no, dept_code) REFERENCES Courses(course_no, dept_code),
	PRIMARY KEY (course_no, dept_code, title)
);

CREATE TABLE Skill (
	course_no dom_course_no,
	dept_code dom_dept_code,
	title varchar(30) NOT NULL,
	FOREIGN KEY (course_no, dept_code) REFERENCES Courses(course_no, dept_code),
	PRIMARY KEY (course_no, dept_code, title)
);

CREATE TABLE Prerequisite (
	course_no dom_course_no,
	dept_code dom_dept_code,
	course_id varchar(7),
	FOREIGN KEY(course_no, dept_code) REFERENCES Courses(course_no, dept_code)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY (course_no, dept_code, course_id)
);

CREATE TABLE Exclusion (
	course_no dom_course_no,
	dept_code dom_dept_code,
	course_id varchar(7)
	FOREIGN KEY(course_no, dept_code) REFERENCES Courses(course_no, dept_code)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY (course_no, dept_code, course_id)
);


CREATE TABLE Student (
	username  varchar(20) PRIMARY KEY,
	date_of_birth date
		CHECK (date_of_birth > 19000101 AND date_of_birth < 20160623),
	gender enum_gender,
	country_of_birth varchar(20) NOT NULL,
	date_enrolled date
		CHECK (date_enrolled > 19000101 AND date_enrolled < 20160623),
	CHECK (date_of_birth < date_enrolled)
);

CREATE TABLE Job (
	student_name varchar(20),
	title varchar(20),
	company_name varchar(20),
	start_date date
		CHECK (start_date > 19000101 AND start_date < 20160623),
	end_date date
		CHECK (end_date > 19000101 AND end_date < 20200101),
	PRIMARY KEY (title, company_name),
	FOREIGN KEY(student_name) REFERENCES Student(username)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CHECK (start_date < end_date)
);

CREATE TABLE Company (
	company_name varchar(20),
	expertise_name varchar(20),
	PRIMARY KEY(company_name, expertise_name),
	FOREIGN KEY(company_name) REFERENCES Job(company_name)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE Job_skill (
	company_name varchar(20),
	title varchar(20),
	skill varchar(20) NOT NULL,
	level_of_expertise int
	    CONSTRAINT check_level CHECK(level_of_expertise BETWEEN 2 AND 5),
	FOREIGN KEY(company_name) REFERENCES Job(company_name)
	    ON DELETE CASCADE
	    ON UPDATE CASCADE,
	FOREIGN KEY(title) REFERENCES Job(title)
	    ON DELETE CASCADE
	    ON UPDATE CASCADE,
	PRIMARY KEY(company_name, title, skill)
);

CREATE TABLE Edition (
	edition_id int PRIMARY KEY,
	course_code int
	    CONSTRAINT 3_or_4_digit_course CHECK (course_code BETWEEN 100 AND 9999),
	dept_code dom_dept_code,
	start_date date
		CHECK (start_date > 19000101 AND start_date < 20160623),
	end_date date
		CHECK (end_date > 19000101 AND end_date < 20170701),
	course_time enum_time_of_day NOT NULL,
	number_of_students int
	    CONSTRAINT positive_enrollment CHECK (number_of_students >= 0),
	FOREIGN KEY(course_code, dept_code) REFERENCES Courses(course_code, dept_code)
	    ON UPDATE CASCADE,
	CHECK (start_date < end_date)
);

CREATE TABLE Edition_to_Student (
	edition_id int,
	student_name varchar(20),
	FOREIGN KEY(edition_id) REFERENCES Edition(edition_id),
	FOREIGN KEY(student_name) REFERENCES Student (username),
	PRIMARY KEY(edition_id, student_name)
);

CREATE TABLE Instructor (
	name varchar(30),
	age int
	    CONSTRAINT positive_age CHECK (age > 0),
	gender enum_gender,
	areas_of_expertise varchar(30),
	faculty_or_freelancer varchar(2)
	    CHECK (faculty_or_freelancer = 'FA' OR faculty_or_freelancer = 'FR'),
	teaching_or_research  varchar(1)
		CHECK (teaching_or_research = 'T' OR teaching_or_research = 'R'),
	research_interests varchar(50),
	yr_employed int
        CONSTRAINT valid_yr_employed CHECK (yr_employed > 1900),
    teaching_or_research varchar(1),
    research_interests varchar(50)
	PRIMARY KEY(name, age)
);

/*INHERITS generates error.*/
/*
CREATE TABLE Faculty (
    yr_employed int
        CONSTRAINT valid_yr_employed CHECK (yr_employed > 1900),
    teaching_or_research varchar(1) NOT NULL
) INHERITS (Instructor);

CREATE TABLE Research (
    research_interests varchar(50)
) INHERITS (Faculty);
*/

CREATE TABLE Edition_to_Instructor (
	edition_id int,
	instructor_name varchar(20),
	age int,
	FOREIGN KEY(edition_id) REFERENCES Edition(edition_id),
	FOREIGN KEY(instructor_name, age) REFERENCES Instructor (name, age),
	PRIMARY KEY(edition_id, instructor_name, age)
);

CREATE TABLE Experience (
	student_name varchar(20),
	edition_id int,
	grade int NOT NULL
	    CONSTRAINT positive_grade CHECK (grade > 0 and grade <= 100),
	satisfaction ranking,
	instructor_ranking ranking,
	skills varchar(20),
	FOREIGN KEY(student_name) REFERENCES Student(username)
	    ON UPDATE CASCADE,
        FOREIGN KEY(edition_id) REFERENCES Edition(edition_id)
        ON UPDATE CASCADE,
	PRIMARY KEY (student_name, edition_id)
);

CREATE TABLE Course_skill (
	skill_name varchar(20),
	edition_id int,
	level_before ranking,
	level_after ranking,
    FOREIGN KEY(edition_id) REFERENCES Edition(edition_id)
        ON UPDATE CASCADE,
    PRIMARY KEY(skill_name, edition_id)
);

CREATE TABLE Interest_in_course (
	student_name varchar(20),
	edition_id int,
	interest_before ranking,
	interest_after ranking,
	interest_overall ranking,
	FOREIGN KEY(student_name) REFERENCES Student(username)
	    ON UPDATE CASCADE,
    FOREIGN KEY(edition_id) REFERENCES Edition(edition_id)
        ON UPDATE CASCADE,
    PRIMARY KEY(student_name, edition_id, interest_overall)
);

