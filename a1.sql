CREATE TYPE time_of_day AS ENUM ('morning', 'day', 'evening');

CREATE DOMAIN ranking AS int
    CONSTRAINT valid_ranking CHECK(
        VALUE BETWEEN 1 AND 5);

CREATE TABLE Student (
	user_name  varchar(20) NOT NULL PRIMARY KEY,
	date_of_birth date NOT NULL
		CHECK (date_of_birth > 19000101 AND date_of_birth < 20160623),
	gender varchar(1) NOT NULL
		CHECK (gender = 'F' OR gender = 'M'),
	country_of_birth varchar(20) NOT NULL,
	date_enrolled date NOT NULL
		CHECK (date_enrolled >19000101 AND date_enrolled<20160623)
);

CREATE TABLE Job (
	student_name varchar(20) NOT NULL,
	title varchar(20) NOT NULL,
	company_name varchar(20) NOT NULL,
	start_date date NOT NULL
		CHECK (start_date > 19000101 AND start_date < 20160623),
	end_date date NOT NULL
		CHECK (end_date > 19000101 AND end_date < 20200101),
	PRIMARY KEY (title, company_name),
	FOREIGN KEY(student_name) REFERENCES Student(user_name)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE company_expertise (
	company_name varchar(20) NOT NULL,
	expertise_name varchar(20) NOT NULL,
	PRIMARY KEY(company_name, expertise_name),
	FOREIGN KEY(company_name) REFERENCES Job(company_name)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE Student_skill (
	title varchar(20),
	student_name varchar(20),
	FOREIGN KEY(student_name) REFERENCES Student(user_name)
	    ON DELETE CASCADE
	    ON UPDATE CASCADE,
	level_of_expertise int
	    CONSTRAINT check_level CHECK(level_of_expertise BETWEEN 2 AND 5),
	PRIMARY KEY(title, student_name)
);

CREATE TABLE Edition (
	edition_id int PRIMARY KEY,
	course_code int
	    CONSTRAINT 3_or_4_digit_course CHECK (course_code BETWEEN 100 AND 9999),
	dept_code varchar(3)
	    CONSTRAINT check_uppercase CHECK(dept_code = UPPER(dept_code)),
	start_date date NOT NULL
		CHECK (start_date > 19000101 AND start_date < 20160623),
	end_date date NULL
		CHECK (end_date > 19000101 AND end_date < 20170701),
	course_time time_of_day NOT NULL,
	number_of_students int NOT NULL
	    CONSTRAINT positive_enrollment CHECK (number_of_students >= 0),
	FOREIGN KEY(course_code, dept_code) REFERENCES Courses(course_code, dept_code)
	    ON UPDATE CASCADE
);

CREATE TABLE Instructor (
	name varchar(30),
	age int
	    CONSTRAINT positive_age CHECK (age > 0),
	gender varchar(1) NOT NULL
	    CONSTRAINT valid_gender CHECK (gender = 'F' OR gender = 'M'),
	areas_of_expertise varchar(30),
	faculty_or_freelancer varchar(2)
		CHECK (faculty_or_freelancer = 'F' OR faculty_or_freelancer = 'FR'),
	yr_employed int
	    CONSTRAINT valid_yr_employed CHECK (yr_employed >= 1900),
	teaching_or_research  varchar(1)
		CHECK (teaching_or_research = 'T' OR teaching_or_research = 'R'),
	research_interests varchar(20),
	CHECK ((faculty_or_freelancer = 'F' AND year_employed IS NOT NULL AND teaching_or_research = 'T' AND research_interests IS NULL) OR (faculty_or_freelancer = 'F' AND year_employed IS NOT NULL AND teaching_or_research = 'R' AND research_interests IS NOT NULL) OR (faculty_or_freelancer = 'FR' AND year_employed IS NULL AND teaching_or_research IS NULL AND research_interests IS NULL)),
	PRIMARY KEY(name, age),
	PRIMARY KEY(name, age)
);

CREATE TABLE Edition_to_Instructor (
	edition_id int,
	instructor_name varchar(20) NOT NULL,
	age int,
	FOREIGN KEY(edition_id) REFERENCE Edition(edition_id),
	FOREIGN KEY(instructor_name, age) REFERENCE Instructor (name, age),
	PRIMARY KEY(edition_id, instructor_name, age)
);

CREATE TABLE Experience (
	student_name varchar(20),
	edition_id int,
	grade int NOT NULL
	    CONSTRAINT positive_grade CHECK (grade > 0),
	satisfaction ranking,
	instructor_ranking ranking,
	skills varchar(20),
	interest_overall ranking,
	FOREIGN KEY(student_name) REFERENCES Student(user_name)
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
	interest_before ranking,
	interest_after ranking
);











