USE ats_db;
CREATE TABLE Companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    website VARCHAR(100),
    location VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Recruiters (
    recruiter_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    designation VARCHAR(50),

    CONSTRAINT fk_company
        FOREIGN KEY (company_id)
        REFERENCES Companies(company_id)
);
CREATE TABLE Candidates (
    candidate_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    city VARCHAR(100),
    experience INT DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Jobs (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT NOT NULL,
    recruiter_id INT NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    job_description TEXT,
    location VARCHAR(100),
    salary DECIMAL(10,2),
    job_type VARCHAR(50),
    posted_date DATE,

    CONSTRAINT fk_job_company
        FOREIGN KEY (company_id)
        REFERENCES Companies(company_id),

    CONSTRAINT fk_job_recruiter
        FOREIGN KEY (recruiter_id)
        REFERENCES Recruiters(recruiter_id)
);
CREATE TABLE Applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    candidate_id INT NOT NULL,
    job_id INT NOT NULL,
    application_date DATE DEFAULT (CURRENT_DATE),
    status VARCHAR(30) DEFAULT 'Applied',

    CONSTRAINT fk_application_candidate
        FOREIGN KEY (candidate_id)
        REFERENCES Candidates(candidate_id),

    CONSTRAINT fk_application_job
        FOREIGN KEY (job_id)
        REFERENCES Jobs(job_id)
);
CREATE TABLE Skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE CandidateSkills (
    candidate_id INT,
    skill_id INT,

    PRIMARY KEY(candidate_id, skill_id),

    CONSTRAINT fk_candidate
        FOREIGN KEY(candidate_id)
        REFERENCES Candidates(candidate_id),

    CONSTRAINT fk_skill
        FOREIGN KEY(skill_id)
        REFERENCES Skills(skill_id)
);
CREATE TABLE Resumes (
    resume_id INT AUTO_INCREMENT PRIMARY KEY,
    candidate_id INT UNIQUE,
    resume_file VARCHAR(255) NOT NULL,
    upload_date DATE DEFAULT (CURRENT_DATE),

    CONSTRAINT fk_resume_candidate
        FOREIGN KEY(candidate_id)
        REFERENCES Candidates(candidate_id)
);
CREATE TABLE Interviews (
    interview_id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT NOT NULL,
    interview_date DATE NOT NULL,
    interview_time TIME NOT NULL,
    interview_type ENUM('Online','Offline') NOT NULL,
    interviewer_name VARCHAR(100),
    interview_status ENUM('Scheduled','Completed','Cancelled') DEFAULT 'Scheduled',

    CONSTRAINT fk_interview_application
        FOREIGN KEY(application_id)
        REFERENCES Applications(application_id)
);
CREATE TABLE InterviewFeedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    interview_id INT UNIQUE,
    technical_rating INT CHECK (technical_rating BETWEEN 1 AND 5),
    communication_rating INT CHECK (communication_rating BETWEEN 1 AND 5),
    comments TEXT,
    recommendation ENUM('Hire','Reject','Hold') NOT NULL,

    CONSTRAINT fk_feedback_interview
        FOREIGN KEY(interview_id)
        REFERENCES Interviews(interview_id)
);
CREATE TABLE Offers (
    offer_id INT AUTO_INCREMENT PRIMARY KEY,

    application_id INT UNIQUE,

    offered_salary DECIMAL(10,2) NOT NULL,

    joining_date DATE,

    offer_status ENUM('Pending','Accepted','Rejected')
    DEFAULT 'Pending',

    offer_date DATE DEFAULT (CURRENT_DATE),

    CONSTRAINT fk_offer_application
        FOREIGN KEY(application_id)
        REFERENCES Applications(application_id)
);
