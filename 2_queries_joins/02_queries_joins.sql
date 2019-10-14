SELECT students.name AS student_name, cohorts.name AS cohort_name, cohorts.start_date AS cohort_start_date, students.start_date AS student_start_date
FROM students
LEFT JOIN cohorts
ON cohort_id = cohorts.id
WHERE cohorts.start_date != students.start_date
ORDER BY cohort_name;

SELECT SUM(assignment_submissions.duration) AS total_duration
FROM students JOIN assignment_submissions 
ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';

SELECT SUM(assignment_submissions.duration) AS total_duration
FROM students 
JOIN assignment_submissions ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE 'FEB12';
