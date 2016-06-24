

/*PHL210 Margaret Morrison 
PHL232 Imogen Dickie 
PHL275 
PHL237 Vincent Shen 
PHL337 Vincent Shen
PHL245 Alexander Koo
CSC258 Xander Chin
STA247 Luai Al Labadi
*/

INSERT INTO Edition (edition_id, start_date, end_date, course_time, number_of_students, course_code, dept_code) VALUES
  (6, 20150104, 20160414, 'day', 300, 210, 'PHL'),
  (7, 20150104, 20160418, 'day', 140, 232, 'PHL'),
  (8, 20150903, 20151222, 'evening', 70, 237, 'PHL')
  
INSERT INTO Instructor (name, gender, age, areas_of_expertise,faculty_or_freelancer, year_employed, teaching_or_research, research_interests) VALUES
  ('Konstantinos N. Plataniotis', 'M', 45, 'network', 'FA', 2000, 'T', NULL),
  ('Hamid S. Timorabadi', 'M', 40, 'network', 'FR', NULL, NULL, NULL),
  ('')
  
INSERT INTO Edition_to_Instructor(edition_id, instructor_name, age) VALUES
  (6, 'Konstantinos N. Plataniotis', 45),
  (7, 'Hamid S. Timorabadi', 40),