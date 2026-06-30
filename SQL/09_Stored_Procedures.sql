USE ats_db;

-- ==========================================
-- STORED PROCEDURE 1
-- Show All Candidates
-- ==========================================

DELIMITER $$

CREATE PROCEDURE GetAllCandidates()
BEGIN
    SELECT *
    FROM Candidates;
END $$

DELIMITER ;

CALL GetAllCandidates();

-- ==========================================
-- STORED PROCEDURE 2
-- Show Jobs by Company
-- ==========================================

DELIMITER $$

CREATE PROCEDURE GetJobsByCompany(
    IN companyId INT
)
BEGIN
    SELECT
        job_title,
        salary,
        location
    FROM Jobs
    WHERE company_id = companyId;
END $$

DELIMITER ;

CALL GetJobsByCompany(1);

-- ==========================================
-- STORED PROCEDURE 3
-- Show Offers
-- ==========================================

DELIMITER $$

CREATE PROCEDURE GetOffers()
BEGIN
    SELECT
        offered_salary,
        offer_status,
        joining_date
    FROM Offers;
END $$

DELIMITER ;

CALL GetOffers();