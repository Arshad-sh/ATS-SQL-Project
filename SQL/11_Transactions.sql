USE ats_db;

-- ==========================================
-- TRANSACTION 1
-- Update Offer Salary
-- ==========================================

START TRANSACTION;

UPDATE Offers
SET offered_salary = 850000
WHERE offer_id = 1;

COMMIT;

SELECT * FROM Offers;

-- ==========================================
-- TRANSACTION 2
-- Rollback Example
-- ==========================================

START TRANSACTION;

UPDATE Offers
SET offered_salary = 900000
WHERE offer_id = 1;

-- Undo the change
ROLLBACK;

SELECT * FROM Offers;