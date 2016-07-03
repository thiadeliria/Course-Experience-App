/* Delete the tables if they already exist */
drop table if exists Course;
drop table if exists Topic;
drop table if exists Skill;
drop table if exists Prerequisite;
drop table if exists Exclusion;
drop table if exists Student;
drop table if exists Job;
drop table if exists Company;
drop table if exists Student_skill;
drop table if exists Edition;
drop table if exists Instructor;
drop table if exists Faculty;
drop table if exists Research;
drop table if exists Edition_to_Instructor;
drop table if exists Experience;
drop table if exists Course_skill;
drop table if exists Interest_in_course;

create table Course (
	course_no int CHECK(course_code BETWEEN 100 AND 9999), 
	dept_name varchar(40) NOT NULL, 
	dept_code varchar(3) alphabet_only CHECK (dept_code ~ '[[:alpha:]]'),
	general_area varchar(30) NOT NULL,
	PRIMARY KEY (course_no, dept_code)
);

create table Topic (
	course_no int CHECK (course_no BETWEEN 100 AND 9999), 
	dept_code varchar(3) CHECK (dept_code ~ '[[:alpha:]]'), 
	title varchar(30) NOT NULL,
	FOREIGN KEY(course_no, dept_code) REFERENCES Courses(course_no, dept_code),
	PRIMARY KEY (course_no, dept_code, title)

);

create table Skill (
	course_no int
		CHECK (course_no BETWEEN 100 AND 9999),
	dept_code varchar(3)
	    CHECK (dept_code ~ '[[:alpha:]]'),
	title varchar(30) NOT NULL,
	FOREIGN KEY (course_no, dept_code) REFERENCES Courses(course_no, dept_code),
	PRIMARY KEY (course_no, dept_code, title)
);

create table Prerequisite (
	course_no int
		CHECK (course_no BETWEEN 100 AND 9999),
	dept_code varchar(3)
	    CONSTRAINT alphabet_only CHECK (dept_code ~ '[[:alpha:]]'),
	course_id varchar(7),
	FOREIGN KEY(course_no, dept_code) REFERENCES Courses(course_no, dept_code)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY (course_no, dept_code, course_id)
);

create table Exclusion (
	course_no int
		CHECK (course_no BETWEEN 100 AND 9999),
	dept_code varchar(3)
	    CONSTRAINT alphabet_only CHECK (dept_code ~ '[[:alpha:]]'),
	course_id varchar(7)
	FOREIGN KEY(course_no, dept_code) REFERENCES Courses(course_no, dept_code)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY (course_no, dept_code, course_id)
);

/*CONSTRAINT PENDING*/
create table Student (
	username  varchar(20) PRIMARY KEY,
	date_of_birth text NOT NULL,
	gender varchar(1)
		CHECK (gender = 'F' OR gender = 'M'),
	country_of_birth varchar(20) NOT NULL,
	date_enrolled text NOT NULL,
	/*CHECK (date_of_birth < date_enrolled)*/
);

/*CONSTRAINT PENDING*/
create table Job (
	student_name varchar(20),
	title varchar(20),
	company_name varchar(20),
	start_date text NOT NULL,
	end_date text NOT NULL,
	PRIMARY KEY (title, company_name),
	FOREIGN KEY(student_name) REFERENCES Student(username)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	/*CHECK (start_date < end_date)*/
);

