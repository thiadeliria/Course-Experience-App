INSERT INTO Edition (edition_id, start_date, end_date, course_time, number_of_students, course_code, dept_code) VALUES
  (1, 20160104, 20160414, 'day', 100, 302, 'ECE'),
  (2, 20160104, 20160418, 'day', 80, 361, 'ECE'),
  (3, 20150903, 20151222, 'evening', 120, 410, 'JRE'),
  (4, 20150903, 20151220, 'day', 100, 345, 'ECE'),
  (5, 20150903, 20151218, 'morning', 80, 311, 'ECE')
  
INSERT INTO Instructor (name, gender, age, areas_of_expertise,faculty_or_freelancer, yr_employed, teaching_or_research, research_interests) VALUES
  ('Konstantinos N. Plataniotis', 'M', 45, 'network', 'FA', 2000, 'T', NULL),
  ('Hamid S. Timorabadi', 'M', 40, 'network', 'FR', NULL, NULL, NULL),
  ('Steven Chuang', 'M', 40, 'finacial analysis', 'FA', 2007, 'T', NULL),
  ('Brian Keng', 'M', 28, 'data management', 'FR', NULL, NULL, NULL),
  ('Mireille E. Broucke', 'F', 44, 'computer control design', 'FA',2001, 'R', 'Complex Automated Systems')
  
INSERT INTO Edition_to_Instructor(edition_id, instructor_name, age) VALUES
  (1, 'Konstantinos N. Plataniotis', 45),
  (2, 'Hamid S. Timorabadi', 40),
  (3, 'Steven Chuang', 40),
  (4, 'Brian Keng', 28),
  (5, 'Mireille E. Broucke', 44)
  
INSERT INTO Student(user_name, date_of_birth, gender, country_of_birth, date_enrolled) VALUES
  ('zhangf38', 19950126, 'M', 'CHINA', 20130901)
  
INSERT INTO Job(student_name, title, company_name, start_date, end_date) VALUES
  ('zhangf38', 'Manager Assistant','The Walt Disney Company', 20140528, 20140825)

INSERT INTO Company_expertise(company_name, expertise_name) VALUES
  ('The Walt Disney Company', 'Animation')

INSERT INTO Student_skill(company_name, student_name, skill, level_of_expertise ) VALUES
  ('The Walt Disney Company', 'zhangf38', 'operation skills', 4)

INSERT INTO Experience(student_name, edition_id, grade, satisfaction, instructor_ranking, skills, interest_overall) VALUES
  ('zhangf38', 1, 70, 5,4, 'probability calculation', 5),
  ('zhangf38', 2, 82, 5,5, 'network', 5),
  ('zhangf38', 3, 65, 3,3, 'industrial strategy', 2),
  ('zhangf38', 4, 86, 5,5, 'algorithm', 5),
  ('zhangf38', 5, 85, 4,4, 'digital system', 4)
 
INSERT INTO Course_skill(skill_name, edition_id, level_before, level_after) VALUES
  ('probability calculation',1, 3, 5),
  ('network', 2, 1, 3),
  ('industrial strategy',3, 1, 2),
  ('algorithm', 4, 2, 5),
  ('digital system',5, 2, 4)
  

