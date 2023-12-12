--  Find the set of all courses taught either in Fall 2009 or in Spring 2010, or both.--
SELECT course_id, title
FROM course
WHERE course_id IN (
    SELECT course_id
    FROM section
    WHERE (sem = 1 AND year = 2009) OR (sem = 2 AND year = 2010)
);

--  TYB10 --

--  Find the set of all courses taught in the Fall 2009 as well as in Spring 2010.--
SELECT course_id, title
FROM course
WHERE course_id IN (
    SELECT course_id
    FROM section
    WHERE (sem = 1 AND year = 2009)
) AND course_id IN (
    SELECT course_id
    FROM section
    WHERE (sem = 2 AND year = 2010)
);

-- Find all courses taught in the Fall 2009 semester but not in the Spring 2010 semester.--

SELECT course_id, title
FROM course
WHERE course_id IN (
    SELECT course_id
    FROM section
    WHERE (sem = 1 AND year = 2009)
) AND course_id NOT IN (
    SELECT course_id
    FROM section
    WHERE (sem = 2 AND year = 2010)
);

-- Find all the courses taught in the both the Fall 2009 and Spring 2010 semesters (Use set membership).
SELECT course_id, title
FROM course
WHERE course_id IN (
    SELECT course_id
    FROM section
    WHERE sem = 1 AND year = 2009
)
INTERSECT
SELECT course_id, title
FROM course
WHERE course_id IN (
    SELECT course_id
    FROM section
    WHERE sem = 2 AND year = 2010
);

-- Find all the courses taught in the Fall 2009 semester but not in the Spring 2010 semester (Use set membership).
SELECT course_id, title
FROM course
WHERE course_id IN (
    SELECT course_id
    FROM section
    WHERE sem = 1 AND year = 2009
)
EXCEPT
SELECT course_id, title
FROM course
WHERE course_id IN (
    SELECT course_id
    FROM section
    WHERE sem = 2 AND year = 2010
);
-- Find the names of all instructors whose salary is greater than at least one instructor in the Biology department.
SELECT DISTINCT I1.name
FROM instructor I1
WHERE I1.salary > ANY (
    SELECT I2.salary
    FROM instructor I2
    WHERE I2.department_name = 'Biology'
);
-- Find the names of all instructors that have a salary value greater than that of each instructor in the Biology department.
SELECT DISTINCT I1.name
FROM instructor I1
WHERE I1.salary > ALL (
    SELECT I2.salary
    FROM instructor I2
    WHERE I2.department_name = 'Biology'
);


