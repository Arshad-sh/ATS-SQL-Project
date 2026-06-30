USE ats_db;

-- ==========================================
-- COUNT()
-- ==========================================

-- Total Candidates
SELECT COUNT(*) AS Total_Candidates
FROM Candidates;

-- Total Jobs
SELECT COUNT(*) AS Total_Jobs
FROM Jobs;

-- ==========================================
-- MAX()
-- ==========================================

SELECT MAX(offered_salary) AS Highest_Offer
FROM Offers;

-- ==========================================
-- MIN()
-- ==========================================

SELECT MIN(offered_salary) AS Lowest_Offer
FROM Offers;

-- ==========================================
-- AVG()
-- ==========================================

SELECT AVG(offered_salary) AS Average_Offer
FROM Offers;

-- ==========================================
-- SUM()
-- ==========================================

SELECT SUM(offered_salary) AS Total_Offered
FROM Offers;

-- ==========================================
-- GROUP BY
-- ==========================================

SELECT
    Companies.company_name,
    COUNT(Jobs.job_id) AS Total_Jobs
FROM Companies
JOIN Jobs
ON Companies.company_id = Jobs.company_id
GROUP BY Companies.company_name;

-- ==========================================
-- HAVING
-- ==========================================

SELECT
    Companies.company_name,
    COUNT(Jobs.job_id) AS Total_Jobs
FROM Companies
JOIN Jobs
ON Companies.company_id = Jobs.company_id
GROUP BY Companies.company_name
HAVING COUNT(Jobs.job_id) >= 1;