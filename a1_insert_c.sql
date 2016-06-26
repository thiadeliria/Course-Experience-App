/*constraint: limit end_date > start_date*/
INSERT INTO Edition (edition_id, start_date, end_date, course_time, number_of_students, course_code, dept_code) VALUES
  (6, 20120915, 20130418, 'evening', 850, 100, 'RSM'),
  (7, 20140104, 20140418, 'day', 550, 223, 'MAT'),
  (8, 20150914, 20151222, 'evening', 76, 237, 'PHL'),
  (9, 20160115, 20161227, 'day', 360, 258, 'CSC'),
  (10, 20160114, 20160429, 'evening', 220, 337, 'PHL')
  
/*do i need to repeat*/
INSERT INTO Instructor (name, gender, age, areas_of_expertise, faculty_or_freelancer, year_employed, teaching_or_research, research_interests) VALUES
  ('Michael H. Khan', 'M', 40, 'financial accounting, auditing', 'FA', 2009, 'T', NULL),
  ('Sean Uppal', 'M', 45, 'linear algebra', 'FA', 2003, 'T', NULL),
  ('Vincent Shen', 'M', 61, 'Chinese philosophy', 'FA', 2000, 'T', NULL),
  ('Xander Chin', 'M', 30, 'computer hardware', 'FR', 2012, 'T', NULL),
  ('Vincent Shen', 'M', 61, 'Chinese philosophy', 'FA', 2000, 'T', NULL)
  
INSERT INTO Edition_to_Instructor(edition_id, instructor_name, age) VALUES
  (6, 'Konstantinos N. Plataniotis', 45),
  (7, 'Hamid S. Timorabadi', 40),
