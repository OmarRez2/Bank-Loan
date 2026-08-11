SELECT *
FROM   Bank_loan_data;

---- Total Loan Applications 
SELECT count(DISTINCT id) AS Total_Loan_Applications
FROM   Bank_loan_data;

SELECT count(DISTINCT id) AS MTD_Total_Loan_Applications
FROM   Bank_loan_data
WHERE  MONTH(issue_date) = 11
       AND YEAR(issue_date) = 2021;

SELECT count(DISTINCT id) AS MTD_Total_Loan_Applications
FROM   Bank_loan_data
WHERE  MONTH(issue_date) = 12
       AND YEAR(issue_date) = 2021;

--- MTD
SELECT 
    COUNT(DISTINCT id) AS MTD_Total_Loan_Applications
FROM Bank_loan_data
WHERE YEAR(issue_date) = YEAR(
    (SELECT MAX(issue_date) FROM Bank_loan_data)
)
AND MONTH(issue_date) = MONTH(
    (SELECT MAX(issue_date) FROM Bank_loan_data)
);

--- PMTD

SELECT COUNT(DISTINCT id) AS PMTD_Total_Loan_Applications
FROM   Bank_loan_data
WHERE  YEAR(issue_date) = YEAR(DATEADD(month, -1, (SELECT max(issue_date)
                                                   FROM   Bank_loan_data)))
       AND MONTH(issue_date) = MONTH(DATEADD(month, -1, (SELECT max(issue_date)
                                                         FROM   Bank_loan_data)));

--- Total_Funded_Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount
FROM   Bank_loan_data;

--- Total Amount Received
SELECT sum(total_payment) AS Total_Amount_Received
FROM   Bank_loan_data;

--- MTD Total Amount Received
SELECT sum(total_payment) AS Total_Amount_Received
FROM   Bank_loan_data
WHERE  YEAR(issue_date) = YEAR((SELECT MAX(issue_date)
                                FROM   Bank_loan_data))
       AND MONTH(issue_date) = month((SELECT max(issue_date)
                                      FROM   Bank_loan_data));

--- PMTD Total Amount Received
SELECT sum(total_payment) AS Total_Amount_Received
FROM   Bank_loan_data
WHERE  YEAR(issue_date) = YEAR(dateadd(month, -1, (SELECT MAX(issue_date)
                                                   FROM   Bank_loan_data)))
       AND MONTH(issue_date) = month(dateadd(month, -1, (SELECT max(issue_date)
                                                         FROM   Bank_loan_data)));

--- Average Interest Rate 
SELECT cast (avg(int_rate)*100 as decimal (4,2)) AS Average_Interest_Rate
FROM   Bank_loan_data;

--- MTD Average Interest Rate 
SELECT CAST (avg(int_rate) * 100 AS DECIMAL (4, 2)) AS Average_Interest_Rate
FROM   Bank_loan_data
WHERE  YEAR(issue_date) = YEAR((SELECT MAX(issue_date)
                                FROM   Bank_loan_data))
       AND MONTH(issue_date) = MONTH((SELECT max(issue_date)
                                      FROM   Bank_loan_data));

--- PMTD Average Interest Rate 
SELECT CAST (avg(int_rate) * 100 AS DECIMAL (4, 2)) AS Average_Interest_Rate
FROM   Bank_loan_data
WHERE  YEAR(issue_date) = YEAR(dateadd(month, -1, (SELECT MAX(issue_date)
                                                   FROM   Bank_loan_data)))
       AND MONTH(issue_date) = MONTH(dateadd(month, -1, (SELECT max(issue_date)
                                                         FROM   Bank_loan_data)));

--- AVG DTI
SELECT CAST (AVG(dti) * 100 AS DECIMAL (4, 2)) AS Average_DTI
FROM   Bank_loan_data;

--- MTD AVG DTI
SELECT CAST (AVG(dti) * 100 AS DECIMAL (4, 2)) AS Average_DTI
FROM   Bank_loan_data
WHERE  YEAR(issue_date) = YEAR((SELECT max(issue_date)
                                FROM   Bank_loan_data))
       AND MONTH(issue_date) = MONTH((SELECT max(issue_date)
                                      FROM   Bank_loan_data));

--- PMTD AVG DTI
SELECT CAST (AVG(dti) * 100 AS DECIMAL (4, 2)) AS Average_DTI
FROM   Bank_loan_data
WHERE  YEAR(issue_date) = YEAR(dateadd(month, -1, (SELECT max(issue_date)
                                                   FROM   Bank_loan_data)))
       AND MONTH(issue_date) = MONTH(dateadd(month, -1, (SELECT max(issue_date)
                                                         FROM   Bank_loan_data)));