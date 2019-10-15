-- SELECT day, COUNT(*) as total_assignments
-- FROM assignments
-- GROUP BY  day
-- ORDER BY day;

-- SELECT day, COUNT(*) as total_assignments
-- FROM assignments
-- GROUP BY  day
-- HAVING COUNT(*) > 9
-- ORDER BY day;

-- SELECT cohorts.name as cohort_name, COUNT(students.id) as student_count
-- FROM cohorts
-- JOIN students ON cohort_id = cohorts.id
-- GROUP BY cohort_name
-- HAVING COUNT(students.id) > 17
-- ORDER BY student_count;

-- SELECT cohorts.name as cohort_name, COUNT(assignment_submissions.*) as total_submissions
-- FROM cohorts 
-- JOIN students on cohort_id = cohorts.id
-- JOIN assignment_submissions on student_id = students.id
-- GROUP BY cohort_name 
-- ORDER BY total_submissions DESC;

-- ////////////////////////////////////////////SAME////////////////////////////////////////////////////

-- SELECT students.name as student, AVG(assignment_submissions.duration) as total_assignment_duration
-- FROM students
-- JOIN assignment_submissions ON student_id = students.id
-- WHERE students.end_date IS NULL
-- GROUP BY students.id
-- ORDER BY total_assignment_duration DESC;

-- SELECT students.name as student, AVG(assignment_submissions.duration) as total_assignment_duration
-- FROM students
-- JOIN assignment_submissions ON student_id = students.id
-- GROUP BY students.id
-- HAVING students.end_date IS NULL
-- ORDER BY total_assignment_duration DESC;

-- ///////////////////////////////////////////////////////////////////////////////////////////////////

SELECT students.name as student, AVG(assignment_submissions.duration) as "average assignment duration", AVG(assignments.duration) as "average estimated duration"
FROM assignment_submissions
JOIN students ON student_id = students.id
JOIN assignments ON assignment_id = assignments.id
GROUP BY students.id
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
AND students.end_date IS NULL
ORDER BY "average assignment duration";
