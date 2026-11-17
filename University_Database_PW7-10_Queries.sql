-- PRACTICAL WORK №7–10
-- University Database: sorting, filtering, SQL queries, aggregates and JOINs
-- Run in DB Browser for SQLite or SQLiteStudio.
-- The database uses group_id, grade_value and the table/column names shown below.

-- 1. All students
SELECT * FROM Students;

-- 2. Selected student columns
SELECT student_id, first_name, last_name FROM Students;

-- 3. All groups
SELECT * FROM "Groups";

-- 4. All subject names
SELECT subject_name FROM Subjects;

-- 5. Students in selected group (CS-24 / group_id 101)
SELECT * FROM Students WHERE group_id = 101;

-- 6. Students alphabetically by last name
SELECT * FROM Students ORDER BY last_name ASC;

-- 7. Total number of students
SELECT COUNT(*) AS total_students FROM Students;

-- 8. Number of students in each group
SELECT "Groups".group_name, COUNT(Students.student_id) AS student_count FROM "Groups" LEFT JOIN Students ON Students.group_id = "Groups".group_id GROUP BY "Groups".group_id, "Groups".group_name ORDER BY "Groups".group_name;

-- 9. Maximum grade
SELECT MAX(grade_value) AS maximum_grade FROM Grades;

-- 10. Minimum grade
SELECT MIN(grade_value) AS minimum_grade FROM Grades;

-- 11. Average grade
SELECT ROUND(AVG(grade_value), 2) AS average_grade FROM Grades;

-- 12. Students with their group names (INNER JOIN)
SELECT Students.student_id, Students.first_name, Students.last_name, "Groups".group_name FROM Students INNER JOIN "Groups" ON Students.group_id = "Groups".group_id ORDER BY Students.student_id;

-- 13. Students with grades
SELECT Students.student_id, Students.first_name, Students.last_name, Grades.grade_value, Grades.assessment_type, Grades.assessment_date FROM Students INNER JOIN Grades ON Students.student_id = Grades.student_id ORDER BY Students.student_id;

-- 14. Students, subjects and grades
SELECT Students.first_name, Students.last_name, Subjects.subject_name, Grades.grade_value FROM Students INNER JOIN Grades ON Students.student_id = Grades.student_id INNER JOIN Courses ON Grades.course_id = Courses.course_id INNER JOIN Subjects ON Courses.subject_id = Subjects.subject_id ORDER BY Students.last_name;

-- 15. LEFT JOIN example: all students, including those without grades
SELECT Students.student_id, Students.first_name, Students.last_name, Grades.grade_value FROM Students LEFT JOIN Grades ON Students.student_id = Grades.student_id ORDER BY Students.student_id;

