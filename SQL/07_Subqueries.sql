USE ats_db;

-- ==========================================
-- SUBQUERY 1
-- Candidates with more than 1 year experience
-- ==========================================

SELECT full_name, experience
FROM Candidates
WHERE experience >
(
    SELECT AVG(experience)
    FROM Candidates
);

-- ==========================================
-- SUBQUERY 2
-- Jobs having salary greater than average salary
-- ==========================================

SELECT
    job_title,
    salary
FROM Jobs
WHERE salary >
(
    SELECT AVG(salary)
    FROM Jobs
);

-- ==========================================
-- SUBQUERY 3
-- Candidates who have applied for jobs
-- ==========================================

SELECT full_name
FROM Candidates
WHERE candidate_id IN
(
    SELECT candidate_id
    FROM Applications
);

-- ==========================================
-- SUBQUERY 4
-- Companies having posted jobs
-- ==========================================

SELECT company_name
FROM Companies
WHERE company_id IN
(
    SELECT company_id
    FROM Jobs
);

-- ==========================================
-- SUBQUERY 5
-- Candidates who uploaded resumes
-- ==========================================

SELECT full_name
FROM Candidates
WHERE candidate_id IN
(
    SELECT candidate_id
    FROM Resumes
);