create table Company (
	company_name varchar(20), 
	expertise_name varchar(20),
	PRIMARY KEY(company_name, expertise_name),
	FOREIGN KEY(company_name) REFERENCES Job(company_name)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

create table Student_skill (
	company_name varchar(20), 
	student_name varchar(20),
	skill varchar(20) NOT NULL, 
	level_of_expertise int CHECK(level_of_expertise BETWEEN 2 AND 5),
	FOREIGN KEY(company_name) REFERENCES Job(company_name)
	    ON DELETE CASCADE
	    ON UPDATE CASCADE,
	FOREIGN KEY(title) REFERENCES Job(title)
	    ON DELETE CASCADE
	    ON UPDATE CASCADE,
	PRIMARY KEY(company_name, title, skill)
);

/*CONSTRAINT PENDING*/
create table Edition (
	edition_id int PRIMARY KEY, 
	course_code int CHECK (course_code BETWEEN 100 AND 9999), 
	dept_code varchar(3) CHECK(dept_code = UPPER(dept_code)), 
	start_date text NOT NULL,
	end_date text NOT NULL,
	course_time text CHECK(course_time='morning' or
		course_time='day' or course_time='evening'), 
	number_of_students int CHECK (number_of_students >= 0),
	FOREIGN KEY(course_code, dept_code) REFERENCES Courses(course_code, dept_code)
	    ON UPDATE CASCADE,
	/*CHECK (start_date < end_date)*/
);

create table Edition_to_Student (
	edition_id int,
	student_name varchar(20),
	FOREIGN KEY(edition_id) REFERENCE Edition(edition_id),
	FOREIGN KEY(student_name) REFERENCE Student (username),
	PRIMARY KEY(edition_id, student_name)
);

create table Instructor (
	name varchar(30), 
	age int CHECK (age > 0),
	gender varchar(1) CHECK (gender = 'F' OR gender = 'M'),
	areas_of_expertise varchar(30), 
	faculty_or_freelancer varchar(2)
	    CHECK (faculty_or_freelancer = 'FA' OR faculty_or_freelancer = 'FR'),
	teaching_or_research varchar(1)
		CHECK (teaching_or_research = 'T' OR teaching_or_research = 'R'),
	research_interests varchar(50)
	    CHECK ((faculty_or_freelancer = 'FA' AND yr_employed IS NOT NULL AND teaching_or_research = 'T' AND research_interests IS NULL) OR 
	    	(faculty_or_freelancer = 'FA' AND year_employed IS NOT NULL AND teaching_or_research = 'R' AND research_interests IS NOT NULL) OR 
	    	(faculty_or_freelancer = 'FR' AND year_employed IS NULL AND teaching_or_research IS NULL AND research_interests IS NULL)),
	PRIMARY KEY(name, age)
);

create table Edition_to_Instructor (
	edition_id int, 
	instructor_name varchar(20), 
	age int,
	FOREIGN KEY(edition_id) REFERENCE Edition(edition_id),
	FOREIGN KEY(instructor_name, age) REFERENCE Instructor (name, age),
	PRIMARY KEY(edition_id, instructor_name, age)
);

create table Experience (
	student_name varchar(20), 
	edition_id int, 
	grade int NOT NULL, 
	satisfaction int CHECK(satisfaction BETWEEN 1 AND 5), , 
	instructor_ranking int CHECK(instructor_ranking BETWEEN 1 AND 5), , 
	skills varchar(20),
	FOREIGN KEY(student_name) REFERENCES Student(username)
	    ON UPDATE CASCADE,
        FOREIGN KEY(edition_id) REFERENCES Edition(edition_id)
        ON UPDATE CASCADE,
	PRIMARY KEY (student_name, edition_id)
);

create table Course_skill (
	skill_name varchar(20), 
	edition_id int, 
	level_before int CHECK(level_before BETWEEN 1 AND 5),
	level_after int CHECK(level_after BETWEEN 1 AND 5), 
    FOREIGN KEY(edition_id) REFERENCES Edition(edition_id)
        ON UPDATE CASCADE,
    PRIMARY KEY(skill_name, edition_id)
);

create table Interest_in_course (
	student_name varchar(20), 
	edition_id int, 
	interest_before int CHECK(interest_before BETWEEN 1 AND 5), 
	interest_after int CHECK(interest_after BETWEEN 1 AND 5), 
	interest_overall int CHECK(interest_overall BETWEEN 1 AND 5), 
	FOREIGN KEY(student_name) REFERENCES Student(username)
	    ON UPDATE CASCADE,
    FOREIGN KEY(edition_id) REFERENCES Edition(edition_id)
        ON UPDATE CASCADE,
    PRIMARY KEY(student_name, edition_id, interest_overall)
);

