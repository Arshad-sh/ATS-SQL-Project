USE ats_db;

-- View all companies
SELECT * FROM Companies;

-- View all recruiters
SELECT * FROM Recruiters;

-- View all candidates
SELECT * FROM Candidates;

-- View all jobs
SELECT * FROM Jobs;

-- View all applications
SELECT * FROM Applications;

-- View all skills
SELECT * FROM Skills;

-- View all candidate skills
SELECT * FROM CandidateSkills;

-- View all resumes
SELECT * FROM Resumes;

-- View all interviews
SELECT * FROM Interviews;

-- View all interview feedback
SELECT * FROM InterviewFeedback;

-- View all offers
SELECT * FROM Offers;

-- View skills in order
SELECT *
FROM Skills
ORDER BY skill_id;