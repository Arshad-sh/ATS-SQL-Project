USE ats_db;

-- ==========================================
-- Create Audit Table
-- ==========================================

CREATE TABLE CandidateAudit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    candidate_name VARCHAR(100),
    action_performed VARCHAR(50),
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ==========================================
-- Trigger
-- Automatically logs new candidates
-- ==========================================

DELIMITER $$

CREATE TRIGGER trg_candidate_insert
AFTER INSERT
ON Candidates
FOR EACH ROW
BEGIN
    INSERT INTO CandidateAudit
    (
        candidate_name,
        action_performed
    )
    VALUES
    (
        NEW.full_name,
        'Candidate Registered'
    );
END $$

DELIMITER ;

-- ==========================================
-- Test Trigger
-- ==========================================

INSERT INTO Candidates
(
    full_name,
    email,
    phone,
    city,
    experience
)
VALUES
(
    'Priya Patil',
    'priya@gmail.com',
    '9876501234',
    'Pune',
    2
);

-- View Audit Log
SELECT * FROM CandidateAudit;