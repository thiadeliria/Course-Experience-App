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

/* Populate the tables with our data */
insert into Person values('Amy', 16, 'female');
insert into Person values('Ben', 21, 'male');
insert into Person values('Cal', 33, 'male');
insert into Person values('Dan', 13, 'male');
insert into Person values('Eli', 45, 'male');
insert into Person values('Fay', 21, 'female');
insert into Person values('Gus', 24, 'male');
insert into Person values('Hil', 30, 'female');
insert into Person values('Ian', 18, 'male');

insert into Frequents values('Amy', 'Pizza Hut');
insert into Frequents values('Ben', 'Pizza Hut');
insert into Frequents values('Ben', 'Chicago Pizza');
insert into Frequents values('Cal', 'Straw Hat');
insert into Frequents values('Cal', 'New York Pizza');
insert into Frequents values('Dan', 'Straw Hat');
insert into Frequents values('Dan', 'New York Pizza');
insert into Frequents values('Eli', 'Straw Hat');
insert into Frequents values('Eli', 'Chicago Pizza');
insert into Frequents values('Fay', 'Dominos');
insert into Frequents values('Fay', 'Little Caesars');
insert into Frequents values('Gus', 'Chicago Pizza');
insert into Frequents values('Gus', 'Pizza Hut');
insert into Frequents values('Hil', 'Dominos');
insert into Frequents values('Hil', 'Straw Hat');
insert into Frequents values('Hil', 'Pizza Hut');
insert into Frequents values('Ian', 'New York Pizza');
insert into Frequents values('Ian', 'Straw Hat');
insert into Frequents values('Ian', 'Dominos');

insert into Eats values('Amy', 'pepperoni');
insert into Eats values('Amy', 'mushroom');
insert into Eats values('Ben', 'pepperoni');
insert into Eats values('Ben', 'cheese');
insert into Eats values('Cal', 'supreme');
insert into Eats values('Dan', 'pepperoni');
insert into Eats values('Dan', 'cheese');
insert into Eats values('Dan', 'sausage');
insert into Eats values('Dan', 'supreme');
insert into Eats values('Dan', 'mushroom');
insert into Eats values('Eli', 'supreme');
insert into Eats values('Eli', 'cheese');
insert into Eats values('Fay', 'mushroom');
insert into Eats values('Gus', 'mushroom');
insert into Eats values('Gus', 'supreme');
insert into Eats values('Gus', 'cheese');
insert into Eats values('Hil', 'supreme');
insert into Eats values('Hil', 'cheese');
insert into Eats values('Ian', 'supreme');
insert into Eats values('Ian', 'pepperoni');

insert into Serves values('Pizza Hut', 'pepperoni', 12);
insert into Serves values('Pizza Hut', 'sausage', 12);
insert into Serves values('Pizza Hut', 'cheese', 9);
insert into Serves values('Pizza Hut', 'supreme', 12);
insert into Serves values('Little Caesars', 'pepperoni', 9.75);
insert into Serves values('Little Caesars', 'sausage', 9.5);
insert into Serves values('Little Caesars', 'cheese', 7);
insert into Serves values('Little Caesars', 'mushroom', 9.25);
insert into Serves values('Dominos', 'cheese', 9.75);
insert into Serves values('Dominos', 'mushroom', 11);
insert into Serves values('Straw Hat', 'pepperoni', 8);
insert into Serves values('Straw Hat', 'cheese', 9.25);
insert into Serves values('Straw Hat', 'sausage', 9.75);
insert into Serves values('New York Pizza', 'pepperoni', 8);
insert into Serves values('New York Pizza', 'cheese', 7);
insert into Serves values('New York Pizza', 'supreme', 8.5);
insert into Serves values('Chicago Pizza', 'cheese', 7.75);
insert into Serves values('Chicago Pizza', 'supreme', 8.5);
