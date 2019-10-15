-- SELECT teachers.name as "name", COUNT(assistance_requests) as "total assistances"
-- FROM assistance_requests
-- JOIN teachers ON teacher_id = teachers.id
-- GROUP BY teachers.name
-- HAVING teachers.name = 'Waylon Boehm';

-- SELECT students.name as "name", COUNT(assistance_requests) as "total assistances"
-- FROM assistance_requests
-- JOIN students ON student_id = students.id
-- GROUP BY students.name
-- HAVING students.name = 'Elliot Dickinson';

-- SELECT teachers.name as "teacher", students.name as "student", assignments.name as "assignment", (assistance_requests.completed_at - assistance_requests.started_at) as "duration"
-- FROM assistance_requests
-- JOIN students ON student_id = students.id
-- JOIN teachers ON teacher_id = teachers.id
-- JOIN assignments ON assignment_id = assignments.id
-- ORDER BY "duration";

-- SELECT (avg(completed_at-started_at)) as average_assistance_request_duration
-- FROM assistance_requests;

-- SELECT cohorts.name as "name", (avg(completed_at-started_at)) as average_assistance_time
-- FROM assistance_requests
-- JOIN students ON student_id = students.id
-- JOIN cohorts ON cohort_id = cohorts.id
-- GROUP BY cohorts.name
-- ORDER BY average_assistance_time;

-- ////////////////////////////////////Only gets the max column///////////////////////////////////////////


-- SELECT MAX(average_assistance_time) as average_assistance_time_per_cohort
-- FROM ( 
--   SELECT cohorts.name as cohorts_name, avg(completed_at-started_at) as average_assistance_time
--   FROM assistance_requests
--   JOIN students ON student_id = students.id
--   JOIN cohorts ON cohort_id = cohorts.id
--   GROUP BY cohorts.name
-- ) as new_table

-- ////////////////////////////////////////////////////////////////////////////////////////////////////////

-- SELECT cohorts.name as cohorts_name, avg(completed_at-started_at) as average_assistance_time
--   FROM assistance_requests
--   JOIN students ON student_id = students.id
--   JOIN cohorts ON cohort_id = cohorts.id
--   GROUP BY cohorts.name
--   ORDER by average_assistance_time DESC
--   LIMIT 1;

-- SELECT avg(started_at - created_at) as average_wait_time
-- FROM assistance_requests;

-- SELECT cohorts.name, SUM(completed_at-started_at) as total_duration
-- FROM assistance_requests
-- JOIN students ON student_id = students.id
-- JOIN cohorts ON cohort_id = cohorts.id
-- GROUP BY cohorts.name
-- ORDER by total_duration;

-- SELECT avg(total_duration) as average_total_duration
-- FROM (
--   SELECT sum(completed_at - started_at) as total_duration
--   FROM assistance_requests
--   JOIN students ON student_id = students.id
--   JOIN cohorts ON cohort_id = cohorts.id
--   GROUP BY cohorts.name
-- ) as "cohort average assistance duration"

-- SELECT assignments.id as id, assignments.name as name, assignments.day as day, assignments.chapter as chapter, COUNT(assistance_requests) as "total requests"
-- FROM assistance_requests
-- JOIN assignments ON assignment_id = assignments.id
-- GROUP BY assignments.id
-- ORDER BY "total requests" DESC;

-- SELECT assignments.day as day, COUNT(assignments.id) as "number of assignments", SUM(assignments.duration) as duration
-- FROM assignments
-- GROUP BY day
-- ORDER BY day;

-- SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
-- FROM teachers
-- JOIN assistance_requests ON teacher_id = teachers.id
-- JOIN students ON student_id = students.id
-- JOIN cohorts ON cohort_id = cohorts.id
-- WHERE cohorts.name = 'JUL02'
-- ORDER BY teachers.name;

SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, COUNT(assistance_requests.*)
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
