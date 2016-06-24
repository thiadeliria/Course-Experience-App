CREATE DOMAIN ranking AS int
    CONSTRAINT valid_ranking CHECK(
        VALUE BETWEEN 1 AND 5);

    CREATE TABLE Student (
	user_name varchar(20) PRIMARY KEY,
	date_of_birth date,
	gender varchar(1),
	country_of_birth varchar(20),
	year_and_month_in_university date
);

CREATE TABLE Job (
	student_name varchar(20),
	title varchar(20),
	company_name varchar(20),
	start_date date,
	end_date date,
	PRIMARY KEY (title, company_name),
	FOREIGN KEY(student_name) REFERENCES Student(user_name)
);

CREATE TABLE Company_expertise (
	company_name varchar(20),
	expertise_name varchar(20),
	PRIMARY KEY(company_name, expertise_name),
	FOREIGN KEY(company_name) REFERENCES Job(company_name)
);

CREATE TABLE Student_skill (
	title varchar(20),
	student_name varchar(20),
	FOREIGN KEY(student_name) REFERENCES Student(user_name)
	    ON UPDATE CASCADE,
	level_of_expertise int
	    CONSTRAINT check_level CHECK(level_of_expertise BETWEEN 2 AND 5),
	PRIMARY KEY(title, student_name)
);

CREATE TABLE Edition (
	course_code int
	    CONSTRAINT 3_or_4_digit_course CHECK (course_code BETWEEN 100 AND 9999),
	dept_code varchar(3)
	    CONSTRAINT check_uppercase CHECK(dept_code = UPPER(dept_code)),
	instructor_name varchar(20),
	start_date date /*add constraint*/,
	end_date date /*add constraint*/,
	time_of_day varchar(10) NOT NULL /*add constraint*/,
	number_of_students int NOT NULL
	    CONSTRAINT positive_enrollment CHECK (number_of_students >= 0),
	FOREIGN KEY(instructor_name) REFERENCES Instructor(name)
	    ON UPDATE CASCADE,
	FOREIGN KEY(course_code, dept_code) REFERENCES Courses(course_code, dept_code)
	    ON UPDATE CASCADE,
	PRIMARY KEY(course_code, dept_code, instructor_name, start_date, end_date)
);

CREATE TABLE Instructor (
	name varchar(20),
	age int
	    CONSTRAINT positive_age CHECK (age > 0),
	gender varchar(1) NOT NULL
	    CONSTRAINT valid_gender CHECK (gender = 'F' or 'M'),
	areas_of_expertise varchar(30),
	faculty_or_freelancer /*add constraint*/,
	yr_employed int NOT NULL
	    CONSTRAINT valid_yr_employed CHECK (yr_employed >= 1900),
	teaching_or_research  /*add constraint*/,
	research_interests varchar(20) NOT NULL,
	PRIMARY KEY(name, age)
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











