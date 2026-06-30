USE ats_db;

-- ==========================================
-- VIEW 1
-- Candidate Applications
-- ==========================================

CREATE VIEW CandidateApplications AS
SELECT
    Candidates.full_name,
    Jobs.job_title,
    Companies.company_name,
    Applications.status
FROM Applications
JOIN Candidates
ON Applications.candidate_id = Candidates.candidate_id
JOIN Jobs
ON Applications.job_id = Jobs.job_id
JOIN Companies
ON Jobs.company_id = Companies.company_id;

-- Display View
SELECT * FROM CandidateApplications;

-- ==========================================
-- VIEW 2
-- Interview Schedule
-- ==========================================

CREATE VIEW InterviewSchedule AS
SELECT
    Candidates.full_name,
    Companies.company_name,
    Jobs.job_title,
    Interviews.interview_date,
    Interviews.interview_time,
    Interviews.interview_type,
    Interviews.interview_status
FROM Interviews
JOIN Applications
ON Interviews.application_id = Applications.application_id
JOIN Candidates
ON Applications.candidate_id = Candidates.candidate_id
JOIN Jobs
ON Applications.job_id = Jobs.job_id
JOIN Companies
ON Jobs.company_id = Companies.company_id;

-- Display View
SELECT * FROM InterviewSchedule;

-- ==========================================
-- VIEW 3
-- Offer Details
-- ==========================================

CREATE VIEW OfferDetails AS
SELECT
    Candidates.full_name,
    Jobs.job_title,
    Offers.offered_salary,
    Offers.offer_status,
    Offers.joining_date
FROM Offers
JOIN Applications
ON Offers.application_id = Applications.application_id
JOIN Candidates
ON Applications.candidate_id = Candidates.candidate_id
JOIN Jobs
ON Applications.job_id = Jobs.job_id;

-- Display View
SELECT * FROM OfferDetails;