-- TYB10 

-- Find the average salary of instructors in the Computer Science department.--
SELECT AVG(salary) AS average_salary
FROM instructor
WHERE department_name = 'Computer Science';

-- Find the total number of instructors who teach a course in the Spring 2010 semester.
SELECT COUNT(DISTINCT instructor_id) AS total_instructors
FROM teaches
WHERE (sem = 2 AND year = 2010);

--  Find the number of tuples in the course relation.--
SELECT COUNT(*) AS number_of_tuples
FROM course;

--  Find the average salary in each department.--
SELECT department_name, AVG(salary) AS average_salary
FROM instructor
GROUP BY department_name;

-- Find the average salary of those departments where the average salary is more than $42,000.--
SELECT department_name, AVG(salary) AS average_salary
FROM instructor
GROUP BY department_name
HAVING AVG(salary) > 42000;

-- Find total all salary amounts.--
SELECT SUM(salary) AS total_salary
FROM instructor;

-- Find the departments that have the highest average salary--
SELECT department_name, AVG(salary) AS average_salary
FROM instructor
GROUP BY department_name
HAVING AVG(salary) = (
    SELECT MAX(avg_salary)
    FROM (
        SELECT AVG(salary) AS avg_salary
        FROM instructor
        GROUP BY department_name
    ) AS department_salaries
);

-- Create a view that lists all course sections offered by the Physics department in the Fall 2009 semester with the building and room number of each section.
CREATE VIEW physics_course_sections_fall_2009 AS
SELECT C.title AS course_title, S.sec_id, S.sem, S.year, S.building, S.room_no
FROM course C
JOIN section S ON C.course_id = S.course_id
WHERE C.department_name = 'Physics' AND S.sem = 1 AND S.year = 2009;

-- Create an index on instructor with i_id as search key.--
CREATE INDEX instructor_id_index ON instructor (instructor_id);





