-- Tutorial
-- List the teachers who have NULL for their department.

SELECT name FROM teacher
WHERE dept IS NULL

-- Use a different JOIN so that all teachers are listed.

SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
ON (teacher.dept=dept.id)

-- Use a different JOIN so that all departments are listed.

SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
ON (teacher.dept=dept.id)

-- Show teacher name and mobile number or '07986 444 2266'

SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher

-- Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.

SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept
ON teacher.dept=dept.id

-- Use COUNT to show the number of teachers and the number of mobile phones.

SELECT COUNT(name), COUNT(mobile)
FROM teacher

-- Use COUNT and GROUP BY dept.name to show each department and the number of staff.

SELECT dept.name, COUNT(teacher.name)
FROM teacher RIGHT JOIN dept
ON teacher.dept=dept.id
GROUP BY dept.name

-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.

SELECT name, 
CASE WHEN dept=1 OR dept=2 THEN 'Sci' ELSE 'Art' END
FROM teacher

-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.

SELECT name, 
CASE WHEN dept=1 OR dept=2 THEN 'Sci'
WHEN dept=3 THEN 'Art' ELSE 'None' END
FROM teacher        
        

-- Quiz
-- 1. Select the code which uses an outer join correctly.

SELECT teacher.name, dept.name 
FROM teacher LEFT OUTER JOIN dept 
ON (teacher.dept = dept.id)

-- 2. Select the correct statement that shows the name of department which employs Cutflower -

SELECT dept.name 
FROM teacher JOIN dept 
ON (dept.id = teacher.dept) 
WHERE teacher.name = 'Cutflower'

-- 3. Select out of following the code which uses a JOIN to show a list of all the departments and number of employed teachers

SELECT dept.name, COUNT(teacher.name) 
FROM teacher RIGHT JOIN dept 
ON dept.id = teacher.dept 
GROUP BY dept.name

-- 4. Using SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher on teacher table will:

-- display 0 in result column for all teachers without department

-- 5. Query:

SELECT name,
CASE WHEN phone = 2752 THEN 'two'
WHEN phone = 2753 THEN 'three'
WHEN phone = 2754 THEN 'four'
END AS digit
FROM teacher
-- shows following 'digit':
-- 'four' for Throd

-- 6. Select the result that would be obtained from the following code:

SELECT name, 
CASE WHEN dept IN (1) THEN 'Computing' 
ELSE 'Other' END 
FROM teacher
-- Table-A
