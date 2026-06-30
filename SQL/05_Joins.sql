USE ats_db;

-- ==========================================
-- INNER JOIN - Jobs with Companies
-- ==========================================

SELECT
    Jobs.job_title,
    Companies.company_name
FROM Jobs
INNER JOIN Companies
ON Jobs.company_id = Companies.company_id;

-- ==========================================
-- INNER JOIN - Jobs, Companies and Recruiters
-- ==========================================

SELECT
    Jobs.job_title,
    Companies.company_name,
    Recruiters.full_name AS recruiter
FROM Jobs
INNER JOIN Companies
ON Jobs.company_id = Companies.company_id
INNER JOIN Recruiters
ON Jobs.recruiter_id = Recruiters.recruiter_id;

-- ==========================================
-- Applications with Candidates and Jobs
-- ==========================================

SELECT
    Candidates.full_name,
    Jobs.job_title,
    Applications.status
FROM Applications
INNER JOIN Candidates
ON Applications.candidate_id = Candidates.candidate_id
INNER JOIN Jobs
ON Applications.job_id = Jobs.job_id;

-- ==========================================
-- Applications with Company Details
-- ==========================================

SELECT
    Candidates.full_name,
    Jobs.job_title,
    Companies.company_name,
    Applications.status
FROM Applications
INNER JOIN Candidates
ON Applications.candidate_id = Candidates.candidate_id
INNER JOIN Jobs
ON Applications.job_id = Jobs.job_id
INNER JOIN Companies
ON Jobs.company_id = Companies.company_id;

-- ==========================================
-- Candidate Skills
-- ==========================================

SELECT
    Candidates.full_name,
    Skills.skill_name
FROM CandidateSkills
INNER JOIN Candidates
ON CandidateSkills.candidate_id = Candidates.candidate_id
INNER JOIN Skills
ON CandidateSkills.skill_id = Skills.skill_id;

-- ==========================================
-- Interview Schedule
-- ==========================================

SELECT
    Candidates.full_name,
    Jobs.job_title,
    Interviews.interview_date,
    Interviews.interview_time
FROM Interviews
INNER JOIN Applications
ON Interviews.application_id = Applications.application_id
INNER JOIN Candidates
ON Applications.candidate_id = Candidates.candidate_id
INNER JOIN Jobs
ON Applications.job_id = Jobs.job_id;

-- ==========================================
-- Complete Interview Details
-- ==========================================

SELECT
    Candidates.full_name,
    Companies.company_name,
    Jobs.job_title,
    Interviews.interviewer_name,
    Interviews.interview_date,
    Interviews.interview_time,
    Interviews.interview_type,
    Interviews.interview_status
FROM Interviews
INNER JOIN Applications
ON Interviews.application_id = Applications.application_id
INNER JOIN Candidates
ON Applications.candidate_id = Candidates.candidate_id
INNER JOIN Jobs
ON Applications.job_id = Jobs.job_id
INNER JOIN Companies
ON Jobs.company_id = Companies.company_id;