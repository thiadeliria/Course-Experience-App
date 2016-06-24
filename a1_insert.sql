INSERT INTO Edition (edition_id, start_date, end_date, course_time, number_of_students, course_code, dept_code) VALUES
  (1, 20160104, 20160414, 'day', 100, 302, 'ECE'),
  (2, 20160104, 20160418, 'day', 80, 361, 'ECE'),
  (3, 20150903, 20151222, 'evening', 120, 410, 'JRE')
  
INSERT INTO Instructor (name, gender, age, areas_of_expertise,faculty_or_freelancer, year_employed, teaching_or_research, research_interests) VALUES
  ('Konstantinos N. Plataniotis', 'M', 45, 'network', 'FA', 2000, 'T', NULL),
  ('Hamid S. Timorabadi', 'M', 40, 'network', 'FR', NULL, NULL, NULL),
  ('')
  
INSERT INTO Edition_to_Instructor(edition_id, instructor_name, age) VALUES
  (1, 'Konstantinos N. Plataniotis', 45),
  (2, 'Hamid S. Timorabadi', 40),
