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


/* Create the schema for our tables */
/*
create table Course(course_no int, dept_name varchar, dept_code varchar, general_area varchar);
create table Topic(course_no int, dept_code varchar, title varchar);
create table Skill(course_no int, dept_code varchar, title varchar);
create table Prerequisite(course_no int, dept_code varchar, course_id varchar);
create table Exclusion(course_no int, dept_code varchar, course_id varchar);
create table Student(username varchar, date_of_birth text, gender varchar, country_of_birth varchar, date_enrolled text);
create table Job(student_name varchar, title varchar, company_name varchar, start_date text, end_date text);
create table Company(company_name varchar, expertise_name varchar);
create table Student_skill(company_name varcar, student_name varchar, skill varchar, level_of_expertise int);
create table Edition(edition_id int, course_code int, dept_code varchar, start_date text, end_date text, course_time text, number_of_students int);
create table Instructor(name varchar, age int, gender varchar, areas_of_expertise, faculty_or_freelancer varchar, teaching_or_research varchar, research_interests varchar);
create table Faculty(yr_employed int, teaching_or_research varchar);
create table Research(research_interests varchar);
create table Edition_to_Instructor(edition_id int, instructor_name varchar, age int);
create table Experience(student_name varchar, edition_id int, grade int, satisfaction int, instructor_ranking int, skills varchar);
create table Course_skill(skill_name varchar, edition_id int, level_before int, level_after int);
create table Interest_in_course(student_name varchar, edition_id int, interest_before int, interest_after int, interest_overall int);
*/

create table Course (
	course_no int, 
	dept_name varchar NOT NULL, 
	dept_code varchar, 
	general_area varchar NOT NULL
	);

create table Topic (
	course_no int, 
	dept_code varchar, 
	title varchar NOT NULL
);

create table Skill (
	course_no int, 
	dept_code varchar, 
	title varchar NOT NULL
);

create table Prerequisite (
	course_no int, 
	dept_code varchar, 
	course_id varchar
);

create table Exclusion (
	course_no int, 
	dept_code varchar, 
	course_id varchar
);

create table Student (
	username varchar, 
	date_of_birth text, 
	gender varchar, 
	country_of_birth varchar NOT NULL, 
	date_enrolled text
);

create table Job (
	student_name varchar, 
	title varchar, 
	company_name varchar, 
	start_date text, 
	end_date text
);

create table Company (
	company_name varchar, 
	expertise_name varchar
);

create table Student_skill (
	company_name varchar, 
	student_name varchar, 
	skill varchar NOT NULL, 
	level_of_expertise int
);

create table Edition (
	edition_id int, 
	course_code int, 
	dept_code varchar, 
	start_date text, 
	end_date text, 
	course_time text NOT NULL, 
	number_of_students int
);

create table Instructor (
	name varchar, 
	age int, 
	gender varchar, 
	areas_of_expertise, 
	faculty_or_freelancer varchar, 
	teaching_or_research varchar, 
	research_interests varchar
);

create table Faculty (
	yr_employed int, 
	teaching_or_research varchar
);

create table Research (
	research_interests varchar
);

create table Edition_to_Instructor (
	edition_id int, 
	instructor_name varchar, 
	age int
);

create table Experience (
	student_name varchar, 
	edition_id int, 
	grade int NOT NULL, 
	satisfaction int, 
	instructor_ranking int, 
	skills varchar
);

create table Course_skill (
	skill_name varchar, 
	edition_id int, 
	level_before int, 
	level_after int
);

create table Interest_in_course (
	student_name varchar, 
	edition_id int, 
	interest_before int, 
	interest_after int, 
	interest_overall int
);

