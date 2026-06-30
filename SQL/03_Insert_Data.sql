USE ats_db;

-- Companies
INSERT INTO Companies
(company_name, email, phone, website, location)
VALUES
('TCS', 'hr@tcs.com', '9876543210', 'www.tcs.com', 'Mumbai');

-- Recruiters
INSERT INTO Recruiters
(company_id, full_name, email, phone, designation)
VALUES
(1, 'Rahul Sharma', 'rahul@tcs.com', '9999999999', 'HR Manager');

-- Candidates
INSERT INTO Candidates
(full_name, email, phone, city, experience)
VALUES
('Arshad Shaikh', 'arshad@gmail.com', '9876543210', 'Pune', 1),
('Rahul Sharma', 'rahul@gmail.com', '9123456789', 'Mumbai', 3);

-- Jobs
INSERT INTO Jobs
(company_id, recruiter_id, job_title, job_description, location, salary, job_type, posted_date)
VALUES
(
1,
1,
'Java Full Stack Developer',
'Need Java, Spring Boot, SQL and React skills',
'Pune',
750000,
'Full Time',
CURDATE()
);

-- Applications
INSERT INTO Applications
(candidate_id, job_id)
VALUES
(1,1);

-- Skills
INSERT INTO Skills
(skill_name)
VALUES
('Java'),
('SQL'),
('React'),
('Git'),
('Python');

-- Candidate Skills
INSERT INTO CandidateSkills
(candidate_id, skill_id)
VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(2,2),
(2,5);

-- Resumes
INSERT INTO Resumes
(candidate_id, resume_file)
VALUES
(1,'arshad_resume_v2.pdf'),
(2,'rahul_resume.pdf');

-- Interviews
INSERT INTO Interviews
(
application_id,
interview_date,
interview_time,
interview_type,
interviewer_name
)
VALUES
(
1,
'2026-07-02',
'10:30:00',
'Online',
'Anita Sharma'
);

-- Interview Feedback
INSERT INTO InterviewFeedback
(
interview_id,
technical_rating,
communication_rating,
comments,
recommendation
)
VALUES
(
1,
5,
4,
'Excellent Java, SQL and problem-solving skills.',
'Hire'
);

-- Offers
INSERT INTO Offers
(
application_id,
offered_salary,
joining_date,
offer_status
)
VALUES
(
1,
800000,
'2026-08-01',
'Accepted'
);